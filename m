Return-Path: <linuxppc-dev+bounces-2403-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CAB9A44E9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 19:38:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVX3M3r1Dz3cDf;
	Sat, 19 Oct 2024 04:37:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729273071;
	cv=none; b=JA7vLfO+kf1SKhik0y/Fz+ohkBZIrdf3UB/bynx+EfqFl2Xt4ThhK+VyTIlBgReI9E064l1SS70xX5jeUE8IZkLC7RuGND1uOqA1I1BRDAPinucB6Agr1PMhu7IgS2vitVogACoQ8K6mg1pS2gsb7bUFBn5pQhkUKELc8aEdfjdz0NTDbW96fSZ4kIIf5xW9QknIXqS/8rzuSRGOOJFxE2A1RaMiargvXjBgWfzvevhVXlGPmRX+GFPEQOYPN2A+rNviGGs8tmn8+xL2X1mQ9RctFlTP1ZAHcn09w4xpf5dtPh1JTHUHIuMUfCkEIHGaPliooKMNWe1jAFfu/F0ohA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729273071; c=relaxed/relaxed;
	bh=JGYWfrPfzXzPdrdn1nMdFcY4hYimZxb7JncZtcrP9U4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TTq0C8Ycw2IP8gV412p0fLua2GWoGfMpP84YAc0lXzVpTUZVpcFcUD/9WCU5Ym5oKiTFNr++DECmhQJJja3G6u99v78ahKZ0aMTGskOjafYYiulkT/f6y8AsKbMl36AggRt1YOqqfZah01Cklrv7wfffET5d1m1XL0ruHo+1UU/narJwiDmW26QQG7B6Y3eXgucZF2muqkI9mYilUVDGkSLC2Wrt0R1/hAXpFx/6Jrcydf7PdJK8+nIeZ+y/07QAOYAhSbsoVULa4RY5UgG9d2p+u4cjZL+9I4LMl7pSseDz/9vi4NcTLnnge5mxKSC5sftAsAMhUpwA+03OhVe59g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L6Xfqctd; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L6Xfqctd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVX3L3NK9z3c3K
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 04:37:50 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ICZmv1023701;
	Fri, 18 Oct 2024 17:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=JGYWfrPfzXzPdrdn1
	nMdFcY4hYimZxb7JncZtcrP9U4=; b=L6XfqctdAdQTQ5X3FHgkOm4NWoENrXw8u
	7kCWChAL5LHLeNoz+IeJCjlLoYNLsLgdMU6Ex4J4eR0M1Z6K4YFT7EFziLuxx1vu
	P3HDlxgwwJVlqFbOufrgMO2ebNgYMtIdzhGh/J1LNlv/7w8XSa+UHZTlh0ybQCpR
	wzrsKk73suHj4GKR/4qLEvEuRQ95/3kbwRDS0pOvCRHgUd8+eH2t8/jF31ct2sZj
	TZS9I1sGSo/OIlD0/XQidXxIBP5/n1YUyuv+2+BOrc4VDEWCvu2DwTVBmUuBKZZs
	zaPRDhyvuHLKLnB9SbnX/EI0dnn+XYyBvMogz9K3jvoFdyvU4/j3w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42ar0ua92d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 17:37:27 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49IHbRgl019214;
	Fri, 18 Oct 2024 17:37:27 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42ar0ua927-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 17:37:27 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49IHMVgR001982;
	Fri, 18 Oct 2024 17:37:26 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4284en600t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 17:37:26 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49IHbM1852691360
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Oct 2024 17:37:22 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5ACE820040;
	Fri, 18 Oct 2024 17:37:22 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5159620043;
	Fri, 18 Oct 2024 17:37:18 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.99.188])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Oct 2024 17:37:18 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao" <naveen@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Vishal Chourasia <vishalc@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Subject: [PATCH v6 10/17] powerpc/ftrace: Add a postlink script to validate function tracer
Date: Fri, 18 Oct 2024 23:06:25 +0530
Message-ID: <20241018173632.277333-11-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241018173632.277333-1-hbathini@linux.ibm.com>
References: <20241018173632.277333-1-hbathini@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rbcGewJQCxkyPEldCazRbreCxL64LPWi
X-Proofpoint-ORIG-GUID: wFfpNO7IdFXcKyC-6o_aqKlHsqbWKkfj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180111
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Naveen N Rao <naveen@kernel.org>

Function tracer on powerpc can only work with vmlinux having a .text
size of up to ~64MB due to powerpc branch instruction having a limited
relative branch range of 32MB. Today, this is only detected on kernel
boot when ftrace is init'ed. Add a post-link script to check the size of
.text so that we can detect this at build time, and break the build if
necessary.

