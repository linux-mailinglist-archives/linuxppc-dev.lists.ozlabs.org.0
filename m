Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E36517536B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 06:44:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48W8H772nnzDqJt
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 16:44:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48W7rN3QTNzDqfV
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 16:25:08 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0225OgG5049524
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 2 Mar 2020 00:25:05 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfmq9a8g6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2020 00:25:04 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Mon, 2 Mar 2020 05:25:02 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 2 Mar 2020 05:24:58 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0225Ou3s64880788
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Mar 2020 05:24:56 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D8F452051;
 Mon,  2 Mar 2020 05:24:56 +0000 (GMT)
Received: from bangoria.in.ibm.com (unknown [9.124.31.175])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 37B0952050;
 Mon,  2 Mar 2020 05:24:53 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [RFC 11/11] perf annotate: Show hazard data in tui mode
Date: Mon,  2 Mar 2020 10:53:55 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
References: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20030205-0028-0000-0000-000003DFC478
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030205-0029-0000-0000-000024A4EBF8
Message-Id: <20200302052355.36365-12-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-02_01:2020-02-28,
 2020-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=2 bulkscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 priorityscore=1501
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
 adrian.hunter@intel.com, acme@kernel.org, alexander.shishkin@linux.intel.com,
 yao.jin@linux.intel.com, mingo@redhat.com, paulus@samba.org,
 eranian@google.com, robert.richter@amd.com, namhyung@kernel.org,
 kim.phillips@amd.com, jolsa@redhat.com, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Enable perf report->annotate tui mode to show hazard information. By
