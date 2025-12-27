Return-Path: <linuxppc-dev+bounces-15034-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E099CE02C6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Dec 2025 23:39:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ddy8j4syFz2yrZ;
	Sun, 28 Dec 2025 09:39:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766838010;
	cv=none; b=PJz+2HZDfUxmpX+1QlVaRheA+0BvLTOq/A3qO67JTMbQRnNBhFPv+tH2cAZo/7lZyC0QlYYWhjU06+189gujbhWYtoHfBKW+Fl+ANY6iLjQiq2w0Cqe3bZyS5uM1501a08DbTQGauLbzotKJi3t2xsUxh0kdifGgG3B1HTTpeVsz0NJb/OGWHC2y6ednAG2eJ2g+cV9l1uvf8LdquOXAbWOTTvQUcoqM9qvYn/yuPOqjPuDk/jLJWRg5a2PtY51ccqb1D49Br55yM0y2Q0omNOobovKvaHCAgWA3KRTO0Q6nZm/MzII30Rek17e60SlbZVuciGO6cGc2NvOuUeYRsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766838010; c=relaxed/relaxed;
	bh=Svns8VRTDcd692NVX/iQ+u99f8RURxgaz6jdCSTwtGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BFdBLj06vAGQYtSUnV9UsD/golYLTCyh6HDhLgvPEI+qNba00pHVCyS41ebbY6icVOi/LZCY9mQqN6gENY9CZoqjea551E0MvNUvobO40MumNNp9G/d7PG7jEL544yPb3ZQJkDXFVSr//JBmGZRxZWI1SFxL23OStwgPiYcJtOm3AKCwfdZkYdYSGlI9mKOsoqb1/nSnrnuOVceQCqgWgwyyKmOxvayoZCdDG4TdAPwnHNGazC3NjRMrQ0/roE3RmABzSKUpA59fGt1hZEDgIM4lR5BdUtY99gjHhA7WwXD1GwTo9lVDc5Ng3CZTeyYSQUjLwgKdmHhjtWRqcoBbHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EuFF7qrd; dkim-atps=neutral; spf=pass (client-ip=209.85.128.54; helo=mail-wm1-f54.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EuFF7qrd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.128.54; helo=mail-wm1-f54.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ddhQ11d99z2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 23:20:09 +1100 (AEDT)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso75774575e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 04:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837946; x=1767442746; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Svns8VRTDcd692NVX/iQ+u99f8RURxgaz6jdCSTwtGo=;
        b=EuFF7qrdifpXBrCKogzJ/JN1qoGuN+fQpROsGkN94UV+4XtbHlgJ3jtasrEQvQflid
         DrVfHpXuMQCPpcFBUHYYw8jf0LGLrhu0RiddGtIJaIlJaMPd88P15w3EADB/zfNapPAO
         e82YOQbospXKOhusbZKRga/CQZWSXysAyBwZ1Lx4XO3w0jj9qJZZ6iB7J286Cxb0s/CU
         nvLncjcsRxxuDS5YKyIfydywlgKWoi9+JYzgYS99ozcycCDiEeFMCjwzzF5CaiuBXTuP
         xwLB9wRRrB0HHSTjYuw6UF2RizF5ejTJf/gMT9Xk8qch8PPcWXcq1gs1rdNgBDy/SDpz
         o7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837946; x=1767442746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Svns8VRTDcd692NVX/iQ+u99f8RURxgaz6jdCSTwtGo=;
        b=XQEPoaRo3Pd9rxZnUeebH6X22hynFynqSONE3EmiVWZxw0HG1VgfindDllsez2K36k
         gDaa6jiBm4zCgfkbJjjUabAIv/BhaywBhrk1R07Dked034NrDLqkRhFExzedpoeufcss
         uwHLRbSdIQlbpV5VOPLN2JWYhGF+qdI+AVIA7QkngqXbiW53OmuNGloJ4l23f8kQRf4p
         nZh5mj6p+sd0wJDnSXeJzfIX3NXPoXJR48YjSoqFMTXlAnoieV/NKHDmzO+gwtcfHID3
         R6bBKu3LbRrqAX2t6jPt9H2ub3nbl4O6/ThLognV0O/7rM1QXHOoQEWHwmUAuX2VCdzd
         DdOg==
