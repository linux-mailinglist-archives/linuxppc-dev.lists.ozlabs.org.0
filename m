Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D9543D702
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 00:57:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfkbQ2z8tz3dvw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 09:57:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PqCG395L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22f;
 helo=mail-lj1-x22f.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PqCG395L; dkim-atps=neutral
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfhPH2xmvz2xsy;
 Thu, 28 Oct 2021 08:18:11 +1100 (AEDT)
Received: by mail-lj1-x22f.google.com with SMTP id l2so6983935lji.6;
 Wed, 27 Oct 2021 14:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fMubR/4yBWUsww90rEyWY4dQ/XIE0qHuvtbXYbD4Pcs=;
 b=PqCG395LcNV60Qtp9Eu+DTDleDk9S+RpTfMF0TfPgeQNI7so50v1YaWYDZEm91iiCp
 stqqT31Aw/f237mfaJZBez2KJOlBBu7yQ98GuPbn0Fd6OHOrOUOIxbGKQzyeoEhI5d7U
 MaBsKPUXg/EUUv+aX6yG0KDR/rz5MnoalTZ2EQX7cxTfGCEi5fn/e2tAfWVQjz7cx+Cl
 FA6SmHKqY94Xx88iXkSj3vwZ5v8NluykZ6pHT7wJbq5dzQ3vU6x4mnoyEhNfbPxeYtlB
 xjgt4J5kOapwcnmeYf3Jiro9Ajf5AzXtfbVfgy9Vs0NcvOiCK5vS43vmXx4Ff0yYTgVu
 NUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fMubR/4yBWUsww90rEyWY4dQ/XIE0qHuvtbXYbD4Pcs=;
 b=QEKW7/V9C0dXH8oA33h4f+F+LrAtbpR3PpM7ZahOGaZmzpZyvCqmwGJwJJI8HzMzmu
 1c9sXo0OW5DO456fsxsrR5r4fRqCFYF1os9y6ZKczXy5SZRUr69YKB1F/f+elZKjokvT
 Go39ySolEsir1KR/WL/JaluPCBLNFtgji+rlTIJzlK7ka482LArJbudcq0bBM8uaIO89
 LNBS0WH5mI95Fx3NUPtt2YkLIdKGBnFY4Myf97ZFnARTtLUEKgCKRbud3E0WRqa7uRXf
 PBVrvPyK/IFauJlGKtP7MnV5XgXGQnJFutwkCcezQJLnAhKrOJww2jzKFPbhrGPkSKA8
 5kOw==
X-Gm-Message-State: AOAM530ClpkZfavAxBCHuoxcl3sQSaCahmiT5SVQmbP9gD9oW9iusnmW
 YbqZAcLMhI4MY2rbZ7lTP2Y=
X-Google-Smtp-Source: ABdhPJx+Js0me0cUAXGk9csOUj0IQmbpvMK95ONWvTRhfCm5GVYebrAN8Mns/32HOctyWJz6JrEWGw==
X-Received: by 2002:a2e:b701:: with SMTP id j1mr325708ljo.133.1635369487617;
 Wed, 27 Oct 2021 14:18:07 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:07 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v2 08/45] kernel: Add combined power-off+restart handler call
 chain API
Date: Thu, 28 Oct 2021 00:16:38 +0300
Message-Id: <20211027211715.12671-9-digetx@gmail.com>
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

SoC platforms often have multiple options of how to perform system's
power-off and restart operations. Meanwhile today's kernel is limited to
a single option. Add combined power-off+restart handler call chain API,
which is inspired by the restart API. The new API provides both power-off
and restart functionality.

The old pm_power_off method will be kept around till all users are
converted to the new API.

Current restart API will be replaced by the new unified API since
new API is its superset. The restart functionality of the power-handler
API is built upon the existing restart-notifier APIs.

