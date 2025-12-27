Return-Path: <linuxppc-dev+bounces-15031-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0736ECE02BD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Dec 2025 23:39:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ddy8Q5gcCz2yMv;
	Sun, 28 Dec 2025 09:39:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766837991;
	cv=none; b=EQaY491upPvXb3635YMq/sQX2vUskvx7mXmOZ/Joc4Bf0InoVO0c6Pd8TphskrT99hakLgnVeU4PncXOz2ip/doQ8hwm51RjF5JJcoArNL3Sd1OaheH2R+JtleFyyCKE0NkGGnU3rgItXurtULjscrr0PCucTRbZjLuf7YPho6f8KBly7wJfBvBgldfaiHJY7e3B7n8/BWR7lWFp/onpgq8bRMIhxuXmoB14pU7G8rTeqjqgKyFdppos/jVPiHyvbU1nLP3KeqWtcx04+t0/4a/2FKv/Vhg7wA+YmxUA0f1PF6M6ZlT/a660pcWazh+5Os7cKBfO42k1dEHKDpuviQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766837991; c=relaxed/relaxed;
	bh=NC/xlTHSkC5720zy/KPT378kGxggptiwCzT1YNGAqrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NKKb/qoQ2INy0OrSkUfwTKxnQF1rBySK+UO6JD84+9lE/AssDjik2lHFWrZ38ndVVCTyd2rePlbpqYryIBlpY8dFEq8z96EemXiLKejqfYU9zasu6fQJpaeeWIV53WtPfZrSkbhixh8kf0p/YdQrtFoHHhvJe424Wh6KXIkg6rbZlDLvv5GF0X32Jn8eTcLoSdUXJJrJ/F8nZzaSUAh6K5gA2Qkgqbw5GE/iQdGWobOPYn9aN4K8bsSkzNataU8PgZoBn//rLe2oaKQxi59Sg5Pp3UpcBzCmO/Xcs54XAptkC8I/Dy3gJWrSo4ZsQlq1Meg3nDlDGZ15e8zvFjmzCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VMjd60by; dkim-atps=neutral; spf=pass (client-ip=209.85.128.47; helo=mail-wm1-f47.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VMjd60by;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.128.47; helo=mail-wm1-f47.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ddhPf57Bjz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 23:19:50 +1100 (AEDT)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47d3ffb0f44so13339945e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 04:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837928; x=1767442728; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NC/xlTHSkC5720zy/KPT378kGxggptiwCzT1YNGAqrI=;
        b=VMjd60byIzgj6nlc10KXu+x0VSctuAjwEK5Urfeem/7vIftyGOa3x3MMkzB6HCQSsE
         IcgKNt/2UoqJz2aucv8uObT25GOu8cYX3HL+QyhQ2L1LARQ5qGbqix6K5dF6GjkBdaHh
         l3eRwn5/WW/X7faW/bSHIQZYQKDqud5L6jitB5YWj3Lcx0hN1gohGYuDCmKgyyLK4VoB
         reuF0UuydxbsCJlo/quy9nClPL9jsiY+IKmcR4XjEozQJ3b4cO69MUlG1WoiIm+IPm8H
         //n4EaLCd345z1EvDDmQszN/inqpIyHnrlBW2fqLJz1OJXua4QIuL29riQTArURZ2rHI
         grDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837928; x=1767442728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NC/xlTHSkC5720zy/KPT378kGxggptiwCzT1YNGAqrI=;
        b=f7WoezB38raRYbB1rCAk+BmZe2j0oWF/zZoMFkyEnZe7u50CaMaZLS4aGf4jWl1pEn
         qj7b5hXrW2o4XamyTMfAVCRF/NlfGglJRYP3qIrOlT2Udpq2jiZ3q9crx+c5e9SBLuSb
         ARMQVs9BHNdTnU6SemGDuD1AKaWQWKu9qnvKY7Q41dB16uuL03ZgtpaWjXt875140BRC
         75B9q9+YZ4721CD5TPCH2euDzK/kUxrqju4t2NjpSTpg3blof/2YNbIs/pmIowaniwk9
         Wj266E96tIN4ojhmsLO4C97q+K6oFIqTQFJIJy/RL9iK0hyng0f9KizL+8WDq0bXwTjf
         yrtw==
