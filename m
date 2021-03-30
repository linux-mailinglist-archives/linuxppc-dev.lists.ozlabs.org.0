Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4205134E59F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 12:43:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8mHt26hzz30RR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 21:43:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8mHX3ZCzz2y8D
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 21:42:46 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F8mHQ4sDrz9txRf;
 Tue, 30 Mar 2021 12:42:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id b-uAmvjibwrf; Tue, 30 Mar 2021 12:42:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F8mHQ42nZz9txRd;
 Tue, 30 Mar 2021 12:42:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D55D08B7EE;
 Tue, 30 Mar 2021 12:42:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vOwDcHaPbuqD; Tue, 30 Mar 2021 12:42:42 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3D7E78B75B;
 Tue, 30 Mar 2021 12:42:42 +0200 (CEST)
Subject: Re: WARNING: CPU: 0 PID: 1 at arch/powerpc/lib/feature-fixups.c:109
 do_feature_fixups+0xb0/0xf0
To: Paul Menzel <pmenzel@molgen.mpg.de>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <bc1d3a33-2499-994e-860a-b50cf72b9619@molgen.mpg.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <adf166ba-d8d9-7585-f6df-38d233698ca3@csgroup.eu>
Date: Tue, 30 Mar 2021 12:42:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <bc1d3a33-2499-994e-860a-b50cf72b9619@molgen.mpg.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/03/2021 à 12:37, Paul Menzel a écrit :
> Dear Linux folks,
> 
> 
> On the POWER8 system IBM S822LC, Linux 5.12-rc5+ logs the warning below.
> 
> ```
> [    0.723485] ------------[ cut here ]------------
> [    0.723491] WARNING: CPU: 0 PID: 1 at arch/powerpc/lib/feature-fixups.c:109 
> do_feature_fixups+0xb0/0xf0
> [    0.723512] Modules linked in:
> [    0.723524] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.12.0-rc5+ #3
> [    0.723537] NIP:  c0000000000bbc70 LR: c0000000000bbc3c CTR: 0000000000000000
> [    0.723547] REGS: c00000800d48b800 TRAP: 0700   Not tainted (5.12.0-rc5+)
> [    0.723556] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 42008244  XER: 20000000
> [    0.723613] CFAR: c0000000000bbc40 IRQMASK: 0
>                 GPR00: c000000001707610 c00000800d48baa0 c0000000021bb200 0000000000000001
>                 GPR04: c0000000021d0d88 aaaaaaaaaaaaaaab 00000000ffffffc0 c0000000021c0034
>                 GPR08: 0000000c000003a0 0000000000000000 0000000000000000 0000000080000000
>                 GPR12: c000000001211458 c0000000028e0000 c0000000000129f8 0000000000000000
>                 GPR16: 0000000000000000 0000000000000000 0000000000000000 c000000001f003f0
>                 GPR20: c000000001f003d0 c000000001f003b0 c000000001f00390 c000000001703520
>                 GPR24: 0000000000000004 c0000000016ddfe0 c000000001791048 c000000001791088
>                 GPR28: c0000000014fd870 000000fb8f5db187 c0000000021d0d88 0000000000000001
> [    0.723822] NIP [c0000000000bbc70] do_feature_fixups+0xb0/0xf0
> [    0.723835] LR [c0000000000bbc3c] do_feature_fixups+0x7c/0xf0
> [    0.723848] Call Trace:
> [    0.723854] [c00000800d48baa0] [c0000000001b4f4c] parse_one+0x11c/0x3c0 (unreliable)
> [    0.723875] [c00000800d48bb20] [c000000001707610] vdso_fixup_features+0xbc/0x11c
> [    0.723896] [c00000800d48bb60] [c0000000017078bc] vdso_init+0x154/0x1b0
> [    0.723914] [c00000800d48bb90] [c0000000000123c0] do_one_initcall+0x60/0x2c0
> [    0.723933] [c00000800d48bc60] [c000000001704944] do_initcalls+0x1e0/0x248
> [    0.723951] [c00000800d48bd40] [c000000001704c38] kernel_init_freeable+0x1f0/0x25c
> [    0.723969] [c00000800d48bda0] [c000000000012a14] kernel_init+0x24/0x170
> [    0.723987] [c00000800d48be10] [c00000000000d6ec] ret_from_kernel_thread+0x5c/0x70
> [    0.724005] Instruction dump:
> [    0.724014] 40820030 37ffffff 3bde0030 4082ffe4 38210080 e8010010 eb81ffe0 eba1ffe8
> [    0.724057] ebc1fff0 ebe1fff8 7c0803a6 4e800020 <0fe00000> e8fe0028 e8de0020 e8be0018
> [    0.724102] ---[ end trace 9bbb55f5cd8ca2ba ]---
> [    0.724118] Unable to patch feature section at (____ptrval____) - (____ptrval____) with 
> (____ptrval____) - (____ptrval____)
> [    0.724185] pstore: Registered nvram as persistent store backend
> ```
> 
> Please find the output of `dmesg` attached.

I saw something similar yesterday. Never seen that before.

[    0.379079] ------------[ cut here ]------------
[    0.383423] WARNING: CPU: 0 PID: 1 at arch/powerpc/lib/feature-fixups.c:109 
do_feature_fixups+0x140/0x228
[    0.392889] Modules linked in:
[    0.395903] CPU: 0 PID: 1 Comm: swapper Not tainted 5.12.0-rc4-s3k-dev-01552-g479934522d20 #4818
[    0.404593] NIP:  c0016754 LR: c0896b88 CTR: 00000000
[    0.409582] REGS: c9023d60 TRAP: 0700   Not tainted  (5.12.0-rc4-s3k-dev-01552-g479934522d20)
[    0.418016] MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 44000244  XER: 00000000
[    0.424730]
[    0.424730] GPR00: c0896b88 c9023e20 c20f8000 00000100 c0b18b48 c0b18b60 cfffff60 c07141d0
[    0.424730] GPR08: c0048f24 fee4fd4d fffff860 00000069 00000002 00000000 c0003eb4 00000000
[    0.424730] GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 c07efff4 00000100
[    0.424730] GPR24: c0b18b60 60000000 c0b18bd0 c0b18b58 c0b183b8 c0b18b48 c1cc8e83 c0b18000
[    0.460703] NIP [c0016754] do_feature_fixups+0x140/0x228
[    0.465954] LR [c0896b88] vdso_init+0x90/0x170
[    0.470345] Call Trace:
[    0.472752] [c9023e20] [c08c7014] 0xc08c7014 (unreliable)
[    0.478089] [c9023e70] [c0896b88] vdso_init+0x90/0x170
[    0.483166] [c9023e90] [c0003a40] do_one_initcall+0x38/0x214
[    0.488760] [c9023ef0] [c0894db0] kernel_init_freeable+0x164/0x208
[    0.494870] [c9023f20] [c0003ec8] kernel_init+0x14/0x10c
[    0.500120] [c9023f30] [c0011158] ret_from_kernel_thread+0x14/0x1c
[    0.506233] Instruction dump:
[    0.509159] 40bcff98 4bfffe0d 2c030000 4182ff8c 839d0014 837d0010 835d000c 83dd0008
[    0.516990] 7f9de214 7f7dda14 7f5dd214 7fddf214 <0fe00000> 7f87e378 7f66db78 7f45d378
[    0.525015] ---[ end trace f393ae62677e62a5 ]---
[    0.529659] Unable to patch feature section at (ptrval) - (ptrval) with (ptrval) - (ptrval)

Christophe
