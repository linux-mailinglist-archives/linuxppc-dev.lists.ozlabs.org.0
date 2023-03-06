Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E266ABBD2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 11:22:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVZPh5PlHz3fR6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 21:22:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=eKLpoO9A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=alexghiti@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=eKLpoO9A;
	dkim-atps=neutral
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVZNp4M2Bz3fVW
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 21:21:13 +1100 (AEDT)
Received: by mail-wm1-x331.google.com with SMTP id p26so5260834wmc.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 02:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678098070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+Ect6Q4Z/51Ss7kNoue4ZgIVIoWQVVZbpFfKkrpRUw=;
        b=eKLpoO9ARR6byQoI3KfBvzhVk6oe6tP+suH4MHwkIJcy/wnL2MWwPVlq3KLS4NJYuC
         npg5z0T2YBn/ekgqpnS/gNer4hyqDKqYzgmIxENE3SgezTEwqliE0zYvr1fPH2GwQmt9
         jcx1NZi01pxBQ8XJzaRbcQsUYYsPfqsPA8Xrv5yjnuSnQHXj/GpNSw6rf6ah3jgmbxsg
         5zflN2ad7NQHZvZAnNO7AQDSJOT5MmVleuf7siqRD5syVZugGRJ+AhyVsYNsIzfeu+J7
         VpepoXaaVFgjZInk8H50HM4y5yJKfoYFvZxa+/DInESeQ0WBP4e+4PFuGrx7eKGY+RhS
         PH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678098070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+Ect6Q4Z/51Ss7kNoue4ZgIVIoWQVVZbpFfKkrpRUw=;
        b=EO5Pj1jG9/THM7/aKyAPHSNMLoQNmmADPx6I/Z6KFxqMvX2n5I6i1im+jf3rtsH7D7
         WnYA0qnBq5raPgYS1rbpR0mdQiF//6i0s+tCLrCkZDrRYy3RkstSctVddHaie/EdTyIQ
         c6r8aOSX2n1sevXI/+tjCUDPfSbKxQEe26vZQn2AL8sXCuVYpf04mcZYWHbmxM3Byqlz
         vN/P72XSF0Yss/HlO2gJS5oyD5cT63H1SFeol98dP4DQ64/rGtGdYI35J0FU9FUhwNhg
         N8UWyJI6ZMiHmdA00q90bS9VzCnYU2tLcsEl7JvPwPq9ZQkQYgs6VS0c6VYKcEA1zHBs
         uO6Q==
X-Gm-Message-State: AO0yUKVFHmfFfC0SNfUo7+TGMjrBoIj+RhVieddoVt/VlXfYLhsrhK5N
	mHH3PRFt6J5jVDIhQLJfoniBjg==
X-Google-Smtp-Source: AK7set/wPuCwO2+/CS8VAJ7eTry4Cq+2CHA4Y8YGXKD1MQFrurlRBakmEmc3JjUrX5cCPEVIcMP5rQ==
X-Received: by 2002:a05:600c:5254:b0:3eb:432d:8279 with SMTP id fc20-20020a05600c525400b003eb432d8279mr9240197wmb.13.1678098069733;
        Mon, 06 Mar 2023 02:21:09 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id v18-20020a05600c15d200b003e20a6fd604sm9521693wmf.4.2023.03.06.02.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:21:09 -0800 (PST)
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
Subject: [PATCH v5 15/26] arc: Remove empty <uapi/asm/setup.h>
Date: Mon,  6 Mar 2023 11:04:57 +0100
Message-Id: <20230306100508.1171812-16-alexghiti@rivosinc.com>
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

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 arch/arc/include/asm/setup.h      | 1 -
 arch/arc/include/uapi/asm/setup.h | 6 ------
 2 files changed, 7 deletions(-)
 delete mode 100644 arch/arc/include/uapi/asm/setup.h

diff --git a/arch/arc/include/asm/setup.h b/arch/arc/include/asm/setup.h
index 028a8cf76206..fe45ff4681bc 100644
--- a/arch/arc/include/asm/setup.h
+++ b/arch/arc/include/asm/setup.h
@@ -7,7 +7,6 @@
 
 
 #include <linux/types.h>
-#include <uapi/asm/setup.h>
 
 #define COMMAND_LINE_SIZE 256
 
diff --git a/arch/arc/include/uapi/asm/setup.h b/arch/arc/include/uapi/asm/setup.h
deleted file mode 100644
index a6d4e44938be..000000000000
--- a/arch/arc/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,6 +0,0 @@
-/*
- * setup.h is part of userspace header ABI so UAPI scripts have to generate it
- * even if there's nothing to export - causing empty <uapi/asm/setup.h>
- * However to prevent "patch" from discarding it we add this placeholder
- * comment
- */
-- 
2.37.2

