Return-Path: <linuxppc-dev+bounces-12856-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A886EBD98A7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 15:06:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmDx32Klgz3cg1;
	Wed, 15 Oct 2025 00:05:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760447159;
	cv=none; b=MtPQUi/+CJm5+86tCi2lTFkQJhN5RrfIWg9ZjilUMFwo6HXDTm6YCGbcfjaubyb17cVuFUqaZmRL4kBGJdR9f5u5APWdW6629xDToMTrJMcEujG58AkaBLnPA2RDloB1jTcNfb6vqzDD2ImyabWgc3rW/qpI0LOz2+NMQShIPmKeINe4aj0CgvnIUVwbXU2mW/WW4gxhqx/x/OoM8LATaq/mfi/sm5VtJnaLiqiWV2qvOo5qOX1vy1nV8BsSyNnMm7cmM91XEj0Ppl/JSFEf8f864b3CodfGfxh01A/0vsgKQgzSRjzXsefWoGaeNgVKtlGqYj+AHYuOa/VtnWwWKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760447159; c=relaxed/relaxed;
	bh=n5aEmOCiKWRV28QcYO8TDotRByeakPNFwzaXoHbD41M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZZCR1pPFCzZCLKXxOtwx1BO/+xYjDAqKatd2z1HI/dafhPXty2yeMc0KNlNV4QX5IBoSKpnjJEhv/QgaXNEqosaryMvyFfTDoo+tBQQCRwOhTrh7QEJYKtwKxjxrc+Fc16SkEhOKLsNw49BUNkux+3SNkej9L+crsfS5OyUCfm3XMEKnkEzmNknc6pBQJfXt+LhZvzEJ1/THvBV6+TBEx2ueLlwxkXtuFWv9GQRDuIVjqDqrRS5cvdTdwGqR9BBZi7O+9OmgejQ3llOoiXg7frMt0yWD5O0L2eaNkEa8Ku7SLyWH5NczrPcGfhXvHLENrPHQpCMdXsG/HXcqFMEmNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Zv1lZI9b; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wlzUTHbK; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Zv1lZI9b;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wlzUTHbK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cmDwz52mpz3020
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 00:05:55 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n5aEmOCiKWRV28QcYO8TDotRByeakPNFwzaXoHbD41M=;
	b=Zv1lZI9bfmZPDvEM4JRusAAq2cBllhjidSUvA9XtE2Ueq5UmZZWoyNyW3QP9Qq2LayLz1t
	EOWUw+ekjm1ZI3ivepNtxpPBhZK8KcSHVObBXN8SFRalX+yoW4vn8kBLzLxHl43jlA5/JR
	1cLBjhlv73q773FIXCEdaE0azr9ONjKk13E8obTJ4zcG5LQqWtpuNTp0Zuas7VZs90NPPm
	8+v68iVr3yOcA4456vKPsS22IsjrtUPvwZ0j24GKJzyN2MrGZim+zAMuiVw7AO6CNPzuqp
	pgTkEA//CML0qSQlX0o6HpofqTPJvZXMG2eV2+DEd1WV7uGiKp7N6MaJZTr1mQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n5aEmOCiKWRV28QcYO8TDotRByeakPNFwzaXoHbD41M=;
	b=wlzUTHbKokvyVpwrlS1pfBwevlVj/x9vf+ARON0OWsvmjFoXR1E5gzzyiFmLYG7aT3wHf2
	LnIQbss7Iiy91mBw==
Date: Tue, 14 Oct 2025 15:05:18 +0200
Subject: [PATCH v2 03/10] kbuild: allow architectures to override
 CC_CAN_LINK
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251014-kbuild-userprogs-bits-v2-3-faeec46e887a@linutronix.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Nicolas Schier <nsc@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=2247;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6NbAT/c8dhOFpg7qjR2b49v4+fnBDinUJpp942RcUVs=;
 b=+axK+KClVFQLPqY2xQIV6Z1Guh/4xXDQBrACtf2w9ctXvFPO+pdPmvsWesaDbNln2fhCMBlvB
 WgGXUgtUQ07ACaBUqVkclPsSnd9imwvXGgtXlpBCgUj8Xxa/luTj8dE
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The generic test for CC_CAN_LINK assumes that all architectures use -m32
and -m64 to switch between 32-bit and 64-bit compilation. This is overly
simplistic. Architectures may use other flags (-mabi, -m31, etc.) or may
also require byte order handling (-mlittle-endian, -EL). Expressing all
of the different possibilities will be very complicated and brittle.
Instead allow architectures to supply their own logic which will be
easy to understand and evolve.

Both the boolean ARCH_HAS_CC_CAN_LINK and the string ARCH_USERFLAGS need
to be implemented as kconfig does not allow the reuse of string options.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 Makefile     | 13 +++++++++++--
 init/Kconfig |  4 ++++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 17cfa11ca7163aa3297101ceb3c9e85f4878f12d..26e5bca534e27034c355939bca4c90db435ecdbd 100644
--- a/Makefile
+++ b/Makefile
@@ -1134,8 +1134,17 @@ ifneq ($(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS),)
 LDFLAGS_vmlinux	+= --emit-relocs --discard-none
 endif
 
-# Align the bit size of userspace programs with the kernel
-USERFLAGS_FROM_KERNEL := -m32 -m64 --target=%
+# Align the architecture of userspace programs with the kernel
+USERFLAGS_FROM_KERNEL := --target=%
+
+ifdef CONFIG_ARCH_USERPROGS_CFLAGS
+KBUILD_USERCFLAGS += $(CONFIG_ARCH_USERFLAGS)
+KBUILD_USERLDFLAGS += $(CONFIG_ARCH_USERFLAGS)
+else
+# If not overridden also inherit the bit size
+USERFLAGS_FROM_KERNEL += -m32 -m64
+endif
+
 KBUILD_USERCFLAGS  += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
 KBUILD_USERLDFLAGS += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
 
diff --git a/init/Kconfig b/init/Kconfig
index 7b722e714d5c5a0580467914b226dc0700ec0797..4a2ae3cfbf26525a60936d9b29a74ef4319ba3a5 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -82,8 +82,12 @@ config RUSTC_LLVM_VERSION
 	int
 	default $(rustc-llvm-version)
 
+config ARCH_HAS_CC_CAN_LINK
+	bool
+
 config CC_CAN_LINK
 	bool
+	default ARCH_CC_CAN_LINK if ARCH_HAS_CC_CAN_LINK
 	default $(cc_can_link_user,$(m64-flag)) if 64BIT
 	default $(cc_can_link_user,$(m32-flag))
 

-- 
2.51.0


