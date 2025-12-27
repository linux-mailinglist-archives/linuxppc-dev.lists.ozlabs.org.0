Return-Path: <linuxppc-dev+bounces-15023-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6029ACE02A5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Dec 2025 23:37:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ddy6Z4tYJz2yFs;
	Sun, 28 Dec 2025 09:37:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766837880;
	cv=none; b=SWcfL2zx2aJs/j+Zl7OjPJO8g8Xa4DKhotAQPP9nOkUCl4xmTkMiwOCMEpvbWSNl9r045ciZ9J9as+Ardy3AJDF+tSpZrGQLE++qChnWGVWe3tAsRfVOqaE5Cs+U8U8uCLhHDWSIOUtKYDXr+ivqTv8+M3hCgSJupAU9pqk6fLvA1fGy2ng3+NpS8bcJoYrj5lMNiIz32SKobMrmVEHqjo7UE9r44Le+Iem5cnM062zNY7s9VtLcbcKw3U5wlWWjWFPDCLqkvvlnBQffDQcFRF4JWQGtfw2krLP/0KFVIzNN6ws8Rr8tPd2+GV+VP+TaFH1jm/ulumxsZdoddq20gg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766837880; c=relaxed/relaxed;
	bh=TucCmhZOA7i1Z82TbHC9/BloO3wYJZCYcsSdo+RW81I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=duO2VHe+FvMclv6aWHUL6IR7rkVlfH84ppBeGckj7v3/39qlva89XuZ/X+ctIq8fEYs4R3aakbicja1aQyVidfhYfGOpfrTVGQmtUpn57Vrwo2IPJtV2kV51u2whIR8jrPvLnamEtCsMRpywtmZueGCyhzAikr5g1lEOvQFlvYQuqrvNvwPEYM7TgteU+fKEu11EOLwws8t8YRmqlXA+83B70MqQlWPt2zKV6rvv86K1EvueqTWdXMkT2/BO/w6kX25rRD2qnR7HASShoq8WSDrJKMCliQJk0M+A5asaCHCE1E8elmF/fPZL151dQy6r4Nn5lS7081XVe24Xnt+K9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aoCXr4pL; dkim-atps=neutral; spf=pass (client-ip=209.85.128.41; helo=mail-wm1-f41.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aoCXr4pL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.128.41; helo=mail-wm1-f41.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ddhMW5shKz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 23:17:59 +1100 (AEDT)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so81584875e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 04:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837817; x=1767442617; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TucCmhZOA7i1Z82TbHC9/BloO3wYJZCYcsSdo+RW81I=;
        b=aoCXr4pL3DRF9jqxqYEQitAeL48XROrOU2iENxVXJBAb8DrWUtZpKDOzf4dwJsR/e/
         dWQs83KZlYXdl4AqM2bpAkVBsrz3RRuIcW2lt2oRT4BTntvcyVSKETDh6H4YYN3TNbPL
         rrK7CHHiyhXz2KGOGvv0qq3RvQk4xLvqFxP+nJ9PEh/MCH6tYlgR1xhjskJqbNiO0jev
         HNz1aGCaWJx0O41Ey6vyVlCc4jNWUt4/wFQZ0dkUF90cQ0u8PtMeZcLBEMPVZA2R1PRq
         q8qyUEnVh54i7wds4c4Krx9PUO87QunucH+b++KvmRn/V6gM9yESiiu2z9MdNFRdEncl
         546Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837817; x=1767442617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TucCmhZOA7i1Z82TbHC9/BloO3wYJZCYcsSdo+RW81I=;
        b=Ph3lVjwRz2O9QIIMYL5WMN07ifYOwKIdWKKaz5JePp6WnVIIZddQx557z2dpGGutYW
         4QaMr25+JnQhIJpwiXrr/3dAL4tohAbcu5tfFWMSwAgJRNQ7XB+8ibQpodQeCw/yJIVO
         +w4nw4zZc8DMLtkfPZBshGxshqpm5RwNrtfVGNwSMOuDlMOJMlNZimbVKU7ER0b2BsrX
         viRi8CUWEmEExebrGj9yl491cjZSaJ7LqRavZ4unXMiQTKmE27pSH6ReOjDhgNF+7RUb
         L9F73NTLQLJBsmzNASiiVSVhkMHbU7nBJPcwPytoEaeuRALvuvHgSph5VzrgV7R0hWF9
         M0SA==
X-Forwarded-Encrypted: i=1; AJvYcCVXU0FzCH59S9WW48IRWYQERQNa7kuzNY+hA9kCd835XJYHTbEKdVZV338gUAvcumkwmBM5QJrB90BDexs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyZSsm81OJIbU1xbNL3ryKvrMh3s5XOp1ClhvpD1swzqqrETfSu
	Xvo9ItUQXKT305ElSjIMa75CYCIgS8OD+DqZ4BU4DMwx+RGlGlD/UgUk+Tmosv4sV/8=
X-Gm-Gg: AY/fxX7ZyptWdca80QFM3cPwGiybPRK1y+95joRQu13GEVaMKfwdljRswuzz7gL+WRn
	04P1Eg1JWPP/g1Jx3jVBU8w5n/h221bi/9IyjCENYM5A93xJPhswZ34HQPqx9QsZ2lQxjGUiNMv
	bCvFQfWTxHoJ8HL5A+XERoslgdUMctPOxDqOvVD/eTcoBjICB/el6MHBwRHeHVMAs81ngVR7XnM
	DH6p0Vt2/uo7qBBtr4LPrU9KOZC4+PSq1cIBLNQVc1wE++ZpjEL6MVFZJk+fKOpxZD+hIsNCHES
	mqd32ETfcPNPWwwBSovePcnWWnVFcZSD7QcGFfSf4TZy/5+TbzBywgazm0KkVNilSN7xEHhANOc
	wEsAf5PVyvO9PPlIJAKkHwI7UBVtNQeQmJ/BiBDa3Elt6tiE8bpBsgbRptExLuJfIujHMOOcVYR
	6O/nu0wNx8
X-Google-Smtp-Source: AGHT+IF/Ogs7VBJ7Lrr7CGG7veshYzlT60dJ+vTxBr8CJY/jnjI8AOD4UQ6PSSMzci7/2/zJylqGqg==
X-Received: by 2002:a05:600c:314f:b0:47d:4fbe:e6cc with SMTP id 5b1f17b1804b1-47d4fbee749mr22553095e9.13.1766837816753;
        Sat, 27 Dec 2025 04:16:56 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:16:56 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:08 -0300
Subject: [PATCH 01/19] printk/nbcon: Use an enum to specify the required
 callback in console_is_usable()
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
Message-Id: <20251227-printk-cleanup-part3-v1-1-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=7808;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=v10odBRNUVRtYegW6AWVkSJvotaiGNuLgfoYzWWV1rM=;
 b=pFG5z/R9mPhdW0GcbWwBqAYRxphqjaw37XiHB8zK2Svw6cgWPnnbt5ix8LVRTlDSXoMKx6YOe
 j641rf88XbSCyYZnTx7OjU6MTkBS6ecM7BDrludb53BNNBG+/Mhcz0A
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The current usage of console_is_usable() is clumsy. The parameter
@use_atomic is boolean and thus not self-explanatory. The function is
called twice in situations when there are no-strict requirements.

Replace it with enum nbcon_write_cb which provides a more descriptive
values for all 3 situations: atomic, thread or any.

Note that console_is_usable() checks only NBCON_USE_ATOMIC because
.write_thread() callback is mandatory. But the other two values still
make sense because they describe the intention of the caller.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 arch/um/kernel/kmsg_dump.c |  3 ++-
 include/linux/console.h    | 20 +++++++++++++++++---
 kernel/debug/kdb/kdb_io.c  |  2 +-
 kernel/printk/nbcon.c      |  8 ++++----
 kernel/printk/printk.c     | 16 ++++++++--------
 5 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/arch/um/kernel/kmsg_dump.c b/arch/um/kernel/kmsg_dump.c
index fc0f543d1d8e..8ae38308b67c 100644
--- a/arch/um/kernel/kmsg_dump.c
+++ b/arch/um/kernel/kmsg_dump.c
@@ -31,7 +31,8 @@ static void kmsg_dumper_stdout(struct kmsg_dumper *dumper,
 		 * expected to output the crash information.
 		 */
 		if (strcmp(con->name, "ttynull") != 0 &&
-		    console_is_usable(con, console_srcu_read_flags(con), true)) {
+		    console_is_usable(con, console_srcu_read_flags(con),
+				      NBCON_USE_ATOMIC)) {
 			break;
 		}
 	}
diff --git a/include/linux/console.h b/include/linux/console.h
index fc9f5c5c1b04..35c03fc4ed51 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -202,6 +202,19 @@ enum cons_flags {
 	CON_NBCON_ATOMIC_UNSAFE	= BIT(9),
 };
 
+/**
+ * enum nbcon_write_cb - Defines which nbcon write() callback must be used based
+ *                       on the caller context.
+ * @NBCON_USE_ATOMIC: Use con->write_atomic().
+ * @NBCON_USE_THREAD: Use con->write_thread().
+ * @NBCON_USE_ANY:    The caller does not have any strict requirements.
+ */
+enum nbcon_write_cb {
+	NBCON_USE_ATOMIC,
+	NBCON_USE_THREAD,
+	NBCON_USE_ANY,
+};
+
 /**
  * struct nbcon_state - console state for nbcon consoles
  * @atom:	Compound of the state fields for atomic operations
@@ -622,7 +635,8 @@ extern void nbcon_kdb_release(struct nbcon_write_context *wctxt);
  * which can also play a role in deciding if @con can be used to print
  * records.
  */
-static inline bool console_is_usable(struct console *con, short flags, bool use_atomic)
+static inline bool console_is_usable(struct console *con, short flags,
+				     enum nbcon_write_cb nwc)
 {
 	if (!(flags & CON_ENABLED))
 		return false;
@@ -631,7 +645,7 @@ static inline bool console_is_usable(struct console *con, short flags, bool use_
 		return false;
 
 	if (flags & CON_NBCON) {
-		if (use_atomic) {
+		if (nwc & NBCON_USE_ATOMIC) {
 			/* The write_atomic() callback is optional. */
 			if (!con->write_atomic)
 				return false;
@@ -679,7 +693,7 @@ static inline bool nbcon_kdb_try_acquire(struct console *con,
 					 struct nbcon_write_context *wctxt) { return false; }
 static inline void nbcon_kdb_release(struct nbcon_write_context *wctxt) { }
 static inline bool console_is_usable(struct console *con, short flags,
-				     bool use_atomic) { return false; }
+				     enum nbcon_write_cb nwc) { return false; }
 #endif
 
 extern int console_set_on_cmdline;
diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 61c1690058ed..6ffb962392a4 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -591,7 +591,7 @@ static void kdb_msg_write(const char *msg, int msg_len)
 	for_each_console_srcu(c) {
 		short flags = console_srcu_read_flags(c);
 
-		if (!console_is_usable(c, flags, true))
+		if (!console_is_usable(c, flags, NBCON_USE_ATOMIC))
 			continue;
 		if (c == dbg_io_ops->cons)
 			continue;
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index be5a04367e60..13865ef85990 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1184,7 +1184,7 @@ static bool nbcon_kthread_should_wakeup(struct console *con, struct nbcon_contex
 	cookie = console_srcu_read_lock();
 
 	flags = console_srcu_read_flags(con);
-	if (console_is_usable(con, flags, false)) {
+	if (console_is_usable(con, flags, NBCON_USE_THREAD)) {
 		/* Bring the sequence in @ctxt up to date */
 		ctxt->seq = nbcon_seq_read(con);
 
@@ -1251,7 +1251,7 @@ static int nbcon_kthread_func(void *__console)
 
 		con_flags = console_srcu_read_flags(con);
 
-		if (console_is_usable(con, con_flags, false))
+		if (console_is_usable(con, con_flags, NBCON_USE_THREAD))
 			backlog = nbcon_emit_one(&wctxt, false);
 
 		console_srcu_read_unlock(cookie);
@@ -1650,7 +1650,7 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
 		if (!(flags & CON_NBCON))
 			continue;
 
-		if (!console_is_usable(con, flags, true))
+		if (!console_is_usable(con, flags, NBCON_USE_ATOMIC))
 			continue;
 
 		if (nbcon_seq_read(con) >= stop_seq)
@@ -1904,7 +1904,7 @@ void nbcon_device_release(struct console *con)
 	 */
 	cookie = console_srcu_read_lock();
 	printk_get_console_flush_type(&ft);
-	if (console_is_usable(con, console_srcu_read_flags(con), true) &&
+	if (console_is_usable(con, console_srcu_read_flags(con), NBCON_USE_ATOMIC) &&
 	    !ft.nbcon_offload &&
 	    prb_read_valid(prb, nbcon_seq_read(con), NULL)) {
 		/*
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 7394f1b6033b..5f4b84f9562e 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3203,7 +3203,9 @@ static bool console_flush_one_record(bool do_cond_resched, u64 *next_seq, bool *
 		if ((flags & CON_NBCON) && (ft.nbcon_atomic || ft.nbcon_offload))
 			continue;
 
-		if (!console_is_usable(con, flags, !do_cond_resched))
+		if (!console_is_usable(con, flags,
+				       do_cond_resched ? NBCON_USE_THREAD
+						       : NBCON_USE_ATOMIC))
 			continue;
 		any_usable = true;
 
@@ -3392,7 +3394,7 @@ void console_unblank(void)
 	 */
 	cookie = console_srcu_read_lock();
 	for_each_console_srcu(c) {
-		if (!console_is_usable(c, console_srcu_read_flags(c), true))
+		if (!console_is_usable(c, console_srcu_read_flags(c), NBCON_USE_ATOMIC))
 			continue;
 
 		if (c->unblank) {
@@ -3432,7 +3434,7 @@ void console_unblank(void)
 
 	cookie = console_srcu_read_lock();
 	for_each_console_srcu(c) {
-		if (!console_is_usable(c, console_srcu_read_flags(c), true))
+		if (!console_is_usable(c, console_srcu_read_flags(c), NBCON_USE_ATOMIC))
 			continue;
 
 		if (c->unblank)
@@ -3633,7 +3635,7 @@ static bool legacy_kthread_should_wakeup(void)
 		if ((flags & CON_NBCON) && (ft.nbcon_atomic || ft.nbcon_offload))
 			continue;
 
-		if (!console_is_usable(con, flags, false))
+		if (!console_is_usable(con, flags, NBCON_USE_THREAD))
 			continue;
 
 		if (flags & CON_NBCON) {
@@ -4204,7 +4206,7 @@ static int unregister_console_locked(struct console *console)
 
 	if (!console_is_registered_locked(console))
 		res = -ENODEV;
-	else if (console_is_usable(console, console->flags, true))
+	else if (console_is_usable(console, console->flags, NBCON_USE_ATOMIC))
 		__pr_flush(console, 1000, true);
 
 	/* Disable it unconditionally */
@@ -4485,10 +4487,8 @@ static bool __pr_flush(struct console *con, int timeout_ms, bool reset_on_progre
 			 * that they make forward progress, so only increment
 			 * @diff for usable consoles.
 			 */
-			if (!console_is_usable(c, flags, true) &&
-			    !console_is_usable(c, flags, false)) {
+			if (!console_is_usable(c, flags, NBCON_USE_ANY))
 				continue;
-			}
 
 			if (flags & CON_NBCON) {
 				printk_seq = nbcon_seq_read(c);

-- 
2.52.0


