Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 576F03250FA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:56:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmZ7l2HYgz3dWs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 00:56:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=IUX2I6OT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IUX2I6OT; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmYyp4VGLz3cLS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 00:48:18 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id t5so5068947pjd.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 05:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wxpw7NhXAqb/o/SA9VUSgxQVhLanI9uq2XV1Nk13yao=;
 b=IUX2I6OTL090eZq9oSuMpuIzDkT/w0BAUY9dM4H/gj8fOb1/0snrh1axsLvw7P0TY+
 +Ee8uqBb8mHfvPTSBnOXJ0Oqg/56xDgKtlV3wtBwexeyFoUbn8leVkYvYqYP8wZAXJZI
 Iod6zIfWQrSzZqcQFrrCcqEwP4GNhRoJ/XiOauKwDqhHA4cpZUnXF8INaqtBzMBmEG9a
 p4tR3H+wbQGidMvLF/Wd215bSCbbLPrjQiVTNsHSgqPc5XDLGqvEmEB11k4Jqd9h+2YA
 ITImTlSSyJoZTxeRQSq1WNzRtBgw2cOWnyDuQlKYashzkv3qHwjaz+Pc/UiGr2NvT77O
 DzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wxpw7NhXAqb/o/SA9VUSgxQVhLanI9uq2XV1Nk13yao=;
 b=GiPRT6ZWFZsqM7qumjcT9RuJYmCiVMOQCD9b+gGGJCS+Gvg292tS5q4PDWsibTkkwI
 C1MelUrMiiYgrtNxy+RUzMJ2NYNKyZyabqxM11oqDC8ycTdE2qw9mKZt3pbvQZFcvteK
 fAViHmpOjqdVV2JcPrsaY1XmT+FLYKNqZPesj2vditHFC7SFiAzJdkPxuU+q3/JCDZk+
 cLPMdwAuPCoIHw9cld2ddAvvheIyheJO+6jJ/pI1ytQ3K+s/vIbEaIl4186CR6gqspZp
 G5Ks7GFEn6xl65HDWnbvzYtTduwR1vOLbJNmUE5dQFWfiK0tar6wkTeiMoxCXaeuywE9
 kUCQ==
X-Gm-Message-State: AOAM533nHqiDMRyXrKuIjtuGwHbSigpKOajODINb0dzWWGChfVk+G7XZ
 2GSUL+8qQ/zM38fBYoBggqztfN415c4=
X-Google-Smtp-Source: ABdhPJzWKocZMPhw3t5VEokOjJwf9KuPQSGR3JgqR13o4xrBqpGbZyYOou3wP+GEte7t6dMLVwz5VA==
X-Received: by 2002:a17:902:eccb:b029:e3:b2e3:a21b with SMTP id
 a11-20020a170902eccbb02900e3b2e3a21bmr3149912plh.41.1614260895676; 
 Thu, 25 Feb 2021 05:48:15 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id a9sm5925868pjq.17.2021.02.25.05.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 05:48:15 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 21/37] powerpc: add set_dec_or_work API for safely updating
 decrementer
Date: Thu, 25 Feb 2021 23:46:36 +1000
Message-Id: <20210225134652.2127648-22-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210225134652.2127648-1-npiggin@gmail.com>
References: <20210225134652.2127648-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Decrementer updates must always check for new irq work to avoid an
irq work decrementer interrupt being lost.

Add an API for this in the timer code so callers don't have to care
about details.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/time.h |  9 +++++++++
 arch/powerpc/kernel/time.c      | 20 +++++++++++---------
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 0128cd9769bc..d62bde57bf02 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -78,6 +78,15 @@ static inline void set_dec(u64 val)
 		mtspr(SPRN_DEC, val - 1);
 }
 
+#ifdef CONFIG_IRQ_WORK
+void set_dec_or_work(u64 val);
+#else
+static inline void set_dec_or_work(u64 val)
+{
+	set_dec(val);
+}
+#endif
+
 static inline unsigned long tb_ticks_since(unsigned long tstamp)
 {
 	return mftb() - tstamp;
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index b67d93a609a2..e35156858e6e 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -561,6 +561,15 @@ void arch_irq_work_raise(void)
 	preempt_enable();
 }
 
+void set_dec_or_work(u64 val)
+{
+	set_dec(val);
+	/* We may have raced with new irq work */
+	if (unlikely(test_irq_work_pending()))
+		set_dec(1);
+}
+EXPORT_SYMBOL_GPL(set_dec_or_work);
+
 #else  /* CONFIG_IRQ_WORK */
 
 #define test_irq_work_pending()	0
@@ -628,10 +637,7 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
 	} else {
 		now = *next_tb - now;
 		if (now <= decrementer_max)
-			set_dec(now);
-		/* We may have raced with new irq work */
-		if (test_irq_work_pending())
-			set_dec(1);
+			set_dec_or_work(now);
 		__this_cpu_inc(irq_stat.timer_irqs_others);
 	}
 
@@ -873,11 +879,7 @@ static int decrementer_set_next_event(unsigned long evt,
 				      struct clock_event_device *dev)
 {
 	__this_cpu_write(decrementers_next_tb, get_tb() + evt);
-	set_dec(evt);
-
-	/* We may have raced with new irq work */
-	if (test_irq_work_pending())
-		set_dec(1);
+	set_dec_or_work(evt);
 
 	return 0;
 }
-- 
2.23.0

