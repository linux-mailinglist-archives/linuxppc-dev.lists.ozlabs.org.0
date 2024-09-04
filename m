Return-Path: <linuxppc-dev+bounces-1012-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F80496CA41
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 00:24:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzcVW3tKRz2xqp;
	Thu,  5 Sep 2024 08:24:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725455686;
	cv=none; b=gaeOvHstNyI32KNpYqEby1XbNtekVH28b2Wm/2SivUrHCfN86441NEnIScXVChZjjeIdtg53LCB6Kt59R6oUO0lR8xiO8GxZhyvyY+x+SQPK8maxqm+w9lS6jwFD67vuybjRrrxbQdjdg0H6HQHEpU6/opGtAibodI2jOKW8uHvMKhrbHRqGq9x7ked6SMq/H9SJliDeCedsZBQfWgcvmeyMwnTna6XbbI5u+hZCrSwtN2pbtCEEVY/BTN9tS19LUOffNamj2n4WFGBX3nDoCNWJZ/8ocgMSpuuF9uugEX58p9BZ5ApMaEGdpWWlXFQc0hocMO97RE4G+oPaBlTOlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725455686; c=relaxed/relaxed;
	bh=w1hgFVgMLZ521/p+E0dyRVQl2rbyAAPZ0ir+q/NjJSQ=;
	h=From:DKIM-Signature:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc; b=TNfAIDgd1GKFtRIJR2fo6rxT4/P+jTUa+Fvpfb/RzZhr4fR4spVyGLvR09WW1ebooDcvK09qgeFhBoTVNKUsHu/XKU5U2Bj2JrdDWxMeX0+ArU5pr/C7iSt/Qhcx/9sAevpPWuXFDFqRUywwoPJdwYBX1XPmAp09ybvGX12bOsFmwaJETrKwM7/blmz5DgWez/pXciyLALu0oe9wu2+wQ0dyEasZQDM57708QBiuz7OO437f0MXxXIL1CY7MRS4IVwPDHBV5oYNssdn3eQecWAcuzQd0wKe+M0ToJgpKC9qqe30J9mRsICuhHjJdckJcQ0aFa+tdAvGahjsXG/pPnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=z4P3q5Oy; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=eF3O2ZUl; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=anna-maria@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=z4P3q5Oy;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=eF3O2ZUl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=anna-maria@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 548 seconds by postgrey-1.37 at boromir; Wed, 04 Sep 2024 23:14:45 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzNJ54WZkz2y8V
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 23:14:45 +1000 (AEST)
From: Anna-Maria Behnsen <anna-maria@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1725455139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w1hgFVgMLZ521/p+E0dyRVQl2rbyAAPZ0ir+q/NjJSQ=;
	b=z4P3q5OyzPM2OPXYhZTZDs8f4jcuLXx0cBv0nAd6tj54uuDk226NFzqzGYYv+cEf0yNFBv
	2yhEQ5zKBeqeI5WD6+FlldipAPRUQP1Tmuov+v3qNMInz2MxJ459rZB+gmeNHDywYlsJT8
	9XV+cy/iLbLzw/cls81OoMpxQog7EZK0iwd9G8h7Rm38JJwMa028TjJbIpOStnZg1QEDjo
	UzOoayLQcd8JfBUUPQNFdeFMgkjaiE1ibKLtRbUxKtDvMJIKv1HXyldBidorvuDun5piZd
	DFE0s/9jqzZQqXHkluJ2HLAgz3rW0R519TeZ1t6lFHKo9US3BOcDTNRKRtaWpw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1725455139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w1hgFVgMLZ521/p+E0dyRVQl2rbyAAPZ0ir+q/NjJSQ=;
	b=eF3O2ZUlBaIyY4KkXmRltcDq2SpPujm++XqPS46DXxIeh832EzE2Ujm17IhwcLC8u0Sq7Q
	4OVnhvqKgszJr8Aw==
Date: Wed, 04 Sep 2024 15:05:03 +0200
Subject: [PATCH 13/15] powerpc/rtas: Use fsleep() to minimize additional
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
Message-Id: <20240904-devel-anna-maria-b4-timers-flseep-v1-13-e98760256370@linutronix.de>
References: <20240904-devel-anna-maria-b4-timers-flseep-v1-0-e98760256370@linutronix.de>
In-Reply-To: <20240904-devel-anna-maria-b4-timers-flseep-v1-0-e98760256370@linutronix.de>
To: Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nathan Lynch <nathanl@linux.ibm.com>, 
 linuxppc-dev@lists.ozlabs.org

When commit 38f7b7067dae ("powerpc/rtas: rtas_busy_delay() improvements")
was introduced, documentation about proper usage of sleep realted functions
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
usecase as the lowest sleep length is larger than 1 microsecond.

Use fsleep() directly instead of using an own heuristic for the best
sleeping mechanism to use..

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
---
 arch/powerpc/kernel/rtas.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index f7e86e09c49f..0794ca28e51e 100644
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
+		 * not be a way longer than requested independent of HZ
+		 * configuration, use fsleep(). See fsleep() for detailes of
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
2.39.2


