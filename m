Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EFA5A706E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 00:15:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHM7R45sNz3c9K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 08:15:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20210112 header.b=Jbe444uv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=googlemail.com (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=cgzones@googlemail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20210112 header.b=Jbe444uv;
	dkim-atps=neutral
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHB730c5Xz3bkR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 01:29:16 +1000 (AEST)
Received: by mail-ej1-x632.google.com with SMTP id kk26so22888479ejc.11
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 08:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=/KQ/vUyiG4uvx6QG1V/DvG1u3VsN0RU6NmbgpiZoIwo=;
        b=Jbe444uvwS5KTtBsCVBQjowFQX49PHwxyphvrog6nzitvtmHBHJMnk/ZXbtFjf4ivK
         05Qx4aMUE04ULC1C5awae7j4X5P9v22dPa9y9903IO/MYxipD+HrcvQQ15y+/rG3bhKL
         4gl4/UESbeSMeDSj0WoBLZdVsTJtzG0xipCPmcnRa8zxUsUaapTfn57JwaCoZBc3TH1d
         l6y3eQc3QWr/aFnH4qMBWANzKiSmGU2WnZGxLGbvrFQQ8U8EGaCrVYoWlbtqLk+koQDw
         gnw0y0HmKYojMLO+m4tqL6r7fUOmxHIS3+r5H8g+GVc6QppaQoeQ5HaMO2dCWJKkqEzA
         2nzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=/KQ/vUyiG4uvx6QG1V/DvG1u3VsN0RU6NmbgpiZoIwo=;
        b=vlUOQTvARkgbw4KH0kuB9hE4u7IyfHznYDFCaDuMdZn8UJ3it2QMZT2H6qRddtMruT
         TZq/nb8F8ZhcfmghRgckLnozYiDEEILC5I8aLMDgXtN4Ze9t/2vohkxbxEUxdRLkpH74
         fiE3D7ZCUrqZpWXBBhbcj+08SNXRRym+n452zBR03W08+CRcRKgC7GO4qBHie85NzVjG
         9prJ0A7R0uz7NtCRxd0mp8k7708OrH4VqbSlGboxFKlzlKq8fok9BFhkPvGErCtY1Su7
         pngC2JIOQcfyqGmi7Oi6mjdY+oT1NAnul8Bbq4k3ttVCmelRM+0LZNLDKYWwjuHnl8j3
         uzoA==
X-Gm-Message-State: ACgBeo1m/owPfFXaIy7oxZePpRNqUvGG4fFZgOKnoCgmxFKaF4IPuUUy
	13MXmVZPdl+dIGP/L0W+sy0=
X-Google-Smtp-Source: AA6agR6mh+hG5Ub9n0mP0M72q8basJqWrEfuKrZt7HLzsynsaPcpmVK6SV7y8Jwa2Sli8dDEw14qDA==
X-Received: by 2002:a17:906:cc13:b0:73d:d22d:63cd with SMTP id ml19-20020a170906cc1300b0073dd22d63cdmr17202596ejb.741.1661873348951;
        Tue, 30 Aug 2022 08:29:08 -0700 (PDT)
Received: from debianHome.localdomain (dynamic-095-116-163-172.95.116.pool.telefonica.de. [95.116.163.172])
        by smtp.gmail.com with ESMTPSA id t19-20020a056402525300b00445bda73fbesm5473947edd.33.2022.08.30.08.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 08:29:08 -0700 (PDT)
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To: selinux@vger.kernel.org
Subject: [RFC PATCH 2/2] fs/xattr: wire up syscalls
Date: Tue, 30 Aug 2022 17:28:38 +0200
Message-Id: <20220830152858.14866-1-cgzones@googlemail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 31 Aug 2022 08:14:47 +1000
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Paul Moore <paul@paul-moore.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-xtensa@linux-xtensa.org, =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>, Vasily Gor
 bik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, linux-alpha@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Wang Haojun <jiangliuer01@gmail.com>, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Paris <eparis@redhat.com>, linux-audit@redhat.com, Arnd Bergmann <arnd@arndb.de>, Sven Schnelle <svens@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-fsdevel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, 
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Enable the new added extended attribute related syscalls.

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
TODO:
  - deprecate traditional syscalls (setxattr, ...)?
  - resolve possible conflicts with proposed readfile syscall
---
 arch/alpha/kernel/syscalls/syscall.tbl      |  4 ++++
 arch/arm/tools/syscall.tbl                  |  4 ++++
 arch/arm64/include/asm/unistd.h             |  2 +-
 arch/arm64/include/asm/unistd32.h           |  8 ++++++++
 arch/ia64/kernel/syscalls/syscall.tbl       |  4 ++++
 arch/m68k/kernel/syscalls/syscall.tbl       |  4 ++++
 arch/microblaze/kernel/syscalls/syscall.tbl |  4 ++++
 arch/mips/kernel/syscalls/syscall_n32.tbl   |  4 ++++
 arch/mips/kernel/syscalls/syscall_n64.tbl   |  4 ++++
 arch/mips/kernel/syscalls/syscall_o32.tbl   |  4 ++++
 arch/parisc/kernel/syscalls/syscall.tbl     |  4 ++++
 arch/powerpc/kernel/syscalls/syscall.tbl    |  4 ++++
 arch/s390/kernel/syscalls/syscall.tbl       |  4 ++++
 arch/sh/kernel/syscalls/syscall.tbl         |  4 ++++
 arch/sparc/kernel/syscalls/syscall.tbl      |  4 ++++
 arch/x86/entry/syscalls/syscall_32.tbl      |  4 ++++
 arch/x86/entry/syscalls/syscall_64.tbl      |  4 ++++
 arch/xtensa/kernel/syscalls/syscall.tbl     |  4 ++++
 include/asm-generic/audit_change_attr.h     |  6 ++++++
 include/linux/syscalls.h                    |  8 ++++++++
 include/uapi/asm-generic/unistd.h           | 12 +++++++++++-
 21 files changed, 98 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/syscalls/syscall.tbl
index 3515bc4f16a4..826a8a36da81 100644
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@ -490,3 +490,7 @@
 558	common	process_mrelease		sys_process_mrelease
 559	common  futex_waitv                     sys_futex_waitv
 560	common	set_mempolicy_home_node		sys_ni_syscall
+561	common	setxattrat			sys_setxattrat
+562	common	getxattrat			sys_getxattrat
+563	common	listxattrat			sys_listxattrat
+564	common	removexattrat			sys_removexattrat
diff --git a/arch/arm/tools/syscall.tbl b/arch/arm/tools/syscall.tbl
index ac964612d8b0..f0e9d9d487f0 100644
--- a/arch/arm/tools/syscall.tbl
+++ b/arch/arm/tools/syscall.tbl
@@ -464,3 +464,7 @@
 448	common	process_mrelease		sys_process_mrelease
 449	common	futex_waitv			sys_futex_waitv
 450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
+451	common	setxattrat			sys_setxattrat
+452	common	getxattrat			sys_getxattrat
+453	common	listxattrat			sys_listxattrat
+454	common	removexattrat			sys_removexattrat
diff --git a/arch/arm64/include/asm/unistd.h b/arch/arm64/include/asm/unistd.h
index 037feba03a51..63a8a9c4abc1 100644
--- a/arch/arm64/include/asm/unistd.h
+++ b/arch/arm64/include/asm/unistd.h
@@ -39,7 +39,7 @@
 #define __ARM_NR_compat_set_tls		(__ARM_NR_COMPAT_BASE + 5)
 #define __ARM_NR_COMPAT_END		(__ARM_NR_COMPAT_BASE + 0x800)
 
-#define __NR_compat_syscalls		451
+#define __NR_compat_syscalls		455
 #endif
 
 #define __ARCH_WANT_SYS_CLONE
diff --git a/arch/arm64/include/asm/unistd32.h b/arch/arm64/include/asm/unistd32.h
index 604a2053d006..cd6ac63376d1 100644
--- a/arch/arm64/include/asm/unistd32.h
+++ b/arch/arm64/include/asm/unistd32.h
@@ -907,6 +907,14 @@ __SYSCALL(__NR_process_mrelease, sys_process_mrelease)
 __SYSCALL(__NR_futex_waitv, sys_futex_waitv)
 #define __NR_set_mempolicy_home_node 450
 __SYSCALL(__NR_set_mempolicy_home_node, sys_set_mempolicy_home_node)
+#define __NR_setxattrat 451
+__SYSCALL(__NR_setxattrat, sys_setxattrat)
+#define __NR_getxattrat 452
+__SYSCALL(__NR_getxattrat, sys_getxattrat)
+#define __NR_listxattrat 453
+__SYSCALL(__NR_listxattrat, sys_listxattrat)
+#define __NR_removexattrat 454
+__SYSCALL(__NR_removexattrat, sys_removexattrat)
 
 /*
  * Please add new compat syscalls above this comment and update
diff --git a/arch/ia64/kernel/syscalls/syscall.tbl b/arch/ia64/kernel/syscalls/syscall.tbl
index 78b1d03e86e1..6e942a935a27 100644
--- a/arch/ia64/kernel/syscalls/syscall.tbl
+++ b/arch/ia64/kernel/syscalls/syscall.tbl
@@ -371,3 +371,7 @@
 448	common	process_mrelease		sys_process_mrelease
 449	common  futex_waitv                     sys_futex_waitv
 450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
+451	common	setxattrat			sys_setxattrat
+452	common	getxattrat			sys_getxattrat
+453	common	listxattrat			sys_listxattrat
+454	common	removexattrat			sys_removexattrat
diff --git a/arch/m68k/kernel/syscalls/syscall.tbl b/arch/m68k/kernel/syscalls/syscall.tbl
index b1f3940bc298..0847efdee734 100644
--- a/arch/m68k/kernel/syscalls/syscall.tbl
+++ b/arch/m68k/kernel/syscalls/syscall.tbl
@@ -450,3 +450,7 @@
 448	common	process_mrelease		sys_process_mrelease
 449	common  futex_waitv                     sys_futex_waitv
 450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
+451	common	setxattrat			sys_setxattrat
+452	common	getxattrat			sys_getxattrat
+453	common	listxattrat			sys_listxattrat
+454	common	removexattrat			sys_removexattrat
diff --git a/arch/microblaze/kernel/syscalls/syscall.tbl b/arch/microblaze/kernel/syscalls/syscall.tbl
index 820145e47350..7f619bbc718d 100644
--- a/arch/microblaze/kernel/syscalls/syscall.tbl
+++ b/arch/microblaze/kernel/syscalls/syscall.tbl
@@ -456,3 +456,7 @@
 448	common	process_mrelease		sys_process_mrelease
 449	common  futex_waitv                     sys_futex_waitv
 450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
+451	common	setxattrat			sys_setxattrat
+452	common	getxattrat			sys_getxattrat
+453	common	listxattrat			sys_listxattrat
+454	common	removexattrat			sys_removexattrat
diff --git a/arch/mips/kernel/syscalls/syscall_n32.tbl b/arch/mips/kernel/syscalls/syscall_n32.tbl
index 253ff994ed2e..5e4206c0aede 100644
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
@@ -389,3 +389,7 @@
 448	n32	process_mrelease		sys_process_mrelease
 449	n32	futex_waitv			sys_futex_waitv
 450	n32	set_mempolicy_home_node		sys_set_mempolicy_home_node
+451	n32	setxattrat			sys_setxattrat
+452	n32	getxattrat			sys_getxattrat
+453	n32	listxattrat			sys_listxattrat
+454	n32	removexattrat			sys_removexattrat
diff --git a/arch/mips/kernel/syscalls/syscall_n64.tbl b/arch/mips/kernel/syscalls/syscall_n64.tbl
index 3f1886ad9d80..df0f053e76cd 100644
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
@@ -365,3 +365,7 @@
 448	n64	process_mrelease		sys_process_mrelease
 449	n64	futex_waitv			sys_futex_waitv
 450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
+451	n64	setxattrat			sys_setxattrat
+452	n64	getxattrat			sys_getxattrat
+453	n64	listxattrat			sys_listxattrat
+454	n64	removexattrat			sys_removexattrat
diff --git a/arch/mips/kernel/syscalls/syscall_o32.tbl b/arch/mips/kernel/syscalls/syscall_o32.tbl
index 8f243e35a7b2..09ec31ad475f 100644
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@ -438,3 +438,7 @@
 448	o32	process_mrelease		sys_process_mrelease
 449	o32	futex_waitv			sys_futex_waitv
 450	o32	set_mempolicy_home_node		sys_set_mempolicy_home_node
+451	o32	setxattrat			sys_setxattrat
+452	o32	getxattrat			sys_getxattrat
+453	o32	listxattrat			sys_listxattrat
+454	o32	removexattrat			sys_removexattrat
diff --git a/arch/parisc/kernel/syscalls/syscall.tbl b/arch/parisc/kernel/syscalls/syscall.tbl
index 8a99c998da9b..fe3f4f41aee6 100644
--- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@ -448,3 +448,7 @@
 448	common	process_mrelease		sys_process_mrelease
 449	common	futex_waitv			sys_futex_waitv
 450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
+451	common	setxattrat			sys_setxattrat
+452	common	getxattrat			sys_getxattrat
+453	common	listxattrat			sys_listxattrat
+454	common	removexattrat			sys_removexattrat
diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
index 2600b4237292..bee27f650397 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -530,3 +530,7 @@
 448	common	process_mrelease		sys_process_mrelease
 449	common  futex_waitv                     sys_futex_waitv
 450 	nospu	set_mempolicy_home_node		sys_set_mempolicy_home_node
+451	common	setxattrat			sys_setxattrat
+452	common	getxattrat			sys_getxattrat
+453	common	listxattrat			sys_listxattrat
+454	common	removexattrat			sys_removexattrat
diff --git a/arch/s390/kernel/syscalls/syscall.tbl b/arch/s390/kernel/syscalls/syscall.tbl
index 799147658dee..d1fbad4b7864 100644
--- a/arch/s390/kernel/syscalls/syscall.tbl
+++ b/arch/s390/kernel/syscalls/syscall.tbl
@@ -453,3 +453,7 @@
 448  common	process_mrelease	sys_process_mrelease		sys_process_mrelease
 449  common	futex_waitv		sys_futex_waitv			sys_futex_waitv
 450  common	set_mempolicy_home_node	sys_set_mempolicy_home_node	sys_set_mempolicy_home_node
+451  common	setxattrat		sys_setxattrat			sys_setxattrat
+452  common	getxattrat		sys_getxattrat			sys_getxattrat
+453  common	listxattrat		sys_listxattrat			sys_listxattrat
+454  common	removexattrat		sys_removexattrat		sys_removexattrat
diff --git a/arch/sh/kernel/syscalls/syscall.tbl b/arch/sh/kernel/syscalls/syscall.tbl
index 2de85c977f54..d4daa8afe45c 100644
--- a/arch/sh/kernel/syscalls/syscall.tbl
+++ b/arch/sh/kernel/syscalls/syscall.tbl
@@ -453,3 +453,7 @@
 448	common	process_mrelease		sys_process_mrelease
 449	common  futex_waitv                     sys_futex_waitv
 450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
+451	common	setxattrat			sys_setxattrat
+452	common	getxattrat			sys_getxattrat
+453	common	listxattrat			sys_listxattrat
+454	common	removexattrat			sys_removexattrat
diff --git a/arch/sparc/kernel/syscalls/syscall.tbl b/arch/sparc/kernel/syscalls/syscall.tbl
index 4398cc6fb68d..510d5175f80a 100644
--- a/arch/sparc/kernel/syscalls/syscall.tbl
+++ b/arch/sparc/kernel/syscalls/syscall.tbl
@@ -496,3 +496,7 @@
 448	common	process_mrelease		sys_process_mrelease
 449	common  futex_waitv                     sys_futex_waitv
 450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
+451	common	setxattrat			sys_setxattrat
+452	common	getxattrat			sys_getxattrat
+453	common	listxattrat			sys_listxattrat
+454	common	removexattrat			sys_removexattrat
diff --git a/arch/x86/entry/syscalls/syscall_32.tbl b/arch/x86/entry/syscalls/syscall_32.tbl
index 320480a8db4f..8488cc157fe0 100644
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@ -455,3 +455,7 @@
 448	i386	process_mrelease	sys_process_mrelease
 449	i386	futex_waitv		sys_futex_waitv
 450	i386	set_mempolicy_home_node		sys_set_mempolicy_home_node
+451	i386	setxattrat		sys_setxattrat
+452	i386	getxattrat		sys_getxattrat
+453	i386	listxattrat		sys_listxattrat
+454	i386	removexattrat		sys_removexattrat
diff --git a/arch/x86/entry/syscalls/syscall_64.tbl b/arch/x86/entry/syscalls/syscall_64.tbl
index c84d12608cd2..f45d723d5a30 100644
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@ -372,6 +372,10 @@
 448	common	process_mrelease	sys_process_mrelease
 449	common	futex_waitv		sys_futex_waitv
 450	common	set_mempolicy_home_node	sys_set_mempolicy_home_node
+451	common	setxattrat		sys_setxattrat
+452	common	getxattrat		sys_getxattrat
+453	common	listxattrat		sys_listxattrat
+454	common	removexattrat		sys_removexattrat
 
 #
 # Due to a historical design error, certain syscalls are numbered differently
diff --git a/arch/xtensa/kernel/syscalls/syscall.tbl b/arch/xtensa/kernel/syscalls/syscall.tbl
index 52c94ab5c205..dbafe441a83f 100644
--- a/arch/xtensa/kernel/syscalls/syscall.tbl
+++ b/arch/xtensa/kernel/syscalls/syscall.tbl
@@ -421,3 +421,7 @@
 448	common	process_mrelease		sys_process_mrelease
 449	common  futex_waitv                     sys_futex_waitv
 450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
+451	common	setxattrat			sys_setxattrat
+452	common	getxattrat			sys_getxattrat
+453	common	listxattrat			sys_listxattrat
+454	common	removexattrat			sys_removexattrat
diff --git a/include/asm-generic/audit_change_attr.h b/include/asm-generic/audit_change_attr.h
index 331670807cf0..cc840537885f 100644
--- a/include/asm-generic/audit_change_attr.h
+++ b/include/asm-generic/audit_change_attr.h
@@ -11,9 +11,15 @@ __NR_lchown,
 __NR_fchown,
 #endif
 __NR_setxattr,
+#ifdef __NR_setxattrat
+__NR_setxattrat,
+#endif
 __NR_lsetxattr,
 __NR_fsetxattr,
 __NR_removexattr,
+#ifdef __NR_removexattrat
+__NR_removexattrat,
+#endif
 __NR_lremovexattr,
 __NR_fremovexattr,
 #ifdef __NR_fchownat
diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index a34b0f9a9972..090b9b5229a0 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -348,23 +348,31 @@ asmlinkage long sys_io_uring_register(unsigned int fd, unsigned int op,
 /* fs/xattr.c */
 asmlinkage long sys_setxattr(const char __user *path, const char __user *name,
 			     const void __user *value, size_t size, int flags);
+asmlinkage long sys_setxattrat(int dfd, const char __user *path, const char __user *name,
+			     const void __user *value, size_t size, int flags);
 asmlinkage long sys_lsetxattr(const char __user *path, const char __user *name,
 			      const void __user *value, size_t size, int flags);
 asmlinkage long sys_fsetxattr(int fd, const char __user *name,
 			      const void __user *value, size_t size, int flags);
 asmlinkage long sys_getxattr(const char __user *path, const char __user *name,
 			     void __user *value, size_t size);
+asmlinkage long sys_getxattrat(int dfd, const char __user *path, const char __user *name,
+			     void __user *value, size_t size, int flags);
 asmlinkage long sys_lgetxattr(const char __user *path, const char __user *name,
 			      void __user *value, size_t size);
 asmlinkage long sys_fgetxattr(int fd, const char __user *name,
 			      void __user *value, size_t size);
 asmlinkage long sys_listxattr(const char __user *path, char __user *list,
 			      size_t size);
+asmlinkage long sys_listxattrat(int dfd, const char __user *path, char __user *list,
+			      size_t size, int flags);
 asmlinkage long sys_llistxattr(const char __user *path, char __user *list,
 			       size_t size);
 asmlinkage long sys_flistxattr(int fd, char __user *list, size_t size);
 asmlinkage long sys_removexattr(const char __user *path,
 				const char __user *name);
+asmlinkage long sys_removexattrat(int dfd, const char __user *path,
+				const char __user *name, int flags);
 asmlinkage long sys_lremovexattr(const char __user *path,
 				 const char __user *name);
 asmlinkage long sys_fremovexattr(int fd, const char __user *name);
diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/unistd.h
index 45fa180cc56a..4fcc71612b7a 100644
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@ -886,8 +886,18 @@ __SYSCALL(__NR_futex_waitv, sys_futex_waitv)
 #define __NR_set_mempolicy_home_node 450
 __SYSCALL(__NR_set_mempolicy_home_node, sys_set_mempolicy_home_node)
 
+/* fs/xattr.c */
+#define __NR_setxattrat 451
+__SYSCALL(__NR_setxattrat, sys_setxattrat)
+#define __NR_getxattrat 452
+__SYSCALL(__NR_getxattrat, sys_getxattrat)
+#define __NR_listxattrat 453
+__SYSCALL(__NR_listxattrat, sys_listxattrat)
+#define __NR_removexattrat 454
+__SYSCALL(__NR_removexattrat, sys_removexattrat)
+
 #undef __NR_syscalls
-#define __NR_syscalls 451
+#define __NR_syscalls 455
 
 /*
  * 32 bit systems traditionally used different
-- 
2.37.2