default they are hidden, but user can unhide them by pressing hot key
'S'. Sample o/p:

         │    Disassembly of section .text:
         │
         │    0000000010001cf8 <compare>:
         │    compare():
         │    return NULL;
         │    }
         │
         │    static int
         │    compare(const void *p1, const void *p2)
         │    {
   33.23 │      std    r31,-8(r1)
         │       {haz_stage: LSU, haz_reason: ERAT Miss, stall_stage: LSU, stall_reason: Store, icache: L1 hit}
         │       {haz_stage: LSU, haz_reason: ERAT Miss, stall_stage: LSU, stall_reason: Store, icache: L1 hit}
         │       {haz_stage: LSU, haz_reason: Load Hit Store, stall_stage: LSU, stall_reason: -, icache: L3 hit}
         │       {haz_stage: LSU, haz_reason: ERAT Miss, stall_stage: -, stall_reason: -, icache: L1 hit}
         │       {haz_stage: LSU, haz_reason: ERAT Miss, stall_stage: LSU, stall_reason: Store, icache: L1 hit}
         │       {haz_stage: LSU, haz_reason: ERAT Miss, stall_stage: LSU, stall_reason: Store, icache: L1 hit}
    0.84 │      stdu   r1,-64(r1)
         │       {haz_stage: LSU, haz_reason: ERAT Miss, stall_stage: -, stall_reason: -, icache: L1 hit}
    0.24 │      mr     r31,r1
         │       {haz_stage: -, haz_reason: -, stall_stage: -, stall_reason: -, icache: L1 hit}
   21.18 │      std    r3,32(r31)
         │       {haz_stage: LSU, haz_reason: ERAT Miss, stall_stage: LSU, stall_reason: Store, icache: L1 hit}
         │       {haz_stage: LSU, haz_reason: ERAT Miss, stall_stage: LSU, stall_reason: Store, icache: L1 hit}
         │       {haz_stage: LSU, haz_reason: ERAT Miss, stall_stage: LSU, stall_reason: Store, icache: L1 hit}

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 tools/perf/builtin-annotate.c     |   5 ++
 tools/perf/ui/browsers/annotate.c | 124 ++++++++++++++++++++++++++----
 tools/perf/util/annotate.c        |  51 +++++++++++-
 tools/perf/util/annotate.h        |  18 ++++-
 4 files changed, 178 insertions(+), 20 deletions(-)

diff --git a/tools/perf/builtin-annotate.c b/tools/perf/builtin-annotate.c
index 78552a9428a6..a51313a6b019 100644
--- a/tools/perf/builtin-annotate.c
+++ b/tools/perf/builtin-annotate.c
@@ -472,6 +472,7 @@ static const char * const annotate_usage[] = {
 
 int cmd_annotate(int argc, const char **argv)
 {
+	bool annotate_haz = false;
 	struct perf_annotate annotate = {
 		.tool = {
 			.sample	= process_sample_event,
@@ -531,6 +532,8 @@ int cmd_annotate(int argc, const char **argv)
 		     symbol__config_symfs),
 	OPT_BOOLEAN(0, "source", &annotate.opts.annotate_src,
 		    "Interleave source code with assembly code (default)"),
+	OPT_BOOLEAN(0, "hazard", &annotate_haz,
+		    "Interleave CPU pileline hazard/stall data with assembly code"),
 	OPT_BOOLEAN(0, "asm-raw", &annotate.opts.show_asm_raw,
 		    "Display raw encoding of assembly instructions (default)"),
 	OPT_STRING('M', "disassembler-style", &annotate.opts.disassembler_style, "disassembler style",
@@ -583,6 +586,8 @@ int cmd_annotate(int argc, const char **argv)
 	if (annotate_check_args(&annotate.opts) < 0)
 		return -EINVAL;
 
+	annotate.opts.hide_haz_data = !annotate_haz;
+
 	if (symbol_conf.show_nr_samples && annotate.use_gtk) {
 		pr_err("--show-nr-samples is not available in --gtk mode at this time\n");
 		return ret;
diff --git a/tools/perf/ui/browsers/annotate.c b/tools/perf/ui/browsers/annotate.c
index 2e4db8216b3b..b04d825cee50 100644
--- a/tools/perf/ui/browsers/annotate.c
+++ b/tools/perf/ui/browsers/annotate.c
@@ -190,9 +190,15 @@ static void annotate_browser__draw_current_jump(struct ui_browser *browser)
 		return;
 	}
 
-	if (notes->options->hide_src_code) {
+	if (notes->options->hide_src_code && notes->options->hide_haz_data) {
 		from = cursor->al.idx_asm;
 		to = target->idx_asm;
+	} else if (!notes->options->hide_src_code && notes->options->hide_haz_data) {
+		from = cursor->al.idx_asm + cursor->al.idx_src + 1;
+		to = target->idx_asm + target->idx_src + 1;
+	} else if (notes->options->hide_src_code && !notes->options->hide_haz_data) {
+		from = cursor->al.idx_asm + cursor->al.idx_haz + 1;
+		to = target->idx_asm + target->idx_haz + 1;
 	} else {
 		from = (u64)cursor->al.idx;
 		to = (u64)target->idx;
@@ -293,8 +299,13 @@ static void annotate_browser__set_rb_top(struct annotate_browser *browser,
 	struct annotation_line * pos = rb_entry(nd, struct annotation_line, rb_node);
 	u32 idx = pos->idx;
 
-	if (notes->options->hide_src_code)
+	if (notes->options->hide_src_code && notes->options->hide_haz_data)
 		idx = pos->idx_asm;
+	else if (!notes->options->hide_src_code && notes->options->hide_haz_data)
+		idx = pos->idx_asm + pos->idx_src + 1;
+	else if (notes->options->hide_src_code && !notes->options->hide_haz_data)
+		idx = pos->idx_asm + pos->idx_haz + 1;
+
 	annotate_browser__set_top(browser, pos, idx);
 	browser->curr_hot = nd;
 }
@@ -348,44 +359,117 @@ static bool annotate_browser__toggle_source(struct annotate_browser *browser)
 	struct annotation *notes = browser__annotation(&browser->b);
 	struct annotation_line *al;
 	off_t offset = browser->b.index - browser->b.top_idx;
+	u32 curr_idx;
 
 	browser->b.seek(&browser->b, offset, SEEK_CUR);
 	al = list_entry(browser->b.top, struct annotation_line, node);
 
 	if (notes->options->hide_src_code) {
-		if (al->idx_asm < offset)
-			offset = al->idx;
+		if (notes->options->hide_haz_data) {
+			curr_idx = al->idx_asm + al->idx_src + 1;
+			browser->b.nr_entries = notes->nr_asm_entries +
+						notes->nr_src_entries;
+		} else {
+			curr_idx = al->idx;
+			browser->b.nr_entries = notes->nr_entries;
+		}
 
-		browser->b.nr_entries = notes->nr_entries;
 		notes->options->hide_src_code = false;
 		browser->b.seek(&browser->b, -offset, SEEK_CUR);
-		browser->b.top_idx = al->idx - offset;
-		browser->b.index = al->idx;
+		browser->b.top_idx = curr_idx - offset;
+		browser->b.index = curr_idx;
 	} else {
-		if (al->idx_asm < 0) {
+		if (al->type != AL_TYPE_ASM) {
 			ui_helpline__puts("Only available for assembly lines.");
 			browser->b.seek(&browser->b, -offset, SEEK_CUR);
 			return false;
 		}
 
-		if (al->idx_asm < offset)
-			offset = al->idx_asm;
+		if (notes->options->hide_haz_data) {
+			curr_idx = al->idx_asm;
+			browser->b.nr_entries = notes->nr_asm_entries;
+		} else {
+			curr_idx = al->idx_asm + al->idx_haz + 1;
+			browser->b.nr_entries = notes->nr_asm_entries +
+						notes->nr_haz_entries;
+		}
+
+		if (curr_idx < offset)
+			offset = curr_idx;
 
-		browser->b.nr_entries = notes->nr_asm_entries;
 		notes->options->hide_src_code = true;
 		browser->b.seek(&browser->b, -offset, SEEK_CUR);
-		browser->b.top_idx = al->idx_asm - offset;
-		browser->b.index = al->idx_asm;
+		browser->b.top_idx = curr_idx - offset;
+		browser->b.index = curr_idx;
+	}
+
+	return true;
+}
+
+static bool annotate_browser__toggle_hazard(struct annotate_browser *browser)
+{
+	struct annotation *notes = browser__annotation(&browser->b);
+	struct annotation_line *al;
+	off_t offset = browser->b.index - browser->b.top_idx;
+	u32 curr_idx;
+
+	browser->b.seek(&browser->b, offset, SEEK_CUR);
+	al = list_entry(browser->b.top, struct annotation_line, node);
+
+	if (notes->options->hide_haz_data) {
+		if (notes->options->hide_src_code) {
+			curr_idx = al->idx_asm + al->idx_haz + 1;
+			browser->b.nr_entries = notes->nr_asm_entries +
+						notes->nr_haz_entries;
+		} else {
+			curr_idx = al->idx;
+			browser->b.nr_entries = notes->nr_entries;
+		}
+
+		notes->options->hide_haz_data = false;
+		browser->b.seek(&browser->b, -offset, SEEK_CUR);
+		browser->b.top_idx = curr_idx - offset;
+		browser->b.index = curr_idx;
+	} else {
+		if (al->type != AL_TYPE_ASM) {
+			ui_helpline__puts("Only available for assembly lines.");
+			browser->b.seek(&browser->b, -offset, SEEK_CUR);
+			return false;
+		}
+
+		if (notes->options->hide_src_code) {
+			curr_idx = al->idx_asm;
+			browser->b.nr_entries = notes->nr_asm_entries;
+		} else {
+			curr_idx = al->idx_asm + al->idx_src + 1;
+			browser->b.nr_entries = notes->nr_asm_entries +
+						notes->nr_src_entries;
+		}
+
+		if (curr_idx < offset)
+			offset = curr_idx;
+
+		notes->options->hide_haz_data = true;
+		browser->b.seek(&browser->b, -offset, SEEK_CUR);
+		browser->b.top_idx = curr_idx - offset;
+		browser->b.index = curr_idx;
 	}
 
 	return true;
 }
 
-static void ui_browser__init_asm_mode(struct ui_browser *browser)
+static void ui_browser__hide_src_code(struct ui_browser *browser)
+{
+	struct annotation *notes = browser__annotation(browser);
+	ui_browser__reset_index(browser);
+	browser->nr_entries -= notes->nr_src_entries;
+}
+
+static void ui_browser__hide_haz_data(struct ui_browser *browser)
 {
 	struct annotation *notes = browser__annotation(browser);
 	ui_browser__reset_index(browser);
-	browser->nr_entries = notes->nr_asm_entries;
+	browser->nr_entries -= notes->nr_haz_entries;
 }
 
 #define SYM_TITLE_MAX_SIZE (PATH_MAX + 64)
@@ -743,6 +827,7 @@ static int annotate_browser__run(struct annotate_browser *browser,
 		"o             Toggle disassembler output/simplified view\n"
 		"O             Bump offset level (jump targets -> +call -> all -> cycle thru)\n"
 		"s             Toggle source code view\n"
+		"S             Toggle pipeline hazard/stall view\n"
 		"t             Circulate percent, total period, samples view\n"
 		"c             Show min/max cycle\n"
 		"/             Search string\n"
@@ -767,6 +852,10 @@ static int annotate_browser__run(struct annotate_browser *browser,
 			if (annotate_browser__toggle_source(browser))
 				ui_helpline__puts(help);
 			continue;
+		case 'S':
+			if (annotate_browser__toggle_hazard(browser))
+				ui_helpline__puts(help);
+			continue;
 		case 'o':
 			notes->options->use_offset = !notes->options->use_offset;
 			annotation__update_column_widths(notes);
@@ -932,7 +1021,10 @@ int symbol__tui_annotate(struct map_symbol *ms, struct evsel *evsel,
 	browser.b.width += 18; /* Percentage */
 
 	if (notes->options->hide_src_code)
-		ui_browser__init_asm_mode(&browser.b);
+		ui_browser__hide_src_code(&browser.b);
+
+	if (notes->options->hide_haz_data)
+		ui_browser__hide_haz_data(&browser.b);
 
 	ret = annotate_browser__run(&browser, evsel, hbt);
 
diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index 766934b0f36d..d782ee193345 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -66,6 +66,7 @@ struct annotation_options annotation__default_options = {
 	.annotate_src	= true,
 	.offset_level	= ANNOTATION__OFFSET_JUMP_TARGETS,
 	.percent_type	= PERCENT_PERIOD_LOCAL,
+	.hide_haz_data	= true,
 };
 
 static regex_t	 file_lineno;
@@ -1268,7 +1269,7 @@ static struct disasm_line *disasm_line__new(struct annotate_args *args)
 	struct disasm_line *dl = NULL;
 	int nr = 1;
 
-	if (perf_evsel__is_group_event(args->evsel))
+	if (args->type != AL_TYPE_HAZ && perf_evsel__is_group_event(args->evsel))
 		nr = args->evsel->core.nr_members;
 
 	dl = zalloc(disasm_line_size(nr));
@@ -1509,6 +1510,7 @@ annotation_line__print(struct annotation_line *al, struct symbol *sym, u64 start
 	} else if (max_lines && printed >= max_lines)
 		return 1;
 	else {
+		/* TODO: Hazard specific changes */
 		int width = symbol_conf.show_total_period ? 12 : 8;
 
 		if (queue)
@@ -1526,6 +1528,34 @@ annotation_line__print(struct annotation_line *al, struct symbol *sym, u64 start
 	return 0;
 }
 
+static int annotation_add_hazard_detail(struct annotation *notes, s64 offset)
+{
+	int ret;
+	struct hazard_hist *hh;
+	struct disasm_line *dl;
+	struct annotate_args args = {
+		.type = AL_TYPE_HAZ,
+		.offset = -1,
+	};
+
+	list_for_each_entry(hh, &notes->src->haz_hist[offset].list, list) {
+		ret = asprintf(&(args.line), "       {haz_stage: %s, "
+			"haz_reason: %s, stall_stage: %s, stall_reason: %s, "
+			"icache: %s}", hh->haz_stage, hh->haz_reason,
+			hh->stall_stage, hh->stall_reason, hh->icache);
+		if (ret == -1)
+			return -ENOMEM;
+
+		dl = disasm_line__new(&args);
+		free(args.line);
+		if (!dl)
+			return -ENOMEM;
+
+		annotation_line__add(&dl->al, &notes->src->source);
+	}
+	return 0;
+}
+
 /*
  * symbol__parse_objdump_line() parses objdump output (with -d --no-show-raw)
  * which looks like following
@@ -1608,6 +1638,10 @@ static int symbol__parse_objdump_line(struct symbol *sym,
 
 	annotation_line__add(&dl->al, &notes->src->source);
 
+	if (offset != -1 && notes->src->haz_hist &&
+	    !list_empty(&notes->src->haz_hist[offset].list))
+		return annotation_add_hazard_detail(notes, offset);
+
 	return 0;
 }
 
@@ -2701,6 +2735,8 @@ static void annotation__set_offsets(struct annotation *notes, s64 size)
 	notes->max_line_len = 0;
 	notes->nr_entries = 0;
 	notes->nr_asm_entries = 0;
+	notes->nr_src_entries = 0;
+	notes->nr_haz_entries = 0;
 
 	list_for_each_entry(al, &notes->src->source, node) {
 		size_t line_len = strlen(al->line);
@@ -2710,6 +2746,8 @@ static void annotation__set_offsets(struct annotation *notes, s64 size)
 		al->idx = notes->nr_entries++;
 		if (al->type == AL_TYPE_ASM) {
 			al->idx_asm = notes->nr_asm_entries++;
+			al->idx_src = notes->nr_src_entries - 1;
+			al->idx_haz = notes->nr_haz_entries - 1;
 			/*
 			 * FIXME: short term bandaid to cope with assembly
 			 * routines that comes with labels in the same column
@@ -2719,8 +2757,15 @@ static void annotation__set_offsets(struct annotation *notes, s64 size)
  			 */
 			if (al->offset < size)
 				notes->offsets[al->offset] = al;
-		} else
+		} else if (al->type == AL_TYPE_SRC) {
 			al->idx_asm = -1;
+			al->idx_src = notes->nr_src_entries++;
+			al->idx_haz = notes->nr_haz_entries - 1;
+		} else if (al->type == AL_TYPE_HAZ) {
+			al->idx_asm = -1;
+			al->idx_haz = notes->nr_haz_entries++;
+			al->idx_src = notes->nr_src_entries - 1;
+		}
 	}
 }
 
@@ -3051,6 +3096,8 @@ static void __annotation_line__write(struct annotation_line *al, struct annotati
 			printed = scnprintf(bf, sizeof(bf), "%-*s  ", notes->widths.addr, " ");
 		obj__printf(obj, bf);
 		obj__printf(obj, "%-*s", width - printed - pcnt_width - cycles_width + 1, al->line);
+	} else if (al->type == AL_TYPE_HAZ) {
+		obj__printf(obj, "%-*s", width - pcnt_width - cycles_width, al->line);
 	} else {
 		u64 addr = al->offset;
 		int color = -1;
diff --git a/tools/perf/util/annotate.h b/tools/perf/util/annotate.h
index a3803f89b8fc..3a082c13bdad 100644
--- a/tools/perf/util/annotate.h
+++ b/tools/perf/util/annotate.h
@@ -85,7 +85,8 @@ struct annotation_options {
 	     show_nr_jumps,
 	     show_minmax_cycle,
 	     show_asm_raw,
-	     annotate_src;
+	     annotate_src,
+	     hide_haz_data;
 	u8   offset_level;
 	int  min_pcnt;
 	int  max_lines;
@@ -131,8 +132,16 @@ struct annotation_data {
 enum annotation_line_type {
 	AL_TYPE_ASM = 0,
 	AL_TYPE_SRC,
+	AL_TYPE_HAZ,
 };
 
+/*
+ * @idx_asm, @idx_src and @idx_haz starts from -1 and increments in
+ * chronological order. For _all_ non-assembly lines, @idx_asm is -1.
+ * OTOH, for non-source line, @idx_src contains prev value. Similarly
+ * for non-hazard lines @idx_haz also contains prev value.
+ * And @idx = @idx_asm + (@idx_src + 1) + (@idx_haz + 1);
+ */
 struct annotation_line {
 	struct list_head	 node;
 	struct rb_node		 rb_node;
@@ -148,6 +157,8 @@ struct annotation_line {
 	char			*path;
 	u32			 idx;
 	int			 idx_asm;
+	int			 idx_src;
+	int			 idx_haz;
 	int			 data_nr;
 	struct annotation_data	 data[0];
 };
@@ -298,6 +309,8 @@ struct annotation {
 	int			max_jump_sources;
 	int			nr_entries;
 	int			nr_asm_entries;
+	int			nr_src_entries;
+	int			nr_haz_entries;
 	u16			max_line_len;
 	struct {
 		u8		addr;
@@ -326,7 +339,8 @@ static inline int annotation__pcnt_width(struct annotation *notes)
 
 static inline bool annotation_line__filter(struct annotation_line *al, struct annotation *notes)
 {
-	return notes->options->hide_src_code && al->type == AL_TYPE_SRC;
+	return ((notes->options->hide_src_code && al->type == AL_TYPE_SRC) ||
+		(notes->options->hide_haz_data && al->type == AL_TYPE_HAZ));
 }
 
 void annotation__update_column_widths(struct annotation *notes);
-- 
2.21.1

