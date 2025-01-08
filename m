Return-Path: <linuxppc-dev+bounces-4822-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41550A0561C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 10:05:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YShpL4zBJz30PF;
	Wed,  8 Jan 2025 20:05:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736327130;
	cv=none; b=JFmHO9eChrZtjtnb5U6BxehK/w3Bmz4C9bCrGTsI2pvtcIN5eyZvdbb67DTMrfg159fuTEhan4qO0U5Mu6BXfcpPPCo5RY9u0T4Ya6FBkY8hrNlYEBDQyAta25x/z6f7nQcTf6rxPFbbQx8eVCHEW2uOQNiS/griceTYaqul5Uv+j6qzWc98KKHrcrUxX2NLvaCJhMXnz/0yH4f1ZVI8ko/+qIJerCE73eREx7FzUHIf79+DRhOACGyVDa+WUHpq9iG8PT36+nB7oiJQpVjkteCZn3HMNRkeFibYpsBnS2Mo/hhfN53VxviCW+C1kkvSVl6PByDC5gHAG8AKTIkMjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736327130; c=relaxed/relaxed;
	bh=rwBYB6GDGtwSo0ZVmHQeUUNLy015tLjU3w/e5JgGy/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GhiBQyxBTFcItvCRRzpvornnDz1TbVERGCfatwBAIhyfyymec3/9VWLhlauhDg24ZKCn/TN7N+7gJU6EvXtPQaXWNZ7w9G26nhzTrW0U68mThxScVTlsNig4GSgolN6ZjeBl/nORbdr0U3CWkaY35+9LI64+BYabP2vvSI4gBQLBzQ1D+K0EMiUxvbpHaN9R/quQRn+GHL92tioqGPDjY4ncwJLFDgPBP0Xw0AGmr+uSo9sncBAK1mX2lotEEcHF7zfaQLi7MVZ7sMpa8CTiIokVh57tVD3lubtynNJFg6dJ8KyytAA/M2k18ykJwXKA7x8rSURuLI++wyoELoiJuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=LEApxjYZ; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=dKYJumFF; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=LEApxjYZ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=dKYJumFF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YShpJ2qw9z30CL
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 20:05:28 +1100 (AEDT)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736327122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rwBYB6GDGtwSo0ZVmHQeUUNLy015tLjU3w/e5JgGy/c=;
	b=LEApxjYZTkhUm30+CjLuvcHX5E2bkNJXnvyUNg8o7S/Fx61HuGetUOphWXxK7KkRlZqXpf
	HIajKikSPhM8iYZN10EyVeaIzc72/iuTnHo0mHHluGSqAyHpEEYIRDomEhG9ucd0bA5QNe
	mRPhhSVD5Mw3kKlEi3iLDkgTEd9R0q6Yh3r6PhO3zt9soyTkYfj7cbuQJvgsCtqdXTTnlw
	ziHMU5S1znSAkYMIhcFJfJmVQN6bapUF4Om3FT+TXqop0bh27OgxrqxKTt84hR6nd7BVvF
	tLQEVolIS16851bhceciMfsJOItqvtrr+VnjFSLqFCRl5W7HJYyANETR5/2Arw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736327122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rwBYB6GDGtwSo0ZVmHQeUUNLy015tLjU3w/e5JgGy/c=;
	b=dKYJumFF1zyEaO2G91SGXq3IYr7DTmPO/R3ooBrOdSFGUIexbJ7PDdRkr4PzJr+nPMoUvE
	ybGJf41RElFb2sDA==
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
Subject: [PATCH v3 20/28] powerpc/ftrace: Use RCU in all users of __module_text_address().
Date: Wed,  8 Jan 2025 10:04:49 +0100
Message-ID: <20250108090457.512198-21-bigeasy@linutronix.de>
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
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
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
2.47.1


