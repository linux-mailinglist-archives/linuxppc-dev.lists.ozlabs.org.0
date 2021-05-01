Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B88F93707CC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 18:03:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FXYv45MkJz30Dr
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 May 2021 02:03:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n77PJZuw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=n77PJZuw; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FXYtW0dvyz2xYd
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 May 2021 02:03:14 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 141Fj4nN113369; Sat, 1 May 2021 12:03:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=QUROK0O3RBRMPVQOkAZz/GgaqEJmkmgVRQSkpuAOQMI=;
 b=n77PJZuwvdCQMBmDf0rk8aUfIynGP1s+UWEk3GXrlYLPQrbpv0adRy1y5+zovXf20D6H
 b8qcF7xT3/tKAojkpYYFKwLx7pooY5FmZEg7giXXc125IR7eP6MXLegXaRNQkqHcs5xW
 PJyQEJVEsZ0R4Yrs7hTDClH3i3HCCzOs/AbysJ+S30qpCJ4jaLYojURapc/ElHzsqx4U
 4YwsRrzSVSvXUHaPIYQ+ZI+oKcMveKzoFRa6PXGEuWy5z/iAEqanRod3R6+ueJxSpM65
 OQspg0bd4RolGabv5hc7IWiBhMHnrk0uhRPwhB4sjfNYp4tNSW3wa73CuDVtQEwbBdS1 Tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3899w5g7pf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 01 May 2021 12:03:01 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 141FkCFg114773;
 Sat, 1 May 2021 12:03:01 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3899w5g7p1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 01 May 2021 12:03:00 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 141G2xm3002049;
 Sat, 1 May 2021 16:02:59 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 388xm8r58b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 01 May 2021 16:02:59 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 141G2WMo36176354
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 1 May 2021 16:02:32 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E09C3AE045;
 Sat,  1 May 2021 16:02:56 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 727CAAE053;
 Sat,  1 May 2021 16:02:55 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat,  1 May 2021 16:02:55 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2] powerpc/powernv/memtrace: Fix dcache flushing
Date: Sat,  1 May 2021 21:32:54 +0530
Message-Id: <20210501160254.1179831-1-sandipan@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6ZIAc8AZLkdKMazRUZcNKQgHoltA3IjM
X-Proofpoint-GUID: qtlRgfCHNyaISvbqvyRTYioE4seRASoT
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-01_10:2021-04-30,
 2021-05-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105010112
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
Cc: david@redhat.com, aneesh.kumar@linux.ibm.com, jniethe5@gmail.com,
 rashmica.g@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Trace memory is cleared and the corresponding dcache lines
are flushed after allocation. However, this should not be
done using the PFN. This adds the missing conversion to
virtual address.

Fixes: 2ac02e5ecec0 ("powerpc/mm: Remove dcache flush from memory remove.")
Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
---
Previous versions can be found at:
v1: https://lore.kernel.org/linuxppc-dev/20210430075557.893819-1-sandipan@linux.ibm.com/

Changes in v2:
- Added review tag from Aneesh.
- Used pfn_to_kaddr() based on Christophe's suggestion.

---
 arch/powerpc/platforms/powernv/memtrace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/platforms/powernv/memtrace.c
index 71c1262589fe..537a4daed614 100644
--- a/arch/powerpc/platforms/powernv/memtrace.c
+++ b/arch/powerpc/platforms/powernv/memtrace.c
@@ -104,8 +104,8 @@ static void memtrace_clear_range(unsigned long start_pfn,
 	 * Before we go ahead and use this range as cache inhibited range
 	 * flush the cache.
 	 */
-	flush_dcache_range_chunked(PFN_PHYS(start_pfn),
-				   PFN_PHYS(start_pfn + nr_pages),
+	flush_dcache_range_chunked((unsigned long)pfn_to_kaddr(start_pfn),
+				   (unsigned long)pfn_to_kaddr(start_pfn + nr_pages),
 				   FLUSH_CHUNK_SIZE);
 }
 
-- 
2.25.1

