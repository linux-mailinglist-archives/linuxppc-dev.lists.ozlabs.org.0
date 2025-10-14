Return-Path: <linuxppc-dev+bounces-12846-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A54C1BD7B95
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 08:53:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cm4Zz0p6yz3f8t;
	Tue, 14 Oct 2025 17:49:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760424587;
	cv=none; b=g0sHkgFyUO/+CNgJmL9zrDJ3Do2FhO7cCEKv8JxH594vT3q2cNAwW/VDi9h/8EfkSPnIuKvVdAgYEz8k05pQd0VsDiACLOL7uG1gJChkYADt2b+E0B/GWB6xjVTOQKtjASzSwLasABmCHTnsNyRNNnx9zDbWFds3sbDp5c7yo6lqp+U5i/Lhh2f5tmTC2S2k7T2uerPArODDyYvV3N04l4XdItfd7Y05ni2wB8FdIDwpiwZnxApNaUmTXYEJYwMQ5l+ub1Gm3HQMrubCT4h74b35atxFGIQZxaw0kWP7gJXICGfwNqHM282NwMYT5XH8kDP31JmqafLUh20B/WwfiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760424587; c=relaxed/relaxed;
	bh=p12DOEBsm2e1glAtpDY9DYaMx7+CHoNdHdo/bDc6SLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LntfZZNiW4UriBOP8hDitUIqjO4hjce04ZvqLHlmgOkPC6PBmU5LZQnTtKL2DAGF28VoFcXAB+nq2W5bSkF557iHmsuODq90g4E5SN830B+dPTUVjq8OheehXbW3GFXnQeEIN7SPXWXmChVPbiLOUixh1kmgXGY9ATNmdSJs+oM/XGfk0KSZiQcEQNLx9paVVZwMos/EwRGs5tJ5a0Ja27g02hCiI6LEbj9YJqjNO5VwZzkpmXCezkk6guoTnpPMQXqmNWvZ3hqKrdAv0/Qbv1dui7z0eS8wyqlCWqivNMo2xmPy/gepRDCAPtvZDjinHxaQVjNZDns1ij+g/i+4SA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dhEocdc7; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=iVLWTrB3; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dhEocdc7;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=iVLWTrB3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cm4Zy3D4Wz3f6y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 17:49:46 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760424553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p12DOEBsm2e1glAtpDY9DYaMx7+CHoNdHdo/bDc6SLA=;
	b=dhEocdc7MY+wAPpet+cbdtegsWJY51zdZwCGv7shBqji5WpZmFrJmAPX6Dusv+GQwmr8uU
	AwBkUzCS6e4V2yUtIqLOdogpjy8npAqnVM011Nens68T8ELDfSJ2VXuTSgJS57rp2ejCni
	p36WsbSxVcQM8cK+IoXmOBdCEcE58bcPhnAA8zMo5wcUS/X3lLO46Pr75KL8yZ9LlR3Tr4
	WBHLMSQOw9E9yB7gYea4F3IYV/+ZJ5Atu4drXrUsYP7GiDzkvHZhf1tmS3dzebv6hdU00g
	aNgQpbC4UyRU3Ru72VI36Jgmc31qH0LAYkQAJ7FX9XwJp0a6OAtkSLUI2rXSSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760424553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p12DOEBsm2e1glAtpDY9DYaMx7+CHoNdHdo/bDc6SLA=;
	b=iVLWTrB3MChLTuU1QKNzEkFFDGAbH4ZWC9LNbSzce/XnVoWIdnVU5CVvWv4jz6UKfncLDt
	/rO5Q1ptt8Yds1CA==
Date: Tue, 14 Oct 2025 08:48:58 +0200
Subject: [PATCH v4 12/35] vdso/gettimeofday: Add explicit includes
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
Message-Id: <20251014-vdso-sparc64-generic-2-v4-12-e0607bf49dea@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760424546; l=1063;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=8uLSosIzbxHtrLr9GBprNPDpJ3bKD05UahB9SGNPIJE=;
 b=KEWOQu+l3RDxBz3FEbiSku242I9OTnhNJVA7k1iPqCYrjzxHGX+GNFGJCEGz63dXM5zlCD9KA
 1axQz60n3qlCL3K7WHNynEsBBGahr7d8207LmqQ9Pe6IEm5SvxVjTRF
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Various used symbols are only visible through transitive includes.
These transitive includes are about to go away.

Explicitly include the necessary headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 lib/vdso/gettimeofday.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 95df0153f05ab41c871755e005762f3442ff3ecd..7b3fbae85544c2f2f6b9abd5437f130706fb6ec6 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -3,8 +3,14 @@
  * Generic userspace implementations of gettimeofday() and similar.
  */
 #include <vdso/auxclock.h>
+#include <vdso/clocksource.h>
 #include <vdso/datapage.h>
 #include <vdso/helpers.h>
+#include <vdso/ktime.h>
+#include <vdso/limits.h>
+#include <vdso/math64.h>
+#include <vdso/time32.h>
+#include <vdso/time64.h>
 
 /* Bring in default accessors */
 #include <vdso/vsyscall.h>

-- 
2.51.0


