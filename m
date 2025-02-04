Return-Path: <linuxppc-dev+bounces-5799-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E91A26D32
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2025 09:22:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YnGZJ1cCYz2yk7;
	Tue,  4 Feb 2025 19:22:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738657352;
	cv=none; b=Ehn0fOeXrQN82dpVDUP09AyKmIdPSpaZ/1lO5sW7wiDRGyGuUcD8T2N666yWH4PW6vv4VQCEiULXFcigdDOwinS4vHp7C10wM9Nf9PWinVCb2Z5Prrs3Nq2VC2OSpY/jjDTrjifYLua2Blf1DifYJpIgr8+xZdjN6Tl/LYC7YtHscKaJM4bO/8z0vVKqWDXix2gOKy2fhqUG4WsgyUVuLT1wiJOSBAWzAWQq2RA7lfLX8beDSfqgHpC4lyCB22WGI+Id9gc8SeyXxIrskRgqoIwFvbRAyh++HWQfOBYNtzfU5NxIiFFTpaOOwxvlM6AVrEGSnddrTh8OO+LBeEh5lA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738657352; c=relaxed/relaxed;
	bh=DnKDCU1FUD2pmjVQdxzJZnfkfi9EpwFgK55JyMARIzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=REw052XUooxjr7miAJwHziEHbwpFPUVJZ/e94VK2PQJtdE5Sd/G9gj/fVHON/733wIBssE7eaPl+YyPXylblielAt6p6J/dd8ZzXADPATWhjIubOnW7EFzD7u2402rxpe7K9OKAEjLatgfW1ot/2RhZGEVt6kkD4tMUuPoOQEBTPN/C2oVD23lfvESC7GJROXsZhaihHpc+u15LLmq2rEH+RpPorRJlRtSwsmFTK7dmwPqK6S4K99vfd9gw9W9jHPx41NYp6EyPoAu/5uMajr8VIz3Aw5Vahy2ITewVRnahGRjoCSu1eb8BV1PsaKKjku/hVKD7okhPUG6s9OlKImQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Flufws2T; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=9bVplinw; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Flufws2T;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=9bVplinw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YnGZH2G7Gz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2025 19:22:31 +1100 (AEDT)
Date: Tue, 4 Feb 2025 09:22:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738657345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DnKDCU1FUD2pmjVQdxzJZnfkfi9EpwFgK55JyMARIzA=;
	b=Flufws2Tc9X0nPhdWeTbARtFtpmLKyJhRjTdAqJ6fPfEhNQTEABuzNj2b9h/wqxgpygsJQ
	BvQ9McEJAT79GteclYmajpufEIKfY1l+WTmpF6XBquIURUICO84ga34gXaSr0Zkw3PhTOW
	4GPHQCDySVG9PXZ8kZSoJyzwXGy5oLvEW0ZcyQysrrpKuZVddyvoUndbakAOx47HtGtexn
	ukV+CKsl+dm88D3aMK6Vlbqi8PZB0kpT7qo0jQ2zW4SjSkmiB6Dy+KkMUTqBlPFOJuw7KZ
	Fi6/V1EPJ5cM8naXbIr5Ajs2/HOm23m3YllPtnqCmiVmfc78hgnKQhQrnf/W/A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738657345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DnKDCU1FUD2pmjVQdxzJZnfkfi9EpwFgK55JyMARIzA=;
	b=9bVplinw5uTckiBFUaa4zx9QSnLzFLQniSAa/sUY9kv2nk/w7pKzIIqBRVZtU6jJb9dp9Q
	qw/sYFSz9uG4XPBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Ben Segall <bsegall@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Will Deacon <will@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 5/9] powerpc: Use preempt_model_str().
Message-ID: <20250204082223.6iNyq_KR@linutronix.de>
References: <20250203141632.440554-1-bigeasy@linutronix.de>
 <20250203141632.440554-6-bigeasy@linutronix.de>
 <65c6f60d-bb52-48bd-a02c-87ffd2a915d4@csgroup.eu>
 <20250203160103.9DikC9FJ@linutronix.de>
 <51999b8e-61c0-48b7-b744-c83d39e7f311@csgroup.eu>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <51999b8e-61c0-48b7-b744-c83d39e7f311@csgroup.eu>
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
v2=E2=80=A6v3:
  - Use printk() instead of pr_emerg() to remain consistent with the
    other invocations in terms of printing context.

 arch/powerpc/kernel/traps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index edf5cabe5dfdb..d6d77d92b3358 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -263,10 +263,10 @@ static int __die(const char *str, struct pt_regs *reg=
s, long err)
 {
 	printk("Oops: %s, sig: %ld [#%d]\n", str, err, ++die_counter);
=20
-	printk("%s PAGE_SIZE=3D%luK%s%s%s%s%s%s %s\n",
+	printk("%s PAGE_SIZE=3D%luK%s %s %s%s%s%s %s\n",
 	       IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) ? "LE" : "BE",
 	       PAGE_SIZE / 1024, get_mmu_str(),
-	       IS_ENABLED(CONFIG_PREEMPT) ? " PREEMPT" : "",
+	       preempt_model_str(),
 	       IS_ENABLED(CONFIG_SMP) ? " SMP" : "",
 	       IS_ENABLED(CONFIG_SMP) ? (" NR_CPUS=3D" __stringify(NR_CPUS)) : "",
 	       debug_pagealloc_enabled() ? " DEBUG_PAGEALLOC" : "",
--=20
2.47.2


