Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D87B17EB558
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 18:05:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=esJZhq+A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVCNy5Tnwz3dWY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 04:05:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=esJZhq+A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVCKC5HrDz3cRs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 04:02:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8743DB811CB;
	Tue, 14 Nov 2023 17:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF0E8C433C8;
	Tue, 14 Nov 2023 17:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699981353;
	bh=zdbILnLJ8Bse+F5hjFg/R9HPGLYwSKFm8c754/A0PGM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=esJZhq+AqLmzp9jtlAq6Y0KUS7mUDpmP2OVzjAZcxGCNmQfiDTxyXJJPzLYfkFHjf
	 XFJhKrwLuDF4uTDNDohQH27hQIUURYO03c3F3Y0xpQDYkMwMqk5ngBKrHLjqG5cKra
	 RhLBgWY576enqsk+YptXD1DGt2oxWXIT8UWA33Hw4Z5jyzzsJjUVmHj8DGaZIl70xP
	 whMm/2ZLgisjt++Y9oKkE/Mf+YEGvrN1efZcCjBzGEUgg2g1apexrQ1ztMgDrmKa/i
	 03gW/TMyQug68iqAFhB5uHZ7vgd0PpRJkZu9mFeBDGNh7/LXHwbBzO3rLYcM0cZhog
	 3V7gbVYDeYMLw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4839C4332F;
	Tue, 14 Nov 2023 17:02:33 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Subject: [PATCH 0/3] powerpc/pseries/memhp: Fix minor bugs and improve
 error logging
Date: Tue, 14 Nov 2023 11:01:52 -0600
Message-Id: <20231114-pseries-memhp-fixes-v1-0-fb8f2bb7c557@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAACoU2UC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDQ0MT3QKIBt3c1NyMAt20zAog29DC1NLCIiUl1SjRQAmos6AoFSwB1Bg
 dW1sLAIjdJyxlAAAA
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699981353; l=644;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=zdbILnLJ8Bse+F5hjFg/R9HPGLYwSKFm8c754/A0PGM=;
 b=6iG3yJoacYElVhp7oJuqIzdI2jyjd84ec391zC88z3nIqOPYe3GikpSgyb9BCW50ISrB4d0pH
 3bZy/oPmZ5/B30YXtCCF2z5pQ/CDftqxpXWG7WUJQEB/GxSSpWwRY25
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=jPDF44RvT+9DGFOH3NGoIu1xN9dF+82pjdpnKjXfoJ0=
X-Endpoint-Received:  by B4 Relay for nathanl@linux.ibm.com/20230817 with auth_id=78
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Scott Cheloha <cheloha@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This includes a fix for an array bounds read overrun that can be
triggered when debug messages are enabled.

---
Nathan Lynch (3):
      powerpc/pseries/memhp: Fix access beyond end of drmem array
      powerpc/pseries/memhp: Remove unbalanced dlpar_release_drc() call
      powerpc/pseries/memhp: Log more error conditions in add path

 arch/powerpc/platforms/pseries/hotplug-memory.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)
---
base-commit: 707df298cbde200b939c70be2577b20775fe3345
change-id: 20231114-pseries-memhp-fixes-185988dde2a0

Best regards,
-- 
Nathan Lynch <nathanl@linux.ibm.com>

