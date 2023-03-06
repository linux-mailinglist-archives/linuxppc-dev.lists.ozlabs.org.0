Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A6C6ABAD6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 11:07:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVZ5456sWz3cDG
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 21:07:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=GzMxr2yR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=alexghiti@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=GzMxr2yR;
	dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVZ4B3jqBz3c5D
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 21:06:50 +1100 (AEDT)
Received: by mail-wr1-x42e.google.com with SMTP id j2so8156934wrh.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 02:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678097206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvcuE3NOD15vbspLQ8i+J1fU+muK56CBG8DLmUrfpXo=;
        b=GzMxr2yRyn0pUrItv7OQBxxlp7MvVuswU+fzM1LMzGFbYRZuR5wh9SVD334RTDZGAW
         48MUaqgcpAf2R+uUEUeOUuluXFdYq6etu7QIB4iz7yjZxaU9h0eBsUJqiH27IKG5Dvx2
         Nxfgu2m/Z0YLZvmYF4EC+rac6DkSXECFqI32UFqa1g1sBiEcr+UZFNNYTPhtQULlrVTN
         YhwU2VOjKYo21s/2wh1Rg/PC6i/jPfxPzxtT1FpSUglSki/BEpLby0k7NyJEdSkcHXV5
         IJ/y15DnIJ5IbmKM21jaTQOBzpt7dTEQ68G3ILKQAvzhDrPvTGAKu0ykHMvPHxDrcfTg
         UKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LvcuE3NOD15vbspLQ8i+J1fU+muK56CBG8DLmUrfpXo=;
        b=iI/eZ4chS6TbU1+vMDvWSvY+qD00XMXi5IXSpd5gmJLd/giAMXN2xJAYfgoPNhGri6
         6iDn2154+LQjJ/miQd/0rWbjYuKMaymL3QQaPhqguTa89+IOx04ZE0BvtOVnhxFuAFLO
         xO56GfouHYJqBG3EUWAnMqGM7agV6gM4ziewXaJSxgrOu/DKGeGhwsTfdl2e7Dp1XPhm
         BvGrAT80R2FHRyIz3YT0WCm75gTvRxZDrS6F614nvvN+R3rbD2/JJtffDndlqUfcorLK
         1LgtRzPTf0EFxgl3nbB0dPx9fY20pgmpv71lMEm1xVKrzKLZHyiUSvYKTMDNGMDpN5iA
         5Fuw==
X-Gm-Message-State: AO0yUKXswEOh+Xw4TEVyNfw0ZWNt3IMl0ZSrk0kOLCL7GNRZqvwqZpb3
	qCQ8t0A3LP+ZJRQ+EQy9uPheEA==
X-Google-Smtp-Source: AK7set8I9B88OKBP6atULLTLf+lVGQejvnuz60ddU68PPN7BboGVQ7x9xON9rTOBbgBH8tLFC+u3iw==
X-Received: by 2002:adf:da42:0:b0:2c7:16c3:175e with SMTP id r2-20020adfda42000000b002c716c3175emr6451817wrl.64.1678097206117;
        Mon, 06 Mar 2023 02:06:46 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id e17-20020a5d4e91000000b002c559626a50sm9596269wru.13.2023.03.06.02.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:06:45 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
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
Subject: [PATCH v5 01/26] alpha: Remove COMMAND_LINE_SIZE from uapi
Date: Mon,  6 Mar 2023 11:04:43 +0100
Message-Id: <20230306100508.1171812-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Palmer Dabbelt <palmer@rivosinc.com>

As far as I can tell this is not used by userspace and thus should not
be part of the user-visible API.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 arch/alpha/include/asm/setup.h      | 4 ++--
 arch/alpha/include/uapi/asm/setup.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/include/asm/setup.h b/arch/alpha/include/asm/setup.h
index 262aab99e391..ea08ca45efa8 100644
--- a/arch/alpha/include/asm/setup.h
+++ b/arch/alpha/include/asm/setup.h
@@ -2,8 +2,6 @@
 #ifndef __ALPHA_SETUP_H
 #define __ALPHA_SETUP_H
 
-#include <uapi/asm/setup.h>
-
 /*
  * We leave one page for the initial stack page, and one page for
  * the initial process structure. Also, the console eats 3 MB for
@@ -14,6 +12,8 @@
 /* Remove when official MILO sources have ELF support: */
 #define BOOT_SIZE	(16*1024)
 
+#define COMMAND_LINE_SIZE	256
+
 #ifdef CONFIG_ALPHA_LEGACY_START_ADDRESS
 #define KERNEL_START_PHYS	0x300000 /* Old bootloaders hardcoded this.  */
 #else
diff --git a/arch/alpha/include/uapi/asm/setup.h b/arch/alpha/include/uapi/asm/setup.h
index f881ea5947cb..9b3b5ba39b1d 100644
--- a/arch/alpha/include/uapi/asm/setup.h
+++ b/arch/alpha/include/uapi/asm/setup.h
@@ -2,6 +2,4 @@
 #ifndef _UAPI__ALPHA_SETUP_H
 #define _UAPI__ALPHA_SETUP_H
 
-#define COMMAND_LINE_SIZE	256
-
 #endif /* _UAPI__ALPHA_SETUP_H */
-- 
2.37.2

