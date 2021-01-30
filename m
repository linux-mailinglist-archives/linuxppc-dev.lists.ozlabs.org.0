Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D4B3095F1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 15:34:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DScDH30QKzDrTL
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 01:34:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jCaX9d82; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZMf6TS3zDrTf
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:10:54 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id o16so8501159pgg.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=25wP4v7DOvOzGFUGRjfPo2LlZH8RPqCHSYItbM/s22I=;
 b=jCaX9d827jipbJfPf2jxPgqniy2L6GIY7lvyHI7/fX7RQmOFTKydrvVtzUuZQNWfWd
 RZf3paydBLnG7CWLAWlYQUZQCrupCYHq1fOimqoWdw9tBSf81ekK0eCnv3xBfFC0KzIY
 EyTlhCQ3k6Jju7nxVfvW6b/mDkdvSjg2FLx1Fg2pPmFI3v82LUm+Jbe9gj7XzgiXOCkE
 Fpg2eOv8uryBA8W8V9UE+mgmxydjiTaTGDptNcOf0OMMEym7QZg5sjXx0dnulS5hdiWH
 nRrlz52fJ4exrv/t4a5jr0H2QFHL1hUekLRmpJM/3XaY47UQNLIP2PuNd6XdiTUR711P
 bMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=25wP4v7DOvOzGFUGRjfPo2LlZH8RPqCHSYItbM/s22I=;
 b=WLM5XrM433yfrntdofAEr7EwWXz5rGglbK5cHWScsOnWeb50HIQxy8LSLLzbAaM98+
 E437mzFQve41NW6j9t0m+RNgkdgTQfTZEYMmyAXij0JVrZXrD1SuNcYqqzwe07WC41F9
 EPKUz2vRAwoKJw7ET8jBARrkHdh/DCXoJftEVC8iyX7sMdGi9HSCk2Bv5D7t/H3sdMGJ
 5jrtuvbegN/3k/4zP1FAZmjyVCC62ACeEqz5DJB1ozovGXlc+2+3yVwxqlTJJVhhf1b9
 ajNDafA1PRtw0tY6utPQsXWK1NRFtyfhZBeEQy/iiZnvsp1n0G7UZCmp0z3j0UrnkG60
 W1Tw==
X-Gm-Message-State: AOAM530DyR2pJOqivTwgj9rqR/K4TvhYUmdBJwHYX2W9hkcZqIPYug64
 SMTZPa8qlAxbSZdMlOtkbDLaewRyLgA=
X-Google-Smtp-Source: ABdhPJyTZ9igI679SROYC1MoKy5lnCeQFbfJUU8q4bMjqXTGZ4cO8+K22K+4a5MSml+Vj5aGFn0dGg==
X-Received: by 2002:a65:6215:: with SMTP id d21mr8636195pgv.367.1612012250373; 
 Sat, 30 Jan 2021 05:10:50 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:10:49 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 33/42] powerpc/64: add context tracking to asynchronous
 interrupts
Date: Sat, 30 Jan 2021 23:08:43 +1000
Message-Id: <20210130130852.2952424-34-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210130130852.2952424-1-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Previously context tracking was not done for asynchronous interrupts,
(those that run in interrupt context), and if those would cause a
reschedule when they exit, then scheduling functions (schedule_user,
preempt_schedule_irq) call exception_enter/exit to fix this up and
exit user context.

This is a hack we would like to get away from, so do context tracking
for asynchronous interrupts too.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index e65ce3e2b071..f7f64c3c514d 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -42,10 +42,12 @@ static inline void interrupt_exit_prepare(struct pt_regs *regs, struct interrupt
 
 static inline void interrupt_async_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
 {
+	interrupt_enter_prepare(regs, state);
 }
 
 static inline void interrupt_async_exit_prepare(struct pt_regs *regs, struct interrupt_state *state)
 {
+	interrupt_exit_prepare(regs, state);
 }
 
 struct interrupt_nmi_state {
-- 
2.23.0

