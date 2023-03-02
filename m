Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F8F6A7EEC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 10:55:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PS60T3GTCz3fgv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 20:55:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=PocY5jSD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=alexghiti@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=PocY5jSD;
	dkim-atps=neutral
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PS5zY3H4xz3cd1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 20:54:17 +1100 (AEDT)
Received: by mail-wm1-x330.google.com with SMTP id d41-20020a05600c4c2900b003e9e066550fso1127330wmp.4
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Mar 2023 01:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677750853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyJad6DESnZ256fhxA8bHesaXxO8dG/mPAVgfV58f6Q=;
        b=PocY5jSD+knTufeHYJY53emKY8cLaDfBcpJ3g7vcOhM0155bmN6drNHnAy/dqVYcmS
         c/manfIX36JsBtFH99BTF2Vhq17Xxmao4MhiPi3ICI2F2bi4/Ax/dOjd69nET1sNlDN6
         OtZSz6avRPNnEV/+z6xJj65aUB9Rp6l2st0GmKzcok9tj9j35urs60K8AIwWQG1Zp+fS
         k1Xh/ef/kJcmM11fj4F/vUQsnPUPMh0G9lxxM2dqDLG+wdMulGgke12EY26Onc4UNECB
         1FB84pqf6oF+ekGSZc0v9kcvl2vF8KCwqzDgQGWPfdPHjPnsi0IU3g+ILK2dYAMpfZJA
         te3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677750853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyJad6DESnZ256fhxA8bHesaXxO8dG/mPAVgfV58f6Q=;
        b=aSbxQzOLtJOeqEZDE0b5pL1HuEFObLH9opfv1uRh5fuIza/e21fpXrJXXZS851hJGu
         DLp5NWyJEkU+9PokFT4oCcAvpA/anQaZOwPKWlsHum5hKgkJSIrQrRKX2QVPeAnAyueJ
         nCXBEdGvg4EPyw2rX4O492v79Zn6Jxcwqil58H2m7d2AUTbiFUi0OKu/Ug8nuS6L6doD
         0Y6eA7Wwe0TS7QrpbXP3Ja85Jso+cTXy5muGGr1+LmTOEqbpszmEFb/Pv9BPar9SGxFE
         jZVEPBmz3/cYtIseJxlJxVi0xNnmZfBqoOwDyBBL8q6g7mYtQ0VHbvWxT3ftm0jGzKqK
         VI5g==
X-Gm-Message-State: AO0yUKU8Q47h55i5+eEFWQOGzE/exEMyyjOMUXSXcwIxYzdRGAzoA3E0
	DJauRJVk9I92CAUZvQNY4f3LZQ==
X-Google-Smtp-Source: AK7set8wLtrohdEsm9pImDViXL5baW1jLm37hLC/THOyG57xdYbkaYkmThGLVaZE3EGWQc321ut4OQ==
X-Received: by 2002:a05:600c:16c7:b0:3df:e659:f9d9 with SMTP id l7-20020a05600c16c700b003dfe659f9d9mr6908776wmn.34.1677750853161;
        Thu, 02 Mar 2023 01:54:13 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id d2-20020adfef82000000b002c5801aa9b0sm15003456wro.40.2023.03.02.01.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:54:12 -0800 (PST)
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
Subject: [PATCH v4 18/24] sparc: Remove empty <uapi/asm/setup.h>
Date: Thu,  2 Mar 2023 10:35:33 +0100
Message-Id: <20230302093539.372962-19-alexghiti@rivosinc.com>
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
---
 arch/sparc/include/uapi/asm/setup.h | 9 ---------
 1 file changed, 9 deletions(-)
 delete mode 100644 arch/sparc/include/uapi/asm/setup.h

diff --git a/arch/sparc/include/uapi/asm/setup.h b/arch/sparc/include/uapi/asm/setup.h
deleted file mode 100644
index c3cf1b0d30b3..000000000000
--- a/arch/sparc/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,9 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
- *	Just a place holder. 
- */
-
-#ifndef _UAPI_SPARC_SETUP_H
-#define _UAPI_SPARC_SETUP_H
-
-#endif /* _UAPI_SPARC_SETUP_H */
-- 
2.37.2

