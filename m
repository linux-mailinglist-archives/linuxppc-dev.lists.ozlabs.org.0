Return-Path: <linuxppc-dev+bounces-16303-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oODfFzh8eGkFqQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16303-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 09:50:00 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD569145E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 09:49:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0fH76JHxz309N;
	Tue, 27 Jan 2026 19:49:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769503795;
	cv=none; b=M7+AFvzZIUCWj+/CetC8H8bvgw0U7jzH1YT5le2OLj+eq3VQillVjH7PmPAC2wD3beW2RqghTRpnwUXWkmOT+bJsxzUsCJVzFLU0m0dJXJtCnZr7ktE5nh8EbJI47/XFl+XZI3vrhObWZajZMqAkW5oIQeSeFcFk8SrFnB4wCU2tk6Qt9rXwBm4G5Qv4DwuoaiHo7ct8D56KN6qZa8Rq/NiYCTSKduLXdM+JVokxP691zZeqcRW62uk/X3aSqmyZ5ngksSODfygYoswezCnPKTTz10CjL3L7gmr11eeypcWc56RTTCJs6m3bB2Qd8Lmb80gamzmV/pzid7m8+O1Maw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769503795; c=relaxed/relaxed;
	bh=DDHhLXaDEFCJFS1JezriYb1CLJlOz5e6EELlx4UELic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RyK/Z5Os5i+CB9u0k6gHljGiTP7J3mo3iOF5OYxQdDqeNbaH4nfpSC0jTFBZzvpKEA0arba+EIKp7fJWn1j/1/CNPJWNvO3heR4oRL8i2dUIPnDy0B7TiXJq8/nXiey5KgTSPNXPtCF16DTsaDnenceKeFAHS/kfLWBS1ic4HdMy0xFVXELQkeSNeSQIHZuiPvmIpEW7x2pdlcMzuTmyfwGorGH0KerXZbwH7vX9bY4LHq4vpRBIgwTJo4sElQwF14ZYsoB2pDCpcwXRfgpwWxypTjT94hLnVIwWwCaJ3DXn71tkUzSmae0lkQxmQYz0KY24IIXm9q/aUDbh9ChMAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q0ZVcIYS; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q0ZVcIYS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0fH63LF9z2xcB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jan 2026 19:49:54 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60R802Ot001509;
	Tue, 27 Jan 2026 08:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=DDHhLXaDEFCJFS1Je
	zriYb1CLJlOz5e6EELlx4UELic=; b=Q0ZVcIYSUu1hVRSIUyotEMJ3wyJOzaB+G
	G5qZjeUgnAXd9obIUkoyNLBopn6xup629JKNjqrYJveL7J0xl2+J7r1QGxlbXN9T
	n9LwypAAkB9gmXlDQndMzWkyumm2ebrXBf/skoY57Cy2xdi8lVuvp4Z/Pht3Pc/p
	/Ok+HGyTNffwGnsiPMqa7TwBPqiFLbl4Eu5340Ho9uXKOv77ZawI2iTO2cBjJKmJ
	oJWGxsU3hK9ZKAa56+0nSp+t/ReK3SCErVJNE4MVzVHqhuxZydjB6Qbmn1upYGyn
	2RUYHtfdmmSX2v2ApGs7v3NZzLALCJLMniAdLLod38dB1n/gMPQ9w==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnrtca08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 08:49:37 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60R3F1ne026333;
	Tue, 27 Jan 2026 08:49:36 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bw9wk7whw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 08:49:35 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60R8nV1C56426806
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Jan 2026 08:49:31 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C6D312004D;
	Tue, 27 Jan 2026 08:49:31 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A09AF20043;
	Tue, 27 Jan 2026 08:49:29 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.78.106.105])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 27 Jan 2026 08:49:29 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Naveen N. Rao" <naveen@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-trace-kernel@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>, llvm@lists.linux.dev,
        Maryam Moghadas <maryammo@ca.ibm.com>
