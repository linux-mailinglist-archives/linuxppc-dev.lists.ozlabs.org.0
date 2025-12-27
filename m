Return-Path: <linuxppc-dev+bounces-15039-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0F2CE02D5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Dec 2025 23:40:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ddy995pnWz308g;
	Sun, 28 Dec 2025 09:39:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.68
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766838000;
	cv=none; b=DgVeWSCFq3wu9TtJ+4RSKWFMb7CXK3wo62NBxFsqCNY830ct3Y66ODUiezPDNqAwiIBCbyT7jXf3r6QzVTF5yAi98M4Y/fo6lzJwKtpcjdxr/5FJQcjr838pqL3GWU9En4H/ytrv9GVywGoQXauhEnp9QUm9xa7CRRHG/1gIRCWMIcU/TgTJfi2pJFD8DXHBBaYHdIkhHM0zeYX8IdVCk3b3xQR7OjfqCpAST9nGaa3I7RlNzJg5uWdfxLLlF0N4eOUrcHWqPO0tfH6rvwZud62IGJFqj6toB4fVGXmAvqbH55GDNjI4vtqqszAkejo9RZGcLapjY2H7u78AkwpxlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766838000; c=relaxed/relaxed;
	bh=jl/uMa7F0AxGo9UgKbw3ayYmv5/eAGkPJCpV4UBsG/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b1da6obcfmRuQYnccFog8eAOSVKInhB8Trr3+S3EZz/0D4/FIb/QKj+c16G5e9P5htT++kdbkbLVLqimDks+ETRopPw8+mS+bNoAywVxv9EXfb1ZknzBW/2w+0fAqPttOINPiLcZXwR1XN9ZD9H14nw8FOD8s/E7NIvdIr0vR5gax4DlRR7Hn4fEvQYUN+Dr6sWmn2+Lzt289xRNhwwYU9Ht5msjXyIDwEV28N3WZ7PbN9MsnHXvwurYyuNUybidBQgKACEvj+xyOmcafkTt76GDJUNyPc2M4uHxK1s5u5djy0eKXICsNFE3c1+jansOwFmbT44M3MS/kfVmyAbLBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ggEEtfiC; dkim-atps=neutral; spf=pass (client-ip=209.85.128.68; helo=mail-wm1-f68.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ggEEtfiC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.128.68; helo=mail-wm1-f68.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ddhPr0DClz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 23:19:59 +1100 (AEDT)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47796a837c7so50831705e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 04:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837937; x=1767442737; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jl/uMa7F0AxGo9UgKbw3ayYmv5/eAGkPJCpV4UBsG/A=;
        b=ggEEtfiCLE4c2upjpKxYU+jDku5jR86WXvmOyp8bhsSDUCJE+nxLNGuky4n8idv6E2
         k2AVkNdnabvOf41oNc2vnbxtKDZmrCFvoqryG5L8cgfc4im8P1Mn3c4XsLcc/Hpkukc9
         pVqehnNYGFJ/ZcqYRPmeJAMb9jPoGIp+/OcTFvbGyKhom8mVcZP8NVwB43srIItlVjdn
         ApNqdcPw5fEFKk2xN7NCVhk7AidPMeDKBEtkvRRKLy2rtr92xbrg+S1EXULHkbEli/aX
         1oUU/acyeQxurWY2+l2FGlXtJrXCVGIwDy+irjEpGr3NvjzV0rKgEM+pj3URFApvx8Q4
         BiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837937; x=1767442737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jl/uMa7F0AxGo9UgKbw3ayYmv5/eAGkPJCpV4UBsG/A=;
        b=g97HzsXvNO8vEGFDi9jfEgMEuJ1S+ljAnobDyyr9/qJlVGsFvY3N6Q7ltw2aO/Jugr
         DDWKKi5LKy+fg+hcgKiq0hbqxEjGJ9AvPESR9TmX5cv4XgWAxJQPkYg6VtZtwkcZgSNI
         bd96z2uq2M1cfLkydmIN+++XQxu2CLLtAzcX21Xivd3DVsqYFzMI4hTFyghUYibbby34
         BcY3Js3pTos/8rJJXQ9SRYdYZ5lymdB2gzZCAU3xdEauvSGvPaaWYSy/NPcKJNDhRzek
         LDEGOwAJ4toa0q5WZVSIc1qTtzT/QaRomUJZf9TqMdqFzcShC6UjjXrvxRivDQOsmhDe
         sxaA==
X-Forwarded-Encrypted: i=1; AJvYcCX0yJAkobTvcUVr6M8fBIfVTIB+22sxHakV1DZgGwaVSlhDFqp0nEnj5hnIzsTArNtCByJjPjHmooPxdnU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzCLp2Uips0a2scC5C67CTe8DKaaovQf8VSOljBpJc5EUtpeEAH
	XsmS2UWmzLR3Qz++a13xzTsHvVC/HQ2c5E3eIGe12007FvxvWLvV6zEKgzx3Khn98gs=
X-Gm-Gg: AY/fxX5cM03W+2SY2HHDKMboOP+2nL0zuZA3EjweYVxQ44IPhF14/T+YLTR8AWSFDM1
	v1iBEaIBYHf3XCppFOFREMbjMRk78ByFoZQxbmrWas5MSIYXzhUG15zUEPpQJIp4+1W66J1WrnP
	JDoOThA1eI2vIe++ut7FWRCFT59EorBaIr+/HdAYCSLYP94NDvVUr7x8WqiKReGldUbQndazde1
	nOVrywlS1B5+6N4bBbz5tShTo0LhLidxAcu85qhSN+negDzr+IepUj1LGFVkAsZ/EH0UsdhmbCK
	uWjT0a9FKiA+rvwzQwIhl3fVlDMdR/qKista960C091hlZXJRMW/yl+SWd94dBQ/C8dWXDRLA7p
	PxHcd2a/1r5fwCuIS3YlgMstYt5SHtg9Z9lAGryv3TuVekZk5ZKQ+8oOe9OQhZodc3wsEKeYCWJ
	/hi4kDeMEO
X-Google-Smtp-Source: AGHT+IEilNPw9ykBXsWasfDesGg5n0pMdngWI0y9wCDnaTUFF7DpZ4wL0dzMcGNMkGv8jBn79QEjlQ==
X-Received: by 2002:a05:600c:5249:b0:456:1a69:94fa with SMTP id 5b1f17b1804b1-47d1954a128mr290319795e9.13.1766837937081;
        Sat, 27 Dec 2025 04:18:57 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:18:56 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:21 -0300
Subject: [PATCH 14/19] drivers: hwtracing: stm: console.c: Migrate to
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
Message-Id: <20251227-printk-cleanup-part3-v1-14-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=940;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=go1Xoe57mzaY/mIQIq5f3pHcbzGWVFe1Pe8aCGM93yA=;
 b=2O7MS+wSbmBy5GHviNZc0eUrBGjBqbDvdZl/gWh/gmVWu32K1VqnWzIxEikovOvxtxQ1Ut5k4
 SCkXkL827NRAROp5vOzN3LiFx30TLjgXwQqt3ej5ptdr+YtakhrR7Rs
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
 drivers/hwtracing/stm/console.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/stm/console.c b/drivers/hwtracing/stm/console.c
index 097a00ac43a7..d3ae633e3bf1 100644
--- a/drivers/hwtracing/stm/console.c
+++ b/drivers/hwtracing/stm/console.c
@@ -42,8 +42,8 @@ static int stm_console_link(struct stm_source_data *data)
 
 	strcpy(sc->console.name, "stm_console");
 	sc->console.write = stm_console_write;
-	sc->console.flags = CON_ENABLED | CON_PRINTBUFFER;
-	register_console(&sc->console);
+	sc->console.flags = CON_PRINTBUFFER;
+	register_console_force(&sc->console);
 
 	return 0;
 }

-- 
2.52.0


