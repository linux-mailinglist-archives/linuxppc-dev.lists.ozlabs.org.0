Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 769F9154ECD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 23:15:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DCRg49ZnzDqBb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 09:15:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gustavold@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DCPj4KRpzDqRn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 09:13:38 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 016M9nTP143751; Thu, 6 Feb 2020 17:13:36 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y0nxn2uuv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Feb 2020 17:13:36 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 016M85RM025424;
 Thu, 6 Feb 2020 22:13:35 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 2xykc9vj5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Feb 2020 22:13:35 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 016MDY1554002136
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Feb 2020 22:13:34 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65F42112066;
 Thu,  6 Feb 2020 22:13:34 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B977112062;
 Thu,  6 Feb 2020 22:13:33 +0000 (GMT)
Received: from [9.85.151.5] (unknown [9.85.151.5])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  6 Feb 2020 22:13:32 +0000 (GMT)
Subject: Re: [PATCH v2 1/3] powerpc/tm: Clear the current thread's MSR[TS]
 after treclaim
To: Michael Neuling <mikey@neuling.org>,
 Gustavo Luiz Duarte <gustavold@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20200203160906.24482-1-gustavold@linux.ibm.com>
 <0af388c6a08d83ee7816fc3fc6053c905dc58344.camel@neuling.org>
From: Gustavo Luiz Duarte <gustavold@linux.vnet.ibm.com>
Message-ID: <3cc875cb-a149-1d9b-5a4d-57c8c370d60e@linux.vnet.ibm.com>
Date: Thu, 6 Feb 2020 19:13:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <0af388c6a08d83ee7816fc3fc6053c905dc58344.camel@neuling.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-06_04:2020-02-06,
 2020-02-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 clxscore=1011 mlxlogscore=999 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002060161
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
Cc: stable@vger.kernel.org, gromero@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/5/20 1:58 AM, Michael Neuling wrote:
> Other than the minor things below that I think you need, the patch good with me.
> 
> Acked-by: Michael Neuling <mikey@neuling.org>
> 
>> Subject: Re: [PATCH v2 1/3] powerpc/tm: Clear the current thread's MSR[TS] after treclaim
> 
> The subject should mention "signals".

How about "powerpc/tm: Clear the current thread's MSR[TS] when 
transaction is reclaimed on signal delivery"  ?

> 
> On Mon, 2020-02-03 at 13:09 -0300, Gustavo Luiz Duarte wrote:
>> After a treclaim, we expect to be in non-transactional state. If we don't
>> immediately clear the current thread's MSR[TS] and we get preempted, then
>> tm_recheckpoint_new_task() will recheckpoint and we get rescheduled in
>> suspended transaction state.
> 
> It's not "immediately", it's before re-enabling preemption.
> 
> There is a similar comment in the code that needs to be fixed too.

OK.

