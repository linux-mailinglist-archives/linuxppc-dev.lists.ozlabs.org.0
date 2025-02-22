Return-Path: <linuxppc-dev+bounces-6395-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25613A40BEC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Feb 2025 23:47:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z0hvx5lRNz305n;
	Sun, 23 Feb 2025 09:47:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04::f03c:95ff:fe5e:7468"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740231882;
	cv=none; b=deWmJ1vQw+L4jVuMODbxfAYYg6I8U+2qtTYT1xbGrhcyBdNTG+5r+o+VGVDxMXmgtKmhAoTw1ot7KSwm1A1Wd1qJ+zsf3pIug48qb2YRVfEFuhjm5/SdanFRb5hoscd/loKkbKHv5XtxY27oMewivNqUDhM/czoOeUUKlVT+bdkcraMUngHqZ/yqvNgr/kBXu1e/hJzTuphxPOXzyXUvSfweO4Y83rr2cuJoWFwX0STRvVD0Z8t3PZk12IfeodbYOf9suV6lnHkQ1+2EyY/GfQITFymVgH9Ywr+C8HkfCkSnhryyt10Vx/14buTKYoLfnFvHvZuOX0S3uhT06X9Rbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740231882; c=relaxed/relaxed;
	bh=KjynJ2iDpp55Qa/iGoDoKteY9QmQneQsXJpkrRU1z8c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JVjA7aMoyxFYcNo6WzcKHR3vgrOJHUJUfDQ4wrxYZ8XW2RxCz+cOoRBmHH/6uJhLoKAU45pA3MovHfD+mZUn5gTqkv+DWFL4lvrGpWFePt60aY/w1OdIBB/s6/EWRdCtX6l5VMlS4/0bwhOgoThurRlGG1/alnT06GvZifIa9wV3x64/q3R4aNuLfICOEJk0mHRUMtB79cEU1Z6KzxPvZJ0y9UVbiFw9qsyOleiqS6AKkicPbQeXhu2OMwwvh1/vqRK/Tao43yRV058KikLTAWdr22EVlD5v9kOMODUdALE+klNCKje0C8lbn5xwiEyPHRCr/TTXpQsPuvdCuqaCKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZhE5nsTR; dkim-atps=neutral; spf=pass (client-ip=2600:3c04::f03c:95ff:fe5e:7468; helo=tor.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZhE5nsTR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04::f03c:95ff:fe5e:7468; helo=tor.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04::f03c:95ff:fe5e:7468])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z0Ssh0vc6z2ywh
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Feb 2025 00:44:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BD6B61132;
	Sat, 22 Feb 2025 13:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45F11C4CEE2;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740231522;
	bh=YvDVaUlNxk0FFYVh0Uih/QBxDdTXOT7A8XEjDIMtIh8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ZhE5nsTRYzQ+xatxbsjltkmXjh4yz5WSZQT0ORjz/ia6DJh/+c0KCvrgkMHMyfvyU
	 bXNgj/KMZL8hfTAfvtWD5nWhDyjoN3LUGVlwwPKv/fkxV8gAcp4vtjWk2Dfa4HLGgn
	 4h3Q2Y2F7/0SwRmqdCJVR5zQ1UPd03x3J0uol3c4L6bbbUwBYTbKGW4/iANsTgpi/R
	 tzscufz5qnk6PQ3YazNK7IIvefqcVF7qgsUzqjiVNW3zC0wDff35tKvJFhYzgw/Ru4
	 uOOl4hdcJIjtWojAHSS7G/G4ZxjdwyIKk3P96DzWVYRUaM4FyJuOah+KTjxWqFDHnj
	 yuLhSTAtwKpEQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD68C021B6;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Subject: [PATCH 0/4] Apple/PASemi i2c error recovery fixes
Date: Sat, 22 Feb 2025 13:38:32 +0000
Message-Id: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
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
X-B4-Tracking: v=1; b=H4sIAFjTuWcC/x3LQQqAIBBA0avIrBNULKmrRAu1qWaRiQMRSHdPW
 j4+vwJjIWSYRIWCNzFdqUF3AuLh046S1mYwyvTKGCWzZzxJbvQgy1EPMThnlQ0e2pIL/qEd8/K
 +H5oY4NteAAAA
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@svenpeter.dev>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=914; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=YvDVaUlNxk0FFYVh0Uih/QBxDdTXOT7A8XEjDIMtIh8=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/rOy5HrJq+aLtY2ozoptL78762o7OM1P5+2PDjD8rfuR
 uLhdnuWjlIWBjEOBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBEPq9m+B8UVsSsKB6l/aLM
 SGmO1TO/xDc3TO5efhvyobe+eUXa+heMDF84zpXYKKjnr520yNlii5XDksSac68jXTJCt34JMb5
 9nREA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
Reply-To: sven@svenpeter.dev
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_XBL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

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
Hector Martin (3):
      i2c: pasemi: Improve error recovery
      i2c: pasemi: Enable the unjam machine
      i2c: pasemi: Log bus reset causes

Sven Peter (1):
      i2c: pasemi: Add registers bits and switch to BIT()

 drivers/i2c/busses/i2c-pasemi-core.c | 121 ++++++++++++++++++++++++++---------
 1 file changed, 92 insertions(+), 29 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250220-pasemi-fixes-916cb77404ba

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>



