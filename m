Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72757344860
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 15:58:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3yLZ31SBz302s
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 01:58:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XOPRf902;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XOPRf902; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3yKg5Xnnz2y6F
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 01:57:59 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12MEYmqD089743; Mon, 22 Mar 2021 10:57:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=zUIUWjxwKAmhfwp0C87yjnpPih0I2lwe3bq6OeTiBU4=;
 b=XOPRf902/fHJ9DTeE00Jzv3FFSVk8WucDXoI4CqWQgGpSIJM6ZlqwVY7Ukwd4BL1QKhH
 S1o8UVfpnkg1wvNF4RmQV0L2ItDfH0gGLg4DgDfP9kPYsrd4e8l663dXgeDqpkbeFKLp
 RV2FVVfxF+G6ngOVP4/n3GkgvwU5liRuL76J0GxCe0TEyfvGkQiOTbxaLF3EpAkjtdTd
 I2DvciUWF38v2L2xaZTocmBw/zHAHwEY2p/wJWceKGOH0DxEbo1NJVIJLhCdbB53Wvhi
 s5rf+xXoRb+/5SqoTKBhEp18dbMORmrqqLboUav2BX+DVZrWWJGcv/Dw0cMkl0DwLGsE zg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37dx4a3q0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 10:57:44 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12MEhlnq013515;
 Mon, 22 Mar 2021 14:57:42 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 37d99raf0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 14:57:42 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12MEvdSZ36045122
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Mar 2021 14:57:39 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F7B14C040;
 Mon, 22 Mar 2021 14:57:39 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB1224C04E;
 Mon, 22 Mar 2021 14:57:36 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.124.209.79])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 22 Mar 2021 14:57:36 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, mpe@ellerman.id.au, acme@kernel.org,
 jolsa@kernel.org
Subject: [PATCH V2 2/5] tools/perf: Add dynamic headers for perf report columns
Date: Mon, 22 Mar 2021 10:57:24 -0400
Message-Id: <1616425047-1666-3-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1616425047-1666-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1616425047-1666-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-22_07:2021-03-22,
 2021-03-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103220107
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
Cc: kan.liang@linux.intel.com, ravi.bangoria@linux.ibm.com,
 peterz@infradead.org, maddy@linux.ibm.com, kjain@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently the header string for different columns in perf report
is fixed. Some fields of perf sample could have different meaning
for different architectures than the meaning conveyed by the header
string. An example is the new field 'var2_w' of perf_sample_weight
structure. This is presently captured as 'Local INSTR Latency' in
perf mem report. But this could be used to denote a different latency
cycle in another architecture.

Introduce a weak function arch_perf_header_entry() to set
the arch specific header string for the fields which can contain dynamic
header. If the architecture do not have this function, fall back to the
default header string value.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/util/event.h |  1 +
 tools/perf/util/sort.c  | 19 ++++++++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
index f603edbbbc6f..6106a9c134c9 100644
--- a/tools/perf/util/event.h
+++ b/tools/perf/util/event.h
@@ -427,5 +427,6 @@ void  cpu_map_data__synthesize(struct perf_record_cpu_map_data *data, struct per
 
 void arch_perf_parse_sample_weight(struct perf_sample *data, const __u64 *array, u64 type);
 void arch_perf_synthesize_sample_weight(const struct perf_sample *data, __u64 *array, u64 type);
+const char *arch_perf_header_entry(const char *se_header);
 
 #endif /* __PERF_RECORD_H */
diff --git a/tools/perf/util/sort.c b/tools/perf/util/sort.c
index 552b590485bf..eeb03e749181 100644
--- a/tools/perf/util/sort.c
+++ b/tools/perf/util/sort.c
@@ -25,6 +25,7 @@
 #include <traceevent/event-parse.h>
 #include "mem-events.h"
 #include "annotate.h"
+#include "event.h"
 #include "time-utils.h"
 #include "cgroup.h"
 #include "machine.h"
@@ -45,6 +46,7 @@
 regex_t		ignore_callees_regex;
 int		have_ignore_callees = 0;
 enum sort_mode	sort__mode = SORT_MODE__NORMAL;
+const char	*dynamic_headers[] = {"local_ins_lat"};
 
 /*
  * Replaces all occurrences of a char used with the:
@@ -1816,6 +1818,16 @@ struct sort_dimension {
 	int			taken;
 };
 
+const char * __weak arch_perf_header_entry(const char *se_header)
+{
+	return se_header;
+}
+
+static void sort_dimension_add_dynamic_header(struct sort_dimension *sd)
+{
+	sd->entry->se_header = arch_perf_header_entry(sd->entry->se_header);
+}
+
 #define DIM(d, n, func) [d] = { .name = n, .entry = &(func) }
 
 static struct sort_dimension common_sort_dimensions[] = {
@@ -2739,7 +2751,7 @@ int sort_dimension__add(struct perf_hpp_list *list, const char *tok,
 			struct evlist *evlist,
 			int level)
 {
-	unsigned int i;
+	unsigned int i, j;
 
 	for (i = 0; i < ARRAY_SIZE(common_sort_dimensions); i++) {
 		struct sort_dimension *sd = &common_sort_dimensions[i];
@@ -2747,6 +2759,11 @@ int sort_dimension__add(struct perf_hpp_list *list, const char *tok,
 		if (strncasecmp(tok, sd->name, strlen(tok)))
 			continue;
 
+		for (j = 0; j < ARRAY_SIZE(dynamic_headers); j++) {
+			if (!strcmp(dynamic_headers[j], sd->name))
+				sort_dimension_add_dynamic_header(sd);
+		}
+
 		if (sd->entry == &sort_parent) {
 			int ret = regcomp(&parent_regex, parent_pattern, REG_EXTENDED);
 			if (ret) {
-- 
1.8.3.1

