Return-Path: <linuxppc-dev+bounces-15038-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 150E2CE02D2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Dec 2025 23:40:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ddy965gstz2yvT;
	Sun, 28 Dec 2025 09:39:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766838037;
	cv=none; b=IvpCRWbNnejCJVtW7R5zw1ayqVFNGfHpz2B5fKlX2SU39Po4ttJK93cRUqVMLntZrQu760/oqGoLs8JeJgXl/OtiyEmPpXRD/r+k9DWSK8jPRgomq6xWl0ef8Aw1CqKnSEQqEp1FnWQWo9miI/HwUz4jLBu19e1InukQ5YDuiIMxJmUdntitINWqqprkBiB+77Dvk4pKqkTCfHdkt3mwYfQ6WTu/HD5gB81djfJBrDacck/W11goHSUJI1j31FlMm1Ne3JuB1/uFJfvRgyTf2QDeu1bnVNB7Prxeeyi0+QolkOi+0KhfxMjXe+6oBLx0WbxwMeEMnA9lTNKgPp44kw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766838037; c=relaxed/relaxed;
	bh=Ltdd8M4LmPmBXDEHAaMGtcqMVaDk3ISf2NYRX3F1G54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hIx38jguOxLSARikeAfjj16fB3H41H5qEyX5wQ6p9PPSHcZ/z1VLEy66je82IYYYrHF7JV4TG5qaZqdPagZlAFSKtqdF4M6mKX3qAHcvJCLLdFzg4U07FbnfbJDkXOP2H1IA7wfiQ3BT+5eWyzULb6pbUKmEWPAcNWiqyBPQxeuD/QGptn+CD5SzCv1s+qwSNZWvqauaFV7dEQQW/QraMNJKlQKB1NoDdgZw7EeKyJJnNHluHtEgJVBIvshI4aCIiw63R1FIR+QQYYdiT7kWraJeGsOgmcPbmTGL8B6FmzAXuNgcY/Y0+XaNDHcBp565GmNdkQZxOHnjBKy68X3v0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WIdEDi2N; dkim-atps=neutral; spf=pass (client-ip=209.85.128.51; helo=mail-wm1-f51.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WIdEDi2N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.128.51; helo=mail-wm1-f51.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ddhQX6Vtrz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 23:20:36 +1100 (AEDT)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso49248665e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 04:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837974; x=1767442774; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ltdd8M4LmPmBXDEHAaMGtcqMVaDk3ISf2NYRX3F1G54=;
        b=WIdEDi2NtjKmFW5V9tqpvSX7GStg7rpNY5vji8nBiZut0S9O5DuGbzxCuK+VDACI2b
         /9zkTisblzn8tiWHtqc7iEzzeexU+iEdZFiHfjp6Uy7I32SBtlBQsEtafYg5b7dJKFGJ
         pCkDgDbWmtIL1L2ZrKTB+QHsk1/iKEVpgti4c3pmDY5siHkFTIzMJOYYj7npG+6QVeCs
         pZQ4XTlSozbgdpDDgiGbV1GqAo/ZVfEU4UblkVFylx9t/YYmM0RymdHTQThQtyK16WoS
         ntH8yDMyl7HKoKNirUb+/IhZVjTj/YBCa1xkTfPrIlrjcBRWl4E9xTFgtstdudkM03Iw
         S3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837974; x=1767442774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ltdd8M4LmPmBXDEHAaMGtcqMVaDk3ISf2NYRX3F1G54=;
        b=Y87ObJYt4E03yEj8IiWRR4XRr3KSmvcKH+tXxiFsHanW8oeq20X8j55x8o3vZK2IkR
         15ilFlouGfNuY4u6C2PtDKLPVK6GdQEIk9twmrbJEw8fQelsHBWj+WM2a3/35llkFaIb
         2qI1cCo5sy7bOvcSe+PMvCu3Z7IqJZVBY2rCyq9ha1yHo1NXBd1k5Kvss0H3C1XvrtYP
         ADxmlM7FuDVZYYixuu+Fk6TL9aszF4pX6Vvzm+W8QKe6QPwsc2hao6HZRYPb6C/l0tci
         PcU0TCDv8dl5dte+0ua6LOh2spn/z1C3KUArmW5C0r6B2Oup6L3cZum/BpguhmtlKP1O
         6new==
X-Forwarded-Encrypted: i=1; AJvYcCUcBOZbM5yEUZVS0BKbGshO3yn9ujsjX9nlmmgSiEK34ob83HNQCJg0LYgSq/k0+Sjs+AI2b69DUNJi78Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw26x0/cVUseDJph6ZE5IYmzYvtlIV6vzSXn8CO8xdSnNn1PjSR
	r3d+sZ2amTMiiRAqFfDRSAfan6StVfx6+sWNpuiMgGGQKUPThTi619Vc4B9YZqAHwkI=
X-Gm-Gg: AY/fxX42jDkeaPlyR/rUqzo+Vlh+NUasP2SEbwlLgIjvN72RGCVq93XKmOUwV5Dx126
	sfD+HCXa+QvGcY/2gbXYVQAA28OFVWuvavSegRX2m4rDgXy4YrKR4wZBpv1iIth/4rXde/+L5aa
	a/W/OOyGRKUkXkQA8Ck1y1AevBJNNE6QEUHELd+oFXDJLMCYYsDMI53bJsqeq5yfc5MaL5+U7gC
	R8WjGrROwx25knSC6AIoAU0mnfOK2mayDZMplNYCAit/T8Bp2dqS+zvS/lum97pR3Lb5EQrGb0x
	dd/0m+5+kLtrSe/A0wYg1GoWUTCRNCgOuZgjnghI/wxYpbNGwqXUu3uvw8vuh5rye5pj8QkQ13Y
	V24516xBc+UzzB+zBhNYB6tQHZ/eMfhsXIaI7+rFOBUBaD5UhQHdg6tp72G/XJ1PIeqdHFX7+hJ
	SIxRLHQ4BA
X-Google-Smtp-Source: AGHT+IHMLS3VfYivW6iZyjAkGRbHMebp8EGQujmDyd6LpCoRzo/q2pR4OLsY4m1yHd+Dy1qj+iz1Lw==
X-Received: by 2002:a05:600c:5288:b0:47a:75b6:32c with SMTP id 5b1f17b1804b1-47d19532f91mr239061855e9.2.1766837974046;
        Sat, 27 Dec 2025 04:19:34 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:19:33 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:25 -0300
Subject: [PATCH 18/19] drivers: braille: console: Drop CON_ENABLED console
 flag
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
Message-Id: <20251227-printk-cleanup-part3-v1-18-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=917;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=M+RAaPiD4L8bkGcekgUNUpTeF+sJQV6vQniznC8VslM=;
 b=VNcSKbW4wn0ZJDPmlW3fCDrj2qqqMiKzMUpnoUVSmYqwNJRukKGa+p9lja5itToGTVwI9LN+2
 mQPFka3TIBIDqDnH2JmGqErVL6l4YMmEx/hbdpLg4Ll2XIa+vBtsfSS
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The braille console doesn't take the same path on register_console
that other console drivers. At this point, it only registers the console
and do not receive any printk message, so we can drop the CON_ENABLED.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 drivers/accessibility/braille/braille_console.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/accessibility/braille/braille_console.c b/drivers/accessibility/braille/braille_console.c
index 06b43b678d6e..0b7ec68b305c 100644
--- a/drivers/accessibility/braille/braille_console.c
+++ b/drivers/accessibility/braille/braille_console.c
@@ -360,7 +360,6 @@ int braille_register_console(struct console *console, int index,
 		if (ret != 0)
 			return ret;
 	}
-	console->flags |= CON_ENABLED;
 	console->index = index;
 	braille_co = console;
 	register_keyboard_notifier(&keyboard_notifier_block);

-- 
2.52.0


