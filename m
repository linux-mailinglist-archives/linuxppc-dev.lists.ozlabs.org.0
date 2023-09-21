Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5657AA59C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 01:25:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Fd1Cb/NB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsBN90v5xz3ccK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 09:25:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Fd1Cb/NB;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsBMG6b3yz3c2k
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 09:24:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1695338697;
	bh=VoF4uRzaSr8w0JBh2rKYRjrXNhC07lhe6aFDqvXGhlY=;
	h=From:To:Cc:Subject:Date:From;
	b=Fd1Cb/NBStWhfP2RAADceD6EGVt3g3PGwSLOM1JZN6YQdXOG1ggvjZNNoJZY9YXSN
	 CEXO6EBKlwL+A3R0hi9iOFWw2Xyrfj3f5f+gcGoEfa2V+XVYyE+RkPBLi44zRh6SYS
	 3LP9GXtByYOgYJmqzlszLNiEKteJyiXGvRQinIcw3vO1ma65EbyZYTuPMCr49Zc1UE
	 IsY1DVxvMOMzQNdpxOhOiJ3+5qN0Nqy25mxLwCqOfHLfTxuvRVBuC2Jvo/x5HLBA3W
	 kWsyBgGjXs+oA/KFlt6TAapgjRZ4+z16JL2HUxxx0PbSouGPQ60SEP3g9WbzJ6iVGv
	 In76krxXQyNlg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RsBMF2KJQz4x3H;
	Fri, 22 Sep 2023 09:24:57 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/stacktrace: Fix arch_stack_walk_reliable()
Date: Fri, 22 Sep 2023 09:24:41 +1000
Message-ID: <20230921232441.1181843-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
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
Cc: pmladek@suse.com, joe.lawrence@redhat.com, npiggin@gmail.com, live-patching@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The changes to copy_thread() made in commit eed7c420aac7 ("powerpc:
copy_thread differentiate kthreads and user mode threads") inadvertently
broke arch_stack_walk_reliable() because it has knowledge of the stack
layout.

Fix it by changing the condition to match the new logic in
copy_thread(). The changes make the comments about the stack layout
incorrect, rather than rephrasing them just refer the reader to
copy_thread().

Also the comment about the stack backchain is no longer true, since
commit edbd0387f324 ("powerpc: copy_thread add a back chain to the
switch stack frame"), so remove that as well.

Reported-by: Joe Lawrence <joe.lawrence@redhat.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Fixes: eed7c420aac7 ("powerpc: copy_thread differentiate kthreads and user mode threads")
---
 arch/powerpc/kernel/stacktrace.c | 27 +++++----------------------
 1 file changed, 5 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
index b15f15dcacb5..e6a958a5da27 100644
--- a/arch/powerpc/kernel/stacktrace.c
+++ b/arch/powerpc/kernel/stacktrace.c
@@ -73,29 +73,12 @@ int __no_sanitize_address arch_stack_walk_reliable(stack_trace_consume_fn consum
 	bool firstframe;
 
 	stack_end = stack_page + THREAD_SIZE;
-	if (!is_idle_task(task)) {
-		/*
-		 * For user tasks, this is the SP value loaded on
-		 * kernel entry, see "PACAKSAVE(r13)" in _switch() and
-		 * system_call_common().
-		 *
-		 * Likewise for non-swapper kernel threads,
-		 * this also happens to be the top of the stack
-		 * as setup by copy_thread().
-		 *
-		 * Note that stack backlinks are not properly setup by
-		 * copy_thread() and thus, a forked task() will have
-		 * an unreliable stack trace until it's been
-		 * _switch()'ed to for the first time.
-		 */
-		stack_end -= STACK_USER_INT_FRAME_SIZE;
-	} else {
-		/*
-		 * idle tasks have a custom stack layout,
-		 * c.f. cpu_idle_thread_init().
-		 */
+
+	// See copy_thread() for details.
+	if (task->flags & PF_KTHREAD)
 		stack_end -= STACK_FRAME_MIN_SIZE;
-	}
+	else
+		stack_end -= STACK_USER_INT_FRAME_SIZE;
 
 	if (task == current)
 		sp = current_stack_frame();
-- 
2.41.0

