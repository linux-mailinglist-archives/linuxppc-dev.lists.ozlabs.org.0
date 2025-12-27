Return-Path: <linuxppc-dev+bounces-15037-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08270CE02CF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Dec 2025 23:40:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ddy8t1bLCz2yvh;
	Sun, 28 Dec 2025 09:39:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766837982;
	cv=none; b=K3pc0vMnAG4tD7BlJ7RE6QIWDdqVi6jZYH+u9ul7l8oDPJpP24BBYpdlD/XpeQyVHfkKP6qQX9Dr7AcyigBz9oFumj2qoxy+iyuSRooaPy8palsDwfJhXYPg1djgSqXVZDNrLdGEoDOf8wW7jeDJRnwCZySlDS0w7nSZwRr41SJ8XWjXaaXYawVZPzVchRdmi66FzYE+0z5gt3pDsN8Hcv9rYdpI+/1yaUPvMXACLDwWLiCyPfoUgOKGW1luGYvUrqTAKn4b+8AKZ+qtpD+hvBnKJVFNetUpYvnpNWJdfqF/xEE7YC+NbKc87jQPauWs2MwJPpdgOxgDrcQFx9MMYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766837982; c=relaxed/relaxed;
	bh=zBuTaAePekdaKhl7Nr4xkMCH+YbgmQZc5bDJsdsSluc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SCyph18JhVCoNYjECuFOvjE3KdQXeZ2Kf6+tV7BQ0pSaA6KuHA0bwpFolXMkYRBqWn9pIo7TIgITqIuZQdZO1nW52ANP0DLo43AWRLgEmiXC0Eq76k2P5lFybWda+vZkrXXMNXi2PtCyzWlkYQcbGjtBwlwBI0P/PbJ24OirRXl3Tqkm1oJ6CqHCQZrZP8NivC9HP4rAthYn9VcDfv30gWDyBBUAjlF5DTr5xBJ7x+fD6YZMgiyXNRbjJZswwvz1jVZRt8qbH/1+g4jjrHdKWpiF4Soo1ppfNNisgiRhosryVqiDOUKDUCeeC2PlXABeKWFY+OrZDiJNNtPiVJRLqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VP+sOdbM; dkim-atps=neutral; spf=pass (client-ip=209.85.128.42; helo=mail-wm1-f42.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VP+sOdbM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.128.42; helo=mail-wm1-f42.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ddhPT3xZVz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 23:19:41 +1100 (AEDT)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47774d3536dso61937295e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 04:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837919; x=1767442719; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBuTaAePekdaKhl7Nr4xkMCH+YbgmQZc5bDJsdsSluc=;
        b=VP+sOdbMKwxQTk7gmbndtYRbV2zUj69H4M03hQEmWpMA0Cz9xOlD5ANe/dWj8b4g9t
         X+mFrGoDkFnwYAQ9OopXTdob4feJZA1ekU1f8uiW7kxP4wQMm8Z69Vn3fe7GgtS/LnjA
         mL561J1rxGmmiXnQeekxRpRsecGHTYMGc9/b9nPzZVMcfouri9NsbKtNYnZpChqh4RQf
         EbW1uNvdX+BsmbhNpjLH+ECptAy2HbtZ4e+mcrC++VDofeTdyhcWeuQiMV/bBS3OQC6W
         qJhVKzmCamu5+f6JsiUTq9VhlwlsDPuMHfszWzN5M+JP5GBxbZ3gCObgKzJoMWA+49RO
         AdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837919; x=1767442719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zBuTaAePekdaKhl7Nr4xkMCH+YbgmQZc5bDJsdsSluc=;
        b=lx4U1Cb6Dl88b3LyadrioN/affvGnphD80pPtO1RUM+HVmiHt+xiUjTGCVLIsGAVUe
         J6+kQCiTDR1OABFjZWmdFEgUApeDIRHckmfujvg3jh3MVg5H0dXWaeqA5vqJsfBFZLDS
         7IBYN/ZufThnElIalNhoFU7kMn1WcWUUIk7kSys6CCryztT3TaoaVi/bIEu4zJFmfY0o
         kYatMlK6x4sU3fc1mnd966PkDAWtILMwrhRU1VUpsdMFJNpTCDEuijK3dWANFJkcbAB7
         ePIfIsj9ZoTol9TGcq3HWN1XKau7GMh6ITMoMWKY/J4jvH1+SIr7gCsy7x69XG5N1s1d
         02iw==
X-Forwarded-Encrypted: i=1; AJvYcCXGSRYBMJrlyKCAbZf710VxZhhg+WpQrFOFwE7An6dzZocF1fZ0b8aBXES8mKAgsVoW6UvIPfpZ4NK1u7k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwQqFxBKNBoGoYGtW29nvzL8a1JNucPtyhA1T+iAKupbkvFBv03
	orPuhYezqpIN1v2DUyC4xTDQYXvwieKNU3+QMdtoLsaMUe5yjzN745uZTaSTtuBFaUg=
X-Gm-Gg: AY/fxX5fxi8OJPpTxTcUaRE6kiEvui0XYrSocSFOo15M4zIWeDTPB0atUyn/9Kbswlp
	jxxI74KYNP2MuY1Hh3UMHNDrCAbs+R2i6tnOL8Gx6Jm6XzprFoRmFmYmKSRccXdSaGWdnMnu2i7
	Gjgbx528BFI/bj7gNSVbeWcM75nfXfpSaDzRkMPbaGLe8QbDC2xdmEkWum179/aqQ9VyssQ0REb
	kv76yUuJQYmRQax0HhkU64kzX5w5EJjxcGhog5gOhjOORm5YRMi3c+FLIN3/+m71wbgIPN2cyDz
	YMH5RSCQ8jrT1A/pxAlFK0cEAxE2dtXCB9hYPRNZ5NxcfftBwGmCwyPZZVzDwroMdvNbIF38Jpi
	p4/Opfx5Kj3tfHotqJRI/u8qPDrneLu6qH3Y3316aHeaf++8G6l/lW0GtQoWCM5ke8QfIaDTuxF
	ENHXOXJb57
X-Google-Smtp-Source: AGHT+IEaiNWrbXUQR9Xr4SWeWCswjY7G2xsTNDPKS34qx+Z9cd/RVKqDItuoVsaN7WK8NMfB3mQH/w==
X-Received: by 2002:a05:600c:3799:b0:477:a71c:d200 with SMTP id 5b1f17b1804b1-47be29e87c1mr231953365e9.11.1766837918587;
        Sat, 27 Dec 2025 04:18:38 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:18:38 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:19 -0300
Subject: [PATCH 12/19] sparc: kernel: btext: Migrate to
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
Message-Id: <20251227-printk-cleanup-part3-v1-12-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=1119;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=rI7fN9M4UYBhm41SNkDmrXmROIuX+aCv9rIYYOtlo+M=;
 b=bcNrmzf90N/BodrKZ64tr7qsRPh416urxDwc2BxCBqWgNmTslPpP/9rT1ZURe+mv3PmWaFnbq
 xnM5PWTrVU8APb7FwkkZf2fGZ3Hw2PsJVWl1KwMiIyJjzl33goH6hX9
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
 arch/sparc/kernel/btext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/kernel/btext.c b/arch/sparc/kernel/btext.c
index 2bf558a0c568..951de7733632 100644
--- a/arch/sparc/kernel/btext.c
+++ b/arch/sparc/kernel/btext.c
@@ -301,7 +301,7 @@ static void btext_console_write(struct console *con, const char *s,
 static struct console btext_console = {
 	.name	= "btext",
 	.write	= btext_console_write,
-	.flags	= CON_PRINTBUFFER | CON_ENABLED | CON_BOOT | CON_ANYTIME,
+	.flags	= CON_PRINTBUFFER | CON_BOOT | CON_ANYTIME,
 	.index	= 0,
 };
 
@@ -320,7 +320,7 @@ int __init btext_find_display(void)
 	ret = btext_initialize(node);
 	if (!ret) {
 		btext_clearscreen();
-		register_console(&btext_console);
+		register_console_force(&btext_console);
 	}
 	return ret;
 }

-- 
2.52.0


