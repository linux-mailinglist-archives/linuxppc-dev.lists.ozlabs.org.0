Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9410D7EB57D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 18:25:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fxkQnDEg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVCqJ3Xb5z3ccL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 04:25:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fxkQnDEg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVCmN3t83z2ykC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 04:22:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id DA6D6B811CB;
	Tue, 14 Nov 2023 17:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B9EEC433C7;
	Tue, 14 Nov 2023 17:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699982561;
	bh=K25NrmNNsLE3HHYk7gFc9T9L54IqIixAVU6/pIF8tW8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fxkQnDEgKWLKDrWwQTKbSZo/A13LbSkwYIfpAzBrjiaWmo536VcMWJ1mIz88xC6oI
	 cJSsGCWNw7d1bxsuZyE/BY/G170+rTHWrWmfQflN0Tf5iCruTlPVWYDaNWniVS8oXk
	 1Y2F5KxjWDAsdgeEzBCylOSzktx57bH6Fb59rt94ctxhoe7tVXqn/QCYxyc2CU4i2A
	 qbMTBl5vmdGUI8+ZnhngMPFFI/NC7iMa0zsgh2bn8WCe/4+Vm5fdCGRjpi4KAFtIB9
	 NzmCgrlpfFqfDT3LIMap6PUVElc2HwhqMrr2/YGBUQbjbgVXLF8f9tA8ycajwbVx7R
	 XHFnGPm6wdeHg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187C3C4332F;
	Tue, 14 Nov 2023 17:22:41 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Subject: [PATCH v2 0/5] powerpc/rtas: Trivial and coding style fixes
Date: Tue, 14 Nov 2023 11:22:24 -0600
Message-Id: <20231114-rtas-trivial-v2-0-59cbab208d57@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANCsU2UC/1XMQQ6DIBCF4auYWRcDo1DTVe/RuKAU6iQKBiyxM
 d691K66/F/yvg2SjWQTXKoNos2UKPgSeKrADNo/LaNHaUCOjeAoWVx0YkukTHpkaBCN7WTjWgX
 lMkfraD24W196oLSE+D70LL7rDxJc/UNZMM6U6NqzktJI4a4j+dda032qTZig3/f9A1u4JOasA
 AAA
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699982560; l=1247;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=K25NrmNNsLE3HHYk7gFc9T9L54IqIixAVU6/pIF8tW8=;
 b=x4UfS24V4bu/AUVHUmWwuTtZIyaLbtTpzvHTp79/xc7kWjXUsa+dKGHmeZFOstUFrB565Gh1l
 1LwZosWERZODJYIPiU7N3c+NknFZiAZzXaeHEjFNEMvPPvETNL5H5Ll
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Andrew Donnellan <ajd@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Make minor coding style adjustments for readability.
* Remove rtas_service_present() and an old call_rtas() declaration.
* Move a pseries-specific function prototype to pseries code.

---
Changes in v2:
- Address various checkpatch issues missed in v1.
- Drop kernel-doc fixes already applied.
- Cc recent contributors in this area.
- Link to v1: https://lore.kernel.org/r/20231106-rtas-trivial-v1-0-61847655c51f@linux.ibm.com

---
Nathan Lynch (5):
      powerpc/rtas: Drop declaration of undefined call_rtas() function
      powerpc/rtas: Remove unused rtas_service_present()
      powerpc/rtas: Move post_mobility_fixup() declaration to pseries
      powerpc/rtas: Remove trailing space
      powerpc/rtas: Remove 'extern' from function declarations in rtas.h

 arch/powerpc/include/asm/rtas.h          | 63 +++++++++++++++-----------------
 arch/powerpc/kernel/rtas.c               | 23 +++++-------
 arch/powerpc/platforms/pseries/pseries.h |  1 +
 arch/powerpc/platforms/pseries/suspend.c |  1 +
 4 files changed, 40 insertions(+), 48 deletions(-)
---
base-commit: 707df298cbde200b939c70be2577b20775fe3345
change-id: 20231025-rtas-trivial-2c22ce853f46

Best regards,
-- 
Nathan Lynch <nathanl@linux.ibm.com>

