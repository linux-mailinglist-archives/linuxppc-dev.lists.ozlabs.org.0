Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C62E934A83
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 10:55:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aPmxbTyO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPmpp09Y2z3cXC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 18:55:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aPmxbTyO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPmc01y6Sz3dRS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2024 18:45:52 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I7ucCh023219;
	Thu, 18 Jul 2024 08:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=dizwk6bcZjMAX
	Sq3L+QdQpa2HzGPU1qdadDp/kbw8c4=; b=aPmxbTyOxbdUSM1dArhivP5FwiGRT
	T2S9h0OKd73a6mE5FN53CZT0KORWxTHkJOMqp8OMzguE1BepjcQnew4Fu22z/RkL
	zowI4/jBvfDkd/Wlo+xwjpaddG/6YvOoxkvkDKgNMpNHVjbkWg+rTWN2aIYk8uxb
	GAq1+nyEB3kZeULGj11KJyQMFL8/BImLTy/45hm/vYsvLeUhRGi91f+ZRfOK+hBd
	pwC93lfclAD/ca3b96xWXi+ccAHWCFvWbu+c3oBGhcT/yHUCmkoFnuDVvccPG1N0
	TiM4flhtnvcBRegId9PsbgCt4Te1l4GPhGClJReuo0Sx2MgyW238yy+uw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40ex8f880c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 08:45:43 +0000 (GMT)
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46I8jgqI000839;
	Thu, 18 Jul 2024 08:45:43 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40ex8f8809-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 08:45:42 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46I56xOR009594;
	Thu, 18 Jul 2024 08:45:42 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 40dwkmrrm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 08:45:42 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46I8jakA44040684
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Jul 2024 08:45:38 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFF682004B;
	Thu, 18 Jul 2024 08:45:36 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 759B720043;
	Thu, 18 Jul 2024 08:45:33 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.69.1])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 18 Jul 2024 08:45:33 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [PATCH V8 13/15] tools/perf: Use capstone_init and remove open_capstone_handle from disasm.c
Date: Thu, 18 Jul 2024 14:13:56 +0530
Message-Id: <20240718084358.72242-14-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240718084358.72242-1-atrajeev@linux.vnet.ibm.com>
References: <20240718084358.72242-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Wc9vJkx9DWoMPh78XofUeoGuwGp62JTu
X-Proofpoint-ORIG-GUID: Goym3G-1V7e4-AYaPL50MaH15r4Rksf6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_04,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 spamscore=0 mlxlogscore=927 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407180054
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, akanksha@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

capstone_init is made availbale for all archs to use and updated to
enable support for CS_ARCH_PPC as well. Patch removes
open_capstone_handle and uses capstone_init in all the places.

Reviewed-and-tested-by: Kajol Jain <kjain@linux.ibm.com>
Reviewed-by: Namhyung Kim <namhyung@kernel.org>
Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>
---
 tools/perf/util/disasm.c     | 42 +++++++++++-------------------------
 tools/perf/util/print_insn.c |  3 +++
 2 files changed, 15 insertions(+), 30 deletions(-)

diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index a839f037bdaf..a848e6f5f05a 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -26,6 +26,7 @@
 #include "symbol.h"
 #include "util.h"
 #include "sort.h"
+#include "print_insn.h"
 
 static regex_t	 file_lineno;
 
@@ -1510,32 +1511,6 @@ symbol__disassemble_bpf_image(struct symbol *sym,
 #ifdef HAVE_LIBCAPSTONE_SUPPORT
 #include <capstone/capstone.h>
 
-static int open_capstone_handle(struct annotate_args *args, bool is_64bit,
-				csh *handle)
-{
-	struct annotation_options *opt = args->options;
-	cs_mode mode = is_64bit ? CS_MODE_64 : CS_MODE_32;
-
-	/* TODO: support more architectures */
-	if (!arch__is(args->arch, "x86"))
-		return -1;
-
-	if (cs_open(CS_ARCH_X86, mode, handle) != CS_ERR_OK)
-		return -1;
-
-	if (!opt->disassembler_style ||
-	    !strcmp(opt->disassembler_style, "att"))
-		cs_option(*handle, CS_OPT_SYNTAX, CS_OPT_SYNTAX_ATT);
-
-	/*
-	 * Resolving address operands to symbols is implemented
-	 * on x86 by investigating instruction details.
-	 */
-	cs_option(*handle, CS_OPT_DETAIL, CS_OPT_ON);
-
-	return 0;
-}
-
 struct find_file_offset_data {
 	u64 ip;
 	u64 offset;
@@ -1632,6 +1607,7 @@ static int symbol__disassemble_capstone(char *filename, struct symbol *sym,
 	cs_insn *insn;
 	char disasm_buf[512];
 	struct disasm_line *dl;
+	bool disassembler_style = false;
 
 	if (args->options->objdump_path)
 		return -1;
@@ -1646,7 +1622,11 @@ static int symbol__disassemble_capstone(char *filename, struct symbol *sym,
 			    &is_64bit) == 0)
 		goto err;
 
-	if (open_capstone_handle(args, is_64bit, &handle) < 0)
+	if (!args->options->disassembler_style ||
+			!strcmp(args->options->disassembler_style, "att"))
+		disassembler_style = true;
+
+	if (capstone_init(maps__machine(args->ms.maps), &handle, is_64bit, disassembler_style) < 0)
 		goto err;
 
 	needs_cs_close = true;
@@ -1966,9 +1946,11 @@ int symbol__disassemble(struct symbol *sym, struct annotate_args *args)
 	}
 
 #ifdef HAVE_LIBCAPSTONE_SUPPORT
-	err = symbol__disassemble_capstone(symfs_filename, sym, args);
-	if (err == 0)
-		goto out_remove_tmp;
+	if (arch__is(args->arch, "x86")) {
+		err = symbol__disassemble_capstone(symfs_filename, sym, args);
+		if (err == 0)
+			goto out_remove_tmp;
+	}
 #endif
 
 	err = asprintf(&command,
diff --git a/tools/perf/util/print_insn.c b/tools/perf/util/print_insn.c
index a76aae81d7a0..79dec5ab3bef 100644
--- a/tools/perf/util/print_insn.c
+++ b/tools/perf/util/print_insn.c
@@ -52,6 +52,9 @@ int capstone_init(struct machine *machine, csh *cs_handle, bool is64, bool disas
 	} else if (machine__normalized_is(machine, "s390")) {
 		arch = CS_ARCH_SYSZ;
 		mode = CS_MODE_BIG_ENDIAN;
+	} else if (machine__normalized_is(machine, "powerpc")) {
+		arch = CS_ARCH_PPC;
+		mode = CS_MODE_64;
 	} else {
 		return -1;
 	}
-- 
2.43.0

