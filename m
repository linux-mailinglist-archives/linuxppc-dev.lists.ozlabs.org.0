Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5288A7F69A6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 01:02:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=EXoSXWK6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbwCz1PGSz3dKJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 11:02:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=EXoSXWK6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbwC53FzRz30gH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 11:02:07 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 94F218285966;
	Thu, 23 Nov 2023 18:02:01 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id kqmcTUHYpmAi; Thu, 23 Nov 2023 18:02:00 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id DD04D82858B9;
	Thu, 23 Nov 2023 18:01:59 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com DD04D82858B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1700784119; bh=/K0ePnwT7psehnvpRKRvGH9Y4HoskzplRLF3gGUpSm0=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=EXoSXWK6iK2gwCKGFdnGd9tcgSIxBGrxzGS06yervCph79PJ04K9AK+QL6Y/ib8vT
	 l/ilJaeCB2dt0CY4yBw4Kqgx2qN3lH73QFDq+iQD6Gx6I/qSt+/qtTo7vDEmzxBcW9
	 EwHeB5kgeCbjIWQqfzHOcuPpapi6DkMaHvd5Q9JU=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id e81alOH2KJ3J; Thu, 23 Nov 2023 18:01:59 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 9D9F082858A9;
	Thu, 23 Nov 2023 18:01:59 -0600 (CST)
Date: Thu, 23 Nov 2023 18:01:59 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Message-ID: <1340817182.49635143.1700784119445.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <87leaqjs8x.fsf@mail.lhotse>
References: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com> <877cmc7ve9.fsf@mail.lhotse> <439072392.48800901.1700498743840.JavaMail.zimbra@raptorengineeringinc.com> <874jhg6lkn.fsf@mail.lhotse> <1294229534.48922001.1700539832331.JavaMail.zimbra@raptorengineeringinc.com> <87leaqjs8x.fsf@mail.lhotse>
Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register  save
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC119 (Linux)/8.5.0_GA_3042)
Thread-Topic: powerpc: Don't clobber fr0/vs0 during fp|altivec register save
Thread-Index: OkyGhBWE6ESNaH7+hHk9xkTdc0AVjQ==
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
Cc: Jens Axboe <axboe@kernel.dk>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, regressions <regressions@lists.linux.dev>, npiggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



----- Original Message -----
> From: "Michael Ellerman" <mpe@ellerman.id.au>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "Jens Axboe" <axboe@kernel.dk>, "regressions" <regressions@lists.linux.dev>, "npiggin" <npiggin@gmail.com>,
> "christophe leroy" <christophe.leroy@csgroup.eu>, "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
> Sent: Tuesday, November 21, 2023 11:01:50 PM
> Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec register  save

> Timothy Pearson <tpearson@raptorengineering.com> writes:
>>
> ...
>>
>> So a little more detail on this, just to put it to rest properly vs.
>> assuming hand analysis caught every possible pathway. :)
>>
>> The debugging that generates this stack trace also verifies the following in
>> __giveup_fpu():
>>
>> 1.) tsk->thread.fp_state.fpr doesn't contain the FPSCR contents prior to calling
>> save_fpu()
>> 2.) tsk->thread.fp_state.fpr contains the FPSCR contents directly after calling
>> save_fpu()
>> 3.) MSR_FP is set both in the task struct and in the live MSR.
>>
>> Only if all three conditions are met will it generate the trace.  This
>> is a generalization of the hack I used to find the problem in the
>> first place.
>>
>> If the state will subsequently be reloaded from the thread struct,
>> that means we're reloading the registers from the thread struct that
>> we just verified was corrupted by the earlier save_fpu() call.  There
>> are only two ways I can see for that to be true -- one is if the
>> registers were already clobbered when giveup_all() was entered, and
>> the other is if save_fpu() went ahead and clobbered them right here
>> inside giveup_all().
>>
>> To see which scenario we were dealing with, I added a bit more
>> instrumentation to dump the current register state if MSR_FP bit was
>> already set in registers (i.e. not dumping data from task struct, but
>> using the live FPU registers instead), and sure enough the registers
>> are corrupt on entry, so something else has already called save_fpu()
>> before we even hit giveup_all() in this call chain.
> 
> Can you share the debug patch you're using?
> 
> cheers

