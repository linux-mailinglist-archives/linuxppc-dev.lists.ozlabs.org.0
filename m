Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A66B5175369
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 06:43:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48W8F30nljzDqSv
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 16:43:03 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48W7rM6c7wzDqfS
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 16:25:07 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0225LH3u031545
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 2 Mar 2020 00:25:05 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfnbe9y6k-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2020 00:24:59 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Mon, 2 Mar 2020 05:24:56 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 2 Mar 2020 05:24:51 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0225OnKv55705730
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Mar 2020 05:24:49 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82F325204F;
 Mon,  2 Mar 2020 05:24:49 +0000 (GMT)
Received: from bangoria.in.ibm.com (unknown [9.124.31.175])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 4EC3652051;
 Mon,  2 Mar 2020 05:24:46 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [RFC 09/11] perf annotate: Introduce type for annotation_line
Date: Mon,  2 Mar 2020 10:53:53 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
References: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20030205-0012-0000-0000-0000038C0D83
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030205-0013-0000-0000-000021C8BF07
Message-Id: <20200302052355.36365-10-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-01_09:2020-02-28,
 2020-03-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=2 adultscore=0 mlxlogscore=999
 clxscore=1015 priorityscore=1501 mlxscore=0 impostorscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

struct annotation_line can contain either assembly instruction or
a source code line. To distinguish between them we currently use
offset. If offset is -1, it's a source otherwise it's assembly.
This is bit cryptic when you first read the code. Introduce new
field 'type' that denotes type of the data the annotation_line
object contains.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 tools/perf/ui/browsers/annotate.c |  4 ++--
 tools/perf/ui/gtk/annotate.c      |  6 +++---
 tools/perf/util/annotate.c        | 27 ++++++++++++++++-----------
 tools/perf/util/annotate.h        |  8 +++++++-
 4 files changed, 28 insertions(+), 17 deletions(-)

