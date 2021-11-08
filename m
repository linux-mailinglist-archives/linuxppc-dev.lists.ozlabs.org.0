Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F556447755
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 01:50:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HnXZy4QBqz3cYb
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 11:50:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YiFp3f8c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12f;
 helo=mail-lf1-x12f.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YiFp3f8c; dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HnXXD0l0pz2xBL
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Nov 2021 11:47:55 +1100 (AEDT)
Received: by mail-lf1-x12f.google.com with SMTP id z19so9508304lfd.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Nov 2021 16:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hKe22x9bX8JCg83Zw5KeGH71BwPAfgMBPhF5RAtnzGg=;
 b=YiFp3f8cO0Vr3HYEcxvLKaCWrUmOHjq9yYYfO7Hqun88GeI6p81d1YMIv5GgLPP+/N
 Guy8nu7oxvAy0q0qyx/9QoEA0c9N6JQOaCaMNwxlZE6n+rBzRQ6S6brhC7L4R5ueVD0E
 0lqXczvgEtFMk6LXqffce13U4i49V4j0Kn57zFVgpRaTjAduIVdOq617jQwEaVBHy3Eu
 EQ4A8/OrH6y5w2erSbQwCOheLeexVl/UouL8csnR+WVhns+gkFS6M2gvrwiPdoODOchq
 4d0z7ZZ7OBQsZoGbZI8N0S5/yiMmZKJMmdifL+HN3VdALCAmD2XTwM4PqgkUlLwGX6XG
 rgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hKe22x9bX8JCg83Zw5KeGH71BwPAfgMBPhF5RAtnzGg=;
 b=msMljwUPbCQja3eAgpBmsT4nJbMd7lw6LOj65d9HyHtKn+A6fDXOplAdyaf7pYoXiH
 138kyqzXe1Ia/RqvRSCIPXKcqGgecNMOyWMZoBxY+E+YKuVb0DQBx0V3PErjiNCv7EZU
 hv+6IxcQ1jYxNoeuG8bVSKkmtvxt7Wa2wP0tqLE1a8uCm3dn+I6qBVbubpxqPPIIzxnH
 wXwXkUiVf6sJhnoDqGikWCqgEETNW/SLi2mD7fe3dqxmdljJgYtkvnKZLRhs3wzzTDi7
 PqfO5LpXWr68eBg9qjR4kRa7NhogD5NhYKzse+bB2j/gqdo/2OS/AWTpgBjNOC/vT6h9
 E40A==
X-Gm-Message-State: AOAM5328GYLtQ46llWIf4T6x6DlVG7sLYm1eQhJS8Oj0U/wNfGQ+Tm0q
 lmGzVyxXZrgzKS/8N6xNpTk=
X-Google-Smtp-Source: ABdhPJw/Jh+Tn85DS/9xfc19zQpYugwW2GCD3r9uHKbGfYK5lzV64P71fIEm1/wTYHhDjmsq/VCY5Q==
X-Received: by 2002:ac2:4e6b:: with SMTP id y11mr70299237lfs.439.1636332472632; 
 Sun, 07 Nov 2021 16:47:52 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru.
 [79.139.188.96])
 by smtp.gmail.com with ESMTPSA id p17sm1625266lfu.209.2021.11.07.16.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 16:47:52 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v3 03/25] notifier: Add
 atomic/blocking_notifier_has_unique_priority()
Date: Mon,  8 Nov 2021 03:45:02 +0300
Message-Id: <20211108004524.29465-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108004524.29465-1-digetx@gmail.com>
References: <20211108004524.29465-1-digetx@gmail.com>
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
Cc: linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add atomic/blocking_notifier_has_unique_priority() helpers which return
true if given handler has unique priority.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/notifier.h |  5 +++
 kernel/notifier.c        | 69 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/include/linux/notifier.h b/include/linux/notifier.h
index 924c9d7c8e73..2c4036f225e1 100644
--- a/include/linux/notifier.h
+++ b/include/linux/notifier.h
@@ -175,6 +175,11 @@ int raw_notifier_call_chain_robust(struct raw_notifier_head *nh,
 
 bool blocking_notifier_call_chain_is_empty(struct blocking_notifier_head *nh);
 
+bool atomic_notifier_has_unique_priority(struct atomic_notifier_head *nh,
+		struct notifier_block *nb);
+bool blocking_notifier_has_unique_priority(struct blocking_notifier_head *nh,
+		struct notifier_block *nb);
+
 #define NOTIFY_DONE		0x0000		/* Don't care */
 #define NOTIFY_OK		0x0001		/* Suits me */
 #define NOTIFY_STOP_MASK	0x8000		/* Don't call further */
diff --git a/kernel/notifier.c b/kernel/notifier.c
index b20cb7b9b1f0..7a325b742104 100644
--- a/kernel/notifier.c
+++ b/kernel/notifier.c
@@ -122,6 +122,19 @@ static int notifier_call_chain_robust(struct notifier_block **nl,
 	return ret;
 }
 
+static int notifier_has_unique_priority(struct notifier_block **nl,
+					struct notifier_block *n)
+{
+	while (*nl && (*nl)->priority >= n->priority) {
+		if ((*nl)->priority == n->priority && *nl != n)
+			return false;
+
+		nl = &((*nl)->next);
+	}
+
+	return true;
+}
+
 /*
  *	Atomic notifier chain routines.  Registration and unregistration
  *	use a spinlock, and call_chain is synchronized by RCU (no locks).
@@ -203,6 +216,30 @@ int atomic_notifier_call_chain(struct atomic_notifier_head *nh,
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
+	unsigned long flags;
+	bool ret;
+
+	spin_lock_irqsave(&nh->lock, flags);
+	ret = notifier_has_unique_priority(&nh->head, n);
+	spin_unlock_irqrestore(&nh->lock, flags);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(atomic_notifier_has_unique_priority);
+
 /*
  *	Blocking notifier chain routines.  All access to the chain is
  *	synchronized by an rwsem.
@@ -336,6 +373,38 @@ bool blocking_notifier_call_chain_is_empty(struct blocking_notifier_head *nh)
 }
 EXPORT_SYMBOL_GPL(blocking_notifier_call_chain_is_empty);
 
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
+	bool ret;
+
+	/*
+	 * This code gets used during boot-up, when task switching is
+	 * not yet working and interrupts must remain disabled. At such
+	 * times we must not call down_read().
+	 */
+	if (system_state != SYSTEM_BOOTING)
+		down_read(&nh->rwsem);
+
+	ret = notifier_has_unique_priority(&nh->head, n);
+
+	if (system_state != SYSTEM_BOOTING)
+		up_read(&nh->rwsem);
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

