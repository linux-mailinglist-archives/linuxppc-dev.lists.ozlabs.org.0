Return-Path: <linuxppc-dev+bounces-5456-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0526BA180A7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 16:05:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ycr9X3JN9z306d;
	Wed, 22 Jan 2025 02:05:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737471920;
	cv=none; b=IXHQaFAIws0Hu4JuX3Wyi9m8M182uwX9YRevCbAh5eYuNVmTlUpa67jy79lA/KdiEMA9AjMzcCebJRAgpD4g+186/F3J9Y4w6Dh75jn+qBjLA1AlXPx3rIHAH35lp4teHVd8BxEVdgfjoWDkfeowWXf7IsIi4BZScvsR1qWa3SFm+7Fo0VotwzhUd6JueQqT6em+/YDKSvJgl92RNArb19ackhnouvV41gm38m7E2hO1N5PGmFm5xUMq+s59IXpV2tVxPQDrrfrjJIIBfOeSTppgVlJZ8wS/SEgiuFgM5ytEkgoEVpaIdB0mjOj+KwzsYRLYuaz7npFUyvLgY4BrLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737471920; c=relaxed/relaxed;
	bh=0WHdHb6F/UdUkGp/zgeU43qqnF+ZgyA8tTBJiib4Y5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gUBw6P+OfS+iMGAvU/HNR9E8vkt0POVopfxg41EYubPvE4N1GlQ0eIX0jVVX+G+T79Peu0TiRnXs0lsyaT8copY+WaJzflaoNyzwWDdJQeBhcoyyjw3x2YXFl89FlUp/dTHCy24lNvZ78axdt1Wfo9LN8wpxLpsUf/9ns7mL3KFGHbIVYldTsz07xsJhLxE1LpH/NNHPQGtDrLJq1p5Gsw86b/SKRyJ5OXKB1+/Sn6dNRdqvBleonsCkD9IXlJF850r+YRyyL2ou7ssWMRmDPNfBms9js6i7XI833DchD+PfuSEXAwDPTQvKjn7o5BdMD3bitlJ4TP43uDyeCjxP4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mthAQY4+; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mthAQY4+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ycr9W1fyHz301Y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 02:05:18 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50LDJKEi003049;
	Tue, 21 Jan 2025 15:04:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=0WHdHb6F/UdUkGp/zgeU43qqnF+ZgyA8tTBJiib4Y
	5E=; b=mthAQY4+1lxPsoCGSEykXMvMfgwTCbndnXV4EVtNUmCCmdHnu8+BEaWoY
	b4fXI9DiQ7hGHPq+iA5uzTvarWQ1Bsb6L2yzV0cwsGlCGEBC/+4tDoCv0g0Vs6HF
	SMbr6FOTxCgDSMgzZVYqxpCw0fAsKZaWuo9yGTkln5jAoU74opxFxkCjVSbUP8zX
	f0sPiJo/0t/8WRMM0XXq67tnkPaMGe+5f8tMCwBK7z8xdmWhlPebOHMS3RxMWii/
	YuDTcvpefjkf+Zi3kq/Frnc2Rj292PD3huqUO2KXoqYYdye893+qJQchmoKQpc6M
	KP7y5gwuZjg1QtPyznk3L95L4VPTQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44a2dyb80r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 15:04:42 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50LD9Z8b019223;
	Tue, 21 Jan 2025 15:04:41 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 448pmsbugn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 15:04:41 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50LF4aJq57672080
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jan 2025 15:04:37 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFFF820043;
	Tue, 21 Jan 2025 15:04:36 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F0CF20040;
	Tue, 21 Jan 2025 15:04:33 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.54.128])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 Jan 2025 15:04:32 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: akpm@linux-foundation.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Muchun Song <muchun.song@linux.dev>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] mm/hugetlb: bring gigantic page allocation under hugepages_supported()
Date: Tue, 21 Jan 2025 20:34:19 +0530
Message-ID: <20250121150419.1342794-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: waNMvQVPCRQmQ47C0vVOdm-GXBHxCt8K
X-Proofpoint-ORIG-GUID: waNMvQVPCRQmQ47C0vVOdm-GXBHxCt8K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_06,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1011
 mlxscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 mlxlogscore=921 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501210122
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Despite having kernel arguments to enable gigantic hugepages, this
provides a way for the architecture to disable gigantic hugepages on the
fly, similar to what we do for hugepages.

Components like fadump (PowerPC-specific) need this functionality to
disable gigantic hugepages when the kernel is booted solely to collect
the kernel core dump.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---

To evaluate the impact of this change on architectures other than
PowerPC, I did the following analysis:

For architectures where hugepages_supported() is not redefined, it
depends on HPAGE_SHIFT, which is found to be a constant. It is mostly
initialized to PMD_SHIFT.

Architecture : HPAGE_SHIFT initialized with

ARC: PMD_SHIFT (constant)
ARM: PMD_SHIFT (constant)
ARM64: PMD_SHIFT (constant)
Hexagon: 22 (constant)
LoongArch: (PAGE_SHIFT + PAGE_SHIFT - 3) (appears to be constant)
MIPS: (PAGE_SHIFT + PAGE_SHIFT - 3) (appears to be constant)
PARISC: PMD_SHIFT (appears to be constant)
RISC-V: PMD_SHIFT (constant)
SH: 16 | 18 | 20 | 22 | 26 (constant)
SPARC: 23 (constant)

So seems like this change shouldn't have any impact on above
architectures.

On the S390 and X86 architectures, hugepages_supported() is redefined,
and I am uncertain at what point it is safe to call
hugepages_supported().

---
 mm/hugetlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index cec4b121193f..48b42b8d26b4 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4629,7 +4629,7 @@ static int __init hugepages_setup(char *s)
 	 * But we need to allocate gigantic hstates here early to still
 	 * use the bootmem allocator.
 	 */
-	if (hugetlb_max_hstate && hstate_is_gigantic(parsed_hstate))
+	if (hugetlb_max_hstate && hstate_is_gigantic(parsed_hstate) && hugepages_supported())
 		hugetlb_hstate_alloc_pages(parsed_hstate);
 
 	last_mhp = mhp;
-- 
2.47.1


