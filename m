Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A577C0247
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 19:10:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=BRbWoet4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4j8J2kFQz3vrg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 04:10:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=BRbWoet4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4j2t6cXSz3cD1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 04:05:42 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1bdf4752c3cso36461145ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 10:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696957541; x=1697562341; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Qqy4Lq8gbERMmKNa3SsbrCy4B07mso/bpWy+ieX3+w=;
        b=BRbWoet4D+cfU6NpOn4hDiJpcEDV9puDLHtMxBQw3AylY0DL8n9u90vHdYkixpZtz5
         m0hR+tlXn39mlCQClejJK5caFivQ7RQNr7skdP9bN3SxIr9ZuaVxle29fsYDRYVIRcrs
         2vHH9VU1XVJ0U09FVZIe2EIgx3eVYtDLB1mkHQxpqwTVQnFEWzsNPmeu7UWkswH9O6Lh
         bBrTYaCSIcyZAvP2pzO6KwNjVEeucICLsmUR99RsvPKj7eqk99iAXaZBiA4r/lwRui3f
         vUYSLVoone5FqKREfaVBXoJltgiNyMVtUtgqtDy5XAYG9rg9zGR4+qJTrDgZdBS1560k
         ZNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696957541; x=1697562341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Qqy4Lq8gbERMmKNa3SsbrCy4B07mso/bpWy+ieX3+w=;
        b=K8B9GPuT7IBu8rMJtpdUas45pHe+zP4wwI9soub2x0RWJQCwsD+3DKzBPpzeynGP3R
         +xNxFr4UDPn2CmV8D0TFuwsawy1Noz/wrdRxsx5j/n2uM2hlhTWV8nNme55gpVtqfumx
         aLS/vMUmF+UZrqVgSabdENNe3nsWLnWaC6qVrxzcJRaf4qLeKNbzwqlZI6G//qkZmLO1
         OoDuruVZBfp3gPcRkyKHFmTkVGuTy+uTZSRBCEO20RZypv8qq8JYONqyILZssYABY9On
         w4euuSMjeNLoc79rm0Eakuf2EAO1j6IEUWiCQG2Bg3jUodotOeGYH5ec2IU00lqUXiN1
         P66Q==
X-Gm-Message-State: AOJu0YzdyyB4A8CbsDIXYuMEZJyze1xrBPhYkXb6ehJ4wHavvaG17vQf
	wwT7xyqbmHjHdyLk12c6rWCdSQ==
X-Google-Smtp-Source: AGHT+IERB4pxUt5nWI40xusQqE+9WUh0dFLmx7F6EOp9LBym2k+moLv9bgQcH5zXgP5QADPNDZuBnw==
X-Received: by 2002:a17:902:da89:b0:1c7:3aad:305e with SMTP id j9-20020a170902da8900b001c73aad305emr19217128plx.27.1696957541145;
        Tue, 10 Oct 2023 10:05:41 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id w19-20020a1709027b9300b001b89536974bsm11979868pll.202.2023.10.10.10.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 10:05:40 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH 5/6] tty: Add SBI debug console support to HVC SBI driver
Date: Tue, 10 Oct 2023 22:35:02 +0530
Message-Id: <20231010170503.657189-6-apatel@ventanamicro.com>
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-serial@vger.kernel.org, kvm@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Andrew Jones <ajones@ventanamicro.com>
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
 drivers/tty/hvc/hvc_riscv_sbi.c | 80 ++++++++++++++++++++++++++++++---
 2 files changed, 74 insertions(+), 8 deletions(-)

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
index 31f53fa77e4a..be8b7e351840 100644
--- a/drivers/tty/hvc/hvc_riscv_sbi.c
+++ b/drivers/tty/hvc/hvc_riscv_sbi.c
@@ -15,6 +15,7 @@
 
 #include "hvc_console.h"
 
+#ifdef CONFIG_RISCV_SBI_V01
 static int hvc_sbi_tty_put(uint32_t vtermno, const char *buf, int count)
 {
 	int i;
@@ -39,21 +40,86 @@ static int hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
 	return i;
 }
 
-static const struct hv_ops hvc_sbi_ops = {
+static const struct hv_ops hvc_sbi_v01_ops = {
 	.get_chars = hvc_sbi_tty_get,
 	.put_chars = hvc_sbi_tty_put,
 };
+#endif
 
-static int __init hvc_sbi_init(void)
+static int hvc_sbi_dbcn_tty_put(uint32_t vtermno, const char *buf, int count)
 {
-	return PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_ops, 16));
+	phys_addr_t pa;
+	struct sbiret ret;
+
+	if (is_vmalloc_addr(buf))
+		pa = page_to_phys(vmalloc_to_page(buf)) + offset_in_page(buf);
+	else
+		pa = __pa(buf);
+
+	ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
+#ifdef CONFIG_32BIT
+		  count, pa, (u64)pa >> 32,
+#else
+		  count, pa, 0,
+#endif
+		  0, 0, 0);
+
+	if (ret.error)
+		return 0;
+
+	return count;
 }
-device_initcall(hvc_sbi_init);
 
-static int __init hvc_sbi_console_init(void)
+static int hvc_sbi_dbcn_tty_get(uint32_t vtermno, char *buf, int count)
 {
-	hvc_instantiate(0, 0, &hvc_sbi_ops);
+	phys_addr_t pa;
+	struct sbiret ret;
+
+	if (is_vmalloc_addr(buf))
+		pa = page_to_phys(vmalloc_to_page(buf)) + offset_in_page(buf);
+	else
+		pa = __pa(buf);
+
+	ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ,
+#ifdef CONFIG_32BIT
+		  count, pa, (u64)pa >> 32,
+#else
+		  count, pa, 0,
+#endif
+		  0, 0, 0);
+
+	if (ret.error)
+		return 0;
+
+	return ret.value;
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
+	if ((sbi_spec_version >= sbi_mk_version(2, 0)) &&
+	    (sbi_probe_extension(SBI_EXT_DBCN) > 0)) {
+		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_dbcn_ops, 16));
+		if (err)
+			return err;
+		hvc_instantiate(0, 0, &hvc_sbi_dbcn_ops);
+	} else {
+#ifdef CONFIG_RISCV_SBI_V01
+		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_v01_ops, 16));
+		if (err)
+			return err;
+		hvc_instantiate(0, 0, &hvc_sbi_v01_ops);
+#else
+		return -ENODEV;
+#endif
+	}
 
 	return 0;
 }
-console_initcall(hvc_sbi_console_init);
+device_initcall(hvc_sbi_init);
-- 
2.34.1

