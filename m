Return-Path: <linuxppc-dev+bounces-12862-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D98E0BD98E3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 15:07:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmDx73X24z3020;
	Wed, 15 Oct 2025 00:06:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760447163;
	cv=none; b=hKhBoW468rABT7G1QFvNPfuRFHfc/wkkzoxMBsAjwcT1Qlfz8nCB37kXd52C1Xn2tD6597GhPX2AXXsF8lAt73vdnQoVJQeWi0IEeI1MZsxS0oyUExJjBjcVNY0SlwOKXFRfmQQJkHCEvSPwRB7olffh4/nXvJ7HtrfNvmANJgFDTf4NI9TN7diebTtAiUs6fxym7PEeGxjeSN6F/F7EUPxm+OsQHQCqWQ8dKJk/XzTVVo55FAOPtbiU1gBVaR882uk82ATc9Pgj4nB8q0WwxUTmO7qFSqjg7S9t/LvTH/5VjOci7P7iDue/kAKzNboH87pXi/ouL6urVO9TJT00fA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760447163; c=relaxed/relaxed;
	bh=P3cczBZg1hsuy3VQFI6BicmC+DtK7KqMRuLTbCsjnP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UduDaoXyQwk8fbDahzKgHEg8Vesh57jSV/68+F4Xdpp/a2gAXXYTVqhp/PAmv+cMT8ms1g5xOc041xVY7n7SXm3benrgwfGmBecooQujNwk9PbyMZBHOy2So64pitVz7cUg+TId/Ki6yY2wiF3u572Hp9maegFMNyYMePxM2bSu45a2wS26HF6EwGJDN55sMB7VcItFeQEjUcrxnIykaSOwP+YiRUPIFBuzUfg1XG0Fww1/1Tz2K+2B0xJM7tmqQ+lr7UKuT2hdBjgIj8joVipW4aPD20J/m326HmKBhPq+Mco9JlHX+EC98QenuoHmc41PknA9U04yD0zB9LqXiwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zwMEM9rR; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=W4M1n9ep; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zwMEM9rR;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=W4M1n9ep;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cmDx55jnwz3clL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 00:06:01 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P3cczBZg1hsuy3VQFI6BicmC+DtK7KqMRuLTbCsjnP4=;
	b=zwMEM9rRsQ90GXTSdrweLrU/7N3K+yghbYemcwg2uPHlqNF4j0cCpvgXjHX+0YTJHZKeOJ
	AV7HOIPkmXmNzu6g0EfsZnhSDogez7ExUFpFIQjBIUmkwgedkM3DGW224OvDuv52AIiZH9
	uKRl9o2EZd7M+RCB5zTZ1f+xyZnAR5GiJLRFHzfR4cP0emlAiibCVqzSAHClyND3Pp/2iM
	yKs65bATUduM7f//XMj8XYH2ahgPRCn5m0VbgHU6FK+5oevGvM7717IdBgoO7SM8ZQYHJC
	HSnF8eolELUmKlBeYbD2mXYIfape+3JtKdL1CAPjIYMe4jiWJN0qV2kseLuxsg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P3cczBZg1hsuy3VQFI6BicmC+DtK7KqMRuLTbCsjnP4=;
	b=W4M1n9ep7+/iLbuSo+Li8obSVodl7csZ5v1BhDxO5sXkVBj5QToSOlVQNP3+geRfZJcBNk
	80JSyHmdyZFC2oAA==
Date: Tue, 14 Oct 2025 15:05:25 +0200
Subject: [PATCH v2 10/10] kbuild: simplify CC_CAN_LINK
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
Message-Id: <20251014-kbuild-userprogs-bits-v2-10-faeec46e887a@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=1868;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=3tMmqGYPXW1+sizcvYuquIc8pIXvr2WxMOGAl2JNK7w=;
 b=NFH6jl0rxMrCvmdRLauKbjBZxs9geVFFRlVKeBozgXilXJgY1Mju4UC/ys+/hGi5CHjYmw4ka
 Wd0jRrV874oD4xRqVjBpgkRZJoGweQQIsS5fVbRbcN//KQqo62xtX6e
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

All architectures supporting multiple ABIs have been migrated to
ARCH_CC_CAN_LINK. The remaining ones do not require any special flag,
so simplify the logic.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 Makefile     | 11 +++--------
 init/Kconfig |  3 +--
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 26e5bca534e27034c355939bca4c90db435ecdbd..1b7da9f10b88f1a374ae34477e5621b4dd27c017 100644
--- a/Makefile
+++ b/Makefile
@@ -1137,17 +1137,12 @@ endif
 # Align the architecture of userspace programs with the kernel
 USERFLAGS_FROM_KERNEL := --target=%
 
-ifdef CONFIG_ARCH_USERPROGS_CFLAGS
-KBUILD_USERCFLAGS += $(CONFIG_ARCH_USERFLAGS)
-KBUILD_USERLDFLAGS += $(CONFIG_ARCH_USERFLAGS)
-else
-# If not overridden also inherit the bit size
-USERFLAGS_FROM_KERNEL += -m32 -m64
-endif
-
 KBUILD_USERCFLAGS  += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
 KBUILD_USERLDFLAGS += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
 
+KBUILD_USERCFLAGS += $(CONFIG_ARCH_USERFLAGS)
+KBUILD_USERLDFLAGS += $(CONFIG_ARCH_USERFLAGS)
+
 # userspace programs are linked via the compiler, use the correct linker
 ifdef CONFIG_CC_IS_CLANG
 KBUILD_USERLDFLAGS += --ld-path=$(LD)
diff --git a/init/Kconfig b/init/Kconfig
index 4a2ae3cfbf26525a60936d9b29a74ef4319ba3a5..a0127598f2f25ffb55dbb8a0691b0aa68138fc69 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -88,8 +88,7 @@ config ARCH_HAS_CC_CAN_LINK
 config CC_CAN_LINK
 	bool
 	default ARCH_CC_CAN_LINK if ARCH_HAS_CC_CAN_LINK
-	default $(cc_can_link_user,$(m64-flag)) if 64BIT
-	default $(cc_can_link_user,$(m32-flag))
+	default $(cc_can_link_user)
 
 # Fixed in GCC 14, 13.3, 12.4 and 11.5
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113921

-- 
2.51.0


