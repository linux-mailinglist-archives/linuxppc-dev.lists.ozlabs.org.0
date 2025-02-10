Return-Path: <linuxppc-dev+bounces-6062-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80131A2F985
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 20:53:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsFcB08LMz30W4;
	Tue, 11 Feb 2025 06:52:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739217177;
	cv=none; b=B5yskcqkFwbNfyzePio+qIM9/x+h7cGHSAZVmMSPXYRkUZvPTIZ2h9AC1AOkqklyPLyrEEhrVrIWA+3fa8er9aQ15v99B5k9nhj17ZZfADGK55RdYU7rpjNO5k5gD0kxDI1GUD3xz8aDceiRvtILMHAi8vJtjrHS2EjE6X9qV3Vt2s3Xi4N5hyjc+8y4zLsJJXkC9Ro2R3iEEpjD8Fg8tDiS7uB52b4ItMKxmkxpw83HpvmRccu0v4Mz6JVqVZXeqrDA/EqeozjM7leRFqaVHcO9eCL1yDX2wptX0I+HmYV51xfx8glpwCjb1F70E5f3QDcFKPy8L9v7WymIaCGuPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739217177; c=relaxed/relaxed;
	bh=H4rQQeP+PgLtk39KcCyUuDuHn91B6L8eAEuDFTn8+x8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Okmzn1exLKCU4xxV/gOEWPt9uOaGwuw+1pzUeNOt7upmEs6jtE51TgdOuIoWV2Tf7J3AXrSXoF9XNI1pRGEkveGG2T2diuwZfwv0hQbti19Cryd9CuLXJTRqeOY3YGBp99XAcAmQIBppKbANz3AF7XWPSllNanmm/cLjw4srhUV2m+AM1B/5E//CGKNb5gdFbpMiOMSEpbkHwxaLpftjM5azLay9gcgdrC7RD3uHOeUlofAgy7Md/OkMv6YwUpskvFfD6GNPo9YC7+RGiTSgO+W9b6m1uOWznZzIY3gzlC0uUEXDrAQ2XNl9CN5ok10VICT2FbH6Z0/WlsYL4Or2sA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZpoLB9qL; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZpoLB9qL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsFc86nwGz30Vy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 06:52:56 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AEAEnt014109;
	Mon, 10 Feb 2025 19:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=H4rQQeP+PgLtk39KcCyUuDuHn91B6L8eAEuDFTn8+
	x8=; b=ZpoLB9qL1CMJH3MkkCG3vqkx6XMOwB7Q5s1D6yLUjotL+48SuwWAQmSAH
	nXu3YWGDoOQ6YSwpzWiRzTD7roqmU5DKXYyLQkw9sfIAGpPN3G3AuHYns5cS6SlS
	gFxuO3esfj2dm/mev1zft9o5J4UNV5B4H1Irq0weDQ8u/ItTHkAfrXud1bEnsh0Y
	S1Z4v+ID6Rn5F23qGR0eFoa2nPhkTfEkoQZlwQSIkSN/1T+4zz/vqGshKLCm5f/j
	BnAyWmpvLeFK60SOeNtk951l/aU2H6COfP6RQBDNyh9127hitONk9BHBXTIxl7qV
	pfhUF1t/az5z5R49CsiqlL8cyOCQQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44qb97v5y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 19:52:44 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51AJYcMc031831;
	Mon, 10 Feb 2025 19:52:43 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44qb97v5xv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 19:52:43 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51AIh4l9021713;
	Mon, 10 Feb 2025 19:52:42 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 44phksg4ws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 19:52:42 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51AJqfBW22675748
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 19:52:41 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 77ED05805A;
	Mon, 10 Feb 2025 19:52:41 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0444258054;
	Mon, 10 Feb 2025 19:52:41 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.47.87])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 10 Feb 2025 19:52:40 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, hbathini@linux.ibm.com
Subject: [PATCH] powerpc/crash: Fix non-smp kexec preparation
Date: Mon, 10 Feb 2025 13:52:40 -0600
Message-ID: <20250210195240.438127-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
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
X-Proofpoint-GUID: zOY0weLdHzeiL6RTvMxofzPrBMj8LV0l
X-Proofpoint-ORIG-GUID: 7L8wOhCNl954hSJ-gGuPSz6EZyizpy9j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxlogscore=643 impostorscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100157
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

In non-smp configurations, crash_kexec_prepare is never called in
the crash shutdown path. One result of this is that the crashing_cpu
variable is never set, preventing crash_save_cpu from storing the
NT_PRSTATUS elf note in the core dump.

Fixes: c7255058b543 ("powerpc/crash: save cpu register data in crash_smp_send_stop()")
Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/powerpc/kexec/crash.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
index 9ac3266e49652..8c11cfd19e734 100644
--- a/arch/powerpc/kexec/crash.c
+++ b/arch/powerpc/kexec/crash.c
@@ -359,7 +359,11 @@ void default_machine_crash_shutdown(struct pt_regs *regs)
 	if (TRAP(regs) == INTERRUPT_SYSTEM_RESET)
 		is_via_system_reset = 1;
 
+#ifdef CONFIG_SMP
 	crash_smp_send_stop();
+#else
+	crash_kexec_prepare();
+#endif
 
 	crash_save_cpu(regs, crashing_cpu);
 
-- 
2.43.5


