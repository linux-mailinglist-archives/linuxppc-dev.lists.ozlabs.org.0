Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EA87EFD87
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 04:42:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=k1Lk11lM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXKMY07Pbz3dK1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 14:42:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=k1Lk11lM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXKJs48Hhz30gn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 14:39:41 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-27ff83feb29so2293798a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 19:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700278778; x=1700883578; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUknxwWYXkt9C2M9pb/Z3CUGPfJIBZQMgmHAhH/xaf8=;
        b=k1Lk11lMepHYpMkNHCbQlaM/sFLjlgEyMguh8DkrFihvLcSnYahxXZlAzirgdWWTcK
         myBeKtEh5ZNFlyUs1lpf/Ad4+aeU4X9O9sjmsIppppE44p0RDTPW0LGYtG+tbaw8EjoF
         TC853aaAcpD1+fcVHhggbyqcr+NbkXOuN7/s7RL7KuoyiAb1CArR0AZsBVCJE86byE4B
         PVG3yaASQ8ebKo6jwZPUgdKvV4CAZTmn21UMhmt23TNj26jGPR9jhMrTkZdKEgsVkoZ+
         d3SsCBVNoeVKZNphGxXNJr724ketkx5MbjaKdG6sWPXiaqCMKHLA5Z3mViyhkTyJk8IF
         5M+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700278778; x=1700883578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lUknxwWYXkt9C2M9pb/Z3CUGPfJIBZQMgmHAhH/xaf8=;
        b=DqDapmrtCoScluF82mtjghY683j/f5DIVbaGkA3H/tMbUsZtl5zttZBBCrDsLCMJtt
         k0agHCKhAOUZgMzeh1BW0Yr5dE7ZOOT+q7fSx5VDzT0u8TWH/hkSnAqSDA/18+KbrlQH
         YK0kaWWnR8V1mZitDLKNZMJugLzXTXYtBLPs7+uSINWhX3lOvTr3mpUz/cwUmLA0rUbO
         ZEl75aUgbmOy50RreRH7zpQnZYDiMTIYRetVLnH89yKFxuIxqLby3Z6TFO5P063ahDrP
         bUaPtDsp8vjVMcxh1N+NpYDKti//qRVtsHs4QH02BHgdgvDO9yPQA5jiW4FNQ+wZ2sr2
         2lZg==
X-Gm-Message-State: AOJu0YxEYZmUmj1VyJVq7nMQQmukFNIQlNW1LRDPyEHUcB/wq+8oOeYC
	4GwOxWyQQsbS9FYv8fmfrfAVEg==
X-Google-Smtp-Source: AGHT+IGETYioNALUjNhz6JIS+eO7DP/jwO69X1kH6NZN6oXPpq2gEGKYxgt01iCN0WIJkFYPAiCO9A==
X-Received: by 2002:a17:90b:1e02:b0:27d:7887:ddc5 with SMTP id pg2-20020a17090b1e0200b0027d7887ddc5mr1729418pjb.32.1700278778017;
        Fri, 17 Nov 2023 19:39:38 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.80.108])
        by smtp.gmail.com with ESMTPSA id cz8-20020a17090ad44800b00280fcbbe774sm2053823pjb.10.2023.11.17.19.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 19:39:37 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v4 2/5] RISC-V: Add SBI debug console helper routines
Date: Sat, 18 Nov 2023 09:08:56 +0530
Message-Id: <20231118033859.726692-3-apatel@ventanamicro.com>
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

Let us provide SBI debug console helper routines which can be
shared by serial/earlycon-riscv-sbi.c and hvc/hvc_riscv_sbi.c.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h |  5 +++++
 arch/riscv/kernel/sbi.c      | 43 ++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 66f3933c14f6..ee7aef5f6233 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -334,6 +334,11 @@ static inline unsigned long sbi_mk_version(unsigned long major,
 }
 
 int sbi_err_map_linux_errno(int err);
+
+extern bool sbi_debug_console_available;
+int sbi_debug_console_write(unsigned int num_bytes, phys_addr_t base_addr);
+int sbi_debug_console_read(unsigned int num_bytes, phys_addr_t base_addr);
+
 #else /* CONFIG_RISCV_SBI */
 static inline int sbi_remote_fence_i(const struct cpumask *cpu_mask) { return -1; }
 static inline void sbi_init(void) {}
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 5a62ed1da453..73a9c22c3945 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -571,6 +571,44 @@ long sbi_get_mimpid(void)
 }
 EXPORT_SYMBOL_GPL(sbi_get_mimpid);
 
+bool sbi_debug_console_available;
+
+int sbi_debug_console_write(unsigned int num_bytes, phys_addr_t base_addr)
+{
+	struct sbiret ret;
+
+	if (!sbi_debug_console_available)
+		return -EOPNOTSUPP;
+
+	if (IS_ENABLED(CONFIG_32BIT))
+		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
+				num_bytes, lower_32_bits(base_addr),
+				upper_32_bits(base_addr), 0, 0, 0);
+	else
+		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
+				num_bytes, base_addr, 0, 0, 0, 0);
+
+	return ret.error ? sbi_err_map_linux_errno(ret.error) : ret.value;
+}
+
+int sbi_debug_console_read(unsigned int num_bytes, phys_addr_t base_addr)
+{
+	struct sbiret ret;
+
+	if (!sbi_debug_console_available)
+		return -EOPNOTSUPP;
+
+	if (IS_ENABLED(CONFIG_32BIT))
+		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ,
+				num_bytes, lower_32_bits(base_addr),
+				upper_32_bits(base_addr), 0, 0, 0);
+	else
+		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ,
+				num_bytes, base_addr, 0, 0, 0, 0);
+
+	return ret.error ? sbi_err_map_linux_errno(ret.error) : ret.value;
+}
+
 void __init sbi_init(void)
 {
 	int ret;
@@ -612,6 +650,11 @@ void __init sbi_init(void)
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