In order to ease conversion to the new API, convenient helpers are added
for the common use-cases. They will reduce amount of boilerplate code and
remove global variables. These helpers preserve old behaviour for cases
where only one power-off handler is executed, this is what existing
drivers want, and thus, they could be easily converted to the new API.
Users of the new API should explicitly enable power-off chaining by
setting corresponding flag of the power_handler structure.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/reboot.h   | 176 +++++++++++-
 kernel/power/hibernate.c |   2 +-
 kernel/reboot.c          | 601 ++++++++++++++++++++++++++++++++++++++-
 3 files changed, 768 insertions(+), 11 deletions(-)

diff --git a/include/linux/reboot.h b/include/linux/reboot.h
index b7fa25726323..0ec835338c27 100644
--- a/include/linux/reboot.h
+++ b/include/linux/reboot.h
@@ -8,10 +8,16 @@
 
 struct device;
 
-#define SYS_DOWN	0x0001	/* Notify of system down */
-#define SYS_RESTART	SYS_DOWN
-#define SYS_HALT	0x0002	/* Notify of system halt */
-#define SYS_POWER_OFF	0x0003	/* Notify of system power off */
+enum reboot_prepare_mode {
+	SYS_DOWN = 1,		/* Notify of system down */
+	SYS_RESTART = SYS_DOWN,
+	SYS_HALT,		/* Notify of system halt */
+	SYS_POWER_OFF,		/* Notify of system power off */
+};
+
+#define RESTART_PRIO_RESERVED		0
+#define RESTART_PRIO_DEFAULT		128
+#define RESTART_PRIO_HIGH		192
 
 enum reboot_mode {
 	REBOOT_UNDEFINED = -1,
@@ -49,6 +55,167 @@ int register_restart_handler(struct notifier_block *);
 int unregister_restart_handler(struct notifier_block *);
 void do_kernel_restart(char *cmd);
 
+/*
+ * Unified poweroff + restart API.
+ */
+
+#define POWEROFF_PRIO_RESERVED		0
+#define POWEROFF_PRIO_PLATFORM		1
+#define POWEROFF_PRIO_DEFAULT		128
+#define POWEROFF_PRIO_HIGH		192
+#define POWEROFF_PRIO_FIRMWARE		224
+
+enum poweroff_mode {
+	POWEROFF_NORMAL = 0,
+	POWEROFF_PREPARE,
+};
+
+struct power_off_data {
+	void *cb_data;
+};
+
+struct power_off_prep_data {
+	void *cb_data;
+};
+
+struct restart_data {
+	void *cb_data;
+	const char *cmd;
+	enum reboot_mode mode;
+};
+
+struct reboot_prep_data {
+	void *cb_data;
+	const char *cmd;
+	enum reboot_prepare_mode mode;
+};
+
+struct power_handler_private_data {
+	struct notifier_block reboot_prep_nb;
+	struct notifier_block power_off_nb;
+	struct notifier_block restart_nb;
+	void (*trivial_power_off_cb)(void);
+	void (*simple_power_off_cb)(void *data);
+	void *simple_power_off_cb_data;
+	bool registered;
+};
+
+/**
+ * struct power_handler - Machine power-off + restart handler
+ *
+ * Describes power-off and restart handlers which are invoked by kernel
+ * to power off or restart this machine.  Supports prioritized chaining for
+ * both restart and power-off handlers.  Callback's priority must be unique.
+ * Intended to be used by device drivers that are responsible for restarting
+ * and powering off hardware which kernel is running on.
+ *
+ * Struct power_handler can be static.  Members of this structure must not be
+ * altered while handler is registered.
+ *
+ * Fill the structure members and pass it to register_power_handler().
+ */
+struct power_handler {
+	/**
+	 * @cb_data:
+	 *
+	 * User data included in callback's argument.
+	 */
+	void *cb_data;
+
+	/**
+	 * @power_off_cb:
+	 *
+	 * Callback that should turn off machine.  Inactive if NULL.
+	 */
+	void (*power_off_cb)(struct power_off_data *data);
+
+	/**
+	 * @power_off_prepare_cb:
+	 *
+	 * Power-off preparation callback.  All power-off preparation callbacks
+	 * are invoked before @restart_cb.  Inactive if NULL.
+	 */
+	void (*power_off_prepare_cb)(struct power_off_prep_data *data);
+
+	/**
+	 * @power_off_priority:
+	 *
+	 * Power-off callback priority, must be unique.  Zero value is
+	 * reassigned to default priority.  Inactive if @power_off_cb is NULL.
+	 */
+	int power_off_priority;
+
+	/**
+	 * @power_off_chaining_allowed:
+	 *
+	 * False if callbacks execution should stop when @power_off_cb fails
+	 * to power off machine.  True if further lower priority power-off
+	 * callback should be executed.
+	 */
+	bool power_off_chaining_allowed;
+
+	/**
+	 * @restart_cb:
+	 *
+	 * Callback that should reboot machine.  Inactive if NULL.
+	 */
+	void (*restart_cb)(struct restart_data *data);
+
+	/**
+	 * @restart_priority:
+	 *
+	 * Restart callback priority, must be unique.  Zero value is reassigned
+	 * to default priority.  Inactive if @restart_cb is NULL.
+	 */
+	int restart_priority;
+
+	/**
+	 * @reboot_prepare_cb:
+	 *
+	 * Reboot preparation callback.  All reboot preparation callbacks are
+	 * invoked before @restart_cb.  Inactive if NULL.
+	 */
+	void (*reboot_prepare_cb)(struct reboot_prep_data *data);
+
+	/**
+	 * @priv:
+	 *
+	 * Internal data.  Shouldn't be touched.
+	 */
+	const struct power_handler_private_data priv;
+};
+
+int register_power_handler(struct power_handler *handler);
+void unregister_power_handler(struct power_handler *handler);
+
+struct power_handler *
+register_simple_power_off_handler(void (*callback)(void *data), void *data);
+
+void unregister_simple_power_off_handler(struct power_handler *handler);
+
+int devm_register_power_handler(struct device *dev,
+				struct power_handler *handler);
+
+int devm_register_simple_power_off_handler(struct device *dev,
+					   void (*callback)(void *data),
+					   void *data);
+
+int devm_register_trivial_power_off_handler(struct device *dev,
+					    void (*callback)(void));
+
+int devm_register_simple_restart_handler(struct device *dev,
+					 void (*callback)(struct restart_data *data),
+					 void *data);
+
+int devm_register_prioritized_restart_handler(struct device *dev,
+					      int priority,
+					      void (*callback)(struct restart_data *data),
+					      void *data);
+
+int register_platform_power_off(void (*power_off)(void));
+
+void do_kernel_power_off(void);
+
 /*
  * Architecture-specific implementations of sys_reboot commands.
  */
@@ -70,6 +237,7 @@ void kernel_restart_prepare(char *cmd);
 void kernel_restart(char *cmd);
 void kernel_halt(void);
 void kernel_power_off(void);
+bool kernel_can_power_off(void);
 
 extern int C_A_D; /* for sysctl */
 void ctrl_alt_del(void);
diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index 559acef3fddb..13ad98352fde 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -664,7 +664,7 @@ static void power_down(void)
 		hibernation_platform_enter();
 		fallthrough;
 	case HIBERNATION_SHUTDOWN:
-		if (pm_power_off)
+		if (kernel_can_power_off())
 			kernel_power_off();
 		break;
 	}
