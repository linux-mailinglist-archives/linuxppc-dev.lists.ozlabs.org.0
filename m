Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 820027F6CA3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 08:12:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=K394lPKM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sc5lC32j8z3dLj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 18:12:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=K394lPKM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2001:4860:4864:20::36; helo=mail-oa1-x36.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sc5jR0Mhtz3cnZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 18:10:34 +1100 (AEDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-1eb39505ba4so1042294fac.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 23:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700809829; x=1701414629; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUH3sN/jANNMbAvxiLE+FR6QScUT3piYF3Fp6n0y2EI=;
        b=K394lPKMZc7fOZC7emVZlxw+8jdcBkhRhfkDEMjf0Qtk3XiiA9kYmIfNc8hGxZwAw9
         KoCnJ3aUgP2FtqvViOyH7yssmT3xTwh+eaf0vhmIKgbYBKtILqlv+tKSC/zUonr7MjXz
         YGbhyJB3SvSe6qUZlHxDAKeLERR9gualHorsqqweNMdVY+dXD8yqjxHoIvU2Ay4NY9Ox
         a78/ZNmJevXcBmM6YfXoNbY2vViqIENXZ00zgNYZZw4sgkkbVSOlkjq0vSXm6KOGslJE
         hw/zLVzevBG0pRjPG9MZH62sQ6ozgCE3aWsJxcZnuzsj0B6hRGzQk5WlBfLXNpfvR1WE
         SOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700809829; x=1701414629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUH3sN/jANNMbAvxiLE+FR6QScUT3piYF3Fp6n0y2EI=;
        b=u+qeQ0mzk8yyem6ezleV27WJKp+yqtEsdAruc+JIdeflAV9wDmbOpoTAQRgwsU+9Uq
         BcsIyuvTBl4cYEylyprrTeiYrJLARVM4JdPZD2yuQgbCaqg73q/4jeM6+D4Rp9qe6+sh
         YvrTNOsM/qmOZQy8Vud6iDnh+3jBV3Js5DNxc0h9R1DNltild6oakMe+YwzXLATR5Mv0
         Hc95CBDg2S9I0vuWIbcA9jAzzPO2R19+cMHfNLnWxFvOzkv1zo/O/ggUqVVj6i1oS5P2
         zE/hQUmqN+QP/SG6Yt5n3yHOMIIEdeQQnu42w4A8I7k32qh48mUh5+YVlfj0g+B3M3Ca
         kvBg==
X-Gm-Message-State: AOJu0YwcVPRTQ5jshJbiqbT0XacaHhyOYMrmzy1i+t8JjonKzEj3cWdf
	IM5Gwz3Wvo0o3fwtAAm8Fd5RJg==
X-Google-Smtp-Source: AGHT+IFcPdJe1/+ZUHL4jSznxzi4QTW1Nct7Qxw/93cKKbEqCPdbOrdVTAgRyzDakbY8JJUSxK2OJg==
X-Received: by 2002:a05:6870:d8cb:b0:1e1:3ac9:bc14 with SMTP id of11-20020a056870d8cb00b001e13ac9bc14mr2262118oac.30.1700809828736;
        Thu, 23 Nov 2023 23:10:28 -0800 (PST)
Received: from localhost.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id e5-20020a9d7305000000b006c61c098d38sm435532otk.21.2023.11.23.23.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 23:10:28 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v5 1/5] RISC-V: Add stubs for sbi_console_putchar/getchar()
Date: Fri, 24 Nov 2023 12:39:01 +0530
Message-Id: <20231124070905.1043092-2-apatel@ventanamicro.com>
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

