Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF54C43D6FB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 00:54:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfkWp3ckFz3dcs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 09:53:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IF53pE4M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::134;
 helo=mail-lf1-x134.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=IF53pE4M; dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfhP60r72z2xXs;
 Thu, 28 Oct 2021 08:18:01 +1100 (AEDT)
Received: by mail-lf1-x134.google.com with SMTP id c28so8884836lfv.13;
 Wed, 27 Oct 2021 14:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gfPQe0zgS4I4UWFZNFBbY1KeZFawP+pEpuBLVF6wdKM=;
 b=IF53pE4MG8dtqJfDztqJu8/A7a/y14/j36v2nKdiMw6iu4DWmrRW8MOeE8LURQLXaK
 Ga0+xYwPRFyxojC/znNrOvpLGs+k6KHlhVWadULFKWtX+mXFusF6mHh4CLs+vcnkJVbI
 sCT8nKeVlZGK2TnNZ10Uo/TFQPsaFWopDEGJma2V9OokstL1aGUJunbAvrHKFFxOtEwg
 lD8/h9mw7UJrhz8Lza29Xoci0CHBwnwZJdD56IRSRRGiIs4vKcta6w27872hpSmyCu02
 ZBL1gjD87s9mbzpJUGm1Sbte3r8qhTN12pgeySe/LAcZyKJ0wXtrJhOtFLQB3UvQJ2Q1
 ctBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gfPQe0zgS4I4UWFZNFBbY1KeZFawP+pEpuBLVF6wdKM=;
 b=L0eayf6bADtCaYBTykC/4ZBRBLuBDenp4fLraq41oRC97PGLCva/qA5OiaEj8PpYBS
 ICndm8dLgX39osnGieneaqhxg5vD/ul3zUE8BwzAa9xOSgqSYKegFL+CGAPRKS0bsPT7
 kKmrQcfDskrFGQt69hCuHkNAzOEg4ur+p1DUHmAK0piP6II7xogstnjgs2M/i++S9FwB
 FzQonO09EG1gn78qjMecBbId/qcMzO2IzPNnkVsLfhJZnGa/5kOw4ZLI30V1xfzPH2jB
 CQn0JaOHo+4iLi7UiTyP7O5R1zIphCdv3bV8Subicc5lgn/wqK3y93dMEXKyktgqlIlQ
 WbGQ==
X-Gm-Message-State: AOAM533vpdSjzdKdfxsv5/x/rhGZD9CX9cvy9dPKzQizrVEzkTZMKZvG
 bAwphunfIqDv1tRFxSnF55Y=
X-Google-Smtp-Source: ABdhPJxkIyEtMiQViKWR5fwy6fiT3tpzf12+F4/RJZJ4BQVHBt5yXcPBTwu2lq74yYNLjaS3GsmWQQ==
X-Received: by 2002:a05:6512:1095:: with SMTP id
 j21mr130850lfg.274.1635369478293; 
 Wed, 27 Oct 2021 14:17:58 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:17:57 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v2 03/45] notifier: Add
 atomic/blocking_notifier_has_unique_priority()
Date: Thu, 28 Oct 2021 00:16:33 +0300
Message-Id: <20211027211715.12671-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 28 Oct 2021 09:51:48 +1100
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Tomer Maimon <tmaimon77@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-sh@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-acpi@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Len Brown <lenb@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-pm@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-m68k@lists.linux-m68k.org,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org,
 Nancy Yuen <yuenn@google.com>, linux-arm-kernel@lists.infradead.org,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Nick Hu <nickhu@andestech.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Guo Ren <guoren@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add atomic/blocking_notifier_has_unique_priority() helpers which return
true if given handler has unique priority.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/notifier.h |  5 +++
 kernel/notifier.c        | 74 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/include/linux/notifier.h b/include/linux/notifier.h
