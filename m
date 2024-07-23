Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F10C5939C0B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 09:57:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSqHN5xhrz3dDJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 17:57:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huaweicloud.com (client-ip=45.249.212.51; helo=dggsgout11.his.huawei.com; envelope-from=zhengyejian@huaweicloud.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1048 seconds by postgrey-1.37 at boromir; Tue, 23 Jul 2024 16:49:38 AEST
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSnnZ1Pwxz3cXd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 16:49:34 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WSnP544b7z4f3jkV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 14:31:53 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id CF04C1A0D93
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 14:32:01 +0800 (CST)
Received: from localhost.localdomain (unknown [10.67.175.61])
	by APP2 (Coremail) with SMTP id Syh0CgA34wpOTp9mjImuAw--.48686S6;
	Tue, 23 Jul 2024 14:32:01 +0800 (CST)
From: Zheng Yejian <zhengyejian@huaweicloud.com>
To: masahiroy@kernel.org,
	peterz@infradead.org,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	naveen.n.rao@linux.ibm.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	mcgrof@kernel.org,
	mathieu.desnoyers@efficios.com,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	ojeda@kernel.org,
	akpm@linux-foundation.org,
	surenb@google.com,
	pasha.tatashin@soleen.com,
	kent.overstreet@linux.dev,
	james.clark@arm.com,
	jpoimboe@kernel.org
Subject: [PATCH v2 4/5] ftrace: Fix possible out-of-bound issue in ftrace_process_locs()
Date: Tue, 23 Jul 2024 14:32:57 +0800
Message-Id: <20240723063258.2240610-5-zhengyejian@huaweicloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240723063258.2240610-1-zhengyejian@huaweicloud.com>
References: <20240723063258.2240610-1-zhengyejian@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Syh0CgA34wpOTp9mjImuAw--.48686S6
X-Coremail-Antispam: 1UD129KBjvJXoW7urykXF47Aw15uF47WrWfXwb_yoW8tFWDpF
	W5Kan3tr4DJa9I9anIga1kWFyfJ3yrG3y8Ga13G3s3Awn3Gr409r12vrnxZr9xJr95trW2
	kF4jvrsxGFWxXrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmS14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr1j6r
	xdM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
	IY04v7MxkF7I0En4kS14v26rWY6Fy7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBI
	daVFxhVjvjDU0xZFpf9x0pR4E__UUUUU=
X-CM-SenderInfo: x2kh0w51hmxt3q6k3tpzhluzxrxghudrp/
X-Mailman-Approved-At: Tue, 23 Jul 2024 17:56:45 +1000
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
Cc: zhengyejian@huaweicloud.com, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
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
Signed-off-by: Zheng Yejian <zhengyejian@huaweicloud.com>
---
 kernel/trace/ftrace.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index fff5d3466c41..6947be8801d9 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -7087,10 +7087,22 @@ static int ftrace_process_locs(struct module *mod,
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
@@ -7306,6 +7318,8 @@ void ftrace_release_mod(struct module *mod)
 	 */
 	last_pg = &ftrace_pages_start;
 	for (pg = ftrace_pages_start; pg; pg = *last_pg) {
+		/* The page should have at lease one record */
+		WARN_ON_ONCE(!pg->index);
 		rec = &pg->records[0];
 		if (within_module(rec->ip, mod)) {
 			/*
@@ -7685,6 +7699,8 @@ void ftrace_free_mem(struct module *mod, void *start_ptr, void *end_ptr)
 		mod_map = allocate_ftrace_mod_map(mod, start, end);
 
 	for (pg = ftrace_pages_start; pg; last_pg = &pg->next, pg = *last_pg) {
+		/* The page should have at lease one record */
+		WARN_ON_ONCE(!pg->index);
 		if (end < pg->records[0].ip ||
 		    start >= (pg->records[pg->index - 1].ip + MCOUNT_INSN_SIZE))
 			continue;
-- 
2.25.1

