Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D1947B3CD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 20:36:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHqbV0jRsz3cVr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 06:36:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D0nz/hk6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=D0nz/hk6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHqYb4j1gz30JT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 06:35:15 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BKIhrn3005646; 
 Mon, 20 Dec 2021 19:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Fv6S8AGmtXS8Ah6jta33Z8s3iT7LAOibEZtDVE+Gkgs=;
 b=D0nz/hk6hC4MkI/ZJTmWOc2GbIQkrVzhGzt07F5RRVktT9C3oLd9D64b30SUP8d8VuNu
 w0LUfyVV+LXAgkjGV59VTVkvvbPm08AdLbKe7M0d9NrgaNxCBSUSpCcqe05PqmxtHr1G
 GfgpEfWKYESJALO2Fk80FAxBv+Yd3OqAThTMQpTgD57yYzDjZbNG4Toz0JvtecXEsFxP
 SDnyEhU6w18mR/Ni7+5oHTb3lx7UutP+l7+4x7fyMF2AnlLRpUDBCWa7hVWoa4iabX1g
 KU4zGJ3uWTSXreXI1M9DCPYeUibpjnEq5khrswc6WMsr2CGshH/UmbcJZBIFnOE371V/ xA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1s6su0xq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 19:35:09 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BKJGViB012933;
 Mon, 20 Dec 2021 19:35:08 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1s6su0ws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 19:35:08 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BKJWc9U013123;
 Mon, 20 Dec 2021 19:35:06 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3d16wjfu7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 19:35:05 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BKJZ2nT44761554
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 19:35:02 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 513814C044;
 Mon, 20 Dec 2021 19:35:02 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83A764C040;
 Mon, 20 Dec 2021 19:34:57 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.com (unknown [9.211.62.204])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 Dec 2021 19:34:57 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: akpm@linux-foundation.org, linux-mm@kvack.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/fadump: opt out from freeing pages on cma
 activation failure
Date: Tue, 21 Dec 2021 01:04:19 +0530
Message-Id: <20211220193419.104242-3-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211220193419.104242-1-hbathini@linux.ibm.com>
References: <20211220193419.104242-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: w9IjLgFp5Y0bzSiyQOx6e-6v3kK3kHTX
X-Proofpoint-GUID: pA_kIVZImsaMQaqqrRHhAdNmZxfDaAG0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-20_09,2021-12-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112200107
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
Cc: david@redhat.com, mahesh@linux.ibm.com, sourabhjain@linux.ibm.com,
 osalvador@suse.de, Hari Bathini <hbathini@linux.ibm.com>,
 mike.kravetz@oracle.com
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
index b7ceb041743c..d1f7f79dfbd8 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -112,6 +112,12 @@ static int __init fadump_cma_init(void)
 		return 1;
 	}
 
+	/*
+	 * If CMA activation fails, do not let the reserved memory be exposed
+	 * to buddy allocator. As good as 'fadump=nocma' case.
+	 */
+	cma_dont_free_pages_on_error(fadump_cma);
+
 	/*
 	 * So we now have successfully initialized cma area for fadump.
 	 */
-- 
2.33.1

