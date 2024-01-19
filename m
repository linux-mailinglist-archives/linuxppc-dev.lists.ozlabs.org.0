Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEEF8330D5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 23:46:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=VdqlVd/H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGvql5Nfxz3cSN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 09:46:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=VdqlVd/H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=palmer@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGvps0Xx4z2yRS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jan 2024 09:45:56 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d5f388407bso9606775ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 14:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705704354; x=1706309154; darn=lists.ozlabs.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=2m1XhtygbnQtWGP2mbVBYdagXNcPKgbqxOJjRe6fvag=;
        b=VdqlVd/HfAuuOYAI/5er7FaRjxJW1kRflP//Al7Ul7lSiiPvrbKuF1B3mMGOgoW7PU
         YrHRV/R4LkZvKfVFdJJszKrQE/Ynn+vdApePKJdQAr5X9vA2Smx+CI8dFb2H2jaEyhSX
         JTaOSrY9BpVuWhl5QdAARJIp30vO1yS48IHE03W4M/l6V11s0b4AvTvXkhlmEUwyMu+N
         uCnm6phn3E7DBj3LVdztDGgeCPttpm2unsjHL9oX4sHMtQFqnp4DA6T8maX43NlqUCk0
         IISnUv9TiJitscHxST2eKE0s1g3d1NUZSKLGW/PB2eZgFo8lTNAhuhfEkwaGZ4wGLtj4
         jfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705704354; x=1706309154;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2m1XhtygbnQtWGP2mbVBYdagXNcPKgbqxOJjRe6fvag=;
        b=WPp8Svg+7joZ7LyxPxPnIR9UomJUhZQg7WT9VOac/suST/6p5785qiVvCSzoxB0OJF
         0ymTSeSZBJkrHOM+Cw4PCbYujQQOUtjZ7PxTJxw63pMX9gLCLHLN2qnrp/Cg4Q+4FqnY
         q7EcrQERjLOTNAoZoiLJM8mgnV2el0hEnlDxWGHXeXo1mAalKKltbHMMtYLE172Ru3En
         FsC/ln1LgF+lt5+B0fwThLpVdWtp6+I1PInX/31UJ4N8oYbriKNRKNiyIgSL5XEndz/f
         mc6FrO1OTQAzZ+Ed+QxtcIpnevbdFJ/CX0f/Di5u5lfBrMSZuQ34oqewK/8H9vKrQpe2
         4ZpA==
X-Gm-Message-State: AOJu0YzDZ1USG2ERsxw0WTXURKOQvp58480b0fOczVP7Tt41Udz4IcJn
	mXhSXWkkpVNyufJpZu07IAAn2DitpYwqxT2ec5Wk+OTv8SA26Mr/h358y/oN95c=
X-Google-Smtp-Source: AGHT+IGDYcz91ZsFkrsdeetEFLWkVDikcqnEMGNi7rrUqJxNwbVFtPK97ae9vNTPyqHIMS90uGoxFA==
X-Received: by 2002:a17:902:6b02:b0:1d4:e2bc:88f1 with SMTP id o2-20020a1709026b0200b001d4e2bc88f1mr582016plk.110.1705704353758;
        Fri, 19 Jan 2024 14:45:53 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id p20-20020a170902c71400b001d5e2127632sm3525800plp.9.2024.01.19.14.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 14:45:53 -0800 (PST)
Subject: [PATCH v2] tty: hvc: Fix the RISC-V SBI driver for a refactoring
Date: Fri, 19 Jan 2024 14:44:05 -0800
Message-ID: <20240119224404.26695-2-palmer@rivosinc.com>
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
Link: https://lore.kernel.org/r/20240119215612.20529-2-palmer@rivosinc.com
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
Changes since v1 <20240119215612.20529-2-palmer@rivosinc.com>:
* Fix the return and arguments correctly.
* Also fix the hvc_sbi_dbcn_tty_{get,put}().
---
 drivers/tty/hvc/hvc_riscv_sbi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_sbi.c
index 2f3571f17ecd..f8cd3310ef35 100644
--- a/drivers/tty/hvc/hvc_riscv_sbi.c
+++ b/drivers/tty/hvc/hvc_riscv_sbi.c
@@ -15,7 +15,7 @@
 
 #include "hvc_console.h"
 
-static int hvc_sbi_tty_put(uint32_t vtermno, const char *buf, int count)
+static ssize_t hvc_sbi_tty_put(uint32_t vtermno, const u8 *buf, size_t count)
 {
 	int i;
 
@@ -25,7 +25,7 @@ static int hvc_sbi_tty_put(uint32_t vtermno, const char *buf, int count)
 	return i;
 }
 
-static int hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
+static ssize_t hvc_sbi_tty_get(uint32_t vtermno, u8 *buf, size_t count)
 {
 	int i, c;
 
@@ -44,12 +44,12 @@ static const struct hv_ops hvc_sbi_v01_ops = {
 	.put_chars = hvc_sbi_tty_put,
 };
 
-static int hvc_sbi_dbcn_tty_put(uint32_t vtermno, const char *buf, int count)
+static ssize_t hvc_sbi_dbcn_tty_put(uint32_t vtermno, const u8 *buf, size_t count)
 {
 	return sbi_debug_console_write(buf, count);
 }
 
-static int hvc_sbi_dbcn_tty_get(uint32_t vtermno, char *buf, int count)
+static ssize_t hvc_sbi_dbcn_tty_get(uint32_t vtermno, u8 *buf, size_t count)
 {
 	return sbi_debug_console_read(buf, count);
 }
-- 
2.43.0

