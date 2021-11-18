Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58724455948
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 11:41:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvxDt13jDz3c4X
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 21:41:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hIU4V0eF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hIU4V0eF; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hvvzc0FNwz2yTr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Nov 2021 20:45:15 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AI9ZjsO024625; 
 Thu, 18 Nov 2021 09:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=eE3wI+Gs94DGpQhNap5xQ+0wxT7G5pjnLwSraosgp1Y=;
 b=hIU4V0eFsSqYjJFrqvMDnZt3/5TeSeWFmofVgR9Rgnexhzr6OpgKZPEz4zk2uuTH8S9S
 +vi4aTT/Qt7gZVJq6IQsJKd5sryubrpyxatcaDF6kEotHxhg562WZcf7uh7LCPOwKHOu
 1e79oqn05pkQ9GITy3Im9JXZX1iM9ZbCcKW9n9IPM+CvnWyiFy1RO+kO+LBDlZIRyftd
 g9H2mYmQefo6NWydz01pkdEuQudIc2PYmkIpjXjj/eowuKfMkMpH7ID8IycmovquG+Er
 LXPcVv8sH/H8Rcqb7f+uA4n8EqTk8pX6sUD9LE871TDMVSEJqMO9dVJtnZa3K4zb1WfV 6g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cdgwu4pdh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 09:45:08 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AI9copB015272;
 Thu, 18 Nov 2021 09:45:07 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cdgwu4pct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 09:45:07 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AI9b8ih011968;
 Thu, 18 Nov 2021 09:45:05 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3ca50bkpmx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 09:45:04 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1AI9c5Xe48890256
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 09:38:05 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E8F04C046;
 Thu, 18 Nov 2021 09:45:02 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08F9F4C04E;
 Thu, 18 Nov 2021 09:45:00 +0000 (GMT)
Received: from [9.43.45.111] (unknown [9.43.45.111])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 18 Nov 2021 09:44:59 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------yjEXfbbQcnix4qciBJJlFEdn"
Message-ID: <0b5f58f1-1e03-e39f-fe85-0603088ec4dd@linux.ibm.com>
Date: Thu, 18 Nov 2021 15:14:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] powerpc/mce: Avoid using irq_work_queue() in realmode
Content-Language: en-US
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20211108083804.380142-1-ganeshgr@linux.ibm.com>
 <87lf1t3l0q.fsf@linkitivity.dja.id.au>
From: Ganesh <ganeshgr@linux.ibm.com>
In-Reply-To: <87lf1t3l0q.fsf@linkitivity.dja.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OZCWhgspcbw7nUFsVb9UAxn9DJwweSTq
X-Proofpoint-GUID: FE_RAqDBrvbmDdQW0-4Jb4_oUOsW5emX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-18_04,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 malwarescore=0 mlxlogscore=999 adultscore=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111180056
X-Mailman-Approved-At: Thu, 18 Nov 2021 21:41:12 +1100
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
Cc: mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------yjEXfbbQcnix4qciBJJlFEdn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/21 12:42, Daniel Axtens wrote:

>> In realmode mce handler we use irq_work_queue() to defer
>> the processing of mce events, irq_work_queue() can only
>> be called when translation is enabled because it touches
>> memory outside RMA, hence we enable translation before
>> calling irq_work_queue and disable on return, though it
>> is not safe to do in realmode.
>>
>> To avoid this, program the decrementer and call the event
>> processing functions from timer handler.
>>
> This is an interesting approach, and it would indeed be nice to clear up
> the MCE handling a bit.
>
> I have a few questions:
>
>> diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
>> index 331d944280b8..187810f13669 100644
>> --- a/arch/powerpc/include/asm/mce.h
>> +++ b/arch/powerpc/include/asm/mce.h
>> @@ -235,8 +235,10 @@ extern void machine_check_print_event_info(struct machine_check_event *evt,
>>   unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr);
>>   extern void mce_common_process_ue(struct pt_regs *regs,
>>   				  struct mce_error_info *mce_err);
>> +extern void machine_check_raise_dec_intr(void);
> Does this need an extern? I think that's the default...?

