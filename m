Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBB56ABBAE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 11:19:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVZMJ3qcmz3fW1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 21:19:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Kj4O690H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=alexghiti@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Kj4O690H;
	dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVZLQ4MW3z3bvH
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 21:19:10 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id f11so8204288wrv.8
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 02:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678097946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLdQZ5oKz9wvQ1p1cXiC+Rc2izcglTCWsjsdF15FoKI=;
        b=Kj4O690HpZR8Sg0W3lAeVf6DOHtzKBoDNyQ8OGTKBw14Wjfpn0Wju0B+FpDiYA8PzR
         1SK3dHst7KOj0N+0ZdU9LRXXJPgWjIQvUl7lwdexklGZmiH/9eWFkN2m+07l8+qdYgYn
         kukzgyj29WsCG+Dizw+E3+ylQA49rLGBzJupDUBzgH1AUGejJ99hzptXZhzadNPHrw8a
         kqPUpCzf76ZylFoEBRZeW/QziXd1ld+gq3yUiUzq/xkqWL3W2bsgNB+rwLCMUy+8gq4a
         5mvibSwPlQSxb0CjuIlt4ROssZfIxfhTWOJXET9izb1mXM+v4cTSm1Gk5tTSjSBDqHvO
         VDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pLdQZ5oKz9wvQ1p1cXiC+Rc2izcglTCWsjsdF15FoKI=;
        b=gwdo8J6heQ+kCT4ukCuGNPeq89z3kO97L2aWFXpd7xdYtT8nFguoi5ro/nM5yMLRao
         pOPQy77DsDhZ1xknGVfIjx7lziVWwp64wZ3Mo0Euru6d+TCzdbDJiqMOyREqhxAspX0G
         O4x4b0/UnrCC8EVUhIb1BBynKNO0cu854muGmVI/nbimDQo9NAEfZfWB15N49sMOWzy8
         CAfJWvlZHqzYHMEUwHLqk4TzIzcqUnoLuWFmfiKMea3IR3ba2IlPq3xQLfBUWysh/n6L
         Yq8P2r5I/Rwcn2KC4SjtUYoe7uo0qry+3OFkoC+trzRX6CAfZNgoileK6dqxSwJ1gQkZ
         oedQ==
X-Gm-Message-State: AO0yUKVRRhshvyJC/358PY26vyMLTWHa75Ih7tHI8py6XQQHd/POZLbW
	WNZ74InjZuEmP7TBF+ublAdi0w==
X-Google-Smtp-Source: AK7set/TREvsXpAbKK0JDdjBamcN83MfOaX3qMSgOeZ5/JPROVTq6d3QjjA2KvWEmZwjcBu6Rd56Yg==
X-Received: by 2002:adf:db92:0:b0:2c8:6db5:156b with SMTP id u18-20020adfdb92000000b002c86db5156bmr5713223wri.65.1678097946356;
        Mon, 06 Mar 2023 02:19:06 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id f12-20020a5d58ec000000b002c71b4d476asm9396495wrd.106.2023.03.06.02.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:19:06 -0800 (PST)
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
Subject: [PATCH v5 13/26] asm-generic: Remove COMMAND_LINE_SIZE from uapi
Date: Mon,  6 Mar 2023 11:04:55 +0100
Message-Id: <20230306100508.1171812-14-alexghiti@rivosinc.com>
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Palmer Dabbelt <palmerdabbelt@google.com>

As far as I can tell this is not used by userspace and thus should not
be part of the user-visible API.  Since <uapi/asm-generic/setup.h> only
contains COMMAND_LINE_SIZE we can just move it out of uapi to hide the
definition and fix up the only direct use in Loongarch.

Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Link: https://lore.kernel.org/r/20210423025545.313965-1-palmer@dabbelt.com
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/admin-guide/kernel-parameters.rst | 2 +-
 arch/loongarch/include/asm/setup.h              | 2 +-
 arch/sh/include/asm/setup.h                     | 2 +-
 include/asm-generic/Kbuild                      | 1 +
 include/{uapi => }/asm-generic/setup.h          | 0
 include/uapi/asm-generic/Kbuild                 | 1 -
 6 files changed, 4 insertions(+), 4 deletions(-)
 rename include/{uapi => }/asm-generic/setup.h (100%)

diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
index 19600c50277b..2b94d5a42bd6 100644
--- a/Documentation/admin-guide/kernel-parameters.rst
+++ b/Documentation/admin-guide/kernel-parameters.rst
@@ -207,7 +207,7 @@ The number of kernel parameters is not limited, but the length of the
 complete command line (parameters including spaces etc.) is limited to
 a fixed number of characters. This limit depends on the architecture
 and is between 256 and 4096 characters. It is defined in the file
-./include/uapi/asm-generic/setup.h as COMMAND_LINE_SIZE.
+./include/asm-generic/setup.h as COMMAND_LINE_SIZE.
 
 Finally, the [KMG] suffix is commonly described after a number of kernel
 parameter values. These 'K', 'M', and 'G' letters represent the _binary_
diff --git a/arch/loongarch/include/asm/setup.h b/arch/loongarch/include/asm/setup.h
index 72ead58039f3..86c99b183ea0 100644
--- a/arch/loongarch/include/asm/setup.h
+++ b/arch/loongarch/include/asm/setup.h
@@ -7,7 +7,7 @@
 #define _LOONGARCH_SETUP_H
 
 #include <linux/types.h>
-#include <uapi/asm/setup.h>
+#include <asm-generic/setup.h>
 
 #define VECSIZE 0x200
 
diff --git a/arch/sh/include/asm/setup.h b/arch/sh/include/asm/setup.h
index fc807011187f..ae09b1c29fd1 100644
--- a/arch/sh/include/asm/setup.h
+++ b/arch/sh/include/asm/setup.h
@@ -2,7 +2,7 @@
 #ifndef _SH_SETUP_H
 #define _SH_SETUP_H
 
-#include <uapi/asm/setup.h>
+#include <asm-generic/setup.h>
 
 /*
  * This is set up by the setup-routine at boot-time
diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index 941be574bbe0..0fb55a119f54 100644
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -49,6 +49,7 @@ mandatory-y += preempt.h
 mandatory-y += rwonce.h
 mandatory-y += sections.h
 mandatory-y += serial.h
+mandatory-y += setup.h
 mandatory-y += shmparam.h
 mandatory-y += simd.h
 mandatory-y += softirq_stack.h
diff --git a/include/uapi/asm-generic/setup.h b/include/asm-generic/setup.h
similarity index 100%
rename from include/uapi/asm-generic/setup.h
rename to include/asm-generic/setup.h
diff --git a/include/uapi/asm-generic/Kbuild b/include/uapi/asm-generic/Kbuild
index ebb180aac74e..0e7122339ee9 100644
--- a/include/uapi/asm-generic/Kbuild
+++ b/include/uapi/asm-generic/Kbuild
@@ -20,7 +20,6 @@ mandatory-y += posix_types.h
 mandatory-y += ptrace.h
 mandatory-y += resource.h
 mandatory-y += sembuf.h
-mandatory-y += setup.h
 mandatory-y += shmbuf.h
 mandatory-y += sigcontext.h
 mandatory-y += siginfo.h
-- 
2.37.2

