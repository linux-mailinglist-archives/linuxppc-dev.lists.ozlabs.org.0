Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0955780A935
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 17:35:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GDMWy+Me;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Smxb93Pbqz3d9H
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Dec 2023 03:35:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GDMWy+Me;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmxZL13DCz3d9L
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Dec 2023 03:35:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 320B16231E;
	Fri,  8 Dec 2023 16:35:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C539C433C9;
	Fri,  8 Dec 2023 16:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702053302;
	bh=xQL6pG6caMEyh27UFdkVG4YVqENSinSYSj4xkfqkX3c=;
	h=From:To:Cc:Subject:Date:From;
	b=GDMWy+MeAdezgVTuAgkePTDVNCDmK6Xb8vdKI+aRsMe1aHkIohr2LQhf1GDl1VW3p
	 Qquxo3Cj+Gf5cb/QZuFokdhqLBP1FrAJ8Xgxymun8pajiCz2JdgZZgcvyIlNCfokKf
	 ZdzdF2+bkZMDW7TxDMJP7oBDr7yXViufFmxlCNNPhkBiSacXp8vNxdVzu0oTokHzAV
	 6qPuW2i5fpMmEiIjtxUrcndcOqG8XNhqGbfo4rzj/q/rM6gbc9497pDenwuTZzf+cu
	 BATEflAHnCRp+pUO+NvOT4fGDZLRsbteEvmG2mBAHMHsZYrv252nKEnpnFjnwwRvhS
	 1x1qOB9aFrx8w==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 0/9] powerpc: ftrace updates
Date: Fri,  8 Dec 2023 22:00:39 +0530
Message-ID: <cover.1702045299.git.naveen@kernel.org>
X-Mailer: git-send-email 2.43.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, Florent Revest <revest@chromium.org>, Nicholas Piggin <npiggin@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Early RFC.

This series attempts to address couple of issues with the existing 
support for ftrace on powerpc, with a view towards improving performance 
when ftrace is not enabled. See patch 6 for more details.

Patches 7 and 8 implement support for ftrace direct calls, through 
adding support for DYNAMIC_FTRACE_WITH_CALL_OPS.

The first 5 patches are minor cleanups and updates, and can go in 
separately.

This series depends on Benjamin Gray's series adding support for 
patch_ulong().

I have lightly tested this patch set and it looks to be working well. As 
described in patch 6, context_switch microbenchmark shows an improvement 
of ~6% with this series with ftrace disabled. Performance when ftrace is
enabled reduces due to how DYNAMIC_FTRACE_WITH_CALL_OPS works, and due 
to support for direct calls. Some of that can hopefully be improved, if 
this approach is otherwise ok.

- Naveen



Naveen N Rao (8):
  powerpc/ftrace: Fix indentation in ftrace.h
  powerpc/ftrace: Unify 32-bit and 64-bit ftrace entry code
  powerpc/ftrace: Remove nops after the call to ftrace_stub
  powerpc/kprobes: Use ftrace to determine if a probe is at function
    entry
  powerpc/ftrace: Update and move function profile instructions
    out-of-line
  powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_CALL_OPS
  powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_DIRECT_CALLS
  samples/ftrace: Add support for ftrace direct samples on powerpc

Sathvika Vasireddy (1):
  powerpc/Kconfig: Select FUNCTION_ALIGNMENT_4B

 arch/powerpc/Kconfig                        |   6 +
 arch/powerpc/Makefile                       |   6 +-
 arch/powerpc/include/asm/code-patching.h    |  15 +-
 arch/powerpc/include/asm/ftrace.h           |  35 ++-
 arch/powerpc/include/asm/linkage.h          |   3 -
 arch/powerpc/kernel/asm-offsets.c           |   7 +
 arch/powerpc/kernel/kprobes.c               |  69 +++++-
 arch/powerpc/kernel/trace/ftrace.c          | 231 ++++++++++++++++----
 arch/powerpc/kernel/trace/ftrace_entry.S    | 182 +++++++++++----
 samples/ftrace/ftrace-direct-modify.c       |  94 +++++++-
 samples/ftrace/ftrace-direct-multi-modify.c | 110 +++++++++-
 samples/ftrace/ftrace-direct-multi.c        |  64 +++++-
 samples/ftrace/ftrace-direct-too.c          |  72 +++++-
 samples/ftrace/ftrace-direct.c              |  61 +++++-
 14 files changed, 845 insertions(+), 110 deletions(-)


base-commit: 9a15ae60f2c9707433b01e55815cd9142be102b2
prerequisite-patch-id: 38d3e705bf2e27cfa5e3ba369a6ded84ba6615c2
prerequisite-patch-id: 609d292e054b2396b603890522a940fa0bdfb6d8
prerequisite-patch-id: 6f7213fb77b1260defbf43be0e47bff9c80054cc
prerequisite-patch-id: f2328625ae2193c3c8e336b154b62030940cece8
-- 
2.43.0