Not required, I will remove it.

>>   int mce_register_notifier(struct notifier_block *nb);
>>   int mce_unregister_notifier(struct notifier_block *nb);
>> +void mce_run_late_handlers(void);
>>   #ifdef CONFIG_PPC_BOOK3S_64
>>   void flush_and_reload_slb(void);
>>   void flush_erat(void);
>> diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
>> index dc05a862e72a..f49180f8c9be 100644
>> --- a/arch/powerpc/include/asm/paca.h
>> +++ b/arch/powerpc/include/asm/paca.h
>> @@ -280,6 +280,7 @@ struct paca_struct {
>>   #endif
>>   #ifdef CONFIG_PPC_BOOK3S_64
>>   	struct mce_info *mce_info;
>> +	atomic_t mces_to_process;
> This is in the PACA, which is supposed to be a per-cpu structure: hey
> does it need to be atomic_t? Isn't there only one CPU accessing it?

Yes it need not be atomic, got confused with some scenario and
made it atomic.

> Does this variable provide anything new compared to mce_nest_count or
> mce_queue_count + mce_ue_count? It looks like
> machine_check_process_queued_event will clear a queue based on value of
> mce_queue_count and machine_check_process_ue_event will clear a queue
> based on mce_ue_count...
>
> I think (absent nested interrupts which I talk about below) it should be
> the case that mces_to_process == mce_queue_count + mce_ue_count but I
> might be wrong?

If we hit exception in process context, we may not increment mce_queue_count,
so the equation need not be true all time.

>>   #endif /* CONFIG_PPC_BOOK3S_64 */
>>   } ____cacheline_aligned;
>    
>>   /*
>>    * Decode and save high level MCE information into per cpu buffer which
>>    * is an array of machine_check_event structure.
>> @@ -135,6 +131,8 @@ void save_mce_event(struct pt_regs *regs, long handled,
>>   	if (mce->error_type == MCE_ERROR_TYPE_UE)
>>   		mce->u.ue_error.ignore_event = mce_err->ignore_event;
>>   
>> +	atomic_inc(&local_paca->mces_to_process);
>> +
> Is there any chance the decrementer will fire between when you do this
> atomic_inc() and when you finish adding all the information to the mce
> data structure in the remainder of save_mce_event? (e.g. filling in the
> tlb_errror.effective_address field)?
>
> (Or does save_mce_event get called with interrupts masked? I find it
> very hard to remember what parts of the MCE code path happen under what
> circumstances!)

Yes, Interrupts will be disabled, I mean MSR[EE]=0 when mce is being handled.

>>   	if (!addr)
>>   		return;
>>   
>
>> @@ -338,7 +322,7 @@ static void machine_process_ue_event(struct work_struct *work)
>>    * process pending MCE event from the mce event queue. This function will be
>>    * called during syscall exit.
> Is this comment still accurate if this patch is applied?

No, mpe has also pointed this out, we will clean it in a different patch.

>
>>    */
>> -static void machine_check_process_queued_event(struct irq_work *work)
>> +static void machine_check_process_queued_event(void)
>>   {
>>   	int index;
>>   	struct machine_check_event *evt;
>> @@ -363,6 +347,17 @@ static void machine_check_process_queued_event(struct irq_work *work)
>>   	}
>>   }
>>   
>> +void mce_run_late_handlers(void)
>> +{
>> +	if (unlikely(atomic_read(&local_paca->mces_to_process))) {
>> +		if (ppc_md.machine_check_log_err)
>> +			ppc_md.machine_check_log_err();
>> +		machine_check_process_queued_event();
>> +		machine_check_ue_work();
>> +		atomic_dec(&local_paca->mces_to_process);
>> +	}
>> +}
> What happens if you get a nested MCE between log_err() and
> process_queued_event()? If my very foggy memory of the MCE handling is
> correct, we enable nested MCEs very early in the process because the
> alternative is that a nested MCE will checkstop the box. So I think this
> might be possible, albeit probably unlikely.
>
> It looks like process_queued_event clears the entire MCE queue as
> determined by the mce_queue_count. So, consider the following sequence
> of events:
>
> 1. Take MCE 1. Save to queue, increment mce_queue_count, increment
>     mces_to_process, set decrementer to fire.
>
> 2. Decrementer fires. mce_run_late_handlers is called.
>
> 3. mces_to_process = 1, so we call machine_check_log_err(), which prints
>     (on pseries) the info for MCE 1.
>
> 4. Take MCE 2. This is saved to the queue, mce_queue_count is
>     incremented, mces_to_process is incremented, and the decrementer is
>     armed again.
>
> 5. We then leave the MCE interrupt context and return to the decrementer
>     handling context. The next thing we do is we call
>     m_c_e_process_queued_event(), which clears the entire queue (that is,
>     MCEs 1 and 2):
>
> 	while (local_paca->mce_info->mce_queue_count > 0) {
> 		index = local_paca->mce_info->mce_queue_count - 1;
> 		evt = &local_paca->mce_info->mce_event_queue[index];
>
> 		if (evt->error_type == MCE_ERROR_TYPE_UE &&
> 		    evt->u.ue_error.ignore_event) {
> 			local_paca->mce_info->mce_queue_count--;
> 			continue;
> 		}
> 		machine_check_print_event_info(evt, false, false);
> 		local_paca->mce_info->mce_queue_count--;
> 	}
>
>   6. We finish mce_run_late_handlers() and decrement mces_to_process,
>      so it's now 1.
>
>   7. The decrementer fires again, mces_to_process is 1, so we start
>      processing again.
>
>   8. We call machine_check_log_err again, it will now call the FWNMI code
>      again and possibly print error 2.
>
>   9. process_queued_event will be called again but mce_queue_count will
>      be 0 so it it will bail out early.
>
> I _think_ the worst that can happen - at least so long as pseries is the
> only implementaion of machine_check_log_err - is that we will handle
> MCE 2 before we query the firmware about it. That's probably benign, but
> I am still concerned with the overall interaction around nested
> interrupts.

