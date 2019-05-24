Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 249C629659
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 12:52:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 459NVc4yfSzDqVH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 20:52:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anju@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 459NTK0zJlzDqJ1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 20:51:15 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4OAmaKw021899
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 06:51:13 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2spdy6urue-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 06:51:13 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <anju@linux.vnet.ibm.com>;
 Fri, 24 May 2019 11:51:11 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 24 May 2019 11:51:10 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4OAp9hq23330824
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 May 2019 10:51:09 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1408A405F;
 Fri, 24 May 2019 10:51:08 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF25DA4064;
 Fri, 24 May 2019 10:51:07 +0000 (GMT)
Received: from localhost.in.ibm.com (unknown [9.124.35.72])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 24 May 2019 10:51:07 +0000 (GMT)
From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 1/2] tools/perf: Add arch neutral function to choose event for
 perf kvm record
Date: Fri, 24 May 2019 16:21:06 +0530
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19052410-0012-0000-0000-0000031EF871
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052410-0013-0000-0000-00002157B52B
Message-Id: <20190524105107.324-1-anju@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-24_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905240074
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
Cc: anju@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, maddy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

'perf kvm record' uses 'cycles'(if the user did not specify any event) as
the default event to profile the guest.
This will not provide any proper samples from the guest incase of
powerpc architecture, since in powerpc the PMUs are controlled by
the guest rather than the host.

Patch adds a function to pick an arch specific event for 'perf kvm record',
instead of selecting 'cycles' as a default event for all architectures.

For powerpc this function checks for any user specified event, and if there
isn't any it returns invalid instead of proceeding with 'cycles' event.

Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
---
 tools/perf/arch/powerpc/util/kvm-stat.c | 37 +++++++++++++++++++++++++
 tools/perf/builtin-kvm.c                | 12 +++++++-
 tools/perf/util/kvm-stat.h              |  2 +-
 3 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/tools/perf/arch/powerpc/util/kvm-stat.c b/tools/perf/arch/powerpc/util/kvm-stat.c
index f9db341c47b6..66f8fe500945 100644
--- a/tools/perf/arch/powerpc/util/kvm-stat.c
+++ b/tools/perf/arch/powerpc/util/kvm-stat.c
@@ -8,6 +8,7 @@
 
 #include "book3s_hv_exits.h"
 #include "book3s_hcalls.h"
+#include <subcmd/parse-options.h>
 
 #define NR_TPS 4
 
@@ -172,3 +173,39 @@ int cpu_isa_init(struct perf_kvm_stat *kvm, const char *cpuid __maybe_unused)
 
 	return ret;
 }
+
+/*
+ * Incase of powerpc architecture, pmu registers are programmable
+ * by guest kernel. So monitoring guest via host may not provide
+ * valid samples. It is better to fail the "perf kvm record"
+ * with default "cycles" event to monitor guest in powerpc.
+ *
+ * Function to parse the arguments and return appropriate values.
+ */
+int kvm_add_default_arch_event(int *argc, const char **argv)
+{
+	const char **tmp;
+	bool event = false;
+	int i, j = *argc;
+
+	const struct option event_options[] = {
+		OPT_BOOLEAN('e', "event", &event, NULL),
+		OPT_END()
+	};
+
+	tmp = calloc(j + 1, sizeof(char *));
+	if (!tmp)
+		return -EINVAL;
+
+	for (i = 0; i < j; i++)
+		tmp[i] = argv[i];
+
+	parse_options(j, tmp, event_options, NULL, 0);
+	if (!event) {
+		free(tmp);
+		return -EINVAL;
+	}
+
+	free(tmp);
+	return 0;
+}
diff --git a/tools/perf/builtin-kvm.c b/tools/perf/builtin-kvm.c
index dbb6f737a3e2..fe33b3ec55c9 100644
--- a/tools/perf/builtin-kvm.c
+++ b/tools/perf/builtin-kvm.c
@@ -1510,11 +1510,21 @@ static int kvm_cmd_stat(const char *file_name, int argc, const char **argv)
 }
 #endif /* HAVE_KVM_STAT_SUPPORT */
 
+int __weak kvm_add_default_arch_event(int *argc __maybe_unused,
+					const char **argv __maybe_unused)
+{
+	return 0;
+}
+
 static int __cmd_record(const char *file_name, int argc, const char **argv)
 {
-	int rec_argc, i = 0, j;
+	int rec_argc, i = 0, j, ret;
 	const char **rec_argv;
 
+	ret = kvm_add_default_arch_event(&argc, argv);
+	if (ret)
+		return -EINVAL;
+
 	rec_argc = argc + 2;
 	rec_argv = calloc(rec_argc + 1, sizeof(char *));
 	rec_argv[i++] = strdup("record");
diff --git a/tools/perf/util/kvm-stat.h b/tools/perf/util/kvm-stat.h
index 1403dec189b4..da38b56c46cb 100644
--- a/tools/perf/util/kvm-stat.h
+++ b/tools/perf/util/kvm-stat.h
@@ -144,5 +144,5 @@ extern const int decode_str_len;
 extern const char *kvm_exit_reason;
 extern const char *kvm_entry_trace;
 extern const char *kvm_exit_trace;
-
+extern int kvm_add_default_arch_event(int *argc, const char **argv);
 #endif /* __PERF_KVM_STAT_H */
-- 
2.17.2

