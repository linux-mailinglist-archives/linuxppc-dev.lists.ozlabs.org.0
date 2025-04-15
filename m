Return-Path: <linuxppc-dev+bounces-7664-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A1EA8A2E7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Apr 2025 17:37:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZcSvj400Gz2xYl;
	Wed, 16 Apr 2025 01:37:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744731441;
	cv=none; b=X2X5osHfO7QqFDo142JL7ujP5EYgwXWCpLegIxNvLNI0wklplEijmZCzvJ9XC2USarNDyX1Gjh5lmU392OXcspVu/rGClNL0ATM+CyL5dzfetvzSP1RvZ0YJhwKC1xt5zwDz4IvOHugSdZYEM+T2BybLwL/RiuSIw4vcKLpIWGX+Dr+ETU3qve39mBODb4lS3s8NPPjb2pYxl5NesVkG72a0CeDtG0O7glrkFQZjlwwSuMeLETMRIqVPn4k8qbBtZMUTkv/B403HqPqg+WjWm7YoTqH4GAjnstxIFG1byaz6KdEvzaVzdcLTyo3MtbYoEkjUT8MKGsZtbjiBLZOkOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744731441; c=relaxed/relaxed;
	bh=fihApEIuWNDTZ5SUlcQlAQ9Qq6nixx8s0KB4soooB8M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gAA8yG6gDdTxaP+swJn2CimF03eSvy0Qi8K8FjJEgEGvm1S9I0kwe3oLO2X/L0BNkyeKdG0tIklJDPNYgZECqdL++qc4O6/ltZp1hs6V7RFk0gArcggJ8iCn6nWN0a8tv2ARJpY5Y0lzxMyX0eu1/2R+sf97+6Bulf1PXi+ATdr64uN0l3tnG3tk4SBGEI6XFLaufq0Uj0EshRIB+2sJA6WFEEHviai8dKvOqwoqLguWk29Sz3DlXw3D199G5pZY2TMEE2hVTDnqdo7ALIMm0H4yyHsoI2czUlh2kH09ldzPsP+t4WuYeMegmn+n4TueBRkwrjMgBF4ca7zHoCa+Vg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qxgcx+y8; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qxgcx+y8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZcSvh2jVwz2xTh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 01:37:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AAC1B6115F;
	Tue, 15 Apr 2025 15:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21F3EC4CEEB;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744731437;
	bh=ymN+LyNWSLpbDsTvqi1RfS1hGNC4G0Ay2QtUtBcebSE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=qxgcx+y8f/T0QqwUy4z4BMkQEGP5nKd1tpaCCc1jg1KFKOJGkzMKzu5Hvs6zUjBtO
	 papZAgHQ9egtnGMZCNNILgO67XO7nKVDpnB5DvbV0knXpFGLv/x6ui2RoIS2U42H1H
	 t/PilexvtBsfXdrjGfUHI+BdmkSRO8np4kHOjlMjylBhFd5noOwIRZ87XzPuBCTrfO
	 ptrL7N18ofihn7iZdUW3zSZOsSOAeSHVxuDoY+frBagPdYWrEjGNL7akfYIRsOqN1d
	 1P3kb3Bm9hKvDo/dcMvsOBeQudYo+gWBiB9btuxHyDeyoeBr7/jHjYT3dRYLacu1L4
	 r3bs1VLwQ8/Pw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DDDC369AB;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Subject: [PATCH v2 0/6] Apple/PASemi i2c error recovery fixes
Date: Tue, 15 Apr 2025 15:36:54 +0000
Message-Id: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
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
X-B4-Tracking: v=1; b=H4sIABZ9/mcC/1WMQQ6CMBREr0L+2pq2gERX3sOwKHSUvxCaftJoS
 O9uJXHh8s3kvY0EkSF0qTaKSCy8zAXsoaJxcvMDin1hstq22lqtghM8Wd35BVFncxqHrmt0Mzg
 qSojYj2Lc+sITy7rE915P5rv+QvY/lIzSyndwde1bPba4SsIcsCIePRL1OecPBfj1sawAAAA=
X-Change-ID: 20250220-pasemi-fixes-916cb77404ba
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1509; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=ymN+LyNWSLpbDsTvqi1RfS1hGNC4G0Ay2QtUtBcebSE=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/q/WqW39UeZ2Vs4Hu471P1vrbLFhq3/9kvNXFKdzyq+j
 7MlkbWwo5SFQYyDQVZMkWX7fnvTJw/fCC7ddOk9zBxWJpAhDFycAjCRm0IM/0y7N11kSl4vsPBN
 e11CRPJmjTvNtzVf/ehWW7f33Wexj76MDEc5bobPYdU5tcPjyDnljo4tLnwHrzcd9mDs/BEcN79
 4Ej8A
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

Hi,

This series adds a few fixes/improvements to the error recovery for
Apple/PASemi i2c controllers.
The patches have been in our downstream tree and were originally used
to debug a rare glitch caused by clock strechting but are useful in
general. We haven't seen the controller misbehave since adding these.

Best,

Sven

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
Changes in v2:
- Added commit to use the correct include (bits.h instead of bitfield.h)
- Added commit to sort includes
- Moved timeout explanations to code instead of just the commit log
- Made timeout recovery also work correctly in the interrupt case when
  waiting for the condition failed
- Used readx_poll_timeout instead of open-coded alternative
- Link to v1: https://lore.kernel.org/r/20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev

---
Hector Martin (3):
      i2c: pasemi: Improve error recovery
      i2c: pasemi: Enable the unjam machine
      i2c: pasemi: Log bus reset causes

Sven Peter (3):
      i2c: pasemi: Use correct bits.h include
      i2c: pasemi: Sort includes alphabetically
      i2c: pasemi: Improve timeout handling

 drivers/i2c/busses/i2c-pasemi-core.c | 114 ++++++++++++++++++++++++++++-------
 drivers/i2c/busses/i2c-pasemi-pci.c  |  10 +--
 2 files changed, 96 insertions(+), 28 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250220-pasemi-fixes-916cb77404ba

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>



