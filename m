Return-Path: <linuxppc-dev+bounces-15027-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E933CE02B1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Dec 2025 23:38:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ddy7n1gdzz2yRM;
	Sun, 28 Dec 2025 09:38:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766837935;
	cv=none; b=AWcgZ5sRn4+TRZCJMZHVawcmntWjSEG2RpGOGS2d0j/F6LM11BGPpk5UspJpCKe5cNf9k3rbqwHOLBrgWrHXoOM5rRCLchxU1OKqzUq0NG1vUH/cdbnumjGs1gnQTv9sy0XZkdd5Tc9ZtNC3030ab61MvZJNS/BOWAXeCihsoaAJ5Ez9jn+qxFgXV0+Qr5gZnHJX1eiDQW+aphqDYJhyBQArhAgQfEvQ3gpF9pHXXqv4tZT/i0K/rhxsPLX4MDiMcnKCjO7hS5x2LT5w8mirhoZ334DFuLSXJBjUz8DGU0vaJ8rjkx/raJz4BhZhOixsGZD7IPQP5x1f9Q7E/wqHxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766837935; c=relaxed/relaxed;
	bh=8WVQ5l6OvuwNcTcqNwKXFrwDkeL8FFp17NQ/ZoKZRdE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IBYhxr5hosU0WArBGNoSWgz1f/p5rtN3e28/3PXnPfwU/VTWs4VYeWRC3Dn/lvn3LDIvCPbCCLYd7VLIqGgk1HoEopO8wzLdHr75eY6O8t51J1JtJ/p2CrX3KgeTTIeD4BIdayR40byrF4oNFAgQvqJeLD7WLLMbM+cgQeRQYanZ7p8sqDz2dnMS23qj2HooeewGndwn7OwLymUXGORjt5JJnLavgfsUUzVr4g0wUQJ3+2ar61IUx9m1eEiJ+xWsS/d+50HWyWEsC7cLb48pGj8WhxHJge2UYyoUQ4KX5ZtrrprRGGLEMIuIVy/7ZR6gkbeizcS7GI5GoZgARLFeHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CNUUkm/+; dkim-atps=neutral; spf=pass (client-ip=209.85.128.48; helo=mail-wm1-f48.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CNUUkm/+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.128.48; helo=mail-wm1-f48.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ddhNZ6r6Xz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 23:18:54 +1100 (AEDT)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso70900875e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 04:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837872; x=1767442672; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WVQ5l6OvuwNcTcqNwKXFrwDkeL8FFp17NQ/ZoKZRdE=;
        b=CNUUkm/+smQzUf8Kzg1bnPxZjcSbTCRuGpdjDXAYcaR7q0OfhIBtudxulowL/d/3gC
         Qc8CXztYWqNwkvVjpN7HdwYl/eWPolnz1HDAvsAW6Mocu28CUUa+buyFskTj/FUO8zJK
         1IGxRFfq0Yu4gbNDcM+I5Flttb7PkMhrO7iJmTbGmbZa+PbfKYsl1rj3YPf5ooCDvskM
         pdaG7AGLWYUrEsY2rh51gONcTaSy9cWzh4fu7c15FbiV3pR3z26dP7JbSbUYykpxLzrH
         8fH4R52NYN5R/akcbnJ5YLFDIJThzseRppWCMRLEJqoR3bfrVS1+C6f8i88HdEWR6oBs
         2x4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837872; x=1767442672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8WVQ5l6OvuwNcTcqNwKXFrwDkeL8FFp17NQ/ZoKZRdE=;
        b=nMJdMkodb0QzjBjJhABIEFOYzizbTQDoOPJ5bKbrFb7g4myC8hkVs8oZeEMhFSMUuz
         W4ufiUaqVULxLZmteMo/H/b6LLXFbiWXoXxxGIaGAQFTZhyBP9dv9ADSkBdPqCuIP3kP
         byvNmsqocCsFLqdLmrnJwo3y2R5ExWbHXLYDBwNJe7NJkod7seyBxbN3b/HEU7cYJ9Da
         4g5oEc1q/aNdDDfp3Ct7sjsy0Cr9aol2FB6mKRfvYOHsruIQhR19LJIO9zla4WNrlgZG
         +2aRBKzNfWE4RRVPTUzIuFNaa6oOToEHzMEI61QSK8qHqkS8XjC7MLIsWZ7f4oO1DC6L
         xd9A==
X-Forwarded-Encrypted: i=1; AJvYcCX1BWlqytvqCx+k1/tspXs2sgCJLYlirY9zZApQtnsZhXlUNuRx/R2OdAFuLVt64JKV+LNW2RmBh3v29bc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwSy3o5KybGOgbMHiGgYeKtkk6hWAvtOoPpceP8gfrOEL6AK5Rh
	vqpp7227l95YVCnu+PulZg5f+rE4IJk4ES4LS9HftNKZA7rq074oh0ZtnXVrzRXrsdg=
X-Gm-Gg: AY/fxX7y0O8B0w3Tq6Vwbbak4GE8MLpJOfuXj1pfQ1jV/4IKH8HiHLPxpRA9+UY5Jgf
	60wDoBBH5FYvVNEIOOk4nnJbws4FAIVWPsZj/XtR4s/mdEtLACiqeBoGOXheVlLFbRjHI0VZKgm
	YME56RTl7tOcre4h4JccrTMlsdmDdyfKR1ifi1ALKgTGN1hkApGUTkhBCW0YVyinSaocCwRtvzN
	fZZFQPKfJUsN7gQJkp05epAAF067ndkuT+Y8cZ1kvhFv+PbIn061QmcqgVj94JD5CjsB1ZAuPUJ
	btn4uKNpnlhvujGO0bIVKr3LCaTFNVkmug2CffW4fFefSY4twVG2m9OQsAKUvi4ZfiCbd8/QziL
	p9gWf6BW0akD/ANkSM6GrQYWbRTqu63g1/5NPHLMcjY34l0Z2NXzOXJX+NC/642G9/R4Uofh2Nl
	1t5dLwFZ0t
X-Google-Smtp-Source: AGHT+IF/XDCpzgWo6CWLRHeKJmnECzN+dRl41jhTKGOm6P2nA90X9/hReUsAzbYAQmyiLuP2DWyXTg==
X-Received: by 2002:a05:600c:3111:b0:477:b642:9dc6 with SMTP id 5b1f17b1804b1-47d195aa79cmr275082695e9.34.1766837872067;
        Sat, 27 Dec 2025 04:17:52 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:17:51 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:14 -0300
Subject: [PATCH 07/19] drivers: netconsole: Migrate to
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
Message-Id: <20251227-printk-cleanup-part3-v1-7-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=1917;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=oiRJqd24xNJBRHp4bn2koH7CqQq/f2UmEpMOGnQzYhI=;
 b=PNCcHQvlH3xv93I4pBS5nug5ofRvIPVdGmJf0P9wllAmoEtQiq8Up0JT6yGQIvoJ3BjyCDLfA
 69PIUeecq2AAR6MO/z2xt/dsbeEPhnFU/DPDF0NwOHQtgJdH0eloVGe
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The register_console_force function was introduced to register consoles
even on the presence of default consoles, replacing the CON_ENABLE flag
that was forcing the same behavior.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 drivers/net/netconsole.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index bb6e03a92956..509ab629d95f 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -583,16 +583,14 @@ static ssize_t enabled_store(struct config_item *item,
 		}
 
 		if (nt->extended && !console_is_registered(&netconsole_ext)) {
-			netconsole_ext.flags |= CON_ENABLED;
-			register_console(&netconsole_ext);
+			register_console_force(&netconsole_ext);
 		}
 
 		/* User might be enabling the basic format target for the very
 		 * first time, make sure the console is registered.
 		 */
 		if (!nt->extended && !console_is_registered(&netconsole)) {
-			netconsole.flags |= CON_ENABLED;
-			register_console(&netconsole);
+			register_console_force(&netconsole);
 		}
 
 		/*
@@ -1917,13 +1915,12 @@ static void free_param_target(struct netconsole_target *nt)
 
 static struct console netconsole_ext = {
 	.name	= "netcon_ext",
-	.flags	= CON_ENABLED | CON_EXTENDED,
+	.flags	= CON_EXTENDED,
 	.write	= write_ext_msg,
 };
 
 static struct console netconsole = {
 	.name	= "netcon",
-	.flags	= CON_ENABLED,
 	.write	= write_msg,
 };
 
@@ -1971,9 +1968,9 @@ static int __init init_netconsole(void)
 		goto undonotifier;
 
 	if (console_type_needed & CONS_EXTENDED)
-		register_console(&netconsole_ext);
+		register_console_force(&netconsole_ext);
 	if (console_type_needed & CONS_BASIC)
-		register_console(&netconsole);
+		register_console_force(&netconsole);
 	pr_info("network logging started\n");
 
 	return err;

-- 
2.52.0


