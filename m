Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5A8421226
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 16:58:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNP443L2zz2yR7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 01:58:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GS/+wkbV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=GS/+wkbV; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNP1z1srmz2xtT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 01:56:55 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id q201so4134144pgq.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 07:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ncB7UQDfenmky6A1Yvel2oLx12lyPdALqye45gY2wPg=;
 b=GS/+wkbVSHv0E+HjjdRxW0UX4yyarImWm5x4wCLg4XYy9zf5WsD9uCTlXywLKtHJDX
 DWw2vcRELTmQfv8bBRq0Zldo51+oTZb8sF5j9csg+EHpG0Wm67JIVhWyiWXoyuEuBJwn
 wJk08FNmKSdp9G5afoRMVVbo/qnNv4+/BAdKFbYB7KOYLvE4niSgrfiBwLSAj/kxBOIS
 dEI7IMOHMrbOrvr3zJqT1j+Jn8UJSN8+0q8kFRAhdW1N+xnKodBoodLu9UouwHTMru+5
 l4N/3UmSUScbugCUJMapGH4TLne1X+br9ckBYxjbkf526r+ITYWgZrgPQFkfEzC5Qou3
 u9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ncB7UQDfenmky6A1Yvel2oLx12lyPdALqye45gY2wPg=;
 b=PQ676yrXqRFGsviPxzWipIokaMRAfCXgKiAHu59IqS4688b0iQKuc5dqVeykFy4GpC
 vzxf+KwhMCVeNW4iLyxNc6cf91VpbUWx3E97mqSbQuw6m8BC+KRiL/SbVqCGx006CaSF
 CVvLYeMRjHhmrFcJt6dwu3zZ1p2O39ZAWmS2l7EHinsddIUmIr9E7ivShwcgA8ro4AOb
 6naANKPjPJ0X1YWHi31owF2c/vdQTJQvnoYSMP/xLlPkWgu/2fNXDDkmB1Q2n5bNqV+B
 1UPP7byGdNj8pZctesbhTvRdcPT4URmMvyaSnHzZmovqAvhzz0vt44/TYlxdWeS1knQ7
 K3jg==
X-Gm-Message-State: AOAM532uXELWAomAM9gzMsmLUoByCHMvgWncqhr4oMuFafabuKo6/wJK
 Sp8pv+kZP2P6YGfZj0vLaW2Oyg0oHvI=
X-Google-Smtp-Source: ABdhPJx+d4s1pd2Xg0AcnjHbT2e6JUhBsmDMU1AiZGBVot7Rz77CzD3iCXVDHIy90ed6QC2k/C/MGg==
X-Received: by 2002:a63:4f54:: with SMTP id p20mr10870880pgl.437.1633359412257; 
 Mon, 04 Oct 2021 07:56:52 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id f16sm13194903pjj.56.2021.10.04.07.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:56:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/5] powerpc/traps: do not enable irqs in _exception
Date: Tue,  5 Oct 2021 00:56:39 +1000
Message-Id: <20211004145642.1331214-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211004145642.1331214-1-npiggin@gmail.com>
References: <20211004145642.1331214-1-npiggin@gmail.com>
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

_exception can be called by machine check handlers when the MCE hits
user code (e.g., pseries and powernv). This will enable local irqs
because, which is a dicey thing to do in NMI or hard irq context.

This seemed to worked out okay because a userspace MCE can basically be
treated like a synchronous interrupt (after async / imprecise MCEs are
filtered out). Since NMI and hard irq handlers have started growing
nmi_enter / irq_enter, and more irq state sanity checks, this has
started to cause problems (or at least trigger warnings).

The Fixes tag to the commit which introduced this rather than try to
work out exactly which commit was the first that could possibly cause a
problem because that may be difficult to prove.

Fixes: 9f2f79e3a3c1 ("powerpc: Disable interrupts in 64-bit kernel FP and vector faults")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/traps.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index aac8c0412ff9..e453b666613b 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -340,10 +340,16 @@ static bool exception_common(int signr, struct pt_regs *regs, int code,
 		return false;
 	}
 
-	show_signal_msg(signr, regs, code, addr);
+	/*
+	 * Must not enable interrupts even for user-mode exception, because
+	 * this can be called from machine check, which may be a NMI or IRQ
+	 * which don't like interrupts being enabled. Could check for
+	 * in_hardirq || in_nmi perhaps, but there doesn't seem to be a good
+	 * reason why _exception() should enable irqs for an exception handler,
+	 * the handlers themselves do that directly.
+	 */
 
-	if (arch_irqs_disabled())
-		interrupt_cond_local_irq_enable(regs);
+	show_signal_msg(signr, regs, code, addr);
 
 	current->thread.trap_nr = code;
 
-- 
2.23.0

