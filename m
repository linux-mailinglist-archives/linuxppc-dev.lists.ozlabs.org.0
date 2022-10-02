Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AED75F22C7
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Oct 2022 12:55:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MgLTN24kcz3fjk
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Oct 2022 21:55:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R3o+A/S4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R3o+A/S4;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MgLFs2sdsz3cgV
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Oct 2022 21:45:05 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 292AGb53003303;
	Sun, 2 Oct 2022 10:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=seXyQs5BLmfK17DAhC+IPaUaFxSwG3PEDBAqBYajgPI=;
 b=R3o+A/S4UBJjZbB5bgYgmkxQJ+A06g9Nm/AA5Hl8VkMfTtoPSLwO/IGAXc+eUaerIcnG
 YDL2SXv/OIY/EZB/5i9ntE6mdL1hKRuXH70g7i4b5m1AXksW655wQbcTRxs+SYa5ezpI
 bi/LGFJDje0NaSoZW0T/UJoeriR2ZY/tvMOvLwvuWlvXpcddi25dlcJE0T70fE1H3wPK
 9veo/x3mqqIvrr2yBpRmfIJBJwU1yQUoFayiyLgknYKwhpQ3SdCU3Ot14S8Oi29RdGJw
 WEMyEvNSAQegIE9x5FrM1ahD9LRIeHj4QsQXc4s+38vcRRu7wA5ljlsxQzSxJ4hXaWTi JA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jxy659a66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Oct 2022 10:44:50 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 292AiWEQ026062;
	Sun, 2 Oct 2022 10:44:50 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jxy659a5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Oct 2022 10:44:50 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 292AaDgd001629;
	Sun, 2 Oct 2022 10:44:48 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma04ams.nl.ibm.com with ESMTP id 3jxd691ax9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Oct 2022 10:44:47 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 292AijvN37880090
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Oct 2022 10:44:45 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C672B52050;
	Sun,  2 Oct 2022 10:44:45 +0000 (GMT)
Received: from li-c3569c4c-1ef8-11b2-a85c-ee139cda3133.ibm.com.com (unknown [9.43.71.20])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5EF3E5204E;
	Sun,  2 Oct 2022 10:44:42 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 16/16] objtool/powerpc: Add --mcount specific implementation
Date: Sun,  2 Oct 2022 16:12:40 +0530
Message-Id: <20221002104240.1316480-17-sv@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221002104240.1316480-1-sv@linux.ibm.com>
References: <20221002104240.1316480-1-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sNshyS9yEL-0rvn-l91_QWKv7gvAjVIz
X-Proofpoint-ORIG-GUID: Lb_FgI5KlZVKH_RcUW3iQVGLBx62xId8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-01_15,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0
 mlxlogscore=972 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210020068
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: peterz@infradead.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, aik@ozlabs.ru, mingo@redhat.com, sv@linux.ibm.com, rostedt@goodmis.org, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, chenzhongjin@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch enables objtool --mcount on powerpc, and adds implementation
specific to powerpc.

Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 arch/powerpc/Kconfig                          |  1 +
 tools/objtool/arch/powerpc/decode.c           | 16 ++++++++++++++++
 tools/objtool/arch/powerpc/include/arch/elf.h |  2 ++
 3 files changed, 19 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index dc05cd23c233..6be2e68fa9eb 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -238,6 +238,7 @@ config PPC
 	select HAVE_NMI				if PERF_EVENTS || (PPC64 && PPC_BOOK3S)
 	select HAVE_OPTPROBES
 	select HAVE_OBJTOOL			if PPC32 || MPROFILE_KERNEL
+	select HAVE_OBJTOOL_MCOUNT		if HAVE_OBJTOOL
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_EVENTS_NMI		if PPC64
 	select HAVE_PERF_REGS
diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/powerpc/decode.c
index dcd0975cad6b..01cade98b49e 100644
--- a/tools/objtool/arch/powerpc/decode.c
+++ b/tools/objtool/arch/powerpc/decode.c
@@ -9,6 +9,11 @@
 #include <objtool/builtin.h>
 #include <objtool/endianness.h>
 
+int arch_ftrace_match(char *name)
+{
+	return !strcmp(name, "_mcount");
+}
+
 unsigned long arch_dest_reloc_offset(int addend)
 {
 	return addend;
@@ -50,6 +55,17 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 	typ = INSN_OTHER;
 	imm = 0;
 
+	switch (opcode) {
+	case 18: /* b[l][a] */
+		if ((insn & 3) == 1) /* bl */
+			typ = INSN_CALL;
+
+		imm = insn & 0x3fffffc;
+		if (imm & 0x2000000)
+			imm -= 0x4000000;
+		break;
+	}
+
 	if (opcode == 1)
 		*len = 8;
 	else
diff --git a/tools/objtool/arch/powerpc/include/arch/elf.h b/tools/objtool/arch/powerpc/include/arch/elf.h
index 3c8ebb7d2a6b..73f9ae172fe5 100644
--- a/tools/objtool/arch/powerpc/include/arch/elf.h
+++ b/tools/objtool/arch/powerpc/include/arch/elf.h
@@ -4,5 +4,7 @@
 #define _OBJTOOL_ARCH_ELF
 
 #define R_NONE R_PPC_NONE
+#define R_ABS64 R_PPC64_ADDR64
+#define R_ABS32 R_PPC_ADDR32
 
 #endif /* _OBJTOOL_ARCH_ELF */
-- 
2.31.1

