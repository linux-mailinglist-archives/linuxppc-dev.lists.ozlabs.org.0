Return-Path: <linuxppc-dev+bounces-15698-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4E0D1CFF1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 09:03:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drdrF6Hwgz2yYY;
	Wed, 14 Jan 2026 19:02:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768377741;
	cv=none; b=SKpO6Plilug31J953Pna1MTF8Dhhbd8PH4uzuCEOyipshs2nmAbC6YfeWq8UPkcbDjH16aBQM+MelA5xwYLwf4b3piYtRP4Ct1BtRO7uGkWc513LCk/xzKHpPB8T0mlVcnagOJX+qyxDzTryr1uqoYbgbDTb+PMfHxZW69KqmO/6Xsgfwl/OjJD9ET4ik7dTcL8y1VGWPn+7zboQpDhYkLbP24+UdxrJ8ykB3QyolHcU2lYvI8eWgP4BpNM9KsmyNqSV9a51cRPeNnSfcRh9gT3SNV+55fryILI6rPCe/QuZjMRt4c60ng85dmZmdUm2lzQvLxi9sLQG/mM46UHJOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768377741; c=relaxed/relaxed;
	bh=sVE7UDpBEJQzs6r1E3Q1QZHCQl3Me/v8mkp8raZ1pVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T8xAZnKeN0ZYo1tcT/9tqxJJRH+3Mg/av7ZhBYP/iXjzWV5gGPo7os3JmL+6mApWVWAX2emvV8qZ07owh0Xw4eLq1TUzrsPQ7eU+6B6a7lLBiUFGvikENuZZjUhwQJHrWwiNNB40c6B7geMBD2DXBvFZTWNFmoO3w0F9J0rfsQ4JcbanQVTRWq6yLvwFV5TUgtusiQy3NGLpXSwTJngW5YHYaTmsgDT0Zn0+PMTPGbdlD0qNXr6e+rQuU+PcI2SESV3f2MUAqFUlbHOa2mqFN8I03hEJj2ZO4H7rB66Rj68WrEXmRP0SqYI+SYpz8DqWj5JrQ+IvBl0mcI1pKk21qQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1GWqSl4O; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=RuEHcaus; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1GWqSl4O;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=RuEHcaus;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drdrF27GYz2yvY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 19:02:21 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sVE7UDpBEJQzs6r1E3Q1QZHCQl3Me/v8mkp8raZ1pVU=;
	b=1GWqSl4O8frkZuGBVEYparTPXcEIULuaQAHPdpWQ0EpnZ8DFU6kG76yfTmEL/uFcrqifGB
	qDsG7q88iWJAQj9WaVerLrOIX6uiIlNIczRR5QIMCpoZXn00+Y6nQypzcNK12CduQULJMP
	2cGnMod0mnyeSxq++wou4ZRawxpygSbp9OXO5V0a8pyp7lvXGv9jlueX9Miv4t7Yl7A0JH
	r0EDzhphdhYKgvX8/msd3XVzAhdG2ibo7AsZMqfuDX76IFb5GM4RQdA0x6mOOKOSf5E6Ck
	xtKVaFEWDyWi4lAVPU7Up18IphP4ZcYO+Ns4bK65lN2wYKyTqN9M60nGi/R0tg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sVE7UDpBEJQzs6r1E3Q1QZHCQl3Me/v8mkp8raZ1pVU=;
	b=RuEHcausFw0WTFmyY09rtvGUsovhmgPHBLrdaFaqIfLg7PS3Nas2PhsrCcboVycDNO0E9Q
	C8OYIy64slBZtJCA==
Date: Wed, 14 Jan 2026 09:01:42 +0100
Subject: [PATCH 10/15] vdso/gettimeofday: Add explicit includes
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
Message-Id: <20260114-vdso-header-cleanups-v1-10-803b80ee97b4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=905;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=/PGHbFBRbF87mDQ8qVakdB0oSPGR2/opxI5t5u5CZjA=;
 b=cahlVVRYw0sTKZd1PnS4H0fXwsD3uJLNe4aNXSh3zZLPx5OrpUjhanSW/lZKlX6oG5dZD7lyW
 PAfccetFzyVCvZ50oqWEnCHNxcdvr2SPb78dJglEIcSXMNmi34om0W5
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Various used symbols are only visible through transitive includes.
These transitive includes are about to go away.

Explicitly include the necessary headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/gettimeofday.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 95df0153f05a..7b3fbae85544 100644
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
2.52.0


