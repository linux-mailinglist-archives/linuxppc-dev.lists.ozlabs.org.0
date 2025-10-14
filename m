Return-Path: <linuxppc-dev+bounces-12855-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE58BD98A2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 15:06:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmDx31hZqz3cfg;
	Wed, 15 Oct 2025 00:05:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760447159;
	cv=none; b=SqlA6Z2T04wARosm9Ky2rPvT8E4UhygC6ujdgm9iQVKSQHHbRcRq6S9UwXq6pPIqgthSATSf47wKAxW2KmPV5ZaOLZMRm6eaAhhFjve+Ta0pFK2FmDe2/ZE1JmmiHKwe8zAQHiB4b4oLVOQUfxya+FrzxVX/8zR1b++0u2CiMf3HtwQ02JR6DvUtJSZBtjjEPV4HYWY+I+EGSsGup3pYt2oIn15zxZtsEpPl3zIzJRblmumfQGPcOWB/oJc7GaXwTzQ4MEKvrIa5b2VXoidi6BYp+++mWid9kpqFfXS4shEWf37ElRRmR3dNij51qJzs+gA3nOb/yzgwcRULsFLTEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760447159; c=relaxed/relaxed;
	bh=PtEMzaRgOB8kquDpZ2oJC8rCzxEI2hYSKcXXX4oBQqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HZiOcyLamLSJrzHVMxKl1AFx7iZ92rGiB/V6nJM7tTRyai9Rfy9rKkOkSa0PWrk4YLaeLooqdQVhTnQ1gQ3C06S32DvMDZJwNe16R6KMH76MbspTwrmxkx4smtFUoc9OghopvE7GM3+OiPQiL/sD2Jx5wvaXI0ckpiH68NlTOxKOKZn7++lSA6gKiydG37vOOlRIvIlJjGccLQDDwn6xo85DUNu0xYJpYPr2FqaWCQHjxPJk4JuQMqU783r52teEfK4F0gRcF9FihQUsRnTQ4fqdpsT0nHOjOpvTAiABFjAPIkZcKLzI6W2iMhi8vDHaYxy6ocLmnt/kJMkDHgwq6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=kDPkhNZF; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=zLHxkSgW; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=kDPkhNZF;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=zLHxkSgW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cmDwz54Fwz30V1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 00:05:55 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PtEMzaRgOB8kquDpZ2oJC8rCzxEI2hYSKcXXX4oBQqw=;
	b=kDPkhNZFnKiPIKn2BfUt5pn59Sg5Gn1PrDHdDcLkuN3BevIr2tumGBieAbhxD2f4hflub8
	e8SRmhJs4vtIcfp9qgaSlijd6Ih1iAbrv0BJWxfaa2XZb15CS5jFUHKZ+yrK8Id2JM78x1
	95G9tQO2AKOpfPjX/yMBkhWiLEe8Ehyul3lz9yUe15jV/Z/q+EI6Xgu6I5jGxMhWOi5JO+
	GYy3ovjSpa7MZ++Prynre1P1J+cvYl12KJGCvDwZx2HN8axJYv6DZPE3VJqP8X0RusNIWY
	fpQUWrS8hmvkUupggb1ITeEYpa/KHeYd5EqoYqt7zeSKYXCey/nDz2gPSKF7/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PtEMzaRgOB8kquDpZ2oJC8rCzxEI2hYSKcXXX4oBQqw=;
	b=zLHxkSgWSjdbKEzJflQ9dcKDaS7KCBMSUJheUled3tqTF+w6qHzcAxxo3/aGtH3oj+wwIC
	hNdsXlaXlufgbEBw==
Date: Tue, 14 Oct 2025 15:05:19 +0200
Subject: [PATCH v2 04/10] riscv: Implement custom CC_CAN_LINK
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
Message-Id: <20251014-kbuild-userprogs-bits-v2-4-faeec46e887a@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=1258;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=3lgCYGIMr6BqeDPz9pKFvSa3Tpv/XYmPh2f36Wz3/Vw=;
 b=ljrpmNZOQUkLMN+En8m+6y2KVlfRnUR20ZZD26p+acX5QP7AVUU4yWipMMpv+SjAnIDnFb0Qx
 WUXs2N/Eo+MCXvns+nHls5Gg7cVspWXWzbvjHF5Wo72H4v/yRtTle/C
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The generic CC_CAN_LINK detection relies on -m32/-m64 compiler flags.
These are not supported by riscv compilers.

Use architecture-specific logic using -mabi instead.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/riscv/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0c6038dc5dfd529e1fe623f6bc2729a388b33fde..1faf6e6ec87d1417b4e3213ad54053439c87e331 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -25,6 +25,7 @@ config RISCV
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_BINFMT_FLAT
+	select ARCH_HAS_CC_CAN_LINK
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
 	select ARCH_HAS_DEBUG_VM_PGTABLE
@@ -1335,6 +1336,16 @@ config PORTABLE
 config ARCH_PROC_KCORE_TEXT
 	def_bool y
 
+config ARCH_CC_CAN_LINK
+	bool
+	default $(cc_can_link_user,-mabi=lp64d) if 64BIT
+	default $(cc_can_link_user,-mabi=ilp32d)
+
+config ARCH_USERFLAGS
+	string
+	default "-mabi=lp64d" if 64BIT
+	default "-mabi=ilp32d"
+
 menu "Power management options"
 
 source "kernel/power/Kconfig"

-- 
2.51.0


