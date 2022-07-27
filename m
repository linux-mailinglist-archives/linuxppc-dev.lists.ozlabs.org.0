Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 364C15823E9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 12:11:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lt8gx6KMRz3cS8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 20:11:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DCgCqSUU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DCgCqSUU;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lt8gG2cVKz2yT0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 20:10:49 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26R9tuwq003440;
	Wed, 27 Jul 2022 10:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=Btvhh+0Q1z5/M9Ck8Tw1udY6NkBdiQDICS53v+anSJ8=;
 b=DCgCqSUULN7P5W0bxpi76TLbPrD5nbmpU8i/96KoxBvWDHUXmmiUJHgj3jQi02Kpj8FR
 J1cfo6zAiAkTSzaQMwiVoovOTy6vX6Wq/LbdAdet/xVHKXNyYQ/PpA6kXgRRNjUfHtIi
 KkdGnvMvgynJ5SRqrA1RYhW6cIUZXgoEZnZSLUcO+d9MAaAvDEWG+S+gBaB1riKApKpz
 5Lf4W/ORHt1h8+htE9M2H+AeJ0toHCEkH+c6GmqnCWhNwy5SHIOO808h51xp8PqZr+aV
 Dilfv5AxDQWCVXfwV7YXN4VlBM9AeE69m8pHxD9O1m0hr4Pyjh0dRLfBZR7zsSawToyA xg== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hk35t8s4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Jul 2022 10:10:44 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26RA7P50030210;
	Wed, 27 Jul 2022 10:10:41 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma04fra.de.ibm.com with ESMTP id 3hg945kppm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Jul 2022 10:10:41 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26RAAdbK24248760
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Jul 2022 10:10:39 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 00A3A5204E;
	Wed, 27 Jul 2022 10:10:39 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.70.200])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id DBC0F5204F;
	Wed, 27 Jul 2022 10:10:37 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: [PATCH] watchdog: Fix build error when CONFIG_SOFTLOCKUP_DETECTOR
 is not set
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20220727092109.31362-1-ldufour@linux.ibm.com>
Date: Wed, 27 Jul 2022 15:40:36 +0530
Content-Transfer-Encoding: 7bit
Message-Id: <23117A1A-0607-4700-95FC-C1F0DCC1E3B0@linux.ibm.com>
References: <20220727092109.31362-1-ldufour@linux.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
X-Mailer: Apple Mail (2.3696.100.31)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Znep5W-zpHGlqrJwDk17fNwedJaqfLCX
X-Proofpoint-ORIG-GUID: Znep5W-zpHGlqrJwDk17fNwedJaqfLCX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_07,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207270041
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
Cc: linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> The definition of lockup_detector_reconfigure should be exported even in
> that case, and __lockup_detector_reconfigure should remain static.
> 
> Fixes: 24a1260705b7 ("watchdog: export lockup_detector_reconfigure")
> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
> kernel/watchdog.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)

Thanks Laurent for the fix.

Tested-by: Sachin Sant <sachinp@linux.ibm.com>


 - Sachin
