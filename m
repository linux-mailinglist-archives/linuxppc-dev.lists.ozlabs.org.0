Return-Path: <linuxppc-dev+bounces-8054-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EE4A9E2B8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Apr 2025 13:31:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zlkt54MXRz2ym3;
	Sun, 27 Apr 2025 21:31:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745753469;
	cv=none; b=McO8Jebl156YbvVZWOe0dMXhSO8NHMvZLsO8EIVL1kD9oxq/8Uq5/MiGZvIovKFJXFqPM1BLkcOIozkLhyZhZls1K/9ddwoyD08xVc50vV9U70uczyf7PgmzHDDANkuhTAIjI9fTrQkGmxlUS07Re2HT8qvwznW1Ym2/NYK76JI5BF4q3XvXUiqbzXxBZUPBwf3UG58Dpb1ruNJhPb9yH2Uu+vIbKYdmFpCuyUySFlWoWK1hXVXut8IdNctTOKkKa5xScTkJz7/9sfTES7YXuQi82pZ8kb7Q33+j0zSaM5r/irgWH8aeuWbVrWI9pyftN3TQLIKaivCcN/x0x6FDiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745753469; c=relaxed/relaxed;
	bh=Lxi4eLQ17vFDrYq7yCmYhsgSORUcHH0C5nsCx2IPn+Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LPEHR8njFDKKnoObqI7uLeD0rKX1s52r5zdVHTiljXlghcQvLR9qoykue26L39Smos7zCb4oE2GcBeUNg1i4mank1WlQ4snk5Mw5witRyT3UFv895wzUSCrVhQIzhn0loqlGoOR/Kb7QU4GhfMGavrxuNt1jRq04dttT2jAZ4dp2euyVyH+L6qVHRvwWPVdff5j9I+4q6wXGT69q5GpzsjzjGsa1++Gads4q4gjJjWuRExwOGVpJt4/Fua8mrzhAO09wLf5W7xGjrSwSDGJkoF6kL7iULesPWkdsfcgnDKA0uD4d9cpbSzuwxQYVG3oPxHwb55WqTOYd4wefDitLgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m750C3Cb; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m750C3Cb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zlkt42SlKz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 21:31:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BB484437DE;
	Sun, 27 Apr 2025 11:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 842F9C4CEE3;
	Sun, 27 Apr 2025 11:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745753465;
	bh=+BsL+X+30brRz3phNXt0JYIMKKNWV3x6jUYpT2ksFCo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=m750C3CbibW7p6DOy1lkSdAcpLZHEljbRTxawEmL1bpedKtHwE3ya3Nqqa44vHTAM
	 pQ5UlToty0iVLL7EeD9TY81QeLy7W29IL8QAhErHW1bG3ZLSlybm8sKbsmJ6IIWE5D
	 0OAZMF2gWDUmQZ3ICxUomYWh9/gHcMptYK8QBe8bvIpokV9FgZtoYZNDBVm/mEDpSZ
	 q47y7QrBY4dWRTSF0v2N6e5SMrM0MhGHyiw0erB9m/7wocDwyDjkLoycvFZ8CMvy7t
	 b/LyBVDrLz6ZTipOrGYYzT+91vU+P4WvO6sUxeg+bAVVOCbLWJ9XTQq/GM0aJ3h+MJ
	 snH6jkRNg5DHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78249C369D1;
	Sun, 27 Apr 2025 11:31:05 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Subject: [PATCH v3 0/4] Apple/PASemi i2c error recovery fixes
Date: Sun, 27 Apr 2025 11:30:42 +0000
Message-Id: <20250427-pasemi-fixes-v3-0-af28568296c0@svenpeter.dev>
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
X-B4-Tracking: v=1; b=H4sIAGIVDmgC/13MTQ6CMBCG4auQrq3p30h05T2Mi9IOMguBdEijI
 dzdQmKMLN+ZfM8sGBMhi0s1i4SZmIa+hD1UInS+f6CkWFoYZUAZo+ToGZ8kW3ohy7M+haaunXK
 NF2UyJtweZXG7l+6IpyG9Nz3r9fqFzD+UtVQy1uitjaAC4JUz9iNOmI4Rs1ixbH6A07ADTAECO
 Nu0YDVovweWZfkAk4U9Uu0AAAA=
X-Change-ID: 20250220-pasemi-fixes-916cb77404ba
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1791; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=+BsL+X+30brRz3phNXt0JYIMKKNWV3x6jUYpT2ksFCo=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQwafaP6/aCa2dTduGNTKVm5dHLRFrWO33Iefu73uVP578
 9RVu+hWRykLgxgHg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAiR3UZ/juGl3/+t3Lz1z+s
 63ZvnfBj/22L5Wl7T3Osk5l+q9xubtAihl/Mswo+Tw7s/PzwzsJpKVP/dk3f+00uItXm6OWY8mW
 rDV5xAgA=
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
Reply-To: sven@svenpeter.dev
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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
Changes in v3:
- dev_err instead of dev_warn for errors
- Added PASEMI_ prefix to the timeout define
- Declared new variables in the innermost scope they're used
- Re-added a dev_err that was dropped by mistake
- Removed already applied commits
- Removed open-coded readx_poll_timeout in the non-irq path
- Reorder commits
- Link to v2: https://lore.kernel.org/r/20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev

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
      i2c: pasemi: Enable the unjam machine
      i2c: pasemi: Improve error recovery
      i2c: pasemi: Log bus reset causes

Sven Peter (1):
      i2c: pasemi: Improve timeout handling

 drivers/i2c/busses/i2c-pasemi-core.c | 107 ++++++++++++++++++++++++++++-------
 1 file changed, 88 insertions(+), 19 deletions(-)
---
base-commit: 7cfa6946c58989507a52f38a1267faa74a65ab0e
change-id: 20250220-pasemi-fixes-916cb77404ba

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>



