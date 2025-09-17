Return-Path: <linuxppc-dev+bounces-12337-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCECB7FBA2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 16:06:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRgSY6B6Gz3dWJ;
	Thu, 18 Sep 2025 00:02:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758117741;
	cv=none; b=icsQsbk8KAasLADUaI4xbcTu4ckS+fRlKAa+yGkfeegtNmspknbpibGdjOyWvyG6dsaG8SFezbDGxnfanu9cBrU9LIA+sZyJrTiwVAICHthJ4LrdMxNeK6nQpcZY52K+E0X8HMTiXqOISF/mCEAcSe4SgqIoH/LenVti/FBZUjFKjOHfsMkstJlBPl2zAwlAvciTsnHBWs2oJjxmus6Wrc4Miuq8KjbB4yi9AtcGRIWCexyMEvZRGdN2VkV3c0Tg342MFV4mW858N1lDYLmaV6fn64YymD4QNppxCxk+H9rcAzBJ00T9iUFPNqGKi+N2zPSbIqT5cLjNisZ8Zl/JNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758117741; c=relaxed/relaxed;
	bh=FHS+uIo6vIQa1BFdxBjWoSw++DBBJApoX1SRF+6ZOgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hDQFgINaGjsssiWqdXVY6ihmJxVRsL5v9/AFGceNXkH96HlUOD1/9U4AFE7eaRLu9Ev6veWXURxXpd7K3Q/fuxhEZg1kND4QQAcdS4QyyGrraL4TZHrySo5093+sxc3MxDi2e60rlviMJ1zOGvjrmHztCSSyXcH9L6MJkHEfaEPPYDy/IyQDfrsfWelt/CdSH5MhyPhQ49gqMzxAALeAB0cXcOsA39m6uuRMbFSSPOQLKaFJ/Dhw3kbe9lWZz9L18ZNZKsILo1ubYSfS0iSch6PoG8+Mw/hmbT0eHuz7wW4Wf3GeaXAtWvdEgCb8VX+H6NtCM2NAXIpBAlQNrPoDFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1r0wfkyg; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=hLQB6YUg; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1r0wfkyg;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=hLQB6YUg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cRgSY1dbWz3dWD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 00:02:21 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FHS+uIo6vIQa1BFdxBjWoSw++DBBJApoX1SRF+6ZOgI=;
	b=1r0wfkygy/P9blrtdLYMyiUfFfe+Z98K9nrK51laK60wPvg1f2Oi0zXIxBZy3tA1tmn+Qa
	ZGb6/dvrXa/jMPXLWfYXa0gmaLt8iHwtJv4PByRTfh32/NSd3crAnWxgJLrJJZ9y6UGw6r
	34EREYqaI4aDi8E88uD1qKh2CbDOV7OyTbuOZipJlCteHLbzOZozHH2JAcl/Lf5nBddxXK
	bTdhrTa0RrF89FgndnLw+1H5zLmhAKOaBpsP+WHzTzxQBUD3lSnR5S17jdX8iS9ehrksUB
	xsTwIWs5UEi9Q7umdyI24Spt2pKNbvSNlv+R4+zS0aNm3JyTVVmtK5gYy5i1Fg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FHS+uIo6vIQa1BFdxBjWoSw++DBBJApoX1SRF+6ZOgI=;
	b=hLQB6YUgypYV4yZlo9juY1KOLYQ8lyT2Ew5OWvk1Z0Vt+9CtTiouCPTrVvGZXTTFpWybIk
	MU+HWkp+MqFTD0AQ==
Date: Wed, 17 Sep 2025 16:00:15 +0200
Subject: [PATCH v3 13/36] vdso/helpers: Explicitly include vdso/processor.h
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
Message-Id: <20250917-vdso-sparc64-generic-2-v3-13-3679b1bc8ee8@linutronix.de>
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
In-Reply-To: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=750;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=KZlZm8RtaIf1Pyxo0THRqfr9jQRZP4AS6TuSH1/17gw=;
 b=LXgkbDgD5hsYsQ75afc9Qhez0l+BkW1c8CVlOM5BjJyR3G/vhiqg8r6y2thfXgPRP46/N4vwM
 arE63xScHjUBGh21OI228+H/uPRm22f9qdSQLnYCpDN0yCLPEw0ybXE
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
index 1a5ee9d9052c38553c0cdf413e0030286f884d53..a1c995af4696351e55cd870c7c4211b0984fe9ab 100644
--- a/include/vdso/helpers.h
+++ b/include/vdso/helpers.h
@@ -6,6 +6,7 @@
 
 #include <asm/barrier.h>
 #include <vdso/datapage.h>
+#include <vdso/processor.h>
 
 static __always_inline u32 vdso_read_begin(const struct vdso_clock *vc)
 {

-- 
2.51.0


