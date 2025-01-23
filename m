Return-Path: <linuxppc-dev+bounces-5506-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D3BA1A352
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 12:43:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdzbR2bGnz305S;
	Thu, 23 Jan 2025 22:43:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737632595;
	cv=none; b=T3gGEobieflI7vGpZTioRmBNK6m2b5bpk29ht40Rk0/bM6HE2lekJKg7kkNZaq1pP1Qvqygf4M44RS0vDeHPAr7TXq3O3B6oEkgA5LQ9v0yLawz9uWxJxFMG+sZvPEpE5/SYqKJQ2o0azvuPcBlOuWdZhd42JCIGprzKo6Vq3hq7Ro72YL3dmU2/8oGbMrFSx/EI5Y+3EmEMx7rcK+jKIV/EnSSb6fX5+BAyY+E95964DkncVsQ0NfnJ87MiA+syEKqVa4JpILNc4ISbNQahnFWLaRRPrpaZvfdgDE8sa2njikJrvTWibzHBpYZyO0rRp5BtqTDC102TRQ7OCM2hug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737632595; c=relaxed/relaxed;
	bh=M0w1yiUpLjI9qtKw9fJUMskVCkLqWqgdbbqdp//ujzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i9G3fNEpEanjF0T1C6hl8P8dpQP+a3m4+mZFaXJ6RgVdynAIaUbpcYRzBAA54REpSYBMa5bgGMhh5cVKapCOvM6XfHbs0i7EP4q6BhDsTXyxBJqQJj2s/pE04Olat/vmyoxDzeJgNKzaEwfj8/WBrpwCI8B1WVLASuDg15awX6054TmOpLnGdwURomOKL74YkilZC50uZvrH4DDrkUr3ugWQ3PG0AN3apd1F3VLriJqqtppxxUKHsMmD70h/lPx2W4XOmU7ULJbWcDWikXSma3hfIHo97hLDEeHMlAzj4QGMAhpSZ870fy8nNM4gKx4do/bPJFOxEfAYyIwOa+Wwkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bRtLcODN; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bRtLcODN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YdzbQ5Swhz304C
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 22:43:14 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N20kBB027778;
	Thu, 23 Jan 2025 11:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=M0w1yiUpLjI9qtKw9
	fJUMskVCkLqWqgdbbqdp//ujzE=; b=bRtLcODNTOY7P80qeHIMrZfHUU1/3HETv
	EPP+ND8DxxDkOU3kMiQi8VkYMQjGmzIPzX2APkAFLRAoRMflCwFDvrn2IPsezEsY
	P9Z5QnMGU6GEUU4BBW840pUC4Bsz6575XW2P5J3/JJtwUQprS+d4SJMocjwQVOF3
	Qw9m96O3DHzq76ddNk0DXvso4S5ZP5u5ZBfCUvb1PxD//yXz9ZBuyu3LSqTHmago
	rEAVlrK0hKOaunL4pTqd/WuXOWXVhv1iGc09dBxtMu+ENNkzTW5Ri60KbeLBOHoC
	wysIczYN41NSCfT9om+/hstNE2pxmqCDAho4M6it9NuM4kWB8Pa3g==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44b2xyn774-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 11:43:07 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50N7wX7p022381;
	Thu, 23 Jan 2025 11:43:06 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 448r4kd759-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 11:43:06 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50NBh2Pj55968128
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 11:43:02 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C46822004B;
	Thu, 23 Jan 2025 11:43:02 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B841320040;
	Thu, 23 Jan 2025 11:43:00 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.94])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jan 2025 11:43:00 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Avnish Chouhan <avnish@linux.ibm.com>,
        Brian King <brking@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>
Subject: [PATCH v3 1/4] powerpc: export MIN RMA size
Date: Thu, 23 Jan 2025 17:12:51 +0530
Message-ID: <20250123114254.200527-2-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250123114254.200527-1-sourabhjain@linux.ibm.com>
References: <20250123114254.200527-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-GUID: 41afIUfXRM7jMfDGLomxAvx4YR_FvTaq
X-Proofpoint-ORIG-GUID: 41afIUfXRM7jMfDGLomxAvx4YR_FvTaq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_05,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 mlxlogscore=711 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501230087
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Commit 683eab94da75bc ("powerpc/fadump: setup additional parameters for
dump capture kernel") introduced the additional parameter feature in
fadump for HASH MMU with the understanding that GRUB does not use the
memory area between 640MB and 768MB for its operation.

However, the third patch ("powerpc: increase MIN RMA size for CAS
negotiation") in this series is changing the MIN RMA size to 768MB,
allowing GRUB to use memory up to 768MB. This makes the fadump
reservation for the additional parameter feature for HASH MMU
unreliable.

To address this, export the MIN_RMA so that the next patch
("powerpc/fadump: fix additional param memory reservation for HASH MMU")
can identify the correct memory range for the additional parameter
feature in fadump for HASH MMU.

Cc: Avnish Chouhan <avnish@linux.ibm.com>
Cc: Brian King <brking@linux.ibm.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/include/asm/prom.h | 2 ++
 arch/powerpc/kernel/prom_init.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/prom.h b/arch/powerpc/include/asm/prom.h
index c0107d8ddd8c..b4e504b914e4 100644
--- a/arch/powerpc/include/asm/prom.h
+++ b/arch/powerpc/include/asm/prom.h
@@ -17,6 +17,8 @@
 struct device_node;
 struct property;
 
+#define MIN_RMA			512		/* Minimum RMA (in MB) for CAS negotiation */
+
 #define OF_DT_BEGIN_NODE	0x1		/* Start of node, full name */
 #define OF_DT_END_NODE		0x2		/* End node */
 #define OF_DT_PROP		0x3		/* Property: name off, size,
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 8e776ba39497..7daecf1b7c16 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -1061,7 +1061,7 @@ static const struct ibm_arch_vec ibm_architecture_vec_template __initconst = {
 		.virt_base = cpu_to_be32(0xffffffff),
 		.virt_size = cpu_to_be32(0xffffffff),
 		.load_base = cpu_to_be32(0xffffffff),
-		.min_rma = cpu_to_be32(512),		/* 512MB min RMA */
+		.min_rma = cpu_to_be32(MIN_RMA),
 		.min_load = cpu_to_be32(0xffffffff),	/* full client load */
 		.min_rma_percent = 0,	/* min RMA percentage of total RAM */
 		.max_pft_size = 48,	/* max log_2(hash table size) */
-- 
2.48.1


