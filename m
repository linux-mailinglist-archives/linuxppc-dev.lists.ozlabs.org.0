Return-Path: <linuxppc-dev+bounces-15029-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB0ACE02B7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Dec 2025 23:39:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ddy823yXKz2yHB;
	Sun, 28 Dec 2025 09:38:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766837917;
	cv=none; b=hHr0I0hBjSM4/l0gr6L4PT0Z9WWQX18pN3PpNfprmy6IU99Y9+kvFqz2HHXPZE36DoSHTG70abt81J/66rHuZeUFP6JdrYDbnOuYcOASsgHgMUKRDaBdIu4g8vFkiPy9/WaAJqOiQGmnnU3lKVIgjlUPBSUYaq1G9v5e8dGbISjbf/ERaJBw0t4ei0GfV5sxJiga97GzBmrBWNLTOW4hT6/zlAuybaTgIt66dBLMoOx/CiJddX9PzfZTdVbmGoiPYOmQlcOfLJBYtRVLnvK4pOL4xfKnXqpoqDkbPGnO8uo0oqUyDLe9MfvKXpD4Wg/GrPQCj/5cBPnMuEyRHhZ7Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766837917; c=relaxed/relaxed;
	bh=GvSE1c/4a8QCKCTV5gdf1mCLxf9YZVQyxdWd8z10SmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K020uy/+sewBJQBodq9vREEBG95AMyGsC6YjIrv8rhwdWDrtx39/f9UxQFBQuh3ddEJy7HQa7agoANb1f3dDLVZ25hgLldZ71lYtnASBVqFvv15RSbQt4Ohe9WE9Llqqy1y57Vt5BnCs0pp64abfOHqsfE25yUUlt2Z+bf1izGl8JBtDziLmxG6dpq0AP+hOA5vqPrE7Hkw9G5/3hUdr59Z9lpeJRi67RBgfXeuyi/V5knoroo1i0NR7eQxfpQrNEXFmOgo4tGS3h5Kk5QdKIWIlS4l1ptVxNnfbVToL+FQOGBGk4SVGKUtL++mKQ35a4lmJGoAqZ9Q0koeHa3oG2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PHxPUCOt; dkim-atps=neutral; spf=pass (client-ip=209.85.128.49; helo=mail-wm1-f49.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PHxPUCOt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.128.49; helo=mail-wm1-f49.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ddhND1hYCz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 23:18:36 +1100 (AEDT)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso75769015e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 04:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837853; x=1767442653; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GvSE1c/4a8QCKCTV5gdf1mCLxf9YZVQyxdWd8z10SmE=;
        b=PHxPUCOt8AapTS1UwyN/zUJQF7QgySfJapas8OejnSHDWrJVH+/2mAbUT1uOetjWS7
         QV8rNFwluEVzSpeTxwBN49UMxPKdToxftQ+HGBUKacV6rx/zCcZDvfnNSUQmfS+FcPVJ
         Ie8UQTxWAizNn2AXa/gQW9eUSFX2Y4pfU+3hIR7NNFfiEslAedyIigGbjD5hewMG1zeO
         GhN048ZGZ6h/pCXcpbp/4f/df7AsQN3Q6JKt0u5x0fUvd9HngMlP57OPL1oAf11q3Vpj
         zlTF+hM8aCF8YHIFrsPsG5R2tfi9Znfgv3kRbGdNRhFTHQpzH1tf2sEbB+qEfv5HJOLd
         NU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837853; x=1767442653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GvSE1c/4a8QCKCTV5gdf1mCLxf9YZVQyxdWd8z10SmE=;
        b=FTTQXiyWMm/2tTL4nbtKd5rDE+MjZpzKsl+r+g2ruRCsJgVduSWbUPTz9WBP22sN7f
         lbq6Qu/BHvpOgTHNMUbAS5wQTgxfk2nwxbBnmYZ4ILh/VLwRqgafuiuLA3vQAafmXLwv
         vkvzfomkvRuKU9tvf/T1opqfiuHjQyROTGGHYpFR/BWnsLfdPOhJR64sQ2YHs4/L2Lwo
         eDUJQBsl2fsUFTzbYokkuSMoUDNwCqGywOzrgPc01rAQlgHJc9wKEWAlr+h2h6QAYvSS
         Fl64L//xAICWZC2NnF2IokJwD/dlcY1xNGeMacWDDop2XVFYHb4l27caY+HagRsCq+WV
         GBQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW03n0YY/Jgx0gaa9o9Umdv5tfPW4cPV88IPmjC+6ohHbKcnViYmG/30HX4GUXE8Q3XfCthRuA8Rulcl2g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyLqmln72xqTBySUgKeMn5/Rjz263DM0Lvnk7MumszUF3qdHazj
	Z2Q9iYn9IA67ed0bzOTjwBLNdw2W0Y3O2ui6PTfhGQUKSUGZiHVRlfeiqakIwK266OU=
X-Gm-Gg: AY/fxX676OFmObMXWFv7TU66nVESCEJwwWlFTXe2CIcT4ugcbjLDohAJzbIsRAy3hkP
	n+Xx2vxDIaPC6X531sq+p7r/bva1W/Lb7bJx9AKvNQKBO/otmv3uDIjkf1/Nga8gdPHdVWeWU8R
	K3gQ2+phDnoIZwHEXeDpG6JG4VmTYSR5e9AQKI4iWVkren55gjSXpRbc8fbZLupwczKnwLFEyNq
	SqF7L1J409qvbeuqk3vjd++VrbjZTorOuydQ/J4OLLERrij2CPM5udrcc572CI94mmKvQ9SpyAL
	H+oVTDMBQArZEZL4a6yecQz+SfqodSsU4uCQi6agxPCm33NW3mGTVwklb0EfkkyE667l800pyhN
	KA0gzBJ/5lPWJlLQcHN9xy6WYXwEwcZksZEM5pQDsDw2LyCGkASrwbBIwqkWUIyZdkg2wn8ZOZa
	sOzX9EABm0u8mrI0mGKKY=
X-Google-Smtp-Source: AGHT+IFc0PxKRmRSwma+5BK2z0BfbuhbWCK5ZAQiNCh/fQVQ/f+EcwX2yper4KDcLK2LLWDZAwXkgQ==
X-Received: by 2002:a05:600c:620c:b0:475:dde5:d91b with SMTP id 5b1f17b1804b1-47d3639489cmr187665015e9.17.1766837853435;
        Sat, 27 Dec 2025 04:17:33 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:17:32 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:12 -0300
Subject: [PATCH 05/19] printk: Add more context to suspend/resume functions
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
Message-Id: <20251227-printk-cleanup-part3-v1-5-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=1815;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=ZR0iR9pvZGcVZSHwNZDrCThadrViJMyV5/bfGtiN4gw=;
 b=tA7/rFTFgz8i0hdAJ53eXVaQiZ32fF9Si88T8AKGgxMwsJDyXHg4gS+HXEQzjoX95zhxiaqSG
 v/P+ZTpJjf2DQdqlDkpPXA8mgBEajKQf1Xila0zWamPBwICGf70zjAA
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The new comments clarifies from where the functions are supposed to be
called.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 kernel/printk/printk.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 173c14e08afe..85a8b6521d9e 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2734,7 +2734,8 @@ MODULE_PARM_DESC(console_no_auto_verbose, "Disable console loglevel raise to hig
 /**
  * console_suspend_all - suspend the console subsystem
  *
- * This disables printk() while we go into suspend states
+ * This disables printk() while we go into suspend states. Called by the power
+ * management subsystem.
  */
 void console_suspend_all(void)
 {
@@ -2766,6 +2767,12 @@ void console_suspend_all(void)
 	synchronize_srcu(&console_srcu);
 }
 
+/**
+ * console_resume_all - resume the console subsystem
+ *
+ * This resumes printk() when the system is being restored. Called by the power
+ * management subsystem.
+ */
 void console_resume_all(void)
 {
 	struct console_flush_type ft;
@@ -3553,7 +3560,7 @@ struct tty_driver *console_device(int *index)
 /*
  * Prevent further output on the passed console device so that (for example)
  * serial drivers can suspend console output before suspending a port, and can
- * re-enable output afterwards.
+ * re-enable output afterwards. Called by console drivers.
  */
 void console_suspend(struct console *console)
 {
@@ -3572,6 +3579,7 @@ void console_suspend(struct console *console)
 }
 EXPORT_SYMBOL(console_suspend);
 
+/* Resumes printing on the passed console device. Called by console drivers. */
 void console_resume(struct console *console)
 {
 	struct console_flush_type ft;

-- 
2.52.0


