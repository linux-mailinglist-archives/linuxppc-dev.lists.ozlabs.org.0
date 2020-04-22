Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A78631B454D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 14:43:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496g850PtNzDqNB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 22:43:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=tip-bot2@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496fy61XffzDqdc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 22:34:22 +1000 (AEST)
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tip-bot2@linutronix.de>)
 id 1jREJp-0007tb-DZ; Wed, 22 Apr 2020 14:17:33 +0200
Received: from [127.0.1.1] (localhost [IPv6:::1])
 by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id E355D1C0813;
 Wed, 22 Apr 2020 14:17:28 +0200 (CEST)
Date: Wed, 22 Apr 2020 12:17:28 -0000
From: "tip-bot2 for Jiri Olsa" <tip-bot2@linutronix.de>
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf expr: Add expr_scanner_ctx object
In-Reply-To: <20200401203340.31402-3-kjain@linux.ibm.com>
References: <20200401203340.31402-3-kjain@linux.ibm.com>
MIME-Version: 1.0
Message-ID: <158755784848.28353.17588548435578970529.tip-bot2@tip-bot2>
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot2.linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from
 these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Reply-To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Jin Yao <yao.jin@linux.intel.com>,
 Kan Liang <kan.liang@linux.intel.com>, Andi Kleen <ak@linux.intel.com>,
 x86 <x86@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>,
 Arnaldo Carvalho de Melo <acme@redhat.com>, Joe Mario <jmario@redhat.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Michael Petlan <mpetlan@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     871f9f599db8d9d2387c0717e712af405290edea
Gitweb:        https://git.kernel.org/tip/871f9f599db8d9d2387c0717e712af405290edea
Author:        Jiri Olsa <jolsa@kernel.org>
AuthorDate:    Thu, 02 Apr 2020 02:03:35 +05:30
Committer:     Arnaldo Carvalho de Melo <acme@redhat.com>
CommitterDate: Thu, 16 Apr 2020 12:19:13 -03:00

perf expr: Add expr_scanner_ctx object

Add the expr_scanner_ctx object to hold user data for the expr scanner.
Currently it holds only start_token, Kajol Jain will use it to hold 24x7
runtime param.

Signed-off-by: Jiri Olsa <jolsa@kernel.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Andi Kleen <ak@linux.intel.com>
Cc: Anju T Sudhakar <anju@linux.vnet.ibm.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jin Yao <yao.jin@linux.intel.com>
Cc: Joe Mario <jmario@redhat.com>
Cc: Kajol Jain <kjain@linux.ibm.com>
Cc: Kan Liang <kan.liang@linux.intel.com>
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Cc: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Michael Petlan <mpetlan@redhat.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Cc: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linuxppc-dev@lists.ozlabs.org
Link: http://lore.kernel.org/lkml/20200401203340.31402-3-kjain@linux.ibm.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/perf/util/expr.c |  6 ++++--
 tools/perf/util/expr.h |  4 ++++
 tools/perf/util/expr.l | 10 +++++-----
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/expr.c b/tools/perf/util/expr.c
index c8ccc54..c3382d5 100644
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
index b9e53f2..0938ad1 100644
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
index eaad292..2582c24 100644
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
