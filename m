Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E31696025
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 11:02:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGGwj1ZLwz3cjB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 21:02:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=fR3zO3k5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=alexghiti@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=fR3zO3k5;
	dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGD1x0lQSz3c9r
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 18:52:04 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id r18so10338848wmq.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Feb 2023 23:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8QGomR6O3S6q1h7LTqMqQGUhrMtnm9a8zoeq++2Xa7o=;
        b=fR3zO3k5w7le7EbRP/5hPFZY4uLUH4ckgrh9M19BdH9Dv5reStNddHAA25t4N3Sesc
         W25DNRjk2eDkyloYIh9FawqDzoeoM5Ihv9WzrU14UP5nmny0ohmEa7tB18dRaok9qcca
         Cg0/N9fChXGeR9QMmopc9nD283PdFxnqO1RlIt/KWu0qU3CATwIBzQpWXLSYWOSHHwKx
         jTukzmp6/vXmx9SoOo9K/bTE3PzB48TIwUC3pPgKI8wOpNsm+0N+U4RKCka40i+f5BkP
         /FvKgQ3hYM5uSvNyCCcF0tflxn/F7hAgfgHVd6eT53WfWqqvJFa/ALNyo+E9eOUo2Ak5
         AmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8QGomR6O3S6q1h7LTqMqQGUhrMtnm9a8zoeq++2Xa7o=;
        b=vcpUkyrtaDEyEA+qMx2w/Cj+s2XS4r0Id+Z+MLV2Cd06abQPFBLFoCaTAAKIUquSd+
         RDgo/Cp8lMEbeY3Q5E23gpJI0ANrpF+rDWGadeNETkjqSgGpB9PeiBvSSbe+WGBb/Qzg
         +0ahTHKvh8y7MApYe+vKUg08w896FIcI4se/zbZJMDpisdHc7dweeietNuHV7LndYMRu
         xRKO0hn6xP3d3w5JcG73bcSh6yEX2LKGKMx/PBM48fHdw3Ix0rX7E3czGQtOOiMbkGaT
         WrCwV7TbFAPh4I+R841wbdQ47P33tag8IxRq8emMXgzgbRH9t5OVwfHorkrRWQPRY99L
         9/9w==
X-Gm-Message-State: AO0yUKVEzDzQVVwdyGEKlwKY8iMm3mJVGZ3ItzLli8+4MBmDjkl80WIu
	aJFhVRV15bdefkdoDBcWfArJrQ==
X-Google-Smtp-Source: AK7set9/2z/bngt+TO0I8mQoi50ZVTNoeKRPycliCaMbwq0WtByVc0+O7QBcGv8JCO9MxNJMRmluyA==
X-Received: by 2002:a05:600c:4b20:b0:3dc:53da:328b with SMTP id i32-20020a05600c4b2000b003dc53da328bmr1128761wmp.14.1676361121511;
        Mon, 13 Feb 2023 23:52:01 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id n22-20020a05600c4f9600b003dcc82ce53fsm17982254wmq.38.2023.02.13.23.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 23:52:01 -0800 (PST)
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
Subject: [PATCH v3 02/24] arm64: Remove COMMAND_LINE_SIZE from uapi
Date: Tue, 14 Feb 2023 08:49:03 +0100
Message-Id: <20230214074925.228106-3-alexghiti@rivosinc.com>
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

As far as I can tell this is not used by userspace and thus should not
be part of the user-visible API.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/arm64/include/asm/setup.h      | 3 ++-
 arch/arm64/include/uapi/asm/setup.h | 2 --
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/setup.h b/arch/arm64/include/asm/setup.h
index f4af547ef54c..7ca70f883cee 100644
--- a/arch/arm64/include/asm/setup.h
+++ b/arch/arm64/include/asm/setup.h
@@ -4,8 +4,9 @@
 #define __ARM64_ASM_SETUP_H
 
 #include <linux/string.h>
+#include <linux/types.h>
 
-#include <uapi/asm/setup.h>
+#define COMMAND_LINE_SIZE	2048
 
 void *get_early_fdt_ptr(void);
 void early_fdt_map(u64 dt_phys);
diff --git a/arch/arm64/include/uapi/asm/setup.h b/arch/arm64/include/uapi/asm/setup.h
index 5d703888f351..f9f51e5925aa 100644
--- a/arch/arm64/include/uapi/asm/setup.h
+++ b/arch/arm64/include/uapi/asm/setup.h
@@ -22,6 +22,4 @@
 
 #include <linux/types.h>
 
-#define COMMAND_LINE_SIZE	2048
-
 #endif
-- 
2.37.2

