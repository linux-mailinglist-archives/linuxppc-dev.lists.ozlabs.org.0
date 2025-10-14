Return-Path: <linuxppc-dev+bounces-12831-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2882BD7B1D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 08:51:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cm4ZY6r5Bz3dRK;
	Tue, 14 Oct 2025 17:49:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760424565;
	cv=none; b=E/F/9mrf6m5FqndBJaC8NXi0kHY6QMWGAyJ4hp/7BU9Nhk0JzHKYyLk1ZHikjtNF1d1BbWulT+x2nZ567RlT/Xugg6BfLCiOTL6GTUjbiJFBDuYT56iRsN8jjEF3aeIEH7733Gnn3OhOcOZEHrZf+7pFgqUOwEGtQLdJFvOuuXXB8lHQTn4wJCJf0xQgdjdnyIFLbdClbmP55542HQa5mS/wSdKOXPfuH0B+WFbbzGZHA7/iPAcPZNDsRLJJxpLVV/iTQC7+d4SGuNolEsJps7gytDLkazDGrXd6fTTPvqn1Hbp0ZZm09l8lWnlNOTflVQLSyjontQaj9OyHusiZyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760424565; c=relaxed/relaxed;
	bh=KXnY5RDni4beXSbCleFNj0bRZgRx9ddsylJ7nscxaEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fEB5M1+6SV/HIDLkvAOQwrdXHr/nBLzosR0pIr2HDcQeyyCqhLJByh8jwKSwzw1G67iAnGRmim5yOSRCdYLBOOLk7LDJiZihVdnWmNtD8h6XDr09nEge7IEPixa2pYs1sP5NvjlPPeDIRGKalPfkE18H75j+dlRTNrORyHKiUSlUGH6X+I/qGwLrRk+V9vjLfpEE/ye8W5Mad31E+F6BGRLkbvJzRRRBj+szdfA0PZQzC5mDEABzYNC/U5xd5uXjVycZXnXfUkRQTuXY8A9RDFBMdJFtcMH2hQwZ1WzGgC96HVUg9jzcZWppDynDNRE24FS4mjIJN4I7WKC2qnlJfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZQ0CyCv1; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lLzILQ60; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZQ0CyCv1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lLzILQ60;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cm4ZY20vDz3dLT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 17:49:25 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760424560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KXnY5RDni4beXSbCleFNj0bRZgRx9ddsylJ7nscxaEI=;
	b=ZQ0CyCv1WenXTHgZMKp/bzDmotlAcjP5bsSdAqA/LXlpr+FAjTg0nxel+makNXbfIneARv
	HuyT/guyKl0HzZD7zgtTTmsDBuuPis3abU0QfakQUh57efHQRg+FiJ6FvSXBeqBx6zRobR
	rU36ouOPur3ypyyoMhYn08Cw0yeVs3eKclUryWubUlukrIeTj0/FBFXRqL0C3+jMi/a9k0
	X078Vih9EDYeonFd83wbK0SpFw+40tACcGrCIMKKqNanOzUavjgns2y0NeefraMc6KhBX/
	y59GsaINWJs4XtTbiRrZdsIwPhhjja/eA+IdQcEFZKAooj1wEwLVE21Oc0wgKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760424560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KXnY5RDni4beXSbCleFNj0bRZgRx9ddsylJ7nscxaEI=;
	b=lLzILQ6086Ns9BC3W/cwSHPVvrTh305P2V0mKp+PzeSEbKKdm7n1fd0Snjt0N9cgrKzY1z
	rhXJTpTBro2kU1AA==
Date: Tue, 14 Oct 2025 08:49:08 +0200
Subject: [PATCH v4 22/35] vdso/datastore: Drop inclusion of
 linux/mmap_lock.h
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
Message-Id: <20251014-vdso-sparc64-generic-2-v4-22-e0607bf49dea@linutronix.de>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
In-Reply-To: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>, 
 Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760424546; l=869;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=T+uiAGc1CKmq8YVTkteEEzyKwhHBee7QKhXDO+NLJos=;
 b=03aN3q85VKM+A/8EJFoM6MGLfUSm8KAL+rYYl60MFXYALJNsNTZWO+3qq6gCMNS4G7Qdob9wN
 ikNxdnMFJIiCMshc2FJygl5nF+NQGnjZoaNd21066E5BOXNtCNLGw0n
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This header is unnecessary and together with some upcoming changes would
introduce compiler warnings.

Link: https://lore.kernel.org/lkml/20250916-mm-rcuwait-v1-1-39a3beea6ec3@linutronix.de/
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 lib/vdso/datastore.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/vdso/datastore.c b/lib/vdso/datastore.c
index 2cca4e84e5b5e7686d6a2b42b41af4f399cc5261..7377fcb6e1dfe31d02ffcae371fdf9da069ae4c1 100644
--- a/lib/vdso/datastore.c
+++ b/lib/vdso/datastore.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 #include <linux/linkage.h>
-#include <linux/mmap_lock.h>
 #include <linux/mm.h>
 #include <linux/time_namespace.h>
 #include <linux/types.h>

-- 
2.51.0


