Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC78696022
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 11:01:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGGvh27zWz3f4V
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 21:01:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=C2iakMWM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=alexghiti@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=C2iakMWM;
	dkim-atps=neutral
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGD0m2wvnz3bgk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 18:51:04 +1100 (AEDT)
Received: by mail-wr1-x432.google.com with SMTP id by3so13364366wrb.10
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Feb 2023 23:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfhnFvdOBMaLaqHchQiBMEzcSlF2Fa7xiydpzk9bce4=;
        b=C2iakMWMXSP/c9K7z5Xrdh2FZ8isHrwxMldv7DFWh875IFzrwvaewsb7pv+pVa32tl
         uGCdv0Gz5Sla77Gz5skt6wbYUcHV0MvrDD91ZQ6pbR0FErzvIa+siHbNV83wcBxe5ArP
         aJt1rzTFYZAlJ16o/6rxYLUe5PNm3Cl+WBlup3rC4VDyDpLzh+6dKa0ocOU49K1pDDRG
         2DU7qDQ8it3t/pBnyu9Q2n/Gn2V8da6o1Pd0nCVDpMY7pf+5XFSyefWucX0xtqrzNgZK
         hOieCgCpkZJ2M+Y8BO8XCPqXTZ1/32v6n2w6GpPqHXYf4CRyUxX7PkOvD2S1cOWpGGyY
         hVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UfhnFvdOBMaLaqHchQiBMEzcSlF2Fa7xiydpzk9bce4=;
        b=IpU/0Qhh9kFADwOpG1a0e8PFeyJ6WmeOMNlcdQufHvssNU6qlZhHijEfDOyAX63gbW
         9oXwY/UUNFLiFp3GevZ4Mb0uIjlRtMxtY6PfpW+nMj6EGtGqQ37IVugVSg/30MuB/127
         m6kWsTQwaC+exQvfyIO0nzewV97x7hcker/cG+/pZY25hOwWwLkXSKPvbPDFUYqhW5cm
         ShZBsz7a6w56+1Y1vKzognbPN5n9hwsKvqtDKVAoYtbFyw5BN9NjN/DY7MRx+hsbZPrJ
         PXoRqILhUZ5zvwbkes3h9t3Ul0Ev8ud710zTAmj0Kp/bELdo/nXeK3GHM5AahGxaK+gZ
         1Fig==
X-Gm-Message-State: AO0yUKUwIS0ZxqS6UDOXfVbYQKztR8GZvzRkKPuzxy2WPYR8LA4SZGto
	dESNPW9Hwb7npU0daK0LTvtVcA==
X-Google-Smtp-Source: AK7set+tz6eryASejtd5hVfxacJT6BORz8YwC4GVnZIt8q/N1OOFFLu4x7zoiximKp+ApGKLpAFEDQ==
X-Received: by 2002:adf:fd45:0:b0:2c3:e300:f5a2 with SMTP id h5-20020adffd45000000b002c3e300f5a2mr1090779wrs.50.1676361059827;
        Mon, 13 Feb 2023 23:50:59 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id f5-20020adff445000000b002c53f5b13f9sm12091737wrp.0.2023.02.13.23.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 23:50:59 -0800 (PST)
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
Subject: [PATCH v3 01/24] alpha: Remove COMMAND_LINE_SIZE from uapi
Date: Tue, 14 Feb 2023 08:49:02 +0100
Message-Id: <20230214074925.228106-2-alexghiti@rivosinc.com>
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

