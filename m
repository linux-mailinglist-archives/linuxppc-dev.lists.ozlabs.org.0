Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A29B47C8E56
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 22:27:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Sywoey7j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6dNK4H2Dz3vZ5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Oct 2023 07:27:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Sywoey7j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6dMR3R0pz3c7K
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Oct 2023 07:26:43 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39DKQIuC006844;
	Fri, 13 Oct 2023 20:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Nps9fQmG+9po1c0OVCSajFeD2CafzH0aUs3gwkGJnww=;
 b=Sywoey7jjYeEO0bzRsiCl1rf0apIs02nC1Tq9LiiYwWjG+pxEQ93y/7eIM8eEzzkxQ+H
 j0iGqmQo4PVDBbJjCXReK017KbiNCoZN1Qc54hoagMW1hDAnt2ewm/tlKu9tUgq5q3wl
 ja4NLPtyiUIZpxeTzfFSfM88kA5ONtpALwhk7b3IOMeFKZB8Off2bdVxr6pnW5GPRKGa
 Q7D6JATr7muM0Z5RAOinA66jLyea/Z+7WDAKEPKBLfCJJb1bQ2uAM3KLsUynK4Me/4Tm
 ReDqPDr4eJx5+6s4DRFN0OeP0FX8X5J5Rs9aFALJqTjq1RYddIPiPj480ma6tOQsVzUn vA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tqcx6g15s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Oct 2023 20:26:34 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39DKQWtg008062;
	Fri, 13 Oct 2023 20:26:32 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tqcx6g0ub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Oct 2023 20:26:32 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39DJ1rPC016341;
	Fri, 13 Oct 2023 20:22:38 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tpt586g4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Oct 2023 20:22:38 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39DKMa3S17171000
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Oct 2023 20:22:36 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B5CB58053;
	Fri, 13 Oct 2023 20:22:36 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5491E58043;
	Fri, 13 Oct 2023 20:22:35 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.67.66.34])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 13 Oct 2023 20:22:35 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries/vas: Migration suspend waits for no
 in-progress open windows
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20230927031558.759396-1-haren@linux.ibm.com>
 <8734yjwoax.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
 <ebeaa0f9-5d0e-317f-b0bc-f5212f6c8934@linux.ibm.com>
 <87ttqwvqtx.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
From: Haren Myneni <haren@linux.ibm.com>
Message-ID: <7bd86f4e-80d2-5586-6d5c-c16b862a5643@linux.ibm.com>
Date: Fri, 13 Oct 2023 13:22:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87ttqwvqtx.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _uO_z_Sz3wVQEK2J87-sOMMHtR0vXMip
X-Proofpoint-GUID: jZQ6fc3TApE5lukPRd2ky3NOJpX6MaVK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_12,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310130176
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



On 10/11/23 1:36 PM, Nathan Lynch wrote:
> Haren Myneni <haren@linux.ibm.com> writes:
>>> Haren Myneni <haren@linux.ibm.com> writes:
>>>> The hypervisor returns migration failure if all VAS windows are not
>>>> closed. During pre-migration stage, vas_migration_handler() sets
>>>> migration_in_progress flag and closes all windows from the list.
>>>> The allocate VAS window routine checks the migration flag, setup
>>>> the window and then add it to the list. So there is possibility of
>>>> the migration handler missing the window that is still in the
>>>> process of setup.
>>>>
>>>> t1: Allocate and open VAS	t2: Migration event
>>>>       window
>>>>
>>>> lock vas_pseries_mutex
>>>> If migration_in_progress set
>>>>     unlock vas_pseries_mutex
>>>>     return
>>>> open window HCALL
>>>> unlock vas_pseries_mutex
>>>> Modify window HCALL		lock vas_pseries_mutex
>>>> setup window			migration_in_progress=true
>>>> 				Closes all windows from
>>>> 				the list
>>>> 				unlock vas_pseries_mutex
>>>> lock vas_pseries_mutex		return
>>>> if nr_closed_windows == 0
>>>>     // No DLPAR CPU or migration
>>>>     add to the list
>>>>     unlock vas_pseries_mutex
>>>>     return
>>>> unlock vas_pseries_mutex
>>>> Close VAS window
>>>> // due to DLPAR CPU or migration
>>>> return -EBUSY
>>>
>>> Could the the path t1 takes simply hold the mutex for the duration of
>>> its execution instead of dropping and reacquiring it in the middle?
>>>
>>> Here's the relevant code from vas_allocate_window():
>>>
>>> 	mutex_lock(&vas_pseries_mutex);
>>> 	if (migration_in_progress)
>>> 		rc = -EBUSY;
>>> 	else
>>> 		rc = allocate_setup_window(txwin, (u64 *)&domain[0],
>>> 				   cop_feat_caps->win_type);
>>> 	mutex_unlock(&vas_pseries_mutex);
>>> 	if (rc)
>>> 		goto out;
>>>
>>> 	rc = h_modify_vas_window(txwin);
>>> 	if (!rc)
>>> 		rc = get_vas_user_win_ref(&txwin->vas_win.task_ref);
>>> 	if (rc)
>>> 		goto out_free;
>>>
>>> 	txwin->win_type = cop_feat_caps->win_type;
>>> 	mutex_lock(&vas_pseries_mutex);
>>> 	if (!caps->nr_close_wins) {
>>> 		list_add(&txwin->win_list, &caps->list);
>>> 		caps->nr_open_windows++;
>>> 		mutex_unlock(&vas_pseries_mutex);
>>> 		vas_user_win_add_mm_context(&txwin->vas_win.task_ref);
>>> 		return &txwin->vas_win;
>>> 	}
>>> 	mutex_unlock(&vas_pseries_mutex);
>>>
>>> Is there something about h_modify_vas_window() or get_vas_user_win_ref()
>>> that requires temporarily dropping the lock?
>>>
>>
>> Thanks Nathan for your comments.
>>
>> vas_pseries_mutex protects window ID and IRQ allocation between alloc
>> and free window HCALLs, and window list. Generally try to not using
>> mutex in HCALLs, but we need this mutex with these HCALLs.
>>
>> We can add h_modify_vas_window() or get_vas_user_win_ref() with in the
>> mutex context, but not needed.
> 
> Hmm. I contend that it would fix your bug in a simpler way that
> eliminates the race instead of coping with it by adding more state and
> complicating the locking model. With your change, readers of the
> migration_in_progress flag check it under the mutex, but the writer
> updates it outside of the mutex, which seems strange and unlikely to be
> correct.

