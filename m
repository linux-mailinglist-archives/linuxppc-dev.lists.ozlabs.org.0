Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D9F6ABCE9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 11:33:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVZfj3nGkz3fW6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 21:33:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=xCSHcSRa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=alexghiti@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=xCSHcSRa;
	dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVZdq4PTKz3cD8
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 21:32:31 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id v16so8312588wrn.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 02:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678098748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2S29OAojjkQ3ph5THndb/5w5HMdqHkAEAaj92KxD7KY=;
        b=xCSHcSRaD2g1+2DbiYWhwBVgmLp88kCObvoul8o22gAShWEWRsDyBUbrABXr5fv65x
         IGnHDZLJd6mZoZ4c8bkw6btaQ552OPPkQaMMyBEUs4Bc9wvEuBuP3LVKslg1nEKUwpBX
         lIVGb+vuDvhF0cDTuCVOpyZV5LaEa7T8m8jfkVFpaCwFvyN4Z00Y7x/hHmTHM+tY2ap5
         RgDlCHiOuFZ5W2OonNpFKfcm5MsZoArntnS/kOhW3H0fDHSI6TVfGt6dIbQVxoFWUZLC
         VaMyxBHz7iI91g7KCZulrkhxAWoD0odFmgisNlLZZFPdJeVIIAgA47RuWu1Yjzh0KCRf
         0raw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678098748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2S29OAojjkQ3ph5THndb/5w5HMdqHkAEAaj92KxD7KY=;
        b=HRaj6oRNKGkYQD19ahlSuK8nN7Ml1W5DQHGtecHkpvjW1IyQQrhP+U5cSzTCZpjWHA
         hSyA9gZ20ajmIXq1EQGiDDl4t3r3pvPUmzFM51MSPLWdfMVkYKn4TLN6FZP1KfxuuZxV
         xRv38NpgmUlGg3jtFMCALwe6VJnZYalAaRk/ju6m7e3u3HzQPWA4yywk5qrhsx+Rg+Os
         dvabo3Wsj9McSRB0DB6iNMi9ghCJYMTcl58Ttwv8UbFVmlmTz9ZDlJHiPHzA/1H+EWPQ
         qQbtH+sVM5kSsApZUfzdm19gfeGaBWuNLKBD3ppvqh5dDca85OMSMKPxg95xN1bJcY3v
         h6VA==
X-Gm-Message-State: AO0yUKUXVksT4osPdnuqP/kze+CSl4wWt8KOZjgpYfnNAQ9UWjJIRTLw
	ntoPbqd3wD66bKgGWCiOCy8FJQ==
X-Google-Smtp-Source: AK7set9Vv2uSkjazOq+f3rx/CCBKfCShLhiL1+01KwPuVcwWj2ucc2G1h2TzyZEz/iSKDj7DuGgpzw==
X-Received: by 2002:adf:e70a:0:b0:2c9:e3d:88ca with SMTP id c10-20020adfe70a000000b002c90e3d88camr6289357wrm.67.1678098748535;
        Mon, 06 Mar 2023 02:32:28 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id u18-20020a5d6ad2000000b002c5539171d1sm9217902wrw.41.2023.03.06.02.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:32:28 -0800 (PST)
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
Subject: [PATCH v5 26/26] riscv: Remove empty <uapi/asm/setup.h>
Date: Mon,  6 Mar 2023 11:05:08 +0100
Message-Id: <20230306100508.1171812-27-alexghiti@rivosinc.com>
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/uapi/asm/setup.h | 6 ------
 1 file changed, 6 deletions(-)
 delete mode 100644 arch/riscv/include/uapi/asm/setup.h

diff --git a/arch/riscv/include/uapi/asm/setup.h b/arch/riscv/include/uapi/asm/setup.h
deleted file mode 100644
index 17fcecd4a2f8..000000000000
--- a/arch/riscv/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,6 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
-
-#ifndef _UAPI_ASM_RISCV_SETUP_H
-#define _UAPI_ASM_RISCV_SETUP_H
-
-#endif /* _UAPI_ASM_RISCV_SETUP_H */
-- 
2.37.2

