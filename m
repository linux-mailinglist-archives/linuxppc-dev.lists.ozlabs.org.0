Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0B8696076
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 11:15:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGHBv420lz3fcq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 21:15:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=UGrBcngr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=alexghiti@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=UGrBcngr;
	dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGDLY0vlGz3bbS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 19:06:28 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id bk16so14695672wrb.11
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 00:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/w7ieSXW+WzBEEqtsZC24vvchjHjLnvFIFUR1Ngux8=;
        b=UGrBcngruwTLvwOOm7gOoc2Yzgq2gmU8JRfZsTFbWRd99AV3ziDVQuBUVdZS/uBCFk
         +3aLdmRI89tLj2iljfUlsLdSxPMOr5QSmEVADDMVykrfeU2sAt+uFyobqYXV6XUQvHtV
         jdUz1vPuc9IWOpiCNUcrs1cCLlV2re4AVPHCx4XLzS4MxJsBM6UJszAfCTjH1KmA8qZQ
         TWkyzsUaxL17K52AMLE7+/TIWSwi/E0sHASnxATgyu66+VseSWhxLktBl3TOfl1HX6wj
         4bxu9a8rEsGTg1ZDZ3zYhDk1wa1bPvp7XX5Iuj4jyR7Z+HHL0oszr20E97QEiSzhgOlO
         W96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/w7ieSXW+WzBEEqtsZC24vvchjHjLnvFIFUR1Ngux8=;
        b=xagqezEL9DMJh5Z7ANUcLwTJ5kbb/lGROniN4eOyeh3vQRWz4GieIbHaAHDJwPMiQf
         mbFIjXlFoQ3ZKVrIxjzVGbRe86si5/GDPScF624JjZa9PgdYZeOqmz04IMZi84ZZlpqF
         oUtuc935+8AzhnYsFQRn3lWPc7gDRduGW14fz1yLBrs+CHbOdUNwryt8ziiXSwnX1C1K
         fUsLgrkzr/+7wF+JWi0+cOpRvIf1o/mpUPSLRDcVo8aF4gKit0/lGZlTRDMhyNXKnz3x
         JBcLIzGAgaDJygda/nb9yOiIdgImEONQOjGCkX2Rja6M/YnW9ALZSAnUQckqzn/V+PUi
         FzqA==
X-Gm-Message-State: AO0yUKV0bxEii5wzFqWf9D1erTrVA87tBsFwZ7nz4WnyoKivd21SLw3W
	DLdIlxOcotwUGW4Sc/+5YqMv4w==
X-Google-Smtp-Source: AK7set8jahhsmvoa4DobzenRk97aNdlbkQr6UNkRKatca0OX964f0M1CS0uJhtUAyqSOu5CbY69FOw==
X-Received: by 2002:a5d:658f:0:b0:2c5:60e6:eac with SMTP id q15-20020a5d658f000000b002c560e60eacmr1654715wru.24.1676361985813;
        Tue, 14 Feb 2023 00:06:25 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id d1-20020adffd81000000b002bfe08c566fsm12135055wrr.106.2023.02.14.00.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 00:06:25 -0800 (PST)
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
Subject: [PATCH v3 16/24] arm64: Remove empty <uapi/asm/setup.h>
Date: Tue, 14 Feb 2023 08:49:17 +0100
Message-Id: <20230214074925.228106-17-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 14 Feb 2023 21:00:13 +1100
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
---
 arch/arm64/include/uapi/asm/setup.h | 25 -------------------------
 1 file changed, 25 deletions(-)
 delete mode 100644 arch/arm64/include/uapi/asm/setup.h

diff --git a/arch/arm64/include/uapi/asm/setup.h b/arch/arm64/include/uapi/asm/setup.h
deleted file mode 100644
index f9f51e5925aa..000000000000
--- a/arch/arm64/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
- * Based on arch/arm/include/asm/setup.h
- *
- * Copyright (C) 1997-1999 Russell King
- * Copyright (C) 2012 ARM Ltd.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
- */
-#ifndef __ASM_SETUP_H
-#define __ASM_SETUP_H
-
-#include <linux/types.h>
-
-#endif
-- 
2.37.2

