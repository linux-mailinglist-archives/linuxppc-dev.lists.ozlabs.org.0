Return-Path: <linuxppc-dev+bounces-12861-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 326B4BD98DC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 15:07:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmDx66xrNz3cnS;
	Wed, 15 Oct 2025 00:06:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760447162;
	cv=none; b=DNRisHTLzy3NGI33NKR2lCSCG0oCQQ7Ktl5xGmYjEmqkOE4Ov+BI93AXx+zdyDHPluLotRaIuu+W1NM+ImK04bzve+rJ/LuUIY1xjVrhPAK8QugnavWcIFzkle72tdxQUkIzv4BdFH+gB03JtkWDkOEVhygEv9Ghp+UYLacAujOAvpVLc/dp6Q9+K0zWKXTSdHIWIVwMfdX103FnEdjF+iQz2UqqX8EDvkKVEgA1aAuRAFE351QoNIBcLpuPMoRAu+yTQtz5X7SOTQ+PbBFq5AzHnEcpDvnHB8vk40LMXBsZwsFR0b00LOBUF6GuOD8pyhzMI7vlXiVbORltC8BGsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760447162; c=relaxed/relaxed;
	bh=5DVnR5cKH1ysJgeyzhsfqmBnURn+edrPqy5/eKSQF/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c8mT2Xk1g4Jinc8DF5AIhoZs6ts1mKvsfQJJqudmBB//7nMr8SmbhKJntCi8gkR6Z4WkRrLT9MtAAxf3xj+chZpvEGwIllYhAzPKIUgRFAN4yXEuTNYn+s614h7jWfKFI7BM4aOQePm9OoKqD1r8LM25OPHPR2aCFAGSrX2jZYiRhlqg4RqgLIW2OFWPaI1wG1HnLTw+zDY839HwmjyxUaRe5zb19cE9YWosnN2e1OOV+OBdutBe0eeaOfLcGg7LR5j/s990s5UDtjIJugL88d40i4eYhy3m7gpUsMt0sIngPzIAW9h0oW39mjVVHoCAoI7GZ2nWfDZpGggphPI7Ig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JhNZzK88; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=shg+bvHX; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JhNZzK88;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=shg+bvHX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cmDx501C1z3cjt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 00:06:00 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5DVnR5cKH1ysJgeyzhsfqmBnURn+edrPqy5/eKSQF/k=;
	b=JhNZzK88e25jp9GotNrIPt/vZZKb0VKNvXHuMydCbEqd1+HpUDRgpkeBu66g8l0nmzb5hj
	bJq7M5ewwEwCvoaLib81c2KVP2JXH18KAShW7IVI9vzPyYKeLzPHuQcnCLcuJ3JXd78+cb
	lUY4MTBSosdoQvzUYAb5icb+K1r5HG4pqLz9oI4bzhBVdZOIowUafsrp3TYAiTbpnnpYfU
	6qg49Q1Ays+clhKO56SqYcYh+OfTyryQT4RpjMe1QyOMPNBfLHRmczaPjLut258n2GT8QC
	+N+DKr68mMlHetmPxxPyjf2o5shGkZUkfBqZ9jlR19UUKQxhn11F/G4GGxOBVg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5DVnR5cKH1ysJgeyzhsfqmBnURn+edrPqy5/eKSQF/k=;
	b=shg+bvHXD8MmVzyiF3EMIesqOVARExahkoJZzsvujW5lTkfMY5VPtwGaJNav+nBBAaMzPo
	USexF86fUhIfXgDQ==
Date: Tue, 14 Oct 2025 15:05:24 +0200
Subject: [PATCH v2 09/10] sparc: Implement custom CC_CAN_LINK
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
Message-Id: <20251014-kbuild-userprogs-bits-v2-9-faeec46e887a@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=1096;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=dZCLaMpAGc/1vu8ptZyeXWxEiiNKEOUd3NRQEXSEOPk=;
 b=a1zArIcpsRzC1FZdasb8JGHUsoGoDAycc57M/S3ZNlxKRnq+Q21DHxSr8+hyt3/JppSgvNfcQ
 bxfFr7HMBuiCdP85ZG5aIqZqJw+JMdqAIBzuwcyKTmbOBLIvkFoAKI5
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The generic CC_CAN_LINK detection does not work for all architectures.
To make it clearer how the detection works on SPARC create an
architecture-specific variant.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/sparc/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index a630d373e6453c745ab8bf58fc5622cf0edaf4c9..68b553a47d039da4368a2de30168aaf80a941148 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -13,6 +13,7 @@ config 64BIT
 config SPARC
 	bool
 	default y
+	select ARCH_HAS_CC_CAN_LINK
 	select ARCH_HAS_CPU_CACHE_ALIASING
 	select ARCH_HAS_DMA_OPS
 	select ARCH_MIGHT_HAVE_PC_PARPORT if SPARC64 && PCI
@@ -475,4 +476,14 @@ config COMPAT
 	select ARCH_WANT_OLD_COMPAT_IPC
 	select COMPAT_OLD_SIGACTION
 
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
 source "drivers/sbus/char/Kconfig"

-- 
2.51.0


