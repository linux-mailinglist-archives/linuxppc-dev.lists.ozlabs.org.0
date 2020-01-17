Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F416141389
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 22:45:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zvkQ1Kf5zDqnw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jan 2020 08:45:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gromero@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zvdz6Q2PzDqwg
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2020 08:41:43 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00HKvD6V065111; Fri, 17 Jan 2020 15:57:26 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xk0qu98e1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 15:57:26 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00HKoXCB004718;
 Fri, 17 Jan 2020 20:57:25 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 2xjuy1ntss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 20:57:25 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00HKvNMt38601128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jan 2020 20:57:23 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82E88C6057;
 Fri, 17 Jan 2020 20:57:23 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B23F7C6059;
 Fri, 17 Jan 2020 20:57:21 +0000 (GMT)
Received: from oc6336877782.ibm.com (unknown [9.80.203.79])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 17 Jan 2020 20:57:21 +0000 (GMT)
Subject: Re: [PATCH 1/3] powerpc/tm: Clear the current thread's MSR[TS] after
 treclaim
To: Gustavo Luiz Duarte <gustavold@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20200116220531.4715-1-gustavold@linux.ibm.com>
From: Gustavo Romero <gromero@linux.vnet.ibm.com>
Message-ID: <38205e7d-4025-c169-64c8-f12bc4f3a2aa@linux.vnet.ibm.com>
Date: Fri, 17 Jan 2020 17:57:20 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200116220531.4715-1-gustavold@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_05:2020-01-16,
 2020-01-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 malwarescore=0 clxscore=1011 mlxscore=0 suspectscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001170161
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
Cc: mikey@neuling.org, stable@vger.kernel.org, gromero@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Gustavo,

Thanks for fixing that TM issue.

