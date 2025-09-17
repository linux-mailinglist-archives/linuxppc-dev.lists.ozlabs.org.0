Return-Path: <linuxppc-dev+bounces-12313-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1FEB7FAAF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 16:02:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRgSC009Vz3cZL;
	Thu, 18 Sep 2025 00:02:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758117722;
	cv=none; b=cnnMpEdVO1H+j9NV1OFaNTiU8kYJ2wuH9AxoJetOqZDexp9EwtcDPmMz5Mwvgy/thKeYglt8//xHez/lnnfY5VukdEm7zvAOP9JbIVciEdflwUY+wSA6F6l5jpZAxmG7x4wBVOiYTboVgOlfuK/Zhrt46tCbKEKidXMWfrehtSWdShmDUcVL54lDuTC51tRf1h7Vrqqlw/lIYjVHroUUZ8wg85aFucIEMd+9tB24PWCz+0lZ9JScULcz8kC9ASBF1hZs4pN79InR2YlKO7huqYPArNGXXOnAZvekfvXZggOgvy1wTGJchKyRP6J2MTaBkNbehzaRQLB2DAKcFGcbzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758117722; c=relaxed/relaxed;
	bh=t9fIZht6Ri6P3bUW3FJpBKvn2m7nqO9NsSGywnahPGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nH1lZ5vVgzFoteLifAs5aNdCNp3tQc56fKVtPpIv+a07vGZzY/lrgHzRBAUadEkof0X3ENnAcYUF+OJooc7INiJqkb5OQ6BTeGQ8+KFYwe1UhJUlt/aeFoY3eHEocn+1rpxD6x//nUHQ86ix2KawlYnT6lBOc8Un+8T/KBAg7YEhiQRms78ariDBlKM3O2JJ0K+rqwPBHJoBqck27Zn7YGHuo42qECbYQI98DWGyKaYxmirQUELvN63yc0DI6IqWHGMHcD+2/0wXQI8h82C3YDnFendb+JnDgxFutG5iZlfq0oNFAx0/FdHoJtUp+d7bd7pQNmRQ3UpSBImQcWbcdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=mx9rddnR; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=8oJk7xAT; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=mx9rddnR;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=8oJk7xAT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cRgS74pgHz2yMh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 00:01:59 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t9fIZht6Ri6P3bUW3FJpBKvn2m7nqO9NsSGywnahPGo=;
	b=mx9rddnR0SeoNJdMOEFweepaDREiy2j0c2SqLwWMXgMzqhovDezIbSg9HZXOIJj+ItR0d+
	RnpoxUIEDhPMQnAUWruTik/TDPgxKSIDGXZf7Hw0K1WYyMmM0kSRf7UaaVV7sWVUAC+By/
	8bsJn0QFrtypD2iwYYcGktcvocGosTCSWsw/klfzarK0Qz0UY3jPKUpnMfR7QWSuqbxHAu
	BGtE74aecSpXrwSwzc88azq91dxyPS0+ghCDJMlRDqsz3A+1d/QEEq3x8uZsTrYWXNkOnU
	GK21ykPu9SBxqgzvs4x08ZP0ZJ7XlWWQ+uy5ai8brVqltW5LiXMpLW18jDtbXw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t9fIZht6Ri6P3bUW3FJpBKvn2m7nqO9NsSGywnahPGo=;
	b=8oJk7xATYHs4iq1MFQITZcdKIGEHI6gg9Ms5+/sFCWMMI6iHgG31c2/4uN1B5Eo/f2bv63
	JRdemFIMXRB8/oAg==
Date: Wed, 17 Sep 2025 16:00:05 +0200
Subject: [PATCH v3 03/36] arm64: vDSO: gettimeofday: Explicitly include
 vdso/clocksource.h
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
Message-Id: <20250917-vdso-sparc64-generic-2-v3-3-3679b1bc8ee8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=848;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=SNteanxTfSDFrSYRsGauABt3RvmkN4sS8qKeut8Q+tw=;
 b=Y42E5BxUSZA6Esyjqr0LEU26AHmkDQw3lrNCDgDFzYw0SsjJRfoOUpNlh0Z/kShitLAvPX0dQ
 u4C4SGBq+3vBPm1rks0nz6xsxVZ5Z7JpXqIzyQ1VkVcjpktFIp6ZcuZ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The reference to VDSO_CLOCKMODE_NONE requires vdso/clocksource.h. Currently
this header is included transitively, but that transitive inclusion is
about to go away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/include/asm/vdso/gettimeofday.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/vdso/gettimeofday.h b/arch/arm64/include/asm/vdso/gettimeofday.h
index c59e84105b43cdb0c823da3dd793a83781f84302..909780bcadae92109b175e23cb05e966683731d4 100644
--- a/arch/arm64/include/asm/vdso/gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/gettimeofday.h
@@ -9,6 +9,8 @@
 
 #ifndef __ASSEMBLY__
 
+#include <vdso/clocksource.h>
+
 #include <asm/alternative.h>
 #include <asm/arch_timer.h>
 #include <asm/barrier.h>

-- 
2.51.0


