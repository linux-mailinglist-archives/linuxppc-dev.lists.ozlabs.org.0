Return-Path: <linuxppc-dev+bounces-5332-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5547A133FF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2025 08:34:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYZPx1Krlz2yy9;
	Thu, 16 Jan 2025 18:34:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737012885;
	cv=none; b=YQtN5aG2DhC6dZvCf98sEBNXgv7luhMydb/M6aTUvExyGw6nm31TBQfhiOoBo9637CVCLtOnsaBnZNQ9muTe1ppbgACmq8CyqmVBwQTcj29JMzW8a61p4cSXFOChex+b2eGbYN9OPaB9TuZFX+Qmszd8+cRMg7YkmOl1JLX9kMBVdUsMWodoRfMtmPhqjy4h+RXpMDGWjw9cnKsMmESR9gSX4NTVi6V1vpFUONYnxbxQUAlVaIyY0U5E01jnBQeRQLUgmZckVAxDxn92oQQ1okp+nEtQFHehM3LdWmXECkxb2CbINlTfvBqZCW411Jxi48I8Cxw8OKbpepp3f6ZMow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737012885; c=relaxed/relaxed;
	bh=xkBZAuyXvcWiFhA2BpXxLN/NQ/+te9cKGWc3lXnppy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MdWGBV0e1UnTbeTYenu1JSB5uZozoktd199ijMvZusTloABRwbyd8vA1UzPSpBXsJaKS0DHRArXwtf2CU7omOhWfWKnt0ZcSXCP+k5hJ7d03REYEds/y7d+Muu3f/wDl7UA0FEhlPvtqc2XlO1wDtQe6Mja8Lyj1YDRqdtczzYWUghLvNtW7LcUHoGbvAiueCFeQdn+lc3IsWGY1QOb8ttI01ND53mFjpKNPMCHxpGA98rk1kX0qLB3xIRtRHbT1UQ9vvaT3gx2bNT98WoE5BaZIsao8l1o21snffnersxoSPApwwa1269NxhpjDBOSvttv7DkLxNgn9omf7PWbqWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ki29EFfe; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ki29EFfe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YYZPw00J5z2ytm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 18:34:43 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FNaiCd022867;
	Thu, 16 Jan 2025 07:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=xkBZAuyXvcWiFhA2BpXxLN/NQ/+te9cKGWc3lXnpp
	y4=; b=Ki29EFfeJNCsBlzGoqKKzCfhETHerRLVcImkVGk9Tta8TnU83zCKtFeBC
	+XygaBY0aWoi4r75HsHjIAwvrHK3jOEHRhM2E1YCPvMNkdS9pHC8j6NFklREZtU5
	b1nJK/UAcR4sceFuxjF/46PCWL7ymAhc6uzXTlTtaF46/6VT2KJWJTsyRa0XGgNh
	KnAtLMoAHKdtMv4hjXK25DzmKP+/Hl7R/wGA/ceVQvE5OmC563L0i67WDS/wbpPA
	q0pSnbTyFK3Zx7AxFt8iz4KmXg+02ak0nihi122Swxpdf0ZN0SzfguZOyuWsBi4U
	0n/+L3gwGeJ9iyeYc3eWFvmqeHs5Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 446pub1m2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 07:34:32 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50G7H66c030569;
	Thu, 16 Jan 2025 07:34:32 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 446pub1m2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 07:34:32 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50G6OQCl000874;
	Thu, 16 Jan 2025 07:34:31 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44456k4cpd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 07:34:31 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50G7YSsp17433082
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jan 2025 07:34:28 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E68D820043;
	Thu, 16 Jan 2025 07:34:27 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E33920040;
	Thu, 16 Jan 2025 07:34:24 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.32.49])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 Jan 2025 07:34:24 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH] powerpc/configs/64s: Enable CONFIG_KALLSYMS_ALL
Date: Thu, 16 Jan 2025 13:04:19 +0530
Message-ID: <20250116073419.344453-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
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
X-Proofpoint-GUID: gce7iI29IGDSUnfSu18XCP82mpLwwqAZ
X-Proofpoint-ORIG-GUID: h-ZHAE2LtAN4WqBafw7VU0Y8qpleQmaS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_03,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=478 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501160053
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This adds all symbols required for use case like
livepatching. Distros already enable this config
and enabling this increases build time by 3%
(in a power9 128 cpu setup) and almost no size
changes for vmlinux.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/configs/powernv_defconfig | 1 +
 arch/powerpc/configs/ppc64_defconfig   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
index ee84ade7a033..c92c2abb5680 100644
--- a/arch/powerpc/configs/powernv_defconfig
+++ b/arch/powerpc/configs/powernv_defconfig
@@ -343,3 +343,4 @@ CONFIG_KVM_BOOK3S_64_HV=m
 CONFIG_VHOST_NET=m
 CONFIG_PRINTK_TIME=y
 CONFIG_PRINTK_CALLER=y
+CONFIG_KALLSYMS_ALL=y
diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index f39c0d000c43..2800f6181332 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -471,3 +471,4 @@ CONFIG_TEST_MEMCAT_P=m
 CONFIG_TEST_MEMINIT=m
 CONFIG_TEST_FREE_PAGES=m
 CONFIG_MEMTEST=y
+CONFIG_KALLSYMS_ALL=y
-- 
2.47.0


