Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C18A6CF7B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 16:13:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qGLs285QzDqMw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 00:13:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.42.102; helo=4.mo69.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 2696 seconds by postgrey-1.36 at bilbo;
 Fri, 19 Jul 2019 00:10:04 AEST
Received: from 4.mo69.mail-out.ovh.net (4.mo69.mail-out.ovh.net
 [46.105.42.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qGHJ5MdzzDqMp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 00:09:59 +1000 (AEST)
Received: from player792.ha.ovh.net (unknown [10.109.143.238])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 8621851B99
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 15:14:55 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id 094E8826FB96;
 Thu, 18 Jul 2019 13:14:53 +0000 (UTC)
Subject: Re: Crash in kvmppc_xive_release()
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <87k1cf8q3w.fsf@concordia.ellerman.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <3c152700-81de-9b34-e8a7-70b341a92197@kaod.org>
Date: Thu, 18 Jul 2019 15:14:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87k1cf8q3w.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 8128715852951555005
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrieehgdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecu
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 18/07/2019 14:49, Michael Ellerman wrote:
> Anyone else seen this?
> 
> This is running ~176 VMs on a Power9 (1 per thread), host crashes:

This is beyond the underlying limits of XIVE. 

As we allocate 2K vCPUs per VM, that is 16K EQs for interrupt events. The overall
EQ count is 1M. I let you calculate what is our max number of VMs ...

>   [   66.403750][ T6423] xive: OPAL failed to allocate VCPUs order 11, err -10

Hence, the OPAL XIVE driver fails which is good but ...

>   [188523.080935670,4] Spent 1783 msecs in OPAL call 135!
>   [   66.484965][ T6250] BUG: Kernel NULL pointer dereference at 0x000042e8
>   [   66.485558][ T6250] Faulting instruction address: 0xc008000011a33fcc
>   [   66.485990][ T6250] Oops: Kernel access of bad area, sig: 7 [#1]
>   [   66.486405][ T6250] LE PAGE_SIZE=64K MMU=Radix MMU=Hash SMP NR_CPUS=2048 NUMA PowerNV
>   [   66.486967][ T6250] Modules linked in: kvm_hv kvm
>   [   66.487275][ T6250] CPU: 107 PID: 6250 Comm: qemu-system-ppc Not tainted 5.2.0-rc2-gcc9x-gf5a9e488d623 #1
>   [   66.487902][ T6250] NIP:  c008000011a33fcc LR: c008000011a33fc4 CTR: c0000000005d5970
>   [   66.488383][ T6250] REGS: c000001fabebb900 TRAP: 0300   Not tainted  (5.2.0-rc2-gcc9x-gf5a9e488d623)
>   [   66.488933][ T6250] MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24028224  XER: 00000000
>   [   66.489724][ T6250] CFAR: c0000000005d6a4c DAR: 00000000000042e8 DSISR: 00080000 IRQMASK: 0 
>   [   66.489724][ T6250] GPR00: c008000011a33fc4 c000001fabebbb90 c008000011a5a200 c000000001399928 
>   [   66.489724][ T6250] GPR04: 0000000000000001 c00000000047b8d0 0000000000000000 0000000000000001 
>   [   66.489724][ T6250] GPR08: 0000000000000000 0000000000000000 c000001fa8c42f00 c008000011a3af20 
>   [   66.489724][ T6250] GPR12: 0000000000008000 c0002023ff65a880 000000013a1b4000 0000000000000002 
>   [   66.489724][ T6250] GPR16: 0000000010000000 0000000000000002 0000000000000001 000000012b194cc0 
>   [   66.489724][ T6250] GPR20: 00007fffb1645250 0000000000000001 0000000000000031 0000000000000000 
>   [   66.489724][ T6250] GPR24: 00007fffb16408d8 c000001ffafb62e0 c000001f78699360 c000001ff35d0620 
>   [   66.489724][ T6250] GPR28: c000001ed0ed0000 c000001ecd900000 0000000000000000 c000001ed0ed0000 
>   [   66.495211][ T6250] NIP [c008000011a33fcc] kvmppc_xive_release+0x54/0x1b0 [kvm]
>   [   66.495642][ T6250] LR [c008000011a33fc4] kvmppc_xive_release+0x4c/0x1b0 [kvm]
>   [   66.496101][ T6250] Call Trace:
>   [   66.496314][ T6250] [c000001fabebbb90] [c008000011a33fc4] kvmppc_xive_release+0x4c/0x1b0 [kvm] (unreliable)
>   [   66.496893][ T6250] [c000001fabebbbf0] [c008000011a18d54] kvm_device_release+0xac/0xf0 [kvm]
>   [   66.497399][ T6250] [c000001fabebbc30] [c000000000442f8c] __fput+0xec/0x310
>   [   66.497815][ T6250] [c000001fabebbc90] [c000000000145f94] task_work_run+0x114/0x170
>   [   66.498296][ T6250] [c000001fabebbce0] [c000000000115274] do_exit+0x454/0xee0
>   [   66.498743][ T6250] [c000001fabebbdc0] [c000000000115dd0] do_group_exit+0x60/0xe0
>   [   66.499201][ T6250] [c000001fabebbe00] [c000000000115e74] sys_exit_group+0x24/0x40
>   [   66.499747][ T6250] [c000001fabebbe20] [c00000000000b83c] system_call+0x5c/0x70
>   [   66.500261][ T6250] Instruction dump:
>   [   66.500484][ T6250] fbe1fff8 fba1ffe8 fbc1fff0 7c7c1b78 f8010010 f821ffa1 eba30010 e87d0010 
>   [   66.501006][ T6250] ebdd0000 48006f61 e8410018 39200000 <eb7e42ea> 913e42e8 48007f3d e8410018 
>   [   66.501529][ T6250] ---[ end trace c021a6ca03594ec3 ]---
>   [   66.513119][ T6150] xive: OPAL failed to allocate VCPUs order 11, err -10


... the rollback code in case of such error must be bogus. It was never tested 
clearly :/

Thanks,

C.

