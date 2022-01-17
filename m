Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 619B44905C0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 11:13:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jcnn11bmGz30NG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 21:13:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m8iw5Obf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=m8iw5Obf; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jcl1c2TnHz2xBl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 19:09:39 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20H7v0Jq013750; 
 Mon, 17 Jan 2022 08:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=nabnLZC8XNmDFEu11N1RQhCM+L6pC38gDhUBljhGWME=;
 b=m8iw5Obfi/aX5CQ4AqZVyykvpDvAAtrOE3XGFuPktDDgGlZCFLwcpRa7HLhsl8DnoG4K
 U4igVw09upVbLcbRJUXnswTrk1MzrkyfNbRXJ9LBq35TgYnMGCSXAwLWmHnLjiSfvFsq
 ysjt4Nhjz2X4XO+8AyFtTmCK9lYa5DsrN5Ym/E442MUNihf5FqJ/0nFcaVlIoGWAS4Nr
 2FFdlmDPYSbDWlkC8664YdR0HxZvUpVaiNCjjo3343jJStSbhdj8TevJw5xmd8qEZO/9
 5kUJhBBVMooc8WpkcLG2x6rzNYJJfBtKuIJTmOV0eEMrjszb+6VR2+WGkDqbRCDk+nyr lA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dn4h1g7fa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 08:09:33 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20H89XN8027941;
 Mon, 17 Jan 2022 08:09:33 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dn4h1g7ex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 08:09:33 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20H88Dqw015795;
 Mon, 17 Jan 2022 08:09:31 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 3dknw8rqty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 08:09:31 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20H89TqK29360432
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jan 2022 08:09:29 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00225A4066;
 Mon, 17 Jan 2022 08:09:29 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E94AA4054;
 Mon, 17 Jan 2022 08:09:27 +0000 (GMT)
Received: from [9.43.43.186] (unknown [9.43.43.186])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Jan 2022 08:09:26 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------m5AKgIjHf84MK4B9K61QyB4W"
Message-ID: <76e1e545-e8d1-43cf-3943-2db837ec8713@linux.ibm.com>
Date: Mon, 17 Jan 2022 13:39:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 1/2] powerpc/mce: Avoid using irq_work_queue() in
 realmode
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20211124095500.98656-1-ganeshgr@linux.ibm.com>
 <1637757546.z3bufxuoab.astroid@bobo.none>
From: Ganesh <ganeshgr@linux.ibm.com>
In-Reply-To: <1637757546.z3bufxuoab.astroid@bobo.none>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6asOnJI0wyWBktJopgbvmRGsqPBjPZVb
X-Proofpoint-GUID: XjERTGN9APdcWE_1D_xrnxlDoZrBHbCl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_02,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201170052
X-Mailman-Approved-At: Mon, 17 Jan 2022 21:13:18 +1100
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
Cc: mahesh@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------m5AKgIjHf84MK4B9K61QyB4W
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/21 18:33, Nicholas Piggin wrote:

