Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 978E1787F9B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 08:12:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K9q4hRWe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RX8kS1hL2z3cNH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 16:12:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K9q4hRWe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=name@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RX8jW3Fmkz2xdR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 16:11:43 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37P67bUv028819;
	Fri, 25 Aug 2023 06:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=05xSB0wy7DyxsGs44RbVn0pD0nPihPcf+9C2gJQt4yk=;
 b=K9q4hRWePC5RgKG9h5Q+UblxrXcbu1ANsnHOHQ45n0DJpZe6jaY3EkuV5h7pbCam60u4
 5magEtQwSOV920nsQHLaRpQK0Y/hPac+Fybq4NpsoWGILPvHKHyNqce1y7unkjKvyZFm
 6gpCg6duHkbiMLzIcVr3KQqXtRLSsEVx7Lg15vCKTMx3dZdtLNeswbMS9mcio1E4LfZ+
 qhrdvajFdrsWmrr6z8mdL24I1ZMVlYbWwC0p3XQgnCJbY2TBTPr1XuPXGjbSuIfDijsX
 njQ+Uw3wuvE9hC5tE5skabLRJ2sAzcPTieJze3k3c7CFpUnvELgLoMxhthXMJq3ipXC+ SQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3spp808q9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 06:11:35 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37P67lpb030177;
	Fri, 25 Aug 2023 06:11:35 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3spp808q9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 06:11:35 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37P5Qm8n016776;
	Fri, 25 Aug 2023 06:11:34 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sn22859dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 06:11:34 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37P6BVPQ24576758
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Aug 2023 06:11:31 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E4FE2004B;
	Fri, 25 Aug 2023 06:11:31 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C98320049;
	Fri, 25 Aug 2023 06:11:29 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.in.ibm.com (unknown [9.109.199.72])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 25 Aug 2023 06:11:29 +0000 (GMT)
From: Aditya Gupta <adityag@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
Subject: [PATCH 1/4] perf build: introduce build subcommand
Date: Fri, 25 Aug 2023 11:41:22 +0530
Message-ID: <20230825061125.24312-2-adityag@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825061125.24312-1-adityag@linux.ibm.com>
References: <20230825061125.24312-1-adityag@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NQwrb6HU9ELR4bg47H68yADuRhU-jD-N
X-Proofpoint-ORIG-GUID: HABfQOZjad2WmgtXgyRZW6tGkxJboCNB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_04,2023-08-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308250051
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently the presence of a feature is checked with a combination of
perf version --build-options and greps, such as:

    perf version --build-options | grep " on .* HAVE_FEATURE"

Instead of this, introduce a subcommand "perf build --has", with which
scripts can test for presence of a feature, such as:

    perf build --has HAVE_FEATURE

'perf build --has' command is expected to have exit status of 1 if feature is
built-in, and 0 if not, -2 if feature is not known.

A global array 'supported_features' has also been introduced that can be
used by other commands like 'perf version --build-options', so that
new features can be added in one place, with the array

Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>
---
 tools/perf/Build           |  1 +
 tools/perf/builtin-build.c | 94 ++++++++++++++++++++++++++++++++++++++
 tools/perf/builtin.h       | 47 +++++++++++++++++++
 tools/perf/perf.c          |  1 +
 4 files changed, 143 insertions(+)
 create mode 100644 tools/perf/builtin-build.c

diff --git a/tools/perf/Build b/tools/perf/Build
index aa7623622834..b15294919e75 100644
--- a/tools/perf/Build
+++ b/tools/perf/Build
@@ -5,6 +5,7 @@ perf-y += builtin-diff.o
 perf-y += builtin-evlist.o
 perf-y += builtin-ftrace.o
 perf-y += builtin-help.o
+perf-y += builtin-build.o
 perf-y += builtin-buildid-list.o
 perf-y += builtin-buildid-cache.o
 perf-y += builtin-kallsyms.o
diff --git a/tools/perf/builtin-build.c b/tools/perf/builtin-build.c
new file mode 100644
index 000000000000..60af38c3bc64
--- /dev/null
+++ b/tools/perf/builtin-build.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "builtin.h"
+#include "color.h"
+#include "util/debug.h"
+#include "util/header.h"
+#include <tools/config.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <string.h>
+#include <subcmd/parse-options.h>
+
+struct build {
+	const char *has;
+};
+
+static struct build build;
+
+static struct option build_options[] = {
+	OPT_STRING(0, "has", &build.has, NULL, "check if a feature is built in"),
+	OPT_END(),
+};
+
+static const char * const build_usage[] = {
+	"perf build [<options>]",
+	NULL
+};
+
+static void on_off_print(const char *status)
+{
+	printf("[ ");
+
+	if (!strcmp(status, "OFF"))
+		color_fprintf(stdout, PERF_COLOR_RED, "%-3s", status);
+	else
+		color_fprintf(stdout, PERF_COLOR_GREEN, "%-3s", status);
+
+	printf(" ]");
+}
+
+static void status_print(const char *name, const char *macro,
+			 const char *status)
+{
+	printf("%22s: ", name);
+	on_off_print(status);
+	printf("  # %s\n", macro);
+}
+
+#define STATUS(feature)                                   \
+do {                                                      \
+	if (feature.is_builtin)                               \
+		status_print(feature.name, feature.macro, "on");  \
+	else                                                  \
+		status_print(feature.name, feature.macro, "OFF"); \
+} while (0)
+
+/**
+ * check whether "feature" is built-in with perf
+ * returns:
+ *   -1: Feature not known
+ *    0: Built-in
+ *    1: NOT Built in
+ */
+static int has_support(const char *feature)
+{
+	int res = -1;
+
+	for (int i = 0; supported_features[i].name; ++i) {
+		if (strcmp(feature, supported_features[i].name) == 0) {
+			res = supported_features[i].is_builtin;
+			STATUS(supported_features[i]);
+			break;
+		}
+	}
+
+	if (res == -1) {
+		color_fprintf(stdout, PERF_COLOR_RED, "Feature not known: %s", feature);
+		return -2;
+	}
+
+	return !res;
+}
+
+int cmd_build(int argc, const char **argv)
+{
+	argc = parse_options(argc, argv, build_options, build_usage,
+			     PARSE_OPT_STOP_AT_NON_OPTION);
+
+	printf("perf build %s\n", perf_version_string);
+
+	if (build.has)
+		return has_support(build.has);
+
+	return 0;
+}
diff --git a/tools/perf/builtin.h b/tools/perf/builtin.h
index f2ab5bae2150..f5b2b5d809ce 100644
--- a/tools/perf/builtin.h
+++ b/tools/perf/builtin.h
@@ -2,11 +2,58 @@
 #ifndef BUILTIN_H
 #define BUILTIN_H
 
