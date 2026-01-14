Return-Path: <linuxppc-dev+bounces-15690-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A493D1CFC7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 09:02:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drdqg2bHbz2yZ3;
	Wed, 14 Jan 2026 19:01:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768377711;
	cv=none; b=flkTkTH0C4dCfQDm8YgSZFst2YlIHvxVW/bGkm9Rc7n6+DSDUPZe1Nydm7dYHIP3c/oXvDwjHaiHe/2Tkx5ENrNUk/m8QbNv27JSXD36G4Gvm9lZ2DKReyzgGQcSdhsv4yHJ+1fB9rH1exNVe5rg4pbpjgNQTb7flrJP1wghGYOTImBQQ2I9amnsXKaOCAPbFRieyrTTYqpVv5QvetZW0s+c73+7XZv5Kgn/MoTuPHX+/6OBkOkjwAOVddKzY5Wpi0QMOSZlnUsurHBpsCWphcvbwcISv+KNozOStY+RXGUiKbndsOjr84OqMZfKi08Rms/o6iUX4sY9/c0PPbdIWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768377711; c=relaxed/relaxed;
	bh=ZiYZplVIU2bMswWsXnCI5OxX7s9uc9ivxQhrNyMPrMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DXqyUlTBkkTKfbve1cFfG6AqXPZ4ohrnsf09I36+fqJrb5tfjp4IRDMlUUStf10xki3mZGlvNIvb+ekDh3YoF42DFM2ccKVrf94Z8XiNGE5G6hXG9QAq1Oc41pSvnbKJWhKMNxSpxfQAIWRkYTESaRJ2S+0DOiH9CxXCoWInwqLWCkgFngDfG2iw8iAdbdJA9STNxNbiN9iw++qSSHFhQYhnnTVxJ+QIRQRa5p1y3atiu+/Lu6r9j5Hi4uJDwMEDnWrxsa0D+sI7zjqZDwohesaGvnrr1V/6WKedLCB3Y9F7g4UsL0LtmorzYL3os+pRR8/rcG7m/fK+Nkdec0ecIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cA25spE+; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=SgMua/Vu; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cA25spE+;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=SgMua/Vu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drdqf53kRz2yVL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 19:01:50 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZiYZplVIU2bMswWsXnCI5OxX7s9uc9ivxQhrNyMPrMI=;
	b=cA25spE+wAim8f1k+7WuJqzkDZvys6GTSxpb2KmSk+Q+nQBzXS6tfqlpAIRKvEWYEGEjvt
	M5JYrhtF4/V7c4vtQje/H0cuZpahEmHorlI/aBdZoeMr51ZcqUWKmDVzJtHrHHS2taSN91
	1YNJm9KnYtXgoX3ro/D2d3WfFLskk6NY52CUjWd0s76hHvC6jTvROMwulq0w/PUhx2DJ8e
	llKyvPoPCo8CkP0T9hesoHw/d3X/z3lSpfBKSjqNkxL9PS13hDmD8aNhFTOBJtRuK7vGIt
	fyj9kweuwPRVmPQctCN7GIKojrBoYO9FlPcIX81ToULXHAYvm51VYRQLw21shQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZiYZplVIU2bMswWsXnCI5OxX7s9uc9ivxQhrNyMPrMI=;
	b=SgMua/VuHoFPAPNG81enXWwvuyMKNcRB1exKhqZ6mzcCPvQlL56vFKb2yy2OPUAZMGjSg4
	mjGySB7DwP2mtJCw==
Date: Wed, 14 Jan 2026 09:01:38 +0100
Subject: [PATCH 06/15] LoongArch: vDSO: Explicitly include asm/vdso/vdso.h
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
Message-Id: <20260114-vdso-header-cleanups-v1-6-803b80ee97b4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=1174;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=+1lVkIKKJkoQnYmow98Tw437AO4O84MXjHTDHSn6twc=;
 b=pCjZhMqwiVM5dgHItzyl6ajTK4aOPh7tLHVrMhOvnWvfFRUP3zDl4L0c5DomJbGojdZtYsvCu
 PpRT02OC5rBD9WS5fmROTezk+B3uOUsN8u/z0qHvLnFrQyxBXL7Gviz
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The usage of 'struct old_timespec32' requires asm/vdso/vdso.h. Currently
this header is included transitively, but that transitive inclusion is
about to go away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/loongarch/kernel/process.c | 1 +
 arch/loongarch/kernel/vdso.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/process.c
index 4ac1c3086152..ac3a0baa5d00 100644
--- a/arch/loongarch/kernel/process.c
+++ b/arch/loongarch/kernel/process.c
@@ -52,6 +52,7 @@
 #include <asm/switch_to.h>
 #include <asm/unwind.h>
 #include <asm/vdso.h>
+#include <asm/vdso/vdso.h>
 
 #ifdef CONFIG_STACKPROTECTOR
 #include <linux/stackprotector.h>
diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
index dee1a15d7f4c..663660f08a1f 100644
--- a/arch/loongarch/kernel/vdso.c
+++ b/arch/loongarch/kernel/vdso.c
@@ -18,6 +18,7 @@
 
 #include <asm/page.h>
 #include <asm/vdso.h>
+#include <asm/vdso/vdso.h>
 #include <vdso/helpers.h>
 #include <vdso/vsyscall.h>
 #include <vdso/datapage.h>

-- 
2.52.0