On 01/16/2020 07:05 PM, Gustavo Luiz Duarte wrote:
> Fixes: 2b0a576d15e0 ("powerpc: Add new transactional memory state to the signal context")
> Cc: stable@vger.kernel.org # v3.9
> Signed-off-by: Gustavo Luiz Duarte <gustavold@linux.ibm.com>
> ---
>   arch/powerpc/kernel/signal.c    | 17 +++++++++++++++--
>   arch/powerpc/kernel/signal_32.c | 24 ++++++++++--------------
>   arch/powerpc/kernel/signal_64.c | 20 ++++++++------------
>   3 files changed, 33 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
> index e6c30cee6abf..1660be1061ac 100644
> --- a/arch/powerpc/kernel/signal.c
> +++ b/arch/powerpc/kernel/signal.c
> @@ -200,14 +200,27 @@ unsigned long get_tm_stackpointer(struct task_struct *tsk)
>   	 * normal/non-checkpointed stack pointer.
>   	 */
>   
> +	unsigned long ret = tsk->thread.regs->gpr[1];
> +
>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>   	BUG_ON(tsk != current);
>   
>   	if (MSR_TM_ACTIVE(tsk->thread.regs->msr)) {
> +		preempt_disable();
>   		tm_reclaim_current(TM_CAUSE_SIGNAL);
>   		if (MSR_TM_TRANSACTIONAL(tsk->thread.regs->msr))
> -			return tsk->thread.ckpt_regs.gpr[1];
> +			ret = tsk->thread.ckpt_regs.gpr[1];
> +
> +		/* If we treclaim, we must immediately clear the current
> +		 * thread's TM bits. Otherwise we might be preempted and have
> +		 * the live MSR[TS] changed behind our back
> +		 * (tm_recheckpoint_new_task() would recheckpoint).
> +		 * Besides, we enter the signal handler in non-transactional
> +		 * state.
> +		 */
> +		tsk->thread.regs->msr &= ~MSR_TS_MASK;
> +		preempt_enable();
>   	}
>   #endif
> -	return tsk->thread.regs->gpr[1];
> +	return ret;
>   }
> diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
> index 98600b276f76..132a092cd170 100644
> --- a/arch/powerpc/kernel/signal_32.c
> +++ b/arch/powerpc/kernel/signal_32.c
> @@ -489,19 +489,11 @@ static int save_user_regs(struct pt_regs *regs, struct mcontext __user *frame,
>    */
>   static int save_tm_user_regs(struct pt_regs *regs,
>   			     struct mcontext __user *frame,
> -			     struct mcontext __user *tm_frame, int sigret)
> +			     struct mcontext __user *tm_frame, int sigret,
> +			     unsigned long msr)
>   {
> -	unsigned long msr = regs->msr;
> -
>   	WARN_ON(tm_suspend_disabled);
>   
> -	/* Remove TM bits from thread's MSR.  The MSR in the sigcontext
> -	 * just indicates to userland that we were doing a transaction, but we
> -	 * don't want to return in transactional state.  This also ensures
> -	 * that flush_fp_to_thread won't set TIF_RESTORE_TM again.
> -	 */
> -	regs->msr &= ~MSR_TS_MASK;
> -
>   	/* Save both sets of general registers */
>   	if (save_general_regs(&current->thread.ckpt_regs, frame)
>   	    || save_general_regs(regs, tm_frame))
> @@ -912,6 +904,8 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
>   	int sigret;
>   	unsigned long tramp;
>   	struct pt_regs *regs = tsk->thread.regs;
> +	/* Save the thread's msr before get_tm_stackpointer() changes it */
> +	unsigned long msr = regs->msr;
>   
>   	BUG_ON(tsk != current);
>   
> @@ -944,13 +938,13 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
>   
>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>   	tm_frame = &rt_sf->uc_transact.uc_mcontext;
> -	if (MSR_TM_ACTIVE(regs->msr)) {
> +	if (MSR_TM_ACTIVE(msr)) {
>   		if (__put_user((unsigned long)&rt_sf->uc_transact,
>   			       &rt_sf->uc.uc_link) ||
>   		    __put_user((unsigned long)tm_frame,
>   			       &rt_sf->uc_transact.uc_regs))
>   			goto badframe;
> -		if (save_tm_user_regs(regs, frame, tm_frame, sigret))
> +		if (save_tm_user_regs(regs, frame, tm_frame, sigret, msr))
>   			goto badframe;
>   	}
>   	else
> @@ -1369,6 +1363,8 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
>   	int sigret;
>   	unsigned long tramp;
>   	struct pt_regs *regs = tsk->thread.regs;
> +	/* Save the thread's msr before get_tm_stackpointer() changes it */
> +	unsigned long msr = regs->msr;
>   
>   	BUG_ON(tsk != current);
>   
> @@ -1402,9 +1398,9 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
>   
>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>   	tm_mctx = &frame->mctx_transact;
> -	if (MSR_TM_ACTIVE(regs->msr)) {
> +	if (MSR_TM_ACTIVE(msr)) {
>   		if (save_tm_user_regs(regs, &frame->mctx, &frame->mctx_transact,
> -				      sigret))
> +				      sigret, msr))
>   			goto badframe;
>   	}
>   	else
> diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
> index 117515564ec7..e5b5f9738056 100644
> --- a/arch/powerpc/kernel/signal_64.c
> +++ b/arch/powerpc/kernel/signal_64.c
> @@ -192,7 +192,8 @@ static long setup_sigcontext(struct sigcontext __user *sc,
>   static long setup_tm_sigcontexts(struct sigcontext __user *sc,
>   				 struct sigcontext __user *tm_sc,
>   				 struct task_struct *tsk,
> -				 int signr, sigset_t *set, unsigned long handler)
> +				 int signr, sigset_t *set, unsigned long handler,
> +				 unsigned long msr)
>   {
>   	/* When CONFIG_ALTIVEC is set, we _always_ setup v_regs even if the
>   	 * process never used altivec yet (MSR_VEC is zero in pt_regs of
> @@ -207,12 +208,11 @@ static long setup_tm_sigcontexts(struct sigcontext __user *sc,
>   	elf_vrreg_t __user *tm_v_regs = sigcontext_vmx_regs(tm_sc);
>   #endif
>   	struct pt_regs *regs = tsk->thread.regs;
> -	unsigned long msr = tsk->thread.regs->msr;
>   	long err = 0;
>   
>   	BUG_ON(tsk != current);
>   
> -	BUG_ON(!MSR_TM_ACTIVE(regs->msr));
> +	BUG_ON(!MSR_TM_ACTIVE(msr));
>   
>   	WARN_ON(tm_suspend_disabled);
>   
> @@ -222,13 +222,6 @@ static long setup_tm_sigcontexts(struct sigcontext __user *sc,
>   	 */
>   	msr |= tsk->thread.ckpt_regs.msr & (MSR_FP | MSR_VEC | MSR_VSX);
>   
> -	/* Remove TM bits from thread's MSR.  The MSR in the sigcontext
> -	 * just indicates to userland that we were doing a transaction, but we
> -	 * don't want to return in transactional state.  This also ensures
> -	 * that flush_fp_to_thread won't set TIF_RESTORE_TM again.
> -	 */
> -	regs->msr &= ~MSR_TS_MASK;
> -
>   #ifdef CONFIG_ALTIVEC
>   	err |= __put_user(v_regs, &sc->v_regs);
>   	err |= __put_user(tm_v_regs, &tm_sc->v_regs);
> @@ -824,6 +817,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
>   	unsigned long newsp = 0;
>   	long err = 0;
>   	struct pt_regs *regs = tsk->thread.regs;
> +	/* Save the thread's msr before get_tm_stackpointer() changes it */
> +	unsigned long msr = regs->msr;
>   
>   	BUG_ON(tsk != current);
>   
> @@ -841,7 +836,7 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
>   	err |= __put_user(0, &frame->uc.uc_flags);
>   	err |= __save_altstack(&frame->uc.uc_stack, regs->gpr[1]);
>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> -	if (MSR_TM_ACTIVE(regs->msr)) {
> +	if (MSR_TM_ACTIVE(msr)) {
>   		/* The ucontext_t passed to userland points to the second
>   		 * ucontext_t (for transactional state) with its uc_link ptr.
>   		 */
> @@ -849,7 +844,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
>   		err |= setup_tm_sigcontexts(&frame->uc.uc_mcontext,
>   					    &frame->uc_transact.uc_mcontext,
>   					    tsk, ksig->sig, NULL,
> -					    (unsigned long)ksig->ka.sa.sa_handler);
> +					    (unsigned long)ksig->ka.sa.sa_handler,
> +					    msr);
>   	} else
>   #endif
>   	{
> 

The change needs to be improved in case CONFIG_PPC_TRANSACTIONAL_MEM=n, like:

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 132a092cd170..1b090a76b444 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -904,8 +904,10 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
         int sigret;
         unsigned long tramp;
         struct pt_regs *regs = tsk->thread.regs;
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
         /* Save the thread's msr before get_tm_stackpointer() changes it */
         unsigned long msr = regs->msr;
+#endif
  
         BUG_ON(tsk != current);
  
@@ -1363,8 +1365,10 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
         int sigret;
         unsigned long tramp;
         struct pt_regs *regs = tsk->thread.regs;
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
         /* Save the thread's msr before get_tm_stackpointer() changes it */
         unsigned long msr = regs->msr;
+#endif
  
         BUG_ON(tsk != current);
  
diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index e5b5f9738056..84ed2e77ef9c 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -817,8 +817,10 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
         unsigned long newsp = 0;
         long err = 0;
         struct pt_regs *regs = tsk->thread.regs;
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
         /* Save the thread's msr before get_tm_stackpointer() changes it */
         unsigned long msr = regs->msr;
+#endif
  
         BUG_ON(tsk != current);

or -Werror=unused-variable will catch it like:

/linux/arch/powerpc/kernel/signal_32.c: In function 'handle_rt_signal32':
/linux/arch/powerpc/kernel/signal_32.c:908:16: error: unused variable 'msr' [-Werror=unused-variable]
   908 |  unsigned long msr = regs->msr;
       |                ^~~
/linux/arch/powerpc/kernel/signal_32.c: In function 'handle_signal32':
/linux/arch/powerpc/kernel/signal_32.c:1367:16: error: unused variable 'msr' [-Werror=unused-variable]
  1367 |  unsigned long msr = regs->msr;
       |


Feel free to send a v2 only after Mikey's review.

Otherwise, LGTM.

Reviewed-by: Gustavo Romero <gromero@linux.ibm.com>

Best regards,
Gustavo
