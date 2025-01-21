Return-Path: <linuxppc-dev+bounces-5444-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B9EA17D51
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 12:55:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YclyG687Cz30Qk;
	Tue, 21 Jan 2025 22:55:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737460518;
	cv=none; b=NvZ2IHaQJZIolZ/7PpcOlrY1NNw49nznIFHVO2TojWXkEaJYW7JjycXUlyXvjCocs4WTxTdK8uwaPIXvnyoCKgbQ19cv2AN6thN0Rh9oIPO0bwqSvsUjL37FC6hztmGWjsY7lSC0O0Tzhin3sCC+MQSJSLbIhXnwa48IWOlrQMef8bQa4l0a61yKLopsMFbTqubwXsmini7qLIgZcUCwblL9aIVUHep/rcI5SHY5Up4DtmXYes/2tzqEBauuv829ABG0eGAI5O5Mm/FX5FY4p5OEHA1EWCa5chhLoZ6TTulOv38BJwVh7sv4lXu++QELtt4RhD1klt5irNFNBa1gVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737460518; c=relaxed/relaxed;
	bh=KjRS4jKfUPyn+07y/7uSLkCDwkxCgQHfk6gYB+4bjqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H7kUmEJOEs/PI1bRdWoksTJg8Aa4qXE35v+fa01gscoB8ybkxK4x4hwgtVP7aAEzAb6coGGyBaOZmZkUSjPFWavY1ukmAiDnuOugWTulA3DTIuV9M8Wx/bPAOAaazgQteR4Rvdl3Za/mk2R/6Npyqs2tZ31ra6I7lusemwrJ2JSnGvHi/coKz4nPzs7QFZ2f0DOZ9Iwz/gKUAPgA/iOp3SN383OlWfaf+Jetj6AtJwBlSz3YsgbpPo8Kv98cbO8e3cnw6vcp9BwB20refcB+3kpXuHPQLsZU4RqBUu8uGiTmaxnC4IoqAho2q7ZVwElJSJieMrZZgXJCJpRPWoBROg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JTFl2gr5; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JTFl2gr5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YclyG16Z0z30C5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 22:55:17 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L6iRSR004613;
	Tue, 21 Jan 2025 11:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=KjRS4jKfUPyn+07y/
	7uSLkCDwkxCgQHfk6gYB+4bjqg=; b=JTFl2gr576rOcPUJmfQdLHf9lqZt535Jq
	k7g9X1kj0hHQuDPwS9Nl7bSGFLGGLD1FQgx/EPc8txVsxBWMlPDyxRSVb1UpDVeq
	9s6wkMPgR4TpoaJoBjd8mphnuQG3LdYm/VwS6i7du/MU4bk3jhNa4tK/WjMP+RxA
	zudlI3vrmReKTrrJ6AKSlzOZVB+TWw4bXyQoFnrAdjvlqG448CW/t2tIQix81Hnk
	kattmRF5+kWwIme7+1vZDv6P5sQPj54VXNCXfRnxZbp2M9Rp9fUocz3htlHA9S3o
	HEPAlnfC6lh8o14t+WGAAr6LiW+QhEGURafRuM1nsEuRfzMLTMJDw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 449rrych5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 11:55:08 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50L92Zaw019218;
	Tue, 21 Jan 2025 11:55:08 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 448pmsb5p4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 11:55:07 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50LBt44d28115630
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jan 2025 11:55:04 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B6EB2004B;
	Tue, 21 Jan 2025 11:55:04 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9185D20040;
	Tue, 21 Jan 2025 11:55:01 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.54.128])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 Jan 2025 11:55:01 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>
Subject: [PATCH v2 4/6] powerpc/kdump: preserve user-specified memory limit
Date: Tue, 21 Jan 2025 17:24:40 +0530
Message-ID: <20250121115442.1278458-5-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121115442.1278458-1-sourabhjain@linux.ibm.com>
References: <20250121115442.1278458-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-GUID: KbBykFowyEE_QlXtcdph-dB5IUFImKzF
X-Proofpoint-ORIG-GUID: KbBykFowyEE_QlXtcdph-dB5IUFImKzF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_05,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210095
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Commit 59d58189f3d9 ("crash: fix crash memory reserve exceed system
memory bug") fails crashkernel parsing if the crash size is found to be
higher than system RAM, which makes the memory_limit adjustment code
ineffective due to an early exit from reserve_crashkernel().

Regardless lets not violated the user-specified memory limit by
adjusting it. Remove this adjustment to ensure all reservations stay
within the limit. Commit f94f5ac07983 ("powerpc/fadump: Don't update
the user-specified memory limit") did the same for fadump.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan he <bhe@redhat.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/kexec/core.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
index b8333a49ea5d..4945b33322ae 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -150,14 +150,6 @@ void __init reserve_crashkernel(void)
 		return;
 	}
 
-	/* Crash kernel trumps memory limit */
-	if (memory_limit && memory_limit <= crashk_res.end) {
-		memory_limit = crashk_res.end + 1;
-		total_mem_sz = memory_limit;
-		printk("Adjusted memory limit for crashkernel, now 0x%llx\n",
-		       memory_limit);
-	}
-
 	printk(KERN_INFO "Reserving %ldMB of memory at %ldMB "
 			"for crashkernel (System RAM: %ldMB)\n",
 			(unsigned long)(crash_size >> 20),
-- 
2.47.1


