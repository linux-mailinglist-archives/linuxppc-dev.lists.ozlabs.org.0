Return-Path: <linuxppc-dev+bounces-290-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6229D95A7EF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 00:53:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wq1pk75Dlz2xtQ;
	Thu, 22 Aug 2024 08:53:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=isd.uni-stuttgart.de
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:7c0:2041:24::a:2"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=uni-stuttgart.de header.i=@isd.uni-stuttgart.de header.a=rsa-sha256 header.s=dkim header.b=xjrjKFy2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=isd.uni-stuttgart.de (client-ip=2001:7c0:2041:24::a:2; helo=mxex2.tik.uni-stuttgart.de; envelope-from=christian.lamparter@isd.uni-stuttgart.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 539 seconds by postgrey-1.37 at boromir; Thu, 22 Aug 2024 08:48:53 AEST
Received: from mxex2.tik.uni-stuttgart.de (mxex2.tik.uni-stuttgart.de [IPv6:2001:7c0:2041:24::a:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wq1j11wm4z2xks
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 08:48:53 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mxex2.tik.uni-stuttgart.de (Postfix) with ESMTP id 0FCB860ABE;
	Thu, 22 Aug 2024 00:39:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=uni-stuttgart.de;
	 h=content-transfer-encoding:content-type:content-type
	:in-reply-to:organization:from:from:content-language:references
	:subject:subject:user-agent:mime-version:date:date:message-id;
	 s=dkim; i=@isd.uni-stuttgart.de; t=1724279967; x=1726018768;
	 bh=xvpm5tK7Hbzpx8Ccqp+FMRyvOeIZxInDJfgeWPRoVvM=; b=xjrjKFy2/B/S
	4Ew9o8lpsFz3m0I2eW2wqdUIK1YMbzCA09hQxJjNRdqUvT3KPWXJg0ZRMz3NtDRf
	/f0HYWjq/vfm/lpH8hvid7XieDxeqaFDOHbzy4cflDdRJnXj0BkR22Jv5V+4t+pU
	AHU/cj9P50egdNf5HdrkY5/1A6fQJa6PT/hw4shqY8UDAkTwyJCSBz6POKuySq1q
	fphhV5UXKav38pE/CjXo70SpYaNxeB5wJIoPb5m/ssjtlIZCTjrL+oPOI0YIc0Mr
	KuLmVHFFxpA+FdvRP30kLEchEMkTxpxU/YoovlAC+XoM+u8ld8MG1tllz6Dqc/pr
	m6qQhCad9g==
X-Virus-Scanned: USTUTT mailrelay AV services at mxex2.tik.uni-stuttgart.de
Received: from mxex2.tik.uni-stuttgart.de ([127.0.0.1])
 by localhost (mxex2.tik.uni-stuttgart.de [127.0.0.1]) (amavis, port 10031)
 with ESMTP id ZbqlQzcPLs53; Thu, 22 Aug 2024 00:39:27 +0200 (CEST)
Received: from authenticated client
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxex2.tik.uni-stuttgart.de (Postfix) with ESMTPSA
Message-ID: <17fa6450-6613-4c34-804b-e47246e7b39c@isd.uni-stuttgart.de>
Date: Thu, 22 Aug 2024 00:39:24 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] powerpc: warn on emulation of dcbz instruction in
 kernel mode
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Stan Johnson <userm57@yahoo.com>, Finn Thain <fthain@linux-m68k.org>
References: <2e3acfe63d289c6fba366e16973c9ab8369e8b75.1631803922.git.christophe.leroy@csgroup.eu>
Content-Language: en-US
From: Christian Lamparter <christian.lamparter@isd.uni-stuttgart.de>
Organization: Universitaet Stuttgart - ISD
In-Reply-To: <2e3acfe63d289c6fba366e16973c9ab8369e8b75.1631803922.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry to write a reply to this old mail. But after years, I finally
decided to tackle an "old" problem that has come up...
And unfortunately it is related to this patch. But let me explain.

On 9/16/21 4:52 PM, Christophe Leroy wrote:
> dcbz instruction shouldn't be used on non-cached memory. Using
> it on non-cached memory can result in alignment exception and
> implies a heavy handling.
>
> Instead of silentely emulating the instruction and resulting in high
> performance degradation, warn whenever an alignment exception is
> taken in kernel mode due to dcbz, so that the user is made aware that
> dcbz instruction has been used unexpectedly by the kernel.



The devices that are affected are APM821xx: MyBook Live, Meraki MX60, Netgear WNDR4700, ...
All these have this "splat" during boot:

|[ 8.777686] PPC 4xx OCP EMAC driver, version 3.54 [ 8.782961] ------------[ cut here ]------------ [ 8.787565] WARNING: CPU: 0 PID: 1 at fix_alignment+0x144/0x16c [ 8.793474] Modules linked in: [ 8.796527] CPU: 0 PID: 1 Comm: swapper Not tainted 6.6.47 #0 [ 8.802253] Hardware name: Meraki MX60/MX60W Security Appliance APM821XX 0x12c41c83 PowerPC 44x Platform [ 8.811688] NIP: c0003158 LR: c0003070 CTR: c001471c [ 8.816725] REGS: c10319d0 TRAP: 0700 Not tainted (6.6.47) [ 8.822453] MSR: 00029000 <CE,EE,ME> CR: 24000442 XER: 20000000 [ 8.828630] [ 8.828630] GPR00: c000855c c1031ac0 c1051c00 00000000 3e039bf6 00000018 01f01cdf 00000004 [ 8.828630] GPR08: 0000000f 00000000 00000510 c1031b30 c0013a94 00000000 c0002518 00000000 [ 8.828630] GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 [ 8.828630] GPR24: 00000000 dfb953ac c00790c8 c104e120 c10f5610 00001000 
c0d30000 c1031b40 [ 8.863432] NIP [c0003158] fix_alignment+0x144/0x16c [ 8.868384] LR [c0003070] fix_alignment+0x5c/0x16c [ 8.873162] Call Trace: [ 8.875598] [c1031ac0] [c0186efc] get_page_from_freelist+0x208/0xdac (unreliable) [ 8.883063] [c1031b10] [c000855c] alignment_exception+0xf0/0x164 [ 8.889058] [c1031b30] [c0000a30] Alignment+0x130/0x180 [ 8.894269] --- interrupt: 600 at memset+0x60/0xc0 [ 8.899063] NIP: c0013a94 LR: c007a1ac CTR: 0000007f [ 8.904092] REGS: c1031b40 TRAP: 0600 Not tainted (6.6.47) [ 8.909812] MSR: 00029000 <CE,EE,ME> CR: 44000442 XER: 20000000 [ 8.915989] DEAR: e1168020 ESR: 00000000 [ 8.915989] GPR00: 00000007 c1031c30 c1051c00 e1168000 00000000 00001000 e116801c 00000004 [ 8.915989] GPR08: 00001000 0000007f 00000a3a 00000000 24000848 00000000 c0002518 00000000 [ 8.915989] GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 [ 
8.915989] GPR24: 00000000 dfb953ac c00790c8 c104e120 c10f5610 00001000 c0d30000 e1168000 [ 8.953306] NIP [c0013a94] memset+0x60/0xc0 [ 8.957478] LR [c007a1ac] dma_direct_alloc+0x1e4/0x290 [ 8.962620] --- interrupt: 600 [ 8.965661] [c1031c30] [c007a130] dma_direct_alloc+0x168/0x290 (unreliable) [ 8.972608] [c1031c70] [c00790c8] dma_alloc_attrs+0xa8/0xf8 [ 8.978163] [c1031cb0] [c04d419c] mal_probe+0x26c/0x664 [ 8.983390] [c1031ce0] [c04326d8] platform_probe+0x60/0xb0 [ 8.988867] [c1031d00] [c042f6f0] really_probe+0xd8/0x3b4 [ 8.994251] [c1031d30] [c042fbdc] driver_probe_device+0x48/0x104 [ 9.000238] [c1031d60] [c042fe7c] __driver_attach+0xb4/0x1a4 [ 9.005880] [c1031d80] [c042cdc8] bus_for_each_dev+0x7c/0xc8 [ 9.011548] [c1031db0] [c042e708] bus_add_driver+0x170/0x25c [ 9.017199] [c1031de0] [c0430cec] driver_register+0x8c/0x164 [ 9.022840] [c1031e00] [c0902de0] emac_init+0x17c/0x1ec [ 
9.028067] [c1031e40] [c0002680] do_one_initcall+0x50/0x2ac [ 9.033709] [c1031eb0] [c08e60f8] kernel_init_freeable+0x1b0/0x230 [ 9.039870] [c1031ee0] [c0002538] kernel_init+0x20/0x118 [ 9.045166] [c1031f00] [c000d1f8] ret_from_kernel_user_thread+0x10/0x18 [ 9.051758] --- interrupt: 0 at 0x0 [ 9.055241] Code: 39400000 7d500ba6 4c00012c 2c090000 41a2fefc 83e1004c 3860fff2 38210050 4e800020 38a00000 3920fff2 4bffffd4 <0fe00000> 4bffff8c 80010054 7c0803a6 [ 9.069929] ---[ end trace 0000000000000000 ]---|

what happens is that the EMAC (ethernet driver) uses a dma_alloc_coherent here:
<https://elixir.bootlin.com/linux/v6.6.47/source/drivers/net/ethernet/ibm/emac/mal.c#L636>

| bd_size <https://elixir.bootlin.com/linux/v6.6.47/C/ident/bd_size>=sizeof(structmal_descriptor <https://elixir.bootlin.com/linux/v6.6.47/C/ident/mal_descriptor>)*
| (NUM_TX_BUFF <https://elixir.bootlin.com/linux/v6.6.47/C/ident/NUM_TX_BUFF>*mal <https://elixir.bootlin.com/linux/v6.6.47/C/ident/mal>->num_tx_chans <https://elixir.bootlin.com/linux/v6.6.47/C/ident/num_tx_chans>+
| NUM_RX_BUFF <https://elixir.bootlin.com/linux/v6.6.47/C/ident/NUM_RX_BUFF>*mal <https://elixir.bootlin.com/linux/v6.6.47/C/ident/mal>->num_rx_chans <https://elixir.bootlin.com/linux/v6.6.47/C/ident/num_rx_chans>);
| mal <https://elixir.bootlin.com/linux/v6.6.47/C/ident/mal>->bd_virt <https://elixir.bootlin.com/linux/v6.6.47/C/ident/bd_virt>=dma_alloc_coherent <https://elixir.bootlin.com/linux/v6.6.47/C/ident/dma_alloc_coherent>(&ofdev <https://elixir.bootlin.com/linux/v6.6.47/C/ident/ofdev>->dev,bd_size <https://elixir.bootlin.com/linux/v6.6.47/C/ident/bd_size>,&mal <https://elixir.bootlin.com/linux/v6.6.47/C/ident/mal>->bd_dma <https://elixir.bootlin.com/linux/v6.6.47/C/ident/bd_dma>,
| GFP_KERNEL <https://elixir.bootlin.com/linux/v6.6.47/C/ident/GFP_KERNEL>);
|

(bd_size is 2x1024 = 2048)
and this results in a call to dma_direct_allocation(), which has one
innocent looking memset():
<https://elixir.bootlin.com/linux/v6.6.47/source/kernel/dma/direct.c#L301>
which zeros out the area before returning it back...

And of course, this triggers the WARNING above. As for why memset uses
that dcbz... this is explained in:
<https://elixir.bootlin.com/linux/v6.6.47/source/arch/powerpc/lib/copy_32.S#L86>

| * Use dcbz on the complete cache lines in the destination
| * to set them to zero. This requires that the destination
| * area is cacheable. -- paulus
| *
| * During early init, cache might not be active yet, so dcbz cannot be used.
| * We therefore skip the optimised bloc that uses dcbz. This jump is
| * replaced by a nop once cache is active. This is done in machine_init()

could this WARN_ON_ONCE maybe be downgraded to a single pr_info_once?
I don't see how to tackle this "neatly" in a better way.

BugLink: <https://github.com/openwrt/openwrt/pull/14037#issuecomment-2302485414>

Best Regards,
Christian

>
> Reported-by: Stan Johnson <userm57@yahoo.com>
> Cc: Finn Thain <fthain@linux-m68k.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: Warn only when emulating kernel mode
> ---
>   arch/powerpc/kernel/align.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
> index bbb4181621dd..bf96b954a4eb 100644
> --- a/arch/powerpc/kernel/align.c
> +++ b/arch/powerpc/kernel/align.c
> @@ -349,6 +349,7 @@ int fix_alignment(struct pt_regs *regs)
>   		if (op.type != CACHEOP + DCBZ)
>   			return -EINVAL;
>   		PPC_WARN_ALIGNMENT(dcbz, regs);
> +		WARN_ON_ONCE(!user_mode(regs));
>   		r = emulate_dcbz(op.ea, regs);
>   	} else {
>   		if (type == LARX || type == STCX)


