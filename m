Return-Path: <linuxppc-dev+bounces-6589-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7154A4AD50
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Mar 2025 19:23:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z4tkS00LLz300B;
	Sun,  2 Mar 2025 05:23:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740853423;
	cv=none; b=FM7PxCBoXwZGXPt45WPKSA+LpsddI8jO1Ku4Znq+SxLgnNTun3wpBuTc0h7+j3NbWESTgmhRgTguvyEdtr5AWTIvZSqfllryunaV86W9loaqEjK9LKdzTUveonAkXKgLXd+uP9FZr7p1I+r/a5ydC/uCPcUtNrJT8WxXLYAGgLmazmhXiQcciw/FQs6S481Un6pK559LMM1wXYde+JSMrBdazqVcrYBduLFHmerEdZRieMhoA0wB/nj5FZA00+Itrs44uNnRQoVlfA96wL8jn3pWa71xmuvgC3UqLrs7+H+UA9K8hqqT8MP8pwG1LbMOUiHmuo94XLssoGov12vl4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740853423; c=relaxed/relaxed;
	bh=9hGBxKYfDvSg2yztIDczLq62D1+qp13C+tmV2U4UlpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BLntxzm3ZAo3tbitQ2O3xj4fEqBC6XgdRM02zCQjqqE0pf7IQp7no6Z32xiCt0IbngVgYvAzPcUI4Yy3UiC8jy7wqO1yO5POl8shIxDaBmRG6/OaDY3Wt9N+ih/3drq1F89xaU0PzUcwVXqX4p1KVeoJ9Ah0fMnk7/J9S1whl6IhqdambbQsLAf9JJTlzzODEJFxyvtnzQDtmewCYaTOSjh2/rfBPEG4rwvxdKaYkX2NvLMXXc9NdwMOAiP6J49azYFa8Ldc9EotCbF8rJp7jXxkwT9AkU/kl5Ae3fEGuibZMZBNzwsgmK+0e9pAlJHjZBFbMemCaskwUfQDMVYeuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bz+FBZCT; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bz+FBZCT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z4tkR1RDbz2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Mar 2025 05:23:43 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 521E3Pws012248;
	Sat, 1 Mar 2025 18:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=9hGBxKYfDvSg2yztI
	DczLq62D1+qp13C+tmV2U4UlpA=; b=bz+FBZCTBAIPKQCmwLfE3GtqakSezXD3p
	xD1YmqYyWpONp0joQINUtfVfd4Hycz3Pv1OQeboMCQEQs6Tqg2fGHOmI1dF53dJj
	mdUS0oeDR+N0Q1UjHM9onnKuu7dhD7As/1qx6sAj34v0C1yZI9V/kZ+/KB61aM0c
	JuI5akFip4mDlbD6ze9zXpGMJNnZ4cQ8Xd8U7fo2Gg1SaaJbGpbfsQVyWpVIpIpP
	yuHQNh3EKUQyZY62MfJOAeNMqgqCIPJ+KEHZLx6z7eGHP2zKkHq2O+dNdxfYfAkQ
	OiCkgrS8zd9h7sQwtGgywFe3gE18mJgyGAJ3HD+mIyeS39W/3pyTg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4543nnrqtr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Mar 2025 18:23:33 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 521INWa5008035;
	Sat, 1 Mar 2025 18:23:32 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4543nnrqth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Mar 2025 18:23:32 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 521FMJoZ027487;
	Sat, 1 Mar 2025 18:23:31 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44ytdm4swn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Mar 2025 18:23:31 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 521INTqW40763676
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 1 Mar 2025 18:23:29 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8BF5120043;
	Sat,  1 Mar 2025 18:23:29 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 128B920040;
	Sat,  1 Mar 2025 18:23:26 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.6.12])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  1 Mar 2025 18:23:25 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH v2 2/4] powerpc/perf/hv-24x7: Avoid loading hv-24x7 during dump kernel
Date: Sat,  1 Mar 2025 23:53:08 +0530
Message-ID: <20250301182310.6832-2-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250301182310.6832-1-maddy@linux.ibm.com>
References: <20250301182310.6832-1-maddy@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: QrH81I06_DkQyfWHyEUsJKfwA6oxPsD8
X-Proofpoint-GUID: 9t_GxmiRql_pk7iOznr-siAhQJl3XFTX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-01_07,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503010145
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

hv-24x7 pmu driver are intended to get system-wide resourse
metrics and these are built-in. hv-24x7 pmu does not have
commandline option to disable them. Add check for kdump and
fadump kernel to avoids loading them.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog v1:
- Added more details to commmit message

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


