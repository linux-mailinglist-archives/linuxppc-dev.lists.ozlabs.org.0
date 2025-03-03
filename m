Return-Path: <linuxppc-dev+bounces-6627-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0854A4BDAB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 12:12:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5x2c1ffnz3blV;
	Mon,  3 Mar 2025 22:11:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741000280;
	cv=none; b=P0GOCnA/mJWxBO0AiikBUd/9ew2VQLeGHmA0XsxGkGIYQR8/tzfXRfv2DgW5Val2JpDf2u+0G4SfkUy8/sgY2IgxWonLGMlxdDrikDOCg0vWFfwf7Zpe3vLnyNolyXF+AED38spi4Scpf0oCSewBPgOuRFYcSsKXeu/wyAhlOtyAtITSwdIpSH61DnuyRqE3wSM8OyvT61+GtOLvM94eYGhF/7waCXhG+o94RyriyYzM8SsX3FGnEwkvoVj6wcHdmiHyyBSwwQEqoYySJFpnhhP7qFlpmfgXpdJv6cv1nNINOkk28h12LzVtP/auODXW+v5j7ShT/9RSXfBG08fGMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741000280; c=relaxed/relaxed;
	bh=xj+izrhaOcxy+xihfquH+xNLp8A7/ytMiHjX9X2ba9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FKhON3e13RfocdC11cYGZzc2IxVJ88/2Kntji7Rfggoo1OD3+nBoO1PCnVnGPNYY4nVs4J+aj1Af943tcbcMgLG8qUVYjVsmc/exIkJczokB4a/v7mGKKMhA2LtoNdkDRUpsOmI7xCacd8jN4+1acTNs9Wp2sqP161qja/KSwpQvbvN/BYzEaNqLKG47GWZSQknMIh1O2P1G5FFSFroVa8oXOtCgTay3WNsnJ+WwNiMlgAX2aRXPvJeDwiOfkFRXXS50Lk8EecJnuJXzIA/80hq8QviW7ceFDfmcCQrQRexsPlpgq35kPiXm1RIKMZXiP9VuQ5pjDuJUgCqVrC/dCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Gxa5GXG1; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xuensp3P; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Gxa5GXG1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xuensp3P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4Z5x2b2yPjz3blK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 22:11:19 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xj+izrhaOcxy+xihfquH+xNLp8A7/ytMiHjX9X2ba9M=;
	b=Gxa5GXG1996oaCjjYl/Z6sgMF1KOjoNvxpBXX6w6eKXnxd6/0bfYOFDRsivWanOVtA+9ZS
	BBwK+7G458P2Js+w8bvhlXENVl5k+2TIZXozC+NmmvNazvxFNgIk+1zOETFD/uugMTBBNl
	B8Sxwq3Z+dwoi4PBPaC/yr+sruV7ytzkG44m5fG7jEU76o6VjSPGkYFLJb2OWiTIlwv5bp
	vY2yEkOXk8/iMBBnMHPoYEDip2ucsdf/Q8NEoc8VK8ZY63A+XBuuQjmxEw5Gj+HK0Ha3WU
	ky3nR1pqfPdC4avJQxL3yuhN/Pg3YEKdEWmHhSG6XD/KJ37oGU+Pi0rsHxUxfw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xj+izrhaOcxy+xihfquH+xNLp8A7/ytMiHjX9X2ba9M=;
	b=xuensp3Pa9Pm0DfWFv6ec0Nb8Q78eETUCr5ghIogZLmzP2K+5tv9Q5qn7Km2/eZ0HMuvAZ
	V25m6gork9ijLVAQ==
Date: Mon, 03 Mar 2025 12:11:05 +0100
Subject: [PATCH 03/19] vdso: Make vdso_time_data cacheline aligned
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250303-vdso-clock-v1-3-c1b5c69a166f@linutronix.de>
References: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
In-Reply-To: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=1329;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=+SD6yGnIFUmAVcH8siXM+pCjZMZm4i05faOszoaQfnQ=;
 b=3rnVtk2piKjEr1OX2HGOUwEZO6XTwkuvMBS8Th4Zl1Fyez4RcpeNoVQ+iQsPawv+KjUBtwrnC
 bR+EZ/DXucmA32/wVjS994HjsSLCu3iMbAMPCOkUa8SH8VgkE3QrxuF
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Anna-Maria Behnsen <anna-maria@linutronix.de>

vdso_time_data is not cacheline aligned at the moment. When instantiating
an array, the start of the second array member is not cache line aligned.
This increases the number of the required cache lines which needs to be
read when handling e.g. CLOCK_MONOTONIC_RAW, because the data spawns an
extra cache line if the previous data does not end at a cache line
boundary.

Therefore make struct vdso_time_data cacheline aligned.

Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/vdso/datapage.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index ed4fb4c06e3ee6423fe68ccb476565213f234863..dfd98f969f151eca3c551c3e90f69af9ee8f22bb 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -11,6 +11,7 @@
 
 #include <vdso/align.h>
 #include <vdso/bits.h>
+#include <vdso/cache.h>
 #include <vdso/clocksource.h>
 #include <vdso/ktime.h>
 #include <vdso/limits.h>
@@ -126,7 +127,7 @@ struct vdso_time_data {
 	u32			__unused;
 
 	struct arch_vdso_time_data arch_data;
-};
+} ____cacheline_aligned;
 
 /**
  * struct vdso_rng_data - vdso RNG state information

-- 
2.48.1


