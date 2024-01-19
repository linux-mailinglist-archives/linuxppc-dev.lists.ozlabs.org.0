Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B721483308C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 22:58:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=MkA3z2AW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGtm04pPrz3cM7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 08:58:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=MkA3z2AW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=palmer@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGtl92sl3z3bX3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jan 2024 08:57:39 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5ce0efd60ddso950257a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 13:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705701455; x=1706306255; darn=lists.ozlabs.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=VVF/DXNkQrk84cprN3UAoU1BvvHEzT7JQOwOJshC+cA=;
        b=MkA3z2AWzMWAxE8XLPNYjkje8vxC5moFN6169mg2hWwCz82vos0DTY669tQ1EBDLRq
         UyOtW2gMRO2YvrFqKxxKf8rniM32qV34kh4pVGacNCXgYXVUxzNKy7kxG4SfU6cX2dpf
         OhDjp/Wbw8d9swAid6fbW6ePwkv0mE2Nn98JOmJ/ZVs+v+TiXXu7+K6sE8vrw0Eg3D10
         OhTpozKV3I4UskmnTfIVfSWQYDu/e8NxxKxVO+3EqHZBsikgDtxNU7ebBOO5IXIUSQc4
         kTuEKx8Q5vZTK7Yf2Qf95CDW07YQYcudl4WdJEE1axBS/7aWGPwIu0Q/FIk5Dw07MKyP
         7ovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705701455; x=1706306255;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVF/DXNkQrk84cprN3UAoU1BvvHEzT7JQOwOJshC+cA=;
        b=oWt6tIDt+BKC+B/F4YxGDZmcCXtGYv5af3MoFKVujb2q7gGK1KLJlVu3JNHBRzl2W1
         I0mOuVNF/bFJ8F0HJ0gin0NWLuxp0tu+zLYXRZPzO2mpemX87hmEgLYxXZ+8brsHZXWq
         TY2Asny8bGWzCCFT7B/Jnt2DBdxkFmXBRH/jzHGjaVxv2rqk0u497Gks5s9KzFxsXVc3
         5eWIQ3jbkYrI7zRQdUkpq4UVwzGthedEHSedM3NGioG5dsM3I3nxx8LRdFB9HlVaUZiz
         eBtErQ2EEzWoHOznpFPIpLm5I5/3h0Myr6v5pskqOgxp7n65GPgnrXhfqIQbHvXaNUWe
         +fCA==
X-Gm-Message-State: AOJu0Yx5SG9GPxKxhlyeVotRHD8Xvia5n5tpbaH0N76cPhpet0YjhzyN
	EysCf+QnMIijT6c478MwZfKwrgQEFym5LjrR0IKw/ItYHg5ZH6ECj4d3m5eF0n0=
X-Google-Smtp-Source: AGHT+IGEZk6VnUzExADUhpg7c3wGkhyF5/eA70sllfT+Dl5sV1z44WbDQY05CVT8DUCcI4SCpe6SuA==
X-Received: by 2002:a17:90a:e547:b0:290:4140:1e43 with SMTP id ei7-20020a17090ae54700b0029041401e43mr396975pjb.80.1705701455437;
        Fri, 19 Jan 2024 13:57:35 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id db11-20020a17090ad64b00b002900eeada1asm4592473pjb.43.2024.01.19.13.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 13:57:35 -0800 (PST)
Subject: [PATCH] tty: hvc: Fix the RISC-V SBI driver for a refactoring
Date: Fri, 19 Jan 2024 13:56:13 -0800
Message-ID: <20240119215612.20529-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
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
Cc: apatel@ventanamicro.com, aou@eecs.berkeley.edu, Greg KH <gregkh@linuxfoundation.org>, Atish Patra <atishp@rivosinc.com>, linuxppc-dev@lists.ozlabs.org, Palmer Dabbelt <palmer@rivosinc.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, jirislaby@kernel.org, ajones@ventanamicro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Palmer Dabbelt <palmer@rivosinc.com>

I missed the int->size_t refactoring in f32fcbedbe92 ("tty: hvc: convert
to u8 and size_t"), which causes the newly used ops in 88ead68e764c
("tty: Add SBI debug console support to HVC SBI driver") to fail to
build due to a

linux/drivers/tty/hvc/hvc_riscv_sbi.c:59:15: error: incompatible function pointer types initializing 'ssize_t (*)(uint32_t, const u8 *, size_t)' (aka 'long (*)(unsigned int, const unsigned char *, unsigned long)') with an expression of type 'int (uint32_t, const char *, int)' (aka 'int (unsigned int, const char *, int)') [-Wincompatible-function-pointer-types]
        .put_chars = hvc_sbi_dbcn_tty_put,

Fixes: f32fcbedbe92 ("tty: hvc: convert to u8 and size_t")
Fixes: 88ead68e764c ("tty: Add SBI debug console support to HVC SBI driver")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
I now remember Anup pointing this one out, but looks like I forgot about
it.
---
 drivers/tty/hvc/hvc_riscv_sbi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_sbi.c
index 2f3571f17ecd..c08718be8e73 100644
--- a/drivers/tty/hvc/hvc_riscv_sbi.c
+++ b/drivers/tty/hvc/hvc_riscv_sbi.c
@@ -15,7 +15,7 @@
 
 #include "hvc_console.h"
 
-static int hvc_sbi_tty_put(uint32_t vtermno, const char *buf, int count)
+static size_t hvc_sbi_tty_put(uint32_t vtermno, const char *buf, int count)
 {
 	int i;
 
@@ -25,7 +25,7 @@ static int hvc_sbi_tty_put(uint32_t vtermno, const char *buf, int count)
 	return i;
 }
 
-static int hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
+static size_t hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
 {
 	int i, c;
 
-- 
2.43.0

