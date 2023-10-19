Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1083E7CF180
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 09:41:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AN4ugz0y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SB05n5gtYz3dDJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 18:41:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AN4ugz0y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SB04t3zXfz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 18:40:46 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39J7ETZo013434;
	Thu, 19 Oct 2023 07:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=SZ1EHhMTUIJReHKWI08/tu4JeTIH6H+beWWIS7CGqZo=;
 b=AN4ugz0y95/axKNWwC/0NpH8sETACOwQvxfO6Ja6BCua1rbAfyATRZvoS0mldq+zZnLX
 lJQb21Buy6xHNLarOj3V7lNnx//vxdl8cXOA5tTOLVzCjyGTRacLhmxX4wpp6dIkndPC
 IfR5exF2FObzrNWHWdcpfyqbhXkm1z7ZbnMSI7Y1L9Ib2IkafAQPuomrnItLAPnwJQ1Z
 Nws/DZxsot/ZRovW8o5+CnDTEli8i2P0WuTf93ga3kZ2vhBob/LY0ttGk5S+v7SlgQby
 j77F/ztOQ7dOTTCd/1YIE/eo4h/ZJE8dLrcAzo0oBWOtVx2dgH7VoT3kB4phT4YutI87 aQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ttyw30p21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 07:40:34 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39J7eBFE024313;
	Thu, 19 Oct 2023 07:40:23 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ttyw30nuy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 07:40:23 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39J4jp3A012949;
	Thu, 19 Oct 2023 07:40:14 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tr5pyqgf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 07:40:14 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39J7eDGC49676602
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Oct 2023 07:40:13 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDC9958053;
	Thu, 19 Oct 2023 07:40:12 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D27BF58043;
	Thu, 19 Oct 2023 07:40:11 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.67.91.245])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 19 Oct 2023 07:40:11 +0000 (GMT)
Subject: Re: [PATCH v2] powerpc/pseries/vas: Migration suspend waits for no
 in-progress open windows
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20231018030332.862606-1-haren@linux.ibm.com>
 <87il73vdp9.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
From: Haren Myneni <haren@linux.ibm.com>
Message-ID: <b70fbbb2-ca63-d42e-5db1-53a739aa4743@linux.ibm.com>
Date: Thu, 19 Oct 2023 00:40:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87il73vdp9.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: c1dQYtHsgESpb5CfFWIN44Jza0VtAtY1
X-Proofpoint-ORIG-GUID: gGH8KbRc_on6yUrg-fsS7eHYekYLDZdI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_05,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190063
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/18/23 2:10 PM, Nathan Lynch wrote:
> Haren Myneni <haren@linux.ibm.com> writes:
>> The hypervisor returns migration failure if all VAS windows are not
>> closed. During pre-migration stage, vas_migration_handler() sets
>> migration_in_progress flag and closes all windows from the list.
>> The allocate VAS window routine checks the migration flag, setup
>> the window and then add it to the list. So there is possibility of
>> the migration handler missing the window that is still in the
>> process of setup.
>>
>> t1: Allocate and open VAS	t2: Migration event
>>      window
>>
>> lock vas_pseries_mutex
>> If migration_in_progress set
>>    unlock vas_pseries_mutex
>>    return
>> open window HCALL
>> unlock vas_pseries_mutex
>> Modify window HCALL		lock vas_pseries_mutex
>> setup window			migration_in_progress=true
>> 				Closes all windows from
>> 				the list
>> 				unlock vas_pseries_mutex
>> lock vas_pseries_mutex		return
>> if nr_closed_windows == 0
>>    // No DLPAR CPU or migration
>>    add to the list
>>    unlock vas_pseries_mutex
>>    return
>> unlock vas_pseries_mutex
>> Close VAS window
>> // due to DLPAR CPU or migration
>> return -EBUSY
>>
>> This patch resolves the issue with the following steps:
>> - Define migration_in_progress as atomic so that the migration
>>    handler sets this flag without holding mutex.
> 
> This part of the commit message is no longer accurate...

Correct. My mistake

