Return-Path: <linuxppc-dev+bounces-12275-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 946BDB58CEA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 06:41:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQq3d2dC6z3bvd;
	Tue, 16 Sep 2025 14:41:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757997677;
	cv=none; b=cgZZWHXyRVh+OV234Mux/jRSTIbPW5u5KTFDG2VtIE+Ct8KjwMaMAb0DjLATJYF+efw4PKR9a13SgTKwdClCMq0/YL7/2oI9LuYShSl1r1algw/JSazosIejq7T84ZhGWFJBgloeCzyioHBs0ud46fCN1Ap9vDkd3g3LB7/mCWLLjK8GL53GTtED19H9mhqiuO6ruEMjFyWjFa9Apv3JeVlFOlX3fE7cqeeubTI8gfDUk0OwRgD6XkolJaRaj4RuIfE4eqJhp4aGcf6U+vA8lM7VJiCb+ga5FJSvweyISA1f8Qn/RnJBUUdZw9RWf2pAmoau8Efi2CPqcutgbttwhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757997677; c=relaxed/relaxed;
	bh=pAfgq7DC16Q2TgxbpJzO5Fd/wYYcfpRe1dodp200UJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZCLvZIQ+O8o8smK8gLL5ONVoL9CmuWDZalfCvdzVYYOAWOGv0ml9Sn7sV8LfmH1UBstXyXXlKHLm6YTvy4ibydsya2ZH7+GTLqOpLxAuS8XKnSG/woXrSnW0DloQwLofK/lRIB++qzuewk0Os36g6H43i1jMqoRM+G7GExuuBPnZAj4xmDMKq/aOvC4F/mSOlBk8R2x2tsZuqQQUpaPQjbnpGAVPvAdLkjZYnWm1Kt0bKdBwJ0ksEJyVbkK1DaoTcW2yqkCJX+Bl/TkeUyIJoSX5xkhuOcOFqK3BJmNO49GrBlPDsyrOYou7Dd2n4EeGDvtOS2vXeR6TnHKszgEB/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UIEjXAJb; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adityab1@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UIEjXAJb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adityab1@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQq3c3hvNz3bW7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 14:41:16 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FI187D031553;
	Tue, 16 Sep 2025 04:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=pAfgq7DC16Q2Tgxbp
	JzO5Fd/wYYcfpRe1dodp200UJ4=; b=UIEjXAJbBmCKFmfotzZhPiLPTFVJcICZ+
	/7jGioRiNYKHMSjwslYYAkf7MJEUnVYyr1dABMYvUG6LmcOHYJ2/OdovXOqrJuNd
	gIRt+XELke2kVj9EClX2BFCFNex8sQhV7ML+Mc6f2PKHM8AV12+xf4ns//qE7I+7
	BFxWapCIBK2+z9VMShVXf9uGNyQxAMxYnTbq9vnSmIUN7XzMBYqzMBksDDcMK4fL
	8BtUB/LgvJqD2xOs5VDErmdTYs2P0j7ITfNBkrz0irdUMpJFwuoKwfPvuCMajyny
	8anLSKE4E6r98zL+t7jgHZ1yRr8SI8hk15YuHT0pUn4KpKBwjvneg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 494x1te9g8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 04:41:02 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58G4f276011843;
	Tue, 16 Sep 2025 04:41:02 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 494x1te9g2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 04:41:02 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58G4DnUE009363;
	Tue, 16 Sep 2025 04:41:01 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 495nn39r1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 04:41:01 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58G4etLT24052030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Sep 2025 04:40:55 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5DDAA20043;
	Tue, 16 Sep 2025 04:40:55 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E40F20040;
	Tue, 16 Sep 2025 04:40:49 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.243.165])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 16 Sep 2025 04:40:48 +0000 (GMT)
From: Aditya Bodkhe <adityab1@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, rostedt@goodmis.org, mhiramat@kernel.org,
        mark.rutland@arm.com, Hari Bathini <hbathini@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Aditya Bodkhe <aditya.b1@linux.ibm.com>
Subject: [PATCH v4 2/2] powerpc/fprobe: fix updated fprobe for function-graph tracer
Date: Tue, 16 Sep 2025 10:10:35 +0530
Message-ID: <20250916044035.29033-2-adityab1@linux.ibm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250916044035.29033-1-adityab1@linux.ibm.com>
References: <20250916044035.29033-1-adityab1@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=OMsn3TaB c=1 sm=1 tr=0 ts=68c8ea5e cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8 a=eJdZZeSqwtc_5qrUTOUA:9
X-Proofpoint-ORIG-GUID: bhQoXvQwD7WJrUGm602XjEeZUkpTQq4u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMSBTYWx0ZWRfX9zRL0YAeXKdw
 M8bz4r564F3Jo6NHAfsJYYqjWo8u44HRh7NSYVOsZjQMxPOC9yx79JSzEehsS5/mP/+oyGgyXaE
 IJvNob4X9ccQpqcHjCCnU3CUpZb3lWodiFf+D3rSacpHFormfhAr7EKEeXN88hUpIYAzkHJLeqM
 zPpbXZS9b5ww6cjIM1u8lHsU8wsoUXqnF5BBWlVKWXBT2I6uz86OB4IzshJ7W+sEag/47KVdqFU
 PK+yIxBsjHwx3dWP0TPeKHV4c+HWNBIFCbo4MCoe137Riz/O/isSCFlyXTbv+IMmU5bVF8DG03n
 NSsh7hDVteLbnLbNJh/DUnFoYY1XsBFKipEfKfKfOAV3HmZsE362stwtNxO4eiUOm702regwoLe
 ALDV70ki
X-Proofpoint-GUID: IePM3FrU7ydYMVXovTR2jtZ_DJ5IYsJp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 clxscore=1011 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130001
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

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
Signed-off-by: Aditya Bodkhe <aditya.b1@linux.ibm.com>
---
 arch/powerpc/Kconfig              |  1 +
 arch/powerpc/include/asm/fprobe.h | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 arch/powerpc/include/asm/fprobe.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 449404d3932b..325c1171894d 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -243,6 +243,7 @@ config PPC
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
 	select HAVE_GUP_FAST
 	select HAVE_FTRACE_GRAPH_FUNC
+	select HAVE_FTRACE_REGS_HAVING_PT_REGS
 	select HAVE_FUNCTION_ARG_ACCESS_API
 	select HAVE_FUNCTION_DESCRIPTORS	if PPC64_ELF_ABI_V1
 	select HAVE_FUNCTION_ERROR_INJECTION
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
2.51.0


