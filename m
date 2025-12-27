Return-Path: <linuxppc-dev+bounces-15035-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CBDCE02C9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Dec 2025 23:39:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ddy8m0rLnz2yv2;
	Sun, 28 Dec 2025 09:39:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766837973;
	cv=none; b=HvTAnNFCY3qog5r0bT3NVz821YVYlFW+vji+/ZxkjdCDCgTV/vAHNhamKYLyaWOo6JvMHqxh1Awdh03/EHtrfMEFDvz+yi1jMI0qA/1JGekqEOS8YETDwzlz8fjclsIK4L0koCrzXW4mbM5CddItdCyiax+j3oW9SesOdcQKhQIOOPN34rni1n45VSHKlqMnteIfbrIKm/18bSi0rEwPDsl1boVOsm88e7cW1sXItj5MR19xRTfBpj6b3eGYwN6R5eLf+H7CZpQY7mqqf7XzihDnJB4DP0NoyYSZ4qMH7848Io4moLqCQEaXa/Fy7ThxTlpHjWfW6b+9d8EyAhkKvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766837973; c=relaxed/relaxed;
	bh=z9kNg59vMLuZUSj8msr6djkrRczOEtEux+Dq5BMshWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qe5M+XG6m0IyoED8OrDTrM5VFlZX8atzc3CSGrFDYuEYCv+M8QTJUej8uHgN4P0vMVjvlABDEJxwHh3PR0M+pdnNVnUC6+4awJCoTFZss8Bd1uYPeR+k5PsCPm5V/FeU5tOXu/E8GxpaQN9UE7+7yRg0uBn+V+gz7lzHyk2OyXICOORwKSQXY6U602Mt2b/yAG6EPAOiV8EsDf0MUHv2xImbg+v5r9fuKCa1NcZ49bB0p+b5Ipo9Qq9wkbLlBa3pkwp3dtQ68svMspQN9aNViVRUxrf++n0CE4KN8yqqmBATC1cAuqeg8uO9kE4rVUU3iFIJx8rbaQLBpm4wkikXqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FXE+8+PG; dkim-atps=neutral; spf=pass (client-ip=209.85.128.49; helo=mail-wm1-f49.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FXE+8+PG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.128.49; helo=mail-wm1-f49.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ddhPJ223cz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 23:19:32 +1100 (AEDT)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47a80d4a065so39307695e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 04:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837909; x=1767442709; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9kNg59vMLuZUSj8msr6djkrRczOEtEux+Dq5BMshWM=;
        b=FXE+8+PGG/wJLKXgIAZhffTfj+JKY1Xc4hkAM3x02mjTY5ahpxse7rimrnyUJ6QDRL
         zyI6d843FZV8bGKARKSFKTVJRhrCLUNN/lz0YOICG180YYpoDD35CMnK73SXZRmqNv1I
         xuOut/43ARxC+Si8qDUMUcM2+dyKvJPsf17F1DLDsBbk0E7Tx3eNMjGAlHmNbMv6wgvZ
         PaPgrA1id3+wwdc+BPVWvBPgKXRLuKs0EqQIJvOdP666gYYkKlhHKOPJNqPQCtmpiteh
         iKSGb/ZmJqLgxOAlHZNFUqrkvjZFYHQkhDNO8CSsqnrOmKH7+G/9Og7P+EWlSeMIXp0r
         8BNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837909; x=1767442709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z9kNg59vMLuZUSj8msr6djkrRczOEtEux+Dq5BMshWM=;
        b=XgBNThLGPs6y1oggEu9AdjpNGLHRYY03NI9Nq9c4y/Vp55u/STg7p9i1AihRovjOnp
         9vI9vFRn+Pss+Q8dUFU+EQmQ3A196dEElB29TqyNheVEBOLeZ2bnNsJ/C1qWpmTwZMgE
         jBNRWpvrTbZCy3PMOQqhPtox4KGwj7nSl8HWUvW5C04zOS1ium6KV+HGcFsjX44Nicsa
         nd4yFuS4marDRIMncUw0NEDeipcI2fKuraqOLZiZDmQtQL+38gqcW66XOdqWrXL2xOY2
         pGIrNTQhJUlaKW1vtEbhdZaJLoME4XEWBivMaqufdOqOp7NqcbaqcoUgKMlzwNm+Yc5a
         nLPg==
X-Forwarded-Encrypted: i=1; AJvYcCVVnGd9qqe4kYuMvpvnVeb9zmP08of0kJUMWjjnUz858gs7YZtUcy+hCRJn5ZdS/1TXIDWH3zPr4iKidqA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxIr/2GPcO/9ZAXYOFPHaYAUwFJwkB9/KdwqOLH+oCibFFCB6BA
	Yn5hEAZ2wc9nvASF1a2Bz/pd2XGsLQ3aCAZRI/4WO1IXu3XetRnkTR4H3NyVdWXVbHo=
X-Gm-Gg: AY/fxX7ej9HkiMlOz5UZr4ENWRCZic/jjuq5hcJp0/iPs+pWPs3Kq7ppB6QquG+jCOA
	F3Pf3tmrlScJyW90yFvXa3rdYwp3d7hM63uUypUH8uYh5RTi0/ljnJNGoOwwfeq6gvaaPJ4bFCL
	HDwmv2nBDmml2Z4uMvHz7B76lZKbAYo3eGJEntV5YK62+YZEg07nhKCKn5vszJCsmmpR0hx6xpR
	8rMPfmxFZJ4mMz7Rf2Ls9OEgBgkif+wOCzF56gnpIMDBLtFF49abeaZCjR8GXdcuthQrKjp+rmn
	l9IoodUcq2AFX5LE+XWnI9xNLSBKV57Q3HnQ2gt/FlnnkBF/rphofRW+Zbrg/YVOAOf67nOtAAG
	94RxWLBkesB3h3eeXsjG1U5yStqFP2mb7tS9Ta3uNVswZaROiVGjm2v+KDnI2TZw6eVayLE8e2A
	Tnt9Sqv/xuACOB7fawm3U=
X-Google-Smtp-Source: AGHT+IHrtEPOGW5HpG0S0h+CrpgwJd8+zbJNmNN/crxl7Vk2Gjo34WfIR0WT0TkmrlMgn1CALEr/CA==
X-Received: by 2002:a05:600c:4f4c:b0:47a:7aa0:175a with SMTP id 5b1f17b1804b1-47d1958591bmr299387905e9.26.1766837909421;
        Sat, 27 Dec 2025 04:18:29 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:18:28 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:18 -0300
Subject: [PATCH 11/19] powerpc: kernel: udbg: Migrate to
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
Message-Id: <20251227-printk-cleanup-part3-v1-11-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=1180;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=EzMaKsRNP/XrImaDzG6owj2ch5Rre3nG7qKvJVZXc3k=;
 b=4hRgVgEFeE8Kfjdb4F4yho+pOLOr4/h5Rv8YKsyU7Hs44mjvTHW9sE+Wu4jBIqif6kS1nJWUa
 QXrCwGXn4DFCsUQcLd3WwFDkthhp5OOtTZ3i5F2rVUBtIHQVlS2lOkg
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
 arch/powerpc/kernel/udbg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/udbg.c b/arch/powerpc/kernel/udbg.c
index 862b22b2b616..0f88b7697755 100644
--- a/arch/powerpc/kernel/udbg.c
+++ b/arch/powerpc/kernel/udbg.c
@@ -142,7 +142,7 @@ static void udbg_console_write(struct console *con, const char *s,
 static struct console udbg_console = {
 	.name	= "udbg",
 	.write	= udbg_console_write,
-	.flags	= CON_PRINTBUFFER | CON_ENABLED | CON_BOOT | CON_ANYTIME,
+	.flags	= CON_PRINTBUFFER | CON_BOOT | CON_ANYTIME,
 	.index	= 0,
 };
 
@@ -163,7 +163,7 @@ void __init register_early_udbg_console(void)
 		udbg_console.flags &= ~CON_BOOT;
 	}
 	early_console = &udbg_console;
-	register_console(&udbg_console);
+	register_console_force(&udbg_console);
 }
 
 #if 0   /* if you want to use this as a regular output console */

-- 
2.52.0


