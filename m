Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1706B25DF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 14:52:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXVwf4SZnz3chy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 00:52:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=E9BcdDkq;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fJTtut1q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=E9BcdDkq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fJTtut1q;
	dkim-atps=neutral
X-Greylist: delayed 145 seconds by postgrey-1.36 at boromir; Fri, 10 Mar 2023 00:51:15 AEDT
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXVvl0NXMz3cMc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 00:51:15 +1100 (AEDT)
Date: Thu, 9 Mar 2023 14:51:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1678369872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=16hHdUVfCNdMlPVnfLlqaviU4kMu2Q10n9ftvvZYWR0=;
	b=E9BcdDkqZdxtF4r0kWuu+xz/Dl9d6t7D4pFlW2tXNyzdh3tQ0QtA1+OLylWosPRYYe5Dvv
	yK1re3X7op9Wff/zskNXdMRasIuzOK7ZoHkSPvYcoO2w3md1ASXalh+5/9KD/8CZGfClae
	61eT+NyHlxeKAWF8W/i0QnOAz+Hq9ZmgLdK65ZJ26YvWJZdtKZkcphxiyZ5e4+L6sOPCcI
	gS4Zv0F9AMnH2EscgGYo1tjgCXNyWfkU69WYVfJdnN7dmDPtD8VAzGQJ92vwHdlgmSVieC
	KXC6jg8ZwaaDPubEH2j2zP09BnYpdQhjn35j3elh/XX20H8EG/2cf/r2X1cuNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1678369872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=16hHdUVfCNdMlPVnfLlqaviU4kMu2Q10n9ftvvZYWR0=;
	b=fJTtut1qqNzs9IUg/vtKwA522VtqglazOsudLM6J7kyW9JLBXiJNaw4rv2PlIFPgz1m3S6
	90+21v4nBizZMpAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries: Select the generic memory allocator.
Message-ID: <20230309135110.uAxhqRFk@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The RTAS work area allocator is using the generic memory allocator and
as such it must select it.

Select the generic memory allocator on pseries.

Fixes: 43033bc62d349 ("powerpc/pseries: add RTAS work area allocator")
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/powerpc/platforms/pseries/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index b481c5c8bae11..1c23f2d4ed557 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -2,6 +2,7 @@
 config PPC_PSERIES
 	depends on PPC64 && PPC_BOOK3S
 	bool "IBM pSeries & new (POWER5-based) iSeries"
+	select GENERIC_ALLOCATOR
 	select HAVE_PCSPKR_PLATFORM
 	select MPIC
 	select OF_DYNAMIC
-- 
2.39.2