Sure, here you go.  Note that with my FPU patch there is no WARN_ON hit, at least in my testing, so it isn't userspace purposefully loading the fr0/vs0 register with the FPSCR.

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 392404688cec..bde57dc3262a 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -154,7 +154,49 @@ static void __giveup_fpu(struct task_struct *tsk)
 {
 	unsigned long msr;
 
+	// DEBUGGING
+	uint64_t prev_fpr0 = *(((uint64_t*)(&tsk->thread.fp_state.fpr[0]))+0);
+	uint64_t prev_fpr1 = *(((uint64_t*)(&tsk->thread.fp_state.fpr[0]))+1);
+	struct thread_fp_state debug_fp_state;
+	unsigned long currentmsr = mfmsr();
+
+	if (currentmsr & MSR_FP) {
+		store_fp_state(&debug_fp_state);
+		load_fp_state(&debug_fp_state);
+	}
+
 	save_fpu(tsk);
+
+	// DEBUGGING
+	if (tsk->thread.regs->msr & MSR_FP) {
+		if (((*(((uint64_t*)(&tsk->thread.fp_state.fpr[0]))+0) == 0x82004000) && (prev_fpr0 != 0x82004000))
+		 || ((*(((uint64_t*)(&tsk->thread.fp_state.fpr[0]))+1) == 0x82004000) && (prev_fpr1 != 0x82004000)))
+		{
+			WARN_ON(1);
+
+			printk("[TS %lld] In __giveup_fpu() for process [comm: '%s'  pid %d tid %d], before save current "
+			"fp0: 0x%016llx/%016llx fp1: 0x%016llx/%016llx fp8: 0x%016llx/%016llx fp9: 0x%016llx/%016llx"
+			" msr: 0x%016lx (FP %d VSX %d EE %d) on core %d\n",
+			ktime_get_boottime_ns(), current->comm, current->pid, current->tgid,
+			*(((uint64_t*)(&debug_fp_state.fpr[0]))+0), *(((uint64_t*)(&debug_fp_state.fpr[0]))+1),
+			*(((uint64_t*)(&debug_fp_state.fpr[1]))+0), *(((uint64_t*)(&debug_fp_state.fpr[1]))+1),
+			*(((uint64_t*)(&debug_fp_state.fpr[8]))+0), *(((uint64_t*)(&debug_fp_state.fpr[8]))+1),
+			*(((uint64_t*)(&tsk->thread.fp_state.fpr[9]))+0), *(((uint64_t*)(&tsk->thread.fp_state.fpr[9]))+1),
+			currentmsr, !!(currentmsr & MSR_FP), !!(currentmsr & MSR_VSX), !!(currentmsr & MSR_EE), raw_smp_processor_id());
+
+			printk("[TS %lld] In __giveup_fpu() for process [comm: '%s'  pid %d tid %d], after save saved "
+			"fp0: 0x%016llx/%016llx fp1: 0x%016llx/%016llx fp8: 0x%016llx/%016llx fp9: 0x%016llx/%016llx"
+			" msr: 0x%016lx (FP %d VSX %d EE %d) on core %d\n",
+			ktime_get_boottime_ns(), current->comm, current->pid, current->tgid,
+			*(((uint64_t*)(&tsk->thread.fp_state.fpr[0]))+0), *(((uint64_t*)(&tsk->thread.fp_state.fpr[0]))+1),
+			*(((uint64_t*)(&tsk->thread.fp_state.fpr[1]))+0), *(((uint64_t*)(&tsk->thread.fp_state.fpr[1]))+1),
+			*(((uint64_t*)(&tsk->thread.fp_state.fpr[8]))+0), *(((uint64_t*)(&tsk->thread.fp_state.fpr[8]))+1),
+			*(((uint64_t*)(&tsk->thread.fp_state.fpr[9]))+0), *(((uint64_t*)(&tsk->thread.fp_state.fpr[9]))+1),
+			tsk->thread.regs->msr, !!(tsk->thread.regs->msr & MSR_FP), !!(tsk->thread.regs->msr & MSR_VSX), !!(tsk->thread.regs->msr & MSR_EE), raw_smp_processor_id());
+		}
+	}
+
+
 	msr = tsk->thread.regs->msr;
 	msr &= ~(MSR_FP|MSR_FE0|MSR_FE1);
 	if (cpu_has_feature(CPU_FTR_VSX))
