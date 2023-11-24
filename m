Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 905F47F6CA6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 08:12:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=gr+Fhc1E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sc5m73lSKz3vkV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 18:12:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=gr+Fhc1E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sc5jR6MCBz3cnZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 18:10:35 +1100 (AEDT)
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6d7e8da5e8dso843973a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 23:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700809833; x=1701414633; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9VElKh7WOuKh8RiW2R0mJxQw2Lx4DpptCzfBSkBTAk=;
        b=gr+Fhc1EXARfP74Ycy9HLywXDcmhvpFHsyYPxZUeSPI6fz6kthq+f0siAkROlUM/vP
         10S8I6WuWvyfnDf+ju3lHxEu9uzE8WBpHPCwpB1y7PY0TJmscXfPuNOiIVfY9/nOy6OB
         dCqt3X2zDogPp7gwErJquIxWfwukla6bqWI26EzFF+hDoBbADDzXamyLrZd4tl705ntu
         iSMfyPAoo15Jg6v4SpnmMXL69gdBSSxH0fmRK/YZ0EkKGKlbBUU+jeyM3qxQUKxWebW8
         Y9Nq5GDrEy0Qv84Fx/I0cTCHxOXURzaEaZpSpxyKRTT9ft7zXPfmJmERd6Mwqgc1QSVS
         SVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700809833; x=1701414633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9VElKh7WOuKh8RiW2R0mJxQw2Lx4DpptCzfBSkBTAk=;
        b=bWHhX5HwZW9/8MVRyTS8VzyzX3gQSsqFuBMyP6uiWTCtEsDsKIFam+V3ggJCNI1ywd
         6pRJ4HezJKhtvySv2eAAjL2eGyH3g/aOoN72UuBFtXyVhKcLPZ+6nfRyY+3KrPr0RPOa
         81TePEBvxxNXs6L3Eo0Cs6tpofoTCAZTwdgL3E7Uhbxny5WlsqSCE6EYdylvjS/PdweI
         +PrvL4AG+BfCdbaZyVRMD5au/NmdMwaCPb7EqlEPySW66w0XtVukvQfSRrSqcN+eweth
         KbbMw/YjsqF8dUBF2jLCufKxn94n4PyG6M1lJ4Weq9mhAkQmVzIStWIfinuajssP/u4i
         yGTw==
X-Gm-Message-State: AOJu0YxIp5IBpf7HKMXwweU2H9KckA+eFYUfPmpp697Gop0VcMrfBxJj
	YlJcQkpQKoC9WSwXwZ9AMZBuNg==
X-Google-Smtp-Source: AGHT+IEG2s4ycd1mkqU7FpTGI5rAcibI7RkN0EhH6e4T2RQdhaX7LpOD9UkrqUiowsChg6UsME1p9w==
X-Received: by 2002:a05:6830:88:b0:6d3:1d04:54e with SMTP id a8-20020a056830008800b006d31d04054emr2059407oto.10.1700809832783;
        Thu, 23 Nov 2023 23:10:32 -0800 (PST)
Received: from localhost.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id e5-20020a9d7305000000b006c61c098d38sm435532otk.21.2023.11.23.23.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 23:10:32 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v5 2/5] RISC-V: Add SBI debug console helper routines
Date: Fri, 24 Nov 2023 12:39:02 +0530
Message-Id: <20231124070905.1043092-3-apatel@ventanamicro.com>
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

Let us provide SBI debug console helper routines which can be
shared by serial/earlycon-riscv-sbi.c and hvc/hvc_riscv_sbi.c.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h |  5 +++
 arch/riscv/kernel/sbi.c      | 66 ++++++++++++++++++++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 66f3933c14f6..9eef25308d53 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -334,6 +334,11 @@ static inline unsigned long sbi_mk_version(unsigned long major,
 }
 
 int sbi_err_map_linux_errno(int err);
+
+extern bool sbi_debug_console_available;
+int sbi_debug_console_write(const char *bytes, unsigned int num_bytes);
+int sbi_debug_console_read(char *bytes, unsigned int num_bytes);
+
 #else /* CONFIG_RISCV_SBI */
 static inline int sbi_remote_fence_i(const struct cpumask *cpu_mask) { return -1; }
 static inline void sbi_init(void) {}
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 5a62ed1da453..e66e0999a800 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -7,6 +7,7 @@
 
 #include <linux/bits.h>
 #include <linux/init.h>
+#include <linux/mm.h>
 #include <linux/pm.h>
 #include <linux/reboot.h>
 #include <asm/sbi.h>
@@ -571,6 +572,66 @@ long sbi_get_mimpid(void)
 }
 EXPORT_SYMBOL_GPL(sbi_get_mimpid);
 
+bool sbi_debug_console_available;
+
+int sbi_debug_console_write(const char *bytes, unsigned int num_bytes)
+{
+	phys_addr_t base_addr;
+	struct sbiret ret;
+
+	if (!sbi_debug_console_available)
+		return -EOPNOTSUPP;
+
+	if (is_vmalloc_addr(bytes))
+		base_addr = page_to_phys(vmalloc_to_page(bytes)) +
+			    offset_in_page(bytes);
+	else
+		base_addr = __pa(bytes);
+	if (PAGE_SIZE < (offset_in_page(bytes) + num_bytes))
+		num_bytes = PAGE_SIZE - offset_in_page(bytes);
+
+	if (IS_ENABLED(CONFIG_32BIT))
+		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
+				num_bytes, lower_32_bits(base_addr),
+				upper_32_bits(base_addr), 0, 0, 0);
+	else
+		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
+				num_bytes, base_addr, 0, 0, 0, 0);
+
+	if (ret.error == SBI_ERR_FAILURE)
+		return -EIO;
+	return ret.error ? sbi_err_map_linux_errno(ret.error) : ret.value;
+}
+
+int sbi_debug_console_read(char *bytes, unsigned int num_bytes)
+{
+	phys_addr_t base_addr;
+	struct sbiret ret;
+
+	if (!sbi_debug_console_available)
+		return -EOPNOTSUPP;
+
+	if (is_vmalloc_addr(bytes))
+		base_addr = page_to_phys(vmalloc_to_page(bytes)) +
+			    offset_in_page(bytes);
+	else
+		base_addr = __pa(bytes);
+	if (PAGE_SIZE < (offset_in_page(bytes) + num_bytes))
+		num_bytes = PAGE_SIZE - offset_in_page(bytes);
+
+	if (IS_ENABLED(CONFIG_32BIT))
+		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ,
+				num_bytes, lower_32_bits(base_addr),
+				upper_32_bits(base_addr), 0, 0, 0);
+	else
+		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ,
+				num_bytes, base_addr, 0, 0, 0, 0);
+
+	if (ret.error == SBI_ERR_FAILURE)
+		return -EIO;
+	return ret.error ? sbi_err_map_linux_errno(ret.error) : ret.value;
+}
+
 void __init sbi_init(void)
 {
 	int ret;
@@ -612,6 +673,11 @@ void __init sbi_init(void)
 			sbi_srst_reboot_nb.priority = 192;
 			register_restart_handler(&sbi_srst_reboot_nb);
 		}
+		if ((sbi_spec_version >= sbi_mk_version(2, 0)) &&
+		    (sbi_probe_extension(SBI_EXT_DBCN) > 0)) {
+			pr_info("SBI DBCN extension detected\n");
+			sbi_debug_console_available = true;
+		}
 	} else {
 		__sbi_set_timer = __sbi_set_timer_v01;
 		__sbi_send_ipi	= __sbi_send_ipi_v01;
-- 
2.34.1

