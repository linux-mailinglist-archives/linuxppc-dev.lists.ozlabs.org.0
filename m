Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 122677C0243
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 19:09:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=M85XZ6o/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4j7L6w7Bz3vbP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 04:09:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=M85XZ6o/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4j2p2Dbyz3cNH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 04:05:38 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c60f1a2652so420795ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 10:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696957535; x=1697562335; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoCkBvDoaE+G9yGkJwlCtJkOL/TuRqipkz8zh1jvWHI=;
        b=M85XZ6o/AOOekikz2lpv5xmfxduaqDVI4UOzC6cY0FtFe/vUl4LyMbXPv9c5ZdokAo
         Y3EeRuP4yYdYMVJoyRDuhkJhdzgUKXWjddGz5mMefEY+O8Us68ggPO41LilQRvx12p3b
         RcsEcgTqgPs635/YauwruOZ2apTClsiWT1ZQ/nYPka4C0smeanOmSWKNOomYjOvdDzEf
         IWNYhaE7CQkxCi5M5vyxWUbPwLut4gB31RcSN2y6GdWjinPmu1ERjK+sEJFecrppipzj
         Iluw6tXD8xilBcR8SwLiYM6JUyvE2i2pDYanA6osIPV6RS/7fELn14P1AuHXTzMNlzr/
         b2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696957535; x=1697562335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XoCkBvDoaE+G9yGkJwlCtJkOL/TuRqipkz8zh1jvWHI=;
        b=DwpcRgiDW1J7wehmlMaziJX0dvIorPsegSr4FmibmioM3djRbtsTOFbR0ejsy8781b
         ZUqrKTM1IEzgb8naY1foURUu0LWtTSrkb+A4l+PLiohqd0y9I8IdpU054almGPskz190
         WOcyC4oX8/lSCpcPmcdWlJpHpokiYIDV9xbD1dgmSPXUDQHI8Sa6LQ+ie5JcSVx+2H6C
         RCd2Oxwgj8IIM6WVSO1EIUW4+lhp1n+iR978aqdt80RxnppubHXT7urejHX5ejnt9CkH
         yM7gH9OaWFS9K9z2qx4xa2YX11CQfLfnC81p1UPjq1dnp2AI2IeCAUvxAcx0U5KTVm41
         1ryA==
X-Gm-Message-State: AOJu0YyjVIuVk4rhltkr6HX4nyjSczvTHte2zQsHm9ErfzOQmLO6eQu4
	MrxwkDxexiE8f9dd9OEBRd3Byg==
X-Google-Smtp-Source: AGHT+IHpTSgdyOa/WMmXoVeNp80pjqgJQqPCX1bVN2+pKlqZykfXt/hGxysni37Tvg40ZjWZcGGrLw==
X-Received: by 2002:a17:902:d2ca:b0:1c3:76c4:7242 with SMTP id n10-20020a170902d2ca00b001c376c47242mr26123429plc.22.1696957535339;
        Tue, 10 Oct 2023 10:05:35 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id w19-20020a1709027b9300b001b89536974bsm11979868pll.202.2023.10.10.10.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 10:05:34 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH 4/6] tty/serial: Add RISC-V SBI debug console based earlycon
Date: Tue, 10 Oct 2023 22:35:01 +0530
Message-Id: <20231010170503.657189-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231010170503.657189-1-apatel@ventanamicro.com>
References: <20231010170503.657189-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Anup Patel <apatel@ventanamicro.com>, linux-serial@vger.kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Andrew Jones <ajones@ventanamicro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We extend the existing RISC-V SBI earlycon support to use the new
RISC-V SBI debug console extension.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/tty/serial/Kconfig              |  2 +-
 drivers/tty/serial/earlycon-riscv-sbi.c | 35 ++++++++++++++++++++++---
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index bdc568a4ab66..cec46091a716 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -87,7 +87,7 @@ config SERIAL_EARLYCON_SEMIHOST
 
 config SERIAL_EARLYCON_RISCV_SBI
 	bool "Early console using RISC-V SBI"
-	depends on RISCV_SBI_V01
+	depends on RISCV_SBI
 	select SERIAL_CORE
 	select SERIAL_CORE_CONSOLE
 	select SERIAL_EARLYCON
diff --git a/drivers/tty/serial/earlycon-riscv-sbi.c b/drivers/tty/serial/earlycon-riscv-sbi.c
index 27afb0b74ea7..b1da34e8d8cd 100644
--- a/drivers/tty/serial/earlycon-riscv-sbi.c
+++ b/drivers/tty/serial/earlycon-riscv-sbi.c
@@ -10,22 +10,49 @@
 #include <linux/serial_core.h>
 #include <asm/sbi.h>
 
+#ifdef CONFIG_RISCV_SBI_V01
 static void sbi_putc(struct uart_port *port, unsigned char c)
 {
 	sbi_console_putchar(c);
 }
 
-static void sbi_console_write(struct console *con,
-			      const char *s, unsigned n)
+static void sbi_0_1_console_write(struct console *con,
+				  const char *s, unsigned int n)
 {
 	struct earlycon_device *dev = con->data;
 	uart_console_write(&dev->port, s, n, sbi_putc);
 }
+#endif
+
+static void sbi_dbcn_console_write(struct console *con,
+				   const char *s, unsigned int n)
+{
+	phys_addr_t pa = __pa(s);
+
+	sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
+#ifdef CONFIG_32BIT
+		  n, pa, (u64)pa >> 32,
+#else
+		  n, pa, 0,
+#endif
+		  0, 0, 0);
+}
 
 static int __init early_sbi_setup(struct earlycon_device *device,
 				  const char *opt)
 {
-	device->con->write = sbi_console_write;
-	return 0;
+	int ret = 0;
+
+	if ((sbi_spec_version >= sbi_mk_version(2, 0)) &&
+	    (sbi_probe_extension(SBI_EXT_DBCN) > 0))
+		device->con->write = sbi_dbcn_console_write;
+	else
+#ifdef CONFIG_RISCV_SBI_V01
+		device->con->write = sbi_0_1_console_write;
+#else
+		ret = -ENODEV;
+#endif
+
+	return ret;
 }
 EARLYCON_DECLARE(sbi, early_sbi_setup);
-- 
2.34.1

