Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB3E45594A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 11:42:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvxFh6Lx6z3bnG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 21:42:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dRvI1qz9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dRvI1qz9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hvw753RQmz2yNr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Nov 2021 20:51:45 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AI8gnGQ013748; 
 Thu, 18 Nov 2021 09:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=rxmAuZYDz2Ri3zwNe73Amha4VnvmwwUmEHfbDIT3ZOE=;
 b=dRvI1qz9Y8HgYYZJ0h9lknDKSdBKqdOMM30/6UNIlhAF2cXFOJ3A228ANkrxwdliVWJV
 sUfrjLwiADbNydc0iX6WM0St4DaOS42XwTVQ6p4gk3eDIrhiHJdtqTJwyAohLzN8xvIk
 wTrVKHKpafWOmne89ymQ0OkiQVJa1/hSOR7TxZMHzIAirda3y/8uEsd+DqTuoamHb44x
 HE22YLmJRxGg38FHci8WvdqjO4U6rWoeYjhZCIwNpDR/+5vhH/HDx3HDfL/bZzUtniST
 YI8xPcECyR5YYMpr2W8X61GkL/3SF62Sltm6UlZwpaql4JqST9BP80K+HbOi5huMNWz8 bA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cdkj51em7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 09:51:40 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AI9p4ia030973;
 Thu, 18 Nov 2021 09:51:39 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cdkj51ekk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 09:51:39 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AI9nJH4028233;
 Thu, 18 Nov 2021 09:51:37 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3ca50akt0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 09:51:36 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1AI9ibL159834652
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 09:44:37 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A31B94C050;
 Thu, 18 Nov 2021 09:51:34 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD68E4C044;
 Thu, 18 Nov 2021 09:51:32 +0000 (GMT)
Received: from [9.43.45.111] (unknown [9.43.45.111])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 18 Nov 2021 09:51:32 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------M9IUuI0J2Axk3RN0un1CzNGx"
Message-ID: <c74e4fb4-6d3a-deb7-9591-60cda61f1e33@linux.ibm.com>
Date: Thu, 18 Nov 2021 15:21:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] powerpc/mce: Avoid using irq_work_queue() in realmode
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20211108083804.380142-1-ganeshgr@linux.ibm.com>
 <1636380442.sna3yrbwu3.astroid@bobo.none>
From: Ganesh <ganeshgr@linux.ibm.com>
In-Reply-To: <1636380442.sna3yrbwu3.astroid@bobo.none>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: anKzJGQMG_q28Gnjpy8BBRTUqWCOPXUw
X-Proofpoint-GUID: qwO7hJYcqhRhgbKaNefdX3k2j1pzePwf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-18_04,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------M9IUuI0J2Axk3RN0un1CzNGx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/8/21 19:49, Nicholas Piggin wrote:

> Excerpts from Ganesh Goudar's message of November 8, 2021 6:38 pm:
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
>> index 764f2732a821..c89cc03c0f97 100644
>> --- a/arch/powerpc/include/asm/machdep.h
>> +++ b/arch/powerpc/include/asm/machdep.h
>> @@ -103,6 +103,8 @@ struct machdep_calls {
>>   	/* Called during machine check exception to retrive fixup address. */
>>   	bool		(*mce_check_early_recovery)(struct pt_regs *regs);
>>   
>> +	void            (*machine_check_log_err)(void);
>> +
>>   	/* Motherboard/chipset features. This is a kind of general purpose
>>   	 * hook used to control some machine specific features (like reset
>>   	 * lines, chip power control, etc...).
>> diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
>> index 331d944280b8..187810f13669 100644
>> --- a/arch/powerpc/include/asm/mce.h
>> +++ b/arch/powerpc/include/asm/mce.h
>> @@ -235,8 +235,10 @@ extern void machine_check_print_event_info(struct machine_check_event *evt,
>>   unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr);
>>   extern void mce_common_process_ue(struct pt_regs *regs,
>>   				  struct mce_error_info *mce_err);
>> +extern void machine_check_raise_dec_intr(void);
> No new externs on function declarations, they tell me.

ok.

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
>>   #endif /* CONFIG_PPC_BOOK3S_64 */
>>   } ____cacheline_aligned;
>>   
>> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
>> index fd829f7f25a4..45baa062ebc0 100644
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
>> +	set_dec(1);
>> +}
> The problem here is a timer can be scheduled (e.g., by an external
> interrupt if it gets taken before the decrementer, then uses a
> timer) and that set decr > 1. See logic in decrementer_set_next_event.
>
> I _think_ the way to get around this would be to have the machine check
> just use arch_irq_work_raise.
>
> Then you could also only call the mce handler inside the
> test_irq_work_pending() check and avoid the added function call on every
> timer. That test should also be marked unlikely come to think of it, but
> that's a side patchlet.