Subject: [PATCH v2 1/3] powerpc64: make clang cross-build friendly
Date: Tue, 27 Jan 2026 14:19:24 +0530
Message-ID: <20260127084926.34497-2-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127084926.34497-1-hbathini@linux.ibm.com>
References: <20260127084926.34497-1-hbathini@linux.ibm.com>
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
X-Proofpoint-GUID: oPYrBd_Pzi4XlxD8NY6SZPti61D8Jj67
X-Authority-Analysis: v=2.4 cv=Uptu9uwB c=1 sm=1 tr=0 ts=69787c21 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=G_DWyleSnc-e0WChyngA:9
X-Proofpoint-ORIG-GUID: oPYrBd_Pzi4XlxD8NY6SZPti61D8Jj67
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA3MSBTYWx0ZWRfX/8rGKwvJBA3R
 Ipc79uG3sHu+qVTLgjm3vAFl/uGIkMDnGPXsIYpIe3+Nr3wfY8q97X4RuzUET+ru40OotcHiqQ+
 Olw/WIEMpGm45uk5NQ5GrnK34htExPXjoDpP1OTAxuPoWP9VqK3OqYJ60Ba08xFp/pPNoJSxdbZ
 NHpBT9MM7Mmc7ufEMF5W6blUO3e409MjHtLPdHqNiJXP8bl7x6hd8nBkJcMVFrQFl9w0c5IlPrI
 ykWSAe/e7CZdSNgg7InYL8RMNAshA5CpERFtqYsIiCncf8mlg4c6qA69L1ADYNY7XXvFpTXsUZr
 HHh+9tXiiiEGL8CJ8Y4z+YtnY6pwBx9G4rOnxqBbMDaYJGW+pD769dxKKjSTqTbDYmLELgfCOy8
 J33sF5qYLQAh6OxdiRCCiWQbMq6mtUOOA7lTmyhUQv/0AxYkpzK8cjrvHxx5kc6rmjfbArbuno6
 u1YsXSYk1z9kYaeZA5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601270071
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16303-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3CD569145E
X-Rspamd-Action: no action

ARCH_USING_PATCHABLE_FUNCTION_ENTRY depends on toolchain support for
-fpatchable-function-entry option. The current script that checks
for this support only handles GCC. Rename the script and extend it
to detect support for -fpatchable-function-entry with Clang as well,
allowing clean cross-compilation with Clang toolchains.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

* Changes in v2:
  - Use $(CLANG_FLAGS) instead of manually checking CC_IS_CLANG


 arch/powerpc/Kconfig                                          | 4 ++--
 ...e-function-entry.sh => check-fpatchable-function-entry.sh} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/powerpc/tools/{gcc-check-fpatchable-function-entry.sh => check-fpatchable-function-entry.sh} (100%)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b8d36a261009..dcb9894e2004 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -571,8 +571,8 @@ config ARCH_USING_PATCHABLE_FUNCTION_ENTRY
 	depends on FUNCTION_TRACER && (PPC32 || PPC64_ELF_ABI_V2)
 	depends on $(cc-option,-fpatchable-function-entry=2)
 	def_bool y if PPC32
-	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh $(CC) -mlittle-endian) if PPC64 && CPU_LITTLE_ENDIAN
-	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh $(CC) -mbig-endian) if PPC64 && CPU_BIG_ENDIAN
+	def_bool $(success,$(srctree)/arch/powerpc/tools/check-fpatchable-function-entry.sh $(CC) $(CLANG_FLAGS) -mlittle-endian) if PPC64 && CPU_LITTLE_ENDIAN
+	def_bool $(success,$(srctree)/arch/powerpc/tools/check-fpatchable-function-entry.sh $(CC) -mbig-endian) if PPC64 && CPU_BIG_ENDIAN
 
 config PPC_FTRACE_OUT_OF_LINE
 	def_bool PPC64 && ARCH_USING_PATCHABLE_FUNCTION_ENTRY
diff --git a/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh b/arch/powerpc/tools/check-fpatchable-function-entry.sh
similarity index 100%
rename from arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
rename to arch/powerpc/tools/check-fpatchable-function-entry.sh
-- 
2.52.0


