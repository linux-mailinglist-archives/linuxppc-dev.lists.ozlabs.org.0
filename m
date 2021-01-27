Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D170E306124
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jan 2021 17:40:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQq8Q2GnrzDqNH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 03:40:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQq6P34MCzDqbq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 03:38:12 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DQq642MK2z9v1pD;
 Wed, 27 Jan 2021 17:38:04 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Ao_inIsI9UNU; Wed, 27 Jan 2021 17:38:04 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DQq641QnMz9v1p7;
 Wed, 27 Jan 2021 17:38:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E26508B7F3;
 Wed, 27 Jan 2021 17:38:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rONtAInyMCxw; Wed, 27 Jan 2021 17:38:05 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 822D18B7F2;
 Wed, 27 Jan 2021 17:38:05 +0100 (CET)
Subject: Re: [PATCH] powerpc/fault: fix wrong KUAP fault for IO_URING
To: Zorro Lang <zlang@redhat.com>, linuxppc-dev@lists.ozlabs.org
References: <20210127145648.348135-1-zlang@redhat.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <cce83328-d996-defc-6c87-97cd24ec7027@csgroup.eu>
Date: Wed, 27 Jan 2021 17:38:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210127145648.348135-1-zlang@redhat.com>
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
Cc: axboe@kernel.dk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 27/01/2021 à 15:56, Zorro Lang a écrit :
> On powerpc, io_uring test hit below KUAP fault on __do_page_fault.
> The fail source line is:
> 
>    if (unlikely(!is_user && bad_kernel_fault(regs, error_code, address, is_write)))
>        return SIGSEGV;
> 
> The is_user() is based on user_mod(regs) only. This's not suit for
> io_uring, where the helper thread can assume the user app identity
> and could perform this fault just fine. So turn to use mm to decide
> if this is valid or not.

I don't understand why testing is_user would be an issue.
KUAP purpose it to block any unallowed access from kernel to user memory (Equivalent to SMAP on 
x86). So it really must be based on MSR_PR bit, that is what is_user provides.

If the kernel access is legitimate, kernel should have opened userspace access then you shouldn't 
get this "Bug: Read fault blocked by KUAP!".

As far as I understand, the fault occurs in iov_iter_fault_in_readable() which calls 
fault_in_pages_readable()
And fault_in_pages_readable() uses __get_user() so it is a legitimate access and you really should 
get a KUAP fault.

So the problem is somewhere else, I think you proposed patch just hides the problem, it doesn't fix it.

Can you provide your vmlinux binary together with your .config ?


