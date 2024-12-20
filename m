Return-Path: <linuxppc-dev+bounces-4358-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0D09F9888
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2024 18:47:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFFHl0VLfz30Wf;
	Sat, 21 Dec 2024 04:47:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734716867;
	cv=none; b=fJ6YYQXNKIVl/Qi1vv+M+aOpeDi3D5njVzF94WGh19yukM3fkRtWVHmUbveswmqEXauYalfM3G7wE/9JrdAY2pvuB26UTULv1Gbn6u1Hs95n/oJDy3bMI3xL5Y1XlkNxr5R51qIKaZgqVMjOHM0loDNnBZXz9OCfy72JvHFb4yevFoI6b+Pb+CgIANOCXZ882z7qeh9gaNzLwzdq/leVWloZy+wNDRxU7xlzMse6YQ4UdRi+SM0bz0Ojed71quH67cKcgexsgwxLky4ADBp3LW4+Y447PlfuaeaavmE006zHEjxWcrbvh3TxyfrC1/6n1PyLAMoH+CrjhUfDR5Ly1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734716867; c=relaxed/relaxed;
	bh=8cOfqq93x0oPQPFrMlSeinUf1WhvLlURcCwn2/B9V34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOdqUdQRqLvomSmWPlE7QB6/fsCAOggo2aUZLCFPwZBNbZwuxD78KTD2BI79tWQOqpi6SINffAJXIPO3KvthTdnuDMB/MfUSs/pc3Sl+4Wq/4DordxjueAz2yDpyXfR8zrUUnxX4u/eE5HN/RuKEKy6r/t/kRWIOd2ji/8I1h2MUHbaABTmGJeF+SQ/26FOqn5zQeXTg6Kg3RoYZyn2Y55eqELWz+hZ7zkZzRTz3YxCDAolT8XVghj0FgWTwGYN9F9B0SGgOBr0LLVET0ggd7ZMdlS1BkXjtP0yV4lLrNjgZtrgTOJcJrvcR12pN0z0qyAYrxqg9kHdZQaoDNFlmTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Dr+7RMQB; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=AZSx8zxz; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Dr+7RMQB;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=AZSx8zxz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFFHk3CKZz30Vw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2024 04:47:46 +1100 (AEDT)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734716864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8cOfqq93x0oPQPFrMlSeinUf1WhvLlURcCwn2/B9V34=;
	b=Dr+7RMQBSI0JHm4g6BniB6jZDFuoF+xofjsoJ8mUEF2oBm+1pGpYluIuQVawxnxclkoWaJ
	+HHeJBPpIxk7UerRguKKBX73oK4rTa/opx2cKh9HdBB6ModF7+KqAqvujSc+c8C7E/GEB2
	2P2Z3sAj93+oQ9J0lHeDlAqnaBLZUnzWVGNB5byDwB7t2xlZvn00gNvuJb8rFdpBjx/nfJ
	nakdz1wMlCaf7VD5ufRxyM5CrLVZAFX5mCYHZEC0nBMOkhCqK6c7JGVPG2qOYxb23Iq8bI
	DxnpERqrc++5KxybwLFKL9NKo0xzTZE/KG4CUYbw2mnFxT7hApBL8P6Z7hhqLQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734716864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8cOfqq93x0oPQPFrMlSeinUf1WhvLlURcCwn2/B9V34=;
	b=AZSx8zxzXWRhcOocsxUzld2ZvnNF5RCFUWhKFiEwKDv3uSi2sPubKCRsLiteienIG1tdMy
	8jLsoA1ckq2ECHCA==
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
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 20/28] powerpc/ftrace: Use RCU in all users of __module_text_address().
Date: Fri, 20 Dec 2024 18:41:34 +0100
Message-ID: <20241220174731.514432-21-bigeasy@linutronix.de>
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

__module_text_address() can be invoked within a RCU section, there is no
requirement to have preemption disabled.

Replace the preempt_disable() section around __module_text_address()
with RCU.

Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-trace-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/powerpc/kernel/trace/ftrace.c       | 6 ++----
 arch/powerpc/kernel/trace/ftrace_64_pg.c | 6 ++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace=
/ftrace.c
index 5ccd791761e8f..558d7f4e4bea6 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -115,10 +115,8 @@ static unsigned long ftrace_lookup_module_stub(unsigne=
d long ip, unsigned long a
 {
 	struct module *mod =3D NULL;
=20
-	preempt_disable();
-	mod =3D __module_text_address(ip);
-	preempt_enable();
-
+	scoped_guard(rcu)
+		mod =3D __module_text_address(ip);
 	if (!mod)
 		pr_err("No module loaded at addr=3D%lx\n", ip);
=20
diff --git a/arch/powerpc/kernel/trace/ftrace_64_pg.c b/arch/powerpc/kernel=
/trace/ftrace_64_pg.c
index 98787376eb87c..531d40f10c8a1 100644
--- a/arch/powerpc/kernel/trace/ftrace_64_pg.c
+++ b/arch/powerpc/kernel/trace/ftrace_64_pg.c
@@ -120,10 +120,8 @@ static struct module *ftrace_lookup_module(struct dyn_=
ftrace *rec)
 {
 	struct module *mod;
=20
-	preempt_disable();
-	mod =3D __module_text_address(rec->ip);
-	preempt_enable();
-
+	scoped_guard(rcu)
+		mod =3D __module_text_address(rec->ip);
 	if (!mod)
 		pr_err("No module loaded at addr=3D%lx\n", rec->ip);
=20
--=20
2.45.2


