Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 401057EFD86
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 04:41:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=XtJZX2OI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXKLd1Ny4z3dH1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 14:41:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=XtJZX2OI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXKJq1R3qz30gn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 14:39:38 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-27ff83feb29so2293772a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 19:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700278775; x=1700883575; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUH3sN/jANNMbAvxiLE+FR6QScUT3piYF3Fp6n0y2EI=;
        b=XtJZX2OIkNNgT0RprwQ7ba8cT00Xql9GhQ0wIQVgD8VZWOt9dNwsQXH68JJzk+r8xi
         jmXZsMkiiRlHK1Cpu+eBIF6orWxyg9KuOpPWPd7E6/AOTnDOSpkvlRXljnK/JIkXqJ0u
         i57Jd8l/hqk7DzvED5dt7eqG8XuM1YqhVzVsVOt4fbXrOosBqmkq0MbcmcJKGFhasJq2
         dDNNfclgrjrU7ehxEx3zsBEZPv9Dev9bvy7JViafzRgsWoFYGGE34vy8iJWwEclK2RCr
         HBwMnkr1ci+VoLce+I7+vZoqnUplsnrnuqfryVuKy1Zf7S4dAw7zreDrgzl1dOwnI/h9
         A6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700278775; x=1700883575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUH3sN/jANNMbAvxiLE+FR6QScUT3piYF3Fp6n0y2EI=;
        b=Z2lGH/KLHFmaNJFeOsTXlPGdbR5BpT2JhUoyU6LqPwFU/Frb+JG7GL/wZUuth9wzv1
         56qRXrGwT8uwC6WmI1majP3hfs29IwblGzJyJwQVr3aUdLAeN0S4rYZiJrGHFjLhMxij
         nddQKjaw+vw0hvLvGBgGkCfYmDlbdzUq6xdyxOCgmrZhoDn62kma2D9r34apVtj0RpWZ
         Ihs4GO/iUU+i6RyAXeBwnk4qKnjPo3jifI1X08EEK1z93Dt5PNrcNyI0kifRwRcd+C8p
         v/P0WS5z+wyWk9oJ3+mGsD2EIDkZq/d2Gis1+lIP8o0VUlHOq2nVEQ2Io+p8ZMKJVChr
         Dhiw==
X-Gm-Message-State: AOJu0YwYh2mlc1Hjp/kM1SyuLFrAGEX5HXM30Yk34kI0PiTWpdpfvfXO
	DgbFj4Vk5BI56cjtRzUTaThJXw==
X-Google-Smtp-Source: AGHT+IFL/vhOEv9SFr5vahVonbYDfe/rMF/KgPJfyv64wzi2WyOjQ+a4xtQ3OlsfO5O9XMpJ2UxSgA==
X-Received: by 2002:a17:90b:3b45:b0:280:29cd:4802 with SMTP id ot5-20020a17090b3b4500b0028029cd4802mr1636773pjb.3.1700278774537;
        Fri, 17 Nov 2023 19:39:34 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.80.108])
        by smtp.gmail.com with ESMTPSA id cz8-20020a17090ad44800b00280fcbbe774sm2053823pjb.10.2023.11.17.19.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 19:39:33 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v4 1/5] RISC-V: Add stubs for sbi_console_putchar/getchar()
Date: Sat, 18 Nov 2023 09:08:55 +0530
Message-Id: <20231118033859.726692-2-apatel@ventanamicro.com>
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

The functions sbi_console_putchar() and sbi_console_getchar() are
not defined when CONFIG_RISCV_SBI_V01 is disabled so let us add
stub of these functions to avoid "#ifdef" on user side.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 0892f4421bc4..66f3933c14f6 100644
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
+static inline int sbi_console_getchar(void) { return -ENOENT; }
+#endif
 long sbi_get_mvendorid(void);
 long sbi_get_marchid(void);
 long sbi_get_mimpid(void);
-- 
2.34.1

