Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F77469608F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 11:18:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGHHF0Rfvz3ftN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 21:18:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=PTQkf//d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=alexghiti@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=PTQkf//d;
	dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGDRJ5qGDz3c46
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 19:10:36 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id o18so14749067wrj.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 00:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GFm9NTVm8dbp1GpfLPnAIV1IFir3mGxMVXJeR5p3rs=;
        b=PTQkf//dJGBi2m4Z02VrlE5ANJFq2MWQ6OYQ8nrykhLGUsTt5XBy5YRbf9k9QQegRY
         BVMzJeHG2/hFVSB1Fa0QtoB+NswSMEx7hYwZhLpwiCjCHYi8Y6QbOTsMsY3YRaN2fxyI
         TQrME1t7VPJR1xsC11gsDznxT0+kI7jvgwxSJ4o858yIfRNXRcmvtAxcaRNyUPEuNCl2
         Hm3cAUgxzybA5MtTnncNweGachZ+4qdYQplQMHP/HhiBFsXSovoVwRHcNBk3sGiUk6gs
         zKB5R71fru3DffzOCLnt/KNVPa5PO68WzDLt4s5DKXCBAv8XkTB3JqSiC1c2d82rGL2R
         LHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GFm9NTVm8dbp1GpfLPnAIV1IFir3mGxMVXJeR5p3rs=;
        b=r43Quf40Ta5U19VU/NUVs6MOFXtQ/c7/XkXV9BrfhuDB6xyA3jYZWaksiqK+/sBoST
         WGqv8Cdp00+QppvejcuCX4Vju/L6w1Jentl2WbIzhBg4emBjFwgxJEgKRTL3t3ipOaaO
         +B8IxnjoFSgnEUnujK0xPsT8KhBc6vzjpMOI88wQy8Aj/EJrfFEk7h1NRmA/XvF1bXtn
         wwopyuhQSD948Knt412GygfMIjMTSLztgjd8GypXlOglApb++Eyhb/r6vNtiGpRqFRKm
         SJ9faQLtOO1zc47ZycyeJwpK/5MVUZAhrrFJQ0eieJhShiLt+MKoBAI+2LzJXCN2cDz8
         R1LQ==
X-Gm-Message-State: AO0yUKU68uE/DzbUlmIP2CHFTrVEY87hJm4pjmILc86623iUUp/KdQF3
	Sf+gILzenfLxfRBhZ1PmrD0UmA==
X-Google-Smtp-Source: AK7set9cFggn5kLsyauNurU9k3OzP0c5nfv55sbLNFuogeg4x/2W1qLasJcZZgSg2XJAOsdA/Tl6bA==
X-Received: by 2002:a5d:6183:0:b0:2c3:e990:a1e3 with SMTP id j3-20020a5d6183000000b002c3e990a1e3mr1228880wru.60.1676362232683;
        Tue, 14 Feb 2023 00:10:32 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id b4-20020a5d4b84000000b002c55b0e6ef1sm3398514wrt.4.2023.02.14.00.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 00:10:32 -0800 (PST)
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
Subject: [PATCH v3 20/24] x86: Remove empty <uapi/asm/setup.h>
Date: Tue, 14 Feb 2023 08:49:21 +0100
Message-Id: <20230214074925.228106-21-alexghiti@rivosinc.com>
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
 arch/x86/include/asm/setup.h      | 2 --
 arch/x86/include/uapi/asm/setup.h | 1 -
 2 files changed, 3 deletions(-)
 delete mode 100644 arch/x86/include/uapi/asm/setup.h

diff --git a/arch/x86/include/asm/setup.h b/arch/x86/include/asm/setup.h
index f37cbff7354c..449b50a2f390 100644
--- a/arch/x86/include/asm/setup.h
+++ b/arch/x86/include/asm/setup.h
@@ -2,8 +2,6 @@
 #ifndef _ASM_X86_SETUP_H
 #define _ASM_X86_SETUP_H
 
-#include <uapi/asm/setup.h>
-
 #define COMMAND_LINE_SIZE 2048
 
 #include <linux/linkage.h>
diff --git a/arch/x86/include/uapi/asm/setup.h b/arch/x86/include/uapi/asm/setup.h
deleted file mode 100644
index 79a9626b5500..000000000000
--- a/arch/x86/include/uapi/asm/setup.h
+++ /dev/null
@@ -1 +0,0 @@
-/* */
-- 
2.37.2

