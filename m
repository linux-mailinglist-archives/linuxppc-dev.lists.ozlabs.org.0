Return-Path: <linuxppc-dev+bounces-3141-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A60879C69AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 08:06:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpDq42TR1z2yb9;
	Wed, 13 Nov 2024 18:06:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731481600;
	cv=none; b=SomOvbAh4gY+YVR9KI3VM4Am3OQA0vYM1D3htKqyr9PtrDBfOb/8Syb6nX94pb3Q1oKg5cE9YJN0BG/vaBAl7ofIIZMjRYY6+xy54YF+oiV6o2FPVXKDwDS7Jc1tLYCNryicOLlxHO/NfN+IlYjhkC5zeVs2j3/0/OQMwIB0doRQ7STFBZter8AlQb3rw3kL86hXHiasTWxNsQegeMp6VUgFk0XRA6Q369pNsO6VH79+xKKyqCSdwZr3iWBGpSfPY6ughH6V4aDPCaCfmc04sb4k9NYs3xlwi6zG6e60UPVJlr9ptXrF91INahRUx/9Z4efWwArwpOjzQ1IqOy14Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731481600; c=relaxed/relaxed;
	bh=k8MTudT9GVifSJAhJTq9ohv0PU8dUNr5hJviPlzoAMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SxPpB31ck6/bTPSSpMjfsNXzsmVSG/ro6LeXtmW6OwU7ksEoKKdMZ2nLtuRwpmXyKHz/a9Uh+eUUHR/KkgD3JY8kkXy0sNjDGXfxYtQMysQNgYM8Hvmg3qKU0i/EMUH+x6m+heD9aTCciLXHj/jhkqNNk7tVCP8D6wbKAnpPb84NAIEdmkaljVgt7yjyfJuRCOo2uhO2iku4h2pcREIk8sOmwYm1gvMRUb3LzzinwBm1hbIVBnbj3+mIofpu8q39l87JV5FoYJsK50w6mOwOzNPYQH72eL/WHSb89HPiUc2xqdiezWuvqCIym1zPO0nu29WXVH7/lN6NzoLS0zXTxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K1cPRceF; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K1cPRceF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpDq34hwMz2yY9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 18:06:39 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD4dvtK020826;
	Wed, 13 Nov 2024 07:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=k8MTudT9GVifSJAhJ
	Tq9ohv0PU8dUNr5hJviPlzoAMw=; b=K1cPRceFCznqrwEyq/PiebIL1dc5PYC6l
	VbPQUdCjkHx1gOcxBuUEqaUv6HusDsZOwrVXPdtfTs8z0CjmzPZM+474Lvp5h/P1
	vhmZg2DUTgfWDlNKmiWm4Ld+Kru0G8qep+6VNXEGWnT8VjYpsUyhjEzycnBe/9Fb
	OyLmGpIctSsOj3v5FZljBpokCuwMLfASpY7zdo07+XixZRz+HEtjh4SlrU9dvWLr
	7pIXOfA1mn495jQozUhpdraOYqKiN527+WA0vZ+0oSCLRAfInOS829+MwBZgksOc
	t4FyR0ye0Ca18dYYmOd4uhDE69cTZYNY1JPdET2saBEt27VRbpqGQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42vn9h0fek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 07:06:31 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AD76UIg016090;
	Wed, 13 Nov 2024 07:06:30 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42vn9h0fef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 07:06:30 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD35jsh010526;
	Wed, 13 Nov 2024 07:06:29 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 42tj2s5sv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 07:06:29 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4AD76PqB35389960
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Nov 2024 07:06:26 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD1C12004B;
	Wed, 13 Nov 2024 07:06:25 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4402920049;
	Wed, 13 Nov 2024 07:06:24 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.94])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 13 Nov 2024 07:06:24 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Hari Bathini <hbathini@linux.ibm.com>
Subject: [PATCH v3 2/2] fadump: reserve param area if below boot_mem_top
Date: Wed, 13 Nov 2024 12:36:18 +0530
Message-ID: <20241113070618.75744-2-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241113070618.75744-1-sourabhjain@linux.ibm.com>
References: <20241113070618.75744-1-sourabhjain@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kOdcqkCiefEbsMxFhtvH5Szko-asNBcl
X-Proofpoint-GUID: PBPZwpoFB5snMApsgWCNKvUAsn6hlpBd
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
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
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=851 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130061
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The param area is a memory region where the kernel places additional
command-line arguments for fadump kernel. Currently, the param memory
area is reserved in fadump kernel if it is above boot_mem_top. However,
it should be reserved if it is below boot_mem_top because the fadump
kernel already preserves memory from boot_mem_top to the end of DRAM.

Currently, there is no impact from not reserving param memory if it is
below boot_mem_top, as it is not used after the early boot phase of the
fadump kernel. However, if this changes in the future, it could lead to
issues in the fadump kernel.

Fixes: 3416c9daa6b1 ("powerpc/fadump: pass additional parameters when fadump is active")
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Acked-by: Hari Bathini <hbathini@linux.ibm.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---

Changelog:

Since v1: https://lore.kernel.org/all/20241104083528.99520-1-sourabhjain@linux.ibm.com/
  - Include Fixes and Acked-by tag in the commit message
  - No functional changes

Since v2: https://lore.kernel.org/all/20241107055817.489795-1-sourabhjain@linux.ibm.com/
 - Add Reviewed-by tag
 - No functional change

---
 arch/powerpc/kernel/fadump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 3a2863307863..3f3674060164 100644
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


