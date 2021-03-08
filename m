Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53327330A9A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 10:54:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvDFV2Vf2z3dLf
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 20:54:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=NmUXpDBo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NmUXpDBo; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvDDH74lXz3cXv
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Mar 2021 20:53:03 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id
 ga23-20020a17090b0397b02900c0b81bbcd4so2671862pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Mar 2021 01:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IcUGC/WC3idmEiqYEdboYch4xIiveWzvciw18OaggPU=;
 b=NmUXpDBom/s5+1aLumOhffsdRF0XAC1ILzKZ4O8FmcS2i2D7/d742Z9mvC7UvtMaW7
 nwaFE85nn1qecUiKqV8+smwCjv+5yAZzdNeFTjOfBIhORzqaf/MexfKHjN17nQGZeRX9
 l38ikC2tQ0DICY+a1xcCQimj44KTTYKrHbhe0LnlNFx2W6cA4jotAea3lGETQSw20DOv
 XqqOPwRfvq/ixR3abbTL7AGCxSpvqORI1apfxNkl20hfrSOKksmdWUCsB51rPT/0v1LB
 faztyTznJpYXYk3wqu88F32lcLylmpaonIl2HSEYoPBIKb+sbYSjdZsfpvkt4IMJZr77
 0cJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IcUGC/WC3idmEiqYEdboYch4xIiveWzvciw18OaggPU=;
 b=jhUARuP+Joscxc/SkzzrLiBOdb/IUd06zgefpFUNkGqVAxKgU7KDdRNqKXCC2V1HyL
 uobzkIDMTVVxi8+9X5JSZDFOvjIaJrHou3V5cvmiadxrMi8YQKZ+4niYXCz9eBzYsrMJ
 rflFpniF5IePf7ssgmIdWukNzh+iLxA0z+kJn2HRd3yJA6VARUzjnIjBRQP/v4aeMNzv
 CX+x10DfnDwYB0RTyEzPYqpZPncYgcvz/PAs8ltgCO0m6nU6yErtojqP/viEN3QG0gt8
 7zuSDC01WFU5STszUHqihmKIfpcxMh8vO3l/G+8Xc4jQIxblIpy3wJhpm4niw6iRqma4
 xjrQ==
X-Gm-Message-State: AOAM531eUsYsqpzJWW4cqFas4BY+3gXJ4oz7j+B9XdPBNTQIY8tl7COs
 Ko7HWiFyguOm0v44lygr/FP6v4OegOo=
X-Google-Smtp-Source: ABdhPJxiyyGXrbwSi+06vs/eTtowFpWZ60+nknPVBc7pILhvWm4ypZ7YVS9Ddwxt2vTqr30/WWBOtg==
X-Received: by 2002:a17:90a:66c2:: with SMTP id
 z2mr3084985pjl.139.1615197180902; 
 Mon, 08 Mar 2021 01:53:00 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 e63sm1326850pfe.208.2021.03.08.01.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 01:53:00 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 1/7] powerpc/syscall: switch user_exit_irqoff and
 trace_hardirqs_off order
Date: Mon,  8 Mar 2021 19:52:38 +1000
Message-Id: <20210308095244.3195782-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210308095244.3195782-1-npiggin@gmail.com>
References: <20210308095244.3195782-1-npiggin@gmail.com>
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

user_exit_irqoff() -> __context_tracking_exit -> vtime_user_exit
warns in __seqprop_assert due to lockdep thinking preemption is enabled
because trace_hardirqs_off() has not yet been called.

Switch the order of these two calls, which matches their ordering in
interrupt_enter_prepare.

Fixes: 5f0b6ac3905f ("powerpc/64/syscall: Reconcile interrupts")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 2ef3c4051bb9..38ee41f8844a 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -34,11 +34,11 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
 		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
 
+	trace_hardirqs_off(); /* finish reconciling */
+
 	CT_WARN_ON(ct_state() == CONTEXT_KERNEL);
 	user_exit_irqoff();
 
-	trace_hardirqs_off(); /* finish reconciling */
-
 	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x))
 		BUG_ON(!(regs->msr & MSR_RI));
 	BUG_ON(!(regs->msr & MSR_PR));
-- 
2.23.0

