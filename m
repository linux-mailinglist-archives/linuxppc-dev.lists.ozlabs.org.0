Return-Path: <linuxppc-dev+bounces-15036-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACC0CE02CC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Dec 2025 23:40:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ddy8s3vQmz2yFl;
	Sun, 28 Dec 2025 09:39:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766838019;
	cv=none; b=SrWDD5OWmCMnu56ZpBn8OMvBSvP0alqNH2Z5/GD3ANeBpqPLHCPaorHYEtOMBNsyP3HuSHboQzElKaU4h3n0F06hBSrYJQcAICooOy53jAgEDn1tUAzSRjRi5RQ/pbfsdM2nJeFoNjZ0fCCOjA93YZy5CVhHkm2hq0wrBxStgw4wQNNOYyqTx9xjoX7jwu8JVb6e50q4OYIMmsM6V5+ocq9j+XVNSiJDq3+WiU02YU3o/hXJOfulNKB9GhtwUJo87Av4UhfcY2QvrwhjeIvVgXl3P7KnnU/dYllffLYEdMkDDcMFxl2taNZqfV7Cf6cpjKn40+Hoi+KGm+/6RfP3+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766838019; c=relaxed/relaxed;
	bh=ejU77izjbpiitWXY1CFRfcJAx1qt+ylV9tDV0w1mOdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CHfKB7+Fn9Jui0J/DnTSwxlKzp4o5xaob1+n82RvH6N71LfRb/YsQ3LIGXP+8P31L0pmi8a6XWKjlbjI2ua4vRCOqyVeldHUiqyARsD35hj3auprxJ1z6OZYMourNCfzMjbWVMo1QlpMXh8tPcV/WBNwBNr0AteFETt4AFMgL32rFfWbLkEdMcFz8+Q5VmFU92YzKpNEelm3iPek605JfgpLmKQL7uuvwErAaI9wjpXpbMEjYWMHoX7LG3Rjmgv+3xooULT+RQIMF7g/b5P2Et5A9JtyVz+NMZ3aHxzutp9IVZHfkTsqRIRnO2no4jgE94rA2JsL47efykc4o6YjTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SqpxOS9X; dkim-atps=neutral; spf=pass (client-ip=209.85.128.49; helo=mail-wm1-f49.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SqpxOS9X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.128.49; helo=mail-wm1-f49.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ddhQB3Dhrz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 23:20:18 +1100 (AEDT)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso31865765e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 04:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837956; x=1767442756; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejU77izjbpiitWXY1CFRfcJAx1qt+ylV9tDV0w1mOdk=;
        b=SqpxOS9XSNOs6syBWSU2h5kTaLS953qG57WRNP5yEvUlh9FnYhTt11Nx7odFj++pmf
         hhi9L2dINtfme8MimjqQQ26vI0X/FZYap//qyfkZbDOujA8n/8EK4JbzWmOKFv6+7yk+
         /T2yrTQxQ/c3WMzfKwGKFv8jDs15FxXuQ52mcv2lOLID3pvGbjjv0L/V6V0omQoYYw5p
         EtgQnBvKMGnuDeTnWuSQkuvwz8OtNLcAefosUlSPtn7cj6u4oUdSjBBgXWjSA2AM6dVr
         qgDI90gXJRViA2clVyOSnqYnGrSjXyH4BKK1QoDleZMkVylC2u7W6fZZg7XnXwMp5QXD
         oB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837956; x=1767442756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ejU77izjbpiitWXY1CFRfcJAx1qt+ylV9tDV0w1mOdk=;
        b=wG96t47QjOO8z8n41SdOw9/uM//itfp2JQrIm4tDFrx6dSRxXMArnOV1EV7VzyNJMY
         +IRB+lgI7hU1n7eFTd0SQXPDizrsNd0dVwm+5XDKLfcNjsMDECgVg4eGwczWgPVT+wzK
         OHt1wbXu5g9Es+xkj4D1ydGI0t2mdGhVQbBPZ/R0sEIl+/PP4Hap+/iMMMEtxBeAncHd
         sN9qHVUYnvdzhd5SM6Cold04HkbTodqGGXH28dcsb2nFi+V1Zh2SJt/P7nr8QYhAUhqd
         uJW9SFaVmnVNWqkaCq7xyfLJ191Dv3k87mVB7IY+nW6HLY8nVrfbYc3cE0sjAY/wcV9q
         3x3A==
X-Forwarded-Encrypted: i=1; AJvYcCXaiL2yH1iS4A6LhS2v4DJzpJnz32YXI6OLacfiWhqyLt96OqtzTgKicGq96ggLbKFSp1XX47ESK07m5No=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyHwYZ+R0/D68BgMRLwuTnYnljTxReB6wm0yQJ2V/JKQwIiqJFy
	Jrv/SIRy8S9riTk6Y/NYHpFc29RRewKf/YVsHGey8x2CLQfPY1AjJBlH39mEmD13aY8=
X-Gm-Gg: AY/fxX71Sj+L2KS3RjFRCuBmOK4viWLMdme+/yXyhKsBaRb8EzZt/ROEbK1h4r0c3zt
	Z/ZXJUyhshe93hNJnHp2LgH7gELw1/vi31K282DMnGOLNqf6fn794J7nGltllF6akfwXSzXqI6H
	eUCr7yEP9EpFVhXTIFOiXOcfdNVooCpRBV1CarxMIxtafP+qHMUYYhrKNvBdZv2kqNXEVuxpNu4
	DkwYAlEwYp7wnuyOR7eeunMfj3cwjRlvBZpwKQmYf8U16ZjKi1v452TqONKhkin1LVighQGCBml
	lMPS9MB2tUgDzOE/xSoMwl1XGAM9VS1EVo0AeKn48pxc6LkhogkSwaevLYzgtspWTwB51KvGUKV
	B2fQ4RpZxfFPzJ6Gx+Ut6XV5igorpddIJ0RWa3aRMnR1zdDoBZ6yqVt7dRjCNtB8bNYpUWRl9RX
	FSP2D5uNBJ
X-Google-Smtp-Source: AGHT+IGcVRETU5SGb8qIhgBdGnot/sm969/AEg3tWF/SLDrOBPXwM9NZtaV8oGtTOpkC0w9sxSvHbQ==
X-Received: by 2002:a05:600c:3148:b0:479:3a86:dc1e with SMTP id 5b1f17b1804b1-47d1958e459mr275597435e9.36.1766837955551;
        Sat, 27 Dec 2025 04:19:15 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:19:15 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:23 -0300
Subject: [PATCH 16/19] drivers: tty: serial: ma35d1_serial: Migrate to
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
Message-Id: <20251227-printk-cleanup-part3-v1-16-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=1239;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=jiVyzdGaYwwOjViBefbG/4tnbA+IZ6VTt4S6NyPkSWY=;
 b=Y3ytKQigesyzk6xu3oPXbBS5mHTUJ1mX1rT6WRhai16pDTDKrILE6MzhKcIyuYvYQYYU9QQLY
 +jUI84bHhmDDBPQbqZ6BL7ROSTnYW/5U7XoL9eZmy1wASQ14fgiWD4j
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
 drivers/tty/serial/ma35d1_serial.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/ma35d1_serial.c b/drivers/tty/serial/ma35d1_serial.c
index 285b0fe41a86..d1e03dee5579 100644
--- a/drivers/tty/serial/ma35d1_serial.c
+++ b/drivers/tty/serial/ma35d1_serial.c
@@ -633,7 +633,7 @@ static struct console ma35d1serial_console = {
 	.write   = ma35d1serial_console_write,
 	.device  = uart_console_device,
 	.setup   = ma35d1serial_console_setup,
-	.flags   = CON_PRINTBUFFER | CON_ENABLED,
+	.flags   = CON_PRINTBUFFER,
 	.index   = -1,
 	.data    = &ma35d1serial_reg,
 };
@@ -657,7 +657,7 @@ static void ma35d1serial_console_init_port(void)
 static int __init ma35d1serial_console_init(void)
 {
 	ma35d1serial_console_init_port();
-	register_console(&ma35d1serial_console);
+	register_console_force(&ma35d1serial_console);
 	return 0;
 }
 console_initcall(ma35d1serial_console_init);

-- 
2.52.0