The only problem we have here is overwriting mce_data_buf in case of nested
mce, and about "handle MCE 2 before we query the firmware about it" It is not
possible, isn't it?

Assume we take MCE 2 while we are in the middle of mce_run_late_handlers(),
before the MCE handler relinquishes the CPU to timer handler, we will have
everything in place, right? or am I missing something obvious.

>>   void machine_check_print_event_info(struct machine_check_event *evt,
>>   				    bool user_mode, bool in_guest)
>>   {
>> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
>> index 934d8ae66cc6..2dc09d75d77c 100644
>> --- a/arch/powerpc/kernel/time.c
>> +++ b/arch/powerpc/kernel/time.c
>> @@ -597,6 +597,9 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
>>   		irq_work_run();
>>   	}
>>   
>> +#ifdef CONFIG_PPC_BOOK3S_64
>> +	mce_run_late_handlers();
>> +#endif
>>
> So we're now branching to a function in a different file and doing an
> atomic read in every timer interrupt. Is this a hot path? Is there any
> speed implication to doing this?

Nick has suggested me to use test_irq_work_pending() and I will remove the
atomic read, with v2 we may not have any serious time implications.

>>   	now = get_tb();
>>   	if (now >= *next_tb) {
>>   		*next_tb = ~(u64)0;
>
>> @@ -729,40 +724,16 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
>>   	error_type = mce_log->error_type;
>>   
>>   	disposition = mce_handle_err_realmode(disposition, error_type);
>> -
>> -	/*
>> -	 * Enable translation as we will be accessing per-cpu variables
>> -	 * in save_mce_event() which may fall outside RMO region, also
>> -	 * leave it enabled because subsequently we will be queuing work
>> -	 * to workqueues where again per-cpu variables accessed, besides
>> -	 * fwnmi_release_errinfo() crashes when called in realmode on
>> -	 * pseries.
>> -	 * Note: All the realmode handling like flushing SLB entries for
>> -	 *       SLB multihit is done by now.
>> -	 */
>>   out:
>> -	msr = mfmsr();
>> -	mtmsr(msr | MSR_IR | MSR_DR);
>> -
>>   	disposition = mce_handle_err_virtmode(regs, errp, mce_log,
>>   					      disposition);
> Now you are not in virtual mode/translations on when you are calling
> mce_handle_err_virtmode(). From the name, I thought that
> mce_handle_err_virtmode() would assume that you are in virtual mode?
> Does the function assume that? If so is it safe to call it in real mode?
> If not, should we rename it as part of this patch?

patch 2/2, refactors this.

>> -
>> -	/*
>> -	 * Queue irq work to log this rtas event later.
>> -	 * irq_work_queue uses per-cpu variables, so do this in virt
>> -	 * mode as well.
>> -	 */
>> -	irq_work_queue(&mce_errlog_process_work);
>> -
>> -	mtmsr(msr);
>> -
>>   	return disposition;
>>   }

