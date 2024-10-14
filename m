Return-Path: <linuxppc-dev+bounces-2205-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BF399C772
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 12:48:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRv8n1M2yz3bjM;
	Mon, 14 Oct 2024 21:48:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728902904;
	cv=none; b=AHdj6LRFBTiSNu7Q0tc3wiAYGUi3JvJ00zjef9zgYdnLMi89YHJcKmNIB/U27s5IsFJR7PMQT3wn3/UDj6ZoeZtWBeV8X+piS1VPHNKvyISTl5Q9V4u43D/M9pAKt4IgO5H04RtXQCSr8qdObm4Xlwnsyk/6bTSqVYCVPH2aOQ7gm1+rmmO2+o5LzMfYkZxrD8QDsvZNpR/octxdOftgx3SW8nwWYJAChE4Y9NorM6mJDgdoGCLmrJVXE0pE6CqjxFIT3Zu7kfuvPpEHHjyfyaycRafqv6QfOOOiTaB+eeGMjH7mxffN0uBQzBn4xr3D+KjTFUSreQYG3zOEXCZT1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728902904; c=relaxed/relaxed;
	bh=RYS+du93+69GukdtgxG4LqQci0I/RXZpcu8Hj5WKYEk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kr1bHFavf/80Z5MA3KwDTaSVtKgSCVJNudBsymMDA4N5c05LZjGmjaIXXVaVrs9Tde7MJYgBslwOsxwwjMlVblMh+s5M7BpKnMVOfdSKg4wdM31mvDrriYvysI5bZz8Vw0rMUcad/pAEHD89ucgIVXqWVxGlM5JYlM7ISQ4Oprb3zJ262i+hsKqgzwh4TKtvyemvPz8UDH1O98NP/cmSgc0QAPDsgfQGW/0Ydzks3H9avX0B4W4JphB8kXToLOMwhnQcC5/LnxLEzhcZTc5t9bO0PxIj7XGMJEIDVn6pWTkrAqbmspAPPKQ9MSQpA/jLo2eZiv72W6LQwdK8sEIkQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lDehbRUi; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lDehbRUi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRv8l1cWQz3bjK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 21:48:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F0E32A419D3;
	Mon, 14 Oct 2024 10:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7AF4C4CEC3;
	Mon, 14 Oct 2024 10:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728902900;
	bh=nyk7KmsjJVeX09LhsxjDfvCwzgNz1+vfkwwUVY+0C/g=;
	h=From:Subject:Date:To:Cc:From;
	b=lDehbRUijHK3VViD/M4SotvPenvFUgbjHygLq7PtTA+4wUYOFk0PYzWJ3MPsh1XdR
	 Z2jBi7HUs+M2OXVJrZYFSU/dpy+BV+wt35g2d15fDTqBzi9lqYZDZf61gnw4NeSwA+
	 Sdyrxe7Ch/to8A+VconinXXUYSzz4Fv1mieeWg8Hysqj7w7ftZbHJsZ8NthDT1Mrkn
	 kf4Rj+LbgbHT1738OkBBqjo7VLFeOPUHVklgbNzDR6ap3b77Ht/Nj/lGmvsqR/tsrh
	 RYSDTKLHsFbyuQ3ZB7OLPWylJ3J6RMFNNc8pWBn0HkvDiWUWersbpfsUOaBeLcJsXC
	 Jloo1d4yj+BIQ==
From: Simon Horman <horms@kernel.org>
Subject: [PATCH 0/2] net: ethernet: freescale: Use %pa to format
 resource_size_t
Date: Mon, 14 Oct 2024 11:48:06 +0100
Message-Id: <20241014-net-pa-fmt-v1-0-dcc9afb8858b@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOb2DGcC/x3MQQqAIBBA0avErBtQGQi6SrTQGmsWmahEIN49a
 fkW/1fInIQzzEOFxI9kuUOHHgfYThsORtm7wShDWmnCwAWjRX8VZOccaTsReYIexMRe3n+2rK1
 94+9cQVwAAAA=
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Pantelis Antoniou <pantelis.antoniou@gmail.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
X-Mailer: b4 0.14.0
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

This short series addersses the formatting of variables of
type resource_size_t in freescale drivers.

The correct format string for resource_size_t is %pa which
acts on the address of the variable to be formatted [1].

[1] https://elixir.bootlin.com/linux/v6.11.3/source/Documentation/core-api/printk-formats.rst#L229

These problems were introduced by
commit 9d9326d3bc0e ("phy: Change mii_bus id field to a string")

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/netdev/711d7f6d-b785-7560-f4dc-c6aad2cce99@linux-m68k.org/

---
Simon Horman (2):
      net: fec_mpc52xx_phy: Use %pa to format resource_size_t
      net: ethernet: fs_enet: Use %pa to format resource_size_t

 drivers/net/ethernet/freescale/fec_mpc52xx_phy.c     | 2 +-
 drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

base-commit: 6aac56631831e1386b6edd3c583c8afb2abfd267


