Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE0C80A949
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 17:37:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ME9PtPfy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Smxd36650z3cg1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Dec 2023 03:37:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ME9PtPfy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmxZY0GZrz3d9Y
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Dec 2023 03:35:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BD56ECE28A4;
	Fri,  8 Dec 2023 16:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34BC3C433C7;
	Fri,  8 Dec 2023 16:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702053313;
	bh=v2mYSDmjqdbapRfO1Kx9bcMiig2SVy+s9w1cLpmU0IY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ME9PtPfym6Ef0DDZb+Yjsva6Tx8a2WFMT7p9z045HUvh9QMf6RYkYWO9RVuxKCFgU
	 HJcwtvyeTDA4KEjFRvwrIbXOu7CmVeFAVv63UTCBUWBRfBvmLPohHZUqUw8UlH+OjM
	 7XtiUv082yDmJAx1zPZCY03aeXILFNzg8yK+5FTCffZ4PiV0xSKCaQekcRzWHGLWdx
	 tgDLBLsAWL7w1QN3PX4zxsuozv5RHP5xxw1+h7Ke6HDg5/vbmy6mu2P7Z7JC4Keetj
	 GCv1sqJ1XsfaiO78KJ9MM0sDVB1FFKqvhgYXhoCOLIfq7BNf3nUgtbk23tcxonJOAV
	 W9PhRJauc5uaQ==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 3/9] powerpc/ftrace: Remove nops after the call to ftrace_stub
Date: Fri,  8 Dec 2023 22:00:42 +0530
Message-ID: <8ee5ec520e37d5523654bb2cd65a17512fb774e2.1702045299.git.naveen@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1702045299.git.naveen@kernel.org>
References: <cover.1702045299.git.naveen@kernel.org>
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

ftrace_stub is within the same CU, so there is no need for a subsequent
nop instruction.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/kernel/trace/ftrace_entry.S | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kernel/trace/ftrace_entry.S
index 17d1ed3d0b40..244a1c7bb1e8 100644
--- a/arch/powerpc/kernel/trace/ftrace_entry.S
+++ b/arch/powerpc/kernel/trace/ftrace_entry.S
@@ -162,7 +162,6 @@ _GLOBAL(ftrace_regs_caller)
 .globl ftrace_regs_call
 ftrace_regs_call:
 	bl	ftrace_stub
-	nop
 	ftrace_regs_exit 1
 
 _GLOBAL(ftrace_caller)
@@ -171,7 +170,6 @@ _GLOBAL(ftrace_caller)
 .globl ftrace_call
 ftrace_call:
 	bl	ftrace_stub
-	nop
 	ftrace_regs_exit 0
 
 _GLOBAL(ftrace_stub)
-- 
2.43.0