> 
>> When handling a signal caught in transactional state, handle_rt_signal64()
>> calls get_tm_stackpointer() that treclaims the transaction using
>> tm_reclaim_current() but without clearing the thread's MSR[TS]. This can cause
>> the TM Bad Thing exception below if later we pagefault and get preempted trying
>> to access the user's sigframe, using __put_user(). Afterwards, when we are
>> rescheduled back into do_page_fault() (but now in suspended state since the
>> thread's MSR[TS] was not cleared), upon executing 'rfid' after completion of
>> the page fault handling, the exception is raised because a transition from
>> suspended to non-transactional state is invalid.
>>
>> 	Unexpected TM Bad Thing exception at c00000000000de44 (msr 0x8000000302a03031) tm_scratch=800000010280b033
>> 	Oops: Unrecoverable exception, sig: 6 [#1]
>> 	LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
>> 	Modules linked in: nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip6_tables ip_tables nft_compat ip_set nf_tables nfnetlink xts vmx_crypto sg virtio_balloon
>> 	r_mod cdrom virtio_net net_failover virtio_blk virtio_scsi failover dm_mirror dm_region_hash dm_log dm_mod
>> 	CPU: 25 PID: 15547 Comm: a.out Not tainted 5.4.0-rc2 #32
>> 	NIP:  c00000000000de44 LR: c000000000034728 CTR: 0000000000000000
>> 	REGS: c00000003fe7bd70 TRAP: 0700   Not tainted  (5.4.0-rc2)
>> 	MSR:  8000000302a03031 <SF,VEC,VSX,FP,ME,IR,DR,LE,TM[SE]>  CR: 44000884  XER: 00000000
>> 	CFAR: c00000000000dda4 IRQMASK: 0
>> 	PACATMSCRATCH: 800000010280b033
>> 	GPR00: c000000000034728 c000000f65a17c80 c000000001662800 00007fffacf3fd78
>> 	GPR04: 0000000000001000 0000000000001000 0000000000000000 c000000f611f8af0
>> 	GPR08: 0000000000000000 0000000078006001 0000000000000000 000c000000000000
>> 	GPR12: c000000f611f84b0 c00000003ffcb200 0000000000000000 0000000000000000
>> 	GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> 	GPR20: 0000000000000000 0000000000000000 0000000000000000 c000000f611f8140
>> 	GPR24: 0000000000000000 00007fffacf3fd68 c000000f65a17d90 c000000f611f7800
>> 	GPR28: c000000f65a17e90 c000000f65a17e90 c000000001685e18 00007fffacf3f000
>> 	NIP [c00000000000de44] fast_exception_return+0xf4/0x1b0
>> 	LR [c000000000034728] handle_rt_signal64+0x78/0xc50
>> 	Call Trace:
>> 	[c000000f65a17c80] [c000000000034710] handle_rt_signal64+0x60/0xc50 (unreliable)
>> 	[c000000f65a17d30] [c000000000023640] do_notify_resume+0x330/0x460
>> 	[c000000f65a17e20] [c00000000000dcc4] ret_from_except_lite+0x70/0x74
>> 	Instruction dump:
>> 	7c4ff120 e8410170 7c5a03a6 38400000 f8410060 e8010070 e8410080 e8610088
>> 	60000000 60000000 e8810090 e8210078 <4c000024> 48000000 e8610178 88ed0989
>> 	---[ end trace 93094aa44b442f87 ]---
>>
>> The simplified sequence of events that triggers the above exception is:
>>
>>    ...				# userspace in NON-TRANSACTIONAL state
>>    tbegin			# userspace in TRANSACTIONAL state
>>    signal delivery		# kernelspace in SUSPENDED state
>>    handle_rt_signal64()
>>      get_tm_stackpointer()
>>        treclaim			# kernelspace in NON-TRANSACTIONAL state
>>      __put_user()
>>        page fault happens. We will never get back here because of the TM Bad Thing exception.
>>
>>    page fault handling kicks in and we voluntarily preempt ourselves
>>    do_page_fault()
>>      __schedule()
>>        __switch_to(other_task)
>>
>>    our task is rescheduled and we recheckpoint because the thread's MSR[TS] was not cleared
>>    __switch_to(our_task)
>>      switch_to_tm()
>>        tm_recheckpoint_new_task()
>>          trechkpt			# kernelspace in SUSPENDED state
>>
>>    The page fault handling resumes, but now we are in suspended transaction state
>>    do_page_fault()    completes
>>    rfid     <----- trying to get back where the page fault happened (we were non-transactional back then)
>>    TM Bad Thing			# illegal transition from suspended to non-transactional
>>
>> This patch fixes that issue by clearing the current thread's MSR[TS] just after
>> treclaim in get_tm_stackpointer() so that we stay in non-transactional state in
>> case we are preempted. In order to make treclaim and clearing the thread's
>> MSR[TS] atomic from a preemption perspective when CONFIG_PREEMPT is set,
>> preempt_disable/enable() is used. It's also necessary to save the previous
>> value of the thread's MSR before get_tm_stackpointer() is called so that it can
>> be exposed to the signal handler later in setup_tm_sigcontexts() to inform the
>> userspace MSR at the moment of the signal delivery.
>>
>> Found with tm-signal-context-force-tm kernel selftest on P8 KVM.
> 
> Why are you mentioning KVM?

That is just what I used... I agree that the issue has nothing to do 
with KVM. I will remove that on v3.

> 
>>
>> v2: Fix build failure when tm is disabled.
>>
>> Fixes: 2b0a576d15e0 ("powerpc: Add new transactional memory state to the signal context")
>> Cc: stable@vger.kernel.org # v3.9
>> Signed-off-by: Gustavo Luiz Duarte <gustavold@linux.ibm.com>
>> ---
>>   arch/powerpc/kernel/signal.c    | 17 +++++++++++++++--
>>   arch/powerpc/kernel/signal_32.c | 28 ++++++++++++++--------------
>>   arch/powerpc/kernel/signal_64.c | 22 ++++++++++------------
>>   3 files changed, 39 insertions(+), 28 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
>> index e6c30cee6abf..1660be1061ac 100644
>> --- a/arch/powerpc/kernel/signal.c
>> +++ b/arch/powerpc/kernel/signal.c
>> @@ -200,14 +200,27 @@ unsigned long get_tm_stackpointer(struct task_struct *tsk)
>>   	 * normal/non-checkpointed stack pointer.
>>   	 */
>>   
>> +	unsigned long ret = tsk->thread.regs->gpr[1];
>> +
>>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>>   	BUG_ON(tsk != current);
>>   
>>   	if (MSR_TM_ACTIVE(tsk->thread.regs->msr)) {
>> +		preempt_disable();
>>   		tm_reclaim_current(TM_CAUSE_SIGNAL);
>>   		if (MSR_TM_TRANSACTIONAL(tsk->thread.regs->msr))
>> -			return tsk->thread.ckpt_regs.gpr[1];
>> +			ret = tsk->thread.ckpt_regs.gpr[1];
>> +
>> +		/* If we treclaim, we must immediately clear the current
>> +		 * thread's TM bits. Otherwise we might be preempted and have
>> +		 * the live MSR[TS] changed behind our back
>> +		 * (tm_recheckpoint_new_task() would recheckpoint).
>> +		 * Besides, we enter the signal handler in non-transactional
>> +		 * state.
>> +		 */
>> +		tsk->thread.regs->msr &= ~MSR_TS_MASK;
>> +		preempt_enable();
>>   	}
>>   #endif
>> -	return tsk->thread.regs->gpr[1];
>> +	return ret;
>>   }
>> diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
>> index 98600b276f76..1b090a76b444 100644
>> --- a/arch/powerpc/kernel/signal_32.c
>> +++ b/arch/powerpc/kernel/signal_32.c
>> @@ -489,19 +489,11 @@ static int save_user_regs(struct pt_regs *regs, struct mcontext __user *frame,
>>    */
>>   static int save_tm_user_regs(struct pt_regs *regs,
>>   			     struct mcontext __user *frame,
>> -			     struct mcontext __user *tm_frame, int sigret)
>> +			     struct mcontext __user *tm_frame, int sigret,
>> +			     unsigned long msr)
>>   {
>> -	unsigned long msr = regs->msr;
>> -
>>   	WARN_ON(tm_suspend_disabled);
>>   
>> -	/* Remove TM bits from thread's MSR.  The MSR in the sigcontext
>> -	 * just indicates to userland that we were doing a transaction, but we
>> -	 * don't want to return in transactional state.  This also ensures
>> -	 * that flush_fp_to_thread won't set TIF_RESTORE_TM again.
>> -	 */
>> -	regs->msr &= ~MSR_TS_MASK;
>> -
>>   	/* Save both sets of general registers */
>>   	if (save_general_regs(&current->thread.ckpt_regs, frame)
>>   	    || save_general_regs(regs, tm_frame))
>> @@ -912,6 +904,10 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
>>   	int sigret;
>>   	unsigned long tramp;
>>   	struct pt_regs *regs = tsk->thread.regs;
>> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>> +	/* Save the thread's msr before get_tm_stackpointer() changes it */
>> +	unsigned long msr = regs->msr;
>> +#endif
>>   
>>   	BUG_ON(tsk != current);
>>   
>> @@ -944,13 +940,13 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
>>   
>>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>>   	tm_frame = &rt_sf->uc_transact.uc_mcontext;
>> -	if (MSR_TM_ACTIVE(regs->msr)) {
>> +	if (MSR_TM_ACTIVE(msr)) {
>>   		if (__put_user((unsigned long)&rt_sf->uc_transact,
>>   			       &rt_sf->uc.uc_link) ||
>>   		    __put_user((unsigned long)tm_frame,
>>   			       &rt_sf->uc_transact.uc_regs))
>>   			goto badframe;
>> -		if (save_tm_user_regs(regs, frame, tm_frame, sigret))
>> +		if (save_tm_user_regs(regs, frame, tm_frame, sigret, msr))
>>   			goto badframe;
>>   	}
>>   	else
>> @@ -1369,6 +1365,10 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
>>   	int sigret;
>>   	unsigned long tramp;
>>   	struct pt_regs *regs = tsk->thread.regs;
>> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>> +	/* Save the thread's msr before get_tm_stackpointer() changes it */
>> +	unsigned long msr = regs->msr;
>> +#endif
>>   
>>   	BUG_ON(tsk != current);
>>   
>> @@ -1402,9 +1402,9 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
>>   
>>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>>   	tm_mctx = &frame->mctx_transact;
>> -	if (MSR_TM_ACTIVE(regs->msr)) {
>> +	if (MSR_TM_ACTIVE(msr)) {
>>   		if (save_tm_user_regs(regs, &frame->mctx, &frame->mctx_transact,
>> -				      sigret))
>> +				      sigret, msr))
>>   			goto badframe;
>>   	}
>>   	else
>> diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
>> index 117515564ec7..84ed2e77ef9c 100644
>> --- a/arch/powerpc/kernel/signal_64.c
>> +++ b/arch/powerpc/kernel/signal_64.c
>> @@ -192,7 +192,8 @@ static long setup_sigcontext(struct sigcontext __user *sc,
>>   static long setup_tm_sigcontexts(struct sigcontext __user *sc,
>>   				 struct sigcontext __user *tm_sc,
>>   				 struct task_struct *tsk,
>> -				 int signr, sigset_t *set, unsigned long handler)
>> +				 int signr, sigset_t *set, unsigned long handler,
>> +				 unsigned long msr)
>>   {
>>   	/* When CONFIG_ALTIVEC is set, we _always_ setup v_regs even if the
>>   	 * process never used altivec yet (MSR_VEC is zero in pt_regs of
>> @@ -207,12 +208,11 @@ static long setup_tm_sigcontexts(struct sigcontext __user *sc,
>>   	elf_vrreg_t __user *tm_v_regs = sigcontext_vmx_regs(tm_sc);
>>   #endif
>>   	struct pt_regs *regs = tsk->thread.regs;
>> -	unsigned long msr = tsk->thread.regs->msr;
>>   	long err = 0;
>>   
>>   	BUG_ON(tsk != current);
>>   
>> -	BUG_ON(!MSR_TM_ACTIVE(regs->msr));
>> +	BUG_ON(!MSR_TM_ACTIVE(msr));
>>   
>>   	WARN_ON(tm_suspend_disabled);
>>   
>> @@ -222,13 +222,6 @@ static long setup_tm_sigcontexts(struct sigcontext __user *sc,
>>   	 */
>>   	msr |= tsk->thread.ckpt_regs.msr & (MSR_FP | MSR_VEC | MSR_VSX);
>>   
>> -	/* Remove TM bits from thread's MSR.  The MSR in the sigcontext
>> -	 * just indicates to userland that we were doing a transaction, but we
>> -	 * don't want to return in transactional state.  This also ensures
>> -	 * that flush_fp_to_thread won't set TIF_RESTORE_TM again.
>> -	 */
>> -	regs->msr &= ~MSR_TS_MASK;
>> -
>>   #ifdef CONFIG_ALTIVEC
>>   	err |= __put_user(v_regs, &sc->v_regs);
>>   	err |= __put_user(tm_v_regs, &tm_sc->v_regs);
>> @@ -824,6 +817,10 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
>>   	unsigned long newsp = 0;
>>   	long err = 0;
>>   	struct pt_regs *regs = tsk->thread.regs;
>> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>> +	/* Save the thread's msr before get_tm_stackpointer() changes it */
>> +	unsigned long msr = regs->msr;
>> +#endif
>>   
>>   	BUG_ON(tsk != current);
>>   
>> @@ -841,7 +838,7 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
>>   	err |= __put_user(0, &frame->uc.uc_flags);
>>   	err |= __save_altstack(&frame->uc.uc_stack, regs->gpr[1]);
>>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>> -	if (MSR_TM_ACTIVE(regs->msr)) {
>> +	if (MSR_TM_ACTIVE(msr)) {
>>   		/* The ucontext_t passed to userland points to the second
>>   		 * ucontext_t (for transactional state) with its uc_link ptr.
>>   		 */
>> @@ -849,7 +846,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
>>   		err |= setup_tm_sigcontexts(&frame->uc.uc_mcontext,
>>   					    &frame->uc_transact.uc_mcontext,
>>   					    tsk, ksig->sig, NULL,
>> -					    (unsigned long)ksig->ka.sa.sa_handler);
>> +					    (unsigned long)ksig->ka.sa.sa_handler,
>> +					    msr);
>>   	} else
>>   #endif
>>   	{
> 
