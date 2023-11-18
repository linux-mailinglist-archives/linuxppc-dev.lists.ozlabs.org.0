Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB57C7EFD89
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 04:42:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=dP5B1ed7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXKNT63t7z3vfm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 14:42:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=dP5B1ed7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXKJv2pMtz3cRD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 14:39:43 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-28003daaaa6so2214177a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 19:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700278782; x=1700883582; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ii/r8hzimL/XtavRWrcGkJgKEnLeFuQkfTAUm70Wb2A=;
        b=dP5B1ed7vH/bj3YUgWc/0rxBWZXZhDvbZC911AKMiQ+wbuNCD1lrfJe+CapCwxf/5h
         VFQS43ag9N7IWIIMzHOyetuY+trZG1PUcC+hWfI5H8R+h4cKSITlQJrsOE1J78A7J4Ft
         Hk2xe1nBOj+xlWV/3MQr3SXKAb8ZNCrdoJqJGfp5W7WK4RziBLUkk+OkTcnsyPXS0wIP
         Ez8Wnvs5+Eigc5XYdJlwIFRmYgvIRWI7yODXEYhNMLdfx32OojY+g/AvKsoU8ALJh7Wj
         KHAw5O5V/dtD9Qi9nHtzZG9bgt/L6mzBHC+fmwlyhisSOpv3B+P5716iqbQMjAJQy9BE
         HnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700278782; x=1700883582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ii/r8hzimL/XtavRWrcGkJgKEnLeFuQkfTAUm70Wb2A=;
        b=c1lHL8vI6rXMl2Q8uIMiHohVPFEQqnSwn1siNtMJiUZ0xruG7j8ycsYRzI1Bj+NLUw
         ePTDLBbiRwFwzONW+tW5npQdlrJY0Auydiw+f36xk+KPis8zC34Eah19N7ANn2xptYKA
         ktvSj2hv4tpM/7RpkUx/Tn30jm9uVFqSn97hWmF01IuTjBgXeg4OEtL9KDiiIH7q52Gp
         JC2kvC0Aq4V7jMfBbpuQ1ynqqUOivaqYSfERg3O3D2rPqHRM5HLK7i8LryGO63MwNk4m
         oVVmdlmcLuXciVKbTZQt3EEQBVVYyvHVReKywQoPnAPQQb4PWwoi4ai5/P0QYM/ebtsI
         IuUQ==
X-Gm-Message-State: AOJu0YzH2AYhklFCmLOSBTtFuPAt3hvSVE/bMZkF2UdJJ70gZHbl1hlt
	yVjBvg5l0lPHYnAcsPOtORnbDQ==
X-Google-Smtp-Source: AGHT+IEnlmvKg48AWLtRJlHz9Rg/Q27+8No7s5ojWvtL/WdnvFdbsfi5N3eU9MggG7ZhT0nUoF/4cA==
X-Received: by 2002:a17:90b:38cb:b0:27d:1376:3ae1 with SMTP id nn11-20020a17090b38cb00b0027d13763ae1mr1378816pjb.0.1700278781572;
        Fri, 17 Nov 2023 19:39:41 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.80.108])
        by smtp.gmail.com with ESMTPSA id cz8-20020a17090ad44800b00280fcbbe774sm2053823pjb.10.2023.11.17.19.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 19:39:41 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v4 3/5] tty/serial: Add RISC-V SBI debug console based earlycon
Date: Sat, 18 Nov 2023 09:08:57 +0530
Message-Id: <20231118033859.726692-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231118033859.726692-1-apatel@ventanamicro.com>
References: <20231118033859.726692-1-apatel@ventanamicro.com>
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Andrew Jones <ajones@ventanamicro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We extend the existing RISC-V SBI earlycon support to use the new
RISC-V SBI debug console extension.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/tty/serial/Kconfig              |  2 +-
 drivers/tty/serial/earlycon-riscv-sbi.c | 24 ++++++++++++++++++++----
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 732c893c8d16..1f2594b8ab9d 100644
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
index 27afb0b74ea7..5351e1e31f45 100644
--- a/drivers/tty/serial/earlycon-riscv-sbi.c
+++ b/drivers/tty/serial/earlycon-riscv-sbi.c
@@ -15,17 +15,33 @@ static void sbi_putc(struct uart_port *port, unsigned char c)
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
 
+static void sbi_dbcn_console_write(struct console *con,
+				   const char *s, unsigned int n)
+{
+	sbi_debug_console_write(n, __pa(s));
+}
+
 static int __init early_sbi_setup(struct earlycon_device *device,
 				  const char *opt)
 {
-	device->con->write = sbi_console_write;
-	return 0;
+	int ret = 0;
+
+	if (sbi_debug_console_available) {
+		device->con->write = sbi_dbcn_console_write;
+	} else {
+		if (IS_ENABLED(CONFIG_RISCV_SBI_V01))
+			device->con->write = sbi_0_1_console_write;
+		else
+			ret = -ENODEV;
+	}
+
+	return ret;
 }
 EARLYCON_DECLARE(sbi, early_sbi_setup);
-- 
2.34.1

