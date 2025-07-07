Return-Path: <linuxppc-dev+bounces-10141-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B4DAFADF0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jul 2025 10:02:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbGtb3ZmVz30Vl;
	Mon,  7 Jul 2025 18:02:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751875351;
	cv=none; b=bP4n1lTyFBweGF3n0xdBnIARaHs3t5P2iVy9RXqLG4lqvtlHXdyWY+fK7kMzwc9nCAIrCAZLWM96HfdZGOnnrGSHsbJBSkH2+MPpSdc8B/AckvFdhXGmUqADBc6ogU/7qJo+GyOlLMlLNm6ysgrFjcOjaKC7PLGVAggsnC9FWTAb7oodHt9AzJaImhd29ozTPiveoAPNMmnh8r6MefdV/eBYfU4nk+10KNQDGL1ZBDcbe1JFgOiQql2zL7fJ6d7wvF9yuihBx7gNtwIq99GpxVa/OqsuByZoLtJqD/VYue7oKmKhx09ssiHPaxlPj1f6hxY41VZ98OMu9vm4BvJnyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751875351; c=relaxed/relaxed;
	bh=vmhU+FR2k26av2hIZiV+NNFmRQFDTiIkuVxAjb0IsSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LGtDD5plhq02ait4j25h3Aw9P3YywIzHLvhSFiKGtYfjiXzGcbr1XG9+kLLDSGDqsmNzYGx+wZlYlu0KYk5Na0qXMEMPRWb8O3N46y4g8H4KwF5QNuOvGoJ8Mt9aFE+dzZhqd/rzAa48DtWkkQ3I74hJ6w0zfBo/AAsa488gecADNfFjtQ9YlI0uogxEhkKmrOHTLE/5XPb4NdQCNczuV5C2nd1tsu+3H/9C+cXDP7gX0Uq0wz+T7tqQtrLG2obwzjBjnglgrA6rbvxCmyGbD3mBSdzlBYOsH71RGvs+UktNZOiVYRAwtfn0/x4Wt3NlTje9KG1RMiv/lwrlfiL/zw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jb3BXnqx; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adityab1@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jb3BXnqx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adityab1@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bbGtZ5R3lz30V7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jul 2025 18:02:30 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566ElGFi026476;
	Mon, 7 Jul 2025 08:02:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=vmhU+FR2k26av2hIZ
	iV+NNFmRQFDTiIkuVxAjb0IsSQ=; b=jb3BXnqxVUicitAdHvgfSUqNzpKpMXj6b
	+C6FeogoxevXVHbac2rL5KiC+LG2JNGbiKSJAQ6exqPhU71fm4MmpzRwKDlAU21g
	p4LutUUXAsfcB/wgfLC1cJ+hltNPcpYdJki+ZUrni+xgw6yM0H5YaYNw7nPWKKdE
	YptVQbqscHjUk1TJrfPnQMJogWkCmWztK8t5trQgHpT/IHCkw5mdreNUupeiBqK7
	R+4ma7jywF2VWlrtYVrPRQLPHgTGBO42kX0wZLQrdLbji0X/hbUD/UdAFqWOAyVJ
	JLZKrXMTW/BS8UQ7TcBzBSlO2bRoqfn+u09RES7/YsJwXYwZzc44w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47pusrr8sn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 08:02:16 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5677mxpO004028;
	Mon, 7 Jul 2025 08:02:16 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47pusrr8sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 08:02:16 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5674OPID025528;
	Mon, 7 Jul 2025 08:02:15 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47qfcnw4kw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 08:02:15 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56782BNX60359056
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Jul 2025 08:02:11 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C8412004B;
	Mon,  7 Jul 2025 08:02:11 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 96CED2004D;
	Mon,  7 Jul 2025 08:02:08 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.94.242])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Jul 2025 08:02:08 +0000 (GMT)
From: Aditya Bodkhe <adityab1@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, rostedt@goodmis.org, mhiramat@kernel.org,
        mark.rutland@arm.com, Hari Bathini <hbathini@linux.ibm.com>,
        Aditya Bodkhe <adityab1@linux.ibm.com>
Subject: [PATCH 2/2] powerpc/fprobe: fix updated fprobe for function-graph tracer
Date: Mon,  7 Jul 2025 13:31:56 +0530
Message-ID: <20250707080156.64874-2-adityab1@linux.ibm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250707080156.64874-1-adityab1@linux.ibm.com>
References: <20250707080156.64874-1-adityab1@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=Vaj3PEp9 c=1 sm=1 tr=0 ts=686b7f08 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=eJdZZeSqwtc_5qrUTOUA:9
X-Proofpoint-GUID: ATgY4xVqoYy0zFQSa2JxU8rxQcmuDFq3
X-Proofpoint-ORIG-GUID: _GclW8kBloXE7CtCBkTpiYDakd8G5Bsx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA0NCBTYWx0ZWRfX45WWdWiqH+H6 zsEF8g73Ft4aEfhHN2VazVV1jF6hsvDjS3v5B4BiN0/lTYWWqhhHhBhH8OrasTEcVWuUoIwT69c HGauyyVa2URH8NGWcDzv3UoaqI9RP5GABTxxHuv9iUshGWlVWiLhLCbTthzVkjyeD8uZi+hH7ak
 Pg7cYSnEcbdhBherRwW5Pb8bwrXU7fRgpO9ED3YcnMcE3hFghdms5kAsORKC33M7VVUclENsb++ 9/XNHkKmw7sqvvyshmRDMFzuD8Rtm3BVOAlMCBSVPxzlTKFIYar3VOh4CeXqgMa7C9lLltps0yV I3Jx0TAlirwCV1Lu3SYlxZz9mM3EIP3H9VSG6CopYdNi40WGE56BDPZuTlSMWRP+K4dLLkmRCcJ
 B5lt/hC5/KqCIZEWW7Y7h9bv+Lzf9/7y8npoHhZZDA37SblU+KW6s9O02ZcvlZI0uE9WzW/T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=606 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070044
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
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
Signed-off-by: Aditya Bodkhe <adityab1@linux.ibm.com>
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
2.50.0


