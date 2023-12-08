Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 197E180A977
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 17:43:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Jh+JoUBh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmxlW4603z3vsQ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Dec 2023 03:43:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Jh+JoUBh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Smxb83d7Hz3dJD
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Dec 2023 03:35:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B77A5624EE;
	Fri,  8 Dec 2023 16:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9608C433C8;
	Fri,  8 Dec 2023 16:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702053346;
	bh=Ho/kybth4D2azYyy3+MrZcuV5/UtWLUUn5wsZ3KGBaY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jh+JoUBhx/n+uubL7szxJytPSQ53Zm47OjhmnBAd9ZX/l9qyt04gNFfuYtjHYCHwr
	 pZUNCoaeFX9sJLhGo43RBkkne2uQhz9S/6kr6T9MrVqBOoCuMFkBC7UmlyLtyDwLzL
	 WOFgLyrJtV5039Mohiw8mt+5WoReashV3Kmzs4eK4POOkTSyAQS4ISVh4vNanu7ZCj
	 bRclPa490aWqumbrEIEdUjScW+5bw30KF2iCQxtDW+O3S68I0/hvGM5539BT0BwATO
	 UpdF5GT6VWOrQkGh+heMG1R9FL+7ui9lsazW+Vwcjis4OxopQ3P2LonVxMxCgwOy3x
	 5dQVm+RiHAoyA==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 1/9] powerpc/ftrace: Fix indentation in ftrace.h
Date: Fri,  8 Dec 2023 22:00:40 +0530
Message-ID: <9f058227bd9243f0842786ef7228d87ab10d29f6.1702045299.git.naveen@kernel.org>
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

Replace seven spaces with a tab character to fix an indentation issue
reported by the kernel test robot.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311221731.alUwTDIm-lkp@intel.com/
Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/include/asm/ftrace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index 9e5a39b6a311..1ebd2ca97f12 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -25,7 +25,7 @@ static inline unsigned long ftrace_call_adjust(unsigned long addr)
 	if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY))
 		addr += MCOUNT_INSN_SIZE;
 
-       return addr;
+	return addr;
 }
 
 unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip,
-- 
2.43.0