> Excerpts from Ganesh Goudar's message of November 24, 2021 7:54 pm:
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
>> Signed-off-by: Ganesh Goudar<ganeshgr@linux.ibm.com>
>> ---
>> V2:
>> * Use arch_irq_work_raise to raise decrementer interrupt.
>> * Avoid having atomic variable.
>>
>> V3:
>> * Fix build error.
>>    Reported by kernel test bot.
>> ---
>>   arch/powerpc/include/asm/machdep.h       |  2 +
>>   arch/powerpc/include/asm/mce.h           |  2 +
>>   arch/powerpc/include/asm/paca.h          |  1 +
>>   arch/powerpc/kernel/mce.c                | 51 +++++++++++-------------
>>   arch/powerpc/kernel/time.c               |  3 ++
>>   arch/powerpc/platforms/pseries/pseries.h |  1 +
>>   arch/powerpc/platforms/pseries/ras.c     | 31 +-------------
>>   arch/powerpc/platforms/pseries/setup.c   |  1 +
>>   8 files changed, 34 insertions(+), 58 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
>> index 9c3c9f04129f..d22b222ba471 100644
>> --- a/arch/powerpc/include/asm/machdep.h
>> +++ b/arch/powerpc/include/asm/machdep.h
>> @@ -99,6 +99,8 @@ struct machdep_calls {
>>   	/* Called during machine check exception to retrive fixup address. */
>>   	bool		(*mce_check_early_recovery)(struct pt_regs *regs);
>>   
>> +	void            (*machine_check_log_err)(void);
>> +
>>   	/* Motherboard/chipset features. This is a kind of general purpose
>>   	 * hook used to control some machine specific features (like reset
>>   	 * lines, chip power control, etc...).
>> diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
>> index 331d944280b8..6e306aaf58aa 100644
>> --- a/arch/powerpc/include/asm/mce.h
>> +++ b/arch/powerpc/include/asm/mce.h
>> @@ -235,8 +235,10 @@ extern void machine_check_print_event_info(struct machine_check_event *evt,
>>   unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr);
>>   extern void mce_common_process_ue(struct pt_regs *regs,
>>   				  struct mce_error_info *mce_err);
>> +void machine_check_raise_dec_intr(void);
>>   int mce_register_notifier(struct notifier_block *nb);
>>   int mce_unregister_notifier(struct notifier_block *nb);
>> +void mce_run_late_handlers(void);
>>   #ifdef CONFIG_PPC_BOOK3S_64
>>   void flush_and_reload_slb(void);
>>   void flush_erat(void);
>> diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
>> index dc05a862e72a..d463c796f7fa 100644
>> --- a/arch/powerpc/include/asm/paca.h
>> +++ b/arch/powerpc/include/asm/paca.h
>> @@ -280,6 +280,7 @@ struct paca_struct {
>>   #endif
>>   #ifdef CONFIG_PPC_BOOK3S_64
>>   	struct mce_info *mce_info;
>> +	u32 mces_to_process;
>>   #endif /* CONFIG_PPC_BOOK3S_64 */
>>   } ____cacheline_aligned;
>>   
>> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
>> index fd829f7f25a4..8e17f29472a0 100644
>> --- a/arch/powerpc/kernel/mce.c
>> +++ b/arch/powerpc/kernel/mce.c
>> @@ -28,19 +28,9 @@
>>   
>>   #include "setup.h"
>>   
>> -static void machine_check_process_queued_event(struct irq_work *work);
>> -static void machine_check_ue_irq_work(struct irq_work *work);
>>   static void machine_check_ue_event(struct machine_check_event *evt);
>>   static void machine_process_ue_event(struct work_struct *work);
>>   
>> -static struct irq_work mce_event_process_work = {
>> -        .func = machine_check_process_queued_event,
>> -};
>> -
>> -static struct irq_work mce_ue_event_irq_work = {
>> -	.func = machine_check_ue_irq_work,
>> -};
>> -
>>   static DECLARE_WORK(mce_ue_event_work, machine_process_ue_event);
>>   
>>   static BLOCKING_NOTIFIER_HEAD(mce_notifier_list);
>> @@ -89,6 +79,12 @@ static void mce_set_error_info(struct machine_check_event *mce,
>>   	}
>>   }
>>   
>> +/* Raise decrementer interrupt */
>> +void machine_check_raise_dec_intr(void)
>> +{
>> +	arch_irq_work_raise();
>> +}
> It would be better if the name specifically related to irq work, which
> is more than just dec interrupt. It might be good to set mces_to_process
> here as well.

Sure

>
> I would name it something like mce_irq_work_queue, and the paca variable
> to mce_pending_irq_work...

Ok

>
>
>> +void mce_run_late_handlers(void)
>> +{
>> +	if (unlikely(local_paca->mces_to_process)) {
>> +		if (ppc_md.machine_check_log_err)
>> +			ppc_md.machine_check_log_err();
>> +		machine_check_process_queued_event();
>> +		machine_check_ue_work();
>> +		local_paca->mces_to_process--;
>> +	}
>> +}
> The problem with a counter is that you're clearing the irq work pending
> in the timer interrupt, so you'll never call in here again to clear that
> (until something else sets irq work).
>
> But as far as I can see it does not need to be a counter, just a flag.
> The machine check calls will process multiple events, right? (and the
> current irq_work queue does not queue the same work multiple times).

You are right, It can just be a flag.

