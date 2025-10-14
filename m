Return-Path: <linuxppc-dev+bounces-12858-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B5FBD98C2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 15:06:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmDx53qcPz3ckl;
	Wed, 15 Oct 2025 00:06:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760447161;
	cv=none; b=iJTqjqRSxZRpjzZwnItTn38TCZvAdvf1p2uGAJyyuEFCCWRkJGCmov1+8hAMz7lhGlzisASagU1Uj2yADZsNASEUdO4X64vhPGj2XlXY0J0D1h4eFEx9vT8nNvJueIcjIQOBYxuQ0yfROHVWivUEUg7plLB4N9Q4TfTWKTAnLiQGT822lxB4ypPAyhIo3tRspHm6794byQ8tYLi6+g/1KIbz4JmQaBcOsGUb90g5ZTLLx3EwPVepSUQBd0kI2IfCy5V/Z0SvTWInwD+WPvvnFmTJOquM35cFqf8t7bKM9hjcDhbgD/whK+qhZVvUP0lKQZvHfwiD6PO+vjOTUe+Gfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760447161; c=relaxed/relaxed;
	bh=2Jz/fSQ4w2Bn/x6vZR3CdwbYNIGEPKCgvqF2C3xKpfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FBQG0kBlhxoqskk/BeaqmuE2x5wwBVdbKFM9dZEPV/j87i01CNR8VjDv5tEkh1KV17W5IJFZ5h9R1TdurdhZkSORe8VVYuV/ZIcnujFMd0D6wRg/7RPpnw3NvhXGwDmkK77nu26bMclZHKcEPDFwcMYK3H9P9keGoJZLGdPtL+mfHP97EvGSbuC16ExUENFBVV/db8CAFtCdyU0tfgYMDKAs4YxkSyzhIN/x7UQG6BDchBf53uVOO1kstNc/8TO/tfl0NM5DEjloJDjokA6JHEvV7REa1vECvDN9Or9K8P6F444aCX4WhLblL/jm175p2GaivaMZM6vFnbdodmVYTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=VKcGupTm; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=BPouXKjv; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=VKcGupTm;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=BPouXKjv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cmDx40bQ9z3cjH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 00:06:00 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Jz/fSQ4w2Bn/x6vZR3CdwbYNIGEPKCgvqF2C3xKpfE=;
	b=VKcGupTmWHcLI7Z0F1GJxSKy3HSwtCoEQeb3y3K5GW3tZ3MbEDvktdbAmdZTn+uH1bg0U2
	8h4vhGrWqe38UOZfS2U0a3uu3vCKfGG8Q0PpdxY8IqXdPepPVyHpTeW2ODz2NhN4a47v5H
	w2HA0YBUpXONsWbx/w0WyVCks2VkXQYUKS0zVJY9j53UV6RtdWVlwjecCk6jlGdvpnPXss
	Fa7s1H3Kp/Fwosf+mJH1mNTuNYDtbUPvRrFCvp5xDIL6qiKsOdYirrovpEG8frLO3SSDcp
	aNpv/Ts+hnVhhoqgkUPks10emA9sNZ1crjnWsJb8l+ee7LqwXgW9PEGY31oONg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Jz/fSQ4w2Bn/x6vZR3CdwbYNIGEPKCgvqF2C3xKpfE=;
	b=BPouXKjvuvb+fmaL4NwW0ji9XzPT4qC/zULrhT4erndSmssrS+FBVwoL8r5nMAE7LPOaHo
	LwxtHqhKCr7Nk2DA==
Date: Tue, 14 Oct 2025 15:05:21 +0200
Subject: [PATCH v2 06/10] powerpc: Implement custom CC_CAN_LINK
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
Message-Id: <20251014-kbuild-userprogs-bits-v2-6-faeec46e887a@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=1653;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=XzQW4/Bu5moeHZMAHvqFvXBlWcd696K9WDlakbG7iS8=;
 b=iMDR0xOl/X2IGC7IEBYdKs5yuoYP5wjW2LSP8Krtgl2eaP0yhU5aS9qhWhGPYYr0+eb0mEveO
 gg/4WcsNrUBDV10e4SbmIWsMoaYJ+4oJo37KgaWlBCNQAPq/+4MetS8
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The generic CC_CAN_LINK detection does not handle different byte orders.
This may lead to userprogs which are not actually runnable on the target
kernel.

Use architecture-specific logic supporting byte orders instead.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/powerpc/Kconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e24f4d88885ae52e77fcb523040e8d31f167571f..c6887a2b97530b9c5b8c34dd0baa3ef8548cb43d 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -127,6 +127,7 @@ config PPC
 	select ARCH_DMA_DEFAULT_COHERENT	if !NOT_COHERENT_CACHE
 	select ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
+	select ARCH_HAS_CC_CAN_LINK
 	select ARCH_HAS_COPY_MC			if PPC64
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL
@@ -1341,6 +1342,20 @@ endif
 config PPC_LIB_RHEAP
 	bool
 
+config ARCH_CC_CAN_LINK
+	bool
+	default $(cc_can_link_user,-m64 -mlittle-endian) if 64BIT && CPU_LITTLE_ENDIAN
+	default $(cc_can_link_user,-m64 -mbig-endian) if 64BIT && CPU_BIG_ENDIAN
+	default $(cc_can_link_user,-m32 -mlittle-endian) if CPU_LITTLE_ENDIAN
+	default $(cc_can_link_user,-m32 -mbig-endian) if CPU_BIG_ENDIAN
+
+config ARCH_USERFLAGS
+	string
+	default "-m64 -mlittle-endian" if 64BIT && CPU_LITTLE_ENDIAN
+	default "-m64 -mbig-endian" if 64BIT && CPU_BIG_ENDIAN
+	default "-m32 -mlittle-endian" if CPU_LITTLE_ENDIAN
+	default "-m32 -mbig-endian" if CPU_BIG_ENDIAN
+
 source "arch/powerpc/kvm/Kconfig"
 
 source "kernel/livepatch/Kconfig"

-- 
2.51.0


