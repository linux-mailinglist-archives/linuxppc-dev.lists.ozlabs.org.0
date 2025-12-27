Return-Path: <linuxppc-dev+bounces-15030-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9B7CE02BA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Dec 2025 23:39:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ddy8F0g9sz2yKn;
	Sun, 28 Dec 2025 09:39:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766837926;
	cv=none; b=JLhdhSm7bBkWptNf8/Tdw839MPpgyTiEHqNFxH7+bULlkjpPAh8yJX5gYCwX2jD6P3QtlsVOQWcvZYYyOFqgluuExN5UCb79j9/ghADMgUCdNUpZ1otTshSIr89f+4hsbrfhRKg/PaU2ZOlg9+wkJecCJb6xHmD0vmtbf+iFzrlVD4LtWtZUUtWTrmtxCRBgT+znoiXvAQuYqV7gINkUdBekhFzHdpxnNhEkFckEOfEwstn2S+3YaPjcHGeq3LoYX1IasobH7ftkI9HfQBynzv6rMjO8M7YPs9YtDiH39QzvXE/SbuNtNnns2G9P8+O9HXlxYjRLR4tCQVIigOkY3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766837926; c=relaxed/relaxed;
	bh=8qC0U4cjRdxCF4b/YJbgVpXPFvwbnk17NoVL2cOfc8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mpeXbuyJdzDJxzuQPghfJdBhWfRjoKKIcUbJst1PSsasy/ZPEd7h6h4+jbReEw0v6fQsCuUT+dEL9yIJRAYnaH1vlRtCwwbD9iIUNivpjlaaL9WYFHrmPkyM82XcaaUiiGLHS0m2EZ5BK9RnM//sbzNDXRvW7z01kvdUal7ylc0WdyfK3BoJesASq28n5yae2EGaef8UDhpoiTx6OEaF8NGH/CyPjP2XrjxocQNbQ5e0UApcjOeLL/CuM4BdE3KK9yy0BoOnbJX1buWz4KWH7s80GMmPemMPizSxMXZsjpz4GhkVjutjPvSpvFicR7xpPox3wK9ccyPiXYWJ5dnrpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aw+e+OC2; dkim-atps=neutral; spf=pass (client-ip=209.85.128.46; helo=mail-wm1-f46.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aw+e+OC2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.128.46; helo=mail-wm1-f46.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ddhNP549Dz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 23:18:45 +1100 (AEDT)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47774d3536dso61933925e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 04:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837863; x=1767442663; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qC0U4cjRdxCF4b/YJbgVpXPFvwbnk17NoVL2cOfc8A=;
        b=aw+e+OC2+O7hRzxtA0nY2N7T6KNNcRtrIwyUI7pMgvjF8RpM0AKgDv/t89TkVI/X9R
         jpRVNRG95X2z/oxsOIp8ETALlBurKd1JZYVxXzojVbDA3XezDHGCz/Q7dO2oVVRB9eib
         tAzXMDBzSHu42ybyY83GXjdN3pDtCt0rPKI1ksjU5gulZUxHstuzRG1qx4YKQwq1Lit4
         15MikegroNTYC/+05l7SnLKxhPtUTfrCWRFB+9ki4DfEsRFaJGOfHtLD+1dNxsSXl35s
         y2tUwT5WlB2SA8EXIbcG21sYaZ1BNtojdzrjjb3cHU9y/Y72Mc83MZTzcKnZO1IV79nf
         sKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837863; x=1767442663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8qC0U4cjRdxCF4b/YJbgVpXPFvwbnk17NoVL2cOfc8A=;
        b=Vlqs1l+uCVYw3yaC38Hk7nHSQVyslytkxJjODbrCpwJl71JnvX+ngnrwSj57KcnGZv
         /b5D42QRTDtaZOAou8hNcJL4EXrJuOgvOweGg3ylKnHaSTXT40pn5S00rtvoEOBwqEdK
         9HJp0gosyET9Li/ohqZUZ54tiZZdTVkM3cKSvYHAm3aXv7Fi4moHlf4nEtIcPANh/3xM
         wX4Bb1p/qAbliDsyFtqx26y/O32TonliVAMaVbUsWlYV+lStiQuztc6niSrXGm78UxqT
         quXYDzFcGzOcFTYdU0xjndoicEG1qqZ2pB4LcpZa3VQv6oZXpS/ksJkAyHTvUHStYnVR
         ++FA==
