Return-Path: <linuxppc-dev+bounces-3985-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 050529ED004
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 16:41:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7fvb4nWZz2y8V;
	Thu, 12 Dec 2024 02:40:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733931659;
	cv=none; b=HCX6Q8pcCN1RlDBtvN99wdxOLz1/qMUHJWrP5VDNk+E1tjV4RMceghy15qx84CmBoIna/mQaq+nOXsYVJ9EU6fwHf1rWPEd5LF2Wiz/5AkLi11FuD4wCutNP+KbEK8d+hrjjMJ4T37GiMOi1LMTioi8zBrdFpKGXlG2Efa7kcpi5D/UOBWsmfWJE3Yi1EYb3Zii4ylTaRzZgmEyMI6nseFwvpra4qJnxzA6dgpCGD2JDkWJAPurnV6s84SedbnnwseHy94IIPzy4V3BWaIygoukXZ12X6EV/YDndMYPjYCpWIi8ftUyM6QVhtFlOoYiwGDpzz99SnVAvIeGc6I1h5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733931659; c=relaxed/relaxed;
	bh=5r3VXIp0XmMBXAlxSwILes2Jqbowq2uwAxf2gqQQs9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WLJG8ydfLn4LTw4guyFz4yS6nBFWvS88ksGAgbbeJGWKR07B7zdxvcwAGxzoree60atViwqxv67hYJMV8AL5qpOW8BkvLYdSSt1Iar7y2Jfms1dFh6fBmbVfZu2hCU9SzgbIjyyKqRiC2yNSYmhVpLdpiOCeeALIMEu9R3pYKS7e6CvLaLY+CAKp+wDK8dQH3uePfo6xpMNrTKMH4/CAnBBkeP7bCUVGebOiZXGgC6+Iu/x+zRd+sulvaLWFtW9Dgt5ZTTiu6F9R3RWSVAVoq5UR+P6+3QiA3nIkBK2I9nvBb2VS0cSaZGsv/hQEYeDE6MtfvGArQbzJxscqJWZcAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TstP/GWE; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TstP/GWE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7fvZ0Fq4z2xmZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 02:40:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2DB295C62D8;
	Wed, 11 Dec 2024 15:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81CB5C4CEDD;
	Wed, 11 Dec 2024 15:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733931655;
	bh=bRL09e91cC7LQEEs/ysPp5d5gcrpXYKGy36AOC6GrXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TstP/GWESXn5mz/0JLh0l91WVzrEpldhSPLVjcRZOfjfaRBDoQ8RiIEfowR2lsWYP
	 Rko9njDUpHK9O0sihWEULI9jWZm23b2vp96tZd/4UyoJS7EsbQkVaaTRV7pe9i+Hrd
	 U3tMzhk106Tzqdus4BlDa0GMqaCbt9XBQnmxobIj/KYKQ05j/VUN3wXUKpQq2jiJcE
	 kv/NySaaTLJK2HNg60sQ6d9PdiccerfOMOEzO2o3eIpk2zbXu6cCpQczNiRUreZ+s6
	 zE02REc6cCuTFtf8LgRrk/iKbFiA+It8XsPAeMmG5yzR5Ghdg4JVIpmZyfJCraMiGj
	 pYmVUTjqndtwQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 06/19] soc/qman: test: Use kthread_run_on_cpu()
Date: Wed, 11 Dec 2024 16:40:19 +0100
Message-ID: <20241211154035.75565-7-frederic@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241211154035.75565-1-frederic@kernel.org>
References: <20241211154035.75565-1-frederic@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

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


