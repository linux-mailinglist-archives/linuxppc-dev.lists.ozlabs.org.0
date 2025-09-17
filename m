Return-Path: <linuxppc-dev+bounces-12322-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D573B7FAFD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 16:03:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRgSJ4t3hz3d1B;
	Thu, 18 Sep 2025 00:02:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758117728;
	cv=none; b=n7he4mDUFGtExGKqZfJ4f1FxLjGqF5PUS0cFnUMMhmdy70IjD5DImZhm2Reu6ChZ09wZxO6GjYCcLImQ9dH7x2q4YtrpsHWLMiq/90fhALox4JX5lTCWvs4PWYvY9HXn9HVHszfX7lmNIXj35PgfSapNSK8+ysKRQjM6WyN/zBP/lvbBvlSTurLRCi4FVj1e3QHAaFDyW7JA18lrL7ZU8ihG5XU90DhoDhcLJiXYVsh711ics3jtLABV0k3XpdvwA5w5sxWFQiotBXn75lI7utkAuwWzF+g4NdOb+LWK4T2sUnyzT5cJ+Kiv8sEK9fw7Jdf24aP7i+aO4ZY98Lin/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758117728; c=relaxed/relaxed;
	bh=jsk6BN84ddctbJzCdXpVCW6zIirY84u04vAdSBECnGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JPaq2aykmQGlEZMTdM+uE7q2FgNTITpTafmYzu4oJpnRxcp/l+3qO834QqcSMOaN4ZCGtpnHtm+ZJ/546fA/OJWiMBp2yXHa/t9Rqr9gKtLBSgKWpg/eHyxRwCsTua4rqgkv0wdJIXYO6x2nPtdagzvZVb94eliE/vVtxg+rKrTF5lGnRz6KLsonsRG6ULaA7A97UvKH9ShcOqlx8UefnxFS+3017Z40S+JkZPShCy0tAr6a/AZS5EE5RFQObBFz7CwVazepW0L45a84SW6t/xO10rZPsNBtGKijForoqGbvgQIzV0gLAb4fPTJtca9vYRgecfZ1Acbp1w26rMb/kA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZukeN87k; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=sKh/l4Q5; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZukeN87k;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=sKh/l4Q5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cRgSH1fRsz3clh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 00:02:07 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jsk6BN84ddctbJzCdXpVCW6zIirY84u04vAdSBECnGM=;
	b=ZukeN87klDjExD8slld5JQxyV/SN5xB2qs079PYdGp0wJLbsXzMLa2NocQB9JjhyT1Qz6M
	Nm30pEwq73gINM2HjxuJB5ck7LMh5tGKUQaVlA+qu1j8FYUWlNugQXsj6lvOYR2zQ3kZqo
	+RhBmbp/s5Mj6YmGOGy7k4W4/mL+kfCoHIJJgqRVi1qlfIW6+FpVg3F8k5uDGn7ACWQDX0
	jWaQGoeQPU/8TvXTp2ZlKWewZINW4DsuujVXmsurjEbUkJiSNkh2oYf/xaCnc6tHX4EAje
	CE1mWLgStfHXT0fl9e/My1KvIWZqKJapfA6bkfTENKuIg8KlJ83E1xynqiTSUA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jsk6BN84ddctbJzCdXpVCW6zIirY84u04vAdSBECnGM=;
	b=sKh/l4Q5pNZmlbwlVrzbdI4QMLDx74UYZJgtY7s2cKIHdT+XlzwjmO5fJcvmZI7xYmlwnw
	l2sIdtTl/HLereBw==
Date: Wed, 17 Sep 2025 16:00:14 +0200
Subject: [PATCH v3 12/36] vdso/gettimeofday: Add explicit includes
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
Message-Id: <20250917-vdso-sparc64-generic-2-v3-12-3679b1bc8ee8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=961;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=XAdu9O1IsR5ZCEJ432tM/8+KNLyEAX5iVswP4BPpgzc=;
 b=GJstkDZ6n2VO/zY7O2rPtlwIbGB0r2uPtwC4OBQMHLRU7UPUNDT8gtrr9XEHeVMru9CmuEfk4
 bKqGS+iljNfCChtYcliMmLQIYgpZGLi7bxoeBRHyilzm5FPgq9ygJlf
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


