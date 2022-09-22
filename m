Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D9F5E6216
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 14:15:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYDl71sCMz3c7S
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 22:15:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RgqXoQ47;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RgqXoQ47;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYDkP2YxRz2ywY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 22:15:08 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28MBxF9A036223;
	Thu, 22 Sep 2022 12:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=YJT4R8Os4J4E5d7o3IhoRVRcnBNZtdep37aGVbRe68c=;
 b=RgqXoQ47cZqKdj669EOwXKRzpT/86bZh8IRplOHZj41KK4k67n+iNcDS+1sdwKfF6T/N
 OuIf+1IZB257MlfkrkSzWDPKsRc2F93MaVDl3urnRwJZbcLvnV9hh1rGqjDWi2bH4B1w
 bBsiuArr+BxZLFXu3EhcJeNMFfPknJNq0EQTCgchRAIx3h616ULK7/zmkKRYLFiHDX9m
 ScQneSKyM0vEv1JgFPqb8bLRa3RqGbHwbQQA9zFTTlATVjIVjCbAhdGmvQv+sQQgBSNS
 w8wn6WSqt0f0KlJvP9U9smqn85WgQNZLIuo2DHLtvCjJfdtveyE9g1eOIsW7jQea3lC7 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jrqad0kfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Sep 2022 12:15:02 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28MC0Op1001429;
	Thu, 22 Sep 2022 12:15:01 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jrqad0keg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Sep 2022 12:15:01 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28MC66C8020452;
	Thu, 22 Sep 2022 12:15:00 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by ppma01wdc.us.ibm.com with ESMTP id 3jn5v9rk6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Sep 2022 12:15:00 +0000
Received: from smtpav01.dal12v.mail.ibm.com ([9.208.128.133])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28MCExPE66650448
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Sep 2022 12:14:59 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD09558063;
	Thu, 22 Sep 2022 12:14:57 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C40F758062;
	Thu, 22 Sep 2022 12:14:57 +0000 (GMT)
Received: from localhost (unknown [9.163.93.105])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 22 Sep 2022 12:14:57 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Haren Myneni <haren@linux.ibm.com>, mpe@ellerman.id.au, npiggin@gmail.com,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/pseries: Move vas_migration_handler early
 during migration
In-Reply-To: <d8efade91dda831c9ed4abb226dab627da594c5f.camel@linux.ibm.com>
References: <d8efade91dda831c9ed4abb226dab627da594c5f.camel@linux.ibm.com>
Date: Thu, 22 Sep 2022 07:14:57 -0500
Message-ID: <87czbnr4fy.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BcYi9jaXezA6asP6W5x9SHoOxVkJRNyw
X-Proofpoint-ORIG-GUID: aKNG3h-kwdigZXNSHD7fwPjgWguXH3U8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-22_08,2022-09-22_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209220080
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni <haren@linux.ibm.com> writes:
> When the migration is initiated, the hypervisor changes VAS
> mappings as part of pre-migration event. Then the OS gets the
> migration event which closes all VAS windows before the migration
> starts. NX generates continuous faults until windows are closed
> and the user space can not differentiate these NX faults coming
> from the actual migration. So to reduce this time window, close
> VAS windows first in pseries_migrate_partition().

I'm concerned that this is only narrowing a window of time where
undesirable faults occur, and that it may not be sufficient for all
configurations. Migrations can be in progress for minutes or hours,
while the time that we wait for the VASI state transition is usually
seconds or minutes. So I worry that this works around a problem in
limited cases but doesn't cover them all.

Maybe I don't understand the problem well enough. How does user space
respond to the NX faults?
