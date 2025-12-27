Return-Path: <linuxppc-dev+bounces-15033-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C99CE02C3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Dec 2025 23:39:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ddy8g52sGz2yqW;
	Sun, 28 Dec 2025 09:39:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766837964;
	cv=none; b=hWCr6+XiF7GnHiDZI011nKGjpCOiSsYzlulbbDgGDca/Fq7qIEbBrzEdm32joHVx9o56C6GWYnMsRUiqgUzgR4s4CrACH6oAIXKz6XBq2gKQ7ovCdT4sJEim+yYFVsD79FZY3iibTsYbk2ANUBGEfW2a2KoJPNCbtQ7ROqhLPQDdqB4KY5BVROe5rkB+TG/RWJZGrc3Sz6xYN1fnY6vlFX4z5nGhLvQSys0FzaP1U6nXlUzHLf3XKBb5qq8P3lBEDIJ1SddFR8blfqr0hHBmnDmtO/EUFBo+j4S60nq/dhW8buzni9Rub0jROEAlZUhwD9bBp3JM9y90ZbKUbshNqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766837964; c=relaxed/relaxed;
	bh=oUj1yTYG2OsJA5NR0t10qcegAjlFezEaj2Q6zpglNnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IuIjk7gsFz6Vfw52Gs2m0tmrQrRnDpSVLyHQA88/MVT3BmHyk0koVXyVAgZzu+lmw6vmXvj/e7HPJokzBCY6CPAlRqN2AlgGfg39kv1Y7kNOuiveDPVRwl7aIB9ujqbMNyQEHzJXDCWI8a17QX388iSsoVlQVPpWrcZyQbXtQ1c83t1fUsQoEWbJyvxwH1uVCQD4wdAZCfsbD65iN9Ks0u7X3qQuQoiGlXtlVtUmpcl9H0TH+L+aGShlIuAa/C6hGcrzMvCTsB+qD62OxP9vZpBTEffqvPd4V+IZX4g4hSPO2WRezt53b8FOreIt+p7FQSyOwMacIBPCxSlj6BXaJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=grUHxSjD; dkim-atps=neutral; spf=pass (client-ip=209.85.128.66; helo=mail-wm1-f66.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=grUHxSjD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.128.66; helo=mail-wm1-f66.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ddhP71nfqz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 23:19:23 +1100 (AEDT)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso42194345e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 04:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837900; x=1767442700; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oUj1yTYG2OsJA5NR0t10qcegAjlFezEaj2Q6zpglNnU=;
        b=grUHxSjDbhoi1PRxc+VfiTbN3bN8cyzpVNUQSigRbsbOwja4fjrqvOd1zZMM+3BXln
         Nis/FOV+XuKr8gf2BNWD/ZmmmoSxouUX4jNHoGnhkBRSktnV+X50RB/iTO5LhfVPURbL
         JGQzUWR6Io+EjDRyVbkicL/RZswbUjrc53dQe3z4iRjwdZRd6JLqwCrmoujaCaAU6AbG
         pNZd6CYac3XdKoxmgGnCr4L0DSuC5JHn+dVU2GDnzGXuW6J54Bqqbg/YoXe5vEcwjT4b
         ax+PMN+LY56nSlweqaBXMQIqZkH5uJMXc3Sor+pxDIKa/D2FL/WajgS+vjRBdggkIkTJ
         dsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837900; x=1767442700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oUj1yTYG2OsJA5NR0t10qcegAjlFezEaj2Q6zpglNnU=;
        b=HtvHFn5vMyrzjs6FlSaoEFKMRldboEBMepdz26X80plvjgYlLR95WSG8xAEuTGoKil
         qybBMp7iMO8WtJkf6XJV5dFMVqU+FAxRBZXCsNf3AawFbnWpBQRxdEum92U/Hiu8SwOI
         A9koFz8y3aGcG1ub1o1YUqQa1++tOjzU3V+WaGpjtHBYXYnH1FL1+HByTymlCOeOVOxg
         kJhRuhEj3NsJ4ah7eMv7zNoupnV3mlOrW+eMya9i35vvKxMVxZi8aBgqwx6hunoU+P/G
         ql3e4nJmhR2tTmXHROn2Eika9rojLw5eAOkzXl3jqDxBPZVtJkCHj6dHpVRNcvKJH6gU
         vQBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5PvwaAw16nBBqxCIKk+G008v/zKOh62A8MyPwnXL08UlGCQzLZ3sGdloKXojCwL6vYyg59HoJFQNg1jY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzOHx6bMFsuX44u8FFDluOgHDpzrDnOmSkxf+mDh1+TxaWkKo7d
	pbqhUHtbjpdLAR/NEC+tNOZJl6cWt5SekB3I3Ekz0LkWhHDNIfFHyJEXPSpG8svcG2Q=
X-Gm-Gg: AY/fxX5UDa8V/AUGFaEIubKCqe9hXlKq0/MDptfFTuIQXZPaqnHRJ2HriT/jEe/MN6l
	xXG7cv/KWz+6tI4k2LnO/2hAfxGgzkV3kWQZcRPWS2dzlQxpffn5qmKbRNBIkTxldOJasX18Luw
	AVbYrVQZzZYkGfRWh4xlJ7jjqfoaA80QBiiSIJ8EZz48OxPatUzUhy+SvnpaRLj7GKSAW8a6RVi
	RkJJEkkrz87lKk7QdQYxRwn1ujZZG9UCnujQ96+eoE+7DpLctkZdUwsNdm8j5BZPqWyRu8X4eIc
	iecYzRCcbA9E90jsQQEjMy2TlHUCjYiDqEdWwRwVk/qqjZE9PIS3KHwTj0CVi+KbfoGA5q7srm4
	srf+sTwGhCf0hxhEK/1swM9Mv2bQJrjWLqcS0jLk+3LuEa7EoFdPLazzbeQm0EQCDowUKNNtAhJ
	eRFtVp0VyF
X-Google-Smtp-Source: AGHT+IFXI+q7UVcETj2xrgWEDOplaD2DQfL+z5FfnKK5mI2lAjBc9EF1caRTkYKVAlNOUIoqedA3Qg==
X-Received: by 2002:a05:600c:4d98:b0:475:d7fd:5c59 with SMTP id 5b1f17b1804b1-47be29f362amr221645875e9.16.1766837900191;
        Sat, 27 Dec 2025 04:18:20 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:18:19 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:17 -0300
Subject: [PATCH 10/19] fs: pstore: platform: Migrate to
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
Message-Id: <20251227-printk-cleanup-part3-v1-10-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=1079;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=3dvgtN1V/Te+qiB9DfrS6Ouyxfyny3L7qK8ewpooDVE=;
 b=vEVEr1V/PLyTXU5DKxPct4kmpsEX80YaTpb8m+k5Ll/RykRPcPf3SC/5piYXBTRWgZnh2jkWP
 FQP0jQiJpLBB9Qo/wJGJV1aoieFgYcnUso9xzkOCnscVwaYm3IY9A0b
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
 fs/pstore/platform.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index f8b9c9c73997..9d42c0f2de9e 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -418,10 +418,10 @@ static void pstore_register_console(void)
 		sizeof(pstore_console.name));
 	/*
 	 * Always initialize flags here since prior unregister_console()
-	 * calls may have changed settings (specifically CON_ENABLED).
+	 * calls may have changed settings.
 	 */
-	pstore_console.flags = CON_PRINTBUFFER | CON_ENABLED | CON_ANYTIME;
-	register_console(&pstore_console);
+	pstore_console.flags = CON_PRINTBUFFER | CON_ANYTIME;
+	register_console_force(&pstore_console);
 }
 
 static void pstore_unregister_console(void)

-- 
2.52.0


