Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E6B7F6CAB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 08:13:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=I3bZ5MYA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sc5n332WNz3vp6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 18:13:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=I3bZ5MYA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2001:4860:4864:20::31; helo=mail-oa1-x31.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sc5jW6kKGz3dK4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 18:10:39 +1100 (AEDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-1f9e6a49bd2so320163fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 23:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700809836; x=1701414636; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQhHGwPmQ4TCzhQ9rEz5VPF8mnM3VrFDuBPe9IkpS1Y=;
        b=I3bZ5MYAvq3FBci+1KfViqP7jcbIlVeUYSdTzE29rruyGwEbptDzdLoL//U+GIn+lu
         xQZpZ595Hh7eOP8ZuvgEmVkNboqwCOFiXlOREJ/nCF+9e5oW29acUdXM6xNg2i7nIo+r
         oKv8PqTh8f/DxVkucuMqMdIoN1uviSdYsWYGZbmdVa9mnHCCcYm4r/FXyIIOLZyG+qTY
         7bLix6KfPMMpiX6awLWjpcPpfvMUSMvuKuQTky11SviPt3e59OjLuBHG4b/GviPsNYD1
         XBiD71Hx/3xZEUGDu7zIy1ro+9XTsy2itlBeycYuCLRJYopuklO/fFUGsSw3FqDYOkiG
         nwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700809836; x=1701414636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQhHGwPmQ4TCzhQ9rEz5VPF8mnM3VrFDuBPe9IkpS1Y=;
        b=LIy8ssurXe8frWg8TD54trQHmfROJoHTQ4khsC2P/hXPVR7UoVAD1Ui+eTch1Pz3K/
         JAltGZrioyJxW276DioZhw54qUMFcD3IpEdSg6pyyJNPeiaCFnYPxeeAyGJhud/l69Vh
         Ij+6r5RMHIEZ238gLUexm+GiMSxiWsJJ0/FOf2v+SIiJQRIe/4eSwYML6HWK67YK2F9P
         fcnqolw4nEgMucmID9bVr8JqfdBOZ0qFBKvvW13B1uP8tpU5EIZ5V4JS2MbffSiGAzc8
         weMFxFVEae+T6PVamo6GLCL/2V48mKbDLvuJtqUS9c2kiXSGehANfl3mJYAh/ytp3cLp
         upAQ==
X-Gm-Message-State: AOJu0Yw5TH6d7WKOfnx+tKFgerJVwRBCC0+lxX04CW+ctkcD9q76bsrn
	1zvarQrKujt9xGfKhfm24BChrw==
X-Google-Smtp-Source: AGHT+IGvJOScqEUs5x/NC1+xkb/+ZzFxNOvJHJDnrqYvAj8EJtKq+m+RbFE9B8BNRcDqThajOtvZdA==
X-Received: by 2002:a05:6870:4729:b0:1f9:d22e:6339 with SMTP id b41-20020a056870472900b001f9d22e6339mr801112oaq.23.1700809836602;
        Thu, 23 Nov 2023 23:10:36 -0800 (PST)
Received: from localhost.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id e5-20020a9d7305000000b006c61c098d38sm435532otk.21.2023.11.23.23.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 23:10:36 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v5 3/5] tty/serial: Add RISC-V SBI debug console based earlycon
Date: Fri, 24 Nov 2023 12:39:03 +0530
Message-Id: <20231124070905.1043092-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231124070905.1043092-1-apatel@ventanamicro.com>
References: <20231124070905.1043092-1-apatel@ventanamicro.com>
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
 drivers/tty/serial/earlycon-riscv-sbi.c | 27 ++++++++++++++++++++++---
 2 files changed, 25 insertions(+), 4 deletions(-)

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
index 27afb0b74ea7..0162155f0c83 100644
--- a/drivers/tty/serial/earlycon-riscv-sbi.c
+++ b/drivers/tty/serial/earlycon-riscv-sbi.c
@@ -15,17 +15,38 @@ static void sbi_putc(struct uart_port *port, unsigned char c)
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
+	int ret;
+
+	while (n) {
+		ret = sbi_debug_console_write(s, n);
+		if (ret < 0)
+			break;
+
+		s += ret;
+		n -= ret;
+	}
+}
+
 static int __init early_sbi_setup(struct earlycon_device *device,
 				  const char *opt)
 {
-	device->con->write = sbi_console_write;
+	if (sbi_debug_console_available)
+		device->con->write = sbi_dbcn_console_write;
+	else if (IS_ENABLED(CONFIG_RISCV_SBI_V01))
+		device->con->write = sbi_0_1_console_write;
+	else
+		return -ENODEV;
+
 	return 0;
 }
 EARLYCON_DECLARE(sbi, early_sbi_setup);
-- 
2.34.1

