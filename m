Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E4D267A2D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 13:55:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BpWKb3c0qzDqpy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 21:55:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BpWHp6FZlzDqpg
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 21:54:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=FgojugT0; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BpWHp1jZ7z9sVB;
 Sat, 12 Sep 2020 21:54:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1599911654;
 bh=SGbyzCw5ELXKQ6H/EdQctfekNaZMoZPQmum7OOPggWI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=FgojugT0ajFszqYNLxHFLA1Pc5yeL84DvCxGmDssLbM+bXigNCPZjUQHyCy3spGZ+
 yJ8r+H2N+IIYTN4ISVXYIh2dZfV7UwKY3+419EogAkb3bawnSmfQmzDKqwTOKbPK0q
 fvaJ3mx9QYJldZWum37v8gnoCDhkEJdcznLRGmDwqJ9/4IP/M9sVZgnMzcEkgFjPWA
 ohy9A7PXoCnnU2r22FUdxoCw+4IWP0pCNgYio6+QtGoghwLoeCiXqyJv8pgejDF328
 d6y7urKKIFmog7XTj8XKNf8v0vTupKHfv5mL7w9SK1d93wOgkcD1WgdQof/gSt56IY
 B9rFzVncDdu7w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 20/23] powerpc/book3s64/hash/kuap: Enable kuap on hash
In-Reply-To: <20200827040931.297759-21-aneesh.kumar@linux.ibm.com>
References: <20200827040931.297759-1-aneesh.kumar@linux.ibm.com>
 <20200827040931.297759-21-aneesh.kumar@linux.ibm.com>
Date: Sat, 12 Sep 2020 21:54:10 +1000
Message-ID: <87lfhfqkgt.fsf@mpe.ellerman.id.au>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/mm/book3s64/pkeys.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
> index 391230f93da2..16ea0b2f0ea5 100644
> --- a/arch/powerpc/mm/book3s64/pkeys.c
> +++ b/arch/powerpc/mm/book3s64/pkeys.c
> @@ -257,7 +257,12 @@ void __init setup_kuep(bool disabled)
>  #ifdef CONFIG_PPC_KUAP
>  void __init setup_kuap(bool disabled)
>  {
> -	if (disabled || !early_radix_enabled())
> +	if (disabled)
> +		return;
> +	/*
> +	 * On hash if PKEY feature is not enabled, disable KUAP too.
> +	 */
> +	if (!early_radix_enabled() && !early_mmu_has_feature(MMU_FTR_PKEY))
>  		return;
>  
>  	if (smp_processor_id() == boot_cpuid) {

I'm seeing userspace crashes, bisect points at this commit. But
obviously this is just the commit that enables the code.

It seems to be TM related, a lot of the TM selftests are failing with
seemingly random segfaults.

eg:

  ./tm-tmspr
  test: tm_tmspr
  tags: git_version:v5.9-rc2-146-g928c664a7f4e
  !! child died by signal 11
  failure: tm_tmspr

And this warning fires:

  [  308.825455] ------------[ cut here ]------------
  [  308.825485] WARNING: CPU: 5 PID: 105478 at arch/powerpc/include/asm/book3s/64/kup.h:287 syscall_exit_prepare+0x350/0x390
  [  308.825495] Modules linked in: iptable_mangle xt_MASQUERADE iptable_nat nf_nat xt_conntrack nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ipt_REJECT nf_reject_ipv4 xt_tcpudp tun bridge stp llc ip6table_filter ip6_tables iptable_filter fuse kvm_hv kvm binfmt_misc squashfs mlx4_ib ib_uverbs dm_multipath scsi_dh_rdac scsi_dh_alua ib_core mlx4_en bnx2x lpfc mlx4_core crc_t10dif sr_mod crct10dif_generic cdrom vmx_crypto scsi_transport_fc sg mdio gf128mul crct10dif_vpmsum crct10dif_common powernv_rng crc32c_vpmsum rng_core leds_powernv powernv_op_panel led_class sunrpc ip_tables x_tables autofs4
  [  308.825596] CPU: 5 PID: 105478 Comm: tm-tmspr Tainted: P                  5.9.0-rc2-00146-g928c664a7f4e #1
  [  308.825607] NIP:  c000000000038640 LR: c00000000000ddcc CTR: c0000000003c32d0
  [  308.825616] REGS: c000001e41877b00 TRAP: 0700   Tainted: P                   (5.9.0-rc2-00146-g928c664a7f4e)
  [  308.825625] MSR:  900000010282b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE,TM[E]>  CR: 44004484  XER: 20000000
  [  308.825649] CFAR: c000000000038358 IRQMASK: 0 
                 GPR00: c00000000000ddcc c000001e41877da0 c00000000143f000 0000000000000000 
                 GPR04: c000001e41877e80 0000000000000000 00007ffec6ed0000 0000000000000008 
                 GPR08: 0000000000000002 3cffffffffffffff fcffffffffffffff 00000000f5638000 
                 GPR12: 0000000000004400 c0000007ffffa680 0000000000000000 00007ffff7ff0000 
                 GPR16: 00007ffff7f54410 00007ffff7f50320 00007ffec6eff240 00007ffff7f54420 
                 GPR20: 00000000000004ba 00000001000016c0 0000000100034840 0000000000000000 
                 GPR24: 0000000000000000 00007ffec6eff8f0 0000000000000000 00007ffec6efea80 
                 GPR28: 00007ffffffff38f c000001e2e05d600 00007ffec6eff180 c000001e41877e80 
  [  308.825724] NIP [c000000000038640] syscall_exit_prepare+0x350/0x390
  [  308.825734] LR [c00000000000ddcc] system_call_common+0xfc/0x27c
  [  308.825741] Call Trace:
  [  308.825751] [c000001e41877da0] [c000001e41877e10] 0xc000001e41877e10 (unreliable)
  [  308.825763] [c000001e41877e10] [c00000000000ddcc] system_call_common+0xfc/0x27c
  [  308.825771] Instruction dump:
  [  308.825778] 713c0800 4082004c f87f0018 395d0080 39001800 7ce050a8 7ce74078 7ce051ad 
  [  308.825794] 40c2fff4 4bfffd54 60000000 60000000 <0fe00000> 4bfffd18 60000000 60000000 
  [  308.825811] ---[ end trace 57dae589ab37c54c ]---


That's on power8, both bare metal and LPAR.

cheers