+#include <stddef.h>
+#include <linux/compiler.h>
+#include <tools/config.h>
+
+struct feature_support {
+	const char *name;
+	const char *macro;
+	int is_builtin;
+};
+
+#define FEATURE_SUPPORT(name_, macro_) { \
+	.name = name_,                       \
+	.macro = #macro_,                    \
+	.is_builtin = IS_BUILTIN(macro_) }
+
+static struct feature_support supported_features[] __maybe_unused = {
+	FEATURE_SUPPORT("dwarf", HAVE_DWARF_SUPPORT),
+	FEATURE_SUPPORT("dwarf_getlocations", HAVE_DWARF_GETLOCATIONS_SUPPORT),
+#ifndef HAVE_SYSCALL_TABLE_SUPPORT
+	FEATURE_SUPPORT("libaudit", HAVE_LIBAUDIT_SUPPORT),
+#endif
+	FEATURE_SUPPORT("syscall_table", HAVE_SYSCALL_TABLE_SUPPORT),
+	FEATURE_SUPPORT("libbfd", HAVE_LIBBFD_SUPPORT),
+	FEATURE_SUPPORT("debuginfod", HAVE_DEBUGINFOD_SUPPORT),
+	FEATURE_SUPPORT("libelf", HAVE_LIBELF_SUPPORT),
+	FEATURE_SUPPORT("libnuma", HAVE_LIBNUMA_SUPPORT),
+	FEATURE_SUPPORT("numa_num_possible_cpus", HAVE_LIBNUMA_SUPPORT),
+	FEATURE_SUPPORT("libperl", HAVE_LIBPERL_SUPPORT),
+	FEATURE_SUPPORT("libpython", HAVE_LIBPYTHON_SUPPORT),
+	FEATURE_SUPPORT("libslang", HAVE_SLANG_SUPPORT),
+	FEATURE_SUPPORT("libcrypto", HAVE_LIBCRYPTO_SUPPORT),
+	FEATURE_SUPPORT("libunwind", HAVE_LIBUNWIND_SUPPORT),
+	FEATURE_SUPPORT("libdw-dwarf-unwind", HAVE_DWARF_SUPPORT),
+	FEATURE_SUPPORT("zlib", HAVE_ZLIB_SUPPORT),
+	FEATURE_SUPPORT("lzma", HAVE_LZMA_SUPPORT),
+	FEATURE_SUPPORT("get_cpuid", HAVE_AUXTRACE_SUPPORT),
+	FEATURE_SUPPORT("bpf", HAVE_LIBBPF_SUPPORT),
+	FEATURE_SUPPORT("aio", HAVE_AIO_SUPPORT),
+	FEATURE_SUPPORT("zstd", HAVE_ZSTD_SUPPORT),
+	FEATURE_SUPPORT("libpfm4", HAVE_LIBPFM),
+	FEATURE_SUPPORT("libtraceevent", HAVE_LIBTRACEEVENT),
+
+	// this should remain at end, to know the array end
+	FEATURE_SUPPORT(NULL, _)
+};
+
 void list_common_cmds_help(void);
 const char *help_unknown_cmd(const char *cmd);
 
 int cmd_annotate(int argc, const char **argv);
 int cmd_bench(int argc, const char **argv);
+int cmd_build(int argc, const char **argv);
 int cmd_buildid_cache(int argc, const char **argv);
 int cmd_buildid_list(int argc, const char **argv);
 int cmd_config(int argc, const char **argv);
diff --git a/tools/perf/perf.c b/tools/perf/perf.c
index d3fc8090413c..95a4a91b1144 100644
--- a/tools/perf/perf.c
+++ b/tools/perf/perf.c
@@ -48,6 +48,7 @@ struct cmd_struct {
 
 static struct cmd_struct commands[] = {
 	{ "archive",	NULL,	0 },
+	{ "build", cmd_build, 0 },
 	{ "buildid-cache", cmd_buildid_cache, 0 },
 	{ "buildid-list", cmd_buildid_list, 0 },
 	{ "config",	cmd_config,	0 },
-- 
2.41.0

