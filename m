Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CE1696034
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 11:05:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGGzl1003z3bfp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 21:05:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=lSkgp/oe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=alexghiti@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=lSkgp/oe;
	dkim-atps=neutral
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGD5V5LBSz3c2j
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 18:55:10 +1100 (AEDT)
Received: by mail-wm1-x32c.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so10845068wmb.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Feb 2023 23:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCp2aB0Fva1dhBulyjK6E6ghPwf9RYai26Pkakv2HJU=;
        b=lSkgp/oe78wiSlGjNTY3HqBSi/YUBPzLr91vjToo8n8VXLMMmWxbL1vB3wXAsaCt4y
         hh+WVxCjfWG1PtnDpcOV5pYIh9TVLWXRbZYrdl3IqzhBx1lWrxLZeBMf5PuUuJO5T33F
         VIfE284zT38w5XyjGbfJDN6QAzWZwGklCvYcoYU1xzqSIDFjTJZLDBB+3pXDfWU51cDU
         qtqkBzBgmsJJm/+Hy7xZIElhOnz4tQIVdzGBLLo5NdgkH9aF/SHQQsXAT90Zmb+/8siv
         rlBWKa+b2JZMttF0IXAXICFOmt/kt80eJ35cMpB+KjZ0MJlimlFw8toVGf88cNLSwJd3
         FjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCp2aB0Fva1dhBulyjK6E6ghPwf9RYai26Pkakv2HJU=;
        b=JRgEW4pDng6lrCp0a0SeheUhGgRM5iRL7VO1FdYCJMy1zdyNkRWo/XXlgudsBkHrb3
         mmPYaMIfeTDQHvZoHJAbmu7E25M5XCnHA/aC5dVfsWUKgWdQtu3tnBOpycALeDIdvA5h
         0smjfQZAysKimq4ZdTc2Oj4fKMQ4et8xHQ6GBHCcM/0GbZil22oM6br8T2E/MqZP5XW/
         65D/pXTWUBuu2WnYPU3h6s9NQScHqZdK7b8HdVaUmCuy4A27kOGey6xbDLVtFkdlUPdq
         fnAUC7GJZThfwBMdzuIFN7YimYhaEITRqqCREUEteX5e4Pn/jYuYEEFtwLvSpjTAtB6s
         XnYg==
X-Gm-Message-State: AO0yUKV0Y4r5bAtEY7c8kg+MFdZZJlXsEVtIT9RdDXSJ1RampuoJKKGJ
	aky0pLxAxC+0fObr3tc9ekX3pw==
X-Google-Smtp-Source: AK7set/WU71XFeLcjIpIzwCzgenyuB8Ba5kI4Pq7ubVZXIFPYkIqwtjgfBRr8tL2yeTQodjnLYD8uw==
X-Received: by 2002:a05:600c:1656:b0:3da:2500:e702 with SMTP id o22-20020a05600c165600b003da2500e702mr1196663wmn.32.1676361306745;
        Mon, 13 Feb 2023 23:55:06 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id bg30-20020a05600c3c9e00b003db012d49b7sm2076462wmb.2.2023.02.13.23.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 23:55:06 -0800 (PST)
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
Subject: [PATCH v3 05/24] m68k: Remove COMMAND_LINE_SIZE from uapi
Date: Tue, 14 Feb 2023 08:49:06 +0100
Message-Id: <20230214074925.228106-6-alexghiti@rivosinc.com>
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
 arch/m68k/include/asm/setup.h      | 3 +--
 arch/m68k/include/uapi/asm/setup.h | 2 --
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/m68k/include/asm/setup.h b/arch/m68k/include/asm/setup.h
index 2c99477aaf89..9a256cc3931d 100644
--- a/arch/m68k/include/asm/setup.h
+++ b/arch/m68k/include/asm/setup.h
@@ -23,9 +23,8 @@
 #define _M68K_SETUP_H
 
 #include <uapi/asm/bootinfo.h>
-#include <uapi/asm/setup.h>
-
 
+#define COMMAND_LINE_SIZE 256
 #define CL_SIZE COMMAND_LINE_SIZE
 
 #ifndef __ASSEMBLY__
diff --git a/arch/m68k/include/uapi/asm/setup.h b/arch/m68k/include/uapi/asm/setup.h
index 25fe26d5597c..005593acc7d8 100644
--- a/arch/m68k/include/uapi/asm/setup.h
+++ b/arch/m68k/include/uapi/asm/setup.h
@@ -12,6 +12,4 @@
 #ifndef _UAPI_M68K_SETUP_H
 #define _UAPI_M68K_SETUP_H
 
-#define COMMAND_LINE_SIZE 256
-
 #endif /* _UAPI_M68K_SETUP_H */
-- 
2.37.2

