Return-Path: <linuxppc-dev+bounces-12859-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 424F7BD98CB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 15:07:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmDx63HcLz3cmK;
	Wed, 15 Oct 2025 00:06:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760447162;
	cv=none; b=Vbicqe+LCnT0sTaGcVkq0CU5IBvArEvrK0dtNUtOIKHH0RPWnq1phfPywCekvRHgnFndfDi1GHv4bvoJT5UF9zoXAi1RQzWKJLU4PphnmpRhkc4yrSnbCvWhQrTg/jmSKOsuxukJ/NsV/Jy7up7SWv4mTuI3dWSoiEcIjWsrd5L1qrjf6h6+unCpl43RG3KZnHS1P6LbGrhcN3rGq0zla9rtBe95QnXKv5/95Iu/N9w+DcM1gg9EV66nCVC8zbvPArUL6gFrMJ7rZOV69f2hi3LG5FYfUtm3PHWXOqgKOwYmtZuTI9BWqZJ6sThH6Nzm+VGFcnuPwzpAAmZpAhmkdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760447162; c=relaxed/relaxed;
	bh=w4aJGDj19pCqGq6Mwbs9/EzztmQNf0JP3Sfp4xrHRjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fBUnQqOvesbxukMPwSiyTEtqciXuh1ovZ5/EoVR9MMSga7MaXU3Vky0ytOkHOSa33A0hAkjilI35yGbhj6kBAxySzN7WOblT/oIFuVlKPkGePLTEn9fU6J8PT2fRKEgmmYt5WPAhoAp/fEHsLWQhsxQh20cgn5ewFssoYC3gh+4cTz+2RfZ47aoJQMakThM0jJNDTm1eTNkAALuazDMHgo21yYEolwDIoWMU3H7I5I77oWMiOZ+dKe6dNNUaGqIVn/G913e3cMmUHn7RhlCMmsgkR6aHvgllnboPqbC8rTxJlm4J2YtUyNVf9zSjGEi9HFQ7qN5upKjHceTuyw2Y8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Vzd9X37J; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=TWmuMW95; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Vzd9X37J;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=TWmuMW95;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cmDx43s3kz3020
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 00:06:00 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w4aJGDj19pCqGq6Mwbs9/EzztmQNf0JP3Sfp4xrHRjQ=;
	b=Vzd9X37JzWVNDax9xF7gUtygBZfPFaA3gsNq68iYTXU84peT0r3N8MbT2m2gSyuEWOp475
	oR+vVdCmcqytsiwYiC6b/bE6d/82PiwkIPqrAvPK4pLAOLq5oJluEKE4Ej6AWHFXvKRgRP
	cuuYJ9oQ/giOO8oM7d9galUCfWv5BUQogZCB3n0avBH2xCchZEYbEG8Y23WkWP8S9lkqBe
	sXljt99G0QRpZzxPiMEntfQiVi7KL/+ysk3fM+CyHJAHBi3n6B8rskNRKW2kRWW7tRLHFH
	gM4uGdxfzGFPYPXkvPD4Uuaw7fSqO2n2Cw19SsmwKTwwJi8bz96YTPC8Ibjw8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w4aJGDj19pCqGq6Mwbs9/EzztmQNf0JP3Sfp4xrHRjQ=;
	b=TWmuMW95i4+CfhBBZ5SlvE9frAHrOqOTHwnuv5oXGcDx7/vcAsqhO3HRTC6MIdlDBbjCEx
	MiSFQwwp28wI7oCQ==
Date: Tue, 14 Oct 2025 15:05:22 +0200
Subject: [PATCH v2 07/10] MIPS: Implement custom CC_CAN_LINK
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
Message-Id: <20251014-kbuild-userprogs-bits-v2-7-faeec46e887a@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=1586;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=N71PVC1EfqSrxafXCVGnmlQykhL538a8yG+n3pVRhVs=;
 b=Hqg5+Zs1tdClXCVe2TNzjiX+1s7O2uQEAdV1tuC5lSBxirEybZXF94igzHK2M6GzMASu/egXy
 uBKrmuF+mr3AlBuXbEkMD7e4WRZW54J2F/40AVnKmentil9eMRb4dJa
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The generic CC_CAN_LINK detection does not handle different byte orders.
This may lead to userprogs which are not actually runnable on the target
kernel.

Use architecture-specific logic supporting byte orders instead.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/Kconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index e8683f58fd3e2a43bf9384e1c3c3e454a8e59861..b4f07558ad395eb9bb626a264a2e00fdfbdb7f72 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -4,6 +4,7 @@ config MIPS
 	default y
 	select ARCH_32BIT_OFF_T if !64BIT
 	select ARCH_BINFMT_ELF_STATE if MIPS_FP_SUPPORT
+	select ARCH_HAS_CC_CAN_LINK
 	select ARCH_HAS_CPU_CACHE_ALIASING
 	select ARCH_HAS_CPU_FINALIZE_INIT
 	select ARCH_HAS_CURRENT_STACK_POINTER
@@ -3126,6 +3127,20 @@ config CC_HAS_MNO_BRANCH_LIKELY
 config CC_HAS_BROKEN_INLINE_COMPAT_BRANCH
 	def_bool y if CC_IS_CLANG
 
+config ARCH_CC_CAN_LINK
+	bool
+	default $(cc_can_link_user,-m64 -EL) if 64BIT && CPU_LITTLE_ENDIAN
+	default $(cc_can_link_user,-m64 -EB) if 64BIT && CPU_BIG_ENDIAN
+	default $(cc_can_link_user,-m32 -EL) if CPU_LITTLE_ENDIAN
+	default $(cc_can_link_user,-m32 -EB) if CPU_BIG_ENDIAN
+
+config ARCH_USERFLAGS
+	string
+	default "-m64 -EL" if 64BIT && CPU_LITTLE_ENDIAN
+	default "-m64 -EB" if 64BIT && CPU_BIG_ENDIAN
+	default "-m32 -EL" if CPU_LITTLE_ENDIAN
+	default "-m32 -EB" if CPU_BIG_ENDIAN
+
 menu "Power management options"
 
 config ARCH_HIBERNATION_POSSIBLE

-- 
2.51.0


