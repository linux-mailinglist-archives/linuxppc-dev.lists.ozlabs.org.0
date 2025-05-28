Return-Path: <linuxppc-dev+bounces-8987-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC91DAC7377
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 May 2025 00:04:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b73Sh1sYCz2xQ6;
	Thu, 29 May 2025 08:04:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748440144;
	cv=none; b=jZ2n5XkMncguci9wexmW0fF74uRjl133TqzkdfIE7zAfYlX8pfDPPiM4SEhp6YfHDsbjEI2cevZLNRyEp2xcrtUNcp3KCAMiDWumbc4l8Xst0zhZF4LwKRk+l0jnC/C1+/Ygsl3LYOjeTY9zT5muu6cQdwZ7cjBmzxWda5FvSZ5Be7AXOhuKwU3XbBiWaw2GAFtRKl4AeqLhDmT+M6pezl52gwouKU3Z3u0Ca3R6TC7UR7ck9axaXHhPGLA6Qo56ErChm9kA8ZdRkizMj/iR4mieZiy/0nC0F74MA0Oo1m2aWeTXWC/m4zvhxEHF/MIB0nhn0JQqKgA9OLuTX+uewQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748440144; c=relaxed/relaxed;
	bh=rVFTIldYvXpd2qDOzz3YuFbzbBJnslDYobwgibhjA+I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Eq+pQNt2aPq7iT3liYkRt+g0YAdKQ4lZsNxMYrm5BWtq3gSVh98wSOQuMeKwrp1T4KwfI4xnZKNCY6ON3P9AXpBeKummjB0+8d2sl4h4DvEOWPh+Gklgo4BU2EL5ipL3jR93DP0CMOvlkS4ACR4wOkNhQfu65tiy4p59+vJWjtswGQh3kQ+d1wt7s81fX5Rb7vDjVlR9yX9BTHVSMQ8MtGI+3zqoqgHddV2A/rZM3Kh6x4oWHVjwdZzFBWa48MKp1ZmfpyrPelXk/G5YdMqxUDqJClOmB0TZlMvKxxVRhlzMuzr2GgW39xQrFbvPpjualbuGgMSONeHjaJNPnGIJxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pevBmcVQ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adityab1@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pevBmcVQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adityab1@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6rSw0HsVz2xQ5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 May 2025 23:49:03 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S2M81H004256;
	Wed, 28 May 2025 13:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=rVFTIldYvXpd2qDOz
	z3YuFbzbBJnslDYobwgibhjA+I=; b=pevBmcVQbxivXXJGWIXRgIkqExLU8xOs/
	p6y8w/to8FrmoZRk/Lby35B0k+fo/Jte+QbNOSfGRisgHtl6BlqSCbHYlaC3RRV9
	kxE1wdcnqdMVLUH3UOwRm1K4P13EE2MMLJaw6sYv2PjUCeKDOLK5jN4KvaP1k9Db
	CJd7T8WX2isBsyszMsZFkFkY4i5MxGIsI8dMvi4IX2S//F9gXv+BzVoOfMBdVfyl
	oo+Px2vKnV1qj4i3TpMPF1ooQjz3NLNe/WRsFuGSFz85vL8mujl50hIf7v06q2Bh
	CmkA/xVpen/O8IBw6ZVyp4HxcUP+s/qnK5da9YYoodk5mSv0vXe4Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46wgsjd5bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 13:48:48 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54SDlnwA024228;
	Wed, 28 May 2025 13:48:47 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46wgsjd5be-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 13:48:47 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54SAlA5D015826;
	Wed, 28 May 2025 13:48:47 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46uu537d0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 13:48:46 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54SDmfrm52691336
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 13:48:41 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7EAB72004D;
	Wed, 28 May 2025 13:48:41 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E9462004B;
	Wed, 28 May 2025 13:48:37 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.74.199])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 May 2025 13:48:37 +0000 (GMT)
From: Aditya Bodkhe <adityab1@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, rostedt@goodmis.org, mhiramat@kernel.org,
        mark.rutland@arm.com, Hari Bathini <hbathini@linux.ibm.com>,
        Aditya Bodkhe <aditya.b1@linux.ibm.com>
