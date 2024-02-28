Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 362F286B2AD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 16:06:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=I9KQ1qvr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlHk25xtLz3vZh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 02:06:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=I9KQ1qvr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.178; helo=out-178.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlHhW02Gmz3bsJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 02:04:58 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1709132677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tsxpfYpBZPIQGZFeeavdCAykha5uzA9p5hqzzpjOjmk=;
	b=I9KQ1qvrKDj7pHFgK7MCGSgnsUHbWq8jNpAV1xK92YuDifgAEhywTMwXQHhvT0IDoVDxCa
	2UbopFanDKNyLgiUk45LtDy6n/e1otex7TOQtwR7r3E3rt2WG3l3Z8S07ABtgQNed+e4yA
	O/XkDF1EgM7GBo0lDOeOFa0TfkWqPKE=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [kvm-unit-tests PATCH 04/13] treewide: lib/stack: Make base_address arch specific
Date: Wed, 28 Feb 2024 16:04:20 +0100
Message-ID: <20240228150416.248948-19-andrew.jones@linux.dev>
In-Reply-To: <20240228150416.248948-15-andrew.jones@linux.dev>
References: <20240228150416.248948-15-andrew.jones@linux.dev>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: lvivier@redhat.com, linux-s390@vger.kernel.org, thuth@redhat.com, nrb@linux.ibm.com, frankja@linux.ibm.com, npiggin@gmail.com, kvmarm@lists.linux.dev, pbonzini@redhat.com, imbrenda@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Calculating the offset of an address is image specific, which is
architecture specific. Until now, all architectures and architecture
configurations which select CONFIG_RELOC were able to subtract
_etext, but the EFI configuration of riscv cannot (it must subtract
ImageBase). Make this function architecture specific, since the
architecture's image layout already is.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/arm64/stack.c | 17 +++++++++++++++++
 lib/riscv/stack.c | 18 ++++++++++++++++++
 lib/stack.c       | 19 ++-----------------
 lib/stack.h       |  2 ++
 lib/x86/stack.c   | 17 +++++++++++++++++
 5 files changed, 56 insertions(+), 17 deletions(-)

diff --git a/lib/arm64/stack.c b/lib/arm64/stack.c
index f5eb57fd8892..3369031a74f7 100644
--- a/lib/arm64/stack.c
+++ b/lib/arm64/stack.c
@@ -6,6 +6,23 @@
 #include <stdbool.h>
 #include <stack.h>
 
+#ifdef CONFIG_RELOC
+extern char _text, _etext;
+
+bool base_address(const void *rebased_addr, unsigned long *addr)
+{
+	unsigned long ra = (unsigned long)rebased_addr;
+	unsigned long start = (unsigned long)&_text;
+	unsigned long end = (unsigned long)&_etext;
+
+	if (ra < start || ra >= end)
+		return false;
+
+	*addr = ra - start;
+	return true;
+}
+#endif
+
 extern char vector_stub_start, vector_stub_end;
 
 int arch_backtrace_frame(const void *frame, const void **return_addrs,
diff --git a/lib/riscv/stack.c b/lib/riscv/stack.c
index d865594b9671..a143c22a570a 100644
--- a/lib/riscv/stack.c
+++ b/lib/riscv/stack.c
@@ -2,6 +2,24 @@
 #include <libcflat.h>
 #include <stack.h>
 
+#ifdef CONFIG_RELOC
+extern char ImageBase, _text, _etext;
+
+bool base_address(const void *rebased_addr, unsigned long *addr)
+{
+	unsigned long ra = (unsigned long)rebased_addr;
+	unsigned long base = (unsigned long)&ImageBase;
+	unsigned long start = (unsigned long)&_text;
+	unsigned long end = (unsigned long)&_etext;
+
+	if (ra < start || ra >= end)
+		return false;
+
+	*addr = ra - base;
+	return true;
+}
+#endif
+
 int arch_backtrace_frame(const void *frame, const void **return_addrs,
 			 int max_depth, bool current_frame)
 {
diff --git a/lib/stack.c b/lib/stack.c
index dd6bfa8dac6e..e5099e207388 100644
--- a/lib/stack.c
+++ b/lib/stack.c
@@ -11,23 +11,8 @@
 
 #define MAX_DEPTH 20
 
-#ifdef CONFIG_RELOC
-extern char _text, _etext;
-
-static bool base_address(const void *rebased_addr, unsigned long *addr)
-{
-	unsigned long ra = (unsigned long)rebased_addr;
-	unsigned long start = (unsigned long)&_text;
-	unsigned long end = (unsigned long)&_etext;
-
-	if (ra < start || ra >= end)
-		return false;
-
-	*addr = ra - start;
-	return true;
-}
-#else
-static bool base_address(const void *rebased_addr, unsigned long *addr)
+#ifndef CONFIG_RELOC
+bool base_address(const void *rebased_addr, unsigned long *addr)
 {
 	*addr = (unsigned long)rebased_addr;
 	return true;
diff --git a/lib/stack.h b/lib/stack.h
index 6edc84344b51..f8def4ad4d49 100644
--- a/lib/stack.h
+++ b/lib/stack.h
@@ -10,6 +10,8 @@
 #include <libcflat.h>
 #include <asm/stack.h>
 
+bool base_address(const void *rebased_addr, unsigned long *addr);
+
 #ifdef HAVE_ARCH_BACKTRACE_FRAME
 extern int arch_backtrace_frame(const void *frame, const void **return_addrs,
 				int max_depth, bool current_frame);
diff --git a/lib/x86/stack.c b/lib/x86/stack.c
index 58ab6c4b293a..7ba73becbd69 100644
--- a/lib/x86/stack.c
+++ b/lib/x86/stack.c
@@ -1,6 +1,23 @@
 #include <libcflat.h>
 #include <stack.h>
 
+#ifdef CONFIG_RELOC
+extern char _text, _etext;
+
+bool base_address(const void *rebased_addr, unsigned long *addr)
+{
+	unsigned long ra = (unsigned long)rebased_addr;
+	unsigned long start = (unsigned long)&_text;
+	unsigned long end = (unsigned long)&_etext;
+
+	if (ra < start || ra >= end)
+		return false;
+
+	*addr = ra - start;
+	return true;
+}
+#endif
+
 int arch_backtrace_frame(const void *frame, const void **return_addrs,
 			 int max_depth, bool current_frame)
 {
-- 
2.43.0