index 054271e9cb20..b782ce100022 100644
--- a/include/linux/notifier.h
+++ b/include/linux/notifier.h
@@ -175,6 +175,11 @@ int raw_notifier_call_chain_robust(struct raw_notifier_head *nh,
 
 bool blocking_notifier_call_chain_empty(struct blocking_notifier_head *nh);
 
+bool atomic_notifier_has_unique_priority(struct atomic_notifier_head *nh,
+		struct notifier_block *nb);
+bool blocking_notifier_has_unique_priority(struct blocking_notifier_head *nh,
+		struct notifier_block *nb);
+
 #define NOTIFY_DONE		0x0000		/* Don't care */
 #define NOTIFY_OK		0x0001		/* Suits me */
 #define NOTIFY_STOP_MASK	0x8000		/* Don't call further */
diff --git a/kernel/notifier.c b/kernel/notifier.c
index 1f7ba8988b90..cf0e1c4bd364 100644
--- a/kernel/notifier.c
+++ b/kernel/notifier.c
@@ -203,6 +203,40 @@ int atomic_notifier_call_chain(struct atomic_notifier_head *nh,
 EXPORT_SYMBOL_GPL(atomic_notifier_call_chain);
 NOKPROBE_SYMBOL(atomic_notifier_call_chain);
 
+/**
+ *	atomic_notifier_has_unique_priority - Checks whether notifier's priority is unique
+ *	@nh: Pointer to head of the atomic notifier chain
+ *	@n: Entry in notifier chain to check
+ *
+ *	Checks whether there is another notifier in the chain with the same priority.
+ *	Must be called in process context.
+ *
+ *	Returns true if priority is unique, false otherwise.
+ */
+bool atomic_notifier_has_unique_priority(struct atomic_notifier_head *nh,
+		struct notifier_block *n)
+{
+	struct notifier_block **nl = &nh->head;
+	unsigned long flags;
+	bool ret = true;
+
+	spin_lock_irqsave(&nh->lock, flags);
+
+	while ((*nl) != NULL && (*nl)->priority >= n->priority) {
+		if ((*nl)->priority == n->priority && (*nl) != n) {
+			ret = false;
+			break;
+		}
+
+		nl = &((*nl)->next);
+	}
+
+	spin_unlock_irqrestore(&nh->lock, flags);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(atomic_notifier_has_unique_priority);
+
 /*
  *	Blocking notifier chain routines.  All access to the chain is
  *	synchronized by an rwsem.
@@ -336,6 +370,46 @@ bool blocking_notifier_call_chain_empty(struct blocking_notifier_head *nh)
 }
 EXPORT_SYMBOL_GPL(blocking_notifier_call_chain_empty);
 
+/**
+ *	blocking_notifier_has_unique_priority - Checks whether notifier's priority is unique
+ *	@nh: Pointer to head of the blocking notifier chain
+ *	@n: Entry in notifier chain to check
+ *
+ *	Checks whether there is another notifier in the chain with the same priority.
+ *	Must be called in process context.
+ *
+ *	Returns true if priority is unique, false otherwise.
+ */
+bool blocking_notifier_has_unique_priority(struct blocking_notifier_head *nh,
+		struct notifier_block *n)
+{
+	struct notifier_block **nl = &nh->head;
+	bool ret = true;
+
+	/*
+	 * This code gets used during boot-up, when task switching is
+	 * not yet working and interrupts must remain disabled.  At
+	 * such times we must not call down_write().
+	 */
+	if (system_state != SYSTEM_BOOTING)
+		down_write(&nh->rwsem);
+
+	while ((*nl) != NULL && (*nl)->priority >= n->priority) {
+		if ((*nl)->priority == n->priority && (*nl) != n) {
+			ret = false;
+			break;
+		}
+
+		nl = &((*nl)->next);
+	}
+
+	if (system_state != SYSTEM_BOOTING)
+		up_write(&nh->rwsem);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(blocking_notifier_has_unique_priority);
+
 /*
  *	Raw notifier chain routines.  There is no protection;
  *	the caller must provide it.  Use at your own risk!
-- 
2.33.1

