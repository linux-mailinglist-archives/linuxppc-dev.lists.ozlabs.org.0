Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE0F907E86
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 00:03:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0byY4x08z3fql
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 08:03:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=zhengyejian1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0P6j4xT1z30TX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 23:54:53 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4W0NcC6mT1zmb2t;
	Thu, 13 Jun 2024 21:31:55 +0800 (CST)
Received: from dggpeml500012.china.huawei.com (unknown [7.185.36.15])
	by mail.maildlp.com (Postfix) with ESMTPS id 761B1140258;
	Thu, 13 Jun 2024 21:36:41 +0800 (CST)
Received: from localhost.localdomain (10.67.175.61) by
 dggpeml500012.china.huawei.com (7.185.36.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 21:36:41 +0800
From: Zheng Yejian <zhengyejian1@huawei.com>
To: <rostedt@goodmis.org>, <mhiramat@kernel.org>, <mark.rutland@arm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<naveen.n.rao@linux.ibm.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <mcgrof@kernel.org>, <mathieu.desnoyers@efficios.com>,
	<masahiroy@kernel.org>, <nathan@kernel.org>, <nicolas@fjasle.eu>,
	<kees@kernel.org>, <james.clark@arm.com>, <kent.overstreet@linux.dev>,
	<yhs@fb.com>, <jpoimboe@kernel.org>, <peterz@infradead.org>
Subject: [PATCH 5/6] ftrace: Fix possible out-of-bound issue in ftrace_process_locs()
Date: Thu, 13 Jun 2024 21:37:10 +0800
Message-ID: <20240613133711.2867745-6-zhengyejian1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613133711.2867745-1-zhengyejian1@huawei.com>
References: <20240613133711.2867745-1-zhengyejian1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.175.61]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500012.china.huawei.com (7.185.36.15)
X-Mailman-Approved-At: Fri, 14 Jun 2024 08:01:41 +1000
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
Cc: zhengyejian1@huawei.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In ftrace_process_locs(), a series pages are prepared and linked in
start_pg, then fentry records are skipped or added, then unused pages
are freed.

However, assume that all records are skipped, currently the start_pg
will still be in list of ftrace_pages_start but without any record.
Then in ftrace_free_mem() index record by (pg->index - 1) will be out
of bound.

To fix this issue, properly handle with unused start_pg and add
WARN_ON_ONCE() where the records need to be indexed.

Fixes: 26efd79c4624 ("ftrace: Fix possible warning on checking all pages used in ftrace_process_locs()")
Signed-off-by: Zheng Yejian <zhengyejian1@huawei.com>
---
 kernel/trace/ftrace.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 0e8628e4d296..c46c35ac9b42 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6575,10 +6575,22 @@ static int ftrace_process_locs(struct module *mod,
 		rec->ip = addr;
 	}
 
-	if (pg->next) {
+	if (pg->index == 0) {
+		/* No record is added on the current page, so it's unused */
+		pg_unuse = pg;
+	} else if (pg->next) {
+		/* Current page has records, so it's next page is unused */
 		pg_unuse = pg->next;
 		pg->next = NULL;
 	}
+	/*
+	 * Even the start_pg hasn't been used, that means, no record has
+	 * been added, so restore state of ftrace_pages and just go out.
+	 */
+	if (pg_unuse == start_pg) {
+		ftrace_pages->next = NULL;
+		goto out;
+	}
 
 	/* Assign the last page to ftrace_pages */
 	ftrace_pages = pg;
@@ -6794,6 +6806,8 @@ void ftrace_release_mod(struct module *mod)
 	 */
 	last_pg = &ftrace_pages_start;
 	for (pg = ftrace_pages_start; pg; pg = *last_pg) {
+		/* The page should have at lease one record */
+		WARN_ON_ONCE(!pg->index);
 		rec = &pg->records[0];
 		if (within_module(rec->ip, mod)) {
 			/*
@@ -7176,6 +7190,8 @@ void ftrace_free_mem(struct module *mod, void *start_ptr, void *end_ptr)
 		mod_map = allocate_ftrace_mod_map(mod, start, end);
 
 	for (pg = ftrace_pages_start; pg; last_pg = &pg->next, pg = *last_pg) {
+		/* The page should have at lease one record */
+		WARN_ON_ONCE(!pg->index);
 		if (end < pg->records[0].ip ||
 		    start >= (pg->records[pg->index - 1].ip + MCOUNT_INSN_SIZE))
 			continue;
-- 
2.25.1

