Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5C76ABB2B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 11:10:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVZ8d1vgXz2yV5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 21:10:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=uFqyPU/K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=alexghiti@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=uFqyPU/K;
	dkim-atps=neutral
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVZ7l2zCXz2xB5
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 21:09:55 +1100 (AEDT)
Received: by mail-wr1-x42f.google.com with SMTP id f11so8175818wrv.8
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 02:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678097391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZOQ1qdZsFIK5hbGOnWeLVu8XxoTb8xkf1L43beLt1s=;
        b=uFqyPU/KfF2H0sgeJPKblQQ09z2QF+U8QLkec7GtAjnGRixcmkQQHmI7463iJRt1T/
         rHxu0Kl4nc3nOt5MH9Ymte5dM23zyqLTRTNXtNU/pE708hNq7xfdVy9kEFY5gWKXtEwu
         IOizVhQJrEUxmZR+iVQR/Op/EKbjLs+sDVdMJbW1oFXrIiiiohfr4Ht1NR2SXiWfV4yF
         vCqG7L6DlmSxUldGFBQRAIoJ9f/jjDlGsHjp0/BtyE1TaiFX6kgDAhRCjZMstOl1yuBn
         ROiJ5Ouz3oB3EdmXnuAEfAUOcog9CZw6U/stmGUU76S9rvh5HigWpSduzV3a1puQbFWA
         f9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZOQ1qdZsFIK5hbGOnWeLVu8XxoTb8xkf1L43beLt1s=;
        b=fdOAEVhM3ZYFcCrx/qd3jKyYcZKN+oI1ywDJ85Uij1zFocG3e4rPlxU+IMvBCU+N6U
         Lddwy7Fz1z9kjzGpyiqLZSAQt/yt3e1JtMckHfByMNVqV6ktIkrZoowdp8ongwv+PTwA
         pUA6qCp0dWsHJZkhjc7qc3Z21nYagGt7AXPsrsHxKkcMikBr/pASg6NJb5ongjdAc//d
         SsW1CxPYbiGYTbb+QHtNz2Gp8WiD/DVzQz+TZnZqrsWEeFy55MDqbbWae4gCZi56UGOT
         uAPgbVuY6FEmdXcXWmI9D+P0WRHGz0HVm/EYxs2LgANua5nTEBUXmx90yhOt2CD5zFH6
         Mupw==
X-Gm-Message-State: AO0yUKXfoB1VYaxriFuXR2+eRt/TmEjq9G3ZzJYa/L3qpLgZlwsLGoHF
	6LHvkWUv1DpCZ8TQwspt6Xnjng==
X-Google-Smtp-Source: AK7set+81v6+Tn1jgTZ0GG84ONU4lrLBfEM4VVz0EKMiaYSTRJq6zNMe3zar9b+ifVJD076yKeNEYA==
X-Received: by 2002:adf:dd83:0:b0:2c7:148c:b054 with SMTP id x3-20020adfdd83000000b002c7148cb054mr6259157wrl.29.1678097391202;
        Mon, 06 Mar 2023 02:09:51 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id k11-20020a5d628b000000b002c707b336c9sm9267953wru.36.2023.03.06.02.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:09:51 -0800 (PST)
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
Subject: [PATCH v5 04/26] ia64: Remove COMMAND_LINE_SIZE from uapi
Date: Mon,  6 Mar 2023 11:04:46 +0100
Message-Id: <20230306100508.1171812-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Palmer Dabbelt <palmer@rivosinc.com>

As far as I can tell this is not used by userspace and thus should not
be part of the user-visible API.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/ia64/include/asm/setup.h      | 10 ++++++++++
 arch/ia64/include/uapi/asm/setup.h |  6 ++----
 2 files changed, 12 insertions(+), 4 deletions(-)
 create mode 100644 arch/ia64/include/asm/setup.h

diff --git a/arch/ia64/include/asm/setup.h b/arch/ia64/include/asm/setup.h
new file mode 100644
index 000000000000..ba57909cad4c
--- /dev/null
+++ b/arch/ia64/include/asm/setup.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __IA64_SETUP_H
+#define __IA64_SETUP_H
+
+#include <uapi/asm/setup.h>
+
+#define COMMAND_LINE_SIZE	2048
+
+#endif
diff --git a/arch/ia64/include/uapi/asm/setup.h b/arch/ia64/include/uapi/asm/setup.h
index 8d13ce8fb03a..bcbb2b242ded 100644
--- a/arch/ia64/include/uapi/asm/setup.h
+++ b/arch/ia64/include/uapi/asm/setup.h
@@ -1,8 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef __IA64_SETUP_H
-#define __IA64_SETUP_H
-
-#define COMMAND_LINE_SIZE	2048
+#ifndef __UAPI_IA64_SETUP_H
+#define __UAPI_IA64_SETUP_H
 
 extern struct ia64_boot_param {
 	__u64 command_line;		/* physical address of command line arguments */
-- 
2.37.2

