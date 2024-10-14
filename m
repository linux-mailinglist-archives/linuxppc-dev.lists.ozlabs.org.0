Return-Path: <linuxppc-dev+bounces-2194-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD4999C2FB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 10:22:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRqws5DL9z3blT;
	Mon, 14 Oct 2024 19:22:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728894173;
	cv=none; b=k17XRxEgYOx34+q2oQEouY9ihne1tDew6OCM/6bKOS3xXUjRtPEi27unbNSbpICdatfkgsMCJj+hclyVawctkgX6Bbc/JS9SI0NvOh5LfWdsDCmzK1dOMnkK8Krs/EUbpEDOOPByK+DSeQwmvNpGqabzcxt+sD4Go7B+1l92EHobGunPH7ZGChnSeqzyot/HgfjCrkyByUTU5942i+dOu0Ce9bSSuTBZPAon8T3ZivimA54/aoU+mflikM9f9wzU9Lv7CYy0mYeczF0LmNmOaU2zU4pgnha3kBTCp9fl9Ak9FbTHhtuhoXUxr7FgnGQFTQ6HmaTbxc6N3QuqcOHRKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728894173; c=relaxed/relaxed;
	bh=joTkYfZuYDbUq+yir8wGSuEWOSrlObwkU2FwRn80vkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Suhod3apoz1cftyux5RFbl3b3Knnqkp4pJuIvhlZWt0G0QyaD4uay5cbLFNF0CQmvTwhwMcF2Jg4ZnWoYg6nSKTjtlRBF71uthqqZLR2pDWFUN6jnPMzXnp/sGV+cuivj9WDHJ+x3268vbaN8SzQLNorAAykx7QEQEFIYWcW8Sfbqrryed/cSAo5IeUMCEIZWISU61Fa5n0RAKCMjTDs/1OSQRdeAzTHOyUgRNeInHHVA7tYWSwdBjqfRN6IDbR1SApiJMAlYa96r/Guxjlgf13Us5AVy1T2Jktw+eDoUHnH8ugoCySUdv0lhlcjafBQj9fsH29rqGbYG5wlpORT6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=DBulGqQq; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=3lxr/e1p; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=anna-maria@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=DBulGqQq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=3lxr/e1p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=anna-maria@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRqwr07Hvz3bkp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 19:22:51 +1100 (AEDT)
From: Anna-Maria Behnsen <anna-maria@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728894169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=joTkYfZuYDbUq+yir8wGSuEWOSrlObwkU2FwRn80vkM=;
	b=DBulGqQqivo+HovK0ZWzPaLAfqSi54oj8a/ajqV+NODU3T81A4UvR9G+3PGcGnr8QYePr1
	u+qEbqQorp4wld2ryheKfZFZ5okpBxhBU8/pSpUIBXV4v0Uc0dkK0CBLq8qznnWXObHmwB
	Z+z+ugP/WyxLa36tb1Bz9XsG8IWkRR0yAlVjTfPhF2z1jK4yepBEpyvlo0Tc64eIkFByNv
	lPG9rwh6ABJLelVeDa6yUAF/fx2XuTetyVM63wYoYJmIhu91QqZU8w+uIK34sMtwpjy5wi
	ACHL4Xs4oFcwk/rag0QPSA17e34YPL3PeKGp7TSr4FxUSjDD/NIjN1+pcxic5A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728894169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=joTkYfZuYDbUq+yir8wGSuEWOSrlObwkU2FwRn80vkM=;
	b=3lxr/e1pnS/X0qbMGdQ/8zMBUdws2K1T64ougHTi6Cb7SKyLSEJxZEdvp6X0bQeW/0yMFj
	Ci3sE5nPcdyDdwCg==
Date: Mon, 14 Oct 2024 10:22:30 +0200
Subject: [PATCH v3 13/16] powerpc/rtas: Use fsleep() to minimize additional
 sleep duration
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-devel-anna-maria-b4-timers-flseep-v3-13-dc8b907cb62f@linutronix.de>
References: <20241014-devel-anna-maria-b4-timers-flseep-v3-0-dc8b907cb62f@linutronix.de>
In-Reply-To: <20241014-devel-anna-maria-b4-timers-flseep-v3-0-dc8b907cb62f@linutronix.de>
To: Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, rust-for-linux@vger.kernel.org, 
 Alice Ryhl <aliceryhl@google.com>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Miguel Ojeda <ojeda@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

When commit 38f7b7067dae ("powerpc/rtas: rtas_busy_delay() improvements")
was introduced, documentation about proper usage of sleep related functions
was outdated.

The commit message references the usage of a HZ=100 system. When using a
20ms sleep duration on such a system and therefore using msleep(), the
possible additional slack will be +10ms.

When the system is configured with HZ=100 the granularity of a jiffy and of
a bucket of the lowest timer wheel level is 10ms. To make sure a timer will
not expire early (when queueing of the timer races with an concurrent
update of jiffies), timers are always queued into the next bucket. This is
the reason for the maximal possible slack of 10ms.

fsleep() limits the maximal possible slack to 25% by making threshold
between usleep_range() and msleep() HZ dependent. As soon as the accuracy
of msleep() is sufficient, the less expensive timer list timer based
sleeping function is used instead of the more expensive hrtimer based
usleep_range() function. The udelay() will not be used in this specific
usecase as the lowest sleep length is larger than 1 millisecond.

Use fsleep() directly instead of using an own heuristic for the best
sleeping mechanism to use.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
---
v2: fix typos
---
 arch/powerpc/kernel/rtas.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index f7e86e09c49f..d31c9799cab2 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -1390,21 +1390,14 @@ bool __ref rtas_busy_delay(int status)
 		 */
 		ms = clamp(ms, 1U, 1000U);
 		/*
-		 * The delay hint is an order-of-magnitude suggestion, not
-		 * a minimum. It is fine, possibly even advantageous, for
-		 * us to pause for less time than hinted. For small values,
-		 * use usleep_range() to ensure we don't sleep much longer
-		 * than actually needed.
-		 *
-		 * See Documentation/timers/timers-howto.rst for
-		 * explanation of the threshold used here. In effect we use
-		 * usleep_range() for 9900 and 9901, msleep() for
-		 * 9902-9905.
+		 * The delay hint is an order-of-magnitude suggestion, not a
+		 * minimum. It is fine, possibly even advantageous, for us to
+		 * pause for less time than hinted. To make sure pause time will
+		 * not be way longer than requested independent of HZ
+		 * configuration, use fsleep(). See fsleep() for details of
+		 * used sleeping functions.
 		 */
-		if (ms <= 20)
-			usleep_range(ms * 100, ms * 1000);
-		else
-			msleep(ms);
+		fsleep(ms * 1000);
 		break;
 	case RTAS_BUSY:
 		ret = true;

-- 
2.39.5


