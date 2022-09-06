Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E355ADF5C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 08:05:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMFHP6xtkz3cdx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 16:05:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TV5Hc8Gv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TV5Hc8Gv;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMFFT3jN7z3bXn
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Sep 2022 16:03:57 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id o15-20020a17090a3d4f00b002004ed4d77eso4874545pjf.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Sep 2022 23:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=52kde5xILBG915Jw4ygVrAEzLf81koPS/DHe/nkC28c=;
        b=TV5Hc8Gvnw1EH4ZOMe5jRZ5tkCCr/3y5GQoLysqYPmzVOT1GkltIggnsp5m8Js5Sto
         Yk6Q9XH18o0TyQsAQFVDaiItRGgY/OEEcgMw4PPV4309AS6NybrO4YMzyuREUtuSwOS+
         /BtS2cpAsf4fYLzdy+ldIWT5jLuaZS2LOPlewnzY3Y1capQXFm7yWPUcgvyYHI2prXuU
         8N7stn3iFc6KFysBDfYSuzKu7PL8UuYuQD6CSZmDlrJJR8Ea3vnFwldQkW+I6QY4XMhp
         6YRmyFd1IfG0tckwpddizHuR2mduJ5N0QrD3Kd/9IMlSimTVR3pFvP9CaYI7jna2j+yH
         ENRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=52kde5xILBG915Jw4ygVrAEzLf81koPS/DHe/nkC28c=;
        b=XmDJ5C1OW2i30Gl908wVwwTY6WKTBPWdAMo2m14herP/aXN+Mvtfs9eYGeykWLcAmX
         XjhHz4PZZKwe5e6gG7OkRYlt1Y6izr7GhBCsjRrEx3zKddYu7zb0dWpbgwfxQCbKZdQJ
         C97e3s1z1rzTMjq0XUAMD1H+iDWkA0JlDEksMbUBS/c6bSpEaicGNnPAHmx1cEJNyB/K
         6gj1WHgaGdx+tJ74Bo6E+S2B/Fa7TzbBgXdn3o20Z/S1/2cEiPKHwy1APRiUAJoRbhuV
         Y5w4R/vwVE17Z2dBSnDfWnyKR738mZliuXYkUyny63dhv66q3sJM6FQCiyMqTGs8kwgb
         zxHQ==
X-Gm-Message-State: ACgBeo1wIomrKY8eS5Voi31p4ErG1Cngq6q5HTs/5Lr43lXxGODNa2J1
	z0XX7Ry3MiEZlSvSwHPJbO/+lAV8GjM=
X-Google-Smtp-Source: AA6agR73Q07dEIE+DoXNAls2kdpXvBf/5dKiTkD67MC/N+IMp1JEQTyBxW9qZvNmrgP/H+bIjHVLCw==
X-Received: by 2002:a17:902:e945:b0:16a:1c41:f66 with SMTP id b5-20020a170902e94500b0016a1c410f66mr51459274pll.129.1662444234808;
        Mon, 05 Sep 2022 23:03:54 -0700 (PDT)
Received: from bobo.ibm.com ([124.170.18.239])
        by smtp.gmail.com with ESMTPSA id u126-20020a626084000000b005383988ec0fsm8934864pfb.162.2022.09.05.23.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 23:03:51 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/3] powerpc/64s: Fix irq state management in runlatch functions
Date: Tue,  6 Sep 2022 16:03:36 +1000
Message-Id: <20220906060337.3302557-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906060337.3302557-1-npiggin@gmail.com>
References: <20220906060337.3302557-1-npiggin@gmail.com>
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
Cc: Sachin Sant <sachinp@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When irqs are soft-disabled, MSR[EE] is volatile and can change from
1 to 0 asynchronously (if a PACA_IRQ_MUST_HARD_MASK interrupt hits).
So it can not be used to check hard IRQ enabled status, except to
confirm it is disabled.

ppc64_runlatch_o* functions use MSR this way to decide whether to
re-enable MSR[EE] after disabling it, which leads to MSR[EE] being
enabled when it shouldn't be (when a PACA_IRQ_MUST_HARD_MASK had
disabled it between reading the MSR and clearing EE).

This has been tolerated in the kernel previously, and it doesn't seem
to cause a problem, but it is ugly and unexpected. Fix this by only
re-enabling if PACA_IRQ_HARD_DIS was set.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/runlatch.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/runlatch.h b/arch/powerpc/include/asm/runlatch.h
index cfb390edf7d0..ceb66d761fe1 100644
--- a/arch/powerpc/include/asm/runlatch.h
+++ b/arch/powerpc/include/asm/runlatch.h
@@ -19,10 +19,9 @@ extern void __ppc64_runlatch_off(void);
 	do {							\
 		if (cpu_has_feature(CPU_FTR_CTRL) &&		\
 		    test_thread_local_flags(_TLF_RUNLATCH)) {	\
-			unsigned long msr = mfmsr();		\
 			__hard_irq_disable();			\
 			__ppc64_runlatch_off();			\
-			if (msr & MSR_EE)			\
+			if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS)) \
 				__hard_irq_enable();		\
 		}      						\
 	} while (0)
@@ -31,10 +30,9 @@ extern void __ppc64_runlatch_off(void);
 	do {							\
 		if (cpu_has_feature(CPU_FTR_CTRL) &&		\
 		    !test_thread_local_flags(_TLF_RUNLATCH)) {	\
-			unsigned long msr = mfmsr();		\
 			__hard_irq_disable();			\
 			__ppc64_runlatch_on();			\
-			if (msr & MSR_EE)			\
+			if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS)) \
 				__hard_irq_enable();		\
 		}      						\
 	} while (0)
-- 
2.37.2

