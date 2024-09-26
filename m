Return-Path: <linuxppc-dev+bounces-1629-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 215EC987B3E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2024 00:49:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XF81C5FBNz2yfm;
	Fri, 27 Sep 2024 08:49:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727390975;
	cv=none; b=i+44ZZGwT70mri4q6fC8tNGUFDmynEqjwg0jJYZWoqHghjSDp3WONLA+cUmWsozy48Zbl71vIjGo79jOccGZwHZecv3NUzW5T7S3rT52Bf0tBJ3onzywfbhXkDZrTdz0DPZ88gEkfiQKIzYVk6bs1cl8eh2gyK+3nIAddDgCOkw44XaxPgTawvx4DUryjiQuxauhZ1Nl9JxOERPc1xcm4tZ4J20qAGxvl1JAzPMqW9sJwxAt/XdLKkqIP/v8MlUsB4B7qZaBqyFlLxVbEhJcVe2hwXoDvrFXnNacarF36kPgD5jBmDWPxPQ+LkJoWLAg05ijhWqTefPnbZHsLIfbjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727390975; c=relaxed/relaxed;
	bh=5r3VXIp0XmMBXAlxSwILes2Jqbowq2uwAxf2gqQQs9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bG7DESUuT7sZWS0H7kXdHH4SwlTv/WpxWkxj2kIT9xBEl4lg+qtV6yjSIwk+/Ex9Mm/dUVVu69gprITZDYrhwOAHy2JwT0CKHVtX8aI+TZt1nQn4hb2uHjlMsxdekXC2PPSN0pcO6FMJB89TniVgQWZ93gf5QnWcOiKglpNlovs5Oy/EkmYcnoZO4oo01WYaeBiA6wZjaMiexC+RyXDcPL3l2FAE8aGC/e6/Mh2SHHwQtV2E+TFvQSyINTKJ/ivalq147lp3AopzgFdpJKBQedhm6lAzHLHjCKF+WodQoxYPYvHw7tI57/M6NeZkiPeurH+fT7GX4j2g87IeJmNjvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jDZdbpy4; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jDZdbpy4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XF81C209Yz2yYK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 08:49:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C7F505C5758;
	Thu, 26 Sep 2024 22:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5459C4CEC5;
	Thu, 26 Sep 2024 22:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727390972;
	bh=bRL09e91cC7LQEEs/ysPp5d5gcrpXYKGy36AOC6GrXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jDZdbpy4WqqifeDkegM8x1sVTl+yI6iQ0P8bBrCuvgR1jYI1u6GHF6NzZa0ERvibI
	 cAkhHAH8POAjsMrWv8dUzeYrp7H2lW1xLce+GVcY0pLcxBKiCOZ2QSeSYanU76SraB
	 IZBNevGY31bNGdaOCTyF2PZz+cIa9D1f+oAxxrdyywwWBtq2xFfddeIVVA5tdgy2VB
	 5VbETBCp8ypSUyBL5sVZzchrOvhIngYb38QGkAPgQs55AXjpxGQybbuhvuMqpZnC3Q
	 xS+tZyEcX27kdmIVc/JQekudFEh4jPBZBZemzhpPuY/XXDC1dD7CiBeQ6fdw/enqkP
	 hUzv6Z71aJMOA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 07/20] soc/qman: test: Use kthread_run_on_cpu()
Date: Fri, 27 Sep 2024 00:48:55 +0200
Message-ID: <20240926224910.11106-8-frederic@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240926224910.11106-1-frederic@kernel.org>
References: <20240926224910.11106-1-frederic@kernel.org>
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


