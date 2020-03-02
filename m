Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABDC17536C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 06:46:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48W8K84XWCzDqYL
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 16:46:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48W7rN35y7zDqWS
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 16:25:08 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0225P5ci157190
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 2 Mar 2020 00:25:05 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfm50uj8v-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2020 00:25:05 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Mon, 2 Mar 2020 05:24:43 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 2 Mar 2020 05:24:36 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0225OZ6D65798146
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Mar 2020 05:24:35 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A8AC52050;
 Mon,  2 Mar 2020 05:24:35 +0000 (GMT)
Received: from bangoria.in.ibm.com (unknown [9.124.31.175])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id E85DD5204E;
 Mon,  2 Mar 2020 05:24:31 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [RFC 05/11] perf tools: Enable record and script to record and show
 hazard data
Date: Mon,  2 Mar 2020 10:53:49 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
References: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20030205-0020-0000-0000-000003AF5D27
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030205-0021-0000-0000-000022078662
Message-Id: <20200302052355.36365-6-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-02_01:2020-02-28,
 2020-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003020039
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
Cc: mark.rutland@arm.com, ravi.bangoria@linux.ibm.com, ak@linux.intel.com,
 maddy@linux.ibm.com, peterz@infradead.org, alexey.budankov@linux.intel.com,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, adrian.hunter@intel.com,
 acme@kernel.org, alexander.shishkin@linux.intel.com, yao.jin@linux.intel.com,
 mingo@redhat.com, paulus@samba.org, eranian@google.com, robert.richter@amd.com,
 namhyung@kernel.org, kim.phillips@amd.com, jolsa@redhat.com,
 kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>

Introduce new perf record option "--hazard" to capture cpu pipeline
hazard data. Also enable perf script -D to dump raw values of it.
Sample o/p:

  $ ./perf record -e r4010e --hazard -- ls
  $ ./perf script -D
  ... PERF_RECORD_SAMPLE(IP, 0x2): ...
  hazard information:
  Inst Type 0x1
  Inst Cache 0x1
  Hazard Stage 0x4
  Hazard Reason 0x3
  Stall Stage 0x4
  Stall Reason 0x2

Signed-off-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 tools/perf/Documentation/perf-record.txt  |  3 +++
 tools/perf/builtin-record.c               |  1 +
 tools/perf/util/event.h                   |  1 +
 tools/perf/util/evsel.c                   | 10 ++++++++++
 tools/perf/util/perf_event_attr_fprintf.c |  1 +
 tools/perf/util/record.h                  |  1 +
 tools/perf/util/session.c                 | 16 ++++++++++++++++
 7 files changed, 33 insertions(+)

diff --git a/tools/perf/Documentation/perf-record.txt b/tools/perf/Documentation/perf-record.txt
index b23a4012a606..e7bd1b6938ce 100644
--- a/tools/perf/Documentation/perf-record.txt
+++ b/tools/perf/Documentation/perf-record.txt
@@ -283,6 +283,9 @@ OPTIONS
 --phys-data::
 	Record the sample physical addresses.
 
+--hazard::
+	Record processor pipeline hazard and stall information.
+
 -T::
 --timestamp::
 	Record the sample timestamps. Use it with 'perf report -D' to see the
