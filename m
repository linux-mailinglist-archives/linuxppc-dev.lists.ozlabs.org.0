Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7143B5A13
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 09:51:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GD0Df3TjLz3cgD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 17:51:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=qboADkED;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qboADkED; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GD0BQ6TNPz30F9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 17:49:50 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id y17so2486829pgf.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 00:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IWBMjXBinn0yPYqP0cxTqwcLCJprYUYGTqwvGOKQk78=;
 b=qboADkEDSedgC+EJmp5Sfk4ccf1rq1GVAjsH+7ozEsxNT0Khd0h37SbGI0Xhtut46A
 GxMLvRGv6UbffUe26TQAfyQWy6E3h3BKRG8g68ZPM/+c3kn5GK7GbkNf6fBrc/v+k+/F
 bq4annpAHGvHC1AxBxMVfyO1CDYWgSpoOhKydvE+itD+ZBoWxeo/5T1Eh6Cpt6IT4ZAe
 QzaQg8rmqLccgIddt1KMZbUyTYiWvHRHA4j02q0FaJtPns1tX3kkHQdKT4GdJegGTEa5
 pljLnZyZvobXZkDLEepi0RQse6tSXDmewdw4G80PSs9S2KDCUmeclAVjYBo/Yn2iRqzj
 4ijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IWBMjXBinn0yPYqP0cxTqwcLCJprYUYGTqwvGOKQk78=;
 b=NFijGCxLJV0ZRcu2ADqEAUAMt4WanKEt5xEk63PCqAFcCwFM4vOMlP+9IqgiVLB/O5
 hhpAMr6te7OwQ6Tohy/UJUzMNtpFr0Y9Q95kA/ejPDQO4VY7+L72vhLkM9mZJSzYw+Yg
 3KAgTgTGeIkszZmg+FzGMSLTsdrT4ogrrUNGtAbP9S/e+8bG9lE0kWbGxe9nFoTXhYoh
 Pt6X3P6BkxS3phE2LSAkVnPv3msezAWXu00LXGm2Mf3DuzNLJ4ya6p0S1UZ6lA+u+K4M
 5lwg4k1pqUMXK70v5FEpT8+R3vXq5PYXd0KjPEl0RJTFxyDneHiXqgDZs8vcoqdpSutJ
 pFHQ==
X-Gm-Message-State: AOAM533zswQ7qBISRDRSOipr42FeCEc8K2XJS8O+zU5/aNMQsWdlKOmk
 CIAVIXnCz83N7TafmOIDfQbAk8xsPyw=
X-Google-Smtp-Source: ABdhPJxvczBzBQduVXNY04xHgqAFoOlyH5QkUshAdWNQZ7Q2SJWAQdfMy6KOtVNzP885gxfdv+xrCQ==
X-Received: by 2002:a63:af07:: with SMTP id w7mr22572283pge.287.1624866588356; 
 Mon, 28 Jun 2021 00:49:48 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id b22sm5264962pfp.20.2021.06.28.00.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 00:49:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/8] powerpc/64s/interrupt: preserve regs->softe for NMI
 interrupts
Date: Mon, 28 Jun 2021 17:49:28 +1000
Message-Id: <20210628074932.1499554-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210628074932.1499554-1-npiggin@gmail.com>
References: <20210628074932.1499554-1-npiggin@gmail.com>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If an NMI interrupt hits in an implicit soft-masked region, regs->softe
is modified to reflect that. This may not be necessary for correctness
at the moment, but it is less surprising and it's unhelpful when
debugging or adding checks.

Make sure this is changed back to how it was found before returning.

Fixes: 4ec5feec1ad0 ("powerpc/64s: Make NMI record implicitly soft-masked code as irqs disabled")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index d7df247a149c..789311d1e283 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -227,6 +227,7 @@ struct interrupt_nmi_state {
 	u8 irq_soft_mask;
 	u8 irq_happened;
 	u8 ftrace_enabled;
+	u64 softe;
 #endif
 };
 
@@ -252,6 +253,7 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
 #ifdef CONFIG_PPC64
 	state->irq_soft_mask = local_paca->irq_soft_mask;
 	state->irq_happened = local_paca->irq_happened;
+	state->softe = regs->softe;
 
 	/*
 	 * Set IRQS_ALL_DISABLED unconditionally so irqs_disabled() does
@@ -311,6 +313,7 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
 
 	/* Check we didn't change the pending interrupt mask. */
 	WARN_ON_ONCE((state->irq_happened | PACA_IRQ_HARD_DIS) != local_paca->irq_happened);
+	regs->softe = state->softe;
 	local_paca->irq_happened = state->irq_happened;
 	local_paca->irq_soft_mask = state->irq_soft_mask;
 #endif
-- 
2.23.0

