Return-Path: <linuxppc-dev+bounces-5423-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F521A17204
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 18:35:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcHY96rNxz2xxt;
	Tue, 21 Jan 2025 04:35:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737394525;
	cv=none; b=iuUtLRmSi++kYWB1MUveH7qr5jLihBG347ECxfvTU422dCogWYJLmUakOlWy0Qmc2BoCf6fpqIlAwLQNE/Jh/zoHkKVIh7X7THhvwWwaFPEdDtXZ2r+syYRJgcXy5XdekQunqV/xYqPjWm89RX82nDjmGgXLp2ATpX9dTKpzT6mn16gp/WYdwrtz/QcwkhXsOsd9a70C57BIv665m9HebMsYs1WCWjs4jLL+9mSt1LuffCdZdXfjvaQwJU2o59+8MC9Cvie8rZdp1DMqrbf0C3geFhSe7kLq3+/4m0tS6lejpY22fbYrhqylU8eBT2xkzfpaQL5fTu9EVM7mw0SJow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737394525; c=relaxed/relaxed;
	bh=V1nH4Xcfavm2te7TYxEqkolWnAw+InZyZqWafQSxT80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TE9yIFn6AB0wr2kvjdrLbAb7F4j0cJL20vxEcENPymJFqcgX7mQSFIgrZyrOFOO0jZ4fG+Tm7Z06tolj12ncet0IAlMN5LwbNCTpouqISbgjAiXAzm+v8CeMUvftP7dqZTOSgp19XO8ufJLjo6MM5MlEqftGOBnzpQyd1aWhuO0ytLJlXUlNwycXS+xA80bdpRO2ULjQfcK4yU8FJVi3Bhlhlbtz2tHqGpdTP2B+qSdJeOQqUp4wCpKQ1Smc183GrTY6xFInEJnfLnF3maE0CyMa/eEySFGqDpW5hcwUjy80585z5n+xDM7sGxDL+Dhx8kYBwreui2a7ujSr6BcCxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OQFr+5Z5; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OQFr+5Z5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YcHY90kF3z30Q3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 04:35:24 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K7WptX010703;
	Mon, 20 Jan 2025 17:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=V1nH4Xcfavm2te7TY
	xEqkolWnAw+InZyZqWafQSxT80=; b=OQFr+5Z5GdynVjKscuumNn88Xz/Dd0wD6
	5/ZOtZMH5+DvKZsKB9iOu342YbodDMhpR4NvLT0WrWKkyoFbavwq5OwOaJiUOzrN
	Wa6q2Fn+SYaRRav6gcAiHHZhgMQnlwKIX3pHhqCJfqXOwTBYIVOrPaB7bWAGJwSh
	YeAHecBVV6N1HnTkr1ACYVQDPLHj0H/XbIRyLQ9Io2IpkbjJhvB0Bk+XCuKP4kzj
	gEJ0drwqMeBK+vycBMx3oNs2lRoXLbdup1FeXqM4dwsDmJ7NgvjhYYgBs4W5VfkE
	/u1KSKCclLMRan3uiDgfvnm3m3brVTCbId/Lg0EYBZiChfxrfXXnQ==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 449j6nakd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 17:35:17 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50KDX3O9021063;
	Mon, 20 Jan 2025 17:35:16 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 448sb1728n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 17:35:16 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50KHZCdP51249456
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Jan 2025 17:35:12 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A13D42004B;
	Mon, 20 Jan 2025 17:35:12 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3184520040;
	Mon, 20 Jan 2025 17:35:10 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.123.118])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 20 Jan 2025 17:35:09 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Avnish Chouhan <avnish@linux.ibm.com>,
        Brian King <brking@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>
Subject: [PATCH 1/2] powerpc: export MIN RMA size
Date: Mon, 20 Jan 2025 23:04:59 +0530
Message-ID: <20250120173501.1147236-2-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250120173501.1147236-1-sourabhjain@linux.ibm.com>
References: <20250120173501.1147236-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-GUID: lR87RmJYcRC4Nx2sv0-eSlgZJw15a17J
X-Proofpoint-ORIG-GUID: lR87RmJYcRC4Nx2sv0-eSlgZJw15a17J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_04,2025-01-20_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=776 adultscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200143
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Commit 683eab94da75bc ("powerpc/fadump: setup additional parameters for
dump capture kernel") introduced the additional parameter feature in
fadump for HASH MMU with the understanding that GRUB does not use the
memory area between 640MB and 768MB for its operation.

However, the patch ("powerpc: increase MIN RMA size for CAS
negotiation") changes the MIN RMA size to 768MB, allowing GRUB to use
memory up to 768MB. This makes the fadump reservation for the additional
parameter feature for HASH MMU unreliable.

To address this, export the MIN_RMA so that the next patch
("powerpc/fadump: fix additional param memory reservation for HASH MMU")
can identify the correct memory range for the additional parameter
feature in fadump for HASH MMU.

Cc: Avnish Chouhan <avnish@linux.ibm.com>
Cc: Brian King <brking@linux.ibm.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/include/asm/prom.h | 2 ++
 arch/powerpc/kernel/prom_init.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/prom.h b/arch/powerpc/include/asm/prom.h
index c0107d8ddd8c..09d0a4b1eb84 100644
--- a/arch/powerpc/include/asm/prom.h
+++ b/arch/powerpc/include/asm/prom.h
@@ -17,6 +17,8 @@
 struct device_node;
 struct property;
 
+#define MIN_RMA			768		/* Minimum RMA for CAS negotiation */
+
 #define OF_DT_BEGIN_NODE	0x1		/* Start of node, full name */
 #define OF_DT_END_NODE		0x2		/* End node */
 #define OF_DT_PROP		0x3		/* Property: name off, size,
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 0ddaa4403095..2ad9e9eee513 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -1061,7 +1061,7 @@ static const struct ibm_arch_vec ibm_architecture_vec_template __initconst = {
 		.virt_base = cpu_to_be32(0xffffffff),
 		.virt_size = cpu_to_be32(0xffffffff),
 		.load_base = cpu_to_be32(0xffffffff),
-		.min_rma = cpu_to_be32(768),		/* 768MB min RMA */
+		.min_rma = cpu_to_be32(MIN_RMA),	/* 768MB min RMA */
 		.min_load = cpu_to_be32(0xffffffff),	/* full client load */
 		.min_rma_percent = 0,	/* min RMA percentage of total RAM */
 		.max_pft_size = 48,	/* max log_2(hash table size) */
-- 
2.47.1


