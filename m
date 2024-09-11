Return-Path: <linuxppc-dev+bounces-1232-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D28D8974986
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 07:14:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3TJB3FS2z2yZ1;
	Wed, 11 Sep 2024 15:14:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726031642;
	cv=none; b=UMYBEQHR3ZLrhE3ip194VI3sgXxwI90NnDr8ELDZD2BsNtJfmoYirj857RgicpI7fdQqYhjM5rJH66aY3mdM0BYHfe1EYk4uSc2GmObnGtqwJ+elAKipwhB82cfwpVhFXmRM98fA8pjnlkAUx6Hmi2jYGEqAbTqPuv/NQFe3QgpsJoPxZZDeD0CffyTDmhSyc3QafpuTZdVlHOVJsEkV7hPdFb4THskUqLdrPsUM36BgqznRQm8XX/SF1UJAH+kkotkbWIqMxeuoVgy8VjviD2m/jpiIy7N0ahBUfJ3QI81MvXhVafXxp6jI0e8lf/oJIdZe5fIY2mFhLsZ1XbHwIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726031642; c=relaxed/relaxed;
	bh=TYHTnWg90GO/Adzm/xlNmVzdNdsY7txrgGU6OMGh5ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sd4Ge7FC94CHMZQFVfY1mVuYIoda4CH0VLb46j/P6s59fOBMqN3m1Y8/Lq4XH6oR/2PTMCvafCqctPMlmpirF+NH07KvbJecmWPllWZUdJQMJlfP8fIoFryRDeNM4Ca8TCzK5+VJIGz3Kf4m5Y4tG7mEg5auecvzQ5YeYTUBWOxxEJR2CpmbYMP6cs8l6J9OU8jTM/Qn/AeTJ8jnaUYq1eGRgo0/TCd1/WG1Zf+fxXejrgvvsOolTTxCMsPYO8pk6b9HyKxDrJaWRspiVoB74lemS0LKDmsfDATWUofFCsJNKqDu+ZyWviYKx+KipyqichnJU0qwD58A23hL9Z/9WA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=UiR2NcsA; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Rnjh4EVK; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=anna-maria@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=UiR2NcsA;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Rnjh4EVK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=anna-maria@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3TJB14qJz2y72
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 15:14:02 +1000 (AEST)
From: Anna-Maria Behnsen <anna-maria@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1726031635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TYHTnWg90GO/Adzm/xlNmVzdNdsY7txrgGU6OMGh5ag=;
	b=UiR2NcsAC9i4ZW/0yyfeerjtAB84C6rxBP2AjJVghd8Zc693ibg0t0LPO124a/gcvvy1jT
	cyvc7nAZO/r7Q1P9n7Az6s9X3LcCho5bRI78pKX454ysg4y40GcE6ot9vfcAcFsOMUKWBu
	l+tyUqRBZhBr9fGWBpRQIWJh19Rt7e4+LdWtLn/E6nCOZPw0wHDnHIIXmwC5nPxMg4e04o
	QposPh3H05412DmD3/6zKTCN22un+RbJIB25KF3mojgSZtQsDn0SM4Y7asD3X7/6+27Qew
	r+IbqEd79alZ3uJPVvLLR08KqnBM1xAUWTkjNgWphUHgdrL9UqfYgktI0fVNmg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1726031635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TYHTnWg90GO/Adzm/xlNmVzdNdsY7txrgGU6OMGh5ag=;
	b=Rnjh4EVKzBewiHVfpCXtDI+g14W3w20GvMd+olwoEufskS5lpV/SML3o+WmsePJPn74JmH
	aZ6OOfeBk4eyPSBw==
Date: Wed, 11 Sep 2024 07:13:39 +0200
Subject: [PATCH v2 13/15] powerpc/rtas: Use fsleep() to minimize additional
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
Message-Id: <20240911-devel-anna-maria-b4-timers-flseep-v2-13-b0d3f33ccfe0@linutronix.de>
References: <20240911-devel-anna-maria-b4-timers-flseep-v2-0-b0d3f33ccfe0@linutronix.de>
In-Reply-To: <20240911-devel-anna-maria-b4-timers-flseep-v2-0-b0d3f33ccfe0@linutronix.de>
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
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
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
2.39.2


