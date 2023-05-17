Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E090070696E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 15:15:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLtry569Mz3f85
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 23:15:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I6TCINxJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I6TCINxJ;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLtmq4RRdz3f4G
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 23:12:11 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EF48963B88;
	Wed, 17 May 2023 13:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E219C433A8;
	Wed, 17 May 2023 13:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684329129;
	bh=m4CC8jzjsL/DB4zhl/Y597jyiUuMzUYclEl5YRgzTWo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I6TCINxJI0woqSGR6ssIvaSj6epLLVO81LOzyVaPT8/vzZI9AB8IWfkQCSXQEHhXj
	 emmu7MtAnphbx6efp3NtZZlhdUPe7PobFSbrgE0GW1MxwsjqRKhXtsARowKgI7TJl1
	 M8K+xUmMlgWQeI0sMhDqBlo2KcTRfdwZaRrzSuAmdzwi2gCudljKNjdsRsUPUgknLD
	 dFngQPAXjy/SCR0E/q5jywBkSs9H4bdCiuKXgEHWHkpEKogI02+rydRudhNs/4FwF/
	 rKa/Win+V5kAOFnp1Q7tVYGNdR9eUslE6Gou6+cruOq5EcoezzwmGP3r8Tp1Dhm35i
	 hSLiw0TbCv7FA==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 04/14] audit: avoid missing-prototype warnings
Date: Wed, 17 May 2023 15:10:52 +0200
Message-Id: <20230517131102.934196-5-arnd@kernel.org>
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

Building with 'make W=1' reveals two function definitions without
a previous prototype in the audit code:

lib/compat_audit.c:32:5: error: no previous prototype for 'audit_classify_compat_syscall' [-Werror=missing-prototypes]
kernel/audit.c:1813:14: error: no previous prototype for 'audit_serial' [-Werror=missing-prototypes]

The first one needs a declaration from linux/audit.h but cannot
include that header without causing conflicting (compat) syscall number
definitions, so move the it into linux/audit_arch.h.

The second one is declared conditionally based on CONFIG_AUDITSYSCALL
but needed as a local function even when that option is disabled, so
move the declaration out of the #ifdef block.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/audit.h      | 2 --
 include/linux/audit_arch.h | 2 ++
 kernel/audit.h             | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/audit.h b/include/linux/audit.h
index 31086a72e32a..6a3a9e122bb5 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -130,8 +130,6 @@ extern unsigned compat_dir_class[];
 extern unsigned compat_chattr_class[];
 extern unsigned compat_signal_class[];
 
-extern int audit_classify_compat_syscall(int abi, unsigned syscall);
-
 /* audit_names->type values */
 #define	AUDIT_TYPE_UNKNOWN	0	/* we don't know yet */
 #define	AUDIT_TYPE_NORMAL	1	/* a "normal" audit record */
diff --git a/include/linux/audit_arch.h b/include/linux/audit_arch.h
index 8fdb1afe251a..0e34d673ef17 100644
--- a/include/linux/audit_arch.h
+++ b/include/linux/audit_arch.h
@@ -21,4 +21,6 @@ enum auditsc_class_t {
 	AUDITSC_NVALS /* count */
 };
 
+extern int audit_classify_compat_syscall(int abi, unsigned syscall);
+
 #endif
diff --git a/kernel/audit.h b/kernel/audit.h
index c57b008b9914..94738bce40b2 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -259,8 +259,8 @@ extern struct tty_struct *audit_get_tty(void);
 extern void audit_put_tty(struct tty_struct *tty);
 
 /* audit watch/mark/tree functions */
-#ifdef CONFIG_AUDITSYSCALL
 extern unsigned int audit_serial(void);
+#ifdef CONFIG_AUDITSYSCALL
 extern int auditsc_get_stamp(struct audit_context *ctx,
 			      struct timespec64 *t, unsigned int *serial);
 
-- 
2.39.2

