Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D7930D116
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 02:55:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVlBL1bCqzDqMg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 12:55:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVQ2L1tY3zDqRB
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 00:02:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=kqRY050g; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4DVQ2G00BBz9vFD; Wed,  3 Feb 2021 00:02:14 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DVQ2F4p7Gz9vFF; Wed,  3 Feb 2021 00:02:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1612270933;
 bh=Bx30iDFxYr5YeLlZWgnT3sSvAGju3qwUqafhouzOPtU=;
 h=From:To:Subject:Date:From;
 b=kqRY050gSbjvlWo4TKOiygR6v+pKo0laYo2EJnEC/3bNDhME8UvrSh7OVSlfH4xpL
 g41811wz+laMMYzQARV3Hnzlui6GC4bcJ3aORqoniWRxCA2sWseo7HcyVxoI1EKbJX
 FHqwz7gjySVvfQ16V244jbZr/7c3jQLtKnp1THdbF7Mi1PpcyPusmNXm5i6jpOy98O
 iIS8TZvchr631Br+Di2xWhrdiZGdx/O9mksXwf9ICzRHgxv8n5VROeLEaSVL7Mw98R
 31hp9LwmkAZAJjD5UW0qvAwVWzcEqHbsML07lIAPCX7S2152H6wGDiVt8LvhmbDvQl
 oPY3r7YujDtlw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 1/2] powerpc/64: Make stack tracing work during very early boot
Date: Wed,  3 Feb 2021 00:02:06 +1100
Message-Id: <20210202130207.1303975-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If we try to stack trace very early during boot, either due to a
WARN/BUG or manual dump_stack(), we will oops in
valid_emergency_stack() when we try to dereference the paca_ptrs
array.

The fix is simple, we just return false if paca_ptrs isn't allocated
yet. The stack pointer definitely isn't part of any emergency stack
because we haven't allocated any yet.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/process.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 8520ed5ae144..e296440e9d16 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -2047,6 +2047,9 @@ static inline int valid_emergency_stack(unsigned long sp, struct task_struct *p,
 	unsigned long stack_page;
 	unsigned long cpu = task_cpu(p);
 
+	if (!paca_ptrs)
+		return 0;
+
 	stack_page = (unsigned long)paca_ptrs[cpu]->emergency_sp - THREAD_SIZE;
 	if (sp >= stack_page && sp <= stack_page + THREAD_SIZE - nbytes)
 		return 1;
-- 
2.25.1

