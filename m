Return-Path: <linuxppc-dev+bounces-15024-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE248CE02A8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Dec 2025 23:37:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ddy6g6ZkVz2yHB;
	Sun, 28 Dec 2025 09:37:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766837889;
	cv=none; b=X2pkPw/qUduVFWf/bNxtlXlcEAcsgZEKhSaL203PmAh6AVn1U5UQPPMMKnv3/w79Nq2UHGV2N/u6GO6azNNTj15W6Zz3jtll4XuybO4BpJbGN5r/3kOdSeBKlUMqG7VVGRxpRUrgkR+9+OojeYdgcvbREPNBbFHNJjuBgwVfjiY+5gYLUgLW/dhlp/pLeqpubE2e61KWuXUaH1YngiU3KYw19L7w++iJOHZLroKRO/q6Wsr9juI9R8GdcNjKH00v42Ky69HvFU8XHw43M0PnkUy947W6gkeC1lkhdDmXeoM2qYObxmbZKF346r/Ll5lTbGZximRRiQA/+oc1HBhEnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766837889; c=relaxed/relaxed;
	bh=rhFoe+/fNVQYtucZwNZBdpwy2GyzZc29S0jBT7dXZmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i4ZKvybrKlucSzHNaMYBBJn7iDmGNd+aBk1yzNHqR5vvojRmZ0NiPBWQdy5R3z3QIMh7j0GNnFzIIun947l3upcK90AC7ovz9pTjddtiA/6MMQKwTXmxxSwbmsWr/ErELVWYcYH0oq/ecLKOyFcCjGZplktj7fXNAF2vZbqjJGR11OFRKfJOGucQXGYo/mX/MGVO0RURxYDYS2EiwY++6JufuFM5PiQNFGbMotwHWYV1a0LoUc1edgemgdq5AvR+hmT+ryhbS5HqxTVAEcnQa6uzMri+OVrFOtOj+PnyxESCy7yK05D9+CiQljPwIVJ/ANpRLKcJV5GuES7ol76+kA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DERuz8Au; dkim-atps=neutral; spf=pass (client-ip=209.85.128.47; helo=mail-wm1-f47.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DERuz8Au;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.128.47; helo=mail-wm1-f47.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ddhMj0V67z2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 23:18:08 +1100 (AEDT)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so61961625e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 04:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837826; x=1767442626; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhFoe+/fNVQYtucZwNZBdpwy2GyzZc29S0jBT7dXZmU=;
        b=DERuz8AuUPRovzhW5xqJ8xpxNRb1b/hkchmJqGBgJP815FriTcPyrTln5rNfKcYb+A
         woN7jeotGFsikq7PQvJqOAtY44tFJiSH1UZRVxDkLbZ99AzGH+0u1Hb0oI8QK3QOb2kW
         0DdVS8/GQEQg0NkUOKC6MKL0VyfmvV/4mWksolSx/uWWGDLvmAIUXEkJvzBtUtDL3/Nh
         nr+9J/gYpvooOLuTeoBF4zzOXWX6zkh0eE0esDSJ4zx8QbKonEUG1nFOb9F/fzC0QMGJ
         WCs9XWQbNj4CWMlB5oIddYY+VCL1qyTIhzJu1gg4sF4IFnGRiN/UU1DSBKct1YVilMpG
         AUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837826; x=1767442626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rhFoe+/fNVQYtucZwNZBdpwy2GyzZc29S0jBT7dXZmU=;
        b=bG0bqyzoErumgR4UByUdQJJ3O2/jInhH9w4Rt3guQ9Z6ArPJx2XIcsOLSWBtqfMCqo
         mdal2toX7CBmNbOQePm0Ft/m+47bql7UB4vqKCfBRa9YjW7LyKrRRQvLofwKcMT4Fvh+
         br7+OaouvYnpZ2uLD8vTH+dYTUYEYplaJvGxLTTMkyTHTDmLb8HfPEIUsGWNw265m+9N
         uqWECDO/ApkbOmCMTfyPDLe8LkQKTUo3Uc6WzqMPmO5Od2wzUmSsPu/ZT89QD2GWuizV
         5FYIxmxMML3uZNbh9pfumM0f3GwGD17UDXl4BP9iF0oVsEuXEpoDtUaSSL1fcrRGpX19
         neQg==
X-Forwarded-Encrypted: i=1; AJvYcCU2bLXTIdZlGlf/+OVSxNLhJ/TDzG36YttJPuC9klW/Q8EAGAg30afcPiaeprzDbvKj2G0Yx/UlpPLX9Jc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx5L+duoflyOno0SdnGymm+u/8Uq2LmwT6GApSQHzzVx8oN3EJ2
	NFVzCTHn5Sg6Jx0GboPZ9Ug0kVdt4WvdqycRUjtxVgoe+zJcmtvKrIUEdtvavcFtF4k=
X-Gm-Gg: AY/fxX5UKgYvcJvrfewnjw1A4f2n/lRjB1qXhNOqliP2DyqnjtcM2ggf3q1OL0eA+1a
	HzatLHjZa5UVMfBM8TeHVbEieg/A/G/ShhA2e1M45cP16kEgUIGFZs709+9sK6jfyMXtgbMMQPi
	avkU7AjEFu2j+VY+lZPWEvfAeRVWgbHp/ei1KVM5XHY1Z7plZ72OlF5wIxb0N7MHHTzHTdHrYps
	gUzRoBCAZRY00G+d/lujLrzmnfHVmPdytRUjoAEjodTbNECOxv2lXGB2Q8JiVs0kBMVicUXiTYT
	oOfOeiX+TGCeT7UhInb+BU6etkrQ9mwe9ngtL0M73ldKg48qCNmgtYvxiO9EWY1jGzmlOapPt0m
	kZfQy3Id7JGpYRAJRXEOF8kgMLmO4VCxBrxaHe/bSzdao6pgmfJBs8zNK1iTYOxRJX9xlBvVGh3
	5zUNVgcYxI
X-Google-Smtp-Source: AGHT+IHT9M2beqQrZzp9xbbyJud8/h6Q+UOZtBpjbh3fLwHrPjz2pLTjAJscQz+yaZcvqZw8y6NMSQ==
X-Received: by 2002:a05:600c:3b88:b0:47a:814c:ee95 with SMTP id 5b1f17b1804b1-47d19556cf7mr356539265e9.12.1766837826003;
        Sat, 27 Dec 2025 04:17:06 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:17:05 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:09 -0300
Subject: [PATCH 02/19] printk: Introduce console_is_nbcon
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
Message-Id: <20251227-printk-cleanup-part3-v1-2-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=5401;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=neUSae1tSSd9ZUIMhNnIsDOes9ZbVtbWmizb8QV3UdY=;
 b=gCYQ59/fzh5QOgA05PXMV/E/oNmzy4c9swZbzFlKNzJFERHXZDcBlPYBdYFwyrufnetFktUrT
 qugGUjzspdLDAy+AfxtSwqRvBilWtZIJfksSlShjgsgxcBNFgQvlHOk
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Besides checking if the current console is NBCON or not, console->flags
is also being read in order to serve as argument of the console_is_usable
function.

But CON_NBCON flag is unique: it's set just once in the console
registration and never cleared. In this case it can be possible to read
the flag when console_srcu_lock is held (which is the case when using
for_each_console).

This change makes possible to remove the flags argument from
console_is_usable in the next patches.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 include/linux/console.h   | 27 +++++++++++++++++++++++++++
 kernel/debug/kdb/kdb_io.c |  2 +-
 kernel/printk/nbcon.c     |  2 +-
 kernel/printk/printk.c    | 15 ++++++---------
 4 files changed, 35 insertions(+), 11 deletions(-)

diff --git a/include/linux/console.h b/include/linux/console.h
index 35c03fc4ed51..dd4ec7a5bff9 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -561,6 +561,33 @@ static inline void console_srcu_write_flags(struct console *con, short flags)
 	WRITE_ONCE(con->flags, flags);
 }
 
