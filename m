Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AFE7C5E85
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 22:37:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O4gmR1o2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5PjH5zpsz3cQr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 07:37:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O4gmR1o2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5PhP30WBz2yhR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Oct 2023 07:37:08 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39BKYvpe026402;
	Wed, 11 Oct 2023 20:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=HGjE+EN9y7gPzNLYaOCJJeyw3D7Ja6OV8FLqTslzsOc=;
 b=O4gmR1o2zvhfb059DgPUGc2T1KRbzb8wFNS5SZyPRJNaoRtCBaqD3svHyL7Jl7hzVGSf
 QzJSnz024npfHx3GoySHI0vT7dPotZxMPcUt4KKwhpCH6qzDzFVtYfQAjgdz0ck8i+TA
 FkYDsZqRSdnfnblar4AgDu9/AK8NLZfU1KgF32cs4ewgeAeBoaicj9/nOFPWF5enQt2w
 V+Y3FypJ/RFOSwDy5vGShCh7UJ5+lKW5eTRKoR9kBx1ETZXORSag5ekAd43NvMMvyYMI
 ZaWN01PFVcEArKO4DU90zhiAk5KiqtijC03Q2O8ZQ5aw9Z77TW9H9alEf2uO0/I6ftO0 Dg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tp2ga8ugy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 20:37:01 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39BK9mbQ016720;
	Wed, 11 Oct 2023 20:37:01 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tp2ga8ufs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 20:37:01 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39BI5iPp028633;
	Wed, 11 Oct 2023 20:37:00 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkj1yb1ek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 20:37:00 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39BKaxhh19727060
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Oct 2023 20:36:59 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 295665805C;
	Wed, 11 Oct 2023 20:36:59 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 142265805A;
	Wed, 11 Oct 2023 20:36:59 +0000 (GMT)
Received: from localhost (unknown [9.41.178.242])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 11 Oct 2023 20:36:59 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/pseries/vas: Migration suspend waits for no
 in-progress open windows
In-Reply-To: <ebeaa0f9-5d0e-317f-b0bc-f5212f6c8934@linux.ibm.com>
References: <20230927031558.759396-1-haren@linux.ibm.com>
 <8734yjwoax.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
 <ebeaa0f9-5d0e-317f-b0bc-f5212f6c8934@linux.ibm.com>
Date: Wed, 11 Oct 2023 15:36:58 -0500
Message-ID: <87ttqwvqtx.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 38a0xkDu95cMdwcB4mzHD0OFeS606mbg
X-Proofpoint-GUID: EsgKDLNkBLfmcT5zAtC8l288yjm4qkF2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_15,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxlogscore=971 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 mlxscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310110180
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

Haren Myneni <haren@linux.ibm.com> writes:
>> Haren Myneni <haren@linux.ibm.com> writes:
>>> The hypervisor returns migration failure if all VAS windows are not
>>> closed. During pre-migration stage, vas_migration_handler() sets
>>> migration_in_progress flag and closes all windows from the list.
>>> The allocate VAS window routine checks the migration flag, setup
>>> the window and then add it to the list. So there is possibility of
>>> the migration handler missing the window that is still in the
>>> process of setup.
>>>
>>> t1: Allocate and open VAS	t2: Migration event
>>>      window
>>>
>>> lock vas_pseries_mutex
>>> If migration_in_progress set
>>>    unlock vas_pseries_mutex
>>>    return
>>> open window HCALL
>>> unlock vas_pseries_mutex
>>> Modify window HCALL		lock vas_pseries_mutex
>>> setup window			migration_in_progress=true
>>> 				Closes all windows from
>>> 				the list
>>> 				unlock vas_pseries_mutex
>>> lock vas_pseries_mutex		return
>>> if nr_closed_windows == 0
>>>    // No DLPAR CPU or migration
>>>    add to the list
>>>    unlock vas_pseries_mutex
>>>    return
>>> unlock vas_pseries_mutex
>>> Close VAS window
>>> // due to DLPAR CPU or migration
>>> return -EBUSY
>> 
>> Could the the path t1 takes simply hold the mutex for the duration of
>> its execution instead of dropping and reacquiring it in the middle?
>> 
>> Here's the relevant code from vas_allocate_window():
>> 
>> 	mutex_lock(&vas_pseries_mutex);
>> 	if (migration_in_progress)
>> 		rc = -EBUSY;
>> 	else
>> 		rc = allocate_setup_window(txwin, (u64 *)&domain[0],
>> 				   cop_feat_caps->win_type);
>> 	mutex_unlock(&vas_pseries_mutex);
>> 	if (rc)
>> 		goto out;
>> 
>> 	rc = h_modify_vas_window(txwin);
>> 	if (!rc)
>> 		rc = get_vas_user_win_ref(&txwin->vas_win.task_ref);
>> 	if (rc)
>> 		goto out_free;
>> 
>> 	txwin->win_type = cop_feat_caps->win_type;
>> 	mutex_lock(&vas_pseries_mutex);
>> 	if (!caps->nr_close_wins) {
>> 		list_add(&txwin->win_list, &caps->list);
>> 		caps->nr_open_windows++;
>> 		mutex_unlock(&vas_pseries_mutex);
>> 		vas_user_win_add_mm_context(&txwin->vas_win.task_ref);
>> 		return &txwin->vas_win;
>> 	}
>> 	mutex_unlock(&vas_pseries_mutex);
>> 
>> Is there something about h_modify_vas_window() or get_vas_user_win_ref()
>> that requires temporarily dropping the lock?
>> 
>
> Thanks Nathan for your comments.
>
> vas_pseries_mutex protects window ID and IRQ allocation between alloc 
> and free window HCALLs, and window list. Generally try to not using 
> mutex in HCALLs, but we need this mutex with these HCALLs.
>
> We can add h_modify_vas_window() or get_vas_user_win_ref() with in the 
> mutex context, but not needed.

Hmm. I contend that it would fix your bug in a simpler way that
eliminates the race instead of coping with it by adding more state and
complicating the locking model. With your change, readers of the
migration_in_progress flag check it under the mutex, but the writer
updates it outside of the mutex, which seems strange and unlikely to be
correct.

> Also free HCALL can take longer depends 
> on pending NX requests since the hypervisor waits for all requests to be 
> completed before closing the window.
>
> Applications can issue window open / free calls at the same time which 
> can experience mutex contention especially on the large system where 
> 100's of credits are available. Another example: The migration event can 
> wait longer (or timeout) to get this mutex if many threads issue 
> open/free window calls. Hence added h_modify_vas_window() (modify HCALL) 
> or get_vas_user_win_ref() outside of mutex.

OK. I believe you're referring to this code, which can run under the lock:

static long hcall_return_busy_check(long rc)
{
	/* Check if we are stalled for some time */
	if (H_IS_LONG_BUSY(rc)) {
		msleep(get_longbusy_msecs(rc));
		rc = H_BUSY;
	} else if (rc == H_BUSY) {
		cond_resched();
	}

	return rc;
}

...

static int h_deallocate_vas_window(u64 winid)
{
	long rc;

	do {
		rc = plpar_hcall_norets(H_DEALLOCATE_VAS_WINDOW, winid);

		rc = hcall_return_busy_check(rc);
	} while (rc == H_BUSY);

...

[ with similar loops in the window allocate and modify functions ]

If get_longbusy_msecs() typically returns low values (<20), then you
should prefer usleep_range() over msleep() to avoid over-sleeping. For
example, msleep(1) can schedule away for much longer than 1ms -- often
more like 20ms.

If mutex hold times have been a problem in this code, then it's probably
worth improving the way it handles the busy/retry statuses under the
lock.