diff --git a/kernel/reboot.c b/kernel/reboot.c
index 291d44082f42..779429726616 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -189,9 +189,8 @@ int register_restart_handler(struct notifier_block *nb)
 		return ret;
 
 	/*
-	 * Handler must have unique priority. Otherwise invocation order is
-	 * determined by the registration order, which is presumed to be
-	 * unreliable.
+	 * Handler must have unique priority. Otherwise call order is
+	 * determined by registration order, which is unreliable.
 	 */
 	WARN_ON(!atomic_notifier_has_unique_priority(&restart_handler_list, nb));
 
@@ -294,6 +293,587 @@ void kernel_halt(void)
 }
 EXPORT_SYMBOL_GPL(kernel_halt);
 
+/*
+ *	Notifier list for kernel code which wants to be called
+ *	to power off the system.
+ */
+static BLOCKING_NOTIFIER_HEAD(power_off_handler_list);
+
+static void dummy_pm_power_off(void)
+{
+	/* temporary stub until pm_power_off() is gone, see more below */
+}
+
+static struct notifier_block *pm_power_off_nb;
+
+/**
+ *	register_power_off_handler - Register function to be called to power off
+ *				     the system
+ *	@nb: Info about handler function to be called
+ *	@nb->priority:	Handler priority. Handlers should follow the
+ *			following guidelines for setting priorities.
+ *			0:	Power-off handler of last resort,
+ *				with limited power-off capabilities
+ *			128:	Default power-off handler; use if no other
+ *				power-off handler is expected to be available,
+ *				and/or if power-off functionality is
+ *				sufficient to power-off the entire system
+ *			255:	Highest priority power-off handler, will
+ *				preempt all other power-off handlers
+ *
+ *	Registers a function with code to be called to power off the
+ *	system.
+ *
+ *	Registered functions will be called as last step of the power-off
+ *	sequence.
+ *
+ *	Registered functions are expected to power off the system immediately.
+ *	If more than one function is registered, the power-off handler priority
+ *	selects which function will be called first.
+ *
+ *	Power-off handlers are expected to be registered from non-architecture
+ *	code, typically from drivers. A typical use case would be a system
+ *	where power-off functionality is provided through a PMIC. Multiple
+ *	power-off handlers may exist; for example, one power-off handler might
+ *	turn off the entire system, while another only turns off part of
+ *	system. In such cases, the power-off handler which only disables part
+ *	of the hardware is expected to register with low priority to ensure
+ *	that it only runs if no other means to power off the system is
+ *	available.
+ *
+ *	Currently always returns zero, as blocking_notifier_chain_register()
+ *	always returns zero.
+ */
+static int register_power_off_handler(struct notifier_block *nb)
+{
+	int ret;
+
+	ret = blocking_notifier_chain_register(&power_off_handler_list, nb);
+	if (ret)
+		return ret;
+
+	/*
+	 * Handler must have unique priority. Otherwise invocation order is
+	 * determined by the registration order, which is presumed to be
+	 * unreliable.
+	 */
+	WARN_ON(!blocking_notifier_has_unique_priority(&power_off_handler_list, nb));
+
+	/*
+	 * Some drivers check whether pm_power_off was already installed.
+	 * Install dummy callback using new API to preserve old behaviour
+	 * for those drivers during period of transition to the new API.
+	 */
+	if (!pm_power_off) {
+		pm_power_off = dummy_pm_power_off;
+		pm_power_off_nb = nb;
+	}
+
+	return 0;
+}
+
+static void unregister_power_off_handler(struct notifier_block *nb)
+{
+	if (nb == pm_power_off_nb) {
+		/*
+		 * Check whether somebody replaced pm_power_off behind
+		 * out back.
+		 */
+		if (!WARN_ON(pm_power_off != dummy_pm_power_off))
+			pm_power_off = NULL;
+
+		pm_power_off_nb = NULL;
+	}
+
+	WARN_ON(blocking_notifier_chain_unregister(&power_off_handler_list, nb));
+}
+
+static void devm_unregister_power_off_handler(void *data)
+{
+	struct notifier_block *nb = data;
+
+	unregister_power_off_handler(nb);
+}
+
+static int devm_register_power_off_handler(struct device *dev,
+					   struct notifier_block *nb)
+{
+	int err;
+
+	err = register_power_off_handler(nb);
+	if (err)
+		return err;
+
+	return devm_add_action_or_reset(dev, devm_unregister_power_off_handler,
+					nb);
+}
+
+static int power_handler_power_off(struct notifier_block *nb,
+				   unsigned long mode, void *unused)
+{
+	struct power_off_prep_data prep_data = {};
+	struct power_handler_private_data *priv;
+	struct power_off_data data = {};
+	struct power_handler *h;
+	int ret = NOTIFY_DONE;
+
+	priv = container_of(nb, struct power_handler_private_data, power_off_nb);
+	h = container_of(priv, struct power_handler, priv);
+	prep_data.cb_data = h->cb_data;
+	data.cb_data = h->cb_data;
+
+	switch (mode) {
+	case POWEROFF_NORMAL:
+		if (h->power_off_cb)
+			h->power_off_cb(&data);
+
+		if (priv->simple_power_off_cb)
+			priv->simple_power_off_cb(priv->simple_power_off_cb_data);
+
+		if (priv->trivial_power_off_cb)
+			priv->trivial_power_off_cb();
+
+		if (!h->power_off_chaining_allowed)
+			ret = NOTIFY_STOP;
+
+		break;
+
+	case POWEROFF_PREPARE:
+		if (h->power_off_prepare_cb)
+			h->power_off_prepare_cb(&prep_data);
+
+		break;
+
+	default:
+		unreachable();
+	}
+
+	return ret;
+}
+
+static int power_handler_restart(struct notifier_block *nb,
+				 unsigned long mode, void *cmd)
+{
+	struct power_handler_private_data *priv;
+	struct restart_data data = {};
+	struct power_handler *h;
+
+	priv = container_of(nb, struct power_handler_private_data, restart_nb);
+	h = container_of(priv, struct power_handler, priv);
+
+	data.cb_data = h->cb_data;
+	data.mode = mode;
+	data.cmd = cmd;
+
+	h->restart_cb(&data);
+
+	return NOTIFY_DONE;
+}
+
+static int power_handler_restart_prep(struct notifier_block *nb,
+				      unsigned long mode, void *cmd)
+{
+	struct power_handler_private_data *priv;
+	struct reboot_prep_data data = {};
+	struct power_handler *h;
+
+	priv = container_of(nb, struct power_handler_private_data, reboot_prep_nb);
+	h = container_of(priv, struct power_handler, priv);
+
+	data.cb_data = h->cb_data;
+	data.mode = mode;
+	data.cmd = cmd;
+
+	h->reboot_prepare_cb(&data);
+
+	return NOTIFY_DONE;
+}
+
+static struct power_handler_private_data *
+power_handler_private_data(struct power_handler *handler)
+{
+	return (struct power_handler_private_data *)&handler->priv;
+}
+
+/**
+ *	devm_register_power_handler - Register power handler
+ *	@dev: Device that registers handler
+ *	@handler: Power handler descriptor
+ *
+ *	Registers power handler that will be called as last step of the
+ *	power-off and restart sequences.
+ *
+ *	Returns zero on success, or error code on failure.
+ */
+int register_power_handler(struct power_handler *handler)
+{
+	struct power_handler_private_data *priv = power_handler_private_data(handler);
+	int err, priority;
+
+	/* sanity-check whether handler is registered twice */
+	if (WARN_ON(priv->registered))
+		return -EBUSY;
+
+	if (handler->power_off_cb || handler->power_off_prepare_cb) {
+		if (handler->power_off_priority == POWEROFF_PRIO_RESERVED)
+			priority = POWEROFF_PRIO_DEFAULT;
+		else
+			priority = handler->power_off_priority;
+
+		priv->power_off_nb.notifier_call = power_handler_power_off;
+		priv->power_off_nb.priority = priority;
+
+		err = register_power_off_handler(&priv->power_off_nb);
+		if (err)
+			goto reset_power_handler;
+	}
+
+	if (handler->restart_cb) {
+		if (handler->restart_priority == RESTART_PRIO_RESERVED)
+			priority = RESTART_PRIO_DEFAULT;
+		else
+			priority = handler->restart_priority;
+
+		priv->restart_nb.notifier_call = power_handler_restart;
+		priv->restart_nb.priority = priority;
+
+		err = register_restart_handler(&priv->restart_nb);
+		if (err)
+			goto unreg_power_off_handler;
+	}
+
+	if (handler->reboot_prepare_cb) {
+		priv->reboot_prep_nb.notifier_call = power_handler_restart_prep;
+		priv->reboot_prep_nb.priority = 0;
+
+		err = register_reboot_notifier(&priv->reboot_prep_nb);
+		if (err)
+			goto unreg_restart_handler;
+	}
+
+	priv->registered = true;
+
+	return 0;
+
+unreg_restart_handler:
+	if (handler->restart_cb)
+		unregister_restart_handler(&priv->restart_nb);
+
+unreg_power_off_handler:
+	if (handler->power_off_cb)
+		unregister_power_off_handler(&priv->power_off_nb);
+
+reset_power_handler:
+	memset(priv, 0, sizeof(*priv));
+
+	return err;
+}
+EXPORT_SYMBOL(register_power_handler);
+
+/**
+ *	unregister_power_handler - Unregister power handler
+ *	@handler: Power handler descriptor
+ *
+ *	Unregisters a previously registered power handler. Does nothing if
+ *	handler is NULL.
+ */
+void unregister_power_handler(struct power_handler *handler)
+{
+	struct power_handler_private_data *priv;
+
+	if (!handler)
+		return;
+
+	priv = power_handler_private_data(handler);
+
+	/* sanity-check whether handler is unregistered twice */
+	if (WARN_ON(!priv->registered))
+		return;
+
+	if (handler->reboot_prepare_cb)
+		unregister_reboot_notifier(&priv->reboot_prep_nb);
+
+	if (handler->restart_cb)
+		unregister_restart_handler(&priv->restart_nb);
+
+	if (handler->power_off_cb)
+		unregister_power_off_handler(&priv->power_off_nb);
+
+	memset(priv, 0, sizeof(*priv));
+}
+EXPORT_SYMBOL(unregister_power_handler);
+
+static void devm_unregister_power_handler(void *data)
+{
+	struct power_handler *handler = data;
+
+	unregister_power_handler(handler);
+}
+
+/**
+ *	devm_register_power_handler - Register power handler
+ *	@dev: Device that registers handler
+ *	@handler: Power handler descriptor
+ *
+ *	Resource-managed variant of register_power_handler();
+ *
+ *	Returns zero on success, or error code on failure.
+ */
+int devm_register_power_handler(struct device *dev,
+				struct power_handler *handler)
+{
+	int err;
+
+	err = register_power_handler(handler);
+	if (err)
+		return err;
+
+	return devm_add_action_or_reset(dev, devm_unregister_power_handler,
+					handler);
+}
+EXPORT_SYMBOL(devm_register_power_handler);
+
+/**
+ *	register_simple_power_off_handler - Register simple power-off callback
+ *	@dev: Device that registers callback
+ *	@callback: Callback function
+ *	@data: Callback's argument
+ *
+ *	Registers power-off callback with default priority, it will be called
+ *	as last step of the power-off sequence.
+ *
+ *	Returns power_handler pointer on success, or ERR_PTR on failure.
+ */
+struct power_handler *
+register_simple_power_off_handler(void (*callback)(void *data), void *data)
+{
+	struct power_handler_private_data *priv;
+	struct power_handler *handler;
+	int err;
+
+	handler = kzalloc(sizeof(*handler), GFP_KERNEL);
+	if (!handler)
+		return ERR_PTR(-ENOMEM);
+
+	priv = power_handler_private_data(handler);
+
+	priv->power_off_nb.notifier_call = power_handler_power_off;
+	priv->power_off_nb.priority = POWEROFF_PRIO_DEFAULT;
+	priv->simple_power_off_cb_data = data;
+	priv->simple_power_off_cb = callback;
+
+	err = register_power_off_handler(&priv->power_off_nb);
+	if (err) {
+		kfree(handler);
+		return ERR_PTR(err);
+	}
+
+	return handler;
+}
+EXPORT_SYMBOL(register_simple_power_off_handler);
+
+/**
+ *	unregister_power_handler - Unregister simple power-off handler
+ *	@handler: Power handler descriptor
+ *
+ *	Unregisters power handler that was registered by
+ *	register_simple_power_off_handler(). Does nothing if handler is
+ *	error or NULL.
+ */
+void unregister_simple_power_off_handler(struct power_handler *handler)
+{
+	struct power_handler_private_data *priv;
+
+	if (!IS_ERR_OR_NULL(handler)) {
+		priv = power_handler_private_data(handler);
+		unregister_power_off_handler(&priv->power_off_nb);
+		kfree(handler);
+	}
+}
+EXPORT_SYMBOL(unregister_simple_power_off_handler);
+
+/**
+ *	devm_register_simple_power_off_handler - Register simple power-off callback
+ *	@dev: Device that registers callback
+ *	@callback: Callback function
+ *	@data: Callback's argument
+ *
+ *	Registers resource-managed power-off callback with default priority,
+ *	it will be called as last step of the power-off sequence. Further
+ *	lower priority callbacks won't be executed if this @callback fails.
+ *
+ *	Returns zero on success, or error code on failure.
+ */
+int devm_register_simple_power_off_handler(struct device *dev,
+					   void (*callback)(void *data),
+					   void *data)
+{
+	struct power_handler_private_data *priv;
+	struct power_handler *handler;
+
+	handler = devm_kzalloc(dev, sizeof(*handler), GFP_KERNEL);
+	if (!handler)
+		return -ENOMEM;
+
+	priv = power_handler_private_data(handler);
+
+	priv->power_off_nb.notifier_call = power_handler_power_off;
+	priv->power_off_nb.priority = POWEROFF_PRIO_DEFAULT;
+	priv->simple_power_off_cb_data = data;
+	priv->simple_power_off_cb = callback;
+
+	return devm_register_power_off_handler(dev, &priv->power_off_nb);
+}
+EXPORT_SYMBOL(devm_register_simple_power_off_handler);
+
+/**
+ *	devm_register_trivial_power_off_handler - Register trivial power-off callback
+ *	@dev: Device that registers callback
+ *	@desc: Callback descriptor
+ *
+ *	Same as devm_register_simple_power_off_handler(), but callback
+ *	doesn't take argument. Further lower priority callbacks won't be
+ *	executed if this @callback fails.
+ *
+ *	Returns zero on success, or error code on failure.
+ */
+int devm_register_trivial_power_off_handler(struct device *dev,
+					    void (*callback)(void))
+{
+	struct power_handler_private_data *priv;
+	struct power_handler *handler;
+
+	handler = devm_kzalloc(dev, sizeof(*handler), GFP_KERNEL);
+	if (!handler)
+		return -ENOMEM;
+
+	priv = power_handler_private_data(handler);
+
+	priv->power_off_nb.notifier_call = power_handler_power_off;
+	priv->power_off_nb.priority = POWEROFF_PRIO_DEFAULT;
+	priv->trivial_power_off_cb = callback;
+
+	return devm_register_power_off_handler(dev, &priv->power_off_nb);
+}
+EXPORT_SYMBOL(devm_register_trivial_power_off_handler);
+
+/**
+ *	devm_register_simple_restart_handler - Register simple restart callback
+ *	@dev: Device that registers callback
+ *	@callback: Callback function
+ *	@data: Callback's argument
+ *
+ *	Registers resource-managed restart callback with default priority,
+ *	it will be called as last step of the restart sequence.
+ *
+ *	Returns zero on success, or error code on failure.
+ */
+int devm_register_simple_restart_handler(struct device *dev,
+					 void (*callback)(struct restart_data *data),
+					 void *data)
+{
+	return devm_register_prioritized_restart_handler(dev,
+							 RESTART_PRIO_DEFAULT,
+							 callback, data);
+}
+EXPORT_SYMBOL(devm_register_simple_restart_handler);
+
+/**
+ *	devm_register_prioritized_restart_handler - Register prioritized restart callback
+ *	@dev: Device that registers callback
+ *	@priority: Callback's priority
+ *	@callback: Callback function
+ *	@data: Callback's argument
+ *
+ *	Registers resource-managed restart callback with a given priority,
+ *	it will be called as last step of the restart sequence.
+ *
+ *	Returns zero on success, or error code on failure.
+ */
+int devm_register_prioritized_restart_handler(struct device *dev,
+					      int priority,
+					      void (*callback)(struct restart_data *data),
+					      void *data)
+{
+	struct power_handler *handler;
+
+	handler = devm_kzalloc(dev, sizeof(*handler), GFP_KERNEL);
+	if (!handler)
+		return -ENOMEM;
+
+	handler->restart_priority = priority;
+	handler->restart_cb = callback;
+	handler->cb_data = data;
+
+	return devm_register_power_handler(dev, handler);
+}
+EXPORT_SYMBOL(devm_register_prioritized_restart_handler);
+
+static struct power_handler platform_power_off_handler = {
+	.priv = {
+		.power_off_nb = {
+			.notifier_call = power_handler_power_off,
+			.priority = POWEROFF_PRIO_PLATFORM,
+		},
+	},
+};
+
+/**
+ *	register_platform_power_off - Register platform-level power-off callback
+ *	@power_off: Power-off callback
+ *
+ *	Registers power-off callback that will be called as last step
+ *	of the power-off sequence. This callback is expected to be invoked
+ *	for the last resort. Further lower priority callbacks won't be
+ *	executed if @power_off fails. Only one platform power-off callback
+ *	is allowed to be registered.
+ *
+ *	Returns zero on success, or error code on failure.
+ */
+int register_platform_power_off(void (*power_off)(void))
+{
+	struct power_handler_private_data *priv;
+
+	/* this function is allowed to be called only once */
+	if (WARN_ON(platform_power_off_handler.priv.trivial_power_off_cb))
+		return -EBUSY;
+
+	priv = power_handler_private_data(&platform_power_off_handler);
+	priv->trivial_power_off_cb = power_off;
+
+	return register_power_off_handler(&priv->power_off_nb);
+}
+
+/**
+ *	do_kernel_power_off - Execute kernel power-off handler call chain
+ *
+ *	Calls functions registered with register_power_off_handler.
+ *
+ *	Expected to be called as last step of the power-off sequence.
+ *
+ *	Powers off the system immediately if a power-off handler function has
+ *	been registered. Otherwise does nothing.
+ */
+void do_kernel_power_off(void)
+{
+	/* legacy pm_power_off() is unchained and it has highest priority */
+	if (pm_power_off && pm_power_off != dummy_pm_power_off)
+		return pm_power_off();
+
+	blocking_notifier_call_chain(&power_off_handler_list, POWEROFF_NORMAL,
+				     NULL);
+}
+
+static void do_kernel_power_off_prepare(void)
+{
+	/* legacy pm_power_off_prepare() is unchained and it has highest priority */
+	if (pm_power_off_prepare)
+		return pm_power_off_prepare();
+
+	blocking_notifier_call_chain(&power_off_handler_list, POWEROFF_PREPARE,
+				     NULL);
+}
+
 /**
  *	kernel_power_off - power_off the system
  *
@@ -302,8 +882,7 @@ EXPORT_SYMBOL_GPL(kernel_halt);
 void kernel_power_off(void)
 {
 	kernel_shutdown_prepare(SYSTEM_POWER_OFF);
-	if (pm_power_off_prepare)
-		pm_power_off_prepare();
+	do_kernel_power_off_prepare();
 	migrate_to_reboot_cpu();
 	syscore_shutdown();
 	pr_emerg("Power down\n");
@@ -312,6 +891,16 @@ void kernel_power_off(void)
 }
 EXPORT_SYMBOL_GPL(kernel_power_off);
 
+bool kernel_can_power_off(void)
+{
+	if (!pm_power_off &&
+	    blocking_notifier_call_chain_empty(&power_off_handler_list))
+		return false;
+
+	return true;
+}
+EXPORT_SYMBOL_GPL(kernel_can_power_off);
+
 DEFINE_MUTEX(system_transition_mutex);
 
 /*
@@ -353,7 +942,7 @@ SYSCALL_DEFINE4(reboot, int, magic1, int, magic2, unsigned int, cmd,
 	/* Instead of trying to make the power_off code look like
 	 * halt when pm_power_off is not set do it the easy way.
 	 */
-	if ((cmd == LINUX_REBOOT_CMD_POWER_OFF) && !pm_power_off)
+	if (cmd == LINUX_REBOOT_CMD_POWER_OFF && !kernel_can_power_off())
 		cmd = LINUX_REBOOT_CMD_HALT;
 
 	mutex_lock(&system_transition_mutex);
-- 
2.33.1

