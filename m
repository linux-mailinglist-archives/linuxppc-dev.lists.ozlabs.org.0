Return-Path: <linuxppc-dev+bounces-3124-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7349F9C5A2C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2024 15:23:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnpYK45f1z2xWZ;
	Wed, 13 Nov 2024 01:23:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731421397;
	cv=none; b=FbttyVG32IY5Ix8h54GZqns0JB5GUWt7AgW6rbOz/pOMKksDy70kxFWQPQecKx8iKd+abbuc398O4w4XJhf3eJaJoqKF+qUwYZlI0jXOyQbJnZ1Mskc1mAXVSPxkJYF9joJP3rwh+8i9Gy37eWFYLUTIinei7MaheSQN23OmwT27ktmXKI+WUvzyhnaEfvTU1YWYFyWTDriOnUcl0f+s5Dz26unLhJtgZ2szO9MrMn5k4YCFZxth6m3Dpx7eTuQKMR4Yh2qOQf1Jgi5Yp7XJt4ODT92aUIGDuX/HbS3nFc6B4l2vcLzK/aP3QYWA9k+cKDpTNm0m4Gi/oW037c5KrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731421397; c=relaxed/relaxed;
	bh=5r3VXIp0XmMBXAlxSwILes2Jqbowq2uwAxf2gqQQs9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Du08PBROvvsbr6ZoEw4KjQbUXjewMwvbmP/g2ceF0MEe/CHyEfXCrd+f5KLYE0LVZnfig9kuHHNyEdiOi35wIqCCt04THwjhQaBaQtRem9x8p72sJ9RSZ+bKluAkVHapYeFG1WoBRzSW/EK/4vsBKwbqH9W9n3Ujc+MRd7IbrO1+8Px2Sd6G6x9MmZTLaC/Iy/8FU0KMkPhRVwrmIUhmdomJsJle5QF6M3eAnIuYkcAs+mFStCaHkfDjJaeuEY1kOmP6FWyEVEFLWpwfYbSVnXz4iFaZfiZyoJmMTfMo6FWE1zi8wQLgSEXlDbO6/6E8HCJQZ4/nzd9rS6RE+dOGPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FGhTRjlX; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FGhTRjlX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XnpYJ3ty6z2xBm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 01:23:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D6785C55D1;
	Tue, 12 Nov 2024 14:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C81C4CED0;
	Tue, 12 Nov 2024 14:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731421392;
	bh=bRL09e91cC7LQEEs/ysPp5d5gcrpXYKGy36AOC6GrXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FGhTRjlXzf9QiP2GqFP1n90Yp6Gy7ImytAGPN2sgtkGb2yFXEkeux54f8ZtKbY6o6
	 a4wcjzEOo9cwkepshRkUQYk1BfaFTtOX2XW+4syhItoE8tbJzybrx32h8m9Ut/0r3f
	 R+Xd12RHGsFv7Y3QLffEjH4uGVjnG1+FKoSbc32spUwStbwoEDLSRhpmXHKhkl0r9p
	 eVnGHCcHmhCT8KUCs3qGDTShB3Bzjjn6j0Fgo5iPCXZibgHfeKeFiNV2mBrdxo/78Z
	 9gUkf3mruDYOIZBZQIe/RbPw8wpI5jt2y9RFLkg0FLYZHP4jApEqyLTwn/d4JNZ1n7
	 oLrZxre4KRLug==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 07/21] soc/qman: test: Use kthread_run_on_cpu()
Date: Tue, 12 Nov 2024 15:22:31 +0100
Message-ID: <20241112142248.20503-8-frederic@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241112142248.20503-1-frederic@kernel.org>
References: <20241112142248.20503-1-frederic@kernel.org>
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


