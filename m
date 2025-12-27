Return-Path: <linuxppc-dev+bounces-15040-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A9CCE02D8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Dec 2025 23:40:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ddy9b31Vnz2yG3;
	Sun, 28 Dec 2025 09:40:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.67
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766838028;
	cv=none; b=YisP5dnCnv2leMYyOrGUK3m1wSVs/zGu5zEalzsBGaci733kg4LvChm1oB0EggKZMLq4MVAbr27Mk4YJQ59KE6YCQnrSFIiLrC/NlCcU77UD4UhLgsE4i5g9XHjwCuULjtCoIYCPzHUJLvOH3iVCt1ljMThJw53Ys00sxE4mIN0qKWJNXQXA9yQ8BpTQOh7a9k+Gzh3I8rWQj1O4EGapj0/OtnK4P6KcL9bHoDK761RxP22wmnJR6zvoUyY6Ur6z9WX9WgcKF8jvhJgEbsQWCaI0l97fL/r1GGBqePXAopRiLe6+mK9LwtgER6Mxqo7fVnSpOU3KAWkXKxJbuDdp7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766838028; c=relaxed/relaxed;
	bh=PI64KbZN9t1PF6ymgBKKgUkODGeQdgLto8SJvKTSB0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T6ktbk358A+UbJYbH1hyRIFL4zv13+bAKT6EVqF72ukB7KEk82jOa0kZy8t+VizQy9hHyjQOMX3mRnbh/+2kKTSo5M1relEOfFkSB7egJ8GmBa2UzPhbXyvCuU14vhvf0iPfJ5aSY6ZSj2e3arut6/FcHX49u0uT/xgrFyOxgMDXGrB9EjiLEWYIfrRYaHmVidLb0yATpm2PKRmj7nfFObv/zYX4pwlyEEp5vsSMUwJOJzmn0+z7YeFXPU/Qis2anei0jIL+rEPcS9KDBKNEL7gc7aJ7apzqysUET9YkwQrnDNfECzsuPJJWi5Jai+kkSjsYexaKMUNbb/L14kQNTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Cuy2CZ3j; dkim-atps=neutral; spf=pass (client-ip=209.85.128.67; helo=mail-wm1-f67.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Cuy2CZ3j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.128.67; helo=mail-wm1-f67.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ddhQM4zHNz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 23:20:27 +1100 (AEDT)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4775ae77516so75663085e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 04:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837965; x=1767442765; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PI64KbZN9t1PF6ymgBKKgUkODGeQdgLto8SJvKTSB0M=;
        b=Cuy2CZ3jVWfra87gkExJapJoQX5WBRCaJo3NLnhuQCI2sH/R7RnzaLyPHMAlEayKq/
         Ay23FkvpPerD+t2/xlSBCRpWDcWT/qDVfZEIJlHJDTeBPQ2QLMEkCSehlze5KX5pvUQf
         YpuyG3y2MiSly8B9aPdrBUzBDe/tVptV2Sbdpkzd3y2kaBAKQIls/Awl5fWEFLPVdDZ+
         A2IxUYscO4fLwCZxWrvySI+ki2WTrW3Z+w6q+StsmrKDoppfX3Jxz9v4gktPG9DR6kGV
         1VQCJ9F/DLwulode738Vuh4KpGiPdNunX5elc/ouxuO+FC3Hj3v4jTntj4uFQSZ+zbD1
         s1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837965; x=1767442765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PI64KbZN9t1PF6ymgBKKgUkODGeQdgLto8SJvKTSB0M=;
        b=GMzmlW6Fae+PIBrx9hgCwQzAffBB/MF0cJCWVnFCZND1lCZDWLJ+6MjfsqiO2zyzOR
         A86Ne0eD8HZe+7ZJ7Mz48gnr1SoXKimhYb2rH8E8HX6zf2hVmSjjGakiLZd4CQdIpwBc
         WxpFsXyUZuAGaKVPaHACn91zf8POkm+EtVmlb5NNQkEHSUv7vpfZNFtVuJADgnDrkLd7
         HKhJtzcmBSxH2fHx4+NfR+neIJAMitSWhOo1cBiubXW/KXGAhZNX/jY0+dBvkwyDJLcs
         MfVJy0NRvyysyjbzGxbdoA00SXqCdcp1NNJGq6KZly0RbkW0IGPf9ry2sUw+CNwcysEd
         WyYg==
X-Forwarded-Encrypted: i=1; AJvYcCVnNqbPPTPoak9E1YBnbeswPfRPTYa/VVbM8pcu8sMtou3+Vgs9b/OFSW8DFWacACzzEQC8ghukZKI5WiY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwLflKUBbZyuhDGPgxvmqt1IeuEd3QF7XQBBAO6ORYsFEvkEf1U
	lDwohl9mkRSP0Fe5HM22cIP5Jua9c9yYGs6j8Xg9cIBIydX9T4tdaWOBfSRchwepc+0=
X-Gm-Gg: AY/fxX5j1X+eYMrlWh9dmhe4Ko/b0Ash3piRJZAjb2moI6b+JHIW1pkAMo4Bx8Yb4CC
	Dbo8YDMThZgbIKvkPnrVki6EmGImnbwGqZoGmfyRtgtADqRW522jZnUXffKE4UJ5VedOIdkAhtV
	n5TwZ+AJdDmBypUQ1zUD7fXh9ZbFN15uuLA3bTSzZfsOHbAKzrErLLB+wcZI/hN0EZpU1puzuQb
	JpoCHiEDdtyK/OXwGv74mvTGUkITiLs+w1JQGq/EK92bzCli+WLMTw+qshCE82nB5MNbewW44yu
	z0JGVnhgEtgdSpjSYAqV5IQEAhEVA3HV1UGKjt7+5pqmRXsnNM8w2MNj/mxrQq4u28B8UTJ95kj
	MZ9Lp7piSR+kCIjHwJrHFTSyruWx6O9Jk8VjrOziHMFrB78jl9axZLbCUzs66py5LqmKKNzz1eN
	BduVaqfd6b
X-Google-Smtp-Source: AGHT+IEqqHc/Rd2kLfHagj9YhzIrZRGfzwvOOoeUxY4FRXLnI0VACA/N9sgft7uDx22VCc1m3UDX7g==
X-Received: by 2002:a05:600c:190f:b0:475:dd89:acb with SMTP id 5b1f17b1804b1-47d195a72fbmr289900545e9.22.1766837964788;
        Sat, 27 Dec 2025 04:19:24 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:19:24 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:24 -0300
Subject: [PATCH 17/19] drivers: tty: ehv_bytechan: Migrate to
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
Message-Id: <20251227-printk-cleanup-part3-v1-17-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=1183;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=ipo1oJr6oF51GaJ/ypmHdNm6pxSai2H+L3ksWdFz4YE=;
 b=BCXQlMZHiSgf9aACQxFpdYHusJFHrRGAPtAecEP+JmKnj9nHT6kdi2m955mQdUkj992asxAcQ
 YxGwDMjxOJdD2wCUfBrHw1pcuZeGNuCZOOekwLuy8OjtGsDgBHGc3PP
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
 drivers/tty/ehv_bytechan.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/ehv_bytechan.c b/drivers/tty/ehv_bytechan.c
index 69508d7a4135..a2aab48d11ae 100644
--- a/drivers/tty/ehv_bytechan.c
+++ b/drivers/tty/ehv_bytechan.c
@@ -299,7 +299,7 @@ static struct console ehv_bc_console = {
 	.name		= "ttyEHV",
 	.write		= ehv_bc_console_write,
 	.device		= ehv_bc_console_device,
-	.flags		= CON_PRINTBUFFER | CON_ENABLED,
+	.flags		= CON_PRINTBUFFER,
 };
 
 /*
@@ -331,7 +331,7 @@ static int __init ehv_bc_console_init(void)
 	   byte channels here, either, since we only care about one. */
 
 	add_preferred_console(ehv_bc_console.name, ehv_bc_console.index, NULL);
-	register_console(&ehv_bc_console);
+	register_console_force(&ehv_bc_console);
 
 	pr_info("ehv-bc: registered console driver for byte channel %u\n",
 		stdout_bc);

-- 
2.52.0