We add a dependency on !COMPILE_TEST for CONFIG_HAVE_FUNCTION_TRACER so
that allyesconfig and other test builds can continue to work without
enabling ftrace.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v6:
* Shellcheck warnings fixed for arch/powerpc/tools/ftrace_check.sh


 arch/powerpc/Kconfig               |  2 +-
 arch/powerpc/Makefile.postlink     |  8 +++++
 arch/powerpc/tools/ftrace_check.sh | 50 ++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100755 arch/powerpc/tools/ftrace_check.sh

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 8094a01974cc..bd1ca813e71c 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -243,7 +243,7 @@ config PPC
 	select HAVE_FUNCTION_DESCRIPTORS	if PPC64_ELF_ABI_V1
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_FUNCTION_GRAPH_TRACER
-	select HAVE_FUNCTION_TRACER		if PPC64 || (PPC32 && CC_IS_GCC)
+	select HAVE_FUNCTION_TRACER		if !COMPILE_TEST && (PPC64 || (PPC32 && CC_IS_GCC))
 	select HAVE_GCC_PLUGINS			if GCC_VERSION >= 50200   # plugin support on gcc <= 5.1 is buggy on PPC
 	select HAVE_GENERIC_VDSO
 	select HAVE_HARDLOCKUP_DETECTOR_ARCH	if PPC_BOOK3S_64 && SMP
diff --git a/arch/powerpc/Makefile.postlink b/arch/powerpc/Makefile.postlink
index ae5a4256b03d..bb601be36173 100644
--- a/arch/powerpc/Makefile.postlink
+++ b/arch/powerpc/Makefile.postlink
@@ -24,6 +24,9 @@ else
 	$(CONFIG_SHELL) $(srctree)/arch/powerpc/tools/relocs_check.sh "$(OBJDUMP)" "$(NM)" "$@"
 endif
 
+quiet_cmd_ftrace_check = CHKFTRC $@
+      cmd_ftrace_check = $(CONFIG_SHELL) $(srctree)/arch/powerpc/tools/ftrace_check.sh "$(NM)" "$@"
+
 # `@true` prevents complaint when there is nothing to be done
 
 vmlinux: FORCE
@@ -34,6 +37,11 @@ endif
 ifdef CONFIG_RELOCATABLE
 	$(call if_changed,relocs_check)
 endif
+ifdef CONFIG_FUNCTION_TRACER
+ifndef CONFIG_PPC64_ELF_ABI_V1
+	$(call cmd,ftrace_check)
+endif
+endif
 
 clean:
 	rm -f .tmp_symbols.txt
diff --git a/arch/powerpc/tools/ftrace_check.sh b/arch/powerpc/tools/ftrace_check.sh
new file mode 100755
index 000000000000..405e7e306617
--- /dev/null
+++ b/arch/powerpc/tools/ftrace_check.sh
@@ -0,0 +1,50 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# This script checks vmlinux to ensure that all functions can call ftrace_caller() either directly,
+# or through the stub, ftrace_tramp_text, at the end of kernel text.
+
+# Error out if any command fails
+set -e
+
+# Allow for verbose output
+if [ "$V" = "1" ]; then
+	set -x
+fi
+
+if [ $# -lt 2 ]; then
+	echo "$0 [path to nm] [path to vmlinux]" 1>&2
+	exit 1
+fi
+
+# Have Kbuild supply the path to nm so we handle cross compilation.
+nm="$1"
+vmlinux="$2"
+
+stext_addr=$($nm "$vmlinux" | grep -e " [TA] _stext$" | \
+	cut -d' ' -f1 | tr '[:lower:]' '[:upper:]')
+ftrace_caller_addr=$($nm "$vmlinux" | grep -e " T ftrace_caller$" | \
+	cut -d' ' -f1 | tr '[:lower:]' '[:upper:]')
+ftrace_tramp_addr=$($nm "$vmlinux" | grep -e " T ftrace_tramp_text$" | \
+	cut -d' ' -f1 | tr '[:lower:]' '[:upper:]')
+
+ftrace_caller_offset=$(echo "ibase=16;$ftrace_caller_addr - $stext_addr" | bc)
+ftrace_tramp_offset=$(echo "ibase=16;$ftrace_tramp_addr - $ftrace_caller_addr" | bc)
+sz_32m=$(printf "%d" 0x2000000)
+sz_64m=$(printf "%d" 0x4000000)
+
+# ftrace_caller - _stext < 32M
+if [ "$ftrace_caller_offset" -ge "$sz_32m" ]; then
+	echo "ERROR: ftrace_caller (0x$ftrace_caller_addr) is beyond 32MiB of _stext" 1>&2
+	echo "ERROR: consider disabling CONFIG_FUNCTION_TRACER, or reducing the size \
+		of kernel text" 1>&2
+	exit 1
+fi
+
+# ftrace_tramp_text - ftrace_caller < 64M
+if [ "$ftrace_tramp_offset" -ge "$sz_64m" ]; then
+	echo "ERROR: kernel text extends beyond 64MiB from ftrace_caller" 1>&2
+	echo "ERROR: consider disabling CONFIG_FUNCTION_TRACER, or reducing the size \
+		of kernel text" 1>&2
+	exit 1
+fi
-- 
2.47.0


