Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F207D6E64
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Oct 2023 16:06:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AUoZEId0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SFrLY71gzz3cLk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 01:05:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AUoZEId0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SFrKg4MC5z2xdf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 01:05:10 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39PDxXK3018981;
	Wed, 25 Oct 2023 14:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=UpzMQgXBLNK/EoivKscrvN6Dy+dSEl664zEdv9NSTs4=;
 b=AUoZEId0nLkiY2sDfUKRsqDhWFvEqv4ZfECZRHsb7W4EdXUcnIyEgo7i/+F84XsCgxDt
 002Hd/UZwct4TH6A5rzyfUROM4a5TsFMLDdjauz7a8fj+U+h0PyPl0Er9oH03tbnaPXa
 lmOVLypI5UeU4SpVV/FHk0rtqF1qDO39rxwiqGStokZw7fCZtSX2+NB2T7NPWwu83nV8
 7g2Y1V4DFlRCDaodKTyGoX63pJo3Zah+6qBNcCqRZi+b6Bi1OyDk2mopA4i1e/IDhYuC
 si06sWyP82qvHTDn8nDS5hgXYgod+sME0ASZOlYRmqzq/e4Wj3OK0xR5mQTv6Mg6bunm 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ty487gdn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Oct 2023 14:05:03 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39PDxobs021210;
	Wed, 25 Oct 2023 14:05:02 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ty487gdmc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Oct 2023 14:05:02 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39PCPohq012387;
	Wed, 25 Oct 2023 14:05:02 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tvup1xj8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Oct 2023 14:05:02 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39PE50Q724379998
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Oct 2023 14:05:00 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 275605805E;
	Wed, 25 Oct 2023 14:05:00 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 048375805F;
	Wed, 25 Oct 2023 14:05:00 +0000 (GMT)
Received: from localhost (unknown [9.61.190.226])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Oct 2023 14:04:59 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3] powerpc/pseries/vas: Migration suspend waits for no
 in-progress open windows
In-Reply-To: <20231020004424.1370320-1-haren@linux.ibm.com>
References: <20231020004424.1370320-1-haren@linux.ibm.com>
Date: Wed, 25 Oct 2023 09:04:59 -0500
Message-ID: <87y1fq3iic.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: b4jOJBz_o_MuYt7bnGBMUaHFIH3fvsay
X-Proofpoint-GUID: 0MK4tGH8jWfgR1RlVrkHLDTy2fJIEyfX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-25_02,2023-10-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1011 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310250120
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
Cc: Haren Myneni <haren@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
>
> This patch resolves the issue with the following steps:
> - Set the migration_in_progress flag without holding mutex.
> - Introduce nr_open_wins_progress counter in VAS capabilities
>   struct
> - This counter tracks the number of open windows are still in
>   progress
> - The allocate setup window thread closes windows if the migration
>   is set and decrements nr_open_window_progress counter
> - The migration handler waits for no in-progress open windows.
>
> Fixes: 37e6764895ef ("powerpc/pseries/vas: Add VAS migration handler")
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>

Thanks for bearing with me Haren. While I still think this code would
benefit from reevaluating the overall locking model, that can be taken
up later. I can't identify any bugs in this version.

Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>
