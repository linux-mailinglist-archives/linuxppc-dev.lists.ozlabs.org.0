Return-Path: <linuxppc-dev+bounces-4357-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F559F9887
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2024 18:47:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFFHh6mQbz30WF;
	Sat, 21 Dec 2024 04:47:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734716864;
	cv=none; b=YYaF7SZinn3jWh42u5XUT9wztzRwlgU/AD6XvACfmMjvk77/kw6TI54YCmBW3oNMhnNYfJIUmXhks1JNN1hxDBVAKblkIYJY1yLPm7ExI/iO/xIZGr67wrPPyxLjzsBRva3MixD6nFj0m6HM4CQ8iuHmn/6CGaci7xJ0xis1kl6Zv8+0ji5NXbpqBOnDO9DEexMflYp0hdXsmLG5h+4HZOkBlJsu9q6GQ6xccmm2a9borNWW9SrRswwhvoepQFiJXT8o4Ue8BCODr9MSOP91HouZhNR/Wt4xTiqpv5Fn5e+xtIJKzIqR9v2/lwIaqDVLJtYmxW3xButJYuyRygABzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734716864; c=relaxed/relaxed;
	bh=mUoDDG+l47O3+vMUk6eVXEzXq+1GxAnfmkZBqPU3miY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RjuMBzhZF6J+7s/EMLFzQs8PlMemEJ8mbUh8tiq6Y0N7pH0Anbz1t7uD7APPoeJH5+qskJFCOLuz7p0Q81KXeIGBGOqa0ucW2bKoaBi2361nJY5rvE+8M9yLBzqyXq8RLdqDA7VHLm0ZPagD+9UkXsfosUBnH3fNJ/JcVerr9rYX5xvad2RxQhtATbpQePCBiVdbCTfGESXnkrx9ZDSPrr4wKqLit2wWArg2JMuQYdyS9+IgRcGDoVISOX13AzziUZ27e46GMTCjSySqHyvimir2QCfv84vd8w4unDUyqWUs4Dnw2wtCiwWYxtRiCWHYkmY7WMzAsBEky3xLc54R3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=VeWM7rW9; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fMKoUaee; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=VeWM7rW9;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fMKoUaee;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFFHg0pfcz30Vw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2024 04:47:43 +1100 (AEDT)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734716856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mUoDDG+l47O3+vMUk6eVXEzXq+1GxAnfmkZBqPU3miY=;
	b=VeWM7rW9QXtAMWnHN9WczxUc8haDbC9szTWTTWi1ntBBobpSJCm6AvixLsi5EK9Lb380y8
	DFoFOB2i/diTlb5SXTH0+m1Wlqc9IjtX8EoJS1rBn2USkwu4mu2n8vuE3/jiiJB7cdoduG
	TjWlcB+QEr4ItWUiSJRLYi4VFU0XIT+sqTD3S9y+cXGZsQXoUn00OpnHyu8sar4TZ6fP6M
	j+E+ywk+liYExCeT679qnQyqlvXwtPE+QReVRbAOtglXDepHRwYhlH/v0MGxTlhLugx3CM
	vK/9c7WIDzTJ7RdlYOS1YK0LaRXplkCsVPKsovr6ZYWZOLU5kMGbIJD6Cq4T4w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734716856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mUoDDG+l47O3+vMUk6eVXEzXq+1GxAnfmkZBqPU3miY=;
	b=fMKoUaee6BrFn2ilOUvKtZTzJ99Gmt55PbVZODBJtohd+3QWbGix3h5CEtsqB532rftSSe
	IAum2v4ago/eu3CA==
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
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 01/28] module: Extend the preempt disabled section in dereference_symbol_descriptor().
Date: Fri, 20 Dec 2024 18:41:15 +0100
Message-ID: <20241220174731.514432-2-bigeasy@linutronix.de>
In-Reply-To: <20241220174731.514432-1-bigeasy@linutronix.de>
References: <20241220174731.514432-1-bigeasy@linutronix.de>
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
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
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
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Helge Deller <deller@gmx.de>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
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
2.45.2