Thanks for the review :) .
Ganesh

--------------yjEXfbbQcnix4qciBJJlFEdn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">
      <pre class="moz-quote-pre" wrap="">On 11/12/21 12:42, Daniel Axtens wrote:
</pre>
    </div>
    <blockquote type="cite"
      cite="mid:87lf1t3l0q.fsf@linkitivity.dja.id.au">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">In realmode mce handler we use irq_work_queue() to defer
the processing of mce events, irq_work_queue() can only
be called when translation is enabled because it touches
memory outside RMA, hence we enable translation before
calling irq_work_queue and disable on return, though it
is not safe to do in realmode.

To avoid this, program the decrementer and call the event
processing functions from timer handler.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This is an interesting approach, and it would indeed be nice to clear up
the MCE handling a bit.

I have a few questions:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
index 331d944280b8..187810f13669 100644
--- a/arch/powerpc/include/asm/mce.h
+++ b/arch/powerpc/include/asm/mce.h
@@ -235,8 +235,10 @@ extern void machine_check_print_event_info(struct machine_check_event *evt,
 unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr);
 extern void mce_common_process_ue(struct pt_regs *regs,
 				  struct mce_error_info *mce_err);
+extern void machine_check_raise_dec_intr(void);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Does this need an extern? I think that's the default...?</pre>
    </blockquote>
    <pre>Not required, I will remove it.
</pre>
    <blockquote type="cite"
      cite="mid:87lf1t3l0q.fsf@linkitivity.dja.id.au">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> int mce_register_notifier(struct notifier_block *nb);
 int mce_unregister_notifier(struct notifier_block *nb);
+void mce_run_late_handlers(void);
 #ifdef CONFIG_PPC_BOOK3S_64
 void flush_and_reload_slb(void);
 void flush_erat(void);
diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index dc05a862e72a..f49180f8c9be 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -280,6 +280,7 @@ struct paca_struct {
 #endif
 #ifdef CONFIG_PPC_BOOK3S_64
 	struct mce_info *mce_info;
+	atomic_t mces_to_process;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This is in the PACA, which is supposed to be a per-cpu structure: hey
does it need to be atomic_t? Isn't there only one CPU accessing it?</pre>
    </blockquote>
    <pre>Yes it need not be atomic, got confused with some scenario and
made it atomic.
</pre>
    <blockquote type="cite"
      cite="mid:87lf1t3l0q.fsf@linkitivity.dja.id.au">
      <pre class="moz-quote-pre" wrap="">Does this variable provide anything new compared to mce_nest_count or
mce_queue_count + mce_ue_count? It looks like
machine_check_process_queued_event will clear a queue based on value of
mce_queue_count and machine_check_process_ue_event will clear a queue
based on mce_ue_count...

I think (absent nested interrupts which I talk about below) it should be
the case that mces_to_process == mce_queue_count + mce_ue_count but I
might be wrong?</pre>
    </blockquote>
    <pre>If we hit exception in process context, we may not increment mce_queue_count,
so the equation need not be true all time. 
</pre>
    <blockquote type="cite"
      cite="mid:87lf1t3l0q.fsf@linkitivity.dja.id.au">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> #endif /* CONFIG_PPC_BOOK3S_64 */
 } ____cacheline_aligned;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
  
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> /*
  * Decode and save high level MCE information into per cpu buffer which
  * is an array of machine_check_event structure.
@@ -135,6 +131,8 @@ void save_mce_event(struct pt_regs *regs, long handled,
 	if (mce-&gt;error_type == MCE_ERROR_TYPE_UE)
 		mce-&gt;u.ue_error.ignore_event = mce_err-&gt;ignore_event;
 
+	atomic_inc(&amp;local_paca-&gt;mces_to_process);
+
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Is there any chance the decrementer will fire between when you do this
atomic_inc() and when you finish adding all the information to the mce
data structure in the remainder of save_mce_event? (e.g. filling in the
tlb_errror.effective_address field)?

(Or does save_mce_event get called with interrupts masked? I find it
very hard to remember what parts of the MCE code path happen under what
circumstances!)</pre>
    </blockquote>
    <pre>Yes, Interrupts will be disabled, I mean MSR[EE]=0 when mce is being handled. </pre>
    <blockquote type="cite"
      cite="mid:87lf1t3l0q.fsf@linkitivity.dja.id.au">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 	if (!addr)
 		return;
 
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">@@ -338,7 +322,7 @@ static void machine_process_ue_event(struct work_struct *work)
  * process pending MCE event from the mce event queue. This function will be
  * called during syscall exit.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Is this comment still accurate if this patch is applied?</pre>
    </blockquote>
    <pre>No, mpe has also pointed this out, we will clean it in a different patch.
</pre>
    <blockquote type="cite"
      cite="mid:87lf1t3l0q.fsf@linkitivity.dja.id.au">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">  */
-static void machine_check_process_queued_event(struct irq_work *work)
+static void machine_check_process_queued_event(void)
 {
 	int index;
 	struct machine_check_event *evt;
@@ -363,6 +347,17 @@ static void machine_check_process_queued_event(struct irq_work *work)
 	}
 }
 
+void mce_run_late_handlers(void)
+{
+	if (unlikely(atomic_read(&amp;local_paca-&gt;mces_to_process))) {
+		if (ppc_md.machine_check_log_err)
+			ppc_md.machine_check_log_err();
+		machine_check_process_queued_event();
+		machine_check_ue_work();
+		atomic_dec(&amp;local_paca-&gt;mces_to_process);
+	}
+}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What happens if you get a nested MCE between log_err() and
process_queued_event()? If my very foggy memory of the MCE handling is
correct, we enable nested MCEs very early in the process because the
alternative is that a nested MCE will checkstop the box. So I think this
might be possible, albeit probably unlikely.

It looks like process_queued_event clears the entire MCE queue as
determined by the mce_queue_count. So, consider the following sequence
of events:

1. Take MCE 1. Save to queue, increment mce_queue_count, increment
   mces_to_process, set decrementer to fire.

2. Decrementer fires. mce_run_late_handlers is called.

3. mces_to_process = 1, so we call machine_check_log_err(), which prints
   (on pseries) the info for MCE 1.

4. Take MCE 2. This is saved to the queue, mce_queue_count is
   incremented, mces_to_process is incremented, and the decrementer is
   armed again.

5. We then leave the MCE interrupt context and return to the decrementer
   handling context. The next thing we do is we call
   m_c_e_process_queued_event(), which clears the entire queue (that is,
   MCEs 1 and 2):

	while (local_paca-&gt;mce_info-&gt;mce_queue_count &gt; 0) {
		index = local_paca-&gt;mce_info-&gt;mce_queue_count - 1;
		evt = &amp;local_paca-&gt;mce_info-&gt;mce_event_queue[index];

		if (evt-&gt;error_type == MCE_ERROR_TYPE_UE &amp;&amp;
		    evt-&gt;u.ue_error.ignore_event) {
			local_paca-&gt;mce_info-&gt;mce_queue_count--;
			continue;
		}
		machine_check_print_event_info(evt, false, false);
		local_paca-&gt;mce_info-&gt;mce_queue_count--;
	}

 6. We finish mce_run_late_handlers() and decrement mces_to_process,
    so it's now 1.

 7. The decrementer fires again, mces_to_process is 1, so we start
    processing again.

 8. We call machine_check_log_err again, it will now call the FWNMI code
    again and possibly print error 2.

 9. process_queued_event will be called again but mce_queue_count will
    be 0 so it it will bail out early.

