Return-Path: <linuxppc-dev+bounces-1808-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F39E5993DE6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 06:23:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XN2tS2yxZz2ysb;
	Tue,  8 Oct 2024 15:22:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728361360;
	cv=none; b=H6PsOmbUR/tGcYFFl11fuYjTc0sWG6HhfEV9XbYLrovM6qusYYUYFcT1kioAjJwlgOU3Re9xMqKirA73YfnZ2aaafwFlljlVp7Lfn6XI4YtgoBbecGN0UZQb5DHMQX8Hedi7uwodeYZ2IrCV738c6ihW9b7oYDdGcjmbK7oF8imr9FDN463iqh/TIi0AlsNdu0ae8yVV9SY1II/twHBcKG4FS57n7/so5rQ5htBHG2TCCa8Fg2gD4qsgtbW3JEeTSmGoHRxggCRucS/kmJnjBCJX4qCTCQ3IfJDPS/juo37HMBG9hCF/7zwmYhi8d+LwtINHCqJv+1i08Vj5tDLSbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728361360; c=relaxed/relaxed;
	bh=kEE9vyBYLZjq7yP3Z8AiCWUQGh6GcfIC5waGRBdxZhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qfy2qxttg/asc1a7z7CvFwbQsIEsxpY7sGbCkIqTOSGNbR+N73CV77TDWvXcnHilExFnlxaLBVnEosqKUcV09h8N+M32aFNIg+A/+fW/GDo9U6jN1toFdEVmpJOOLGd+WdvCL7y99LzB4TWotJyFw/XSsJTN3QXu/jIyJXR6eytmsFamGjiyHboCO5/A6Tepn3/sGT8PuT0LTJakZxmaeH6Tois9CrVOPbxM0L3eVi4IZ06JnylQGUoL15BpNp+NDXXktcxcMXdDfYq0y+KN7UZUcWcwRzhNKdvmdFDmxwoJSPjM3QaQUMDEmEJIcIaLNfv4Jhp+4xv2ZK6V4hNOSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t3/ahgYV; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t3/ahgYV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XN2tQ6gNxz2yvy
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 15:22:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9AB4A5C5B9C;
	Tue,  8 Oct 2024 04:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB305C4CED2;
	Tue,  8 Oct 2024 04:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728361355;
	bh=bAbqiY32v7W3t8ENtyeNXoNDZoMAvxzj5ilcMrs030c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=t3/ahgYVqgrS38jTqFNgc4fqiVpnurVgv7wdV6tqQRLfO7qvLMVz/7HLUQEjwaGSS
	 BrH6ux0hqBACdDo/ySV/ZL1EPbXzCKuE0y1vlU2oa/hJ2+TYT2htjJjqpefPlPGQE2
	 dz8pJOXGC4K2WfR7KuwEtijLlDKdf1fMtvNfjRsdTGUrbGHEiyE4nq5R41z0XBPKmu
	 do24h94dnGGpwSgvp05yfu1wO4FRzoSl/6PKwk9WAy26j7N/nbsqP37uHAR3d6Quqe
	 ntFoT95EOKIUlAmr4kYeRQqKyy6ZlA2maqw3uOwB4GG3rLe09NDtZ1P36wmQfoyzW1
	 +ZuZCUZyDyLnQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 07 Oct 2024 21:22:05 -0700
Subject: [PATCH 3/3] powerpc: Include -m32 / -m64 for stack protector
 Kconfig test
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241007-powerpc-fix-stackprotector-test-clang-v1-3-08c15b2694e4@kernel.org>
References: <20241007-powerpc-fix-stackprotector-test-clang-v1-0-08c15b2694e4@kernel.org>
In-Reply-To: <20241007-powerpc-fix-stackprotector-test-clang-v1-0-08c15b2694e4@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Keith Packard <keithp@keithp.com>, linuxppc-dev@lists.ozlabs.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2034; i=nathan@kernel.org;
 h=from:subject:message-id; bh=bAbqiY32v7W3t8ENtyeNXoNDZoMAvxzj5ilcMrs030c=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOksmzucbknsuGt+8vSkpw9S2TY0XJnaPEcpIde+44/In
 fK5QYyXO0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEgpwZGZ6muuw0WezcPZ9L
 4eDcpKkP/Z/8mlBQdP7s3s2XK/Z9ZrrKyHBSxuZRVOVcpsAdYnrzpq90udaXoT8pq9th+pWNi/1
 q3/MDAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Kbuild uses the powerpc64le-linux-gnu target for clang, which causes the
Kconfig check for 32-bit powerpc stack protector support to fail because
nothing flips the target to 32-bit:

  $ clang --target=powerpc64le-linux-gnu \
          -mstack-protector-guard=tls
          -mstack-protector-guard-reg=r2 \
          -mstack-protector-guard-offset=0 \
          -x c -c -o /dev/null /dev/null
  clang: error: invalid value 'r2' in 'mstack-protector-guard-reg=', expected one of: r13

Use the Kconfig macro '$(m32-flag)', which expands to '-m32' when
supported, in the stack protector support cc-option call to properly
switch the target to a 32-bit one, which matches what happens in Kbuild.
While the 64-bit macro does not strictly need it, add the equivalent
64-bit option for symmetry.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/powerpc/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index eb98050b8c016bb23887a9d669d29e69d933c9c8..6aaca48955a34b2a38af1415bfa36f74f35c3f3e 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -275,8 +275,8 @@ config PPC
 	select HAVE_RSEQ
 	select HAVE_SETUP_PER_CPU_AREA		if PPC64
 	select HAVE_SOFTIRQ_ON_OWN_STACK
-	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2 -mstack-protector-guard-offset=0)
-	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r13 -mstack-protector-guard-offset=0)
+	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,$(m32-flag) -mstack-protector-guard=tls -mstack-protector-guard-reg=r2 -mstack-protector-guard-offset=0)
+	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,$(m64-flag) -mstack-protector-guard=tls -mstack-protector-guard-reg=r13 -mstack-protector-guard-offset=0)
 	select HAVE_STATIC_CALL			if PPC32
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_VIRT_CPU_ACCOUNTING

-- 
2.47.0


