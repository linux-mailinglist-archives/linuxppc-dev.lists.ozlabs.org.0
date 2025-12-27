Return-Path: <linuxppc-dev+bounces-15028-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FE4CE02B4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Dec 2025 23:38:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ddy7t37Zpz2yGq;
	Sun, 28 Dec 2025 09:38:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766837945;
	cv=none; b=awK5nYz4jlKUWWa4WhymiIvzhdCjOnBwKLDk57JdYj4xeFYea7Prx69BH+lCd0YTT86V1csdgQeqFVHBwotCV+a3pxJ7DEwLonDgMXsqvhoECCOnlcjniY0lDA/cwfrmSNtWynUQXw9z5jn8g8O5Y95VI61oIdv4K0/XMyHDTxaef9Tzjppeq/wfbqSQbb8TH8u1AxGd2RbG6wlOV4zqaYKfMGp0H0COhxXI1c1JV2qVtYBX1IganLg5T9/MaBUiyMPllyAqWO8TANUn8Pzsd8XtScdcb+MwoSEWZcIJ4Hdspsv0tpM3m9fLsKscd7PR8+QuKa6Y/PJyuZiwcn0K6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766837945; c=relaxed/relaxed;
	bh=YPj481dav1h3nWeyVMYXYXTPRZgLS1US6KZdyNyRyzc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SZloltyElUsnfh5K5S6oYKRxnw0Ogj0Pf6+gUfd3XAVp4N1E2p4GbKBef9ClQTEO/rLaZuuavDBRshcer36WAE8B/375qvfVVFjx/MnjqMj0DTJb0iK9Slw/dCCHlGyu8/nq1wHvKlOcJdhnNuPjD9kBNJ6jEUICKT6hQ9i1yENUFFzYe+y2/UPE+HRJSlfEpcAyyrNLRF0iCuBswQNnVxhSBrpCtnn1/yE7hfqqNPSQlMWUdbu7xJsUtMB/QijfhJxW2xVyID65qpod35uSirxNfb88nWxFYKk2J9cHxRMN52SI6/VXtay0N6Pz+pjOrGeLRfVvC4y0SivYD3w9jQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Q5TEPpCZ; dkim-atps=neutral; spf=pass (client-ip=209.85.128.51; helo=mail-wm1-f51.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Q5TEPpCZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.128.51; helo=mail-wm1-f51.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ddhNm5qT6z2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 23:19:04 +1100 (AEDT)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so57868795e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 04:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837882; x=1767442682; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YPj481dav1h3nWeyVMYXYXTPRZgLS1US6KZdyNyRyzc=;
        b=Q5TEPpCZtf9/x819/1w6SnibeQd7bNzxVBPqIvPf3R+yAMMjbEK1IrCbFwbiolvIjQ
         58CSNih82hc3KqFq+XCRuONwFt2as6bsbNxLrH88avhg3AB8T3MJncA2awit7VtD9ulT
         opwFgvqDbWcN91IaUNlKopRljd7zqz0pVHrINTGgOzA90Yz6VNtPu9ARgnA7BxUexILn
         Gik8I8FavJ6QHOYhgdyaXwuEqUfT66qHWYaxZFClZWv0IqKH8pghXH423gmFInNPlcIV
         Zsv49jDMmVN6TetOoPMnu9KP0uUURK6Ah/eztEcW7io/hPC33QxZs5IJWE5qK8/n/uBs
         3qiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837882; x=1767442682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YPj481dav1h3nWeyVMYXYXTPRZgLS1US6KZdyNyRyzc=;
        b=feDBixdoeGWYnGjSGTIWmsesla4oB8O5Tv4jZLWNX8c/4XpdhrAZOWwBzBn7AFZIur
         PFc5HRSvuwiTChVBh+psH40GFC+b5TztZcBggCx/qhxTwsUqZ0qzKmJyOdReRgiwAmLZ
         tGLK7W5L3G3dtQ88sEGDtpfNXy8cIZOFaSej5vypwXv0WrWTPxo6oX21gasApVOkX1N1
         +dcM/wcDf/GUns3bD6Ku9FiMwAAmMvGRtZLiEEY3YC0X7Y7cmZIyWOIqorxR0qpzrpNS
         oucWPtZul2Nls288JHo0WDJg0ca51xsF5oPH6hI5IiVVufVbxx+stwOZE8ngdNSvbEA5
         q8mw==
X-Forwarded-Encrypted: i=1; AJvYcCVQjsF0Fb7KlP6FRkkOFK52Dy1MH2DxmIGYJhXXP0A/D/lHXLqcu1gzc/b3ZxRvj+mn/eNdccCIzUB7icA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyydUgR9bDUgTpTiiBhopFZM4urNygUTji6F9PGv5hMqtwawkj/
	YKpuOIY1VroJwjtnOoZY5lXOrEULn3EWwR5i0VvBTNYBuLw9ml2eARcC9fztOioMvLY=
X-Gm-Gg: AY/fxX5gyJoc4C6eS1ZssP0haGX8uZCR+zEazjAkkYPKq3UYCwf0LHrTWr8Z270deCo
	mefj0hZNdL+Pt1A30qr8IlQcv1awI8axzckDiqHxULt2dOSaUgWiO2SACfBeI9xwNNQiwFniwbx
	+oMBa+4ld/uwEbq1O5HY9AGKyWe9yzZWGCbDrRV1QFo+nzxqwkLkoQSWu0BOgc4xRj46kF8zi4d
	Quz/i8z1qF6cRz/bZpXh+A07Swcuxhps+1yj2O1QfOnnTKNjE/scW3C07PwQRbvoAJwCG2kQUxY
	bbnO1Zv4Rxrm4YsMfcqAAIoEG2TVqC1oahfvZahyw6C4z9uLDlXcKypvQ3GecULuVLsYQfmM9xI
	CKJqILWEZm5sG8SVsKX6YFSfHuW+Sd53XUqFMJMyXanw4/Rm6KStM0JS4EhRamrvV76thd2TCPW
	LGZSPYcuJA
X-Google-Smtp-Source: AGHT+IG0mR7FQaw+l23lNeDI3HZ2oGPwNQnJRaTrq28MQwyhH5VRn+b1LrDgTvBXBb163N6NepB/tA==
X-Received: by 2002:a05:600c:198b:b0:477:9fcf:3fe3 with SMTP id 5b1f17b1804b1-47d1df12f84mr272520785e9.0.1766837881680;
        Sat, 27 Dec 2025 04:18:01 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:18:00 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:15 -0300
Subject: [PATCH 08/19] debug: debug_core: Migrate to register_console_force
 helper
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
Message-Id: <20251227-printk-cleanup-part3-v1-8-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=1369;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=i+edMET6/ej5N2K5avM5O831EcMojt2VSHcuUrQdfTw=;
 b=frjUdDlkDnmz9ghHbQI85g3SWQC6r698VmLv/vY5BaR0ZhD0fZI/A4RKNedga5QpYNhkZRCmF
 1wOfSuqi/z5ASQwxAphrFcarhmThsZ8zA4jjeiyha2OJh22t8WzJ4PJ
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
 kernel/debug/debug_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 0b9495187fba..4bf736e5a059 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -941,7 +941,7 @@ static void kgdb_console_write(struct console *co, const char *s,
 static struct console kgdbcons = {
 	.name		= "kgdb",
 	.write		= kgdb_console_write,
-	.flags		= CON_PRINTBUFFER | CON_ENABLED,
+	.flags		= CON_PRINTBUFFER,
 	.index		= -1,
 };
 
@@ -950,7 +950,7 @@ static int __init opt_kgdb_con(char *str)
 	kgdb_use_con = 1;
 
 	if (kgdb_io_module_registered && !kgdb_con_registered) {
-		register_console(&kgdbcons);
+		register_console_force(&kgdbcons);
 		kgdb_con_registered = 1;
 	}
 
@@ -1071,7 +1071,7 @@ static void kgdb_register_callbacks(void)
 		register_sysrq_key('g', &sysrq_dbg_op);
 #endif
 		if (kgdb_use_con && !kgdb_con_registered) {
-			register_console(&kgdbcons);
+			register_console_force(&kgdbcons);
 			kgdb_con_registered = 1;
 		}
 	}

-- 
2.52.0


