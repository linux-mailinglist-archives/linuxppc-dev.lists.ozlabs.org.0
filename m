Return-Path: <linuxppc-dev+bounces-12319-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A612B7FADC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 16:03:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRgSH00Djz3clH;
	Thu, 18 Sep 2025 00:02:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758117726;
	cv=none; b=kN7gmXm2mDgKhINkG9LHb9vP82c2WHOxIJe/WRk3V9NdeeAvEZhv3dvyYlVYp/N9Q67jcx2NQ2q15ukBaZyKmyZaiBHTr+hqF5xB/3PkRiY9P/A4eA/Mw5Y/G5JKVBiJpR+z++tPwbnb4FGBBFa1wT0KiZQqM2dPjPXoqhjE3E6TyH8kZPKuOU8DJB/g3vYhe4AXPM0fVvQf0Ap7tf176xlhFB9F44PUHio0mm2LWZo/eaErt+Vl3NPmM5RatHZz7D+IopwuIElBVu9MQzEsyV7EVP/cZxJ5EKKYNpghBCY2jUankAbPbntJ+wFnHWKjkpoeS8juZGuEx5gCLBYgIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758117726; c=relaxed/relaxed;
	bh=e4DOdImq59E9vd6o2J/MK1XL5DEzKfcDc89YEUvACic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UQ++MWaOV6IvMaxpxiq43zimLA/ckOyRwegL5fdARZsfbWYK4prMOyAzVxpEq7kFlUCi2xhJ62d6gi6uPxyuor87I3WgY0GTRa7hdRm8Neai33noTLOD0khtrQgOhEJnK1FbkmEl4i6GLB1ch9oYKFZo+1FIGB7tPdFyJcesDSpFBX0PTo2lN2NMNyN1NY3siNZAJzn3WarIQwElDo4m/roCGX7gALoQsjs5h0iJHJUWXRk6oR+zCR/Gg4bfty+K9oXm8Jxe9lEclcd6DJZSGSNiuQ90aLN47m2VsZxGi02Vtkxco6uXbliK7WwZ+Iu5UC8BjG72H7Z/UOfzQEpJNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=f19Yghef; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=alrnW0Hc; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=f19Yghef;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=alrnW0Hc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cRgSD6BrTz3cgM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 00:02:04 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e4DOdImq59E9vd6o2J/MK1XL5DEzKfcDc89YEUvACic=;
	b=f19YghefwPeafQWeCFbX0YZOLAIHumtgce71KdWDpFOhmAFAX2faxmwEnmG64fBDksyRlq
	/Bjb92DbfzVLk8brehzt4Hos/R9gbTZ9j0DlltAhq8rMXrSx/gtTZrys8WbMpPStZuTVkO
	QlzaFfLk7vog8mh5qAXqJH6ApWuSd2BU+itoOo8AFIFQYj4okenmfZGezrJKk3/c4Mwxl4
	4xjmFDkCB5Wx3YBtqpxHtTCLcrrGTBLyvBlasMT/RnIgi9DzJT0c1wOQW2VqqOvFaCl51U
	m45wWVek8m2R3xdq3Uw4ecB0Yzo4jXIr/B3p2Zjb0/NoxTGkKAepxfuxeWsOrA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e4DOdImq59E9vd6o2J/MK1XL5DEzKfcDc89YEUvACic=;
	b=alrnW0Hcf7IH3q/nICDsThe736Bprgj652QQqNKaTZSYppq8xl4P5EbOWX/RzgIHcoyPe2
	OkPBF5IxHsnXEwDQ==
Date: Wed, 17 Sep 2025 16:00:08 +0200
Subject: [PATCH v3 06/36] powerpc/vdso/gettimeofday: Explicitly include
 vdso/time32.h
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
Message-Id: <20250917-vdso-sparc64-generic-2-v3-6-3679b1bc8ee8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=851;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=LMkWpOTw9lADoOsp4TmEwFW4rvUBNCxbmJSGcfJb6YM=;
 b=+TCNDPw9BR06tBfki8D75N3Iiat/8tlG5IlbjjUVxYgbx9Xqg0W5kO4uwi00dbCD+YhHEbWpW
 yYC9jRMoF1BAakAYZWVhjKOpbicCqAkOHLMYjeEde54Aiv9UFqMVCol
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The usage of 'struct old_timespec32' requires vdso/time32.h. Currently
this header is included transitively, but that transitive inclusion is
about to go away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/powerpc/include/asm/vdso/gettimeofday.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
index 99c9d6f43fde2efaf92d4777d3a5510677da7c92..2921ce98a3ae2d99041e3b51a2ad4ef677e6f9a4 100644
--- a/arch/powerpc/include/asm/vdso/gettimeofday.h
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
@@ -8,6 +8,7 @@
 #include <asm/barrier.h>
 #include <asm/unistd.h>
 #include <uapi/linux/time.h>
+#include <vdso/time32.h>
 
 #define VDSO_HAS_CLOCK_GETRES		1
 

-- 
2.51.0


