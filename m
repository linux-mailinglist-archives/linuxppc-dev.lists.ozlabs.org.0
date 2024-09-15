Return-Path: <linuxppc-dev+bounces-1392-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8675D9798DD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2024 22:58:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6L3b2xTGz2yNj;
	Mon, 16 Sep 2024 06:58:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726433883;
	cv=none; b=T1x+bq8NruB+Wl3FNsW2U/WejIbkwyovIpEIWGmOaGJ7h+FYfzwe+7/CrDJ/xLAg7wEp26cUw4Z6wAbFeVGdOmi0OCn9HshIECrKWqqMQbLxC5YCyNK4VOUFn9aIIjitJyllyIPuup+kE9BeGQioJXijzdNMxsY/VBtJb+KRJpBnPX5uQuZPa2tMO0pwIjPsO4RMHxcsJ8UhgeDfDNROZsc8jvmwcijiKRhfEOzuXnEK7v1IeTRKEfqxor79pxiW6kXd3mvUOK3/sgJNJaLt5Vkg/jX1JI19kTf73uMYKB4eCyheT6rHOcJ65WytGoJyHJBCaPSKBWrRz48TJnF71w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726433883; c=relaxed/relaxed;
	bh=AxsJpLHo8dECOzs4gUkT1Yc+imfdAslCddi/zcVEccY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E1XjnXPwazaMEeyU6GlaZa8v48jk+Eq2og9/vrcmZwU6GkfQcdJtkcwuP4l9EAvPl7uwqAmjXlgqCc5x5CImdT1gnF/KlPb1b/tZ79EQGacJpO4qdN1+2ENQU1r/ANnRs2VyDUSWnJ4tmPckI3JMpPKUWSO6ngvv+LMRoaMrzH89dg9j3wlqID/nDqy5K5QkBasP71pZ53Yv4P7Zte6L73cVrybrUUs0cOEVVzA5vT+F70bK1KI9bSbpardNfnBPifTG2dO9W2alhWNO1ZmFKrVSpjNouspYyMKSOUktqUh704VzpDcQlC8fOQPOygggPHU+r/myaRi0EDJxp89uWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cbwNXHG3; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cbwNXHG3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6L3b0C4cz2xxp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2024 06:58:02 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48FKmcfB000823;
	Sun, 15 Sep 2024 20:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=AxsJpLHo8dECO
	zs4gUkT1Yc+imfdAslCddi/zcVEccY=; b=cbwNXHG3VsQovSVT8iwdGR5jLwUEX
	5D0Kc5u64rL7NZUhuSGf86x2DFczE9Wr5XtKH3btkGtNGKsxVP8seu62WqsFPDSx
	F3nlPkeHp0YqAHN3CSslGrk4gags+6N4VHemKBgZ1wqNe0nD95/Ey/Mygc8kIzsg
	2f8R2niQ9yH0Un6GB+2qOcuXl/OSCB7RdVTxy1GbHZ+e9M/zmKfAazuyncXP1N+a
	Lf0KYNfkCiON76wbPtQJgqQeOQkJcPOzABz9+rmJuZYE7+wRp6cwfoEBwLfsw94y
	Iyxy33a7oskVqhGBI/4WxKGrQmqYe15B8gL9G5pITixAV/pogt8AoogXQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n3ucxerc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Sep 2024 20:57:41 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48FKveXD015811;
	Sun, 15 Sep 2024 20:57:40 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n3ucxera-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Sep 2024 20:57:40 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48FHCX6e001871;
	Sun, 15 Sep 2024 20:57:39 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 41nqh3bc0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Sep 2024 20:57:39 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48FKva3r55443764
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Sep 2024 20:57:36 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 09C6620049;
	Sun, 15 Sep 2024 20:57:36 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A332120040;
	Sun, 15 Sep 2024 20:57:32 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.68.55])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 15 Sep 2024 20:57:32 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: "Naveen N. Rao" <naveen@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Vishal Chourasia <vishalc@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH v5 10/17] powerpc/ftrace: Add a postlink script to validate function tracer
Date: Mon, 16 Sep 2024 02:26:41 +0530
Message-ID: <20240915205648.830121-11-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240915205648.830121-1-hbathini@linux.ibm.com>
References: <20240915205648.830121-1-hbathini@linux.ibm.com>
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
X-Proofpoint-GUID: 0kGxEAevJzIpxHJsWu9dk5-6WLrJnEbo
X-Proofpoint-ORIG-GUID: 1rTmZJ8O7kfiC1XaFKXsp6vOPrMqkH7l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-15_12,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409150159

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
---
 arch/powerpc/Kconfig               |  2 +-
 arch/powerpc/Makefile.postlink     |  8 +++++
 arch/powerpc/tools/ftrace_check.sh | 50 ++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100755 arch/powerpc/tools/ftrace_check.sh

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1f9d23b276b5..de18f3baff66 100644
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
index 000000000000..f4310e736f1b
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
+	cut -d' ' -f1 | tr '[[:lower:]]' '[[:upper:]]')
+ftrace_caller_addr=$($nm "$vmlinux" | grep -e " T ftrace_caller$" | \
+	cut -d' ' -f1 | tr '[[:lower:]]' '[[:upper:]]')
+ftrace_tramp_addr=$($nm "$vmlinux" | grep -e " T ftrace_tramp_text$" | \
+	cut -d' ' -f1 | tr '[[:lower:]]' '[[:upper:]]')
+
+ftrace_caller_offset=$(echo "ibase=16;$ftrace_caller_addr - $stext_addr" | bc)
+ftrace_tramp_offset=$(echo "ibase=16;$ftrace_tramp_addr - $ftrace_caller_addr" | bc)
+sz_32m=$(printf "%d" 0x2000000)
+sz_64m=$(printf "%d" 0x4000000)
+
+# ftrace_caller - _stext < 32M
+if [ $ftrace_caller_offset -ge $sz_32m ]; then
+	echo "ERROR: ftrace_caller (0x$ftrace_caller_addr) is beyond 32MiB of _stext" 1>&2
+	echo "ERROR: consider disabling CONFIG_FUNCTION_TRACER, or reducing the size \
+		of kernel text" 1>&2
+	exit 1
+fi
+
+# ftrace_tramp_text - ftrace_caller < 64M
+if [ $ftrace_tramp_offset -ge $sz_64m ]; then
+	echo "ERROR: kernel text extends beyond 64MiB from ftrace_caller" 1>&2
+	echo "ERROR: consider disabling CONFIG_FUNCTION_TRACER, or reducing the size \
+		of kernel text" 1>&2
+	exit 1
+fi
-- 
2.46.0