X-Forwarded-Encrypted: i=1; AJvYcCUNqGPzCbGXtoPJpU2QEXxdohQwW0lDmzJ5DMQA1Z+Gkoi2m9xPz/b/rgsMDh1jwgz5vTRJpC5ImhjaIyA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz7FVzn60zacL8LC3yVWw2UD1MdRiEH49J4J5lKxqrBKiuYXye/
	tI7HVI4YtIZH+UbvN8lh0pXBsjycWFoWKoQ/vL0h3AsPsNJ4SshZREJhk35YokDuM3E=
X-Gm-Gg: AY/fxX6zO+iIgJ+KxgSHo/oN2J2bqJCl6II0UraeYGPFr0ZiKwkTfNsSvYxHbVyF8Kl
	J84m3CiwfrLAl0Di30BtRyWGB70RSyXsnHTmsczoYbtaXzimXVlzHzCm5XPog6rJmiVKwZZ3LE5
	OzKNA22VBlzRtZyNhAN/3vwPl142SHnmVC+nbqFrarNAgqF0wL7Lc8rceA+epRdep4ZDx7Jk32y
	wupaPqLfA2pLPKe3SbE3GxrLYP/FUlvoEyFaRRYx9KGepyH8nmKXZ05biGApw2I/iBDHvhIqXqD
	v5mq13tobs9Dno5Yqziq2WHmuUXEZoxyq6S0OLUPLlVd/SkfAOSi1Mx3XgNTMCZHaLWuib0iYc9
	GlC2IsJBPeS/zjW7QDAxBtlD0Ny1+O3bufDOhZ+TfxRWTDVaTwYyIF11tvnSaa6Ze2UkCToFtOU
	mFNA21/R9x
X-Google-Smtp-Source: AGHT+IFbCGvkCxGExFQLBl5yaU008gmiVvRdmeb7k0sjyaCh7Z1nYJocCXv7ZLYKC/Juko66305eyA==
X-Received: by 2002:a05:600c:8183:b0:477:fad:acd9 with SMTP id 5b1f17b1804b1-47d195a9834mr270395745e9.34.1766837927833;
        Sat, 27 Dec 2025 04:18:47 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:18:47 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:20 -0300
Subject: [PATCH 13/19] um: drivers: mconsole_kern.c: Migrate to
 register_console_force helper
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
Message-Id: <20251227-printk-cleanup-part3-v1-13-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=961;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=9A3Brx5a3gQ0NUhTGZ1ViMT9HfTuP00Tgzee1GwnjVM=;
 b=gNLF1CEZIFvupLFUy4kgNSgx2QLue8Fjf3sjVi+zSBhpSIWUfb0laNahgF6qahlq6x3pophwD
 dRykPPu3R/nALZM8P2pCpkq//4oDFgsmNLGc4Tixc+Z0JIXH+9rAGGe
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The register_console_force function was introduced to register consoles
even on the presence of default consoles, replacing the CON_ENABLE flag
that was forcing the same behavior.

No functional changes.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 arch/um/drivers/mconsole_kern.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/um/drivers/mconsole_kern.c b/arch/um/drivers/mconsole_kern.c
index ff4bda95b9c7..ce4f4ceb7f27 100644
--- a/arch/um/drivers/mconsole_kern.c
+++ b/arch/um/drivers/mconsole_kern.c
@@ -582,12 +582,11 @@ static void console_write(struct console *console, const char *string,
 
 static struct console mc_console = { .name	= "mc",
 				     .write	= console_write,
-				     .flags	= CON_ENABLED,
 				     .index	= -1 };
 
 static int mc_add_console(void)
 {
-	register_console(&mc_console);
+	register_console_force(&mc_console);
 	return 0;
 }
 

-- 
2.52.0


