Return-Path: <linuxppc-dev+bounces-15041-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A51CE02DB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Dec 2025 23:40:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ddy9w48cXz2yGQ;
	Sun, 28 Dec 2025 09:40:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766838047;
	cv=none; b=L86p1qkRN+X95m/ggT3WQv+kh89KpXgmICmKg3SbNcJk6XGthosJhZvkfj18ylhiygJ94mzvyN5YBNBaIVCuOzLmAoRGR1nB3lGaszUuoW6dWo5fA6IFVR/pGLNonCPUySI+HJMeDzgmskqtjiAiJi/XbbO+UEYKecns61S4AmXZzpHcXcLRabkYdV3Ghl26xoI3SpN3Fs5MqAQraRsx++9R6FdWtbiCH6lBm5oS6PZBJ6O0QcJkxwKGsmKKmiFIYSqlAA5XXwPkidzu5BTHX8iigVVMkzdmfHHjjK6j2C2NN/Z3s/a1KXnI3DaPkXZ3rEBEoByAkcYUb0U4Nx+qnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766838047; c=relaxed/relaxed;
	bh=xV/54pzRS8Etay7a+DmZn75b0ho6rdI/NPswC/OMCoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M0Zl5PpQ5HghTIDUNAjbE8Rm473lV/SvBytAm+FVcj79cQrhgmrCzrzerkIgeLEjSA1dlPNHKzVpn2Zz9e0gAN7ftXK5Xq0bOIMPmUXF0RIgdcduaY5gbEp1b+EhwXAv6VkoqO6XHjRCldW+fhSjMi5nZVZaXTo6c3YGxUIPN3Q1NUZ6j/1/fpq56kBlSCsJ584XiZOyBqGlYv8iVX+ytjFsFIixckJH7chfdWDcHuMJDxAPx7rF9bZ51dR7EBSxADbzbiafNqxtJm2W/oO6CePqIsGJXnZJ4qq14KRwelssKMmbSxZyVBOZM8y7PUU9b7cfd2qc9RnSmsJeiSm9YQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MXXxZXLb; dkim-atps=neutral; spf=pass (client-ip=209.85.128.41; helo=mail-wm1-f41.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MXXxZXLb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.128.41; helo=mail-wm1-f41.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ddhQk1flZz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 23:20:46 +1100 (AEDT)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so46309405e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 04:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837983; x=1767442783; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xV/54pzRS8Etay7a+DmZn75b0ho6rdI/NPswC/OMCoI=;
        b=MXXxZXLbvyCxe4TRBWJoqImMM92D+3QSd69z5j+wbutkZea4b5BoUfPv2ZyAZclMOL
         UYOZgNSbBRfGFQ/WbMICUrS0Ek72dYix+Wm1N3flQR0eq1XXD0O/C6gXzhelgACzkKkS
         WHRffo9RmsqVxlmtsD+toB8b+FpW39Ag4b2zu700Pm+HPOu4ESbWmENgHeAipqaglCpT
         F6VSlvAPgPwxMqSXkZU5xzOquLrSb3kdoLm3a4y09N/Rr3siL13k6jVJbXjnAiSnL9oF
         16uxrsbJnpFhfwbHaSzWU9czSaRoyzJBXEPwHqGSu4g/DTK6c7fMcRSoBHdgloS7xFun
         rMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837983; x=1767442783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xV/54pzRS8Etay7a+DmZn75b0ho6rdI/NPswC/OMCoI=;
        b=JkxiIdWR7YCTysu6pgTLXC/hkXBY3nXtOkCM0fHsyd2Y2XwtAR28sWhG4Su3MTdILo
         L4eib47jkJ7RHbZnxs78sltN1d5/4q39nasJ4UkYej62Bhz816y1IzMNtGNfYaG30R6N
         FV6Z282ykNMikEQlcq+oGaqJCKPFiVW4uEtXqgowR6ZQJF31B0z/clG/TwI1LFl81Bbf
         akCacq2zALgWWAz0+2hZMFDb68YUjZsEVwVYNLbj9kRkxt5rrK31PrAIP8j1utIC5Nze
         5vv4S+YXk58vh3hvyPZPw/XM32CLyXXkOIqmWhax9HY81lTmdelxfc7Wf8pr2Af3nq+A
         nU9w==
X-Forwarded-Encrypted: i=1; AJvYcCXgPN63JEfg0XMpJ+5a2d4LoO2EJNJFRS1E3CQ2do3RZ7cIvYKZR+2D/51lGbdznqqR5AdeUTJraQE3E9A=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxfKMej78dAO1ikxhCeDFaXoza5CLN2MSETaCjp52vzpRMnE5ZP
	zNukbnCuJPyY/GYScH2mgh5KMoYyY2FlMqdQGVCuqGYn50QcIZ3CJoMKn2PvnK96uJ0=
X-Gm-Gg: AY/fxX7uS5c+DMta3ZmwnvqwuY5MKhQ5P43hqxYonVVVKChO3eWsAv2rXQvVTqTqiEk
	igFDOq9LOW3amaiCS9zTVpxspJHsU2oPwdsxHZxRRT9eWOB70LFo+Cs0yUGqYLjgUko6wmziXzj
	zjg61zTQi1uZOH4EUW1jk4YApXEFDSi/mL3O33c3lNFOREcsMZMEkgLuoEEgFjzYhraLrGHGHZF
	YOeXASzwmye9dlLY/1Hu35oFQUvzY/5sGYfznTpCkJpMXnvvfjX9NrEeJQ9ubCEqv6hbUusD210
	QUHnNh7jcrbp+Wz8MtKDyLKpTZU9Euu017BWNVPmyfvMelzJzmZ4Watdcp/2J1p8bblGfzO7RF+
	S/fHwvYe9L8pggepbTdn2znc1fh+cXkRWDGnz/GT+5PBH/SVuPv0CNHU5e/M5l7n6PLtT1XUCV5
	LDof0joz3voyc+5nc0cVE=
X-Google-Smtp-Source: AGHT+IH8iMWTGKOo0ODMODi1rEzmJGgWpFcndwFU+BLf6Q6Oiy3SLl7fhkZeY72om2wNWMGGrFeTWQ==
X-Received: by 2002:a05:600d:8:b0:477:5897:a0c4 with SMTP id 5b1f17b1804b1-47d1c13fcfdmr225764485e9.4.1766837983269;
        Sat, 27 Dec 2025 04:19:43 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:19:42 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:26 -0300
Subject: [PATCH 19/19] printk: Remove CON_ENABLED flag
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
Message-Id: <20251227-printk-cleanup-part3-v1-19-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=5342;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=jfxXivsE45EkgkvCbI8I2BEVFtLSwL83e0mmBVPuH+w=;
 b=L4bmhgBbhK4MabaljXOFYoWoPA/F2Ms1Hw5KRZJ0wiLbS51oCxDTE2j2nmUG21whYB1lNSvfW
 KXB3PChlBf2AMEmTwaAmskLdw1SadRBF3zXvV826sJWL27JOeadfagz
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

All remaining usages of CON_ENABLED were removed from console drivers
that were being registered without being specified on boot using console=
argument.

The usefulness of the flag was questionable since at first it meant that
the console was ready to print records. Later on, console drivers started
to set the flag when registering the console to make sure that the
console would be registered even without being specified by a kernel
argument.

With the inclusion a global state for system wide suspend/resume
in place, with console_{suspend,resume} handling CON_SUSPEND, and with
console_is_usable helper being more used, the CON_ENABLED flag can be
safely removed.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 fs/proc/consoles.c      |  1 -
 include/linux/console.h | 27 ++++++++++-----------------
 kernel/printk/printk.c  | 15 ++-------------
 3 files changed, 12 insertions(+), 31 deletions(-)

diff --git a/fs/proc/consoles.c b/fs/proc/consoles.c
index b7cab1ad990d..b6916ed7957b 100644
--- a/fs/proc/consoles.c
+++ b/fs/proc/consoles.c
@@ -18,7 +18,6 @@ static int show_console_dev(struct seq_file *m, void *v)
 		short flag;
 		char name;
 	} con_flags[] = {
-		{ CON_ENABLED,		'E' },
 		{ CON_CONSDEV,		'C' },
 		{ CON_BOOT,		'B' },
 		{ CON_NBCON,		'N' },
diff --git a/include/linux/console.h b/include/linux/console.h
index 7d374a29a625..0ab02f7ba307 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -164,9 +164,6 @@ static inline void con_debug_leave(void) { }
  *			consoles or read by userspace via syslog() syscall.
  * @CON_CONSDEV:	Indicates that the console driver is backing
  *			/dev/console.
- * @CON_ENABLED:	Indicates if a console is allowed to print records. If
- *			false, the console also will not advance to later
- *			records.
  * @CON_BOOT:		Marks the console driver as early console driver which
  *			is used during boot before the real driver becomes
  *			available. It will be automatically unregistered
@@ -192,14 +189,13 @@ static inline void con_debug_leave(void) { }
 enum cons_flags {
 	CON_PRINTBUFFER		= BIT(0),
 	CON_CONSDEV		= BIT(1),
-	CON_ENABLED		= BIT(2),
-	CON_BOOT		= BIT(3),
-	CON_ANYTIME		= BIT(4),
-	CON_BRL			= BIT(5),
-	CON_EXTENDED		= BIT(6),
-	CON_SUSPENDED		= BIT(7),
-	CON_NBCON		= BIT(8),
-	CON_NBCON_ATOMIC_UNSAFE	= BIT(9),
+	CON_BOOT		= BIT(2),
+	CON_ANYTIME		= BIT(3),
+	CON_BRL			= BIT(4),
+	CON_EXTENDED		= BIT(5),
+	CON_SUSPENDED		= BIT(6),
+	CON_NBCON		= BIT(7),
+	CON_NBCON_ATOMIC_UNSAFE	= BIT(8),
 };
 
 /**
@@ -522,9 +518,9 @@ extern bool consoles_suspended;
  *
  * Requires console_srcu_read_lock to be held, which implies that @con might
  * be a registered console. The purpose of holding console_srcu_read_lock is
- * to guarantee that the console state is valid (CON_SUSPENDED/CON_ENABLED)
- * and that no exit/cleanup routines will run if the console is currently
- * undergoing unregistration.
+ * to guarantee that the console state is valid (CON_SUSPENDED) and that no
+ * exit/cleanup routines will run if the console is currently undergoing
+ * unregistration.
  *
  * If the caller is holding the console_list_lock or it is _certain_ that
  * @con is not and will not become registered, the caller may read
@@ -706,9 +702,6 @@ static inline bool __console_is_usable(struct console *con, short flags,
 	if (all_suspended)
 		return false;
 
-	if (!(flags & CON_ENABLED))
-		return false;
-
 	if ((flags & CON_SUSPENDED))
 		return false;
 
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index c5c05e4d0a67..9cb0911997e5 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3890,21 +3890,17 @@ static int try_enable_preferred_console(struct console *newcon,
 			if (err)
 				return err;
 		}
-		newcon->flags |= CON_ENABLED;
 		if (i == preferred_console)
 			newcon->flags |= CON_CONSDEV;
 		return 0;
 	}
 
-	if (force)
-		newcon->flags |= CON_ENABLED;
-
 	/*
 	 * Some consoles, such as pstore and netconsole, can be enabled even
 	 * without matching. Accept the pre-enabled consoles only when match()
 	 * and setup() had a chance to be called.
 	 */
-	if (newcon->flags & CON_ENABLED && c->user_specified == user_specified)
+	if (force && c->user_specified == user_specified)
 		return 0;
 
 	return -ENOENT;
@@ -3919,8 +3915,6 @@ static void try_enable_default_console(struct console *newcon)
 	if (console_call_setup(newcon, NULL) != 0)
 		return;
 
-	newcon->flags |= CON_ENABLED;
-
 	if (newcon->device)
 		newcon->flags |= CON_CONSDEV;
 }
@@ -3977,10 +3971,8 @@ static u64 get_init_console_seq(struct console *newcon, bool bootcon_registered)
 				for_each_console(con) {
 					u64 seq;
 
-					if (!(con->flags & CON_BOOT) ||
-					    !(con->flags & CON_ENABLED)) {
+					if (!(con->flags & CON_BOOT))
 						continue;
-					}
 
 					if (con->flags & CON_NBCON)
 						seq = nbcon_seq_read(con);
@@ -4233,9 +4225,6 @@ static int unregister_console_locked(struct console *console)
 				     consoles_suspended, NBCON_USE_ATOMIC))
 		__pr_flush(console, 1000, true);
 
-	/* Disable it unconditionally */
-	console_srcu_write_flags(console, console->flags & ~CON_ENABLED);
-
 	if (res < 0)
 		return res;
 

-- 
2.52.0


