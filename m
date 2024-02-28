Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D69286B2A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 16:05:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jIaM/U3k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlHjF5b6yz3vZk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 02:05:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jIaM/U3k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::aa; helo=out-170.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [IPv6:2001:41d0:203:375::aa])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlHhR2nSfz3bsJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 02:04:52 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1709132671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A5w0UrDb88O9RJorQIIyDZcP2bQt2PRprTlXxIDoNBU=;
	b=jIaM/U3keRArYn8Xly5XqqUx4hLCCQqkps6f+OsZCDvsLiZVMWrQS9rF+HPyRxIrDKpsOR
	FLPRxaEBFutFpiGvDhaq0UikTaE0RYaUqizjal383PGUUOQjES9nX0VOhMT+v8ttZXskJF
	iQOnm/uioxrXh2IwZJgUa9idpYrAq74=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [kvm-unit-tests PATCH 03/13] treewide: lib/stack: Fix backtrace
Date: Wed, 28 Feb 2024 16:04:19 +0100
Message-ID: <20240228150416.248948-18-andrew.jones@linux.dev>
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

We should never pass the result of __builtin_frame_address(0) to
another function since the compiler is within its rights to pop the
frame to which it points before making the function call, as may be
done for tail calls. Nobody has complained about backtrace(), so
likely all compilations have been inlining backtrace_frame(), not
dropping the frame on the tail call, or nobody is looking at traces.
However, for riscv, when built for EFI, it does drop the frame on the
tail call, and it was noticed. Preemptively fix backtrace() for all
architectures.

Fixes: 52266791750d ("lib: backtrace printing")
Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/arm/stack.c   | 13 +++++--------
 lib/arm64/stack.c | 12 +++++-------
 lib/riscv/stack.c | 12 +++++-------
 lib/s390x/stack.c | 12 +++++-------
 lib/stack.h       | 24 +++++++++++++++++-------
 lib/x86/stack.c   | 12 +++++-------
 6 files changed, 42 insertions(+), 43 deletions(-)

diff --git a/lib/arm/stack.c b/lib/arm/stack.c
index 7d081be7c6d0..66d18b47ea53 100644
--- a/lib/arm/stack.c
+++ b/lib/arm/stack.c
@@ -8,13 +8,16 @@
 #include <libcflat.h>
 #include <stack.h>
 
