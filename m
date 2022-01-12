Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0949948CC1D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 20:36:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYyVG61S9z3cSW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jan 2022 06:36:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lErzy3qW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lErzy3qW; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYySv3z2sz30Ny
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jan 2022 06:35:11 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CIRTcD016316; 
 Wed, 12 Jan 2022 19:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8Ozk8AMNRKFnQCEJsfN9wTAy3Jf74WfJoYw/ZixgF58=;
 b=lErzy3qW21tS16NFxPMOV7OnASRuYSa9ekI8mWJdXYcgU8QzEC6c9S4jrNX6S7LMjeZY
 qODqDET5hCVutkZEWBjJgY4vs0W3R6XlsYGtTTg9OyFC0TgOoMNcEQasfZb2hvvHcwg+
 RyeyyqX7spoJwIyYbdHpOdE9wYtVrkEUcIteXJ90a4wUE6hTSdZ5RZGgZIT5xlUmrHWP
 MgZSCl5InxEtxH/zKK1wz12vjIglXyH+XndyG23ojmlpg2aLEc3A79/vB6y908ol70l9
 TjLxftVRQPobqwXwOLynTgoKYcISLN5zLYRTh+VPTAYdGeaGc4302gQgkhP1063DsxLz iQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dj49jh7t1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 19:34:59 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CJUt6B011973;
 Wed, 12 Jan 2022 19:34:59 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dj49jh7sf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 19:34:58 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CJN4QK022760;
 Wed, 12 Jan 2022 19:34:56 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3df289ep9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 19:34:56 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20CJYrng47055276
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 19:34:53 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52775AE053;
 Wed, 12 Jan 2022 19:34:53 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FED2AE051;
 Wed, 12 Jan 2022 19:34:48 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.com (unknown [9.163.19.140])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jan 2022 19:34:48 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
 mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] powerpc/fadump: opt out from freeing pages on cma
 activation failure
Date: Thu, 13 Jan 2022 01:03:40 +0530
Message-Id: <20220112193340.149020-3-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220112193340.149020-1-hbathini@linux.ibm.com>
References: <20220112193340.149020-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dNCm72Urdu393CqVIGa1vFH9fM5rH5pe
X-Proofpoint-ORIG-GUID: Lfzo64ukQWg5tbf7RGJpScNXAtNA_-lc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_05,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120114
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
Cc: Hari Bathini <hbathini@linux.ibm.com>, mike.kravetz@oracle.com,
 mahesh@linux.ibm.com, sourabhjain@linux.ibm.com, osalvador@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With commit a4e92ce8e4c8 ("powerpc/fadump: Reservationless firmware
assisted dump"), Linux kernel's Contiguous Memory Allocator (CMA)
based reservation was introduced in fadump. That change was aimed at
using CMA to let applications utilize the memory reserved for fadump
while blocking it from being used for kernel pages. The assumption
was, even if CMA activation fails for whatever reason, the memory
still remains reserved to avoid it from being used for kernel pages.
But commit 072355c1cf2d ("mm/cma: expose all pages to the buddy if
activation of an area fails") breaks this assumption as it started
exposing all pages to buddy allocator on CMA activation failure.
It led to warning messages like below while running crash-utility
on vmcore of a kernel having above two commits:

  crash: seek error: kernel virtual address: <from reserved region>

To fix this problem, opt out from exposing pages to buddy allocator
on CMA activation failure for fadump reserved memory.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kernel/fadump.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index b7ceb041743c..82058b52e34a 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -112,6 +112,12 @@ static int __init fadump_cma_init(void)
 		return 1;
 	}
 
+	/*
+	 *  If CMA activation fails, keep the pages reserved, instead of
+	 *  exposing them to buddy allocator. Same as 'fadump=nocma' case.
+	 */
+	cma_reserve_pages_on_error(fadump_cma);
+
 	/*
 	 * So we now have successfully initialized cma area for fadump.
 	 */
-- 
2.34.1

