Return-Path: <linuxppc-dev+bounces-15700-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD22D1CFF9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 09:03:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drdrJ0Z88z307V;
	Wed, 14 Jan 2026 19:02:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768377743;
	cv=none; b=kY8LGWWSc112aETsYN00t1+6h5Yzz2f/FWQwMjtg+vuRgvXGKHasVTcIKfwZ72WDnJ2zDJNwpXl+qn4ob5WWnXX5Rcszwz2BpfJI46wQK0VwCFE+vvxSO3SuLYwBsTs+Ma7zNsKxSI0OR0q4QfmTQQ0gPPELB60hcbIh6nkUSQeGs0W09GUtNbcAdvKBApjsMiLVKL8SHOxqBoOgBjtyZwuO/TNSpAOvEvdJIjjsWhVplhN4XmrmP0cACi6Kb6nM0c8oDa7crpedoA/3o72YgC9mEHGgFdbOYI7qSAs5uUJnCcRAF8jfGccjNuDgwZtn/EApD6B3QLo3xzxL2D4ZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768377743; c=relaxed/relaxed;
	bh=GGpYGZ/EN2AZqYN0WEm5UmRFd5B8Bamrz8S6pn+n13E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=APjhcGax0T5lST6NXlWzEonX0ay0haz8xsxWBw+wNFa8auUODu6VdSlQHWLP3B5iDutqQBj3xXNKFo44xegDWnSc/iHq6xRUVJNzfkEbvctfuJ8KRHhMxL6MZBBkZ1zpJsP0KTU+UULoIhqKZX51XbKzxF3qJdYJ6dzzWTpzkm8IO+Jk2yIoH3auGBEq9wyXxxESM+OCCbeRbiFj758BfR22aa2ne99ci47XekTFmzxI5J87Zj63dBlMrPOlkGXkOXuxTXoZX+Rx/pG0ffoJHqSkG29K7ZLik6MF4q5d4lpjYUxNCD6bw95Z+X/eToCD1Fo/RuCLPU6qpbl9sM6OhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=4oIgJruX; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=yJSrzBvn; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=4oIgJruX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=yJSrzBvn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drdrH22J6z2yHB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 19:02:23 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GGpYGZ/EN2AZqYN0WEm5UmRFd5B8Bamrz8S6pn+n13E=;
	b=4oIgJruX9Pma58VWDp5HIJutiSb9llrWOkO8f5GeeoDW36Trzbl5sBwpMip4aW5JGAOXX6
	J2i2qbx5qxIFfruEl5dqDFk92gMuh/vEJX91+t/xTTdlFMWzLJDKrgS1DP8JTejizodoSi
	gWUzK/4lFD/BXUfnGC0aPcmMKSbCDPAVEQZDDBTallOrB/EEazs7Q3yvzu44EQFbyJK6Nv
	d0uD5fzNKNBko7wv4oEUdFniXwbSpT9743mg4ACQl1D06tz37IO3MUjNbAxnHDFQQxSh3K
	vbrMOrCYrlLLVYFNJWYSB4FuwRRtT4z/G4pLMrokuQssj9Z1MnvUjILuZrrDtw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GGpYGZ/EN2AZqYN0WEm5UmRFd5B8Bamrz8S6pn+n13E=;
	b=yJSrzBvnUM6qYm9C3OI9GWcdK6AbNFlRyVNEpoMooh8VO4N/VpKJHMLOY5V9rDz7XM2trs
	UncTbn21uHBkCrCg==
Date: Wed, 14 Jan 2026 09:01:43 +0100
Subject: [PATCH 11/15] vdso/helpers: Explicitly include vdso/processor.h
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
Message-Id: <20260114-vdso-header-cleanups-v1-11-803b80ee97b4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=694;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6/mNsjAlKjxQ4RplTzUqjF/4vooh/hplxS2bcWKZqDo=;
 b=WKou+6nB5sbu+Wcr76Etle4+RUtUJQds56pKfoSvq8eG7qKUXBH17sbcep/48mSG8Sid8fFHB
 t8hjfmA67GLDNiNtzGetCc81wu1tJRHvXqlouD33bhoD+v11ZohncEZ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The usage of cpu_relax() requires vdso/processor.h. Currently
this header is included transitively, but that transitive inclusion is
about to go away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/vdso/helpers.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/vdso/helpers.h b/include/vdso/helpers.h
index 1a5ee9d9052c..a1c995af4696 100644
--- a/include/vdso/helpers.h
+++ b/include/vdso/helpers.h
@@ -6,6 +6,7 @@
 
 #include <asm/barrier.h>
 #include <vdso/datapage.h>
+#include <vdso/processor.h>
 
 static __always_inline u32 vdso_read_begin(const struct vdso_clock *vc)
 {

-- 
2.52.0


