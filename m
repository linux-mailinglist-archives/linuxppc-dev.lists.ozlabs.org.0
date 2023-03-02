Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DAC6A7F3E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 10:58:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PS6412zl9z3fl6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 20:58:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=D2ZYUezj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=alexghiti@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=D2ZYUezj;
	dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PS6366VGqz3cQV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 20:57:22 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id g3so7036592wri.6
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Mar 2023 01:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677751038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mbWJMLbW9/e/jUg8R3Gl59aPCKpvLB2ljblArfmNMkc=;
        b=D2ZYUezj7aXly01/SHVyB+eFeXkneR6Cc8J1my71IdSLnhhdqJGVfRRuNkgwlJ1qTN
         XUUF4gwOhKXYNFbCGsPQC/fmmm1CJhuz26LBixBplzOx/7FJFh6PFoLAIUEiL//BV7/Y
         05yc1sH5U/bYE6lmFIKXOjlBADocSoL/FEYlfqKZv7cm3nfJkD6F5h36pt/Z2SLu/6qL
         Q4UPcDTpDkTK02yhFZFBAya3cYKbiMxizDybGbQOWT1w/zioAktweZfsaacnK76n8rs+
         hsQvLkRQmO2Fk5KV27RZdUHPghO6NZZTRFh8sElYxJrDsC3pGWp7EiGwSf9BKEnHMDqz
         Mp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677751038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mbWJMLbW9/e/jUg8R3Gl59aPCKpvLB2ljblArfmNMkc=;
        b=0optgjAtWKqVttTOJtNzeRUSEyNxrOPgVF27UZ6HDGha2HrHAbKaHSiQ48RI7+Oge3
         Vuo33VRXMLEpQZ0KUqno+wqA3m26K+uW0evn+PDxmQ7d3EPnIoL57NBg4CWb5bsvkkQK
         /Pz0CwttgqoNYXYnytCtODT34tkWW8KoM1WL8Y1j4TgiOJ5vT1T7amuoOLczhaMCsMUH
         12xu+HEONGegcKh8H+ny7Mwa46oxqtGRN+vXL2SuGn+K81xic+0FJj0GHvKZyxbieoi0
         2R8B6q85cxAcDkKqKpajV3ItT7ynW8JULSVekuzUrwzuRvwU82ZHNGKg4aNAteSNZOVg
         6DWg==
X-Gm-Message-State: AO0yUKXTYUhfQnhT5oe8497ZqDEDkIpl+5fH1PBq9i4AYsM5+1cr8435
	PjBOx8zdjHff+feCbNYt5HdzJg==
X-Google-Smtp-Source: AK7set+UVLLQy3pDYpEgdjukHVt3/WbXJ1ubEMzbQOj5ZYV5HNP6MY5JJcqxoBmTXacmF2llU10eSw==
X-Received: by 2002:adf:f4c9:0:b0:2c9:8a3c:9fc5 with SMTP id h9-20020adff4c9000000b002c98a3c9fc5mr6437471wrp.41.1677751038459;
        Thu, 02 Mar 2023 01:57:18 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id l7-20020a5d5267000000b002c8ed82c56csm14784474wrc.116.2023.03.02.01.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:57:18 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	"David S . Miller" <davem@davemloft.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	linux-arch@vger.kernel.org
Subject: [PATCH v4 21/24] xtensa: Remove empty <uapi/asm/setup.h>
Date: Thu,  2 Mar 2023 10:35:36 +0100
Message-Id: <20230302093539.372962-22-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
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
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Palmer Dabbelt <palmer@rivosinc.com>

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/uapi/asm/setup.h | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 arch/xtensa/include/uapi/asm/setup.h

diff --git a/arch/xtensa/include/uapi/asm/setup.h b/arch/xtensa/include/uapi/asm/setup.h
deleted file mode 100644
index 6f982394684a..000000000000
--- a/arch/xtensa/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
- * include/asm-xtensa/setup.h
- *
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2001 - 2005 Tensilica Inc.
- */
-
-#ifndef _XTENSA_SETUP_H
-#define _XTENSA_SETUP_H
-
-#endif
-- 
2.37.2

