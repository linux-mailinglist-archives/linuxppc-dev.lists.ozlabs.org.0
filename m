Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CAF36F6BF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 09:56:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWl7S1k6bz30BJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 17:56:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j1n+B9fB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=j1n+B9fB; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWl705cCDz2yRS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 17:56:12 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13U7Xf8e165533; Fri, 30 Apr 2021 03:56:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=qSNlGBTsQc8IdEqbrxSJlWA3PrEjfWTwprG8DAFjUPM=;
 b=j1n+B9fBSX/VAkioxCNaDagY3BupAGAVRLyauzgnb7gOEu//3Cp7KdrOjWiv+Gou4eX3
 YqaUVJZa780U4hWqbKoRtOxFF/SjLOGvfIfd4JzwsVqNFk0lEbBwOSaLz3HI/oVCf2Wn
 6qhRLeenGkdmsuZ2CSgzgz4GmXvxFlxsk2ZwxQRb7qA6oPLd+kV0lzOy6M5PseLzLznT
 0vG2+cw0C+FMI97/dfFJA7TcRWqlW6q18pg6LK+7INl4BpF9u7/HvYUIs2ZIhlWt9Y3a
 MUcjpctomBmNFoyOABOUks5RBf3JIoFAvo4+kNW6zaz6TDuyg3fzsLH9QdaVKkQR7E2K nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 388ahvw6qa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 03:56:04 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13U7cJlk191205;
 Fri, 30 Apr 2021 03:56:03 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 388ahvw6pf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 03:56:03 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13U7s64G024545;
 Fri, 30 Apr 2021 07:56:02 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 384gjxsm3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 07:56:01 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13U7tYgn32768416
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 07:55:34 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F2C74204B;
 Fri, 30 Apr 2021 07:55:59 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 451464203F;
 Fri, 30 Apr 2021 07:55:58 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 30 Apr 2021 07:55:58 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/powernv/memtrace: Fix dcache flushing
Date: Fri, 30 Apr 2021 13:25:57 +0530
Message-Id: <20210430075557.893819-1-sandipan@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sT_AZbvgUKSYtKSYiPqjkPv333NSaUM3
X-Proofpoint-GUID: _0sEfKMtpWpXSdehJLnc9luF8SqB7eBC
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_03:2021-04-28,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104300053
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
Cc: aneesh.kumar@linux.ibm.com, rashmica.g@gmail.com, david@redhat.com,
 linuxppc-dev@lists.ozlabs.org, jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Trace memory is cleared and the corresponding dcache lines
are flushed after allocation. However, this should not be
done using the PFN. This adds the missing __va() conversion.

Fixes: 2ac02e5ecec0 ("powerpc/mm: Remove dcache flush from memory remove.")
Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/memtrace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/platforms/powernv/memtrace.c
index 71c1262589fe..a31f13814f2e 100644
--- a/arch/powerpc/platforms/powernv/memtrace.c
+++ b/arch/powerpc/platforms/powernv/memtrace.c
@@ -104,8 +104,8 @@ static void memtrace_clear_range(unsigned long start_pfn,
 	 * Before we go ahead and use this range as cache inhibited range
 	 * flush the cache.
 	 */
-	flush_dcache_range_chunked(PFN_PHYS(start_pfn),
-				   PFN_PHYS(start_pfn + nr_pages),
+	flush_dcache_range_chunked((unsigned long)__va(PFN_PHYS(start_pfn)),
+				   (unsigned long)__va(PFN_PHYS(start_pfn + nr_pages)),
 				   FLUSH_CHUNK_SIZE);
 }
 
-- 
2.25.1