X-Forwarded-Encrypted: i=1; AJvYcCUjjZEAoNmFmm4JI7SYd4qwtEAk/kk3/tvzKHApbL3NxNTVO55MJZM8AsZn+OCXV9LkIFswjYmb8sW63zg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyHam77q5u/c3GenTa9T3KarZrWZgRIvxHy6tnhlvNlTnJSfStn
	g5ze6wtgMSshQWJHz6YfU983ELDaFx9Pxy8XlhjPyvvhgJ0NO3WgVgrZGuf1f0j+UAU=
X-Gm-Gg: AY/fxX6EJY1zryRAkENgOrQmxFC3VH3R566wBhdfqw/lld6OiLXrYLcv1NyJcThIhZX
	/9SioNs1nwQV4Cz3Lzf9zeGWXauMl0iUZuD4YZPXhLkOgXl1U8Ta1NCzhZH61Vt/UyFNqt4tES3
	VGQy89muO7xXBNA6IwTGQEWiqCC59UZZSFWHHTYTQHc9TjqOEdRsZ18rAMbzrUBqT3gxrUEIG/A
	nIt2YHboB/6yPOH7HGXUmSqkFZMLY3Sd0KYFZyJSLTuXQzKvbvGFHj3qoyQ5DecT4+7cLouYbgF
	X0ZTq1o1v/rM8mPqWKqzMWXDCWz93faTtNLcuO9di289uvdCV/Z/tJ7lT+n23WLIfx6yfjGhkFu
	FZZUP7xtPATQkqD3hZGvXJNNd/jTQufYf3qkmzOBQ1OkJgxk6ccvd9XYETxakaLQUt5JmBRw3PY
	tvFmQ6cNQGM/CKvfI7zLk=
X-Google-Smtp-Source: AGHT+IG9JI4KghQQLO4JoQ5Zx3PCxaurUWQYnoyI9pepg6l828D4iHu4xsQcwAkRrVG/7RHQ7XMpOg==
X-Received: by 2002:a05:600c:3397:b0:475:d91d:28fb with SMTP id 5b1f17b1804b1-47be2999657mr224830455e9.4.1766837862676;
        Sat, 27 Dec 2025 04:17:42 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:17:42 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:13 -0300
Subject: [PATCH 06/19] printk: Introduce register_console_force
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
Message-Id: <20251227-printk-cleanup-part3-v1-6-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=5702;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=yZ/nvvnmmkaNmxpD4iXjZtoziYkh4kvSpXf/WZXovX8=;
 b=Bzarxjf3B7CuE6yunxTz81Z6xrtzP/oSyuvyRHrm78aAxtHdfrdz9xczyh+zQMNScnR1tQowx
 BZmWRp2B3qfBQ9NUKyPZEo6SC7UASze6iocMjN2ThffW7UbTy1hRyur
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The register_console_force function will register a console even if it
wasn't specified on boot. The new function will act like all consoles
being registered were using the CON_ENABLED flag.

The CON_ENABLED flag will be removed in the following patches and the
drivers that use it will migrate to register_console_force instead.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 include/linux/console.h |  1 +
 kernel/printk/printk.c  | 65 ++++++++++++++++++++++++++++++++-----------------
 2 files changed, 43 insertions(+), 23 deletions(-)

