Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 557327CB4A4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 22:31:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZsM0CRPA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8TKF0wdbz3d81
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 07:31:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZsM0CRPA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8TJM41f9z3c5F
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 07:30:27 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39GKFtGE008766;
	Mon, 16 Oct 2023 20:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=TGejvHm6iDw+z76Q2hVtN87I/Tb0pgW+2SSMhROnd5g=;
 b=ZsM0CRPAThpTaNBZdx451Nh/M9FRSjAP9gB8TRbPyS2qH8f4qrOMRLWgonL+f/5+KJnt
 XrGV0M2z3+P28YPJN2que/X1UeeIbWmNyH+iUyV+vtscvywVQ31QZTfFsmD78MnA1Tgn
 MkeSHbXRai2DcwrjYmLovTDwym2oHUOmqxZtLeZZbquqOgc905lc5r+UCjQ4oxaOyDKn
 /yZCKKzD9kmxIBctL3pL6e8KOuxNnzR3n7dgtCNv2ZYZ/nL1/UMA10zhEJXk1INhWE4W
 IN5/CQSBTptEvJy+3NnOTThJOgQoPB4dAo++c9nA7spOO5jrwZ8iUQUNgFPoiPRQY/Ib qA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tsbuyguxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Oct 2023 20:30:20 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39GKH5HP017312;
	Mon, 16 Oct 2023 20:30:19 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tsbuyguu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Oct 2023 20:30:19 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39GKAMhM012900;
	Mon, 16 Oct 2023 20:30:17 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tr5py3j2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Oct 2023 20:30:17 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39GKUFuH26083974
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Oct 2023 20:30:16 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A3AC558056;
	Mon, 16 Oct 2023 20:30:15 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F6B65805E;
	Mon, 16 Oct 2023 20:30:15 +0000 (GMT)
Received: from localhost (unknown [9.41.178.242])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Oct 2023 20:30:15 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/pseries/vas: Migration suspend waits for no
 in-progress open windows
In-Reply-To: <87ttqwvqtx.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
References: <20230927031558.759396-1-haren@linux.ibm.com>
 <8734yjwoax.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
 <ebeaa0f9-5d0e-317f-b0bc-f5212f6c8934@linux.ibm.com>
 <87ttqwvqtx.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
Date: Mon, 16 Oct 2023 15:30:15 -0500
Message-ID: <87mswiux7s.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HWYNiNqkAp8a3MzSMsI-SaLw58c0eLH5
X-Proofpoint-ORIG-GUID: 2gzRn-0SJJKrDYWQIQf61smGpxI90SAd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_10,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0
 mlxlogscore=945 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310160178
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

Nathan Lynch <nathanl@linux.ibm.com> writes:
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
>>>>      window
>>>>
>>>> lock vas_pseries_mutex
>>>> If migration_in_progress set
>>>>    unlock vas_pseries_mutex
>>>>    return
>>>> open window HCALL
>>>> unlock vas_pseries_mutex
>>>> Modify window HCALL		lock vas_pseries_mutex
>>>> setup window			migration_in_progress=true
>>>> 				Closes all windows from
>>>> 				the list
>>>> 				unlock vas_pseries_mutex
>>>> lock vas_pseries_mutex		return
>>>> if nr_closed_windows == 0
>>>>    // No DLPAR CPU or migration
>>>>    add to the list
>>>>    unlock vas_pseries_mutex
>>>>    return
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

Expanding on this, with your change, migration_in_progress becomes a
boolean atomic_t flag accessed only with atomic_set() and
atomic_read(). These are non-RMW operations. Documentation/atomic_t.txt
says:

  Non-RMW ops:

  The non-RMW ops are (typically) regular LOADs and STOREs and are
  canonically implemented using READ_ONCE(), WRITE_ONCE(),
  smp_load_acquire() and smp_store_release() respectively. Therefore, if
  you find yourself only using the Non-RMW operations of atomic_t, you
  do not in fact need atomic_t at all and are doing it wrong.

So making migration_in_progress an atomic_t does not confer any
advantageous properties to it that it lacks as a plain boolean.

Considering also (from the same document):

 - non-RMW operations are unordered;

 - RMW operations that have no return value are unordered;

I am concerned that threads executing these segments of code will not
always observe each others' effects in the intended order:

// vas_allocate_window()

        mutex_lock(&vas_pseries_mutex);
        if (!caps->nr_close_wins && !atomic_read(&migration_in_progress)) {
                list_add(&txwin->win_list, &caps->list);
                caps->nr_open_windows++;
                atomic_dec(&caps->nr_open_wins_progress);
                mutex_unlock(&vas_pseries_mutex);
                vas_user_win_add_mm_context(&txwin->vas_win.task_ref);
                return &txwin->vas_win;
        }
        mutex_unlock(&vas_pseries_mutex);
        ...
        atomic_dec(&caps->nr_open_wins_progress);
        wake_up(&open_win_progress_wq);

// vas_migration_handler()

                atomic_set(&migration_in_progress, 1);
                ...
                        mutex_lock(&vas_pseries_mutex);
                        rc = reconfig_close_windows(vcaps, vcaps->nr_open_windows,
                                                        true);
                        mutex_unlock(&vas_pseries_mutex);
                        /*
                         * Windows are included in the list after successful
                         * open. So wait for closing these in-progress open
                         * windows in vas_allocate_window() which will be
                         * done if the migration_in_progress is set.
                         */
                        rc = wait_event_interruptible(open_win_progress_wq,
                                !atomic_read(&vcaps->nr_open_wins_progress));

Maybe it's OK in practice for some reason? I'm finding it difficult to
reason about :-)