The migration thread is the only writer which changes 
migration_in_progress flag. The setting this flag in moved outside of 
mutex in this patch. The window open is only reader of this flag but 
within mutex.

Reason for moved the setting outside of mutex:

Suppose many threads are called open window and waiting on mutex and 
later the migration thread started. In this case the migration thread 
has to wait on mutex for all window open threads has to complete open 
window HCALLs in the hypervisor. Then the migration thread has to close 
all these windows immediately. So if the setting is done outside of 
mutex, the later open window threads can exit from this function quickly 
without opening windows.

Reason for keeping the migration_in_progress check inside of mutex 
section with the above change (setting outside of mutex):

If the reader threads waits on mutex after checking this flag (before 
holding mutex), end up opening windows which will be closed anyway by 
the migration thread. Also the later open threads can return with -EBUSY 
quickly.


> 
>> Also free HCALL can take longer depends
>> on pending NX requests since the hypervisor waits for all requests to be
>> completed before closing the window.
>>
>> Applications can issue window open / free calls at the same time which
>> can experience mutex contention especially on the large system where
>> 100's of credits are available. Another example: The migration event can
>> wait longer (or timeout) to get this mutex if many threads issue
>> open/free window calls. Hence added h_modify_vas_window() (modify HCALL)
>> or get_vas_user_win_ref() outside of mutex.
> 
> OK. I believe you're referring to this code, which can run under the lock:
> 
> static long hcall_return_busy_check(long rc)
> {
> 	/* Check if we are stalled for some time */
> 	if (H_IS_LONG_BUSY(rc)) {
> 		msleep(get_longbusy_msecs(rc));
> 		rc = H_BUSY;
> 	} else if (rc == H_BUSY) {
> 		cond_resched();
> 	}
> 
> 	return rc;
> }
> 
> ...
> 
> static int h_deallocate_vas_window(u64 winid)
> {
> 	long rc;
> 
> 	do {
> 		rc = plpar_hcall_norets(H_DEALLOCATE_VAS_WINDOW, winid);
> 
> 		rc = hcall_return_busy_check(rc);
> 	} while (rc == H_BUSY);
> 
> ...
> 
> [ with similar loops in the window allocate and modify functions ]
> 
> If get_longbusy_msecs() typically returns low values (<20), then you
> should prefer usleep_range() over msleep() to avoid over-sleeping. For
> example, msleep(1) can schedule away for much longer than 1ms -- often
> more like 20ms.
> 
> If mutex hold times have been a problem in this code, then it's probably
> worth improving the way it handles the busy/retry statuses under the
> lock.
> 

Not only mutex hold time longer for contention, also affects the 
application performance if we have large mutex section. The application 
thread can make several window open and close calls. In the worst case 
it can be for each NX request and someone have similar workload on BML 
for performance considerations  (if not distribute windows on all VAS 
engines). In these kind of scenarios when multiple threads are opening 
windows, there could be performance bottleneck on mutex if we have large 
mutex section. So to have the flexibility, created two sections one with 
allocate window (ID and IRQ) and the next one is to protect the window 
list.

Thanks
Haren

