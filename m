Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B3133C901
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 23:04:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dzr7B6fpZz30G6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 09:04:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Vjf2FAEv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Vjf2FAEv; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzr6n4mzSz301j
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 09:04:16 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso326408pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 15:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=khtA6tvryXINeqwk/R6yDvDDyb9j2VCtb1NAHQZ8q5U=;
 b=Vjf2FAEvlG6Kn5zPAiV25oA5DdVBeX1uWZgLooRTf8uFiOZM/443z+xfm1DzXSqAjY
 CM2R8TEXTSurkNbEbmJ406Lah8YUoGK9OtJIyFlVR2vN/aO/lCM2q6JEYVAQ+Xoml5io
 bcusjqdJxxoMnsWHBxOaeMeBZUm7kaGEHXZF9+rB3MQBzmymJVoSTyJYxVpkxI/Bd7tM
 FCYYkgrWyGoG2qUOsE6IlyUnTOPgwMfugHOsG+h2uY/2Bc7ifv5Hd622x/RPb/JARJOI
 iFR1QeXg4le5e2hTKGdcp9oLEe3UkvVCHBznUiUKvLkHYh+B4BFOdHBUKo1SjQWOTaGN
 NgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=khtA6tvryXINeqwk/R6yDvDDyb9j2VCtb1NAHQZ8q5U=;
 b=ERwCb/PCy+XgEfeH7TXSGJ74QrMuCwhGreVNV+mEqmx0IORoAKz1vp2eK59bB+nk16
 3P7cm12fXlHIcpznX3RQVIV4pZ/aJIScU8tgpHRX5caXjBCuZvsPjfuZuOjwihiezX1m
 S6RL74cVVM+DPxvv6vPYvQGCzAQpV8g8NHUcWv1n68g7CYfaiqjkUt8SFToly0q+aARe
 U0wAskXLr/1xppSkLYbNGsI42riiQpeYlUq0hA4W3dCyd1oSv9klXmX/EsrtqkSrX+0u
 Ybi7Jw7ovdPXi2VdbMZRY7xN3+WJjMA1rxNmeQNyVo3U/JwL0Hsx2mh6r3ozsGSyJ9Ou
 ACxg==
X-Gm-Message-State: AOAM533xLxMxlXQyPMJbbWxxaHo0whFD2p5hUjG/eZI/aG7gIm3zBrlk
 yJkQbI87K+9FDFI+Pv6fiCcwS0iDojU=
X-Google-Smtp-Source: ABdhPJy8+tPazpW4gw4RieqUw8oP9EWWZtUUwovGHbbf6ECUlWlCQk5Ruhi02qJQ5neX1qEnPiLvWg==
X-Received: by 2002:a17:90a:6282:: with SMTP id
 d2mr1202483pjj.168.1615845853796; 
 Mon, 15 Mar 2021 15:04:13 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 y9sm14740338pgc.9.2021.03.15.15.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 15:04:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 01/14] powerpc: remove interrupt exit helpers unused argument
Date: Tue, 16 Mar 2021 08:03:49 +1000
Message-Id: <20210315220402.260594-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210315220402.260594-1-npiggin@gmail.com>
References: <20210315220402.260594-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The msr argument is not used, remove it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/asm-prototypes.h | 4 ++--
 arch/powerpc/kernel/interrupt.c           | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index 1c7b75834e04..95492655462e 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -71,8 +71,8 @@ void __init machine_init(u64 dt_ptr);
 #endif
 long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8, unsigned long r0, struct pt_regs *regs);
 notrace unsigned long syscall_exit_prepare(unsigned long r3, struct pt_regs *regs, long scv);
-notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr);
-notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsigned long msr);
+notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs);
+notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs);
 
 long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
 		      u32 len_high, u32 len_low);
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 96ca27ef68ae..efeeefe6ee8f 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -359,7 +359,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	return ret;
 }
 
-notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr)
+notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
 {
 	unsigned long ti_flags;
 	unsigned long flags;
@@ -443,7 +443,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 
 void preempt_schedule_irq(void);
 
-notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsigned long msr)
+notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 {
 	unsigned long flags;
 	unsigned long ret = 0;
-- 
2.23.0