diff --git a/include/linux/console.h b/include/linux/console.h
index caf9b0951129..7d374a29a625 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -792,6 +792,7 @@ enum con_flush_mode {
 extern int add_preferred_console(const char *name, const short idx, char *options);
 extern void console_force_preferred_locked(struct console *con);
 extern void register_console(struct console *);
+extern void register_console_force(struct console *c);
 extern int unregister_console(struct console *);
 extern void console_lock(void);
 extern int console_trylock(void);
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 85a8b6521d9e..c5c05e4d0a67 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3858,7 +3858,7 @@ static int console_call_setup(struct console *newcon, char *options)
  * enabled such as netconsole
  */
 static int try_enable_preferred_console(struct console *newcon,
-					bool user_specified)
+					bool user_specified, bool force)
 {
 	struct console_cmdline *c;
 	int i, err;
@@ -3896,12 +3896,15 @@ static int try_enable_preferred_console(struct console *newcon,
 		return 0;
 	}
 
+	if (force)
+		newcon->flags |= CON_ENABLED;
+
 	/*
 	 * Some consoles, such as pstore and netconsole, can be enabled even
 	 * without matching. Accept the pre-enabled consoles only when match()
 	 * and setup() had a chance to be called.
 	 */
-	if (newcon->flags & CON_ENABLED && c->user_specified ==	user_specified)
+	if (newcon->flags & CON_ENABLED && c->user_specified == user_specified)
 		return 0;
 
 	return -ENOENT;
@@ -4001,26 +4004,11 @@ static u64 get_init_console_seq(struct console *newcon, bool bootcon_registered)
 
 static int unregister_console_locked(struct console *console);
 
-/*
- * The console driver calls this routine during kernel initialization
- * to register the console printing procedure with printk() and to
- * print any messages that were printed by the kernel before the
- * console driver was initialized.
- *
- * This can happen pretty early during the boot process (because of
- * early_printk) - sometimes before setup_arch() completes - be careful
- * of what kernel features are used - they may not be initialised yet.
- *
- * There are two types of consoles - bootconsoles (early_printk) and
- * "real" consoles (everything which is not a bootconsole) which are
- * handled differently.
- *  - Any number of bootconsoles can be registered at any time.
- *  - As soon as a "real" console is registered, all bootconsoles
- *    will be unregistered automatically.
- *  - Once a "real" console is registered, any attempt to register a
- *    bootconsoles will be rejected
+/**
+ * __register_console: Register a new console
+ * @force: Register the console even if not specified on boot
  */
-void register_console(struct console *newcon)
+static void __register_console(struct console *newcon, bool force)
 {
 	bool use_device_lock = (newcon->flags & CON_NBCON) && newcon->write_atomic;
 	bool bootcon_registered = false;
@@ -4080,11 +4068,11 @@ void register_console(struct console *newcon)
 	}
 
 	/* See if this console matches one we selected on the command line */
-	err = try_enable_preferred_console(newcon, true);
+	err = try_enable_preferred_console(newcon, true, force);
 
 	/* If not, try to match against the platform default(s) */
 	if (err == -ENOENT)
-		err = try_enable_preferred_console(newcon, false);
+		err = try_enable_preferred_console(newcon, false, force);
 
 	/* printk() messages are not printed to the Braille console. */
 	if (err || newcon->flags & CON_BRL) {
@@ -4185,8 +4173,39 @@ void register_console(struct console *newcon)
 unlock:
 	console_list_unlock();
 }
+
+/*
+ * The console driver calls this routine during kernel initialization
+ * to register the console printing procedure with printk() and to
+ * print any messages that were printed by the kernel before the
+ * console driver was initialized.
+ *
+ * This can happen pretty early during the boot process (because of
+ * early_printk) - sometimes before setup_arch() completes - be careful
+ * of what kernel features are used - they may not be initialised yet.
+ *
+ * There are two types of consoles - bootconsoles (early_printk) and
+ * "real" consoles (everything which is not a bootconsole) which are
+ * handled differently.
+ *  - Any number of bootconsoles can be registered at any time.
+ *  - As soon as a "real" console is registered, all bootconsoles
+ *    will be unregistered automatically.
+ *  - Once a "real" console is registered, any attempt to register a
+ *    bootconsoles will be rejected
+ */
+void register_console(struct console *newcon)
+{
+	__register_console(newcon, false);
+}
 EXPORT_SYMBOL(register_console);
 
+
+void register_console_force(struct console *newcon)
+{
+	__register_console(newcon, true);
+}
+EXPORT_SYMBOL(register_console_force);
+
 /* Must be called under console_list_lock(). */
 static int unregister_console_locked(struct console *console)
 {

-- 
2.52.0


