Return-Path: <linuxppc-dev+bounces-6125-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE11CA32749
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2025 14:41:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtKGq6q5Mz30Tc;
	Thu, 13 Feb 2025 00:41:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739367699;
	cv=none; b=VBcsMhhOfcVtPAHTcCaKcLOeDpe4K5ixShtIwL33u2xjmNRstm9pfwWCTIHgDwJiNToOTUgBVc7HNScrsrWTQFBFFECkvW4C3Oq1bhI5bWPWtrShsRDKuyJKQLxO04Z5e/cO/hrQvFvvBslFDmLOCjCMwMhi7UdD9r3xZXoIcZoJ+AAI7cHqGQwRciMRu7jNVFR6gzjx5bvaCw7deMeU6/rkRIIgyW4jtmCHbzx5stWQXlnKG+Acu81Y5RfUeIYIZY6WF5ZmP3cWC0kizdkU+LHFx3lUZR8jxnswRc3/Vtuu8iePyT+j/C4bKubB68Xmxh7nOhmqdsdm3edQKlBwMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739367699; c=relaxed/relaxed;
	bh=3UThOL2xYE+zlzWKKbLr4gFZbbNJ4JtHESm/nz/q22I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AcYv/KI4+X9GZCg8Ffgpn/3Udo3UQdIrfuP3QB1xWQ+ZW1IT4dJZliqZeqH9fHWe3WXeP6aqhauegWIxwEhZfe1zyzEyisstwQHOxFC3qkR1zmDK8RiL2BMmFEbRxsMiKG836wmQTKsbjVdqZZJdwSVQlL1gP+bYWWnAYfsQQanUfMjtCkkyXSnuIt2OqU+UsvjgB1w+og6qTLb5oyCrbPnsTARwuD6HYpG0b30cZGtweZ1Mg1DIjW0dCcvCUatSdUnXPkWN25tJGo5zEdw6RrETpeQVPeL8MSr8mvWoth0V6ju5tadQyrDC991UmHsSCuubC+KSRJWC/5CYoPJ+zw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ClgnAgOZ; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=SBDRBFY+; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ClgnAgOZ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=SBDRBFY+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YtKGp4T3vz3028
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2025 00:41:38 +1100 (AEDT)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739367692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3UThOL2xYE+zlzWKKbLr4gFZbbNJ4JtHESm/nz/q22I=;
	b=ClgnAgOZluayAnyB1UFLyha7NkY/8Mup3O1sS5jxHsgEgI+EXcNWVNEFnTW8ipslVJ9V4g
	sez1j6BHSwZ03MAQ9291zpHbgPOhlY0WLGjHepKEi/H5N5XjPLM9eL7D/fl34VKk6MRYcE
	IixQeOXYjmcR1aq8AqmDWkpbZIQ4qU7z5/+0TtHHtApqe0CDiEfnliWHiNtuojj+gTMFOZ
	84aCeUpDVvs8EJDUEciHgTZNTQtgBznqoVXriqqzNMu8haecIZUyjESCQno5DR6ceVmPzP
	NEhCd/Dtk5OJk6/VryLR1LemY2WHDUPlVwPCf967NhfY7tMgI2ftWcBXswVUQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739367692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3UThOL2xYE+zlzWKKbLr4gFZbbNJ4JtHESm/nz/q22I=;
	b=SBDRBFY+144Mej09EoKLZ3XsRcwvkY47/cRyDcOBUWC8W36fRvd+UQGzh6/eCyHkEKe5X0
	Py4nbbrIcdpEKgBg==
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
Subject: [PATCH v3 5/9] powerpc: Rely on generic printing of preemption model.
Date: Wed, 12 Feb 2025 14:41:11 +0100
Message-ID: <20250212134115.2583667-6-bigeasy@linutronix.de>
In-Reply-To: <20250212134115.2583667-1-bigeasy@linutronix.de>
References: <20250212134115.2583667-1-bigeasy@linutronix.de>
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


