Return-Path: <linuxppc-dev+bounces-6629-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68945A4BDAF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 12:12:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5x2h0C3Vz3bqW;
	Mon,  3 Mar 2025 22:11:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741000283;
	cv=none; b=dfK3YtPN8iG7K2NXm99UmGu+KKGmb09oI/Tlbe+mpIyTaJAzOthRBpSuxuSvLaa4UNOVp1aRELcT7oYGZJxAx+EslQqV/enHgE8mPVADXIUgpngRRqOjhaePp5r0a4KnQ9MuHw/G+1+kMaDX4ZMggSAAZQvmi3IMIDQKjrsafQTJdPRBSK1GJZUlIMtT1wNGrdcYoO93b1XHfMqgmdv+wGIlgbEFOqWGH/1U+m4slHx4SqlPTupPnwEkoRaurhw3Ut/FLekQx9kXjaNL28mbjFyOI3E0WnfXLnSUAf2jbGJdo28Cl0vJ09rj0fxtX8UNZnlnTfBFVsWBpU5iAnYHfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741000283; c=relaxed/relaxed;
	bh=UUFxaeOa8MxkhoOaa265B/ccj1bobA8YN971cVAYoCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SDUa0gfxyED+1V9OVjMYjHOXGhbOSw/TbUaAOF4wG6s06AfSX7/y7XNbwtC+PSSlrxTg0+vBJn3hsY8nKU1l5INlqAlgKdjbIes1ZKOHZ9b10EM7SrpQYklSg7YG0bt6QOgB3vdTEdDHv2d2AgdEhgEyiP8E6R5uhV7cZrNZ7WpZ6FffXap9YzwBhg5eDrmXLsy2vk6zfRlpLd5SIz12nZn8BaMhzoIrDmc87vUIvpZFwHKbg/ou9myov9o8DmXcqW8sIBufQygUnJoFKHc6A+kJTOiUvSUfiHMiyY5Fom41J+HoIghYyx4L37fn/HAxNA5rYqIi71YQ+7bdqTswIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Y5uWwxgC; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=txGhQuO8; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Y5uWwxgC;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=txGhQuO8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4Z5x2g2GY2z30dt
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 22:11:23 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UUFxaeOa8MxkhoOaa265B/ccj1bobA8YN971cVAYoCE=;
	b=Y5uWwxgCwKEcrzJAENfdOv9giYLmvYx0m8BkwnRw3rjkGWNDqwO1mi2jZBcU076us9cfpe
	NlIJ+nVEMz8yi0rHBd2d+N1S4xFgN9job+iswQJ+t+uhFMk8qoKYgI0iSixGv80eQRpXZJ
	T36BOlunSnevhikVuciu604kS6m0N/R5WbRALLYbB5QZOKmvkFiWAkJh7ziL6RjXpn1LI0
	NPQ9hz2VV6MqBqjoTxM8BFjYhcUmtPMQBsqvXjWlP8lFjQvInRUewL3iTuYV8Nn0z8aVSp
	FH8tcof86vHWIUGIYK9ADtOe7Q/94P1alvifw6OqsiOaWgUFrp7XuzLhxC0M7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UUFxaeOa8MxkhoOaa265B/ccj1bobA8YN971cVAYoCE=;
	b=txGhQuO8g6BysurNHcVyDXbTp4j02hmRD4DuL7Zh74mFtq1/JxyrjKsLn/OMUI10Pa7IKC
	QoVL79GgITZAauCg==
Date: Mon, 03 Mar 2025 12:11:18 +0100
Subject: [PATCH 16/19] arm64/vdso: Prepare introduction of struct
 vdso_clock
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
Message-Id: <20250303-vdso-clock-v1-16-c1b5c69a166f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=1512;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=L7kK/MCZMD7r1X/TTNdxBJdzqOQW5bJywl2DJquziWk=;
 b=fJgzjZCc5WkxvrFlLjxD+BfXszci8Y3cDqbkKCkbvF2kHXyYJjhzAfWZAte2yMP84uv4/uX+e
 gS1QU3HJXulDpcBrLb18rkXvBchGsQOAZLb+5338gjRvJQush6GNM2G
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Nam Cao <namcao@linutronix.de>

To support multiple PTP clocks, the VDSO data structure needs to be
reworked. All clock specific data will end up in struct vdso_clock and in
struct vdso_time_data there will be array of it. By now, vdso_clock is
simply a define which maps vdso_clock to vdso_time_data.

To prepare for the rework of the data structures, replace the struct
vdso_time_data pointer with struct vdso_clock pointer whenever applicable.

No functional change.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/include/asm/vdso/compat_gettimeofday.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/vdso/compat_gettimeofday.h b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
index 957ee12fcc54bd7f978fbcd8945bce62327b037a..2c6b90d26bc8fd6d4be87bf6a4178472581f56d3 100644
--- a/arch/arm64/include/asm/vdso/compat_gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
@@ -155,9 +155,9 @@ static __always_inline const struct vdso_time_data *__arch_get_vdso_u_time_data(
 }
 #define __arch_get_vdso_u_time_data __arch_get_vdso_u_time_data
 
-static inline bool vdso_clocksource_ok(const struct vdso_time_data *vd)
+static inline bool vdso_clocksource_ok(const struct vdso_clock *vc)
 {
-	return vd->clock_mode == VDSO_CLOCKMODE_ARCHTIMER;
+	return vc->clock_mode == VDSO_CLOCKMODE_ARCHTIMER;
 }
 #define vdso_clocksource_ok	vdso_clocksource_ok
 

-- 
2.48.1