diff --git a/tools/perf/builtin-record.c b/tools/perf/builtin-record.c
index 4c301466101b..6bd32d7bc4e9 100644
--- a/tools/perf/builtin-record.c
+++ b/tools/perf/builtin-record.c
@@ -2301,6 +2301,7 @@ static struct option __record_options[] = {
 	OPT_BOOLEAN('s', "stat", &record.opts.inherit_stat,
 		    "per thread counts"),
 	OPT_BOOLEAN('d', "data", &record.opts.sample_address, "Record the sample addresses"),
+	OPT_BOOLEAN(0, "hazard", &record.opts.hazard, "Record processor pipeline hazard and stall information"),
 	OPT_BOOLEAN(0, "phys-data", &record.opts.sample_phys_addr,
 		    "Record the sample physical addresses"),
 	OPT_BOOLEAN(0, "sample-cpu", &record.opts.sample_cpu, "Record the sample cpu"),
diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
index 85223159737c..ff0f03253a95 100644
--- a/tools/perf/util/event.h
+++ b/tools/perf/util/event.h
@@ -148,6 +148,7 @@ struct perf_sample {
 	struct stack_dump user_stack;
 	struct sample_read read;
 	struct aux_sample aux_sample;
+	struct perf_pipeline_haz_data *pipeline_haz;
 };
 
 #define PERF_MEM_DATA_SRC_NONE \
diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index c8dc4450884c..e37ed7929c2c 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -1080,6 +1080,9 @@ void perf_evsel__config(struct evsel *evsel, struct record_opts *opts,
 	if (opts->sample_phys_addr)
 		perf_evsel__set_sample_bit(evsel, PHYS_ADDR);
 
+	if (opts->hazard)
+		perf_evsel__set_sample_bit(evsel, PIPELINE_HAZ);
+
 	if (opts->no_buffering) {
 		attr->watermark = 0;
 		attr->wakeup_events = 1;
@@ -2265,6 +2268,13 @@ int perf_evsel__parse_sample(struct evsel *evsel, union perf_event *event,
 		array = (void *)array + sz;
 	}
 
+	if (type & PERF_SAMPLE_PIPELINE_HAZ) {
+		sz = sizeof(struct perf_pipeline_haz_data);
+		OVERFLOW_CHECK(array, sz, max_size);
+		data->pipeline_haz = (struct perf_pipeline_haz_data *)array;
+		array = (void *)array + sz;
+	}
+
 	return 0;
 }
 
diff --git a/tools/perf/util/perf_event_attr_fprintf.c b/tools/perf/util/perf_event_attr_fprintf.c
index 651203126c71..d97e755c886b 100644
--- a/tools/perf/util/perf_event_attr_fprintf.c
+++ b/tools/perf/util/perf_event_attr_fprintf.c
@@ -35,6 +35,7 @@ static void __p_sample_type(char *buf, size_t size, u64 value)
 		bit_name(BRANCH_STACK), bit_name(REGS_USER), bit_name(STACK_USER),
 		bit_name(IDENTIFIER), bit_name(REGS_INTR), bit_name(DATA_SRC),
 		bit_name(WEIGHT), bit_name(PHYS_ADDR), bit_name(AUX),
+		bit_name(PIPELINE_HAZ),
 		{ .name = NULL, }
 	};
 #undef bit_name
diff --git a/tools/perf/util/record.h b/tools/perf/util/record.h
index 5421fd2ad383..f1678a0bc8ce 100644
--- a/tools/perf/util/record.h
+++ b/tools/perf/util/record.h
@@ -67,6 +67,7 @@ struct record_opts {
 	int	      affinity;
 	int	      mmap_flush;
 	unsigned int  comp_level;
+	bool	      hazard;
 };
 
 extern const char * const *record_usage;
diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
index d0d7d25b23e3..834ca7df2349 100644
--- a/tools/perf/util/session.c
+++ b/tools/perf/util/session.c
@@ -1153,6 +1153,19 @@ static void stack_user__printf(struct stack_dump *dump)
 	       dump->size, dump->offset);
 }
 
+static void pipeline_hazard__printf(struct perf_sample *sample)
+{
+	struct perf_pipeline_haz_data *haz = sample->pipeline_haz;
+
+	printf("... hazard information:\n");
+	printf(".... Inst Type 0x%" PRIx32 "\n", haz->itype);
+	printf(".... Inst Cache 0x%" PRIx32 "\n", haz->icache);
+	printf(".... Hazard Stage 0x%" PRIx32 "\n", haz->hazard_stage);
+	printf(".... Hazard Reason 0x%" PRIx32 "\n", haz->hazard_reason);
+	printf(".... Stall Stage 0x%" PRIx32 "\n", haz->stall_stage);
+	printf(".... Stall Reason 0x%" PRIx32 "\n", haz->stall_reason);
+}
+
 static void perf_evlist__print_tstamp(struct evlist *evlist,
 				       union perf_event *event,
 				       struct perf_sample *sample)
@@ -1251,6 +1264,9 @@ static void dump_sample(struct evsel *evsel, union perf_event *event,
 	if (sample_type & PERF_SAMPLE_STACK_USER)
 		stack_user__printf(&sample->user_stack);
 
+	if (sample_type & PERF_SAMPLE_PIPELINE_HAZ)
+		pipeline_hazard__printf(sample);
+
 	if (sample_type & PERF_SAMPLE_WEIGHT)
 		printf("... weight: %" PRIu64 "\n", sample->weight);
 
-- 
2.21.1

