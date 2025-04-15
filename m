Return-Path: <linuxppc-dev+bounces-7666-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE82EA8A2EA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Apr 2025 17:37:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZcSvk1QVyz3bl5;
	Wed, 16 Apr 2025 01:37:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744731442;
	cv=none; b=c34fMB1BCRNBc9BrgMU7JjlzqPDk0/R5cO/uPrmxJmc97zDESGeaPGoeyRmXTJbIeoD3rVsEVlWML3Uy+onNrqx0Ivnkbj9ksCmYLIdZRbX/mUBw4x/dcYL25OKE09dbwt0MC5BNUByGAjTZCI0/6djFYuU1MQIcPB0fDA4uxFgyX6l2uBVzNGEOmyOv5ZFe46jO88UK0TV+p5sSfTmbi12u9Gvgr3+7yhc9t442yWNwqTbMZivBRFiP64rUowMX1/U/5pC9FFon3NgqGvylJmDOGicn5CYRmq+YrpAwRZS5gCYlAdQ1WzYBXjRzJ+tiQ9W2ct7iX/uC37TjNOuGGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744731442; c=relaxed/relaxed;
	bh=yPoh999NAR7Z1rztq7zMYun/kBXA9QLmEkjkFBC0iSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=npMEuEKEzPM1aYNEXuv32Z1tpjdJ5K/O3/YiHHwcJ9JxuV2Xtm2CC8mNIqsuC7SSN4s3RChn9MyrwFlcbaDdjCeXZaDq5PWZpuTz+rOwKoQXTq8Ttb+sLDE6JDbooSP3kGWbgma8U174AmgTU4MDgvf0o/cvWSXdUMCRyzew3OC1mov6uDCQ+PLwi1s1KjdN44iAbyp9UExwHQXAtu0/Rfb8KU42oPNr9TLSkwJfxR17FAXDDov5oTAJ9hVdwt3pzZ3tmP3clyudd4aSZGIX+1qiMb1ZnRLNgxgMLsfwxNtRv8S5gY7WXvs38iNdTyeF1fL/xaCh3bONtdFRohwezQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s9zJymXN; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s9zJymXN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZcSvj0L75z2xVq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 01:37:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 92DB75C58AD;
	Tue, 15 Apr 2025 15:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D168C4CEED;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744731437;
	bh=J3Oie2pptyHEtwvKtZF+eWmaLMCyaUrJVSGBPvvdSlQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s9zJymXNPTZOXH7mjUl0DjJiQnxJOqCGFa5iNXmtPndbrqBuDGv267Xb0yWif0CsV
	 uNeQpT+5Fd+8w2sEbBrBewBoMqFZdi09FLbrt3/iwQ5ssPPu4QY7l0DVurdWZqD791
	 mfb8cecYFexXhWQClD9icW4ujlNKK1uR3RUjMNFqaI/wdAI+69g61bLH1OR/gd+23y
	 47RkxtJqu+AidqXZIvQS4MFYAcp5jAdmhmadXI+D0d2QwZz8q2YLXxq7ZVhp4MIxU7
	 fIsNl/sNMWeVPC7mSomGKYPfIGZreYnC6K9aQsq1TZK6L0/WKcyK8Kn2mUxaF8ZzVq
	 PWBg3HcQNdXMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9E8C369BD;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Tue, 15 Apr 2025 15:36:55 +0000
Subject: [PATCH v2 1/6] i2c: pasemi: Use correct bits.h include
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
Message-Id: <20250415-pasemi-fixes-v2-1-c543bf53151a@svenpeter.dev>
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
 linux-kernel@vger.kernel.org, Sven Peter <sven@svenpeter.dev>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=990; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=T4ctk5KZpkF4MCpfLgWPh46S+YQwBJlk0+PfdZqRe6g=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/q/WpVo9+5foQ6z5vcxp3SHJe/Yv2n3g66G6UzbKwXuL
 tgouymoo5SFQYyDQVZMkWX7fnvTJw/fCC7ddOk9zBxWJpAhDFycAjCRbQ4M/70DXfKzoxxXTxOc
 uo9dNH/jlYrXT2ck/Xx1InsiY6tQ80ZGho+/F3tc3uDmaXHgnMfKKX0nLK4sFYvyXBK8OMPl/06
 9o5wA
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

When changing the #defines to use BIT and GENMASK the bitfield.h include
was added instead of the correct bits.h include.

Reported-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Closes: https://lore.kernel.org/asahi/Z965tVhC5jxy1kqZ@surfacebook.localdomain/
Fixes: 8b4da3ef9206 ("i2c: pasemi: Add registers bits and switch to BIT()")
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index bd128ab2e2ebb64929f2f6a3525835a880c3114d..71cc8cfc7c5cbf3924269f6217712d42008c03ff 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -5,7 +5,7 @@
  * SMBus host driver for PA Semi PWRficient
  */
 
-#include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/kernel.h>

-- 
2.34.1



