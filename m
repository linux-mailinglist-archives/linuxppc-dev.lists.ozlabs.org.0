Return-Path: <linuxppc-dev+bounces-2820-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 713A59BAE4B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 09:39:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhlJV1DFrz2xjY;
	Mon,  4 Nov 2024 19:39:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730709578;
	cv=none; b=jpAhx7jwwIL1mp6szwsSbrdwKcakzHjeD8iJxOSWJx1Ne+4SZ5A/6xMaeIfEEcWm/9NJQDRI01jMgz+DnZYn8KzDK3/v3xVlJJUbSCGOMfuOsXEl7gwP0VT+hVUrYBpVf/z1MDv03FExkoVtWLOh5RWQzKEQjdfsMtJTtJXzYGh92xboSzZfR5vz8/W8QGz5jidEJoH2SgETnX0z9CwwqFE+wAGrxll7FW3PKu7Iaf3fLS6xWCF/F1H6FZskwjNIvhsIy1pA4/5tdWo8bf2dxO4baw6akmde+CM4tdVr4IWg0o4cpVIaf/E9mJCtgaxsOiMvOBLD+2wxWy5FpsrLfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730709578; c=relaxed/relaxed;
	bh=bPHinsJBJesaooWb2fIV2wB+BtgnQIv65UrcR4iUfBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ucy3cflc39B8rNpqBwM4RJK83+cb/8TG2DDpDceWCDYwLq2SNslUfakubFIdM95/MNwy91AZtauCcqLDFvJ464sPp9fyVh4Vgtx1vumhCj9WRF9BVW/Oc3AkaLOI9TstqgG5hePAnYfnnP+rXZLoNrSCqJa8zYDoi+rgNMx7ij2q5mYnITnfD0BVoJio7eEj5KLIhNU6B56Ul7lT9UW+aacGw0bf/it9d2zumZd/xzDPdNFWV1NKcnXG4pgWwJGQvgXNncUhxy6hCFpwW+EpRMnln1eBlheAEFmUUQNcEw0WIjFd9jqwTmVayV2dAO5AJ4iSo0VeJGi0buuT4cRinQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nvb8b+u5; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nvb8b+u5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhlJT0q7Dz2xdZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 19:39:36 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A48aW0V006998;
	Mon, 4 Nov 2024 08:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=bPHinsJBJesaooWb2
	fIV2wB+BtgnQIv65UrcR4iUfBQ=; b=nvb8b+u5UAp0HT3u9Zt8h24ZAkRK9hQds
	Ro+sNi+Jv1p0SNCQqDXoS1KGMi0zmCEaBe30WO7jh0RuVxwF2onn1Nc/0OVIGB2D
	UxA64g06srEiqj/ckqgQA8WjgMq9Yr7CwQURhoP4VduZSMVHTMMrM553f8N4VnmX
	ftMfQvHqy8AfZwLaMzHblCGdIyuLjn3KNVwV4HopSPtMu2O79euoLqDyavLcII7/
	tVxnnc1LVtcazbMng0Z3NRpgubSFQhGQmzb2A0ZY5Qp7JGHrp71QNQ99umqRG0hg
	nzkMLCQdGZpcA4mpFCyIkNdn/ARS+fB/AVEdBoKIsK1wuuf/RF7oA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42pth70343-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 08:39:29 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3GsIvQ024200;
	Mon, 4 Nov 2024 08:35:39 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 42nxds1v75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 08:35:39 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A48ZZWO44892450
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 Nov 2024 08:35:35 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C098B2004D;
	Mon,  4 Nov 2024 08:35:35 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4750220043;
	Mon,  4 Nov 2024 08:35:34 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.94])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  4 Nov 2024 08:35:34 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/2] fadump: reserve param area if below boot_mem_top
Date: Mon,  4 Nov 2024 14:05:28 +0530
Message-ID: <20241104083528.99520-2-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241104083528.99520-1-sourabhjain@linux.ibm.com>
References: <20241104083528.99520-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 7-cgQvnPsUOBaEjJ8mEEqy0_lWFyp5Q9
X-Proofpoint-GUID: 7-cgQvnPsUOBaEjJ8mEEqy0_lWFyp5Q9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=818 spamscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040076
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The param area is a memory region where the kernel places additional
command-line arguments for fadump kernel. Currently, the param memory
area is reserved in fadump kernel if it is above boot_mem_top. However,
it should be reserved if it is below boot_mem_top because the fadump
kernel already reserves memory from boot_mem_top to the end of DRAM.

Currently, there is no impact from not reserving param memory if it is
below boot_mem_top, as it is not used after the early boot phase of the
fadump kernel. However, if this changes in the future, it could lead t
issues in the fadump kernel.

Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/kernel/fadump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 4a3f80f42118..35a8a107e16b 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -143,7 +143,7 @@ void __init fadump_append_bootargs(void)
 	if (!fw_dump.dump_active || !fw_dump.param_area_supported || !fw_dump.param_area)
 		return;
 
-	if (fw_dump.param_area >= fw_dump.boot_mem_top) {
+	if (fw_dump.param_area < fw_dump.boot_mem_top) {
 		if (memblock_reserve(fw_dump.param_area, COMMAND_LINE_SIZE)) {
 			pr_warn("WARNING: Can't use additional parameters area!\n");
 			fw_dump.param_area = 0;
-- 
2.46.2


