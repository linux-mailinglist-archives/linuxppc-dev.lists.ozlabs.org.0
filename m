Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7497EFD8B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 04:43:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=o0WM/bEt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXKPP4hGbz3vd7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 14:43:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=o0WM/bEt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXKK12v4Kz3clc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 14:39:49 +1100 (AEDT)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3b6ce6fac81so1654031b6e.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 19:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700278785; x=1700883585; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5CqYtZjogFbVXt6oNqdtFyBl6EwNFmDaHiSS35XtX0=;
        b=o0WM/bEt3QHXiu+X8VQikM8SZKyXr3PTUBFENB6Sjs59HQM/AVpwJqDORqAQ9xW/GP
         kS+qsosEioHCZfoP1dLXeyTcJ1yy17FyE/IntLeLB8GTLntfMmbV2my6inzkCB2fznWT
         kzMVM6xzPffDNp2jX97PHv6x88ggwnWhBa34EGK6iL8zTtN9E9+8NLEc5MeE/Xl0x3z2
         aHqqC1IMtKkD0THeYSqwvy/KAd4Hse1Y+Esk0a8YjNIwh/g6iMb8q0JzUdwKPcq2GPGY
         vOppjW8j2P6QinCwp8wjguROH0UgtUg+qF0PTL/t8w5cI6BGXDecpu0RV6QyAffS+NRf
         THww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700278785; x=1700883585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5CqYtZjogFbVXt6oNqdtFyBl6EwNFmDaHiSS35XtX0=;
        b=VIqO2N3g8fNAS7/moiSzSAaksYkJqj70J7mJn8ZucAQFIdThvFKfI+4576qLDFh4Tj
         SD5n0aXe8LWiIb49lQfLJ+NVC8NLsBsWMe82ohfuiou7K8xOz/OPJKetL8B46BqsukHF
         b0henhVo9IrD0Sipx7m6LLGiXDR6scBF3LSclySLyxmDvywvWZEorahhx0aPK5zc/UIo
         8o5cJbzx0siKN63OiU/xJ4hFeqKJAlOj11jkKJ/nH2+aJGuNK5HJ5wOWo7y3GpqoSpFq
         AuD/HV+CPH4Hf8VIUTcAmMAczsrhsin/dL+FrDW9xtkI5qccjPRsHb76HZX+Kjgk3G/q
         ttOg==
X-Gm-Message-State: AOJu0Yx/t2gHz6ZbQP+uut3Fqm4YiX7d18PSm/9+gLVGMiJc29N/hPtC
	scwVLWxGpHjNJadcIc48bN93tg==
X-Google-Smtp-Source: AGHT+IFb5EggA2BEK2LPl8TELrC4wgaMj8P7ee9t/caB/1Et1jdB4N8VOhdF9KYDfMnGJFJ+eqIzWA==
X-Received: by 2002:a05:6871:728a:b0:1e9:9867:247 with SMTP id mm10-20020a056871728a00b001e998670247mr1437835oac.47.1700278785270;
        Fri, 17 Nov 2023 19:39:45 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.80.108])
        by smtp.gmail.com with ESMTPSA id cz8-20020a17090ad44800b00280fcbbe774sm2053823pjb.10.2023.11.17.19.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 19:39:44 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v4 4/5] tty: Add SBI debug console support to HVC SBI driver
Date: Sat, 18 Nov 2023 09:08:58 +0530
Message-Id: <20231118033859.726692-5-apatel@ventanamicro.com>
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
 drivers/tty/hvc/hvc_riscv_sbi.c | 59 +++++++++++++++++++++++++++++----
 2 files changed, 53 insertions(+), 8 deletions(-)

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
index 31f53fa77e4a..697c981221b5 100644
--- a/drivers/tty/hvc/hvc_riscv_sbi.c
+++ b/drivers/tty/hvc/hvc_riscv_sbi.c
@@ -39,21 +39,66 @@ static int hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
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
+	phys_addr_t pa;
+
+	if (is_vmalloc_addr(buf)) {
+		pa = page_to_phys(vmalloc_to_page(buf)) + offset_in_page(buf);
+		if (PAGE_SIZE < (offset_in_page(buf) + count))
+			count = PAGE_SIZE - offset_in_page(buf);
+	} else {
+		pa = __pa(buf);
+	}
+
+	return sbi_debug_console_write(count, pa);
 }
-device_initcall(hvc_sbi_init);
 
-static int __init hvc_sbi_console_init(void)
+static int hvc_sbi_dbcn_tty_get(uint32_t vtermno, char *buf, int count)
 {
-	hvc_instantiate(0, 0, &hvc_sbi_ops);
+	phys_addr_t pa;
+
+	if (is_vmalloc_addr(buf)) {
+		pa = page_to_phys(vmalloc_to_page(buf)) + offset_in_page(buf);
+		if (PAGE_SIZE < (offset_in_page(buf) + count))
+			count = PAGE_SIZE - offset_in_page(buf);
+	} else {
+		pa = __pa(buf);
+	}
+
+	return sbi_debug_console_read(count, pa);
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
+	} else {
+		if (IS_ENABLED(CONFIG_RISCV_SBI_V01)) {
+			err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_v01_ops, 256));
+			if (err)
+				return err;
+			hvc_instantiate(0, 0, &hvc_sbi_v01_ops);
+		} else {
+			return -ENODEV;
+		}
+	}
 
 	return 0;
 }
-console_initcall(hvc_sbi_console_init);
+device_initcall(hvc_sbi_init);
-- 
2.34.1