> 
> [  556.472666] ------------[ cut here ]------------
> [  556.472686] Bug: Read fault blocked by KUAP!
> [  556.472697] WARNING: CPU: 1 PID: 101841 at arch/powerpc/mm/fault.c:229 __do_page_fault+0x6b4/0xcd0
> [  556.472728] Modules linked in: bonding rfkill sunrpc pseries_rng xts uio_pdrv_genirq vmx_crypto uio ip_tables xfs libcrc32c sd_mod t10_pi sg ibmvscsi ibmveth scsi_transport_srp
> [  556.472816] CPU: 1 PID: 101841 Comm: io_wqe_worker-0 Tainted: G        W         5.11.0-rc3+ #2
> [  556.472830] NIP:  c00000000009e7e4 LR: c00000000009e7e0 CTR: 0000000000000000
> [  556.472842] REGS: c000000016367090 TRAP: 0700   Tainted: G        W          (5.11.0-rc3+)
> [  556.472853] MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 48022424  XER: 00000001
> [  556.472901] CFAR: c0000000001822ac IRQMASK: 1
>                 GPR00: c00000000009e7e0 c000000016367330 c0000000023fc300 0000000000000020
>                 GPR04: c000000001e3c2b8 0000000000000001 0000000000000027 c0000007fbcccc90
>                 GPR08: 0000000000000023 0000000000000000 c000000024ed0900 fffffffffc464a58
>                 GPR12: 0000000000002000 c00000001ecaf280 c0000000001caee8 c000000014d547c0
>                 GPR16: 0000000000000000 0000000000000000 0000000000000000 c000000002454018
>                 GPR20: c000000001336480 bfffffffffffffff 0000000000000000 c00000000b0e5800
>                 GPR24: a8aaaaaaaaaaaaaa 0000000000000000 0000000000200000 c00000002cc38880
>                 GPR28: 000001000e3c9310 c0000000013424c0 c0000000163674a0 c000000001e0d2c0
> [  556.473125] NIP [c00000000009e7e4] __do_page_fault+0x6b4/0xcd0
> [  556.473139] LR [c00000000009e7e0] __do_page_fault+0x6b0/0xcd0
> [  556.473152] Call Trace:
> [  556.473168] [c000000016367330] [c00000000009e7e0] __do_page_fault+0x6b0/0xcd0 (unreliable)
> [  556.473198] [c0000000163673e0] [c00000000009ee3c] do_page_fault+0x3c/0x120
> [  556.473216] [c000000016367430] [c00000000000c848] handle_page_fault+0x10/0x2c
> [  556.473232] --- interrupt: 300 at iov_iter_fault_in_readable+0x148/0x6f0
> [  556.473245] NIP:  c0000000008e8228 LR: c0000000008e834c CTR: 0000000000000000
> [  556.473257] REGS: c0000000163674a0 TRAP: 0300   Tainted: G        W          (5.11.0-rc3+)
> [  556.473268] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 44008482  XER: 00000001
> [  556.473339] CFAR: c0000000008e81f0 DAR: 000001000e3c9310 DSISR: 00200000 IRQMASK: 0
>                 GPR00: c0000000008e834c c000000016367740 c0000000023fc300 0000000000000000
>                 GPR04: c00000002cc389e0 0000000000000001 00000007fa4b0000 c0000000025bc520
>                 GPR08: 00000007fa4b0000 0000000000000200 fcffffffffffffff ffffffffffea2ad8
>                 GPR12: 0000000000008000 c00000001ecaf280 c0000000001caee8 c000000014d547c0
>                 GPR16: 0000000000000000 0000000000000000 0000000000000000 c000000002454018
>                 GPR20: c000000001336480 bfffffffffffffff 0000000000000000 c00000000b0e5800
>                 GPR24: a8aaaaaaaaaaaaaa fcffffffffffffff 00000000000004b1 00000000000004b1
>                 GPR28: c00000000b0e5888 000001000e3c97c0 0000000000000000 000001000e3c9310
> [  556.473667] NIP [c0000000008e8228] iov_iter_fault_in_readable+0x148/0x6f0
> [  556.473688] LR [c0000000008e834c] iov_iter_fault_in_readable+0x26c/0x6f0
> [  556.473708] --- interrupt: 300
> [  556.473722] [c0000000163677e0] [c0000000007154a0] iomap_write_actor+0xc0/0x280
> [  556.473770] [c000000016367880] [c00000000070fc94] iomap_apply+0x1c4/0x780
> [  556.473804] [c000000016367990] [c000000000710330] iomap_file_buffered_write+0xa0/0x120
> [  556.473839] [c0000000163679e0] [c00800000040791c] xfs_file_buffered_aio_write+0x314/0x5e0 [xfs]
> [  556.474053] [c000000016367a90] [c0000000006d74bc] io_write+0x10c/0x460
> [  556.474101] [c000000016367bb0] [c0000000006d80e4] io_issue_sqe+0x8d4/0x1200
> [  556.474132] [c000000016367c70] [c0000000006d8ad0] io_wq_submit_work+0xc0/0x250
> [  556.474161] [c000000016367cb0] [c0000000006e2578] io_worker_handle_work+0x498/0x800
> [  556.474192] [c000000016367d40] [c0000000006e2cdc] io_wqe_worker+0x3fc/0x4f0
> [  556.474223] [c000000016367da0] [c0000000001cb0a4] kthread+0x1c4/0x1d0
> [  556.474254] [c000000016367e10] [c00000000000dbf0] ret_from_kernel_thread+0x5c/0x6c
> [  556.474286] Instruction dump:
> [  556.474310] e87e0100 481287f1 60000000 2fa30000 419e01ec 408e0400 3c82fef4 388461d0
> [  556.474395] 3c62fef4 386362d0 480e3a69 60000000 <0fe00000> 3860000b 4bfffa08 3d220006
> [  556.474479] irq event stamp: 1280
> [  556.474505] hardirqs last  enabled at (1279): [<c0000000005a0104>] __slab_free+0x3e4/0x570
> [  556.474540] hardirqs last disabled at (1280): [<c000000000008a04>] data_access_common_virt+0x1a4/0x1c0
> [  556.474565] softirqs last  enabled at (536): [<c00000000107cdfc>] __do_softirq+0x6ac/0x7f4
> [  556.474590] softirqs last disabled at (437): [<c00000000019179c>] irq_exit+0x2ec/0x320
> [  556.474615] ---[ end trace 4c1967c400992302 ]---
> 
> Buglink: https://bugzilla.kernel.org/show_bug.cgi?id=211151
> Suggested-by: Jens Axboe <axboe@kernel.dk>
> Signed-off-by: Zorro Lang <zlang@redhat.com>
> ---
> 
> Hi,
> 
> Thanks to Jens reviewed this bug report from io_uring side, and then suggest this
> fix. But we're not expert of powerpc, so report this bug to powerpc maillist to
> get more review.
> 
> I've tested this patch, I can't reproduce this bug after merge this patch. And
> can reproduce it after remove this patch.
> 
> Thanks,
> Zorro
> 
>   arch/powerpc/mm/fault.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 8961b44f350c..5a4d6af04c99 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -417,9 +417,12 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
>   	/*
>   	 * The kernel should never take an execute fault nor should it
>   	 * take a page fault to a kernel address or a page fault to a user
> -	 * address outside of dedicated places
> +	 * address outside of dedicated places. Use mm to decide if this is
> +	 * valid or not, it's perfectly legitimate to have a kernel thread
> +	 * take a fault as long as it's performed kthread_use_mm() prior. An
> +	 * example of that would be io_uring helper threads.
>   	 */
> -	if (unlikely(!is_user && bad_kernel_fault(regs, error_code, address, is_write)))
> +	if (unlikely(!mm && bad_kernel_fault(regs, error_code, address, is_write)))
>   		return SIGSEGV;
>   
>   	/*
> 