I _think_ the worst that can happen - at least so long as pseries is the
only implementaion of machine_check_log_err - is that we will handle
MCE 2 before we query the firmware about it. That's probably benign, but
I am still concerned with the overall interaction around nested
interrupts.</pre>
    </blockquote>
    <pre>The only problem we have here is overwriting mce_data_buf in case of nested
mce, and about "handle MCE 2 before we query the firmware about it" It is not
possible, isn't it?

Assume we take MCE 2 while we are in the middle of mce_run_late_handlers(),
before the MCE handler relinquishes the CPU to timer handler, we will have
everything in place, right? or am I missing something obvious.    
</pre>
    <blockquote type="cite"
      cite="mid:87lf1t3l0q.fsf@linkitivity.dja.id.au">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> void machine_check_print_event_info(struct machine_check_event *evt,
 				    bool user_mode, bool in_guest)
 {
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 934d8ae66cc6..2dc09d75d77c 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -597,6 +597,9 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
 		irq_work_run();
 	}
 
+#ifdef CONFIG_PPC_BOOK3S_64
+	mce_run_late_handlers();
+#endif

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">So we're now branching to a function in a different file and doing an
atomic read in every timer interrupt. Is this a hot path? Is there any
speed implication to doing this?</pre>
    </blockquote>
    <pre>Nick has suggested me to use test_irq_work_pending() and I will remove the
atomic read, with v2 we may not have any serious time implications. 
</pre>
    <blockquote type="cite"
      cite="mid:87lf1t3l0q.fsf@linkitivity.dja.id.au">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 	now = get_tb();
 	if (now &gt;= *next_tb) {
 		*next_tb = ~(u64)0;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">@@ -729,40 +724,16 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
 	error_type = mce_log-&gt;error_type;
 
 	disposition = mce_handle_err_realmode(disposition, error_type);
-
-	/*
-	 * Enable translation as we will be accessing per-cpu variables
-	 * in save_mce_event() which may fall outside RMO region, also
-	 * leave it enabled because subsequently we will be queuing work
-	 * to workqueues where again per-cpu variables accessed, besides
-	 * fwnmi_release_errinfo() crashes when called in realmode on
-	 * pseries.
-	 * Note: All the realmode handling like flushing SLB entries for
-	 *       SLB multihit is done by now.
-	 */
 out:
-	msr = mfmsr();
-	mtmsr(msr | MSR_IR | MSR_DR);
-
 	disposition = mce_handle_err_virtmode(regs, errp, mce_log,
 					      disposition);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Now you are not in virtual mode/translations on when you are calling
mce_handle_err_virtmode(). From the name, I thought that
mce_handle_err_virtmode() would assume that you are in virtual mode?
Does the function assume that? If so is it safe to call it in real mode?
If not, should we rename it as part of this patch?</pre>
    </blockquote>
    <pre>patch 2/2, refactors this.
</pre>
    <blockquote type="cite"
      cite="mid:87lf1t3l0q.fsf@linkitivity.dja.id.au">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">-
-	/*
-	 * Queue irq work to log this rtas event later.
-	 * irq_work_queue uses per-cpu variables, so do this in virt
-	 * mode as well.
-	 */
-	irq_work_queue(&amp;mce_errlog_process_work);
-
-	mtmsr(msr);
-
 	return disposition;
 }
</pre>
      </blockquote>
    </blockquote>
    <pre>Thanks for the review :) .
Ganesh
</pre>
  </body>
</html>
--------------yjEXfbbQcnix4qciBJJlFEdn--