Sure, I will use arch_irq_work_raise() and test_irq_work_pending().

>
>> +
>>   /*
>>    * Decode and save high level MCE information into per cpu buffer which
>>    * is an array of machine_check_event structure.
>> @@ -135,6 +131,8 @@ void save_mce_event(struct pt_regs *regs, long handled,
>>   	if (mce->error_type == MCE_ERROR_TYPE_UE)
>>   		mce->u.ue_error.ignore_event = mce_err->ignore_event;
>>   
>> +	atomic_inc(&local_paca->mces_to_process);
>> +
>>   	if (!addr)
>>   		return;
>>   
>> @@ -217,7 +215,7 @@ void release_mce_event(void)
>>   	get_mce_event(NULL, true);
>>   }
>>   
>> -static void machine_check_ue_irq_work(struct irq_work *work)
>> +static void machine_check_ue_work(void)
>>   {
>>   	schedule_work(&mce_ue_event_work);
>>   }
>> @@ -239,7 +237,7 @@ static void machine_check_ue_event(struct machine_check_event *evt)
>>   	       evt, sizeof(*evt));
>>   
>>   	/* Queue work to process this event later. */
>> -	irq_work_queue(&mce_ue_event_irq_work);
>> +	machine_check_raise_dec_intr();
>>   }
>>   
>>   /*
>> @@ -249,7 +247,6 @@ void machine_check_queue_event(void)
>>   {
>>   	int index;
>>   	struct machine_check_event evt;
>> -	unsigned long msr;
>>   
>>   	if (!get_mce_event(&evt, MCE_EVENT_RELEASE))
>>   		return;
>> @@ -263,20 +260,7 @@ void machine_check_queue_event(void)
>>   	memcpy(&local_paca->mce_info->mce_event_queue[index],
>>   	       &evt, sizeof(evt));
>>   
>> -	/*
>> -	 * Queue irq work to process this event later. Before
>> -	 * queuing the work enable translation for non radix LPAR,
>> -	 * as irq_work_queue may try to access memory outside RMO
>> -	 * region.
>> -	 */
>> -	if (!radix_enabled() && firmware_has_feature(FW_FEATURE_LPAR)) {
>> -		msr = mfmsr();
>> -		mtmsr(msr | MSR_IR | MSR_DR);
>> -		irq_work_queue(&mce_event_process_work);
>> -		mtmsr(msr);
>> -	} else {
>> -		irq_work_queue(&mce_event_process_work);
>> -	}
> Getting rid of these things would be very nice.
>
>> +	machine_check_raise_dec_intr();
>>   }
>>   
>>   void mce_common_process_ue(struct pt_regs *regs,
>> @@ -338,7 +322,7 @@ static void machine_process_ue_event(struct work_struct *work)
>>    * process pending MCE event from the mce event queue. This function will be
>>    * called during syscall exit.
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
>> +
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
> It looks like if (IS_ENABLED(CONFIG_PPC_BOOK3S_64)) should work here?

sure.

>>   	now = get_tb();
>>   	if (now >= *next_tb) {
>>   		*next_tb = ~(u64)0;
>> diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
>> index 3544778e06d0..0dc4f1027b30 100644
>> --- a/arch/powerpc/platforms/pseries/pseries.h
>> +++ b/arch/powerpc/platforms/pseries/pseries.h
>> @@ -21,6 +21,7 @@ struct pt_regs;
>>   extern int pSeries_system_reset_exception(struct pt_regs *regs);
>>   extern int pSeries_machine_check_exception(struct pt_regs *regs);
>>   extern long pseries_machine_check_realmode(struct pt_regs *regs);
>> +extern void pSeries_machine_check_log_err(void);
> extern can be removed.

sure, thanks.

> Thanks,
> Nick
>
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
>> index f79126f16258..54bd7bdb7e92 100644
>> --- a/arch/powerpc/platforms/pseries/setup.c
>> +++ b/arch/powerpc/platforms/pseries/setup.c
>> @@ -1085,6 +1085,7 @@ define_machine(pseries) {
>>   	.system_reset_exception = pSeries_system_reset_exception,
>>   	.machine_check_early	= pseries_machine_check_realmode,
>>   	.machine_check_exception = pSeries_machine_check_exception,
>> +	.machine_check_log_err	= pSeries_machine_check_log_err,
>>   #ifdef CONFIG_KEXEC_CORE
>>   	.machine_kexec          = pSeries_machine_kexec,
>>   	.kexec_cpu_down         = pseries_kexec_cpu_down,
>> -- 
>> 2.26.2
>>
>>
--------------M9IUuI0J2Axk3RN0un1CzNGx
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>On 11/8/21 19:49, Nicholas Piggin wrote:</pre>
    <blockquote type="cite"
      cite="mid:1636380442.sna3yrbwu3.astroid@bobo.none">
      <pre class="moz-quote-pre" wrap="">Excerpts from Ganesh Goudar's message of November 8, 2021 6:38 pm:
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
index 764f2732a821..c89cc03c0f97 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -103,6 +103,8 @@ struct machdep_calls {
 	/* Called during machine check exception to retrive fixup address. */
 	bool		(*mce_check_early_recovery)(struct pt_regs *regs);
 
+	void            (*machine_check_log_err)(void);
+
 	/* Motherboard/chipset features. This is a kind of general purpose
 	 * hook used to control some machine specific features (like reset
 	 * lines, chip power control, etc...).
diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
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
No new externs on function declarations, they tell me.</pre>
    </blockquote>
    <pre>ok.</pre>
    <blockquote type="cite"
      cite="mid:1636380442.sna3yrbwu3.astroid@bobo.none">
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
 #endif /* CONFIG_PPC_BOOK3S_64 */
 } ____cacheline_aligned;
 
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index fd829f7f25a4..45baa062ebc0 100644
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
+	set_dec(1);
+}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The problem here is a timer can be scheduled (e.g., by an external 
interrupt if it gets taken before the decrementer, then uses a
timer) and that set decr &gt; 1. See logic in decrementer_set_next_event.

I _think_ the way to get around this would be to have the machine check
just use arch_irq_work_raise.

Then you could also only call the mce handler inside the
test_irq_work_pending() check and avoid the added function call on every 
timer. That test should also be marked unlikely come to think of it, but
that's a side patchlet.</pre>
    </blockquote>
    <pre>Sure, I will use arch_irq_work_raise() and test_irq_work_pending().
</pre>
    <blockquote type="cite"
      cite="mid:1636380442.sna3yrbwu3.astroid@bobo.none">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
 /*
  * Decode and save high level MCE information into per cpu buffer which
  * is an array of machine_check_event structure.
@@ -135,6 +131,8 @@ void save_mce_event(struct pt_regs *regs, long handled,
 	if (mce-&gt;error_type == MCE_ERROR_TYPE_UE)
 		mce-&gt;u.ue_error.ignore_event = mce_err-&gt;ignore_event;
 
+	atomic_inc(&amp;local_paca-&gt;mces_to_process);
+
 	if (!addr)
 		return;
 
@@ -217,7 +215,7 @@ void release_mce_event(void)
 	get_mce_event(NULL, true);
 }
 
-static void machine_check_ue_irq_work(struct irq_work *work)
+static void machine_check_ue_work(void)
 {
 	schedule_work(&amp;mce_ue_event_work);
 }
@@ -239,7 +237,7 @@ static void machine_check_ue_event(struct machine_check_event *evt)
 	       evt, sizeof(*evt));
 
 	/* Queue work to process this event later. */
-	irq_work_queue(&amp;mce_ue_event_irq_work);
+	machine_check_raise_dec_intr();
 }
 
 /*
@@ -249,7 +247,6 @@ void machine_check_queue_event(void)
 {
 	int index;
 	struct machine_check_event evt;
-	unsigned long msr;
 
 	if (!get_mce_event(&amp;evt, MCE_EVENT_RELEASE))
 		return;
@@ -263,20 +260,7 @@ void machine_check_queue_event(void)
 	memcpy(&amp;local_paca-&gt;mce_info-&gt;mce_event_queue[index],
 	       &amp;evt, sizeof(evt));
 
-	/*
-	 * Queue irq work to process this event later. Before
-	 * queuing the work enable translation for non radix LPAR,
-	 * as irq_work_queue may try to access memory outside RMO
-	 * region.
-	 */
-	if (!radix_enabled() &amp;&amp; firmware_has_feature(FW_FEATURE_LPAR)) {
-		msr = mfmsr();
-		mtmsr(msr | MSR_IR | MSR_DR);
-		irq_work_queue(&amp;mce_event_process_work);
-		mtmsr(msr);
-	} else {
-		irq_work_queue(&amp;mce_event_process_work);
-	}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Getting rid of these things would be very nice.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+	machine_check_raise_dec_intr();
 }
 
 void mce_common_process_ue(struct pt_regs *regs,
@@ -338,7 +322,7 @@ static void machine_process_ue_event(struct work_struct *work)
  * process pending MCE event from the mce event queue. This function will be
  * called during syscall exit.
  */
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
+
 void machine_check_print_event_info(struct machine_check_event *evt,
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
      <pre class="moz-quote-pre" wrap="">
It looks like if (IS_ENABLED(CONFIG_PPC_BOOK3S_64)) should work here?</pre>
    </blockquote>
    <pre>sure.</pre>
    <blockquote type="cite"
      cite="mid:1636380442.sna3yrbwu3.astroid@bobo.none">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 	now = get_tb();
 	if (now &gt;= *next_tb) {
 		*next_tb = ~(u64)0;
diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
index 3544778e06d0..0dc4f1027b30 100644
--- a/arch/powerpc/platforms/pseries/pseries.h
+++ b/arch/powerpc/platforms/pseries/pseries.h
@@ -21,6 +21,7 @@ struct pt_regs;
 extern int pSeries_system_reset_exception(struct pt_regs *regs);
 extern int pSeries_machine_check_exception(struct pt_regs *regs);
 extern long pseries_machine_check_realmode(struct pt_regs *regs);
+extern void pSeries_machine_check_log_err(void);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
extern can be removed.</pre>
    </blockquote>
    <pre>sure, thanks.
</pre>
    <blockquote type="cite"
      cite="mid:1636380442.sna3yrbwu3.astroid@bobo.none">
      <pre class="moz-quote-pre" wrap="">
Thanks,
Nick

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 
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
index f79126f16258..54bd7bdb7e92 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -1085,6 +1085,7 @@ define_machine(pseries) {
 	.system_reset_exception = pSeries_system_reset_exception,
 	.machine_check_early	= pseries_machine_check_realmode,
 	.machine_check_exception = pSeries_machine_check_exception,
+	.machine_check_log_err	= pSeries_machine_check_log_err,
 #ifdef CONFIG_KEXEC_CORE
 	.machine_kexec          = pSeries_machine_kexec,
 	.kexec_cpu_down         = pseries_kexec_cpu_down,
-- 
2.26.2


</pre>
      </blockquote>
    </blockquote>
  </body>
</html>
--------------M9IUuI0J2Axk3RN0un1CzNGx--

