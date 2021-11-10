Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F96844CA9E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 21:27:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqGcM363Zz3dct
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 07:27:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=valentin.schneider@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4HqGZ61Rp1z2ywZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 07:25:33 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78FE01474;
 Wed, 10 Nov 2021 12:25:32 -0800 (PST)
Received: from e113632-lin.cambridge.arm.com (e113632-lin.cambridge.arm.com
 [10.1.196.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B4283F5A1;
 Wed, 10 Nov 2021 12:25:30 -0800 (PST)
From: Valentin Schneider <valentin.schneider@arm.com>
To: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Subject: [PATCH v2 4/5] kscan: Use preemption model accessors
Date: Wed, 10 Nov 2021 20:24:47 +0000
Message-Id: <20211110202448.4054153-5-valentin.schneider@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211110202448.4054153-1-valentin.schneider@arm.com>
References: <20211110202448.4054153-1-valentin.schneider@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Marco Elver <elver@google.com>, Michal Marek <michal.lkml@markovi.net>,
 Peter Zijlstra <peterz@infradead.org>,
 Frederic Weisbecker <frederic@kernel.org>, Mike Galbraith <efault@gmx.de>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Steven Rostedt <rostedt@goodmis.org>, Paul Mackerras <paulus@samba.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Per PREEMPT_DYNAMIC, checking CONFIG_PREEMPT doesn't tell you the actual
preemption model of the live kernel. Use the newly-introduced accessors
instead.

Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
---
 kernel/kcsan/kcsan_test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/kcsan/kcsan_test.c b/kernel/kcsan/kcsan_test.c
index dc55fd5a36fc..14d811eb9a21 100644
--- a/kernel/kcsan/kcsan_test.c
+++ b/kernel/kcsan/kcsan_test.c
@@ -1005,13 +1005,13 @@ static const void *nthreads_gen_params(const void *prev, char *desc)
 	else
 		nthreads *= 2;
 
-	if (!IS_ENABLED(CONFIG_PREEMPT) || !IS_ENABLED(CONFIG_KCSAN_INTERRUPT_WATCHER)) {
+	if (!is_preempt_full() || !IS_ENABLED(CONFIG_KCSAN_INTERRUPT_WATCHER)) {
 		/*
 		 * Without any preemption, keep 2 CPUs free for other tasks, one
 		 * of which is the main test case function checking for
 		 * completion or failure.
 		 */
-		const long min_unused_cpus = IS_ENABLED(CONFIG_PREEMPT_NONE) ? 2 : 0;
+		const long min_unused_cpus = is_preempt_none() ? 2 : 0;
 		const long min_required_cpus = 2 + min_unused_cpus;
 
 		if (num_online_cpus() < min_required_cpus) {
-- 
2.25.1