diff --git a/tools/perf/ui/browsers/annotate.c b/tools/perf/ui/browsers/annotate.c
index 9023267e5643..2e4db8216b3b 100644
--- a/tools/perf/ui/browsers/annotate.c
+++ b/tools/perf/ui/browsers/annotate.c
@@ -317,7 +317,7 @@ static void annotate_browser__calc_percent(struct annotate_browser *browser,
 		double max_percent = 0.0;
 		int i;
 
-		if (pos->al.offset == -1) {
+		if (pos->al.type != AL_TYPE_ASM) {
 			RB_CLEAR_NODE(&pos->al.rb_node);
 			continue;
 		}
@@ -816,7 +816,7 @@ static int annotate_browser__run(struct annotate_browser *browser,
 
 			if (browser->selection == NULL)
 				ui_helpline__puts("Huh? No selection. Report to linux-kernel@vger.kernel.org");
-			else if (browser->selection->offset == -1)
+			else if (browser->selection->type != AL_TYPE_ASM)
 				ui_helpline__puts("Actions are only available for assembly lines.");
 			else if (!dl->ins.ops)
 				goto show_sup_ins;
diff --git a/tools/perf/ui/gtk/annotate.c b/tools/perf/ui/gtk/annotate.c
index 35f9641bf670..71c792a0b17d 100644
--- a/tools/perf/ui/gtk/annotate.c
+++ b/tools/perf/ui/gtk/annotate.c
@@ -35,7 +35,7 @@ static int perf_gtk__get_percent(char *buf, size_t size, struct symbol *sym,
 
 	strcpy(buf, "");
 
-	if (dl->al.offset == (s64) -1)
+	if (dl->al.type != AL_TYPE_ASM)
 		return 0;
 
 	symhist = annotation__histogram(symbol__annotation(sym), evidx);
@@ -61,7 +61,7 @@ static int perf_gtk__get_offset(char *buf, size_t size, struct map_symbol *ms,
 
 	strcpy(buf, "");
 
-	if (dl->al.offset == (s64) -1)
+	if (dl->al.type != AL_TYPE_ASM)
 		return 0;
 
 	return scnprintf(buf, size, "%"PRIx64, start + dl->al.offset);
@@ -78,7 +78,7 @@ static int perf_gtk__get_line(char *buf, size_t size, struct disasm_line *dl)
 	if (!line)
 		return 0;
 
-	if (dl->al.offset != (s64) -1)
+	if (dl->al.type == AL_TYPE_ASM)
 		markup = NULL;
 
 	if (markup)
diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index 4e2706274d85..8aef60a6ffea 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -1148,6 +1148,7 @@ struct annotate_args {
 	struct evsel		  *evsel;
 	struct annotation_options *options;
 	s64			  offset;
+	u8			  type;
 	char			  *line;
 	int			  line_nr;
 };
@@ -1156,6 +1157,7 @@ static void annotation_line__init(struct annotation_line *al,
 				  struct annotate_args *args,
 				  int nr)
 {
+	al->type = args->type;
 	al->offset = args->offset;
 	al->line = strdup(args->line);
 	al->line_nr = args->line_nr;
@@ -1202,7 +1204,7 @@ static struct disasm_line *disasm_line__new(struct annotate_args *args)
 	if (dl->al.line == NULL)
 		goto out_delete;
 
-	if (args->offset != -1) {
+	if (dl->al.type == AL_TYPE_ASM) {
 		if (disasm_line__parse(dl->al.line, &dl->ins.name, &dl->ops.raw) < 0)
 			goto out_free_line;
 
@@ -1246,7 +1248,7 @@ struct annotation_line *
 annotation_line__next(struct annotation_line *pos, struct list_head *head)
 {
 	list_for_each_entry_continue(pos, head, node)
-		if (pos->offset >= 0)
+		if (pos->type == AL_TYPE_ASM)
 			return pos;
 
 	return NULL;
@@ -1357,7 +1359,7 @@ annotation_line__print(struct annotation_line *al, struct symbol *sym, u64 start
 	static const char *prev_line;
 	static const char *prev_color;
 
-	if (al->offset != -1) {
+	if (al->type == AL_TYPE_ASM) {
 		double max_percent = 0.0;
 		int i, nr_percent = 1;
 		const char *color;
@@ -1500,6 +1502,7 @@ static int symbol__parse_objdump_line(struct symbol *sym,
 	}
 
 	args->offset  = offset;
+	args->type    = (offset != -1) ? AL_TYPE_ASM : AL_TYPE_SRC;
 	args->line    = parsed_line;
 	args->line_nr = *line_nr;
 	args->ms.sym  = sym;
@@ -1783,6 +1786,7 @@ static int symbol__disassemble_bpf(struct symbol *sym,
 		fflush(s);
 
 		if (!opts->hide_src_code && srcline) {
+			args->type = AL_TYPE_SRC;
 			args->offset = -1;
 			args->line = strdup(srcline);
 			args->line_nr = 0;
@@ -1794,6 +1798,7 @@ static int symbol__disassemble_bpf(struct symbol *sym,
 			}
 		}
 
+		args->type = AL_TYPE_ASM;
 		args->offset = pc;
 		args->line = buf + prev_buf_size;
 		args->line_nr = 0;
@@ -2099,7 +2104,7 @@ static void annotation__calc_percent(struct annotation *notes,
 		s64 end;
 		int i = 0;
 
-		if (al->offset == -1)
+		if (al->type != AL_TYPE_ASM)
 			continue;
 
 		next = annotation_line__next(al, &notes->src->source);
@@ -2309,7 +2314,7 @@ static int annotated_source__addr_fmt_width(struct list_head *lines, u64 start)
 	struct annotation_line *line;
 
 	list_for_each_entry_reverse(line, lines, node) {
-		if (line->offset != -1)
+		if (line->type == AL_TYPE_ASM)
 			return scnprintf(bf, sizeof(bf), "%" PRIx64, start + line->offset);
 	}
 
@@ -2549,7 +2554,7 @@ static size_t disasm_line__fprintf(struct disasm_line *dl, FILE *fp)
 {
 	size_t printed;
 
-	if (dl->al.offset == -1)
+	if (dl->al.type == AL_TYPE_SRC)
 		return fprintf(fp, "%s\n", dl->al.line);
 
 	printed = fprintf(fp, "%#" PRIx64 " %s", dl->al.offset, dl->ins.name);
@@ -2628,7 +2633,7 @@ static void annotation__set_offsets(struct annotation *notes, s64 size)
 		if (notes->max_line_len < line_len)
 			notes->max_line_len = line_len;
 		al->idx = notes->nr_entries++;
-		if (al->offset != -1) {
+		if (al->type == AL_TYPE_ASM) {
 			al->idx_asm = notes->nr_asm_entries++;
 			/*
 			 * FIXME: short term bandaid to cope with assembly
@@ -2659,7 +2664,7 @@ static int annotation__max_ins_name(struct annotation *notes)
 	struct annotation_line *al;
 
         list_for_each_entry(al, &notes->src->source, node) {
-		if (al->offset == -1)
+		if (al->type != AL_TYPE_ASM)
 			continue;
 
 		len = strlen(disasm_line(al)->ins.name);
@@ -2875,7 +2880,7 @@ static void __annotation_line__write(struct annotation_line *al, struct annotati
 	char bf[256];
 	int printed;
 
-	if (first_line && (al->offset == -1 || percent_max == 0.0)) {
+	if (first_line && (al->type != AL_TYPE_ASM || percent_max == 0.0)) {
 		if (notes->have_cycles) {
 			if (al->ipc == 0.0 && al->cycles == 0)
 				show_title = true;
@@ -2883,7 +2888,7 @@ static void __annotation_line__write(struct annotation_line *al, struct annotati
 			show_title = true;
 	}
 
-	if (al->offset != -1 && percent_max != 0.0) {
+	if (al->type == AL_TYPE_ASM && percent_max != 0.0) {
 		int i;
 
 		for (i = 0; i < notes->nr_events; i++) {
@@ -2964,7 +2969,7 @@ static void __annotation_line__write(struct annotation_line *al, struct annotati
 
 	if (!*al->line)
 		obj__printf(obj, "%-*s", width - pcnt_width - cycles_width, " ");
-	else if (al->offset == -1) {
+	else if (al->type == AL_TYPE_SRC) {
 		if (al->line_nr && notes->options->show_linenr)
 			printed = scnprintf(bf, sizeof(bf), "%-*d ", notes->widths.addr + 1, al->line_nr);
 		else
diff --git a/tools/perf/util/annotate.h b/tools/perf/util/annotate.h
index d9b5bb105056..89839713d242 100644
--- a/tools/perf/util/annotate.h
+++ b/tools/perf/util/annotate.h
@@ -128,9 +128,15 @@ struct annotation_data {
 	struct sym_hist_entry	 he;
 };
 
+enum annotation_line_type {
+	AL_TYPE_ASM = 0,
+	AL_TYPE_SRC,
+};
+
 struct annotation_line {
 	struct list_head	 node;
 	struct rb_node		 rb_node;
+	u8			 type;
 	s64			 offset;
 	char			*line;
 	int			 line_nr;
@@ -310,7 +316,7 @@ static inline int annotation__pcnt_width(struct annotation *notes)
 
 static inline bool annotation_line__filter(struct annotation_line *al, struct annotation *notes)
 {
-	return notes->options->hide_src_code && al->offset == -1;
+	return notes->options->hide_src_code && al->type == AL_TYPE_SRC;
 }
 
 void annotation__update_column_widths(struct annotation *notes);
-- 
2.21.1