>
> Oh. That's actually bad, isn't it? Our irq work should be per-CPU
> because the callbacks are mainly only operating on the local paca
> queued events, so we have a longstanding bug there AFAIKS. Your patch
> will solve it if everything is converted over.
>
>> +
>>   void machine_check_print_event_info(struct machine_check_event *evt,
>>   				    bool user_mode, bool in_guest)
>>   {
>> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
>> index cae8f03a44fe..94c591b6f9d2 100644
>> --- a/arch/powerpc/kernel/time.c
>> +++ b/arch/powerpc/kernel/time.c
>> @@ -594,6 +594,9 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
>>   
>>   	if (test_irq_work_pending()) {
>>   		clear_irq_work_pending();
>> +#ifdef CONFIG_PPC_BOOK3S_64
>> +		mce_run_late_handlers();
>> +#endif
> Maybe create a no-op inline function for others and call unconditionally
> here. I wonder if the name could be better, we have lots of handlers, of
> varying earliness. real-mode, then virt mode NMI context, then IRQ
> context, then workqueue context.
>
> mce_run_irq_context_handlers() might not be much better though.
>
>>   		irq_work_run();
>>   	}
>>   
>> diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
>> index 3544778e06d0..9cf0d33dfbf5 100644
>> --- a/arch/powerpc/platforms/pseries/pseries.h
>> +++ b/arch/powerpc/platforms/pseries/pseries.h
>> @@ -21,6 +21,7 @@ struct pt_regs;
>>   extern int pSeries_system_reset_exception(struct pt_regs *regs);
>>   extern int pSeries_machine_check_exception(struct pt_regs *regs);
>>   extern long pseries_machine_check_realmode(struct pt_regs *regs);
>> +void pSeries_machine_check_log_err(void);
>>   
>>   #ifdef CONFIG_SMP
>>   extern void smp_init_pseries(void);
>> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
>> index 56092dccfdb8..8613f9cc5798 100644
>> --- a/arch/powerpc/platforms/pseries/ras.c
>> +++ b/arch/powerpc/platforms/pseries/ras.c
>> @@ -23,11 +23,6 @@ static DEFINE_SPINLOCK(ras_log_buf_lock);
>>   
>>   static int ras_check_exception_token;
>>   
>> -static void mce_process_errlog_event(struct irq_work *work);
>> -static struct irq_work mce_errlog_process_work = {
>> -	.func = mce_process_errlog_event,
>> -};
>> -
>>   #define EPOW_SENSOR_TOKEN	9
>>   #define EPOW_SENSOR_INDEX	0
>>   
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
>>   
>>   /*
>>    * Process MCE rtas errlog event.
>>    */
>> -static void mce_process_errlog_event(struct irq_work *work)
>> +void pSeries_machine_check_log_err(void)
>>   {
>>   	struct rtas_error_log *err;
>>   
>> diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
>> index 8a62af5b9c24..9bdc487b8e35 100644
>> --- a/arch/powerpc/platforms/pseries/setup.c
>> +++ b/arch/powerpc/platforms/pseries/setup.c
>> @@ -1084,6 +1084,7 @@ define_machine(pseries) {
>>   	.system_reset_exception = pSeries_system_reset_exception,
>>   	.machine_check_early	= pseries_machine_check_realmode,
>>   	.machine_check_exception = pSeries_machine_check_exception,
>> +	.machine_check_log_err	= pSeries_machine_check_log_err,
>>   #ifdef CONFIG_KEXEC_CORE
>>   	.machine_kexec          = pSeries_machine_kexec,
>>   	.kexec_cpu_down         = pseries_kexec_cpu_down,
>> -- 
>> 2.31.1
>>
>>
--------------m5AKgIjHf84MK4B9K61QyB4W
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">
      <pre>On 11/24/21 18:33, Nicholas Piggin wrote:</pre>
    </div>
    <blockquote type="cite"
      cite="mid:1637757546.z3bufxuoab.astroid@bobo.none">
      <pre class="moz-quote-pre" wrap="">Excerpts from Ganesh Goudar's message of November 24, 2021 7:54 pm:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">In realmode mce handler we use irq_work_queue() to defer
the processing of mce events, irq_work_queue() can only
be called when translation is enabled because it touches
memory outside RMA, hence we enable translation before
calling irq_work_queue and disable on return, though it
is not safe to do in realmode.

To avoid this, program the decrementer and call the event
processing functions from timer handler.

Signed-off-by: Ganesh Goudar <a class="moz-txt-link-rfc2396E" href="mailto:ganeshgr@linux.ibm.com">&lt;ganeshgr@linux.ibm.com&gt;</a>
---
V2:
* Use arch_irq_work_raise to raise decrementer interrupt.
* Avoid having atomic variable.

V3:
* Fix build error.
  Reported by kernel test bot.
---
 arch/powerpc/include/asm/machdep.h       |  2 +
 arch/powerpc/include/asm/mce.h           |  2 +
 arch/powerpc/include/asm/paca.h          |  1 +
 arch/powerpc/kernel/mce.c                | 51 +++++++++++-------------
 arch/powerpc/kernel/time.c               |  3 ++
 arch/powerpc/platforms/pseries/pseries.h |  1 +
 arch/powerpc/platforms/pseries/ras.c     | 31 +-------------
 arch/powerpc/platforms/pseries/setup.c   |  1 +
 8 files changed, 34 insertions(+), 58 deletions(-)

diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index 9c3c9f04129f..d22b222ba471 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -99,6 +99,8 @@ struct machdep_calls {
 	/* Called during machine check exception to retrive fixup address. */
 	bool		(*mce_check_early_recovery)(struct pt_regs *regs);
 
+	void            (*machine_check_log_err)(void);
+
 	/* Motherboard/chipset features. This is a kind of general purpose
 	 * hook used to control some machine specific features (like reset
 	 * lines, chip power control, etc...).
diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
index 331d944280b8..6e306aaf58aa 100644
--- a/arch/powerpc/include/asm/mce.h
+++ b/arch/powerpc/include/asm/mce.h
@@ -235,8 +235,10 @@ extern void machine_check_print_event_info(struct machine_check_event *evt,
 unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr);
 extern void mce_common_process_ue(struct pt_regs *regs,
 				  struct mce_error_info *mce_err);
+void machine_check_raise_dec_intr(void);
 int mce_register_notifier(struct notifier_block *nb);
 int mce_unregister_notifier(struct notifier_block *nb);
+void mce_run_late_handlers(void);
 #ifdef CONFIG_PPC_BOOK3S_64
 void flush_and_reload_slb(void);
 void flush_erat(void);
diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index dc05a862e72a..d463c796f7fa 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -280,6 +280,7 @@ struct paca_struct {
 #endif
 #ifdef CONFIG_PPC_BOOK3S_64
 	struct mce_info *mce_info;
+	u32 mces_to_process;
 #endif /* CONFIG_PPC_BOOK3S_64 */
 } ____cacheline_aligned;
 
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index fd829f7f25a4..8e17f29472a0 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -28,19 +28,9 @@
 
 #include "setup.h"
 
-static void machine_check_process_queued_event(struct irq_work *work);
-static void machine_check_ue_irq_work(struct irq_work *work);
 static void machine_check_ue_event(struct machine_check_event *evt);
 static void machine_process_ue_event(struct work_struct *work);
 
-static struct irq_work mce_event_process_work = {
-        .func = machine_check_process_queued_event,
-};
-
-static struct irq_work mce_ue_event_irq_work = {
-	.func = machine_check_ue_irq_work,
-};
-
 static DECLARE_WORK(mce_ue_event_work, machine_process_ue_event);
 
 static BLOCKING_NOTIFIER_HEAD(mce_notifier_list);
@@ -89,6 +79,12 @@ static void mce_set_error_info(struct machine_check_event *mce,
 	}
 }
 
+/* Raise decrementer interrupt */
+void machine_check_raise_dec_intr(void)
+{
+	arch_irq_work_raise();
+}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It would be better if the name specifically related to irq work, which 
is more than just dec interrupt. It might be good to set mces_to_process
here as well.</pre>
    </blockquote>
    <pre>Sure</pre>
    <blockquote type="cite"
      cite="mid:1637757546.z3bufxuoab.astroid@bobo.none">
      <pre class="moz-quote-pre" wrap="">

I would name it something like mce_irq_work_queue, and the paca variable
to mce_pending_irq_work...</pre>
    </blockquote>
    <pre>Ok</pre>
    <blockquote type="cite"
      cite="mid:1637757546.z3bufxuoab.astroid@bobo.none">
      <pre class="moz-quote-pre" wrap="">


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+void mce_run_late_handlers(void)
+{
+	if (unlikely(local_paca-&gt;mces_to_process)) {
+		if (ppc_md.machine_check_log_err)
+			ppc_md.machine_check_log_err();
+		machine_check_process_queued_event();
+		machine_check_ue_work();
+		local_paca-&gt;mces_to_process--;
+	}
+}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The problem with a counter is that you're clearing the irq work pending
in the timer interrupt, so you'll never call in here again to clear that
(until something else sets irq work).

But as far as I can see it does not need to be a counter, just a flag.
The machine check calls will process multiple events, right? (and the
current irq_work queue does not queue the same work multiple times).</pre>
    </blockquote>
    <pre>You are right, It can just be a flag.</pre>
    <blockquote type="cite"
      cite="mid:1637757546.z3bufxuoab.astroid@bobo.none">
      <pre class="moz-quote-pre" wrap="">

Oh. That's actually bad, isn't it? Our irq work should be per-CPU
because the callbacks are mainly only operating on the local paca
queued events, so we have a longstanding bug there AFAIKS. Your patch
will solve it if everything is converted over.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
 void machine_check_print_event_info(struct machine_check_event *evt,
 				    bool user_mode, bool in_guest)
 {
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index cae8f03a44fe..94c591b6f9d2 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -594,6 +594,9 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
 
 	if (test_irq_work_pending()) {
 		clear_irq_work_pending();
+#ifdef CONFIG_PPC_BOOK3S_64
+		mce_run_late_handlers();
+#endif
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Maybe create a no-op inline function for others and call unconditionally 
here. I wonder if the name could be better, we have lots of handlers, of
varying earliness. real-mode, then virt mode NMI context, then IRQ 
context, then workqueue context.

mce_run_irq_context_handlers() might not be much better though.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 		irq_work_run();
 	}
 
diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
index 3544778e06d0..9cf0d33dfbf5 100644
--- a/arch/powerpc/platforms/pseries/pseries.h
+++ b/arch/powerpc/platforms/pseries/pseries.h
@@ -21,6 +21,7 @@ struct pt_regs;
 extern int pSeries_system_reset_exception(struct pt_regs *regs);
 extern int pSeries_machine_check_exception(struct pt_regs *regs);
 extern long pseries_machine_check_realmode(struct pt_regs *regs);
+void pSeries_machine_check_log_err(void);
 
 #ifdef CONFIG_SMP
 extern void smp_init_pseries(void);
diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index 56092dccfdb8..8613f9cc5798 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -23,11 +23,6 @@ static DEFINE_SPINLOCK(ras_log_buf_lock);
 
 static int ras_check_exception_token;
 
-static void mce_process_errlog_event(struct irq_work *work);
-static struct irq_work mce_errlog_process_work = {
-	.func = mce_process_errlog_event,
-};
-
 #define EPOW_SENSOR_TOKEN	9
 #define EPOW_SENSOR_INDEX	0
 
@@ -729,40 +724,16 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
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
-
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
 
 /*
  * Process MCE rtas errlog event.
  */
-static void mce_process_errlog_event(struct irq_work *work)
+void pSeries_machine_check_log_err(void)
 {
 	struct rtas_error_log *err;
 
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 8a62af5b9c24..9bdc487b8e35 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -1084,6 +1084,7 @@ define_machine(pseries) {
 	.system_reset_exception = pSeries_system_reset_exception,
 	.machine_check_early	= pseries_machine_check_realmode,
 	.machine_check_exception = pSeries_machine_check_exception,
+	.machine_check_log_err	= pSeries_machine_check_log_err,
 #ifdef CONFIG_KEXEC_CORE
 	.machine_kexec          = pSeries_machine_kexec,
 	.kexec_cpu_down         = pseries_kexec_cpu_down,
-- 
2.31.1


</pre>
      </blockquote>
    </blockquote>
  </body>
</html>
--------------m5AKgIjHf84MK4B9K61QyB4W--

