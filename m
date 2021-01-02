Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6B12E875D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jan 2021 14:01:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D7MTY3flvzDqv3
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Jan 2021 00:01:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HIe/dnsb; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D7Lhf3VqCzDqpr
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jan 2021 23:25:54 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id 30so11076175pgr.6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Jan 2021 04:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rF2K8503We+UZeN099aEi/lLo/gGBUZJC64MtQTsCSs=;
 b=HIe/dnsbwWQwD8rfElRDQ7dw0Wk+VMqiUz6GTvBMI0vOQySl99lJjEv5M/yK0ZnW3c
 SyXW21a+1x0Orwr64X8AvlD+fx93+hL1X/NhBAnkYHNhTcw3AzTHPBKjRQH9lWxNxDFb
 lLObRHzFN8lQDPE2bTQBQDUYPcUlmjAEm2JYnGFDMPC31STRyIgKKgViJQl78647VOPC
 BcoKaMyTWlphn1hSHYkY6VYj9HXRq8SBesboModwzq+K3BAdMcqf+4LtcmdUjFtgmlaJ
 Gom7CQQOKC1F3SpuoIj+CrOqYRBNm+FnCtsjU/084S5LNk7uXFMGoB2b7BZVKw2DnYOr
 Z6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rF2K8503We+UZeN099aEi/lLo/gGBUZJC64MtQTsCSs=;
 b=D8aX7KEtWObsmf8g1DghxFMTBlxhc5dpznpFczEbBIVMfokgiQr1pUf/AzX6MFNWez
 d7j6OTmcvOKxd4fcIlKJvPYhQFKlLoTZkBHmDUYnYMqZJXIycxGgUfsuu7MqDg3sgV4o
 KGUc7vICIiLrVGZEcTKSPvWTvYL4C8eAzBHR4cvqxaryL/zhyctNbtRxSOoXoANNk7Ek
 T03c2HYfqOyV5pVFMtZZiaPWlt59tvM9il+HyiL6cbCCHwPb1L8L+99s4fU59bWY5Jor
 /B/uF/DnoY3nKgHP8XLDeuuJoEZp+4w934Sa7Ydfq3PFIaiQK8Vr2HCB8lecnD3aJUDH
 VOXQ==
X-Gm-Message-State: AOAM532I5s4c9pKTCCzaznEguDDitxpumA2fPhQxp3BfjAoz3vdC65xk
 Yg5fibRUa8MAbllvMbjQwPz5e203tXg=
X-Google-Smtp-Source: ABdhPJzknDPQ+sbSTrg+9u4I2sv0Q7fXy6Y36iFl2ktUl/6QQemrNWrYh/4JcWTIFtEXEZb1dzt/bQ==
X-Received: by 2002:a63:c441:: with SMTP id m1mr55047709pgg.353.1609590351452; 
 Sat, 02 Jan 2021 04:25:51 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id h4sm58501413pgp.8.2021.01.02.04.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 04:25:51 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 12/21] powerpc/64: add context tracking to asynchronous
 interrupts
Date: Sat,  2 Jan 2021 22:24:59 +1000
Message-Id: <20210102122508.1950592-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210102122508.1950592-1-npiggin@gmail.com>
References: <20210102122508.1950592-1-npiggin@gmail.com>
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
index 7fab54a14152..7c40ce78c4bb 100644
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

