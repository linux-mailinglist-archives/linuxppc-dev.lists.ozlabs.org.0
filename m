Return-Path: <linuxppc-dev+bounces-6590-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB97CA4AD51
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Mar 2025 19:23:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z4tkZ2jhwz2yyR;
	Sun,  2 Mar 2025 05:23:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740853430;
	cv=none; b=K/ZvkIMnPDJeUF4QiGhN0+H37/2VjcUJf8LrkuBG5txXmnaIdoTWe316glhLqGGe1Uvj02JenhWUho5lIjAaS+OQZcDFCP/j4HbMAbMX4Tgt9716iIjtojm+XFvYQ/kfVrunHmesImIyX/oqdy6VvQVz9INfTEN44kRdgoJf8o6GvfeYgwcPGzrWCWmp146c+OgszTXJEjNXjkeqPXkDyrQr7/j704fQlG3x/OVH35an22n/dtNWECIs+p0Ba43uQHijlQRCOqujlVtMH7rCLWFvCNHuEmqMgIpIb6CCnFRNNViFRhgTPzHCz37KPHFNZPtGQf7HqRHFmc/kcOk/+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740853430; c=relaxed/relaxed;
	bh=69Id3BOjuOEZqf1MwlfEy10UE59l951Hzr3VyE6x5bI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bvMUFVTZwB524GeTUKMhZEusYFGbYgTD64fARu+KkSC+lAM4fLOS7kGiqRtJyE5mi69kOFRktoQkkcOAaG0aBB11tIiu3UnQh0GhpVp6ulschzcipiCzz12i6BBFMPIuhPehbMA0k1bHU9CLDX7vvIunqoiKWaGkhYxfIjaU/mJeRQl6plREsuXx4+8qdpk7z2IEipEiU1x0DglHCklPkV6yYB+Dqk/5t9/z0MHeWxQgvwZ+vFsQwmi/K9qIO6LyAa0SZJb0uAst2g0QZWro3Z3DHxlmNWezJUCnNhtAnZCxD5PqabWPJPiDyPPh+YjuVdoStEq551xEG2RnZ1Xc9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AY00NQ6d; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AY00NQ6d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z4tkY3Sf2z2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Mar 2025 05:23:49 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5214lpK4007990;
	Sat, 1 Mar 2025 18:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=69Id3BOjuOEZqf1Mw
	lfEy10UE59l951Hzr3VyE6x5bI=; b=AY00NQ6dNkD2VFIOWbuLP0C9UxQpJQoD9
	32F3V+PXdGtI2/RDbiqcqhknvJDEXsjsMeW5+Cax/tRlHjFSYjMVH8zO88oK2427
	M1OIC/AcSHBFPJk99zNm927erYDtXpNjXE1gXcwVhJIHptC8bzuIqSBM5F8I3Yx8
	MuJZ0yctaqnK5mU6eP2Eauqu7gNtsu+Zdg9RyHfyuanRicrmPL+KJbJSWUZLPqKv
	jDpxCP0/WghwGcPifijV8Jxif3o2MJIqRlh1JqAvDu3XsA3gi2edvse8UTa7Ltx7
	CaXgXvRqg3CqgSetowWw6le6Q8QZ6J2B/jSDKJB1FlUWFwqQuf+xQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 453uh32290-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Mar 2025 18:23:38 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 521INbgJ000721;
	Sat, 1 Mar 2025 18:23:37 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 453uh3228w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Mar 2025 18:23:37 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 521HlMMr012735;
	Sat, 1 Mar 2025 18:23:36 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 44yrwtd53j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Mar 2025 18:23:36 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 521INZFn59572524
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 1 Mar 2025 18:23:35 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 46AA420040;
	Sat,  1 Mar 2025 18:23:35 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B86320043;
	Sat,  1 Mar 2025 18:23:32 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.6.12])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  1 Mar 2025 18:23:31 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH v2 3/4] powerpc/perf/hv-gpci: Avoid loading hv-gpci pmu during dump kernel
Date: Sat,  1 Mar 2025 23:53:09 +0530
Message-ID: <20250301182310.6832-3-maddy@linux.ibm.com>
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
X-Proofpoint-GUID: jxOLZagFwwkeLR84Z1JFWWtpscAbjWce
X-Proofpoint-ORIG-GUID: SfMvVbUPZXRZT0Hry3qBtkqRh1ICLxBp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-01_07,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 adultscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503010145
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

hv-gpci pmu driver is intended to get powervm hypervisor
system-wide metrics and these are built-in. hv-gpci pmu
not have commandline option to disable them. Add check
for kdump and fadump kernel to avoids loading them.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog v1:
- Added more details to commmit message

 arch/powerpc/perf/hv-gpci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
index 241551d1282f..e0c3df0a048f 100644
--- a/arch/powerpc/perf/hv-gpci.c
+++ b/arch/powerpc/perf/hv-gpci.c
@@ -989,6 +989,9 @@ static int hv_gpci_init(void)
 	struct hv_perf_caps caps;
 	struct hv_gpci_request_buffer *arg;
 
+	if (is_kdump_kernel() || is_fadump_active())
+		return 0;
+
 	hv_gpci_assert_offsets_correct();
 
 	if (!firmware_has_feature(FW_FEATURE_LPAR)) {
-- 
2.47.0


