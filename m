Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1498D3A90C5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 06:53:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4Xrj4yXPz308H
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 14:53:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QnNj9/TZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QnNj9/TZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4Xr80xDwz306f
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 14:53:11 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15G4htId135353; Wed, 16 Jun 2021 00:52:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=r9CirDrXQNjLQ2yIR3GYe3cnblxHrQbGnXzz1980pAc=;
 b=QnNj9/TZxPOV8ht6Q0K770m7xiVQx3Nh2QBipXr7JARlfqkAk9vTDwdDcFK0JfNSEvEM
 xMciFcUZJaiQ8ofrTx7ixD90Ar8FONT+lxBt4sxXULwvf2Ss4RjAnsXGLfslEBP1FhtG
 ZO09/j0YP+Ddw+OJxTKc2Se1/l/2GuO/6UIjuIu7utstO4zJrOPPGXt0GHFSWwHgbMMp
 idEwa0yqmJavI5h6z+4sisieWeAp1XBvv/4MKRrmBvWhUQWFdPZ/jR5yh/TxgMKdwApz
 d+C00MqyFIj2qsbeFbY7kCjCeHG0O6YoyTgiXjfgn0Xk3+DRjIoXpMsdS7iA/cm2gmCp sw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 397ahd8532-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 00:52:54 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15G4mlEC150071;
 Wed, 16 Jun 2021 00:52:53 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 397ahd852s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 00:52:53 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15G4qe3w004546;
 Wed, 16 Jun 2021 04:52:52 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 394mj9nf5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 04:52:52 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15G4qpkm30015942
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 04:52:51 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2BE278060;
 Wed, 16 Jun 2021 04:52:51 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E92D478064;
 Wed, 16 Jun 2021 04:52:47 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.71.33])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Jun 2021 04:52:47 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v2 0/6] mrermap fixes
Date: Wed, 16 Jun 2021 10:22:33 +0530
Message-Id: <20210616045239.370802-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JJy9Tj6FkqYdMJy6i5yN23-fSLUBnoHm
X-Proofpoint-ORIG-GUID: yZQdOLIcXijjfk2MIPuRqoyougWcXJhn
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_09:2021-06-15,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 mlxlogscore=995 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106160027
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, npiggin@gmail.com,
 kaleshsingh@google.com, joel@joelfernandes.org,
 "Kirill A . Shutemov" <kirill@shutemov.name>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series is split out series from [PATCH v7 00/11] Speedup mremap on ppc64
(https://lore.kernel.org/linux-mm/20210607055131.156184-1-aneesh.kumar@linux.ibm.com)
dropping ppc64 specific changes.

This patchset is dependent on
https://lore.kernel.org/linux-mm/20210615110859.320299-1-aneesh.kumar@linux.ibm.com

ppc64 specific changes will be sent as a separate series depending on this patchset.

Changes from v1:
* cc stable@kernel.org
* USe the correct config for TRANSPARENT_HUGEPAGE_PUD
* use pud_pgtable instead of pud_page_vaddr


Aneesh Kumar K.V (6):
  selftest/mremap_test: Update the test to handle pagesize other than 4K
  selftest/mremap_test: Avoid crash with static build
  mm/mremap: Convert huge PUD move to separate helper
  mm/mremap: Don't enable optimized PUD move if page table levels is 2
  mm/mremap: Use pmd/pud_poplulate to update page table entries
  mm/mremap: hold the rmap lock in write mode when moving page table
    entries.

 mm/mremap.c                              |  92 +++++++++++++++---
 tools/testing/selftests/vm/mremap_test.c | 118 ++++++++++++-----------
 2 files changed, 142 insertions(+), 68 deletions(-)

-- 
2.31.1

