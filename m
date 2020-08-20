Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7AC24C546
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 20:25:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXY413zcpzDr0Q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 04:25:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXY1m5XCyzDqkj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 04:23:37 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BXY1f2ynwz9v1R9;
 Thu, 20 Aug 2020 20:23:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id NXZNIUL1tC2R; Thu, 20 Aug 2020 20:23:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BXY1f1S9Dz9v0xQ;
 Thu, 20 Aug 2020 20:23:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1C2A08B863;
 Thu, 20 Aug 2020 20:23:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vk2POjKl9U-w; Thu, 20 Aug 2020 20:23:34 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BF0858B764;
 Thu, 20 Aug 2020 20:23:32 +0200 (CEST)
Subject: Re: [PATCH] powerpc: Fix a bug in __div64_32 if divisor is zero
To: Guohua Zhong <zhongguohua1@huawei.com>, paulus@samba.org,
 mpe@ellerman.id.au, benh@kernel.crashing.org, gregkh@linuxfoundation.org
References: <20200820131049.42940-1-zhongguohua1@huawei.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <8dedfcce-04e0-ec7d-6af5-ec1d6d8602b0@csgroup.eu>
Date: Thu, 20 Aug 2020 20:23:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200820131049.42940-1-zhongguohua1@huawei.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, wangle6@huawei.com, nixiaoming@huawei.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 20/08/2020 à 15:10, Guohua Zhong a écrit :
> When cat /proc/pid/stat, do_task_stat will call into cputime_adjust,
> which call stack is like this:
> 
> [17179954.674326]BookE Watchdog detected hard LOCKUP on cpu 0
> [17179954.674331]dCPU: 0 PID: 1262 Comm: TICK Tainted: P        W  O    4.4.176 #1
> [17179954.674339]dtask: dc9d7040 task.stack: d3cb4000
> [17179954.674344]NIP: c001b1a8 LR: c006a7ac CTR: 00000000
> [17179954.674349]REGS: e6fe1f10 TRAP: 3202   Tainted: P        W  O     (4.4.176)
> [17179954.674355]MSR: 00021002 <CE,ME>  CR: 28002224  XER: 00000000
> [17179954.674364]
> GPR00: 00000016 d3cb5cb0 dc9d7040 d3cb5cc0 00000000 0000025d ffe15b24 ffffffff
> GPR08: de86aead 00000000 000003ff ffffffff 28002222 0084d1c0 00000000 ffffffff
> GPR16: b5929ca0 b4bb7a48 c0863c08 0000048d 00000062 00000062 00000000 0000000f
> GPR24: 00000000 d3cb5d08 d3cb5d60 d3cb5d64 00029002 d3e9c214 fffff30e d3e9c20c
> [17179954.674410]NIP [c001b1a8] __div64_32+0x60/0xa0
> [17179954.674422]LR [c006a7ac] cputime_adjust+0x124/0x138
> [17179954.674434]Call Trace:
> [17179961.832693]Call Trace:
> [17179961.832695][d3cb5cb0] [c006a6dc] cputime_adjust+0x54/0x138 (unreliable)
> [17179961.832705][d3cb5cf0] [c006a818] task_cputime_adjusted+0x58/0x80
> [17179961.832713][d3cb5d20] [c01dab44] do_task_stat+0x298/0x870
> [17179961.832720][d3cb5de0] [c01d4948] proc_single_show+0x60/0xa4
> [17179961.832728][d3cb5e10] [c01963d8] seq_read+0x2d8/0x52c
> [17179961.832736][d3cb5e80] [c01702fc] __vfs_read+0x40/0x114
> [17179961.832744][d3cb5ef0] [c0170b1c] vfs_read+0x9c/0x10c
> [17179961.832751][d3cb5f10] [c0171440] SyS_read+0x68/0xc4
> [17179961.832759][d3cb5f40] [c0010a40] ret_from_syscall+0x0/0x3c
> 
> do_task_stat->task_cputime_adjusted->cputime_adjust->scale_stime->div_u64
> ->div_u64_rem->do_div->__div64_32
> 
> In some corner case, stime + utime = 0 if overflow. Even in v5.8.2  kernel
> the cputime has changed from unsigned long to u64 data type. About 200
> days, the lowwer 32 bit will be 0x00000000. Because divisor for __div64_32
> is unsigned long data type,which is 32 bit for powepc 32, the bug still
> exists.
> 
> So it is also a bug in the cputime_adjust which does not check if
> stime + utime = 0
> 
> time = scale_stime((__force u64)stime, (__force u64)rtime,
>                  (__force u64)(stime + utime));
> 
> The commit 3dc167ba5729 ("sched/cputime: Improve cputime_adjust()") in
> mainline kernel may has fixed this case. But it is also better to check
> if divisor is 0 in __div64_32 for other situation.
> 
> Signed-off-by: Guohua Zhong <zhongguohua1@huawei.com>
> Fixes:14cf11af6cf6 "( powerpc: Merge enough to start building in arch/powerpc.)"
> Fixes:94b212c29f68 "( powerpc: Move ppc64 boot wrapper code over to arch/powerpc)"
> Cc: stable@vger.kernel.org # v2.6.15+
> ---
>   arch/powerpc/boot/div64.S | 4 ++++
>   arch/powerpc/lib/div64.S  | 4 ++++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/arch/powerpc/boot/div64.S b/arch/powerpc/boot/div64.S
> index 4354928ed62e..39a25b9712d1 100644
> --- a/arch/powerpc/boot/div64.S
> +++ b/arch/powerpc/boot/div64.S
> @@ -13,6 +13,9 @@
>   
>   	.globl __div64_32
>   __div64_32:
> +	li	r9,0
> +	cmplw	r4,r9	# check if divisor r4 is zero
> +	beq	5f			# jump to label 5 if r4(divisor) is zero

In generic version in lib/math/div64.c, there is no checking of 'base' 
either.
Do we really want to add this check in the powerpc version only ?

The only user of __div64_32() is do_div() in 
include/asm-generic/div64.h. Wouldn't it be better to do the check there ?

Christophe


>   	lwz	r5,0(r3)	# get the dividend into r5/r6
>   	lwz	r6,4(r3)
>   	cmplw	r5,r4
> @@ -52,6 +55,7 @@ __div64_32:
>   4:	stw	r7,0(r3)	# return the quotient in *r3
>   	stw	r8,4(r3)
>   	mr	r3,r6		# return the remainder in r3
> +5:					# return if divisor r4 is zero
>   	blr
>   
>   /*
> diff --git a/arch/powerpc/lib/div64.S b/arch/powerpc/lib/div64.S
> index 3d5426e7dcc4..1cc9bcabf678 100644
> --- a/arch/powerpc/lib/div64.S
> +++ b/arch/powerpc/lib/div64.S
> @@ -13,6 +13,9 @@
>   #include <asm/processor.h>
>   
>   _GLOBAL(__div64_32)
> +	li	r9,0
> +	cmplw	r4,r9	# check if divisor r4 is zero
> +	beq	5f			# jump to label 5 if r4(divisor) is zero
>   	lwz	r5,0(r3)	# get the dividend into r5/r6
>   	lwz	r6,4(r3)
>   	cmplw	r5,r4
> @@ -52,4 +55,5 @@ _GLOBAL(__div64_32)
>   4:	stw	r7,0(r3)	# return the quotient in *r3
>   	stw	r8,4(r3)
>   	mr	r3,r6		# return the remainder in r3
> +5:					# return if divisor r4 is zero
>   	blr
> 
