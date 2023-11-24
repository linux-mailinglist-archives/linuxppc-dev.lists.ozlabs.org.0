Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2687F6CAC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 08:14:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=QYOOZT7f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sc5p64n69z3vsS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 18:14:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=QYOOZT7f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2001:4860:4864:20::2c; helo=mail-oa1-x2c.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sc5jb6QSDz3dLh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 18:10:43 +1100 (AEDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-1ea98ad294cso806089fac.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 23:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700809841; x=1701414641; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5e69UQ6T+Z7CNLXUZDcGOS0SOuMoPgQwIsqXvR77gEM=;
        b=QYOOZT7fm91FK4T2JOpz7k8xOAm+5Kb7aEJynfSuBu5ahsn6KYxIN+Mdqu2bd/nUXd
         NtzCjs4u5r5bfvEBc6oU//5nx4vxxDHVOdy4Zmlr0mEqbkHrfANqUdWDwdbcDfawsrff
         jU0+VDfGPu48rf7UQae5eHiX36eYFmDzPLM/Dp9OJFxJwrbuCRYhxxtHPQFWIkaB+iCX
         S1eHe+5lnC3Lfr/iMi8uFoKrs5REOiZ1Od4WG/v116XLfqO19nxSUPlGUgnPi9o9Bb2G
         zasI30qF2CuAd7q2dJUpvPSUWyvyXwfIHpjqlxpWZOU0rrMmMwAqimQHNED8D4iv97eK
         03Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700809841; x=1701414641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5e69UQ6T+Z7CNLXUZDcGOS0SOuMoPgQwIsqXvR77gEM=;
        b=YxGhjok9LLqxIO+E10frdsRO+YYJNDHxoW+8RW7fkwZO86AJB+hKX56mwnSsX1j9I9
         B4rBFHr5dSS3P1LHAGcoWegsYrp6epiv1bJ8nhtZzkUqGPJHNKTRnzRm8aFRYiHi0vV/
         qv+nxr9PdB1O0qM3j8rbTpizh5YUsRTqZ6uDTs0D7jxhZfE3iuIyTCKEw0Dl/Qf8UuGl
         I3dVSYJ4ZN9EirYq0U+3FZ4cMZ3dR4KBQhDpf4LCDkaamirY9Gu51syg2eBcs8jQLVRf
         6eFQArHWFRnO60o2TPtBiiFGB7x9gVWAiaBM1GQsGMzOb5kSEwlJM1H1ak/c/j5fAnEI
         V+YQ==
X-Gm-Message-State: AOJu0YyjegrnvfPBq9FQo58zrmI5GAjG7QMbG9hl8u7KodTAQWVFWH2S
	a/Cqb0ziyINqQNepIaGcZbfhVAeA4wjBPT+lRrY=
X-Google-Smtp-Source: AGHT+IGpCaOs051rva99tydJYiLxp2JmCAggGxrs3iHMIIeR5K0qZKOeN66AGmBC8Za809GQ8lm4oQ==
X-Received: by 2002:a05:6871:453:b0:1f4:dd99:b07 with SMTP id e19-20020a056871045300b001f4dd990b07mr2011442oag.49.1700809840700;
        Thu, 23 Nov 2023 23:10:40 -0800 (PST)
Received: from localhost.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id e5-20020a9d7305000000b006c61c098d38sm435532otk.21.2023.11.23.23.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 23:10:40 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v5 4/5] tty: Add SBI debug console support to HVC SBI driver
Date: Fri, 24 Nov 2023 12:39:04 +0530
Message-Id: <20231124070905.1043092-5-apatel@ventanamicro.com>
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
Cc: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Andrew Jones <ajones@ventanamicro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Atish Patra <atishp@rivosinc.com>

RISC-V SBI specification supports advanced debug console
support via SBI DBCN extension.

Extend the HVC SBI driver to support it.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/tty/hvc/Kconfig         |  2 +-
 drivers/tty/hvc/hvc_riscv_sbi.c | 37 ++++++++++++++++++++++++++-------
 2 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/hvc/Kconfig b/drivers/tty/hvc/Kconfig
index 4f9264d005c0..6e05c5c7bca1 100644
--- a/drivers/tty/hvc/Kconfig
+++ b/drivers/tty/hvc/Kconfig
@@ -108,7 +108,7 @@ config HVC_DCC_SERIALIZE_SMP
 
 config HVC_RISCV_SBI
 	bool "RISC-V SBI console support"
-	depends on RISCV_SBI_V01
+	depends on RISCV_SBI
 	select HVC_DRIVER
 	help
 	  This enables support for console output via RISC-V SBI calls, which
diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_sbi.c
index 31f53fa77e4a..2f3571f17ecd 100644
--- a/drivers/tty/hvc/hvc_riscv_sbi.c
+++ b/drivers/tty/hvc/hvc_riscv_sbi.c
@@ -39,21 +39,44 @@ static int hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
 	return i;
 }
 
-static const struct hv_ops hvc_sbi_ops = {
+static const struct hv_ops hvc_sbi_v01_ops = {
 	.get_chars = hvc_sbi_tty_get,
 	.put_chars = hvc_sbi_tty_put,
 };
 
-static int __init hvc_sbi_init(void)
+static int hvc_sbi_dbcn_tty_put(uint32_t vtermno, const char *buf, int count)
 {
-	return PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_ops, 16));
+	return sbi_debug_console_write(buf, count);
 }
-device_initcall(hvc_sbi_init);
 
-static int __init hvc_sbi_console_init(void)
+static int hvc_sbi_dbcn_tty_get(uint32_t vtermno, char *buf, int count)
 {
-	hvc_instantiate(0, 0, &hvc_sbi_ops);
+	return sbi_debug_console_read(buf, count);
+}
+
+static const struct hv_ops hvc_sbi_dbcn_ops = {
+	.put_chars = hvc_sbi_dbcn_tty_put,
+	.get_chars = hvc_sbi_dbcn_tty_get,
+};
+
+static int __init hvc_sbi_init(void)
+{
+	int err;
+
+	if (sbi_debug_console_available) {
+		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_dbcn_ops, 256));
+		if (err)
+			return err;
+		hvc_instantiate(0, 0, &hvc_sbi_dbcn_ops);
+	} else if (IS_ENABLED(CONFIG_RISCV_SBI_V01)) {
+		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_v01_ops, 256));
+		if (err)
+			return err;
+		hvc_instantiate(0, 0, &hvc_sbi_v01_ops);
+	} else {
+		return -ENODEV;
+	}
 
 	return 0;
 }
-console_initcall(hvc_sbi_console_init);
+device_initcall(hvc_sbi_init);
-- 
2.34.1

