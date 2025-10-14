Return-Path: <linuxppc-dev+bounces-12860-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 795A4BD98D1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 15:07:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmDx65zPkz3cmr;
	Wed, 15 Oct 2025 00:06:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760447162;
	cv=none; b=cJMDYRkEnHiXyppJE7Dr4SR//EWMXPplFRuuvhv6oKfG93bIT3f19x2lltRsPtdTIkctrYQaBl4poJQ4mExg4xRoM9NvU39z4Zk85zZxkb52KV18oLmF97J397a6fdJzIZNklYBKOFj+oCVybVZ1ttgmHgddWILCkthboSoFhMvHnQrkpC0P/O9K+2g9Jb8e3dWmt5qlw1GWLLc7Nzzxr7B1hiMUsOV2HV0lawvD5/bnNPW/wqEal/jqLOKy28RW9jQTFcG2fgjPH+nE4Wy6sI3q17xvsG2KLNvw1CD9jM1QpaR2BDaO5MVPJcBQy33oz4v6zuxbEf+HDfSrjKJLWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760447162; c=relaxed/relaxed;
	bh=/ZtOYvzpIdd5rLNd2E6ncSSFN/khjvYbV63TeavHrvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MJU2n8v2Z/jBpWWzlQ232jsOMjEGgJotitMxAlntjSPqRbM3sE+zH8g1xw8uDEyTbnOyQFZaGjYkHpdbepBZunbrt9GfAiukpGs/spe9H9+JXGCp1bz11k48X+WvGIZ4NwZryx2ExtgXvGBEnaQK8zvcvd/D8PxVn4zEfL1YUMZIHvu3oor3aMc63H7u9KFrCH01ql/G8c//JJmSp6ASTbxPIjDN2i3A+Bv0T4vnJ5shb8GzZ70Im6WdlT1c1o9nIY3ohRx6Viz3lGILH15hzuu9MSEnQ6slZoXaxI4P7iK9zjabMwG+SQM9Oi7E7aiTnnEnsAigmViQeVV7gymO+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=toZTeHZe; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FpLM2FIx; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=toZTeHZe;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FpLM2FIx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cmDx46JkTz3cjb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 00:06:00 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZtOYvzpIdd5rLNd2E6ncSSFN/khjvYbV63TeavHrvw=;
	b=toZTeHZe1uNjGasrKJzCw6aRjpZ0C4FjxOgf9/0KgK/6vuqPpjSuKY8pi+AlgZxcL6swRy
	gOENcZJv/3PR89wwogqpdZv+lmpci6bHbGRzvHqAR3++S9m2+RTKjniq3b8tO0QKubLcxl
	tFHW4ODlDTHBdB3n123fRMtazhGmb7f3VwyOsp7lvdlFQzRL2hNN0BTMWOHNAzjKKuI3lV
	GJWFeiRFUcvqCMGx+IZj2svBi4ifDeN2pd0O9n+JMu2/mJPzso3CCIvMc7dFNGYjR9NNzx
	hx0ycsNzzhLVpxb5oUuzJZ/hw7Nk5Ubi9y3fDQ2UxfceKUkDgWPT6+kqsIhLfg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZtOYvzpIdd5rLNd2E6ncSSFN/khjvYbV63TeavHrvw=;
	b=FpLM2FIx9lrBLiAi7rZaKk9FxVWGfANDCuRfpLNEQaxOZ4jrMhHLjZzj7y1UkktQxNo626
	7RN/FMNDE+jb/eCA==
Date: Tue, 14 Oct 2025 15:05:23 +0200
Subject: [PATCH v2 08/10] x86/Kconfig: Implement custom CC_CAN_LINK
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
Message-Id: <20251014-kbuild-userprogs-bits-v2-8-faeec46e887a@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=1290;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=b6y5QGf5n/DoFSSYq7Ft561zy3R7m1YixtDRRPC4Syk=;
 b=+vm1vR0r4FMZsBIpxV3QN+K0oPDB9pgEvBhAhkeTZXmgDTN7eahpL0dYrQ0dL6ILzr02HF2Zf
 XPjaMmqydtlDwVhKaxupXaW4qFJpS0EQZgzEo/MYf61/Wk9vqQb5nXq
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The generic CC_CAN_LINK detection does not work for all architectures.
To make it clearer how the detection works on x86 create an
architecture-specific variant.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index fa3b616af03a2d50eaf5f922bc8cd4e08a284045..a98675cd01c0c27e2a5716fb6d051416ddcc956f 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -73,6 +73,7 @@ config X86
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if (PGTABLE_LEVELS > 2) && (X86_64 || X86_PAE)
 	select ARCH_ENABLE_THP_MIGRATION if X86_64 && TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_ACPI_TABLE_UPGRADE	if ACPI
+	select ARCH_HAS_CC_CAN_LINK
 	select ARCH_HAS_CPU_ATTACK_VECTORS	if CPU_MITIGATIONS
 	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
@@ -3171,6 +3172,16 @@ config HAVE_ATOMIC_IOMAP
 	def_bool y
 	depends on X86_32
 
+config ARCH_CC_CAN_LINK
+	bool
+	default $(cc_can_link_user,-m64) if 64BIT
+	default $(cc_can_link_user,-m32)
+
+config ARCH_USERFLAGS
+	string
+	default "-m64" if 64BIT
+	default "-m32"
+
 source "arch/x86/kvm/Kconfig"
 
 source "arch/x86/Kconfig.cpufeatures"

-- 
2.51.0