-int backtrace_frame(const void *frame, const void **return_addrs,
-		    int max_depth)
+int arch_backtrace_frame(const void *frame, const void **return_addrs,
+			 int max_depth, bool current_frame)
 {
 	static int walking;
 	int depth;
 	const unsigned long *fp = (unsigned long *)frame;
 
+	if (current_frame)
+		fp = __builtin_frame_address(0);
+
 	if (walking) {
 		printf("RECURSIVE STACK WALK!!!\n");
 		return 0;
@@ -33,9 +36,3 @@ int backtrace_frame(const void *frame, const void **return_addrs,
 	walking = 0;
 	return depth;
 }
-
-int backtrace(const void **return_addrs, int max_depth)
-{
-	return backtrace_frame(__builtin_frame_address(0),
-			       return_addrs, max_depth);
-}
diff --git a/lib/arm64/stack.c b/lib/arm64/stack.c
index 82611f4b1815..f5eb57fd8892 100644
--- a/lib/arm64/stack.c
+++ b/lib/arm64/stack.c
@@ -8,7 +8,8 @@
 
 extern char vector_stub_start, vector_stub_end;
 
-int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
+int arch_backtrace_frame(const void *frame, const void **return_addrs,
+			 int max_depth, bool current_frame)
 {
 	const void *fp = frame;
 	static bool walking;
@@ -17,6 +18,9 @@ int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
 	bool is_exception = false;
 	unsigned long addr;
 
+	if (current_frame)
+		fp = __builtin_frame_address(0);
+
 	if (walking) {
 		printf("RECURSIVE STACK WALK!!!\n");
 		return 0;
@@ -54,9 +58,3 @@ int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
 	walking = false;
 	return depth;
 }
-
-int backtrace(const void **return_addrs, int max_depth)
-{
-	return backtrace_frame(__builtin_frame_address(0),
-			       return_addrs, max_depth);
-}
diff --git a/lib/riscv/stack.c b/lib/riscv/stack.c
index 712a5478d547..d865594b9671 100644
--- a/lib/riscv/stack.c
+++ b/lib/riscv/stack.c
@@ -2,12 +2,16 @@
 #include <libcflat.h>
 #include <stack.h>
 
-int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
+int arch_backtrace_frame(const void *frame, const void **return_addrs,
+			 int max_depth, bool current_frame)
 {
 	static bool walking;
 	const unsigned long *fp = (unsigned long *)frame;
 	int depth;
 
+	if (current_frame)
+		fp = __builtin_frame_address(0);
+
 	if (walking) {
 		printf("RECURSIVE STACK WALK!!!\n");
 		return 0;
@@ -24,9 +28,3 @@ int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
 	walking = false;
 	return depth;
 }
-
-int backtrace(const void **return_addrs, int max_depth)
-{
-	return backtrace_frame(__builtin_frame_address(0),
-			       return_addrs, max_depth);
-}
diff --git a/lib/s390x/stack.c b/lib/s390x/stack.c
index 9f234a12adf6..d194f654e94d 100644
--- a/lib/s390x/stack.c
+++ b/lib/s390x/stack.c
@@ -14,11 +14,15 @@
 #include <stack.h>
 #include <asm/arch_def.h>
 
-int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
+int arch_backtrace_frame(const void *frame, const void **return_addrs,
+			 int max_depth, bool current_frame)
 {
 	int depth = 0;
 	struct stack_frame *stack = (struct stack_frame *)frame;
 
+	if (current_frame)
+		stack = __builtin_frame_address(0);
+
 	for (depth = 0; stack && depth < max_depth; depth++) {
 		return_addrs[depth] = (void *)stack->grs[8];
 		stack = stack->back_chain;
@@ -28,9 +32,3 @@ int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
 
 	return depth;
 }
-
-int backtrace(const void **return_addrs, int max_depth)
-{
-	return backtrace_frame(__builtin_frame_address(0),
-			       return_addrs, max_depth);
-}
diff --git a/lib/stack.h b/lib/stack.h
index 10fc2f793354..6edc84344b51 100644
--- a/lib/stack.h
+++ b/lib/stack.h
@@ -11,17 +11,27 @@
 #include <asm/stack.h>
 
 #ifdef HAVE_ARCH_BACKTRACE_FRAME
-extern int backtrace_frame(const void *frame, const void **return_addrs,
-			   int max_depth);
+extern int arch_backtrace_frame(const void *frame, const void **return_addrs,
+				int max_depth, bool current_frame);
+
+static inline int backtrace_frame(const void *frame, const void **return_addrs,
+				  int max_depth)
+{
+	return arch_backtrace_frame(frame, return_addrs, max_depth, false);
+}
+
+static inline int backtrace(const void **return_addrs, int max_depth)
+{
+	return arch_backtrace_frame(NULL, return_addrs, max_depth, true);
+}
 #else
-static inline int
-backtrace_frame(const void *frame __unused, const void **return_addrs __unused,
-		int max_depth __unused)
+extern int backtrace(const void **return_addrs, int max_depth);
+
+static inline int backtrace_frame(const void *frame, const void **return_addrs,
+				  int max_depth)
 {
 	return 0;
 }
 #endif
 
-extern int backtrace(const void **return_addrs, int max_depth);
-
 #endif
diff --git a/lib/x86/stack.c b/lib/x86/stack.c
index 5ecd97ce90b9..58ab6c4b293a 100644
--- a/lib/x86/stack.c
+++ b/lib/x86/stack.c
@@ -1,12 +1,16 @@
 #include <libcflat.h>
 #include <stack.h>
 
-int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
+int arch_backtrace_frame(const void *frame, const void **return_addrs,
+			 int max_depth, bool current_frame)
 {
 	static int walking;
 	int depth = 0;
 	const unsigned long *bp = (unsigned long *) frame;
 
+	if (current_frame)
+		bp = __builtin_frame_address(0);
+
 	if (walking) {
 		printf("RECURSIVE STACK WALK!!!\n");
 		return 0;
@@ -23,9 +27,3 @@ int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
 	walking = 0;
 	return depth;
 }
-
-int backtrace(const void **return_addrs, int max_depth)
-{
-	return backtrace_frame(__builtin_frame_address(0), return_addrs,
-			       max_depth);
-}
-- 
2.43.0