X-Forwarded-Encrypted: i=1; AJvYcCWARq3DdUy93JO10u/TM5Sh7h3BFAx+Z7YFhq0Ad0N8rm804ma+SxuzNp/a8PPyQh0s91rl9njO70+aboo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwnMRuW38XVqiX1fvM05ELCDKIvlk36FgR9JeJ7GOj4J8lh95ef
	6i9aFjgjj02bKrHfQT8l0aUJDZk9SYBzyL1+qdBG4gmzvm+1ynhW+5AQhTYnJpFmT9I=
X-Gm-Gg: AY/fxX4gGkwqFn4wMO+n6gtW//kJpIr7TO/Rl9hwXfhJKJaSYSx6/lV7wZ+McrIKV5G
	D9DHZEsmSmO5q1+0GiEecTq5dBcFAqAQkTnQe7TnOkM3wwSS6zsmnLPY0zTOHNvZEIQ7Yi4+GV+
	UQeokeWM7pWCiaT+YIIWJGRYlKw09Tz4m4jM20Iywqzt4anzl3KYJthJVKko/XGxvPaWYWaGFQf
	YhvFZf/wHGDEIXIk4mhfYtZdVLjnyDTeX9BSQ5CU1HLwGEjVD/9bNINRfvra/XVFNjqAiHvKxns
	p5Cewq4F1jMiQl2kGdxmG9Vy9Jl/RrSc06YSZu0KKBaGa5KjXT6SMFZ/os3GUkD88bf9Le9N3JY
	CWGygdc9Es0FcTTUAiKSSJNiyYJzm/B8j3zJ3UQEDQZEriWCuz2L7e7tq2HOHywWbqkUF6+QWqd
	00LPtIWPOd
X-Google-Smtp-Source: AGHT+IFQPHp9+ZXnfJ9gaFXvmbmtROboeRiL3XR0blYfmQMI8wXzbSWqjXdBS1sjkb/JteTKHl2ZOA==
X-Received: by 2002:a05:600c:5303:b0:479:3a86:dc1a with SMTP id 5b1f17b1804b1-47d195c2d7fmr223567305e9.36.1766837946357;
        Sat, 27 Dec 2025 04:19:06 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:19:05 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:22 -0300
Subject: [PATCH 15/19] drivers: tty: serial: mux.c: Migrate to
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
Message-Id: <20251227-printk-cleanup-part3-v1-15-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=1068;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=8apb8xIF3Rmf3METSNa3/bIFoDSqesuSeq+cEdBJRMg=;
 b=SOQn5veC0enOSDBgUA8xgjFU36YeIU5ltm01mWbteI/FsjC7wSIvDCGkCl9Jt9bptuqtwUiUT
 XJt5OJVOiy0DmhgN+BFidqaWmVu/I5CuRGxAmhAzWOivaZFVrPO2ZNN
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
 drivers/tty/serial/mux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/mux.c b/drivers/tty/serial/mux.c
index b417faead20f..5a2d706b9cbc 100644
--- a/drivers/tty/serial/mux.c
+++ b/drivers/tty/serial/mux.c
@@ -390,7 +390,7 @@ static struct console mux_console = {
 	.write =	mux_console_write,
 	.device =	uart_console_device,
 	.setup =	mux_console_setup,
-	.flags =	CON_ENABLED | CON_PRINTBUFFER,
+	.flags =	CON_PRINTBUFFER,
 	.index =	0,
 	.data =		&mux_driver,
 };
@@ -547,7 +547,7 @@ static int __init mux_init(void)
 		mod_timer(&mux_timer, jiffies + MUX_POLL_DELAY);
 
 #ifdef CONFIG_SERIAL_MUX_CONSOLE
-	        register_console(&mux_console);
+		register_console_force(&mux_console);
 #endif
 	}
 

-- 
2.52.0


