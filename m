Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1282B2F8347
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 19:07:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHTgB0lkQzDsW7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 05:07:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rCMQdBaT; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHRzq3RPNzDsgv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:52:07 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id l23so5528846pjg.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=25wP4v7DOvOzGFUGRjfPo2LlZH8RPqCHSYItbM/s22I=;
 b=rCMQdBaTvCkYAINfJgAOx3dlazQrmYvBaPTU0pYHxaynPjlX6p0QRnq9rrQpgju3va
 VJ96miepfF6hsPPzQOO1Hvx9Q78bSMcCKrBVF6Tw3yf0k+6np3wqLSDwBwc1jkPdGUFc
 wbPvYCPfxQZadcRSjTCIFnsuNIK5WuGpAyMZPnO6RoUsh/JaJxIy4jqarER6XQ8rIUf/
 qGv+wJHJ8qM3Mhsv6wpuzlW8Ioy+1Wa6nZVK9k5V0VWvL6dxkfJQJwiarWrivdpvBvxY
 aau2u4JEi7aR0iAMdmHyeF14YcaLzRRwTYYyx5NrbuWsJGnAlj8mawmhhrNT+k8+2jbM
 0VIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=25wP4v7DOvOzGFUGRjfPo2LlZH8RPqCHSYItbM/s22I=;
 b=W1oEuivPQDouWxCXMRwDTfE9NInE7sDG7QG6FtwOrkkMQ0gcRYnpGz/XKtEGAhs4uF
 ACl1F1utgDs71DDcU4NlxY+/08LdQ+BVQY4CgL+t42FMsd2YKMWt3LpEmbdPOaAlMHrA
 uMalQDWaTPSstPSyRuYfidIn1uZAnadz4aat0CTXtqZm6zUANBlNzO8hPNZlUZqgpzzO
 qnCSD4zB4HhtPpfVII8J3IN0mOcFcnfOB2DqxjtV2DmnnhWOskNSNUP1uFiOrcEZJsSY
 wpQ2L2E4R6GR64Q3IChTh/X76C2ynhAIEWI42kDWSagG2jQCW9bqyUprGsx6zGCoTcYi
 k+hw==
X-Gm-Message-State: AOAM530y7eR1IxF4lXUTK313Ne5nFc0uvaaTJ0hz/VprS2r5YjikaauG
 ZccR6nqmj9ecEHwtuehhrM3W0oP6kZY=
X-Google-Smtp-Source: ABdhPJzGfpl9+7ikFBfd2mUPFf4IlmBDVBDoJ2ccJSb2e6jRHTrrtjlPr8DvwKOHCGzMzO87L+QReA==
X-Received: by 2002:a17:90b:4c8e:: with SMTP id
 my14mr133339pjb.30.1610729524979; 
 Fri, 15 Jan 2021 08:52:04 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:52:04 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 30/39] powerpc/64: add context tracking to asynchronous
 interrupts
Date: Sat, 16 Jan 2021 02:50:03 +1000
Message-Id: <20210115165012.1260253-31-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210115165012.1260253-1-npiggin@gmail.com>
References: <20210115165012.1260253-1-npiggin@gmail.com>
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

