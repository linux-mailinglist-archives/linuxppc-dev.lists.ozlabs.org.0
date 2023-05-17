Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A02B70698B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 15:18:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLtwb6byrz3flm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 23:18:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ry4ynhpM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ry4ynhpM;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLtnQ2Gv6z3fDG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 23:12:42 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8C9236470D;
	Wed, 17 May 2023 13:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C95E2C433A7;
	Wed, 17 May 2023 13:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684329160;
	bh=d7hci1xlNwrYn7pn2ZxyBhUcLTuHLDJnwYAYODDw+K0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ry4ynhpM0kH4rjI0rh27VkbB9E0CWT+emj5Pf/VEWNSnq4ZNK/M0fPh3cd3q8xggp
	 XRmtMiQP7iAsNbqYWMSUPC8ui7Ko1plq3L731BWwuxTvktD4xwc0Fwm8+ZbdJOinpu
	 E5F+Zt68Uh0ReLFtTc+9w4Sdc36Fa6sO6d1cku2QZJFWlJnDsfIx2on9pHNO6EAyzZ
	 xeqy14d7YG5nUChEEpW0QW2tnXvHSS5RGHByFH3OOuQwyKOcT6RbH/3/530rIYIBOg
	 MWRRI0jMvTIltxR96cvRD26/c3bUU+bo0he6G/0VxA7U/gBKch6tCkyA3fkP+AS0sz
	 9DLeC9jPuwnpA==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 08/14] panic: make function declarations visible
Date: Wed, 17 May 2023 15:10:56 +0200
Message-Id: <20230517131102.934196-9-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517131102.934196-1-arnd@kernel.org>
References: <20230517131102.934196-1-arnd@kernel.org>
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
Cc: linux-kselftest@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Pavel Machek <pavel@ucw.cz>, Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Paul Moore <paul@paul-moore.com>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Dennis Zhou <dennis@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Waiman Long <longman@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Paris <eparis
 @redhat.com>, audit@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Tejun Heo <tj@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

A few panic() related functions have a global definition but
not declaration, which causes a warning with W=1:

kernel/panic.c:710:6: error: no previous prototype for '__warn_printk' [-Werror=missing-prototypes]
kernel/panic.c:756:24: error: no previous prototype for '__stack_chk_fail' [-Werror=missing-prototypes]
kernel/exit.c:1917:32: error: no previous prototype for 'abort' [-Werror=missing-prototypes]

__warn_printk() is called both as a global function when CONFIG_BUG
is enabled, and as a local function in other configs. The other
two here are called indirectly from generated or assembler code.

Add prototypes for all of these.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/asm-generic/bug.h | 5 +++--
 include/linux/panic.h     | 3 +++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/bug.h b/include/asm-generic/bug.h
index 4050b191e1a9..6e794420bd39 100644
--- a/include/asm-generic/bug.h
+++ b/include/asm-generic/bug.h
@@ -87,10 +87,12 @@ struct bug_entry {
  *
  * Use the versions with printk format strings to provide better diagnostics.
  */
-#ifndef __WARN_FLAGS
 extern __printf(4, 5)
 void warn_slowpath_fmt(const char *file, const int line, unsigned taint,
 		       const char *fmt, ...);
+extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
+
+#ifndef __WARN_FLAGS
 #define __WARN()		__WARN_printf(TAINT_WARN, NULL)
 #define __WARN_printf(taint, arg...) do {				\
 		instrumentation_begin();				\
@@ -98,7 +100,6 @@ void warn_slowpath_fmt(const char *file, const int line, unsigned taint,
 		instrumentation_end();					\
 	} while (0)
 #else
-extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
 #define __WARN()		__WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
 #define __WARN_printf(taint, arg...) do {				\
 		instrumentation_begin();				\
diff --git a/include/linux/panic.h b/include/linux/panic.h
index 979b776e3bcb..6717b15e798c 100644
--- a/include/linux/panic.h
+++ b/include/linux/panic.h
@@ -32,6 +32,9 @@ extern int sysctl_panic_on_stackoverflow;
 
 extern bool crash_kexec_post_notifiers;
 
+extern void __stack_chk_fail(void);
+void abort(void);
+
 /*
  * panic_cpu is used for synchronizing panic() and crash_kexec() execution. It
  * holds a CPU number which is executing panic() currently. A value of
-- 
2.39.2

