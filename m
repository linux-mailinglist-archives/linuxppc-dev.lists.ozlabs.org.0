Return-Path: <linuxppc-dev+bounces-15026-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC89CE02AE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Dec 2025 23:38:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ddy7h35FRz2yFs;
	Sun, 28 Dec 2025 09:38:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766837899;
	cv=none; b=EC/UuSNCbeADCSnodQPH3ETRuNS7nhWC9QJ+n2qRv05RysUMgqxbOI7OctlJWamLKl5nKWruLE4BXJHZ1KeCTNVThL55Ii3hvYutPUa3FEQh0oHkSSN64t7NT9A1W0HE4yCef5aqXI8juuuG8d4rMNAU34eb3aec02C4puWEI78lLtB1/dJtJRV5jgNRH6BBi9prBeSuKjq6e3UGU4UHrqJzsSeTMw9aDt2Ib1nmdI8keMH27lHyMUGJsbMWsw7TZhOCvuX/MPl+RuA17oyNTXb6ljPK7/drrhHR3RCXY+5SM9krd2bI8EikvAFOr/hRUt9GLgpjS4JIC9Hl4JeU9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766837899; c=relaxed/relaxed;
	bh=uTPebJjNeKwkChbLQ9kmEHnfHiLVqL0OXrUmcfcwYxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IMYjNZym/ypNgFH/OEnAZMPgjjFQiMszDOMGX7EccUDFSKVNU9Zbto2RuXQgsxAkiLuKEQXBUfRQG5CTLDcSt4bcrkrqgYSKXvgQzuBI8uxW/2nQC9N0DdjWNMxNUV6zRvEmYoSC7BxoiQYeH1s3ITloCsCUp+fdttdPXavhnjrVUU2sHg4gVkOrWTQXLTUNhoApBgZuqBgzY+tZ/hDaCld8t2cRiGvpizpXtkdYKvyphYV0fYG4VgTR0cEY4E/CtlHvmEKG8KzjNUW2TgCHkZny4O5S4s4RTgPcpcRXW80/0+PQrxV126deUUkhfGk4DzpnLz/LNM8o1vhVHG5oHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DO1fhiU0; dkim-atps=neutral; spf=pass (client-ip=209.85.128.49; helo=mail-wm1-f49.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DO1fhiU0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.128.49; helo=mail-wm1-f49.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ddhMt01lqz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 23:18:17 +1100 (AEDT)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so57866305e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 04:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837835; x=1767442635; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTPebJjNeKwkChbLQ9kmEHnfHiLVqL0OXrUmcfcwYxQ=;
        b=DO1fhiU0elqafVqy6EdkS3t9I1iYiHDIB9pneaGgfeSu0+H6mSZEbJTOCOY7yTBEpI
         3N39EnmH9Cq1+pzSQ8mU3bav3+HjmZTXNZKJ7loldeR9UPthny5FCNDmTcLmuYyIKxU0
         5BN+bEYd5U/1n9AwZWlUCpqE8FqMl1H5k5+JjFesY6VyBl6zJ7sfEke3mO2pdnpxJrZY
         F2Vxun1JZ+ha2XJnJ5cgmCF73saQs5as10P3eb786HtkcQY+T8NHSXas0zYtmjgsmOC1
         MqicnMyKgb4hXazFeBgC8rd8G1NmNptMHsF29aKicCM7SSsCWo6ZTRYPyBvvAo8f0KGx
         evEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837835; x=1767442635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uTPebJjNeKwkChbLQ9kmEHnfHiLVqL0OXrUmcfcwYxQ=;
        b=WsqRB7wFM4ABWxKqPBH9U04pTFfrJ4iWT0QEBvA9YfSqldXj0vVXDlcyFF2Ycyw9ty
         dCu4VNHU7VtYi2QMto108aEDLTemE2O19N7I6j8/mtHKcNeoCkzaKF400EeI3E0581y3
         ItGfjWRpUU7/y+D4KGj7to4u5VjsQ9UhMi04VyK6ovpf63bEuEv4PvGc0GVBdSrlqMp9
         MBUCO/Fg5TQCcfdcCyHrK4nnCcjvfc3wn3rxv2Mv6+k8qSvAkqhK3nrYC4U38+zrbbSx
         OYi5jv07fLgYSN7MRoMCXq0xoLcIzg8ko01K4Jz9fuVNWlxUuoTxUThyvg6u/n1s8Jqj
         Wl4g==
X-Forwarded-Encrypted: i=1; AJvYcCW8nwWC3+DPi0KpFPqrJ3YhG5yZgTtPgBlNbOQZGbCVvZWsOX+sOheGynaosTI3fxwTVjT6s4ErrDsRlWw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxMXYopcj/VueDsLCIkLb+MK7GD+eY2iLI/UEkvK9Vk9PSZI9Sm
	Pe7Vfbgt64uibHYy1QDPGFnne502fqJVyZZbvhCoFfLnJdwkzh589wUsVAeI/YExswU=
X-Gm-Gg: AY/fxX6ZvrZzKlJJB60fyUw+NbSP0WJIq9c8EuAsnfE4qvptbRBkqdRYtlwg6buQ8uv
	rXnNzZ0229vmtr7sibNSFz5d0vzE7gRXyPqC+07qr0yoHKT4lsPb326UpZm91V+49Q9Iduv0DVo
	P3eOBhuFi659If4erX1TfindKr/OXdAJbCTgWwICG+YT5CIx+uBZhdkp5UegSDGz62alJTeSPOI
	XT933gnKUxoSijXJowwB3TSAFAhvfjLMBOHQYqXHdE4/YSl3EoBvEFz0+9+LLUql417XUAo8ICs
	gybalFJyvzwGcr7I3ZH3eNTjgvQB3+yfo2ziaaZYXgmW4+wxRW7TAbD8IXJqjCC4QkGP3H8Mv0Z
	4YRDwI2Bl0D3uSg0kyWi2Ul+0enD79qulWjLGDS9z7PxRrfZrr9z5YD00yNzi58DseD/4z1AKub
	VzaRws7bFDnC7s1Tz8i7M=
X-Google-Smtp-Source: AGHT+IGwp3EjluLXDesoC0JEyXRGphsbQ8YoWlvkj2Od8DQXEn5G/ySQT/x4pqGRl4etLgLjbGQKkA==
X-Received: by 2002:a05:600c:1912:b0:477:89d5:fdac with SMTP id 5b1f17b1804b1-47d1959f714mr329425925e9.31.1766837835139;
        Sat, 27 Dec 2025 04:17:15 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:17:14 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:10 -0300
Subject: [PATCH 03/19] printk: Drop flags argument from console_is_usable
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
Message-Id: <20251227-printk-cleanup-part3-v1-3-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=9456;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=vcl36sWudeP+4+BFFAGNAn9YWtzCJyjmd2BzAWTnD/U=;
 b=iD+souMtKfrrqeYTmzgK7GoB+YnYwBZz+b3u1u3z79Hjhj/LyjffFTb6T+KYy3fwP+rT9y9HK
 hjNxNGyaArtAX5IV24Lh1tykQ434DvLfReICQgaATUhSR+uxoFOqy3O
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The flags argument was also used to check if CON_NBCON was set, but their
usage was fixed in the last commit. All current users are reading the
variable just to call console_is_usable.

By calling console_srcu_read_flags inside console_is_usable makes the
code cleaner and removes one argument from the function.

Along with it, create a variant called __console_is_usable that can be
used under console_list_lock(), like unregister_console_locked.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 arch/um/kernel/kmsg_dump.c |  3 +--
 include/linux/console.h    | 25 +++++++++++++++++--------
 kernel/debug/kdb/kdb_io.c  |  4 +---
 kernel/printk/nbcon.c      | 15 ++++-----------
 kernel/printk/printk.c     | 20 +++++++-------------
 5 files changed, 30 insertions(+), 37 deletions(-)

diff --git a/arch/um/kernel/kmsg_dump.c b/arch/um/kernel/kmsg_dump.c
index 8ae38308b67c..ca80232cfa2a 100644
--- a/arch/um/kernel/kmsg_dump.c
+++ b/arch/um/kernel/kmsg_dump.c
@@ -31,8 +31,7 @@ static void kmsg_dumper_stdout(struct kmsg_dumper *dumper,
 		 * expected to output the crash information.
 		 */
 		if (strcmp(con->name, "ttynull") != 0 &&
-		    console_is_usable(con, console_srcu_read_flags(con),
-				      NBCON_USE_ATOMIC)) {
+		    console_is_usable(con, NBCON_USE_ATOMIC)) {
 			break;
 		}
 	}
diff --git a/include/linux/console.h b/include/linux/console.h
index dd4ec7a5bff9..648cf10e3f93 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -656,13 +656,8 @@ extern bool nbcon_kdb_try_acquire(struct console *con,
 				  struct nbcon_write_context *wctxt);
 extern void nbcon_kdb_release(struct nbcon_write_context *wctxt);
 
-/*
- * Check if the given console is currently capable and allowed to print
- * records. Note that this function does not consider the current context,
- * which can also play a role in deciding if @con can be used to print
- * records.
- */
-static inline bool console_is_usable(struct console *con, short flags,
+/* Variant of console_is_usable() when the console_list_lock is held. */
+static inline bool __console_is_usable(struct console *con, short flags,
 				     enum nbcon_write_cb nwc)
 {
 	if (!(flags & CON_ENABLED))
@@ -707,6 +702,18 @@ static inline bool console_is_usable(struct console *con, short flags,
 	return true;
 }
 
+/*
+ * Check if the given console is currently capable and allowed to print
+ * records. Note that this function does not consider the current context,
+ * which can also play a role in deciding if @con can be used to print
+ * records.
+ */
+static inline bool console_is_usable(struct console *con,
+				     enum nbcon_write_cb nwc)
+{
+	return __console_is_usable(con, console_srcu_read_flags(con), nwc);
+}
+
 #else
 static inline void nbcon_cpu_emergency_enter(void) { }
 static inline void nbcon_cpu_emergency_exit(void) { }
@@ -719,7 +726,9 @@ static inline void nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt) { }
 static inline bool nbcon_kdb_try_acquire(struct console *con,
 					 struct nbcon_write_context *wctxt) { return false; }
 static inline void nbcon_kdb_release(struct nbcon_write_context *wctxt) { }
-static inline bool console_is_usable(struct console *con, short flags,
+static inline bool __console_is_usable(struct console *con, short flags,
+				       enum nbcon_write_cb nwc) { return false; }
+static inline bool console_is_usable(struct console *con,
 				     enum nbcon_write_cb nwc) { return false; }
 #endif
 
diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index d6de512b433a..642eab746577 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -589,9 +589,7 @@ static void kdb_msg_write(const char *msg, int msg_len)
 	 */
 	cookie = console_srcu_read_lock();
 	for_each_console_srcu(c) {
-		short flags = console_srcu_read_flags(c);
-
-		if (!console_is_usable(c, flags, NBCON_USE_ATOMIC))
+		if (!console_is_usable(c, NBCON_USE_ATOMIC))
 			continue;
 		if (c == dbg_io_ops->cons)
 			continue;
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index f0f42e212caa..f0659c1e50ed 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1164,7 +1164,6 @@ static bool nbcon_emit_one(struct nbcon_write_context *wctxt, bool use_atomic)
 static bool nbcon_kthread_should_wakeup(struct console *con, struct nbcon_context *ctxt)
 {
 	bool ret = false;
-	short flags;
 	int cookie;
 
 	if (kthread_should_stop())
@@ -1183,8 +1182,7 @@ static bool nbcon_kthread_should_wakeup(struct console *con, struct nbcon_contex
 
 	cookie = console_srcu_read_lock();
 
-	flags = console_srcu_read_flags(con);
-	if (console_is_usable(con, flags, NBCON_USE_THREAD)) {
+	if (console_is_usable(con, NBCON_USE_THREAD)) {
 		/* Bring the sequence in @ctxt up to date */
 		ctxt->seq = nbcon_seq_read(con);
 
@@ -1209,7 +1207,6 @@ static int nbcon_kthread_func(void *__console)
 		.ctxt.prio	= NBCON_PRIO_NORMAL,
 	};
 	struct nbcon_context *ctxt = &ACCESS_PRIVATE(&wctxt, ctxt);
-	short con_flags;
 	bool backlog;
 	int cookie;
 
@@ -1249,9 +1246,7 @@ static int nbcon_kthread_func(void *__console)
 		 */
 		cookie = console_srcu_read_lock();
 
-		con_flags = console_srcu_read_flags(con);
-
-		if (console_is_usable(con, con_flags, NBCON_USE_THREAD))
+		if (console_is_usable(con, NBCON_USE_THREAD))
 			backlog = nbcon_emit_one(&wctxt, false);
 
 		console_srcu_read_unlock(cookie);
@@ -1645,12 +1640,10 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
 
 	cookie = console_srcu_read_lock();
 	for_each_console_srcu(con) {
-		short flags = console_srcu_read_flags(con);
-
 		if (!console_is_nbcon(con))
 			continue;
 
-		if (!console_is_usable(con, flags, NBCON_USE_ATOMIC))
+		if (!console_is_usable(con, NBCON_USE_ATOMIC))
 			continue;
 
 		if (nbcon_seq_read(con) >= stop_seq)
@@ -1904,7 +1897,7 @@ void nbcon_device_release(struct console *con)
 	 */
 	cookie = console_srcu_read_lock();
 	printk_get_console_flush_type(&ft);
-	if (console_is_usable(con, console_srcu_read_flags(con), NBCON_USE_ATOMIC) &&
+	if (console_is_usable(con, NBCON_USE_ATOMIC) &&
 	    !ft.nbcon_offload &&
 	    prb_read_valid(prb, nbcon_seq_read(con), NULL)) {
 		/*
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index bd0d574be3cf..b03ffc23c27c 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3191,7 +3191,6 @@ static bool console_flush_one_record(bool do_cond_resched, u64 *next_seq, bool *
 
 	cookie = console_srcu_read_lock();
 	for_each_console_srcu(con) {
-		short flags = console_srcu_read_flags(con);
 		u64 printk_seq;
 		bool progress;
 
@@ -3203,9 +3202,8 @@ static bool console_flush_one_record(bool do_cond_resched, u64 *next_seq, bool *
 		if (console_is_nbcon(con) && (ft.nbcon_atomic || ft.nbcon_offload))
 			continue;
 
-		if (!console_is_usable(con, flags,
-				       do_cond_resched ? NBCON_USE_THREAD
-						       : NBCON_USE_ATOMIC))
+		if (!console_is_usable(con, do_cond_resched ? NBCON_USE_THREAD
+							    : NBCON_USE_ATOMIC))
 			continue;
 		any_usable = true;
 
@@ -3394,7 +3392,7 @@ void console_unblank(void)
 	 */
 	cookie = console_srcu_read_lock();
 	for_each_console_srcu(c) {
-		if (!console_is_usable(c, console_srcu_read_flags(c), NBCON_USE_ATOMIC))
+		if (!console_is_usable(c, NBCON_USE_ATOMIC))
 			continue;
 
 		if (c->unblank) {
@@ -3434,7 +3432,7 @@ void console_unblank(void)
 
 	cookie = console_srcu_read_lock();
 	for_each_console_srcu(c) {
-		if (!console_is_usable(c, console_srcu_read_flags(c), NBCON_USE_ATOMIC))
+		if (!console_is_usable(c, NBCON_USE_ATOMIC))
 			continue;
 
 		if (c->unblank)
@@ -3621,7 +3619,6 @@ static bool legacy_kthread_should_wakeup(void)
 
 	cookie = console_srcu_read_lock();
 	for_each_console_srcu(con) {
-		short flags = console_srcu_read_flags(con);
 		u64 printk_seq;
 
 		/*
@@ -3632,7 +3629,7 @@ static bool legacy_kthread_should_wakeup(void)
 		if (console_is_nbcon(con) && (ft.nbcon_atomic || ft.nbcon_offload))
 			continue;
 
-		if (!console_is_usable(con, flags, NBCON_USE_THREAD))
+		if (!console_is_usable(con, NBCON_USE_THREAD))
 			continue;
 
 		if (console_is_nbcon(con)) {
@@ -4203,7 +4200,7 @@ static int unregister_console_locked(struct console *console)
 
 	if (!console_is_registered_locked(console))
 		res = -ENODEV;
-	else if (console_is_usable(console, console->flags, NBCON_USE_ATOMIC))
+	else if (__console_is_usable(console, console->flags, NBCON_USE_ATOMIC))
 		__pr_flush(console, 1000, true);
 
 	/* Disable it unconditionally */
@@ -4430,7 +4427,6 @@ static bool __pr_flush(struct console *con, int timeout_ms, bool reset_on_progre
 	struct console *c;
 	u64 last_diff = 0;
 	u64 printk_seq;
-	short flags;
 	int cookie;
 	u64 diff;
 	u64 seq;
@@ -4477,14 +4473,12 @@ static bool __pr_flush(struct console *con, int timeout_ms, bool reset_on_progre
 			if (con && con != c)
 				continue;
 
-			flags = console_srcu_read_flags(c);
-
 			/*
 			 * If consoles are not usable, it cannot be expected
 			 * that they make forward progress, so only increment
 			 * @diff for usable consoles.
 			 */
-			if (!console_is_usable(c, flags, NBCON_USE_ANY))
+			if (!console_is_usable(c, NBCON_USE_ANY))
 				continue;
 
 			if (console_is_nbcon(c)) {

-- 
2.52.0


