Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 382303A2732
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 10:37:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0y5J52DXz3c4J
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 18:37:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qxjHDhYi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qxjHDhYi; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0y4N3sfLz305k
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 18:36:20 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15A8XPBh084016; Thu, 10 Jun 2021 04:36:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=DBitabiBRhoE/J0HZ2jODXsdwoT6x/60dIp50f/WlPI=;
 b=qxjHDhYij2nWBqyo2tIfTvbiH957DBXCVEaJ9228RiViYU3SjrnBEylugoZVmuPam25q
 2q50LkUpykKH3FYIMdXa/RpzxpUNDfSWj3nUDjibVYulzshra8va2fs6j6OR/KcbKn6O
 E4QE5z6hWmcNaNEykNGJ9lXNI39kVYa3ZSlSOHZnW5Id01Bt9IfiVQAseymqMhHpner1
 p0I0ozVlSyBDmfuFGQnt8MUo9h2Oxw4+M+Mur5Cf0l9zuRJCHtxmQSuROgM7ZA8Omkz/
 xAF9wMwIFuNV3ZvEtaYon2xhAl/0ZcEidCibceG6eQ1YCUD44Nh1LVKVISq7DCFFxxfe zA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 393eps9ct7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 04:36:01 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15A8a0Rw092970;
 Thu, 10 Jun 2021 04:36:01 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 393eps9csf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 04:36:00 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15A8X0HB014756;
 Thu, 10 Jun 2021 08:35:59 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 3900w9eh4e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 08:35:59 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15A8ZwZN11993728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Jun 2021 08:35:58 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 817526A047;
 Thu, 10 Jun 2021 08:35:58 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE2D66A04F;
 Thu, 10 Jun 2021 08:35:54 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.3.162])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 10 Jun 2021 08:35:54 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH 0/6] mremap fixes
Date: Thu, 10 Jun 2021 14:05:43 +0530
Message-Id: <20210610083549.386085-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: z0qThnZ4CD026-qKf2517nZCjJvHtn57
X-Proofpoint-ORIG-GUID: Z3SyftLEtWSN6tZYvUJydc-LoTPW-6T_
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-10_03:2021-06-10,
 2021-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 impostorscore=0 mlxlogscore=773 bulkscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106100055
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

I will send the ppc64 specific changes separately once we agree on how to handle the
TLB flush changes.


Aneesh Kumar K.V (6):
  selftest/mremap_test: Update the test to handle pagesize other than 4K
  selftest/mremap_test: Avoid crash with static build
  mm/mremap: Convert huge PUD move to separate helper
  mm/mremap: Don't enable optimized PUD move if page table levels is 2
  mm/mremap: Use pmd/pud_poplulate to update page table entries
  mm/mremap: hold the rmap lock in write mode when moving page table
    entries.

 mm/mremap.c                              |  93 +++++++++++++++---
 tools/testing/selftests/vm/mremap_test.c | 118 ++++++++++++-----------
 2 files changed, 143 insertions(+), 68 deletions(-)

-- 
2.31.1

