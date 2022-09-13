Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0E55B6D82
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 14:46:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRjrc4jh7z3bYk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 22:46:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UgqOB3uW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRjr26rZzz2yX3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 22:45:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UgqOB3uW;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MRjr23jrfz4xD1;
	Tue, 13 Sep 2022 22:45:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1663073154;
	bh=wlwdHX3ADO3prs1ePTcA4mbJNan/FFPTr7iySLDzZt0=;
	h=From:To:Subject:Date:From;
	b=UgqOB3uWOfLOTy8YiizBKLtWthbl938d+UG3dxsyuhvqub/ybi/NDXxL27+M8DkX9
	 E+mwtNCbKffowRza0u8woSnqaIvBRUmRseOT2raETqGUpVP2n9MkPh+CfkigW96gA8
	 2hDZiMbHSrRZsk/H71fduSsgZi+WKWNkGsTjTB/iMIedo7K647v36c9xRXwF2pEDAR
	 mvpQZGLDgFo+3yQiC0lTv85KYmWSY0c19NzqUMvKzTUFMcfwgXjM8AsqPj4P6Kq75l
	 7BrIudzMftxiJZSfo7JXCXB1hJAJ/UoTwdsv9tMDdTHof3XiqoHfoYFyppWerpo/Za
	 4ybZzbtxtSy6Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/64: Remove unused SYS_CALL_TABLE symbol
Date: Tue, 13 Sep 2022 22:45:45 +1000
Message-Id: <20220913124545.2817825-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.2
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In interrupt_64.S, formerly entry_64.S, there are two toc entries
created for sys_call_table and compat_sys_call_table.

These are no longer used, since the system call entry was converted from
asm to C, so remove them.

Fixes: 68b34588e202 ("powerpc/64/sycall: Implement syscall entry/exit logic in C")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/interrupt_64.S | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index f9ee93e3a0d3..0093a6b6b1e1 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -13,16 +13,6 @@
 #include <asm/ppc_asm.h>
 #include <asm/ptrace.h>
 
-	.section	".toc","aw"
-SYS_CALL_TABLE:
-	.tc sys_call_table[TC],sys_call_table
-
-#ifdef CONFIG_COMPAT
-COMPAT_SYS_CALL_TABLE:
-	.tc compat_sys_call_table[TC],compat_sys_call_table
-#endif
-	.previous
-
 	.align 7
 
 .macro DEBUG_SRR_VALID srr
-- 
2.37.2

