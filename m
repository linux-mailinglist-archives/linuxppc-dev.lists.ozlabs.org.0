Return-Path: <linuxppc-dev+bounces-15696-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CB8D1CFEB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 09:03:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drdrD5pTWz2yvF;
	Wed, 14 Jan 2026 19:02:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768377740;
	cv=none; b=garpdmgzogVenaxyqfx7wzuTmsgbu5p43IbUbVWjsAzAWLEZW7u0PIMMsd3CSaXQXdgD5P5eXQf2jeS4D+JxDYLy9Gs4J3ueSyTE6MA0HOk0BZ9XZi0kCi6eo7Ev6DtfuWdEqJP9tApZbbZ9OQtTlnrnvZJvCw1yM2BC6vw1xo/xMujKhD44CA0hFiqJTmXKsEsX8PMEtUoqFT2Zm9pBXjt2nb7EPbS6No6r+PeqYVnsKT/8AavWK8671A4Jg3lfAkIh+fRcsIu4s37lpWMsM1xMO6ZCoooFaqeT1d8NvkIzTvON8PmV2TKFTYRgvhjvsAwDBZgaC0ZvhZsUjITduA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768377740; c=relaxed/relaxed;
	bh=SoyAobvtAA9UQIKcVjt4/vpR3BEv5id0iFKUdJTluTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ad18Z0hqyI3w0e5IOQJZVm7Rt+2rS7Vdf84Un4tHsGv/YdluNn0QVuTOZY6dR0Ur7EVoubrOaCkU523RhjGdgTyjxCkA6UMOylxZHA8KmQV74LnkNgYkFsms7ZyO28KsTlbcGV6+znnXYiKk4tfmBqs1bHnl9HGAGu6kLCNHSZtZadIm3NKcCUI9EhjYtvPJa3oyvIjyw5jt7dg8E+F+NJ7DlVtyRjbhpHZ2+Rf/Zsp5OqhcatK9nZHaVeIvrwdwjwmSzPhTxbwjuneU5nToj+KErCf31zomCPeM8X3TTLCCnFI4Wg3I3zTxcNsISfz+NLQC1I6CiepLQa2dsLi7Cw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=kFqoqabH; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=uZ3P/Kny; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=kFqoqabH;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=uZ3P/Kny;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drdrD11DHz2yYY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 19:02:20 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SoyAobvtAA9UQIKcVjt4/vpR3BEv5id0iFKUdJTluTk=;
	b=kFqoqabHpDV3T9wPA9bmEv8kDqQYgyBf/ZZfxqDBpt+1iIEV/ozQJr3tRvH2CdmuUPEtmn
	OVZtQ50rFQDY8XWV0AjmFsYSPR6iwKjL19NrTeS1RvFEyJh6cQiGgiM7bZTE5Frq9LMdny
	Jq7q7MzaEsO/BHoFqPtjbFPhh89yzhV5ybYXZyHy8xlNG9OAUT3biLb1AppNWp+bNg/N3V
	Acvvvd3BW2iv7bb+kbuY7/lT1aQwwpCGoI5OgbxXScoV5Rp4sC8FQkvUxeSx1Nc9NnX74A
	k4j7Ae+6q126t8Yqf1PKJ3fWPB2BBYH8w9b49fiT3ilHr1YzbD2cqHIWJFVbgg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SoyAobvtAA9UQIKcVjt4/vpR3BEv5id0iFKUdJTluTk=;
	b=uZ3P/KnyGuUf0Nz8DcxWhm7MR3FURfwdGnxivNhb+GuDV1TNbVTSIOATNT/FHtFN44972t
	YczMt0bOwRA1ATAQ==
Date: Wed, 14 Jan 2026 09:01:40 +0100
Subject: [PATCH 08/15] MIPS: vdso: Explicitly include asm/vdso/vdso.h
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
Message-Id: <20260114-vdso-header-cleanups-v1-8-803b80ee97b4@linutronix.de>
References: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
In-Reply-To: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=696;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=89K8mUiVvMvCZCKWls9fZ44jvFGy0m8pQ8qbm4twTa8=;
 b=FSiu8UiGSl/Aaf2eVHxCWSFtrEdYyGw5+eoDFFvTdy8XTx/6gLGZt62GT7CmMMb0UEm6+GLmY
 7hN9XerTfMXCXKMzaGcSXECibAYr028LLgbUS0JbuJ5Xbboxu6aqhEx
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The usage of __VDSO_PAGES requires asm/vdso/vdso.h. Currently this header
is included transitively, but that transitive inclusion is about to go
away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/kernel/vdso.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
index de096777172f..2fa4df3e46e4 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -21,6 +21,7 @@
 #include <asm/mips-cps.h>
 #include <asm/page.h>
 #include <asm/vdso.h>
+#include <asm/vdso/vdso.h>
 #include <vdso/helpers.h>
 #include <vdso/vsyscall.h>
 

-- 
2.52.0


