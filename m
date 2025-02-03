Return-Path: <linuxppc-dev+bounces-5788-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E58C0A25C0A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2025 15:16:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YmpTf2XjPz2xLR;
	Tue,  4 Feb 2025 01:16:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738592214;
	cv=none; b=M3RrYerHgzQUjIzMaDoT+xBYQ0sGdlHu4LQfA+oKAX+FMt1KOnmAlQgeZmf9y4cpf5uPak5SDOdrOE3gYUwmyZfkDyoIEyYRMtpy7FR8CV4uFflYlQ9d49B4imDB4FCe1FvLwNaImkn8+iTRBGqenv9dzfFKgwFbgpkyCurH67fMBrVwbBnK0q817NwZoIUoow0OYx0Ss7G+BghXdF433ryBy/VERikVzDLwI8K2KrmMN988GllnVyRul4R5pOPkeYUxSdqGW7DELQ8oyLpfePU0sbUHKrVEkHjpOrzLG5icOaBF70iE67IZZB82ABS6kOGUiI8DAtODpMRJ746epQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738592214; c=relaxed/relaxed;
	bh=VbMY7jhAkRshWc9tky24ybr6eQCno2dqBNRHKZaouzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZsXSnLMNl8XPwPxxTVzh6uuiNE+RqbpFs+Z9bGWFNXTseyJ98aEN4A+neHXKW+5s7FrvfZttmOSTlU75VWsYoERejEPqH+n3DjU3BVlu+tMcoLLCJkCIw7zAs3dhnCLWc+CfrVooxhI9bWhmECCMMfkBgDJ1QYVSszDOq+e6N04YN/c2UBqojSH9XEVOAath/PLvCOIcgvpKboJK47nZbLB/gvsnwxgp1wWL8/nwQfh97rAd50i4R683ZjLxgEy4h6Z3v6KNokhbzRDoybSSkq0I734BSC2ocU+MujleMTzJC0owoLb7L9BSmF9cOUoSiXlCWm2BNhnktwIbufmhZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YqqVGci0; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=WXIsAuM9; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YqqVGci0;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=WXIsAuM9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YmpTc16Lyz2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2025 01:16:51 +1100 (AEDT)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738592206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VbMY7jhAkRshWc9tky24ybr6eQCno2dqBNRHKZaouzc=;
	b=YqqVGci0vNuMDu6dryL1TFq2lf6DnnkuJpqGzKYrMSQ5amO/4iEeohSKC2vVER14hKJfuZ
	XTqxGHdPWTeo5Q0oRyPwZGdK+kA9R7P8Mbfajh1vZ2tfNQrrftyuOFDYVbhtQjLvfYNpnM
	0oGSfeqx/QWXjKufXvXOMl/c2/vUfV7rRUQQxJTzYnguz9lnTGUV1VaQU+N430o11YAz82
	ltanqOdynmh+l8MjZtKSrgWqjYggVYwcgL6JDYmzjxd7pD5/zpA4ZXPA3zDFJp0Lu9aj+r
	nYe50d3btYwB0jzZUU9M+agqLh9hIKeDCAnu0MQEce/DpgKVwCmRhbU76OV8rQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738592206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VbMY7jhAkRshWc9tky24ybr6eQCno2dqBNRHKZaouzc=;
	b=WXIsAuM9UBBOBK8XE8F/E+Of6tdfOZdRK0oMxBxhwbhH9JVP2wEr0ek72jL5VC5ufclzd5
	2OPzuhrMQGTgPuCg==
To: linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Cc: Ben Segall <bsegall@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Mel Gorman <mgorman@suse.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Will Deacon <will@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 5/9] powerpc: Use preempt_model_str().
Date: Mon,  3 Feb 2025 15:16:28 +0100
Message-ID: <20250203141632.440554-6-bigeasy@linutronix.de>
In-Reply-To: <20250203141632.440554-1-bigeasy@linutronix.de>
References: <20250203141632.440554-1-bigeasy@linutronix.de>
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

Use preempt_model_str() instead of manually conducting the preemption
model. Use pr_emerg() instead of printk() to pass a loglevel.

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/powerpc/kernel/traps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index edf5cabe5dfdb..9eb383189cfb2 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -263,10 +263,10 @@ static int __die(const char *str, struct pt_regs *reg=
s, long err)
 {
 	printk("Oops: %s, sig: %ld [#%d]\n", str, err, ++die_counter);
=20
-	printk("%s PAGE_SIZE=3D%luK%s%s%s%s%s%s %s\n",
+	pr_emerg("%s PAGE_SIZE=3D%luK%s %s %s%s%s%s %s\n",
 	       IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) ? "LE" : "BE",
 	       PAGE_SIZE / 1024, get_mmu_str(),
-	       IS_ENABLED(CONFIG_PREEMPT) ? " PREEMPT" : "",
+	       preempt_model_str(),
 	       IS_ENABLED(CONFIG_SMP) ? " SMP" : "",
 	       IS_ENABLED(CONFIG_SMP) ? (" NR_CPUS=3D" __stringify(NR_CPUS)) : "",
 	       debug_pagealloc_enabled() ? " DEBUG_PAGEALLOC" : "",
--=20
2.47.2


