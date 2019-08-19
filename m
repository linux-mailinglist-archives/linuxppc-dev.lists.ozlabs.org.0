Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 060FE92401
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 14:58:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Bv9m1XT0zDqWN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 22:58:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Bv710hZQzDqBL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 22:55:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46Bv6z758nz9s3Z;
 Mon, 19 Aug 2019 22:55:55 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, npiggin@gmail.com
Subject: Re: [PATCH v1 07/10] powerpc/mm: move iounmap() into ioremap.c and
 drop __iounmap()
In-Reply-To: <005a2b9321c10e23ca399e6ff4b19960009561f5.1565726867.git.christophe.leroy@c-s.fr>
References: <6bc35eca507359075528bc0e55938bc1ce8ee485.1565726867.git.christophe.leroy@c-s.fr>
 <005a2b9321c10e23ca399e6ff4b19960009561f5.1565726867.git.christophe.leroy@c-s.fr>
Date: Mon, 19 Aug 2019 22:55:51 +1000
Message-ID: <87wof95n6w.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> diff --git a/arch/powerpc/mm/ioremap.c b/arch/powerpc/mm/ioremap.c
> index 0c23660522ca..57d742509cec 100644
> --- a/arch/powerpc/mm/ioremap.c
> +++ b/arch/powerpc/mm/ioremap.c
> @@ -72,3 +75,31 @@ void __iomem *ioremap_prot(phys_addr_t addr, unsigned long size, unsigned long f
>  	return __ioremap_caller(addr, size, pte_pgprot(pte), caller);
>  }
>  EXPORT_SYMBOL(ioremap_prot);
> +
> +/*
> + * Unmap an IO region and remove it from vmalloc'd list.
> + * Access to IO memory should be serialized by driver.
> + */
> +void iounmap(volatile void __iomem *token)
> +{
> +	void *addr;
> +
> +	/*
> +	 * If mapped by BATs then there is nothing to do.
> +	 */
> +	if (v_block_mapped((unsigned long)token))
> +		return;
> +
> +	if (!slab_is_available())
> +		return;
> +
> +	addr = (void *)((unsigned long __force)PCI_FIX_ADDR(token) & PAGE_MASK);
> +	if (WARN_ON((unsigned long)addr < IOREMAP_BASE))
> +		return;

This pops a bunch, as we seem to have various places that want to call
iounmap(NULL) in error paths, much like kfree().

One example:

[   85.062269] WARNING: CPU: 6 PID: 3643 at arch/powerpc/mm/ioremap.c:97 .iounmap+0x58/0xb0
[   85.062276] Modules linked in: snd_powermac(+) snd_pcm snd_timer snd soundcore
[   85.062314] CPU: 6 PID: 3643 Comm: modprobe Tainted: G        W         5.3.0-rc2-gcc-8.2.0-00051-ga8e8d67f314c #655
[   85.062325] NIP:  c000000000078e08 LR: c000000000078dd0 CTR: c000000000078db0
[   85.062335] REGS: c0000000f44f6e40 TRAP: 0700   Tainted: G        W          (5.3.0-rc2-gcc-8.2.0-00051-ga8e8d67f314c)
[   85.062342] MSR:  8000000002029032 <SF,VEC,EE,ME,IR,DR,RI>  CR: 24228884  XER: 00000000
[   85.062377] CFAR: c000000000339650 IRQMASK: 0 
               GPR00: c000000000078dd0 c0000000f44f70d0 c000000001a2ff00 0000000000000000 
               GPR04: c008000000336518 0000000000000000 c000000001a66b80 0000000000000001 
               GPR08: c0000000013296c8 c00a000080000000 0000000000000001 c00800000032ba08 
               GPR12: c000000000078db0 c00000003fff8e80 0000000000000004 c008000000350000 
               GPR16: c000000002637730 c000000000d69868 0000000000000000 c000000002637740 
               GPR20: c00000000197ad08 0000000000000000 0000000000000100 0000000000000028 
               GPR24: c0000000f736eac0 c0000000f44f7370 c0000000f5065000 c008000000336510 
               GPR28: c0000000026aafc8 ffffffffffffffed 0000000000000000 0000000000000000 
[   85.062554] NIP [c000000000078e08] .iounmap+0x58/0xb0
[   85.062564] LR [c000000000078dd0] .iounmap+0x20/0xb0
[   85.062572] Call Trace:
[   85.062591] [c0000000f44f70d0] [c000000000078dd0] .iounmap+0x20/0xb0 (unreliable)
[   85.062623] [c0000000f44f7150] [c008000000321e24] .snd_pmac_free+0x164/0x270 [snd_powermac]
[   85.062709] [c0000000f44f71e0] [c008000000322fa4] .snd_pmac_new+0x884/0xf30 [snd_powermac]
[   85.062798] [c0000000f44f72f0] [c00800000032015c] .snd_pmac_probe+0x7c/0x450 [snd_powermac]
[   85.062849] [c0000000f44f73a0] [c0000000007b0628] .platform_drv_probe+0x68/0x100
[   85.062863] [c0000000f44f7430] [c0000000007aca94] .really_probe+0x144/0x3c0
[   85.062880] [c0000000f44f74d0] [c0000000007acfe0] .driver_probe_device+0x80/0x170
[   85.062899] [c0000000f44f7560] [c0000000007a9be4] .bus_for_each_drv+0xb4/0x130
[   85.062922] [c0000000f44f7610] [c0000000007ac89c] .__device_attach+0x11c/0x1a0
[   85.062941] [c0000000f44f76c0] [c0000000007ab3d8] .bus_probe_device+0xe8/0x100
[   85.062961] [c0000000f44f7750] [c0000000007a6164] .device_add+0x504/0x7d0
[   85.062978] [c0000000f44f7820] [c0000000007b02fc] .platform_device_add+0x14c/0x310
[   85.062994] [c0000000f44f78c0] [c0000000007b14c0] .platform_device_register_full+0x130/0x210
[   85.063084] [c0000000f44f7940] [c00800000032b850] .alsa_card_pmac_init+0x80/0xc4 [snd_powermac]
[   85.063106] [c0000000f44f7a10] [c000000000010e58] .do_one_initcall+0x88/0x448
[   85.063158] [c0000000f44f7b00] [c0000000002416e4] .do_init_module+0x74/0x2e0
[   85.063203] [c0000000f44f7ba0] [c000000000243bd4] .load_module+0x20b4/0x26d0
[   85.063219] [c0000000f44f7cf0] [c000000000244470] .__se_sys_finit_module+0xe0/0x140
[   85.063237] [c0000000f44f7e20] [c00000000000c46c] system_call+0x5c/0x70



I think we can just do:

void iounmap(volatile void __iomem *token)
{
	void *addr;

	if (!addr)
        	return;

	...

??

cheers
