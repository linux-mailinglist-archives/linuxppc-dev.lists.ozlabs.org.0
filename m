Return-Path: <linuxppc-dev+bounces-8607-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5F2AB9C58
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 May 2025 14:40:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZzRWj3mnJz2yf5;
	Fri, 16 May 2025 22:40:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747399249;
	cv=none; b=lkJFw94JcYuCwr3NY3x+6Jr6rEz0AIwaaZug7PAkvWYUG5sAF7Fz6HuRI2yS6DVUPUwTfQhvrk2WDqRpp1MC16amN+hZkOowCrX0yHAEtBVMhJRH0hmNA5I7YW3akU5sYt5P3nn+K3GaJvzSStMh5bqTIVKMcTEJvhg8wGpJcf/yag6GEoEnLm+1OFX0QZrc3JNLE1EL33sN/yYKsBGc3FhENBQh+39vJCWneONsSeXtjGjNbaTUaaDrg28pw+SiN8Rsgt3oxDxvbsE54g+GesuDdjDrcTF/ffHpcOoB34Kkvjd0dPrMigDHoexB3zRqXMQB1V2lyRi6cOyx7q6JUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747399249; c=relaxed/relaxed;
	bh=gjvxHPL1janfCdvLnHMKKrb2pt2ZDhhBF4Dw2m5P808=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TrCDqony57NxkLFuV5Q4mbia55t3Y45irxrVLpwOp3DH/IFYtEM7ITz9dSN3AZVrDRIma87zWQiTzz+JAOWDghliZFQCRPr5etL0A3T4FnZVPjGb8ouSbgCKV8SweMRQBzVaLwxksxVMstjH8koKuhHJsqkWjEqSYo31CL+z+7/P5v8RBB5D0izm71AkIawv8ZGuJVUZ1lduIx8MpYfskhXqoN4K8kykzZKnVu22brh7tv1BMCt38Zuoblo3Oek0I8W0LfKFR8LKOCyqQWylWQw7OqgedYGxi791ii9JR9JKCXJmmgJiBKLVzubM4oEt69iA0XosC6eAB8kYeWkSzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aQbwLBBd; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aQbwLBBd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZzRWh107Xz2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 May 2025 22:40:47 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G5unPW012663;
	Fri, 16 May 2025 12:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=gjvxHPL1janfCdvLnHMKKrb2pt2ZDhhBF4Dw2m5P8
	08=; b=aQbwLBBdvoLAyQApqMLM5JpkZUAjMxnRbYFqFVX4sWinkw/LvZkSGc1Q4
	QK6YyQr132zU/eNgp1owWpQN20bL3a+MMSPBAfddTpu+Zi21qX0icwIMWheQ3wPP
	vfMCEVzAPGoJw+qOoLQ/L1R03soUa+xT/42GD8f+oqk2KRcDe8224M2PQTbWd/yd
	J8r+Uj6L2Bg23bLJi+U3j9mdM5WezY9xdTFVElmbXWVjiH21FoCDDX6hsYkxqMWi
	lMrRsqJ2IvpTGZRu7KNl52yIu7sYnK61Pl7DwYKtPTppYrkBwKoZz4bFfqb/MWzT
	7pMnRahrGckA9Xhvg+sOJa0+QU5rA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46nnw943sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 12:40:36 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54GCFiIg024904;
	Fri, 16 May 2025 12:40:35 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46nnw943st-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 12:40:35 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54GA5Iwk024273;
	Fri, 16 May 2025 12:40:34 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46mbfsfgjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 12:40:34 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54GCeTgU46203192
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 May 2025 12:40:29 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F25A20166;
	Fri, 16 May 2025 12:12:32 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 10B312015F;
	Fri, 16 May 2025 12:12:30 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com.com (unknown [9.39.30.87])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 May 2025 12:12:29 +0000 (GMT)
From: Gautam Menghani <gautam@linux.ibm.com>
To: maddy@linux.ibm.com, npiggin@gmail.com, mpe@ellerman.id.au,
        christophe.leroy@csgroup.eu
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: PPC: Book3S HV: Add H_VIRT mapping for tracing exits
Date: Fri, 16 May 2025 17:42:24 +0530
Message-ID: <20250516121225.276466-1-gautam@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEyMSBTYWx0ZWRfX6Fsbe83ZOFiw s5CTWwsRlm27GUpEoBM0SEvM9NqO+gOHMvAkeDwYpHmh/I+c906Mh6aRdxiiDxYBLhu9xgN3sIy Aovr1iRe9HekIfP53wyQkk/YR4c2NPPKpoU24yLmiyvq2WPeioyJJHBLCWmqW20kGpbhNoIVGb2
 OIfu0SAiN/dkMq1/cpAXpAUhn28F7rkjNSDbXVUmXf+CrKkaH6RhSM8pQNH2QjR80ltii/O2+DH OkRDOs+uaK26gpH2CAhTyV9GyJiCQN7mycTAfLvUxkoS5zj9qOUBfopiLyQlykb352+W3z57Hxd pABWmNMTuaaH9hH2tWPIzXQpS9GBROakkMQqUWmWSOBVVgZMVHSg3MTYkjoVIDyPDaU5rFFyiug
 IlTJfTMgdDTVQEXHHwVk+4dQ3OU527lWpvHMHaN8lExjLuUoJTUzW0CcxZ8/QshXuvxWP6CN
X-Authority-Analysis: v=2.4 cv=b8Ky4sGx c=1 sm=1 tr=0 ts=68273244 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=q7Y8yhldYiaEvS2G40IA:9
X-Proofpoint-GUID: OivNb5j-I5ywfp3i_xhTq_WXGpHLiA0M
X-Proofpoint-ORIG-GUID: 7wjkZDfhubc31Ctd_5x_AnMhT8BqEQDA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 spamscore=0 mlxscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160121
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The macro kvm_trace_symbol_exit is used for providing the mappings
for the trap vectors and their names. Add mapping for H_VIRT so that
trap reason is displayed as string instead of a vector number when using
the kvm_guest_exit tracepoint.

Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
---
 arch/powerpc/kvm/trace_book3s.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kvm/trace_book3s.h b/arch/powerpc/kvm/trace_book3s.h
index 372a82fa2de3..9260ddbd557f 100644
--- a/arch/powerpc/kvm/trace_book3s.h
+++ b/arch/powerpc/kvm/trace_book3s.h
@@ -25,6 +25,7 @@
 	{0xe00, "H_DATA_STORAGE"}, \
 	{0xe20, "H_INST_STORAGE"}, \
 	{0xe40, "H_EMUL_ASSIST"}, \
+	{0xea0, "H_VIRT"}, \
 	{0xf00, "PERFMON"}, \
 	{0xf20, "ALTIVEC"}, \
 	{0xf40, "VSX"}
-- 
2.49.0


