Return-Path: <linuxppc-dev+bounces-1416-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3442097A953
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2024 00:50:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X70VF2Dkbz2xQD;
	Tue, 17 Sep 2024 08:49:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726526997;
	cv=none; b=bVudfk7grfwNb3a3bHZufgDeid25Va2XB2gm8psglZQCkIDQie0P+ClJqHO9MSVIyq1QrEL0GCxMVQE0Tn+IKfgGz3laSuPRan/ibh7DyKOqN3rOa/pXe2uxHmH9LTR2Qzg4Fgp+WEeyTbhO08vVmb4qw2IuStYac7OUXESIH8E36TOJC4YXmY677abXVacvq3YFJaPnS2iCyV1qowDUAVE6OPbdfLLHXloZmDh0mEVeivdhzz92XjzpGPAVHbuN4kBzZAHmEdKKuYwsbohzUR3t1TTFPQOpUmV43Mu+5GWJB4WdCOeLSggkusrQzPoBn/G/adeXN6X/SNTucO75gg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726526997; c=relaxed/relaxed;
	bh=5r3VXIp0XmMBXAlxSwILes2Jqbowq2uwAxf2gqQQs9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hWimd3r0dC9V/aUgW5Eyj3ZIxlmSdOP+XDAgRzbavZZFtVty22ghxPyFuOfmu25vNC0HYkyhD4NUBiY5RbXYBc1B9+b5qO8PKcgaJvxoOUTmdPaRs/4TqfxIKoHAPPEEmdzK95n7jXVV4h0Ai2zj3LiwOubqXtEY1cBVYQRK0aUaDoVfAtANPAYLxU93T49bEs883KaDrKRvh4/y331ZYFVyEQMM0EJpUFZjYzpwmiu7I/qKP73rj9ghA4YMSR/tJGVuCCPwXcRdnhFE7o7stQVDPCGUVcMR2kamk0IE5Dwb5JZz2indUwdXM3cxkCWyIRJ0QsMernGFPobZU4P3DA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a1Xe10Sj; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a1Xe10Sj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X70VD5p7Nz2xHl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2024 08:49:56 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 26EA25C1FDF;
	Mon, 16 Sep 2024 22:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D31DFC4CEC4;
	Mon, 16 Sep 2024 22:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726526992;
	bh=bRL09e91cC7LQEEs/ysPp5d5gcrpXYKGy36AOC6GrXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a1Xe10SjRDFp1Tnjo4rEV1qSSh5I/fFYmkJvMjVN/tBBFXbHuDqfW2ZKpbL9bTGkv
	 U7tz8C47kArBx6KohU4yk94kVLrNEyfFFoMtu3sI1rGeB601xnuvrdFUb86o5jzxaw
	 pXK9Bd6V1qDtIWeD9jqJCTq9qnaq9XQo//DpeB/mhKF+NNXs+gr/abL/4fyQmiGxSq
	 mF4B31rqHLk0PajC+YeepD7dpn398dZY0XD8DZ9EJZmJhGVNOybAq569O4+8DOqx4+
	 6VPjKNaq3VbbLRUMck9HsrMHITLQNGh6AadX2R8FQiIm+M39JtECZI8lyhca0jGq8O
	 B0iU4+iN5HyLQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 07/19] soc/qman: test: Use kthread_run_on_cpu()
Date: Tue, 17 Sep 2024 00:49:11 +0200
Message-ID: <20240916224925.20540-8-frederic@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240916224925.20540-1-frederic@kernel.org>
References: <20240916224925.20540-1-frederic@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the proper API instead of open coding it.

However it looks like kthreads here could be replaced by the use of a
per-cpu workqueue instead.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 drivers/soc/fsl/qbman/qman_test_stash.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/qbman/qman_test_stash.c b/drivers/soc/fsl/qbman/qman_test_stash.c
index b7e8e5ec884c..f4d3c2146f4f 100644
--- a/drivers/soc/fsl/qbman/qman_test_stash.c
+++ b/drivers/soc/fsl/qbman/qman_test_stash.c
@@ -108,14 +108,12 @@ static int on_all_cpus(int (*fn)(void))
 			.fn = fn,
 			.started = ATOMIC_INIT(0)
 		};
-		struct task_struct *k = kthread_create(bstrap_fn, &bstrap,
-			"hotpotato%d", cpu);
+		struct task_struct *k = kthread_run_on_cpu(bstrap_fn, &bstrap,
+							   cpu, "hotpotato%d");
 		int ret;
 
 		if (IS_ERR(k))
 			return -ENOMEM;
-		kthread_bind(k, cpu);
-		wake_up_process(k);
 		/*
 		 * If we call kthread_stop() before the "wake up" has had an
 		 * effect, then the thread may exit with -EINTR without ever
-- 
2.46.0


