Return-Path: <linuxppc-dev+bounces-12829-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 643B4BD7AE1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 08:51:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cm4ZX22x9z3dJM;
	Tue, 14 Oct 2025 17:49:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760424564;
	cv=none; b=KwCHxGOVPfxGkvnlb3OtgXtvyP3J+LLubA/NyeskFY+PjPc03Oy6HvUzeO04gGtabd1Rd8QfbjqmZVNyxQsZbsUmKJGaCy9AxifSVdbUFNpUa4CL00lD1B60oGLXUs76MH/U1ff5qvb5+ibnHG+61lXV5PxYhCoFZbAMoh40pRpfEJGgQpnQ1buyUMMVRl/dkvBhwsaqbijRqby98QSMvKuYQsNf/KLNa7xqYgaB05KZvFwsckXRu4my6SjdMxySfl5xuo5DDappV1Fmc8fQ4xsvAlPayBV1dMbZfgraoNnyl1DA9ti4+xCFzv6fJ4/N/V+DKkkGjMaWeOA95AjEOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760424564; c=relaxed/relaxed;
	bh=y3tGpR5SbTtmYH9/UhUB7FG7sTK6XysaxzCJ0fbVJv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QjsgY46uTcSbewIEgz0kd5Gfsqn4oYGI/TYnEcAHSzeBJv+X09jGWADOMxFrnJLbQXQ7/eBR8eUyEoddkZ1MG5C5nKYXcReFMm3rWaACJ0/gFBbcZdPvabntROp2RhXqdw/lKcosVfZNYMf9MH6Z2kD+YmMg1LMht5kLmbt02BInVPBcPgeOlpwrkrVuzxeGGrKKLSq2hz2S6g+uf82r4FkFZi4H5/cfFQWQEWSfjWFBRu96xrhowgoDPs95Tk3ASxYZth9hy3zm7Jt+Nlis/idHxDK2B6gTivexELKB88qsBbXyBepmn9EH59Lq3iTBYPWHPC0VZVzV+FHGvciXuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=uUTK5yjx; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wBLcltCP; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=uUTK5yjx;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wBLcltCP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cm4ZW4RNqz3dGt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 17:49:23 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760424559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y3tGpR5SbTtmYH9/UhUB7FG7sTK6XysaxzCJ0fbVJv4=;
	b=uUTK5yjxYeHVCab4+mSk4CSyqeV7aL2+6VMhldMX8S/Yt+QEROo4AqkxxYXxMRu/B71SaK
	hfTjAvShOVSr5klbOKf8hAY83WiH0bA2MZsKsjDQCNn7gECyHdzwkZWFE+58L65dytwwB6
	Lh/WxrG+mJNgwMwX8I0Z8UWE76nKOrRNyMc8Pf2lpSJ6JnkR5CgHYsq4Cdtx2QMfRLcTGh
	1ZCzziRwzi3/0B/fwngL3rkbvu+kpBT9GyQr2Y5MEuYaVmRF6I/MfCWx5qTYKlm73RSkPf
	imXv08p4nL2iXi5/9MSNJlru3E3Tv+k6OLlsAXXcTV0z8ZNJLXyQtyvs/FWX4w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760424559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y3tGpR5SbTtmYH9/UhUB7FG7sTK6XysaxzCJ0fbVJv4=;
	b=wBLcltCPIWmQf+pZww9BCaRZLkV10mLosq/TzjJMbWnYGrT96VGtYrPRkUHHqmrqQtbqEh
	qZj3K8K/YyTDDyBA==
Date: Tue, 14 Oct 2025 08:49:06 +0200
Subject: [PATCH v4 20/35] s390/time: Set up vDSO datapage later
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
Message-Id: <20251014-vdso-sparc64-generic-2-v4-20-e0607bf49dea@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760424546; l=1384;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=2hSFMUISgDavbKKRu1atPOpNqM6l7sLyIWcWtFRLYDU=;
 b=fSCsg9SdQvcBY2ZNPU9EUfDTd+/VWdJRzU8b3Z2sJ0uqAUbt73DRMWmeTEMv4NqR3wqYMipML
 zeVuoiUC8X1BFPo6EGqZbGAX9qiRiM1vYrQKBG6d5+fnwLPTPFs9lD/
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Upcoming changes to the generic vDSO library will mean that the vDSO
datapage will not yet be usable during time_early_init().

Move the initialization to time_init() which is called later. This is
valid as the value of tod_clock_base.tod only changes in stop_machine()
context and both time_init_early() and time_init() are called before
interrupts are enabled.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Acked-by: Heiko Carstens <hca@linux.ibm.com>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 arch/s390/kernel/time.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/s390/kernel/time.c b/arch/s390/kernel/time.c
index 63517b85f4c930b799235c381d9d6b263fff5431..6b948b9e61fe674bbc842a0143dd35a26b91a860 100644
--- a/arch/s390/kernel/time.c
+++ b/arch/s390/kernel/time.c
@@ -78,8 +78,6 @@ void __init time_early_init(void)
 	struct ptff_qto qto;
 	struct ptff_qui qui;
 
-	vdso_k_time_data->arch_data.tod_delta = tod_clock_base.tod;
-
 	if (!test_facility(28))
 		return;
 
@@ -248,6 +246,8 @@ struct clocksource * __init clocksource_default_clock(void)
  */
 void __init time_init(void)
 {
+	vdso_k_time_data->arch_data.tod_delta = tod_clock_base.tod;
+
 	/* Reset time synchronization interfaces. */
 	stp_reset();
 

-- 
2.51.0


