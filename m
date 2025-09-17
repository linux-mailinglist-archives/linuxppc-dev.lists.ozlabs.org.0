Return-Path: <linuxppc-dev+bounces-12317-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B93F4B7FACD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 16:03:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRgSG3R6Cz3cjb;
	Thu, 18 Sep 2025 00:02:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758117726;
	cv=none; b=YiQ8GzaDzYmn6IJcnXms48Tk9/FIPOyEDbeKr65wh6bQIsfr9/5RI+zctOAXq8gXLYlbeAPmtA7uoRMIa/Q1ZJGkqzx4ujeYKRBPtIxt6BwFtO5X+7YgCNi2BDVvohv4EgwD+C/p4MXnAN+twXp4c3pVUZlyysf3aC+YOddnullvynx1srmr94s20JHvJva1hLP+D61xR323L5UOJd08FIfFkQgyXZ7uAi8kvde7YyQRjPso9WY06Sd5K/DwgB8x6Ig25UIvUSQsT0kxOaIYZxZToHMbQldM/7jWPpH9o2UE59mBeV17b0Ml2KOCX4wy4gNAmBQXE7Gj2g+KZdxL+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758117726; c=relaxed/relaxed;
	bh=9I4X5FNFHkpHwdsY06ph5hLTjT+SMU6vgehVk/iWDIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gqUcaqqw3eR/f1U9g8WVXn7xO5ks4bnZ2xmuBuc6XOZcWLhVBJTRS0YAuV/8XlTwU52t+jvUnzRje6DDD5605wYIqPWuM/RR/Q+XkguHP+4Z1goyBsmBE5b0PyVWGM+o2eX+8VqX74ObNzsTl0nRBQpR0fVj27NjSKqRf6kd1drco4JCpR5BTVpOKSzfBro0agjApfqMafrarfF6ijUtWmcAszYMNQnrKAITVgoZxZ07tumPXyfhfbdWfB4w2WG1qxN6j21KenAnEGm+85EV0l14SMBY/2ShyccyNd67hKufq3c8D7yDEm33MwF8kBN5jO4cMAtUSy6gnl7RwFUrQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=O6ypTniF; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ALmMcsI6; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=O6ypTniF;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ALmMcsI6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cRgSD5B7zz3cgJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 00:02:04 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9I4X5FNFHkpHwdsY06ph5hLTjT+SMU6vgehVk/iWDIk=;
	b=O6ypTniFI7Di61PIULY/cofJr2peM8xs+/YzzQazO5FVmpHo2AJuiCT7yh6H7n9/MpErwj
	6YHAZnZlpL2aw+mk+BNrimRmoJPwKPPDOMPvCEtsmifAtByJDP8Slf30PJWTCqC5uNf+5c
	3+4ib4nHhxeoVJKhIVBM0X1lzroVlrJRz5GAZs/GahS0vxjRUXcVHy0aB2hERzf1cJFoPu
	0RWeqccFFr40KPmJq5BotVukacsP0fZFUaS3kV4r8BCZsxVQ103PlirQ2yHZ5oNO7XlxU+
	MQl4/Uyyv7gwUM3n7DC4jeChlwNJBCfssec1a6MnkhENmMk9nmfm9lCfi9lG2Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9I4X5FNFHkpHwdsY06ph5hLTjT+SMU6vgehVk/iWDIk=;
	b=ALmMcsI6R2lu2eACK3Is8/JD5T8hjZPJz9/RHGicJ5xK81OKhBIOstkXZ6aS/8b5BkR07G
	Zcnajvwb85het+CQ==
Date: Wed, 17 Sep 2025 16:00:07 +0200
Subject: [PATCH v3 05/36] ARM: vdso: gettimeofday: Add explicit includes
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
Message-Id: <20250917-vdso-sparc64-generic-2-v3-5-3679b1bc8ee8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=955;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=rfKtf9heKLtEUEDnlkSQVygVQl+5EpVRNxTXAkEx/gY=;
 b=6YkiODMY3Hk/wVlPgvgqoTfDwjWKygY4yAZ7hjPS134bBs1j8xPibaMf+DFvcRegsXhlWVmkR
 ydKAKQi7UUMCWIayMtMyxqsKiOohPDUrYMQtclT1AKkG3q8gP3dOVs0
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The reference to VDSO_CLOCKMODE_NONE requires vdso/clocksource.h and
'struct old_timespec32' requires vdso/time32.h. Currently these headers
are included transitively, but those transitive inclusions are about to go
away.

Explicitly include the headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/include/asm/vdso/gettimeofday.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/include/asm/vdso/gettimeofday.h b/arch/arm/include/asm/vdso/gettimeofday.h
index 1e9f81639c88cc23cae7cf267bf4674c6d6acec0..26da5d8621cc938f9fdb57fc4b8d240c71e950be 100644
--- a/arch/arm/include/asm/vdso/gettimeofday.h
+++ b/arch/arm/include/asm/vdso/gettimeofday.h
@@ -11,6 +11,8 @@
 #include <asm/errno.h>
 #include <asm/unistd.h>
 #include <asm/vdso/cp15.h>
+#include <vdso/clocksource.h>
+#include <vdso/time32.h>
 #include <uapi/linux/time.h>
 
 #define VDSO_HAS_CLOCK_GETRES		1

-- 
2.51.0


