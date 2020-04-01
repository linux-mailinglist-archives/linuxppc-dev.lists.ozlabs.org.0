Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C0E19B72B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 22:41:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sylH0N6nzDqkd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 07:40:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48syc26GJ2zDqmb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 07:34:42 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031KXmbe169911
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 1 Apr 2020 16:34:39 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304r501w0g-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 16:34:39 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <kjain@linux.ibm.com>;
 Wed, 1 Apr 2020 21:34:25 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 1 Apr 2020 21:34:20 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 031KYUEd55509184
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 20:34:30 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20D44A405C;
 Wed,  1 Apr 2020 20:34:30 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9334BA4054;
 Wed,  1 Apr 2020 20:34:24 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.38.236])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 20:34:24 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 sukadev@linux.vnet.ibm.com
Subject: [PATCH v8 2/7] perf expr: Add expr_scanner_ctx object
Date: Thu,  2 Apr 2020 02:03:35 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200401203340.31402-1-kjain@linux.ibm.com>
References: <20200401203340.31402-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20040120-0008-0000-0000-00000368AB72
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040120-0009-0000-0000-00004A8A34F8
Message-Id: <20200401203340.31402-3-kjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_04:2020-03-31,
 2020-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010170
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
Cc: mark.rutland@arm.com, maddy@linux.vnet.ibm.com, peterz@infradead.org,
 yao.jin@linux.intel.com, mingo@kernel.org, kan.liang@linux.intel.com,
 ak@linux.intel.com, alexander.shishkin@linux.intel.com,
 anju@linux.vnet.ibm.com, mamatha4@linux.vnet.ibm.com,
 ravi.bangoria@linux.ibm.com, kjain@linux.ibm.com, jmario@redhat.com,
 namhyung@kernel.org, tglx@linutronix.de, mpetlan@redhat.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Jiri Olsa <jolsa@kernel.org>

Adding expr_scanner_ctx object to hold user data
for the expr scanner. Currently it holds only
start_token, Kajol Jain will use it to hold 24x7
runtime param.

Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
 tools/perf/util/expr.c |  6 ++++--
 tools/perf/util/expr.h |  4 ++++
 tools/perf/util/expr.l | 10 +++++-----
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/expr.c b/tools/perf/util/expr.c
index c8ccc548a585..c3382d58cf40 100644
--- a/tools/perf/util/expr.c
+++ b/tools/perf/util/expr.c
@@ -3,7 +3,6 @@
 #include <assert.h>
 #include "expr.h"
 #include "expr-bison.h"
-#define YY_EXTRA_TYPE int
 #include "expr-flex.h"
 
 #ifdef PARSER_DEBUG
@@ -30,11 +29,14 @@ static int
 __expr__parse(double *val, struct expr_parse_ctx *ctx, const char *expr,
 	      int start)
 {
+	struct expr_scanner_ctx scanner_ctx = {
+		.start_token = start,
+	};
 	YY_BUFFER_STATE buffer;
 	void *scanner;
 	int ret;
 
-	ret = expr_lex_init_extra(start, &scanner);
+	ret = expr_lex_init_extra(&scanner_ctx, &scanner);
 	if (ret)
 		return ret;
 
diff --git a/tools/perf/util/expr.h b/tools/perf/util/expr.h
index b9e53f2b5844..0938ad166ece 100644
--- a/tools/perf/util/expr.h
+++ b/tools/perf/util/expr.h
@@ -15,6 +15,10 @@ struct expr_parse_ctx {
 	struct expr_parse_id ids[MAX_PARSE_ID];
 };
 
+struct expr_scanner_ctx {
+	int start_token;
+};
+
 void expr__ctx_init(struct expr_parse_ctx *ctx);
 void expr__add_id(struct expr_parse_ctx *ctx, const char *id, double val);
 int expr__parse(double *final_val, struct expr_parse_ctx *ctx, const char *expr);
diff --git a/tools/perf/util/expr.l b/tools/perf/util/expr.l
index eaad29243c23..2582c2464938 100644
--- a/tools/perf/util/expr.l
+++ b/tools/perf/util/expr.l
@@ -76,13 +76,13 @@ sym		[0-9a-zA-Z_\.:@]+
 symbol		{spec}*{sym}*{spec}*{sym}*
 
 %%
-	{
-		int start_token;
+	struct expr_scanner_ctx *sctx = expr_get_extra(yyscanner);
 
-		start_token = expr_get_extra(yyscanner);
+	{
+		int start_token = sctx->start_token;
 
-		if (start_token) {
-			expr_set_extra(NULL, yyscanner);
+		if (sctx->start_token) {
+			sctx->start_token = 0;
 			return start_token;
 		}
 	}
-- 
2.21.0

