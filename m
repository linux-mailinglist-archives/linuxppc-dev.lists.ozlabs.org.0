Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF11F7D0983
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 09:27:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=KCJw9KiY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBblS5SR0z3vpP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 18:27:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=KCJw9KiY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBbd85v0hz3dDM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 18:22:20 +1100 (AEDT)
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-7a683bd610dso19105539f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 00:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697786537; x=1698391337; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MwlyMPcz0zqeFoKpmeSvnyAhcAgahoPS/k2EPhyd9Ww=;
        b=KCJw9KiYjzE5L3sB6PKi4ireWP2pE+MNLnzKDfiJ9ZWNC7aUXdnM6Wdko+kOFXcg9h
         2VvobZJ/Zrgfv1LW3qVf8IjgJo8qeq3LNrUITMwG0ccF1qyzHFsqAPOAr5kUIpY+Kiwe
         vD0fYHHzaqBLxMitgwQwFj/qoBtd3fkVTXgkpSfdj43nfJYha3Go/pTn8kvXfIzUm+Hg
         SaNckma0p2uY1fCSczTreym/n1FOLol/yR776yTEP1EjEvA8EYoIFt+hyHdIGuzWcJRO
         jlLfktk5YVsL/YOKRj4Ei2jfm4ew/+pRI54x4zJ8Uhjg9PyhGY3VT4qjgiZEjarga1EC
         u1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697786537; x=1698391337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MwlyMPcz0zqeFoKpmeSvnyAhcAgahoPS/k2EPhyd9Ww=;
        b=umkrBSq5frZrR8WOpweaYvtSUA6hGai8qTEAXFeCochfPmH5BE4DULOu1C0M/o6AUs
         T4BlSYjV3H2f1GnPS49W8yLCV972WkbmteNzhpKKgVtVzoCnTiIXdl7+H0NwV9HVUTkd
         UfV/ok1Mz5p8jFWvvfVkJoFgXMwG4JxYf5zXUgCqzBPIeslYkk9HlAJHMwudGXsOH87P
         ZJE0yRSbGy2917QGoX8P4RlnhM4DyhYlIAddrz9yCSfWQNx749igJtomOZPyuUNnPPZm
         UVhPQHCwycmayzxAiqwdyvnoHV6mK7ZOXi3HdMsXfcjEGOF1myxhwNNM7Yi8Yr274Hck
         lzOg==
X-Gm-Message-State: AOJu0YxNo1mWri28MiFuThzEmCNrIr4icGVJeaZHsr0yF+wY9DHKiyyt
	JN6NNcPNSQDXyBkjVzoGjuTQiw==
X-Google-Smtp-Source: AGHT+IGxC63+68DtxcLP2NLHVLlq5o7kgQhRaiJb+wOy0CTSQu3yay0cbuJzx5Z+DRUCCNZLZovnkw==
X-Received: by 2002:a05:6e02:1748:b0:34c:e16d:6793 with SMTP id y8-20020a056e02174800b0034ce16d6793mr1508711ill.14.1697786537209;
        Fri, 20 Oct 2023 00:22:17 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.83.81])
        by smtp.gmail.com with ESMTPSA id v12-20020a63f20c000000b005b32d6b4f2fsm828204pgh.81.2023.10.20.00.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 00:22:16 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v3 6/9] RISC-V: Add stubs for sbi_console_putchar/getchar()
Date: Fri, 20 Oct 2023 12:51:37 +0530
Message-Id: <20231020072140.900967-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231020072140.900967-1-apatel@ventanamicro.com>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
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
stub of these functions to avoid "#ifdef" on user side.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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

