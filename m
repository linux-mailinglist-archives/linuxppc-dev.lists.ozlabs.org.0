Return-Path: <linuxppc-dev+bounces-7668-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0866A8A2ED
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Apr 2025 17:37:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZcSvm3Mgrz3bl7;
	Wed, 16 Apr 2025 01:37:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744731444;
	cv=none; b=kcxZEP6sJ/WiN2lqg2lldiB/Sx1h2OeFPBfGnbJIpBnGxBrYb0cxg08Db9kda/c1+OVVt9J2TdrpsB7iec5Jo78Zn5/mG1sk0x7gwFBJnsQy+MQV2S6oBbqYUV6cfo/MjgJX//o2hel5CQQ6rOKG6IdLnYJN4Cu65WmUfu2gYXgOJ5YEyfWDh4QwfPKKdDSsMdDei1gdgqJ7Dt8Ckukjym8QUJsQMYAyYb9Yr6wRRZOxSQXOVhPouCfE1BvoGZKUbp+sM/B78lQEhVqsnQUoVH8JnjHE39qQ8Y2H+CzgNDNiuCzxcg7twoLJTg6fkYldVQaWac23jH2zHPdW6MkbJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744731444; c=relaxed/relaxed;
	bh=864IBWPR/g77N41nse+BQX0aC8cI/YU4haFPAwkPj8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eMYO7CxOV3YDVK9hQRKLA1NTuXgHnabsy9SFXqmRrJXdNPECq6WklGZwEcgQq/GilZK74gtV3d7GNACGhqNpd8jPya1ScovzT8DmFp1QpP2t1ZWEAfAOVdZVEHnlHgnSGBj0EdCh59A9zKwl41zQxYGFyIbTzx4H54azwPPygPKRqjvErJJvHHALPYBmOb4uqL4XJt1Ewh2ECZvR1dsFWcJDI0kjo4mPITD4sS5JUQM31bP0AYmCc4h/q2v9i9TfO7OyGWM/IzltfSEJPO0kQEsmoIDM2eRu7I52XCxGzN9MuCieBRZ39x1iv+YRhAKTwTVm46EioI02ckfGz1kTag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rsTNqLfy; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rsTNqLfy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZcSvk45Jhz3blb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 01:37:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E5A54A28B;
	Tue, 15 Apr 2025 15:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45DBBC4CEEC;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744731437;
	bh=tKCZ1U57MVrN0lerBtOC7DMLUFHO1/PGHr6C3AN/kw8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rsTNqLfyi72SZ2jdirJeSjURBXX62aZ3L4pWjWLptiWpw2cfwZe/aRXiQoEaOh4g5
	 RLBOosAfAdYQtJgmkQoTKYqqnhgD6zjHH2wtCPTV/YJltfh4aZs3h6P+ObW3x1zwWo
	 CtLJFr08sd65Rrec7g9PTaXiGScXZa3ArJQla2WLBTVQTRskWfFcRoTTpACdHw0GZx
	 /fbvokcvpvMPAZqSOZB9qn9hyf7MPRAYfpf92zozbk0aN42rIqjTfSw0J8WMc5sbjS
	 GaICvSypnddmjlIYeLpm4LrLFSX44d7INNmiyQA1ngqw98f+TNdtdO5ZGweFn9rBIu
	 qWr8fXD3ygmSA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B65C369C1;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Tue, 15 Apr 2025 15:36:56 +0000
Subject: [PATCH v2 2/6] i2c: pasemi: Sort includes alphabetically
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-pasemi-fixes-v2-2-c543bf53151a@svenpeter.dev>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
In-Reply-To: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>
Cc: linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@svenpeter.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=d4SrViBETCvEIVGrCu813u0fCI79k8TBuEJCcmGpDI0=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/q/WtWl7ddnLW1MubOp8d16cesWr2/7U2cXBHtceHk94
 Xb343vXOkpZGMQ4GGTFFFm277c3ffLwjeDSTZfew8xhZQIZwsDFKQATyZrO8D+9Oq6hSL4vb+s3
 aes9x67wXZ7ywlla4kKDZuwqy/eW7yMY/ik9+WNdy5A+zzfXXDRK0vDdoZPBj/T0lJ3n3axrt+s
 uZwUA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
Reply-To: sven@svenpeter.dev
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Sven Peter <sven@svenpeter.dev>

No functional changes.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 10 +++++-----
 drivers/i2c/busses/i2c-pasemi-pci.c  | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 71cc8cfc7c5cbf3924269f6217712d42008c03ff..df1b0087dcacb0a3b94196368137d5e20b0e6d7e 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -6,15 +6,15 @@
  */
 
 #include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
-#include <linux/kernel.h>
-#include <linux/stddef.h>
 #include <linux/sched.h>
-#include <linux/i2c.h>
-#include <linux/delay.h>
 #include <linux/slab.h>
-#include <linux/io.h>
+#include <linux/stddef.h>
 
 #include "i2c-pasemi-core.h"
 
diff --git a/drivers/i2c/busses/i2c-pasemi-pci.c b/drivers/i2c/busses/i2c-pasemi-pci.c
index 77f90c7436eda2df16afd7f1cac79355fb005bfd..b9ccb54ec77e22bb1b77848c858e2e0cc51db7e3 100644
--- a/drivers/i2c/busses/i2c-pasemi-pci.c
+++ b/drivers/i2c/busses/i2c-pasemi-pci.c
@@ -5,15 +5,15 @@
  * SMBus host driver for PA Semi PWRficient
  */
 
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
-#include <linux/kernel.h>
-#include <linux/stddef.h>
 #include <linux/sched.h>
-#include <linux/i2c.h>
-#include <linux/delay.h>
 #include <linux/slab.h>
-#include <linux/io.h>
+#include <linux/stddef.h>
 
 #include "i2c-pasemi-core.h"
 

-- 
2.34.1



