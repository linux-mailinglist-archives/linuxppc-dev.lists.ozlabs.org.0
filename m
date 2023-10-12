Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B41F77C648D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 07:20:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=mdm9p5da;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5dJ84TNcz3ccd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 16:20:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=mdm9p5da;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5dBl4qM4z3c53
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Oct 2023 16:15:43 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-578d0d94986so434134a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 22:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697087741; x=1697692541; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRORRt3s6hvFf4qGGIikwZfB3q5mq8SDYLLtJc1fkNQ=;
        b=mdm9p5daPGzLQ0mhNTK+LW9T4mZPfIy1rk3C5Paw15p4nry+uJyDBzakDY5rKioww0
         VK3atF3doNGgmRgW2jlQaTPDE+siiMESDbwXhL80vbXSzY9dVFwZxKAc3GuOls8TE10A
         cXhP5RAgxl4gCmOfLBQF+wAkMCw6h1knCFXSFx76x8uZN9Gvs46whOGRmmjS3cw0AoO7
         WgurZo4G4AfNqG34Z3J9JXHJ+d4UEaZh+SuJgWcXh46FUgq/RShmdoc+RewqZjn4CPlq
         2l6zU55RqF+OexJLzdLx7MOjGF1+7+W+EkI5mq/fu/46HMbtgAkf6G1iroqJbk9WOq/0
         QqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697087741; x=1697692541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tRORRt3s6hvFf4qGGIikwZfB3q5mq8SDYLLtJc1fkNQ=;
        b=ZDMtlgghdJMBtWk09OskdtX56QB+snFrkXHL0qLigeXixypz5RAmp5JZ5E0swJttsi
         FenKRCfSN+8uBYUxwvNXVj6L5lZiPc3NVVww3VBBNk/J+K+rdlwEAdBHI/oEv8b3tDSg
         ZJv96PgtRIrWImaSJXt/NnfYkRGUuHUjKnxn9B9Ba6JpyQSMg4II2thSb2uNqXuCRd4j
         bkMD/xLBt5gapxTHEPMwcUYLvw8l3PjmcCQsbJjBEqoWpeBuVQOKzRX/7EuxrRtubWxg
         TZTzKtk0F5n1Qn7c1NDIz0YtIBw/GFDesMcUWZn7PS08MUVpX9sncAGH+kgfEb3/R8Km
         Aq8w==
X-Gm-Message-State: AOJu0YzBdMFhd2kjAeOYo/WpeBZ5/i7r8kEGAsKwBPvrCGJvEubBV3YJ
	phenn1bw//ZUP9j7IaTis+QkVA==
X-Google-Smtp-Source: AGHT+IEHQA7g0wr5kBdA1+VUq03jI8s5X+zTK5oLbVixutxk664ESGEsqt+140ZFSE0KLFXmweQiJg==
X-Received: by 2002:a05:6a20:1586:b0:173:e36c:6d03 with SMTP id h6-20020a056a20158600b00173e36c6d03mr3716883pzj.22.1697087741089;
        Wed, 11 Oct 2023 22:15:41 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id s18-20020a17090330d200b001b9d95945afsm851309plc.155.2023.10.11.22.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 22:15:40 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v2 5/8] RISC-V: Add inline version of sbi_console_putchar/getchar() functions
Date: Thu, 12 Oct 2023 10:45:06 +0530
Message-Id: <20231012051509.738750-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012051509.738750-1-apatel@ventanamicro.com>
References: <20231012051509.738750-1-apatel@ventanamicro.com>
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

The functions sbi_console_putchar() and sbi_console_getchar() are
not defined when CONFIG_RISCV_SBI_V01 is disabled so let us add
inline version of these functions to avoid "#ifdef" on user side.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 12dfda6bb924..cbcefa344417 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -271,8 +271,13 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 			unsigned long arg3, unsigned long arg4,
 			unsigned long arg5);
 
+#ifdef CONFIG_RISCV_SBI_V01
 void sbi_console_putchar(int ch);
 int sbi_console_getchar(void);
+#else
+static inline void sbi_console_putchar(int ch) { }
+static inline int sbi_console_getchar(void) { return -1; }
+#endif
 long sbi_get_mvendorid(void);
 long sbi_get_marchid(void);
 long sbi_get_mimpid(void);
-- 
2.34.1

