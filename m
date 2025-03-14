Return-Path: <linuxppc-dev+bounces-7074-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B889A615D2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 17:08:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDq6Q4BjRz3cWN;
	Sat, 15 Mar 2025 03:08:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741968510;
	cv=none; b=lxYi+ThdrMuLC/oa+AkX7qRn0fNZpPgRsK7Or98W/wPi1n/voOu0MXpVf9xo8tVigXcwR4fwl2q2iSnCX+9T4ZxRtKr1nMMUZuVwdtTDdnj7VUCtKwmC8U7raphx+4r+jHEOkYM2ADu54/sGac6UNMtnrCQXO3BJc0lbiQs4WI+piaJ/Z3s2mgWm3aLtYCMN/vLpH3I3T8oFeHGGt3f9ckLDyYkVQ19ThJRA34SHbRDQn1X+XArXjHCj6K1jNPsD4MUhzegTGLNLi175C69bsbEIjX5ZcPRdvsjC8zyvG9tq7087CI40+bg96hWdFLbF6mmEyvP/J0uGpLJqHk5XGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741968510; c=relaxed/relaxed;
	bh=3UThOL2xYE+zlzWKKbLr4gFZbbNJ4JtHESm/nz/q22I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IHvqsC8TLlXaBJPaDgQpi/KYLWFmgbL+3YIK0kg7gQNsYtIpl+YDmi+MdSMSjDCoHl2cCHqhNsVhPNgHTB4dO7LrGR5qlRGb2OmmKIr9WUvs7cJ2otlHfrYlymNCSusdWOu9BEhbk9Thr1Zn7S6ZT7LON/GFq4jgALPttuJVlBRuufIN92p9rVs0cmfs7JRX2adMkun7gkF2uVrS2jY8/PtKze8XuJn9Gwn9IsuJD/lMCKdRxMAOGX7tk6/MFPUlHdmhRBbC8pLK3NiNas1N3gJCqDrO1vpqtOke++GTvwzsJrYZpv6d48YVQConxgNML8vaARKXo1kCDbbW2NepTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=oUvGicU9; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=BKlii9JD; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=oUvGicU9;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=BKlii9JD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDq6P1JKrz30Nl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 03:08:29 +1100 (AEDT)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741968496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3UThOL2xYE+zlzWKKbLr4gFZbbNJ4JtHESm/nz/q22I=;
	b=oUvGicU9EzvDhQw6mwbX6KaWnwK85wGS1FqPabwF0NiVNPAIGHBx6LELfdu02mi4glujPm
	eolrnSGgQ7aoFzpdUkQwS/VN7Z25xOGvggToNLYhR4YEbuA79BU1D6PJmqtvGRmQFVIQ4e
	LKc6i51kdpZoP7fAFIAVgUFuP3VWMPZNe+kYoW+wgNifmq+7kYeS/QrCTEQpoEiilZ+f68
	QEW3WPnuOpiZRyh2NDsyzdZkWTyOmlUTXwr6cgEBqNEDeYV80+HVhajnFj4dZJTcZoNqX1
	DTsK2A1xouiZfunNcBz5zevTeJ9P3GY+g7sgstTKzqY8P8plPZurQeeQC1Sw9A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741968496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3UThOL2xYE+zlzWKKbLr4gFZbbNJ4JtHESm/nz/q22I=;
	b=BKlii9JDzCL1dJehRa3nId7N9nVNEeOzD6QG3T8tFCBuRpP4qdEZBdFXR1kby22VnhG37q
	NXHPULtxuG4UCeBQ==
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
Subject: [PATCH v4 5/9] powerpc: Rely on generic printing of preemption model.
Date: Fri, 14 Mar 2025 17:08:06 +0100
Message-ID: <20250314160810.2373416-6-bigeasy@linutronix.de>
In-Reply-To: <20250314160810.2373416-1-bigeasy@linutronix.de>
References: <20250314160810.2373416-1-bigeasy@linutronix.de>
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

After the first printk in __die() there is show_regs() ->
show_regs_print_info() which prints the current
preemption model.

Remove the preempion model from the arch code.

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/powerpc/kernel/traps.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index edf5cabe5dfdb..cb8e9357383e9 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -263,10 +263,9 @@ static int __die(const char *str, struct pt_regs *regs=
, long err)
 {
 	printk("Oops: %s, sig: %ld [#%d]\n", str, err, ++die_counter);
=20
-	printk("%s PAGE_SIZE=3D%luK%s%s%s%s%s%s %s\n",
+	printk("%s PAGE_SIZE=3D%luK%s %s%s%s%s %s\n",
 	       IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) ? "LE" : "BE",
 	       PAGE_SIZE / 1024, get_mmu_str(),
-	       IS_ENABLED(CONFIG_PREEMPT) ? " PREEMPT" : "",
 	       IS_ENABLED(CONFIG_SMP) ? " SMP" : "",
 	       IS_ENABLED(CONFIG_SMP) ? (" NR_CPUS=3D" __stringify(NR_CPUS)) : "",
 	       debug_pagealloc_enabled() ? " DEBUG_PAGEALLOC" : "",
--=20
2.47.2


