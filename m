Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4669B6A7E46
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 10:44:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PS5m70Vw2z3fTJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 20:44:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=THlbw0f7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=alexghiti@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=THlbw0f7;
	dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PS5kV5rs2z3fRc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 20:42:58 +1100 (AEDT)
Received: by mail-wr1-x435.google.com with SMTP id h11so4130496wrm.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Mar 2023 01:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677750174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEfUyHhSZ3oYgL6bFnxkvE0TCBKNcLgB/+iPRr5Nmfo=;
        b=THlbw0f7YBDWzcp/D7jU91zoK7h+sLtdoKT4dkUxCfNC7PHuf6+xLX1U8YBxxphqv7
         SLKjiOegBsh3QW5ueV3X6lOfAmYpWoOP683+Wd3yzsKexXlrzQWdfzKTHW8pqqspMFWd
         wyysgVMQuZqSpGcd7XWqJBaI/X9IEjsYMQiF7DJjchBM+PeDCPRXaOMvhS73l+o9b+pk
         PByonJmlUdc2j9xadwPPHavP5X6OM0XAlddx7GeWel0hgjNx+cXSk4XiLYDXt0gQv25g
         blcIBuzunKMOcfdHuG4/AZbEI+cqqiGwwt5wcUbhD0LHAezoTL50NxN1le9xQZUVW4vT
         21oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677750174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uEfUyHhSZ3oYgL6bFnxkvE0TCBKNcLgB/+iPRr5Nmfo=;
        b=pCGcAGVY9q8CmQwfTDK8+jaf1ARQ66bT+zvmsX7aRTLbQmgLzp0UHycfDMzdTIfbs0
         f9ernbWL2h0jy2I3Gr1NCdmBdVbi2BW2zYMfv2KKnjNfLvqWeSLNgcad9Hb1wdFvd5hx
         C4qcEfjw7y9JMUxO1X++pkLwOpT7ukh5S+qJRrla92KjjOdYpoy4bpwFkOIJ6Pc7shi0
         ZjkY7V4lEepWRX6TKvG5CI2Kuk+LKnrEBlYG9gJJtbqdx7Voau6kV///Yt38RiYLsJqA
         97PRI57ahairBszrJKzsDOGAQaAOULQxQBeOJ81ABBo6uS3GLuWELcahKuWMkeRUKWhk
         n4Pw==
X-Gm-Message-State: AO0yUKWNybwCQ26IhZd1Lxs6SEUoCBTccU272Mhzu5HCtc0AqQZ/qSX2
	xLo7Fk3kR1CM6D9N2GFzhFL3Ug==
X-Google-Smtp-Source: AK7set/F94zZ8y7FiH0XLMUcsTDHA/cQVmeboRfi75ZoQWq75QeIoOfllfRsQw/U31Sx77gqBykQyw==
X-Received: by 2002:a5d:604b:0:b0:2c7:faf:af32 with SMTP id j11-20020a5d604b000000b002c70fafaf32mr6686722wrt.14.1677750174151;
        Thu, 02 Mar 2023 01:42:54 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id s4-20020a5d6a84000000b002c551f7d452sm15080709wru.98.2023.03.02.01.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:42:53 -0800 (PST)
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
Subject: [PATCH v4 07/24] mips: Remove COMMAND_LINE_SIZE from uapi
Date: Thu,  2 Mar 2023 10:35:22 +0100
Message-Id: <20230302093539.372962-8-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Palmer Dabbelt <palmer@rivosinc.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Palmer Dabbelt <palmer@rivosinc.com>

As far as I can tell this is not used by userspace and thus should not
be part of the user-visible API.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 arch/mips/include/asm/setup.h      | 3 ++-
 arch/mips/include/uapi/asm/setup.h | 3 ---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/setup.h b/arch/mips/include/asm/setup.h
index 8c56b862fd9c..a13b9259b476 100644
--- a/arch/mips/include/asm/setup.h
+++ b/arch/mips/include/asm/setup.h
@@ -3,7 +3,8 @@
 #define _MIPS_SETUP_H
 
 #include <linux/types.h>
-#include <uapi/asm/setup.h>
+
+#define COMMAND_LINE_SIZE	4096
 
 extern void prom_putchar(char);
 extern void setup_early_printk(void);
diff --git a/arch/mips/include/uapi/asm/setup.h b/arch/mips/include/uapi/asm/setup.h
index 7d48c433b0c2..157c3c392fb4 100644
--- a/arch/mips/include/uapi/asm/setup.h
+++ b/arch/mips/include/uapi/asm/setup.h
@@ -2,7 +2,4 @@
 #ifndef _UAPI_MIPS_SETUP_H
 #define _UAPI_MIPS_SETUP_H
 
-#define COMMAND_LINE_SIZE	4096
-
-
 #endif /* _UAPI_MIPS_SETUP_H */
-- 
2.37.2

