Return-Path: <linuxppc-dev+bounces-5116-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10898A0B06A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 08:59:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWl62542Zz30TF;
	Mon, 13 Jan 2025 18:59:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736755178;
	cv=none; b=dSEHHKhF6tZ43s+RUTZzMnAU/GqyKfZ1Fr5cpSUQas2sEOZyYIEBUh6B85J67jSN7GHNmKtW/Su0RSMNe6N4/HgTgajlpI/OKgvLG1cDqjmjK+Mh0gTulFX/Ff/aN13Q4gLgUJhRNa8r3CpduPhd4uMy9ErFGsXgoNDz0pMExvff99g7sHBmu92YvOQccLAvrmvNAeobIyDjz7oJzql8jqpCpa9zXjaUKoEbCs/V1CR2JPHYtFsRNloJLVFLfLcrUn5Q4Tnf70cOMicZKPthD4N8tyS6L8Vm7XDeUuPf2U7SGcRm6KHl8kAD+k4j6jMvPz/jLS0xZCy4/bK1kC5Zow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736755178; c=relaxed/relaxed;
	bh=CFvBy/JvtkxXEVO+5RTLrzFS7HSjiCBs64b9qdefS9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=axmiq0N650YIdXiDB0aEfVcHGuGResTgJfEl3RNE4JLM0uPHL3Cx6nOceq4jhQKTsfBt7FLBFS2X5Faa7Vv2Xea8WChlIDJ/JdAuaFnTKbSLM7xe5Nymp0mcihoaIw/4hqQ3Pw3soT4h48m8ZVjjRcgnqUJJmXZSkEpyBkg0NIEOJ/hJg9rYpZ0FNqhhoDIG21CZRJq2lJi8oYsMl+nuIoXboJ5b49S5bSsksENb1+XdApChfb4iMrtYJu3+RN0aG3Qn6dt9NWnUq52MCBqUz1TXE2YqNilBwoh8jgdLvlJToORPHMnZZBxjFXC+QISkseDmtokR2ZJ/kRSgZJykkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UIM+4nD/; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UIM+4nD/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWl61447dz30Pl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 18:59:37 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50CE6NRR008097
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 07:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=CFvBy/JvtkxXEVO+5
	RTLrzFS7HSjiCBs64b9qdefS9Y=; b=UIM+4nD/dVD3L4ltfJ09KUrvjaATSmfCV
	AqOwNOHo/W+72elicc3jgQ7OZ4sokpzj30mcVxXHhZ3A11qclxjTzmDfW/ceT+Gb
	juZOfsc+AFdtmTc/6XPpWTwV+DkUTELh70J1Xi73nvGjM4WDPwcCgzcVoeuC+xgS
	Fi9Qe0jxn7djhlPWBUS/c0y1ifa5MWmPK9TnwnMaBl2ljI6hA1G/txLF5CQmWUno
	Yrs0uaUIyp5/7YA0s09GzokcOT1UpsdiMhi5+ObPK9QiRmnerNBn9Xc9R4e5hmxP
	NphZX/MkHoZVp81ax3iBcHNXBVmZcYVV+LGcK2Kji2fblOCOjD/dg==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 444f74jju7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 07:59:34 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50D5wTKs016491
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 07:59:26 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4445p1ctw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 07:59:26 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50D7xMu553936390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 07:59:22 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AF02F2004F;
	Mon, 13 Jan 2025 07:59:22 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8136E2004D;
	Mon, 13 Jan 2025 07:59:19 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.243.204])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jan 2025 07:59:19 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, hbathini@linux.ibm.com
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com
Subject: [PATCH V2 5/5] selftests/powerpc/pmu: Update comment with details to understand auxv_generic_compat_pmu() utility function
Date: Mon, 13 Jan 2025 13:28:58 +0530
Message-Id: <20250113075858.45137-5-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20250113075858.45137-1-atrajeev@linux.vnet.ibm.com>
References: <20250113075858.45137-1-atrajeev@linux.vnet.ibm.com>
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
X-Proofpoint-GUID: aipUeWloVBgkdC7rpkHLbhioV3suYH2C
X-Proofpoint-ORIG-GUID: aipUeWloVBgkdC7rpkHLbhioV3suYH2C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501130067
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
	SUSPICIOUS_RECIPS autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

auxv_generic_compat_pmu() utility function is to detect whether the
system is having generic compat PMU. The check is based on base platform
value from /proc/self/auxv. Update the comment with details on how auxv
is used to detect the platform.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changelog:
 v1 -> v2
 New patch added in V2

 tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
index 1ba675802ee9..8a538b6182a1 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/misc.c
@@ -497,6 +497,13 @@ int get_thresh_cmp_val(struct event event)
  * Utility function to check for generic compat PMU
  * by comparing base_platform value from auxv and real
  * PVR value.
+ * auxv_base_platform() func gives information of "base platform"
+ * corresponding to PVR value. Incase, if the distro doesn't
+ * support platform PVR (missing cputable support), base platform
+ * in auxv will have a default value other than the real PVR's.
+ * In this case, ISAv3 PMU (generic compat PMU) will be registered
+ * in the system. auxv_generic_compat_pmu() makes use of the base
+ * platform value from auxv to do this check.
  */
 static bool auxv_generic_compat_pmu(void)
 {
-- 
2.43.5


