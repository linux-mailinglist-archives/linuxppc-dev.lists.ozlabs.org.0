Return-Path: <linuxppc-dev+bounces-4823-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 792F6A0561E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 10:05:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YShpM6BX6z30WJ;
	Wed,  8 Jan 2025 20:05:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736327131;
	cv=none; b=Eq8ILm/F4tv7Sur672vzds6kiCZCvaAjAHVEYXVB/y9kzzRbiNHjj79qaady6svl+/1PX+P+Q2RNAVakcvKKyRZs2BLAWoXWlVMd+baJ9ZVQPHMGk/u60bUgBTk0d334iB/4/9IT237Am8w6pzjyciv5idyTb3pPKd0AVOKZHUXZ7B9n1yUpPvfUAtdrvQca40n6yyshWiCmHZ9vGb6it2UE4JOqV4+Alzbiq57wzrxvBnZNbIe4ug6yqzltWT9ek1mzVVuYl1k6k18E6gh+QCQU1iPWd8yprEJy9AYdf7R3kuyvufF1Va1KwXJRYzFth4OwR6CGDdjKnYygWjcLiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736327131; c=relaxed/relaxed;
	bh=PPE2aj8MMacLBet/cFcEFX/RuW9ep+ZbC89Owtm7YeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ne4JC5VSLKG6NHS+nWPrYGyqb+sDOcg4FBtprQG26eu0E2tmrat5xHzw5M1Pm1lPGzjYcogrZ90r/UV7kQfbrjXW0OR1E7MvFjHk3jgt11Z6j7hcFIKNZGg6ErT32Mb+l12W7qMCzKuYznMZ0fV9ZDp6YthYYtkr8GMkHLIuAKYS3yYFDSw+6xgUt9GxJC4k9P1hyHr0Qrk/tqWdlIlzq/GmUtbytRz702nCXQ5ZH9MIBG+9ZbcOgBo8xRFnbYpqp3wOVjwcHQxMfh272+58d84rq3A1uBeDg43pGD/poQ1SZWriulh0ojxwTwevtbf1c3N/B5pyeTHzR6yPKYyqNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=fbL7PaM/; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=OSBg5lXo; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=fbL7PaM/;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=OSBg5lXo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YShpM131xz30CL
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 20:05:31 +1100 (AEDT)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736327114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PPE2aj8MMacLBet/cFcEFX/RuW9ep+ZbC89Owtm7YeQ=;
	b=fbL7PaM/jGm3qxpDrkSd+OOV7zI9CCrWhK14XQQj/sTBnt5P0YQD0RVra8HFOMFBUfOQ9o
	ZeiwMHWOi5LYUi7Di9bJgMSxMDCUW3fiwPp2judcLdfWVK23tgF678cOtYn+yVpFoN/Gms
	I7BHOMfWvtyv1WlXNjtgE8b3v2b2o9BAuH01E+17hUdm4tCDN7jwTWbpwetE+wKsYlEJdN
	v2tTEdls+9oQiny3wsLcc02lP+uZFcluG4fQMCkxJSTbRWtzCVikVgqv3E6qJmVBwzPuLc
	MgGtp/snz9ICbfa9JSaVWBETsCxx7ltqjFwZ1mEtKO1dTNwu9FmqvY5nz50DLA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736327114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PPE2aj8MMacLBet/cFcEFX/RuW9ep+ZbC89Owtm7YeQ=;
	b=OSBg5lXo+ufWWbp8J7i4SouYnhWhb4+QsBz5t/KMyFqT4Mz+2/cdk9gWc2IFkA4tH5UwY5
	s+fGjtoLVNIUGsAg==
To: linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Daniel Gomez <da.gomez@samsung.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v3 01/28] module: Extend the preempt disabled section in dereference_symbol_descriptor().
Date: Wed,  8 Jan 2025 10:04:30 +0100
Message-ID: <20250108090457.512198-2-bigeasy@linutronix.de>
In-Reply-To: <20250108090457.512198-1-bigeasy@linutronix.de>
References: <20250108090457.512198-1-bigeasy@linutronix.de>
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
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

dereference_symbol_descriptor() needs to obtain the module pointer
belonging to pointer in order to resolve that pointer.
The returned mod pointer is obtained under RCU-sched/ preempt_disable()
guarantees and needs to be used within this section to ensure that the
module is not removed in the meantime.

Extend the preempt_disable() section to also cover
dereference_module_function_descriptor().

Fixes: 04b8eb7a4ccd9 ("symbol lookup: introduce dereference_symbol_descript=
or()")
Cc: James E.J. Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Helge Deller <deller@gmx.de>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 include/linux/kallsyms.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
index c3f075e8f60cb..1c6a6c1704d8d 100644
--- a/include/linux/kallsyms.h
+++ b/include/linux/kallsyms.h
@@ -57,10 +57,10 @@ static inline void *dereference_symbol_descriptor(void =
*ptr)
=20
 	preempt_disable();
 	mod =3D __module_address((unsigned long)ptr);
-	preempt_enable();
=20
 	if (mod)
 		ptr =3D dereference_module_function_descriptor(mod, ptr);
+	preempt_enable();
 #endif
 	return ptr;
 }
--=20
2.47.1


