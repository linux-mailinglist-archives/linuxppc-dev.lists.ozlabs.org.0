Return-Path: <linuxppc-dev+bounces-6222-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0578A37636
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Feb 2025 18:13:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ywsmz1CJkz2xS9;
	Mon, 17 Feb 2025 04:13:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739725987;
	cv=none; b=hBwuwQhyx+u/o9IPdqyKXifnPyjPA6WUkHKy264fCr1WvEqLTaF35qwnmsYebI2wqkJ9dJ6CoJNXAGNOXoPHxZb1RMmerCovLSwZj2pC4+jz3ZQ2qLqSlBJNVtW3ki2FO/yeJRA/x4SYpYY5VxDQhlOrwpXKkKTYC+1nE1AX421bWBLKLktehufIJ0Ajh5PVIsHbBGaDkf6M57pXb36GfP6/zA0tGG54Cr7bsam+ITGDSh6uWpNxjAibaMnRa6DxSlEvExxaegSNEu5Hg3XoxMoDZznx48/P17WU7bngTwDD3zvAJuAAKGgUWpsVz5cr/+mEKU83nBK5JPUKU2Oa6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739725987; c=relaxed/relaxed;
	bh=vhDdUtl+jTsa+1XR6nZgw4YCuPRT38pCBAucQdYNn9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QYVi17GsiqzbqOmUOUEk5uMGXZcxyiea02GLBJoZT7+aS7oZIPY5Pw10LTaV8zcPkPdv+o24iG0HHY+IOFbo437ve723TGEupAdV1pgXwxt6+LK6QGWWQefBWlOof4in+7UAe3kcJBaDxznMR3UrIQttFXZWSvQTqgP4VPsH0doTgQmxuQqLZu2wfIQ8MDaga3+2lmIKSzkvz3TgPIZwUEH4Hk0zOkCjKFS01UFgDyoPLn7jA2fdnvK5UfiMvXDzW3c1TpWjd7UqVdSltxAH7WayZjK7uXQKwnVcQyDcr4sMOrM4ryrGJcAW5ZQweDiFrcuksAS40lYLQe8ZUZaS7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PDoBEVLh; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PDoBEVLh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ywsmy2yhNz2yDr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 04:13:05 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51G9odpM002219;
	Sun, 16 Feb 2025 17:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=vhDdUtl+jTsa+1XR6
	nZgw4YCuPRT38pCBAucQdYNn9k=; b=PDoBEVLhTZnfq/SWUbOUHPAihPfCo5w8i
	Zp/y9gg+eh+mgRuX2Yeu8xa0sxA5lEK06FWOc7qnJPUm0T37eAKQghMsUtkBA0LK
	/8fv3uOtRsta0KnlBpX1+D5J1g+ZvpK8o6+/4Y8Pt7OVaGXOnRflEjXsY7zEdPmq
	fNVC7mbvm1A+a6am1ZEvi0btsgD+9WzisqAQOwhPDOZjxSb20z3qL899b3rLNS7u
	m9NNNhPHXjDHp/U6hfedbXQvY5K3VXn9ieedFf3skHWvIYMB9FNZeDpe9R/5yuAx
	+ROYrfTdpLHnlYwCLPV5jEET2uEjHgrrY9wXTRDM0/pGXuiIlgvrg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44u9u7sy7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Feb 2025 17:12:55 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51GHCtJj032281;
	Sun, 16 Feb 2025 17:12:55 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44u9u7sy7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Feb 2025 17:12:55 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51GEeAwI024871;
	Sun, 16 Feb 2025 17:12:54 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 44u7y1a6hc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Feb 2025 17:12:54 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51GHCnlS45220146
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 16 Feb 2025 17:12:49 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C0B620049;
	Sun, 16 Feb 2025 17:12:49 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2433020040;
	Sun, 16 Feb 2025 17:12:45 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.47.251])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 16 Feb 2025 17:12:44 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH 2/4] powerpc/perf/hv-24x7: Avoid loading hv-24x7 during dump kernel
Date: Sun, 16 Feb 2025 22:42:24 +0530
Message-ID: <20250216171226.432906-2-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250216171226.432906-1-maddy@linux.ibm.com>
References: <20250216171226.432906-1-maddy@linux.ibm.com>
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
X-Proofpoint-GUID: E389GWEIiWGeJi9CAWuDKbd-DwzB41ew
X-Proofpoint-ORIG-GUID: oSyGb8esXvE_OvASTB2iJ4lLrkSmwBXH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-16_05,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502160154
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

hv-24x7 pmu driver is intended to get system-wide resourse
metrics and may not be used during the dump kernel, avoid
loading it

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/perf/hv-24x7.c   | 3 +++
 arch/powerpc/perf/hv-common.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index d400fa391c27..3a626cd8cf54 100644
--- a/arch/powerpc/perf/hv-24x7.c
+++ b/arch/powerpc/perf/hv-24x7.c
@@ -1698,6 +1698,9 @@ static int hv_24x7_init(void)
 	unsigned int pvr = mfspr(SPRN_PVR);
 	struct hv_perf_caps caps;
 
+	if (is_kdump_kernel() || is_fadump_active())
+		return 0;
+
 	if (!firmware_has_feature(FW_FEATURE_LPAR)) {
 		pr_debug("not a virtualized system, not enabling\n");
 		return -ENODEV;
diff --git a/arch/powerpc/perf/hv-common.h b/arch/powerpc/perf/hv-common.h
index 2cce17bc321c..a4c062d2264e 100644
--- a/arch/powerpc/perf/hv-common.h
+++ b/arch/powerpc/perf/hv-common.h
@@ -4,6 +4,8 @@
 
 #include <linux/perf_event.h>
 #include <linux/types.h>
+#include <asm/fadump.h>
+#include <asm/kexec.h>
 
 struct hv_perf_caps {
 	u16 version;
-- 
2.47.0


