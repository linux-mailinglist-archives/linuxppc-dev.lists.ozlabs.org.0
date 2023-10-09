Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1087BEB54
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 22:10:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iwclkPWd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S49BX05d8z3cCc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 07:10:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iwclkPWd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S499Z6Rt9z3c3s
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 07:09:38 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 399Jw22o018102;
	Mon, 9 Oct 2023 20:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=q+O/1IF9MI/VcedDKO8hWj5Drfd3015ovaHt4oHZ1o4=;
 b=iwclkPWdVt+6RtFeq1qnFEbS7Pua1HowTfWkiCA+cPTV2a23K2BgKSfSuLJSEYfUc5GT
 3rg9+2GYuAXVLptp5GVRQGSFw56ViYGwujRtEWCF/6bgIXL+tj3ffE55ip4UYF/u1zw7
 fvgMqHMZJY8zQSrSZa3Syi1rDxARAAdN6yYfEGsVSP6tNiIEHAH4T28gw59jP1qj/nR0
 3TAELdzaJSFuqE9wbwKD25HkT42a/7wkD0pvIqJn88cOgFGCdBICrVW5ibfRELWdi5wj
 tltCXFkpKChsFPOoVRkkUlwVNZsIvsk9/axWUXrQSrUaOVXaWtjtnd96jB293kIaQJPt EQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmr4u0b2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 20:09:30 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 399K0ZWV027746;
	Mon, 9 Oct 2023 20:09:30 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmr4u0b1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 20:09:30 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 399J6VoF028633;
	Mon, 9 Oct 2023 20:09:29 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkj1xun4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 20:09:29 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 399K9RH549545672
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Oct 2023 20:09:27 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F422D5805B;
	Mon,  9 Oct 2023 20:09:26 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D0ED758055;
	Mon,  9 Oct 2023 20:09:26 +0000 (GMT)
Received: from localhost (unknown [9.41.178.242])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Oct 2023 20:09:26 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/pseries/vas: Migration suspend waits for no
 in-progress open windows
In-Reply-To: <20230927031558.759396-1-haren@linux.ibm.com>
References: <20230927031558.759396-1-haren@linux.ibm.com>
Date: Mon, 09 Oct 2023 15:09:26 -0500
Message-ID: <8734yjwoax.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xIHA4p0wUGGtRqjh1CRl-7UzZc1oEpwN
X-Proofpoint-ORIG-GUID: IihkvcPaR3ERX293rwvcKdc_rHTQbz5N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_18,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 suspectscore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=660 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310090163
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

Hi Haren,

Haren Myneni <haren@linux.ibm.com> writes:
> The hypervisor returns migration failure if all VAS windows are not
> closed. During pre-migration stage, vas_migration_handler() sets
> migration_in_progress flag and closes all windows from the list.
> The allocate VAS window routine checks the migration flag, setup
> the window and then add it to the list. So there is possibility of
> the migration handler missing the window that is still in the
> process of setup.
>
> t1: Allocate and open VAS	t2: Migration event
>     window
>
> lock vas_pseries_mutex
> If migration_in_progress set
>   unlock vas_pseries_mutex
>   return
> open window HCALL
> unlock vas_pseries_mutex
> Modify window HCALL		lock vas_pseries_mutex
> setup window			migration_in_progress=true
> 				Closes all windows from
> 				the list
> 				unlock vas_pseries_mutex
> lock vas_pseries_mutex		return
> if nr_closed_windows == 0
>   // No DLPAR CPU or migration
>   add to the list
>   unlock vas_pseries_mutex
>   return
> unlock vas_pseries_mutex
> Close VAS window
> // due to DLPAR CPU or migration
> return -EBUSY

Could the the path t1 takes simply hold the mutex for the duration of
its execution instead of dropping and reacquiring it in the middle?

Here's the relevant code from vas_allocate_window():

	mutex_lock(&vas_pseries_mutex);
	if (migration_in_progress)
		rc = -EBUSY;
	else
		rc = allocate_setup_window(txwin, (u64 *)&domain[0],
				   cop_feat_caps->win_type);
	mutex_unlock(&vas_pseries_mutex);
	if (rc)
		goto out;

	rc = h_modify_vas_window(txwin);
	if (!rc)
		rc = get_vas_user_win_ref(&txwin->vas_win.task_ref);
	if (rc)
		goto out_free;

	txwin->win_type = cop_feat_caps->win_type;
	mutex_lock(&vas_pseries_mutex);
	if (!caps->nr_close_wins) {
		list_add(&txwin->win_list, &caps->list);
		caps->nr_open_windows++;
		mutex_unlock(&vas_pseries_mutex);
		vas_user_win_add_mm_context(&txwin->vas_win.task_ref);
		return &txwin->vas_win;
	}
	mutex_unlock(&vas_pseries_mutex);

Is there something about h_modify_vas_window() or get_vas_user_win_ref()
that requires temporarily dropping the lock?
