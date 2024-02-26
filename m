Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D11867B90
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 17:18:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZiZAMuXY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tk5Q72Wfrz3vjD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 03:18:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZiZAMuXY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tk5LV3cRwz3vdf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 03:15:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C2BDDCE18A4;
	Mon, 26 Feb 2024 16:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC888C433B2;
	Mon, 26 Feb 2024 16:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708964110;
	bh=AO14Twor4Epqfova99BdXRAOjLIWQcQyPi3BUqYZmuA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZiZAMuXYiDyR2hDknZ4xgVy8TWczoqlYaz+54BPEoKIfJs4BSV182oJ1ZYu9Y5JbD
	 WmVlYt52eCJD6AGhn7U0y3EC75bLKVFGbI7wGmXiVDKgZPTwDaVuTJTSVkJKvUISzS
	 2XRA3a5n6YOmUElWz/EoUJbwtBXGMm0MnBobEcfj+6UoFFgUN+ewdn1/f3BBURGCAf
	 oK4FRWPsN9e+IXZu64v2vjYmcNQRQ8eM254ceqdZ/GIQhQ58ktIQY1PjwK8pNlnHUX
	 azFtrkzqYG46sjmhqFVs4snXAZo3hTMRuuCQkCC5flzHnC0ice4Qu8BYIkByoxWD5F
	 EP1u+qVkKv5IQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Kees Cook <keescook@chromium.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: [PATCH 4/4] vdso: avoid including asm/page.h
Date: Mon, 26 Feb 2024 17:14:14 +0100
Message-Id: <20240226161414.2316610-5-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226161414.2316610-1-arnd@kernel.org>
References: <20240226161414.2316610-1-arnd@kernel.org>
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, Jan Kiszka <jan.kiszka@siemens.com>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-alpha@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Kieran Bingham <kbingham@kernel.org>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.
 infradead.org, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Linux Kernel Functional Testing <lkft@linaro.org>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

The recent change to the vdso_data_store broke building compat VDSO
on at least arm64 because it includes headers outside of the include/vdso/
namespace:

In file included from arch/arm64/include/asm/lse.h:5,
                 from arch/arm64/include/asm/cmpxchg.h:14,
                 from arch/arm64/include/asm/atomic.h:16,
                 from include/linux/atomic.h:7,
                 from include/asm-generic/bitops/atomic.h:5,
                 from arch/arm64/include/asm/bitops.h:25,
                 from include/linux/bitops.h:68,
                 from arch/arm64/include/asm/memory.h:209,
                 from arch/arm64/include/asm/page.h:46,
                 from include/vdso/datapage.h:22,
                 from lib/vdso/gettimeofday.c:5,
                 from <command-line>:
arch/arm64/include/asm/atomic_ll_sc.h:298:9: error: unknown type name 'u128'
  298 |         u128 full;

Use an open-coded page size calculation based on the new CONFIG_PAGE_SHIFT
Kconfig symbol instead.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Fixes: a0d2fcd62ac2 ("vdso/ARM: Make union vdso_data_store available for all architectures")
Link: https://lore.kernel.org/lkml/CA+G9fYtrXXm_KO9fNPz3XaRxHV7UD_yQp-TEuPQrNRHU+_0W_Q@mail.gmail.com/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/vdso/datapage.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 7ba44379a095..2c39a67d7e23 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -19,8 +19,6 @@
 #include <vdso/time32.h>
 #include <vdso/time64.h>
 
-#include <asm/page.h>
-
 #ifdef CONFIG_ARCH_HAS_VDSO_DATA
 #include <asm/vdso/data.h>
 #else
@@ -128,7 +126,7 @@ extern struct vdso_data _timens_data[CS_BASES] __attribute__((visibility("hidden
  */
 union vdso_data_store {
 	struct vdso_data	data[CS_BASES];
-	u8			page[PAGE_SIZE];
+	u8			page[1ul << CONFIG_PAGE_SHIFT];
 };
 
 /*
-- 
2.39.2

