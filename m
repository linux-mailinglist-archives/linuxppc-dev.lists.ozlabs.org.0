Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7116B4C7AD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:51:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Tst06fFczDr7M
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:51:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="X62JFb3L"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tqmm4R4nzDqwD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:16:40 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id y72so920304pgd.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eEPX4rW5Kz5NZMGWR4WCjT9DQpre7EAn3GrQ0NxKHwk=;
 b=X62JFb3LmFreFElyL33/RkdKjRlPSkJzWjNI1rnlyvk7a3eQhhHscTCozIFww3lT+x
 qBY1Au6bOG1dNnNt9/rnic/Iz0XtRNOWChN6PS+xKc4PzbjW/GeQjlSSk5+n6Erb8BoY
 FE6XTjQSFPTSrS2kHpnDaxnBe/lz+NVjW+CSaXvzYNLoJVdQWxxInV7ynJIdj3EE76T9
 C8W0ZGBKek5Df8ni4QTjgcAIPp5FAiGpK6onFfGSEGnUn/jcpj80NQ00Ac7CyHiqO1oi
 sllz0WNyd8+dToLyU7IpkaG22Y5mwGhWUWSb/p/8bStJRIk9SaBwF9QRqGvYrV2I9rNb
 pJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eEPX4rW5Kz5NZMGWR4WCjT9DQpre7EAn3GrQ0NxKHwk=;
 b=BkFlZHm8cQM7OhrfDWzeRjjY5IilvBZ2mBf4N0EnUwR0IoF3zM6zf5z2W2BX4w26zH
 +3sKPV31oIz1jF7W24/LscMaxVKQs4/8c6KB6SX2yo2qITRqi4ceVs1ASNKb3xQt8cg7
 PFPhU5t5baUlQwW9tn6ng2iJ8IeyzQQB//tYIzgZVvnFBFT41NxPiiVFYc06OEgj3ROJ
 ySEtiuNqsaYWPU+gHGcoss8Sp84s943EAtYFu9QLmloFIaPU8ODnL4eIUblQqp9942vw
 1Tc3UQ0RRtIyIeq5ytXOQaQjb0sk2RMV5AuuNw24+RiukE7ZL/8hxpFK5rMlERNHkERy
 N/qw==
X-Gm-Message-State: APjAAAUHZZGMKJWWjD1BX6X0krmpZeg5uYkPHP3rn0duFKLVuiic/WKK
 0e9/FCOCgpxrpjHw19tg2BenNbyA
X-Google-Smtp-Source: APXvYqxmkxaFVtzRQNB7MxuxhC7mgLMYBftnWrG/r8NIwCF749+jv5qdhXscQYTJwKRE2RFijvG6Eg==
X-Received: by 2002:a62:5214:: with SMTP id g20mr74653163pfb.187.1561007798339; 
 Wed, 19 Jun 2019 22:16:38 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.16.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:16:37 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 45/52] powerpc/64s/exception: machine check windup restore
 cfar for host delivery
Date: Thu, 20 Jun 2019 15:14:52 +1000
Message-Id: <20190620051459.29573-46-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190620051459.29573-1-npiggin@gmail.com>
References: <20190620051459.29573-1-npiggin@gmail.com>
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

Bare metal machine checks run an "early" handler in real mode which
potentially flushes faulting translation structures, among other
things, before running the main handler which reports the event.

The main handler runs as a normal interrupt handler, after a "windup"
that sets registers back as they were at interrupt entry. CFAR does
not get restored by the windup code, so add that. The current handler
does not appear to use CFAR anywhere, because the main handler is not
run if the MCE happens in kernel-mode and the user-mode message is not
a register trace. However it may be useful in some cases or future
changes (xmon, panic on mce, etc).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 61c96502d2a8..ab22af2509d8 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1205,6 +1205,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_206)
 
 9:
 	/* Deliver the machine check to host kernel in V mode. */
+BEGIN_FTR_SECTION
+	ld	r10,ORIG_GPR3(r1)
+	mtspr	SPRN_CFAR,r10
+END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	MACHINE_CHECK_HANDLER_WINDUP
 	EXCEPTION_PROLOG_0 PACA_EXMC
 	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 1, 0x200, 1, 1, 0
-- 
2.20.1