Subject: [PATCH 2/2] powerpc/fprobe: fix updated fprobe for function-graph tracer
Date: Wed, 28 May 2025 19:18:20 +0530
Message-Id: <20250528134820.74121-2-adityab1@linux.ibm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250528134820.74121-1-adityab1@linux.ibm.com>
References: <20250528134820.74121-1-adityab1@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=Qspe3Uyd c=1 sm=1 tr=0 ts=68371440 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=eJdZZeSqwtc_5qrUTOUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDExOSBTYWx0ZWRfXzXzQ0vDOwPa4 yQFR21u0084zLJKFl/+IfT4zTV43TjGLQUlD0Cu4yE9oAogrk9EYz2cEUXgCD0twqjgaPPj1kjb CR9chjHJxmW+iQhsE7Qx3MJZucatG5hjnxkSkHJ4R2rrwr7CoK7ENIFVhIvs16K09uS++cF1nWi
 +lRojuo+dZy2dz2Nkcek7BHx+2/KOeNV/ze9f96XDVRsYqGNgUkICljReqIsChFxzEgx0w/+Ncd nsxlh01aj/yivrp5vhYeBhKQl9GzAjlK3/4yFiJWvEZlbl7UaW+2gIKn53XSpVbpg9Xm40plys9 PkQcUX/OtfD6o7lYJePbXOtdZ8x8jLqaw/vn0Koy2ASutczt1h8ndjWuHhcLvOilYhD8mt4Q4QP
 nkQGBTCS2CBcloM1uaezeADeP3YkOPJ4YsHYrmfzBDr9cELsf+dQoEaS8m1iOtr10uSo8cnv
X-Proofpoint-ORIG-GUID: uNhrfTvm3M97-lTnYrx3fGQD5Xa6dDlz
X-Proofpoint-GUID: g2lbWCX53h9a0ziFEy7VuvzpaFsiejbs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 impostorscore=0 spamscore=0
 mlxlogscore=604 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280119
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Hari Bathini <hbathini@linux.ibm.com>

Since commit 4346ba160409 ("fprobe: Rewrite fprobe on function-graph
tracer"), FPROBE depends on HAVE_FUNCTION_GRAPH_FREGS. With previous
patch adding HAVE_FUNCTION_GRAPH_FREGS for powerpc, FPROBE can be
enabled on powerpc. But with the commit b5fa903b7f7c ("fprobe: Add
fprobe_header encoding feature"), asm/fprobe.h header is needed to
define arch dependent encode/decode macros. The fprobe header MSB
pattern on powerpc is not 0xf. So, define FPROBE_HEADER_MSB_PATTERN
expected on powerpc.

Also, commit 762abbc0d09f ("fprobe: Use ftrace_regs in fprobe exit
handler") introduced HAVE_FTRACE_REGS_HAVING_PT_REGS for archs that
have pt_regs in ftrace_regs. Advertise that on powerpc to reuse
common definitions like ftrace_partial_regs().

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
Signed-off-by: Aditya Bodkhe <aditya.b1@linux.ibm.com>
---
 arch/powerpc/Kconfig              |  1 +
 arch/powerpc/include/asm/fprobe.h | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 arch/powerpc/include/asm/fprobe.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 9163521bc4b9..2203e4fb64c1 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -246,6 +246,7 @@ config PPC
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
 	select HAVE_GUP_FAST
 	select HAVE_FTRACE_GRAPH_FUNC
+	select HAVE_FTRACE_REGS_HAVING_PT_REGS
 	select HAVE_FTRACE_MCOUNT_RECORD
 	select HAVE_FUNCTION_ARG_ACCESS_API
 	select HAVE_FUNCTION_DESCRIPTORS	if PPC64_ELF_ABI_V1
diff --git a/arch/powerpc/include/asm/fprobe.h b/arch/powerpc/include/asm/fprobe.h
new file mode 100644
index 000000000000..d64bc28fb3d3
--- /dev/null
+++ b/arch/powerpc/include/asm/fprobe.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_PPC_FPROBE_H
+#define _ASM_PPC_FPROBE_H
+
+#include <asm-generic/fprobe.h>
+
+#ifdef CONFIG_64BIT
+#undef FPROBE_HEADER_MSB_PATTERN
+#define FPROBE_HEADER_MSB_PATTERN	(PAGE_OFFSET & ~FPROBE_HEADER_MSB_MASK)
+#endif
+
+#endif /* _ASM_PPC_FPROBE_H */
-- 
2.43.5


