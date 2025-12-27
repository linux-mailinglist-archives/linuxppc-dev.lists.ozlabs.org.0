Return-Path: <linuxppc-dev+bounces-15025-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4008CE02AB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Dec 2025 23:38:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ddy7H3tFLz2yFW;
	Sun, 28 Dec 2025 09:38:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.68
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766837908;
	cv=none; b=JkqFo1fI+HOPKKNsBgwq7OgcznVb6aRioHLlYNPJR9GmKk3E5eXVB7I4wZiFMhfJr7dIskkVjIu7lwnctMis1yF9a3DU2McrSANX9QgrMUbvjIOcUj3ywx9GhuzaVKcVcPGPbzsijxPMOPflRCSC5krdWC8MjQWzKvM/XyGZA4pY7rvd/2j4JoLrvNWADeAoshWrjhHwhQtzrmRFswT9QKEpq/Ge1cUn0AH+kLwg9fLwoIQLNHo06H9FsyOLQG8zph1dvSc5KCAAeynr4LxPp1dcvZtytI3phT4UsCvyjttS6dPip1EkHYFKekWIGnwbibWWtJMvdm8CFWrXqiDRbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766837908; c=relaxed/relaxed;
	bh=l5BRw7RvrfQfP/K6gt0hDAa/lWwGnQ3AR1h1gaT2J0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uw0eTVEdQXHPSPVjfGwLociB3+Ped/dUjRaqKM6lepBMIMOOF/EQM7gilQzMnp/Epcyd+hKByvbg31DKUp9wzl7E9NIkvdE7JMPoDdxiAmlcfJX/nP+mBwmjTDfTb998J4kKf/qlNf/dxiRrPzMz2JuED1YskPplRf2K89X16AU0EM+t86WNXZLIrSXLePnbdvfZgb8V0ngIF0A9DUdixEz3bAQTRIw1uzp0Og6Kp6n2TI/rMB8fu5cXloStjoSbcslFlAnIeY87UX+uZVdTKGh2XcbOspnD6fbewhSfTkCor2ZjSejOssUGPguLjDTmDsFWoq87lPuA2JgU6As95Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gzzU8YLY; dkim-atps=neutral; spf=pass (client-ip=209.85.128.68; helo=mail-wm1-f68.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gzzU8YLY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.128.68; helo=mail-wm1-f68.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ddhN33NFzz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 23:18:27 +1100 (AEDT)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso25748165e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 04:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837844; x=1767442644; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5BRw7RvrfQfP/K6gt0hDAa/lWwGnQ3AR1h1gaT2J0c=;
        b=gzzU8YLY98ZKWeSu6QS8vHLTOXjEPjuwliQlEexeEDw+eONnHwlGFxafpHe/k3vmNU
         MZSLXLOW8NILEASBHkz872hgrLV0I97YaOvBqZ2hX5vuHV7VqYOfl1DuxJim8XgWlqNM
         ZZtETKIuQsXW4qNcBpheweqOQ+edi7uCkKC7uc3FfMhjqj367kubVoNdisFU7A8+I8yH
         MXDEGCbjB4zxmjk5hYUUxg5yCnvmyWEkbUOMsxWuTFuodwHiXLBfL9Vzku7GVUJJySUz
         F2xcZCDW33dLIy4FhvABgtQQduDwJkM0rrZ8sJ1jUjrt8DkSjBeRx7+J0xernjLS8I3g
         2uiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837844; x=1767442644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l5BRw7RvrfQfP/K6gt0hDAa/lWwGnQ3AR1h1gaT2J0c=;
        b=d3ppsvjFq+GZMlzgqx1n9fKMnlgZb8jVKTeYlzKPziKnirkKXJAMF22yoEliYw//OY
         hCXpQgiluRSwdH+eBP1fpXPJJkEbXhUMV7S7ByU2hLA4sf6HeJucu8dGx6oPj/al/7da
         rk/p7iWcW8CnBqMob79uBazq4uVFVGciZahMxASIJyIBevppZ6+Cfga9meICpkZhpvK+
         3GvjAl/Fvm8zNQE3RUNmcGVobncU7cyFAb6dBiQLqxDCxYCCL7h74Ew6KotOL5sPWfr7
         E5APtIQH36eCurpQMg9Gh+eY+WGR/uQaU4UzdfTIJWMiJ88M2H7PFAe5ggq19Z04ag6r
         c8ug==
X-Forwarded-Encrypted: i=1; AJvYcCW+LHaB66IkbKULmwwBpDi8D5/b215NoB249bYVz6ftW6ENf2/q5PLvFQjsOP4wGiK0KgOzST4gd1e/B+I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwSpGZDomuzThbRujRqM2qDs9Mw++Hyh0trWtHT3pyqZi/4bEuM
	VW3vPyen9ozpl9aJ/Mr2sLvHtl47UTP5qNOlijdWaxb30C8ntSrfajim/S9td0NHKSo=
X-Gm-Gg: AY/fxX6PT5I7av91oX62yRhEM/tnu7FPyl9xIXlqQK4ZeXnf30FrdSf3TdV0c1NAraz
	OJIwXPXNDzUJtgY7ezFfuovWTsfgXtNCQkSPtF+zwI5h7a3iLywQGbpL86+L02FWhZP2R1RIS4k
	FdGyL9E+Z6WRg7QSQXtv4gi5uHbN30EVaxj01HlO1opHD7t3nWIiSYixiL4gXKzMKde91YBSoGT
	cM6bQ500gU+sD2T6EiOZLyD//rgqWZig+wDizKRIvp3xiI71aPtLI7DWKUOLDMxrLNg+9p9+FiC
	6jhxIp2/+QgcUzJtRZKb7/gW5qcYcwzLZZJAH43RqcvRuWhWdLJ8ABdpcdxvxvNouJMiJ4JwDVk
	JaxSpypb+DGAvc9/YEzUW2jrsQos9toXgLZbP6loC7q3H52RWn6hSF4ZwDZmvI2mpEA01Ha9gKI
	bg9VK7TZbw
X-Google-Smtp-Source: AGHT+IFB/Fm/BbhF4rdbmVdiGzUqk88gX/08HvStcaIXA3100u27BggsIM2y0GxgIqiLG/N+dnbC3Q==
X-Received: by 2002:a05:600c:4f52:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-47d1958a5d5mr344953125e9.22.1766837844304;
        Sat, 27 Dec 2025 04:17:24 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:17:23 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:11 -0300
Subject: [PATCH 04/19] printk: Reintroduce consoles_suspended global state
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-printk-cleanup-part3-v1-4-21a291bcf197@suse.com>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
In-Reply-To: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
To: Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jason Wessel <jason.wessel@windriver.com>, 
 Daniel Thompson <danielt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Andreas Larsson <andreas@gaisler.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org, 
 netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 sparclinux@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
 Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=7960;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=lE/1DIYMabiYcINvDQN+J482ZjUVJCV7RenaBaf63GU=;
 b=0Nm1rVm8usUyQfc8Y8VdqZ5lSxqrxogghCnWlBop68h2x3eX8wvULmkNK1yqxgDQDAsr7NT2A
 16smAUrBtylBcdO0yBiCQkV9TDNRTRX47nnARx+C0eR1hFzoRnJz2MU
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This change partially reverts commit 9e70a5e109a4
("printk: Add per-console suspended state"). The intent of the original
commit was to move the management of the console suspended state to the
consoles themselves to be able to use SRCU instead of console lock.

But having a global state is still useful when checking if the global
suspend was triggered by power management. This way, instead of setting
the state of each individual console, the code would only set/read from the
global state.

Along with this change, two more fixes are necessary: change
console_{suspend,resume} to set/clear CON_SUSPEND instead of setting
CON_ENABLED and change show_cons_active to call __console_is_usable to
check console usefulness.

Link: https://lore.kernel.org/lkml/844j4lepak.fsf@jogness.linutronix.de/
Signed-off-by: Petr Mladek <pmladek@suse.com>
[mpdesouza@suse.com: Adapted code related to console_is_usable]
Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 drivers/tty/tty_io.c    |  6 +++---
 include/linux/console.h | 53 +++++++++++++++++++++++++++++++++++++++++++++++--
 kernel/printk/printk.c  | 23 +++++++++++----------
 3 files changed, 67 insertions(+), 15 deletions(-)

diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index e2d92cf70eb7..7d2bded75b75 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -3552,9 +3552,9 @@ static ssize_t show_cons_active(struct device *dev,
 	for_each_console(c) {
 		if (!c->device)
 			continue;
-		if (!(c->flags & CON_NBCON) && !c->write)
-			continue;
-		if ((c->flags & CON_ENABLED) == 0)
+		if (!__console_is_usable(c, c->flags,
+					 consoles_suspended,
+					 NBCON_USE_ANY))
 			continue;
 		cs[i++] = c;
 		if (i >= ARRAY_SIZE(cs))
diff --git a/include/linux/console.h b/include/linux/console.h
index 648cf10e3f93..caf9b0951129 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -509,6 +509,7 @@ extern void console_list_lock(void) __acquires(console_mutex);
 extern void console_list_unlock(void) __releases(console_mutex);
 
 extern struct hlist_head console_list;
+extern bool consoles_suspended;
 
 /**
  * console_srcu_read_flags - Locklessly read flags of a possibly registered
@@ -561,6 +562,47 @@ static inline void console_srcu_write_flags(struct console *con, short flags)
 	WRITE_ONCE(con->flags, flags);
 }
 
+/**
+ * consoles_suspended_srcu_read - Locklessly read the global flag for
+ *				suspending all consoles.
+ *
+ * The global "consoles_suspended" flag is synchronized using console_list_lock
+ * and console_srcu_read_lock. It is the same approach as CON_SUSPENDED flag.
+ * See console_srcu_read_flags() for more details.
+ *
+ * Context: Any context.
+ * Return: The current value of the global "consoles_suspended" flag.
+ */
+static inline bool consoles_suspended_srcu_read(void)
+{
+	WARN_ON_ONCE(!console_srcu_read_lock_is_held());
+
+	/*
+	 * The READ_ONCE() matches the WRITE_ONCE() when "consoles_suspended"
+	 * is modified with consoles_suspended_srcu_write().
+	 */
+	return data_race(READ_ONCE(consoles_suspended));
+}
+
+/**
+ * consoles_suspended_srcu_write - Write the global flag for suspending
+ *			all consoles.
+ * @suspend:	new value to write
+ *
+ * The write must be done under the console_list_lock. The caller is responsible
+ * for calling synchronize_srcu() to make sure that all callers checking the
+ * usablility of registered consoles see the new state.
+ *
+ * Context: Any context.
+ */
+static inline void consoles_suspended_srcu_write(bool suspend)
+{
+	lockdep_assert_console_list_lock_held();
+
+	/* This matches the READ_ONCE() in consoles_suspended_srcu_read(). */
+	WRITE_ONCE(consoles_suspended, suspend);
+}
+
 /**
  * console_srcu_is_nbcon - Locklessly check whether the console is nbcon
  * @con:	struct console pointer of console to check
@@ -658,8 +700,12 @@ extern void nbcon_kdb_release(struct nbcon_write_context *wctxt);
 
 /* Variant of console_is_usable() when the console_list_lock is held. */
 static inline bool __console_is_usable(struct console *con, short flags,
-				     enum nbcon_write_cb nwc)
+				       bool all_suspended,
+				       enum nbcon_write_cb nwc)
 {
+	if (all_suspended)
+		return false;
+
 	if (!(flags & CON_ENABLED))
 		return false;
 
@@ -711,7 +757,9 @@ static inline bool __console_is_usable(struct console *con, short flags,
 static inline bool console_is_usable(struct console *con,
 				     enum nbcon_write_cb nwc)
 {
-	return __console_is_usable(con, console_srcu_read_flags(con), nwc);
+	return __console_is_usable(con, console_srcu_read_flags(con),
+				   consoles_suspended_srcu_read(),
+				   nwc);
 }
 
 #else
@@ -727,6 +775,7 @@ static inline bool nbcon_kdb_try_acquire(struct console *con,
 					 struct nbcon_write_context *wctxt) { return false; }
 static inline void nbcon_kdb_release(struct nbcon_write_context *wctxt) { }
 static inline bool __console_is_usable(struct console *con, short flags,
+				       bool all_suspended,
 				       enum nbcon_write_cb nwc) { return false; }
 static inline bool console_is_usable(struct console *con,
 				     enum nbcon_write_cb nwc) { return false; }
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index b03ffc23c27c..173c14e08afe 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -104,6 +104,13 @@ DEFINE_STATIC_SRCU(console_srcu);
  */
 int __read_mostly suppress_printk;
 
+/*
+ * Global flag for calling down all consoles during suspend.
+ * There is also a per-console flag which is used when the related
+ * device HW gets disabled, see CON_SUSPEND.
+ */
+bool consoles_suspended;
+
 #ifdef CONFIG_LOCKDEP
 static struct lockdep_map console_lock_dep_map = {
 	.name = "console_lock"
@@ -2731,8 +2738,6 @@ MODULE_PARM_DESC(console_no_auto_verbose, "Disable console loglevel raise to hig
  */
 void console_suspend_all(void)
 {
-	struct console *con;
-
 	if (console_suspend_enabled)
 		pr_info("Suspending console(s) (use no_console_suspend to debug)\n");
 
@@ -2749,8 +2754,7 @@ void console_suspend_all(void)
 		return;
 
 	console_list_lock();
-	for_each_console(con)
-		console_srcu_write_flags(con, con->flags | CON_SUSPENDED);
+	consoles_suspended_srcu_write(true);
 	console_list_unlock();
 
 	/*
@@ -2765,7 +2769,6 @@ void console_suspend_all(void)
 void console_resume_all(void)
 {
 	struct console_flush_type ft;
-	struct console *con;
 
 	/*
 	 * Allow queueing irq_work. After restoring console state, deferred
@@ -2776,8 +2779,7 @@ void console_resume_all(void)
 
 	if (console_suspend_enabled) {
 		console_list_lock();
-		for_each_console(con)
-			console_srcu_write_flags(con, con->flags & ~CON_SUSPENDED);
+		consoles_suspended_srcu_write(false);
 		console_list_unlock();
 
 		/*
@@ -3557,7 +3559,7 @@ void console_suspend(struct console *console)
 {
 	__pr_flush(console, 1000, true);
 	console_list_lock();
-	console_srcu_write_flags(console, console->flags & ~CON_ENABLED);
+	console_srcu_write_flags(console, console->flags | CON_SUSPENDED);
 	console_list_unlock();
 
 	/*
@@ -3576,7 +3578,7 @@ void console_resume(struct console *console)
 	bool is_nbcon;
 
 	console_list_lock();
-	console_srcu_write_flags(console, console->flags | CON_ENABLED);
+	console_srcu_write_flags(console, console->flags & ~CON_SUSPENDED);
 	is_nbcon = console->flags & CON_NBCON;
 	console_list_unlock();
 
@@ -4200,7 +4202,8 @@ static int unregister_console_locked(struct console *console)
 
 	if (!console_is_registered_locked(console))
 		res = -ENODEV;
-	else if (__console_is_usable(console, console->flags, NBCON_USE_ATOMIC))
+	else if (__console_is_usable(console, console->flags,
+				     consoles_suspended, NBCON_USE_ATOMIC))
 		__pr_flush(console, 1000, true);
 
 	/* Disable it unconditionally */

-- 
2.52.0