+/**
+ * console_srcu_is_nbcon - Locklessly check whether the console is nbcon
+ * @con:	struct console pointer of console to check
+ *
+ * Requires console_srcu_read_lock to be held, which implies that @con might
+ * be a registered console. The purpose of holding console_srcu_read_lock is
+ * to guarantee that no exit/cleanup routines will run if the console
+ * is currently undergoing unregistration.
+ *
+ * If the caller is holding the console_list_lock or it is _certain_ that
+ * @con is not and will not become registered, the caller may read
+ * @con->flags directly instead.
+ *
+ * Context: Any context.
+ * Return: True when CON_NBCON flag is set.
+ */
+static inline bool console_is_nbcon(const struct console *con)
+{
+	WARN_ON_ONCE(!console_srcu_read_lock_is_held());
+
+	/*
+	 * The CON_NBCON flag is statically initialized and is never
+	 * set or cleared at runtime.
+	 */
+	return data_race(con->flags & CON_NBCON);
+}
+
 /* Variant of console_is_registered() when the console_list_lock is held. */
 static inline bool console_is_registered_locked(const struct console *con)
 {
diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 6ffb962392a4..d6de512b433a 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -596,7 +596,7 @@ static void kdb_msg_write(const char *msg, int msg_len)
 		if (c == dbg_io_ops->cons)
 			continue;
 
-		if (flags & CON_NBCON) {
+		if (console_is_nbcon(c)) {
 			struct nbcon_write_context wctxt = { };
 
 			/*
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index 13865ef85990..f0f42e212caa 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1647,7 +1647,7 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
 	for_each_console_srcu(con) {
 		short flags = console_srcu_read_flags(con);
 
-		if (!(flags & CON_NBCON))
+		if (!console_is_nbcon(con))
 			continue;
 
 		if (!console_is_usable(con, flags, NBCON_USE_ATOMIC))
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 5f4b84f9562e..bd0d574be3cf 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3200,7 +3200,7 @@ static bool console_flush_one_record(bool do_cond_resched, u64 *next_seq, bool *
 		 * nbcon consoles when the nbcon consoles cannot print via
 		 * their atomic or threaded flushing.
 		 */
-		if ((flags & CON_NBCON) && (ft.nbcon_atomic || ft.nbcon_offload))
+		if (console_is_nbcon(con) && (ft.nbcon_atomic || ft.nbcon_offload))
 			continue;
 
 		if (!console_is_usable(con, flags,
@@ -3209,7 +3209,7 @@ static bool console_flush_one_record(bool do_cond_resched, u64 *next_seq, bool *
 			continue;
 		any_usable = true;
 
-		if (flags & CON_NBCON) {
+		if (console_is_nbcon(con)) {
 			progress = nbcon_legacy_emit_next_record(con, handover, cookie,
 								 !do_cond_resched);
 			printk_seq = nbcon_seq_read(con);
@@ -3458,7 +3458,6 @@ void console_unblank(void)
 static void __console_rewind_all(void)
 {
 	struct console *c;
-	short flags;
 	int cookie;
 	u64 seq;
 
@@ -3466,9 +3465,7 @@ static void __console_rewind_all(void)
 
 	cookie = console_srcu_read_lock();
 	for_each_console_srcu(c) {
-		flags = console_srcu_read_flags(c);
-
-		if (flags & CON_NBCON) {
+		if (console_is_nbcon(c)) {
 			nbcon_seq_force(c, seq);
 		} else {
 			/*
@@ -3632,13 +3629,13 @@ static bool legacy_kthread_should_wakeup(void)
 		 * consoles when the nbcon consoles cannot print via their
 		 * atomic or threaded flushing.
 		 */
-		if ((flags & CON_NBCON) && (ft.nbcon_atomic || ft.nbcon_offload))
+		if (console_is_nbcon(con) && (ft.nbcon_atomic || ft.nbcon_offload))
 			continue;
 
 		if (!console_is_usable(con, flags, NBCON_USE_THREAD))
 			continue;
 
-		if (flags & CON_NBCON) {
+		if (console_is_nbcon(con)) {
 			printk_seq = nbcon_seq_read(con);
 		} else {
 			/*
@@ -4490,7 +4487,7 @@ static bool __pr_flush(struct console *con, int timeout_ms, bool reset_on_progre
 			if (!console_is_usable(c, flags, NBCON_USE_ANY))
 				continue;
 
-			if (flags & CON_NBCON) {
+			if (console_is_nbcon(c)) {
 				printk_seq = nbcon_seq_read(c);
 			} else {
 				printk_seq = c->seq;

-- 
2.52.0