> 
>> - Introduce nr_open_wins_progress counter in VAS capabilities
>>    struct
>> - This counter tracks the number of open windows are still in
>>    progress
>> - The allocate setup window thread closes windows if the migration
>>    is set and decrements nr_open_window_progress counter
>> - The migration handler waits for no in-progress open windows.
>>
>> Fixes: 37e6764895ef ("powerpc/pseries/vas: Add VAS migration handler")
>> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
>>
>> ---
>> Changes from v1:
>> - Do not define the migration_in_progress flag as atomic as
>>    suggested by Nathan
>> ---
>>   arch/powerpc/platforms/pseries/vas.c | 45 +++++++++++++++++++++++-----
>>   arch/powerpc/platforms/pseries/vas.h |  2 ++
>>   2 files changed, 40 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
>> index 15d958e38eca..b86f0db08e98 100644
>> --- a/arch/powerpc/platforms/pseries/vas.c
>> +++ b/arch/powerpc/platforms/pseries/vas.c
>> @@ -32,6 +32,7 @@ static struct hv_vas_cop_feat_caps hv_cop_caps;
>>   static struct vas_caps vascaps[VAS_MAX_FEAT_TYPE];
>>   static DEFINE_MUTEX(vas_pseries_mutex);
>>   static bool migration_in_progress;
>> +static DECLARE_WAIT_QUEUE_HEAD(open_win_progress_wq);
>>   
>>   static long hcall_return_busy_check(long rc)
>>   {
>> @@ -384,11 +385,15 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
>>   	 * same fault IRQ is not freed by the OS before.
>>   	 */
>>   	mutex_lock(&vas_pseries_mutex);
>> -	if (migration_in_progress)
>> +	if (migration_in_progress) {
>>   		rc = -EBUSY;
>> -	else
>> +	} else {
>>   		rc = allocate_setup_window(txwin, (u64 *)&domain[0],
>>   				   cop_feat_caps->win_type);
>> +		if (!rc)
>> +			atomic_inc(&caps->nr_open_wins_progress);
>> +	}
>> +
>>   	mutex_unlock(&vas_pseries_mutex);
>>   	if (rc)
>>   		goto out;
>> @@ -403,8 +408,17 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
>>   		goto out_free;
>>   
>>   	txwin->win_type = cop_feat_caps->win_type;
>> -	mutex_lock(&vas_pseries_mutex);
>> +
>>   	/*
>> +	 * The migration SUSPEND thread sets migration_in_progress and
>> +	 * closes all open windows from the list. But the window is
>> +	 * added to the list after open and modify HCALLs. So possible
>> +	 * that migration_in_progress is set before modify HCALL which
>> +	 * may cause some windows are still open when the hypervisor
>> +	 * initiates the migration.
>> +	 * So checks the migration_in_progress flag again and close all
>> +	 * open windows.
>> +	 *
>>   	 * Possible to lose the acquired credit with DLPAR core
>>   	 * removal after the window is opened. So if there are any
>>   	 * closed windows (means with lost credits), do not give new
>> @@ -412,9 +426,11 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
>>   	 * after the existing windows are reopened when credits are
>>   	 * available.
>>   	 */
>> -	if (!caps->nr_close_wins) {
>> +	mutex_lock(&vas_pseries_mutex);
>> +	if (!caps->nr_close_wins && !migration_in_progress) {
>>   		list_add(&txwin->win_list, &caps->list);
>>   		caps->nr_open_windows++;
>> +		atomic_dec(&caps->nr_open_wins_progress);
> 
> Should there not be a test and wakeup here
> 
> if (atomic_dec_return(&caps->nr_open_wins_progress) == 0)
> 	wake_up(&open_win_progress_wq);

We do not need this. This section will be running only when the 
migration_in_progress is not set. So the migration thread is not waiting.

> 
>>   		mutex_unlock(&vas_pseries_mutex);
>>   		vas_user_win_add_mm_context(&txwin->vas_win.task_ref);
>>   		return &txwin->vas_win;
>> @@ -432,6 +448,8 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
>>   	 */
>>   	free_irq_setup(txwin);
>>   	h_deallocate_vas_window(txwin->vas_win.winid);
>> +	atomic_dec(&caps->nr_open_wins_progress);
>> +	wake_up(&open_win_progress_wq);
> 
> I wonder if this should also wake only when the counter reaches zero.

So thought the migration event wakes up and checks this counter anyway. 
I will add counter=0 check as you mentioned above.

> 
>>   out:
>>   	atomic_dec(&cop_feat_caps->nr_used_credits);
>>   	kfree(txwin);
>> @@ -936,14 +954,14 @@ int vas_migration_handler(int action)
>>   	struct vas_caps *vcaps;
>>   	int i, rc = 0;
>>   
>> +	pr_info("VAS migration event %d\n", action);
>> +
> 
> A leftover debug statement? It doesn't seem necessary.

Intentionally added these info messages to show the VAS migration events 
are executed during partition migration. useful for debugging in case 
for any bugs.

I can remove them if you prefer.

> 
>>   	/*
>>   	 * NX-GZIP is not enabled. Nothing to do for migration.
>>   	 */
>>   	if (!copypaste_feat)
>>   		return rc;
>>   
>> -	mutex_lock(&vas_pseries_mutex);
>> -
>>   	if (action == VAS_SUSPEND)
>>   		migration_in_progress = true;
>>   	else
>> @@ -989,12 +1007,24 @@ int vas_migration_handler(int action)
>>   
>>   		switch (action) {
>>   		case VAS_SUSPEND:
>> +			mutex_lock(&vas_pseries_mutex);
>>   			rc = reconfig_close_windows(vcaps, vcaps->nr_open_windows,
>>   							true);
>> +			mutex_unlock(&vas_pseries_mutex);
>> +			/*
>> +			 * Windows are included in the list after successful
>> +			 * open. So wait for closing these in-progress open
>> +			 * windows in vas_allocate_window() which will be
>> +			 * done if the migration_in_progress is set.
>> +			 */
>> +			rc = wait_event_interruptible(open_win_progress_wq,
>> +				!atomic_read(&vcaps->nr_open_wins_progress));
> 
> I don't think the wait should be interruptible. We don't want a signal
> to cause this function to return before all the windows are released.
Added interruptible since the migration thread is drmgr. Sure, will add 
wait_event()

> 
> Note that since vas_migration_handler() updates migration_in_progress
> before acquiring the mutex and loads vcaps->nr_open_wins_progress after
> releasing the mutex, this order of operations *could* occur:
> 
>    // when action == VAS_SUSPEND
>    acquire vas_pseries_mutex
>    load &vcaps->nr_open_wins_progress
>    store &migration_in_progress
>    release vas_pseries_mutex
> 
> Or at least I suspect so when reconfig_close_windows() has no work to
> do. I'm relying on this passage from memory-barriers.txt:
> 
>    An ACQUIRE followed by a RELEASE may not be assumed to be full memory barrier
>    because it is possible for an access preceding the ACQUIRE to happen after the
>    ACQUIRE, and an access following the RELEASE to happen before the RELEASE, and
>    the two accesses can themselves then cross:
> 
> 	*A = a;
> 	ACQUIRE M
> 	RELEASE M
> 	*B = b;
> 
>    may occur as:
> 
> 	ACQUIRE M, STORE *B, STORE *A, RELEASE M
> 
> 
> Now, I don't currently see problems with this in the allocation
> path. But the fact that reviewers now need to consider such
> possibilities makes me want a different locking model in this code.

migration_in_progress=suspend
while for each VAS feature
	Get VAS capabilities with HCALL
	acquire mutex
	reconfig_close_windows() // may have small work only when no open 
windows in the list.
	release mutex
	wait_event with accessing vcaps->nr_open_wins_progress

migration_in_progress is set at the beginning but not accessed later in 
vas_migration_handler(). Also wait_event has to access 
nr_open_wins_progress whenever it wakes up. So I think the access of 
these should be outside of this mutex.

We can move migration_in_progress=suspend within the mutex, but as 
mentioned before adds performance overhead.

adding a barrier smp_mb() before wait_event()?

> 
>>   			break;
>>   		case VAS_RESUME:
>> +			mutex_lock(&vas_pseries_mutex);
>>   			atomic_set(&caps->nr_total_credits, new_nr_creds);
>>   			rc = reconfig_open_windows(vcaps, new_nr_creds, true);
>> +			mutex_unlock(&vas_pseries_mutex);
>>   			break;
>>   		default:
>>   			/* should not happen */
>> @@ -1010,8 +1040,9 @@ int vas_migration_handler(int action)
>>   			goto out;
>>   	}
>>   
>> +	pr_info("VAS migration event (%d) successful\n", action);
>> +
> 
> Looks like another leftover debug statement.
> 
>>   out:
>> -	mutex_unlock(&vas_pseries_mutex);
>>   	return rc;
>>   }
