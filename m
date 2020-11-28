Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D50602C6FB7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 16:00:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cjvn650BfzF1RP
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 02:00:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rB4hmXRJ; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjvMZ29RwzDsRw
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 01:41:46 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id q10so7002569pfn.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 06:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U3KknA0alFa0IGxG++tGNKRflaQXroTilKw3EbRtEOs=;
 b=rB4hmXRJBlp+cXRzy+y6WUVOjPK0eqMGilp8/6sqpyGa1kUQF/B3bqpcZd/t//GYdJ
 8+SyHt7CZfXarnoOhb+gZbTWSGSxhZNN2WS2A4pyn1D5WSXx39JIHPQC1ZrkUOwLGFQ/
 G312A8w5FOxAHdnMTOtTZPw9ooMcFNR423rIU7J1A4FyBMeripp93/GqKYrGs9m085E2
 9II+fHf4EKJCH7d7iF5I0ylkF4/Duj2TI0UEssf0QqpgYiUCJLpPvqkfXT2z6BX6sdbh
 oCVB34HzRBw6au0iEybhqGn+AJeDKZqgFEZ8uhc0RrXGS3ksXDZxL0ZJ8JOS1wZkV2tu
 1qfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U3KknA0alFa0IGxG++tGNKRflaQXroTilKw3EbRtEOs=;
 b=KAZxKBlWrOMqG8tpnLi9jk3ad+sMtKYG8e4JelrNIw8kWu6V4VnTp5FI1ECicRiu8F
 tdLkAjxs+5fkbTmhCNmXrDPvyrdKHvTskN9R9an7Pa1KIeXljCbIwBH90/h1wbyJSi8e
 Ej9AT69HwZul8IiG2tvwD179SeCuDe3t8AX8kssqdqeLT/xGRed3I1Zp5ubHLMvnDwKF
 2Awr1Dq6wWHTnph3m8pTejjX+PX4W5fkz+6gO2ccOw+6o4y8T+hMCu0C0Gd3tZD3gssL
 A5qMqh+jqSygqT9ApQKLjpnnfYuOdDqz8Z5VfAnjk8z5tAzwQeN+E6YMpPpAL7lQxWkz
 iZhA==
X-Gm-Message-State: AOAM531kvqxrmEJE4N06vS8JZe+poDAJ7y7MwzDnlZUF5olkqu0CoQvG
 jGUqp3VoGJsUaFLFHWktxcbP8J/eb5I=
X-Google-Smtp-Source: ABdhPJw3ywDG/HAgl27vOpBDXMnYf+eKgEbBzoOwEy+n/M4ncekKKoYY4nAPqw6zKqZ08uakvzYdYg==
X-Received: by 2002:a63:797:: with SMTP id 145mr10953398pgh.264.1606574504443; 
 Sat, 28 Nov 2020 06:41:44 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-103-132.tpgi.com.au.
 [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id y201sm10750764pfb.2.2020.11.28.06.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 06:41:44 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 10/19] powerpc/64: add context tracking to asynchronous
 interrupts
Date: Sun, 29 Nov 2020 00:41:05 +1000
Message-Id: <20201128144114.944000-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201128144114.944000-1-npiggin@gmail.com>
References: <20201128144114.944000-1-npiggin@gmail.com>
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
index e2410f54c6e9..8f7db1c8cbe0 100644
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

