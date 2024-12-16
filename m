Return-Path: <linuxppc-dev+bounces-4136-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 771A59F291D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 05:08:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBRHX0mBtz2xk7;
	Mon, 16 Dec 2024 15:07:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734322072;
	cv=none; b=Q/l7iyA4txp9FgrpkBn+pMl/Jt2d9O5RpDOtMpl+5SWadbT6TNkKaeJTWVP78jzyGT/gQwIxyJ/mACeR6bfW1zBMhXbzJ6Q+0SBE0QfcEO36H1Sn+XCE2p7/LPVwedIF+cYnkXTnQa1Dcad5b3tdi1QJU9DwZdPfvsbpp6qAWEWoWDun4BgfQ4qe6+alTSz4PAMt4qDwkB30uAq/GsnF4phyi/Y3+k2+RlAnXpyHMcnNr4RHOVhxmKg1PDqr6qqkaDZTrhsztm0dMa0BKLrY6S03w9a296xJgLwT5R61TRcbp1rJz55maBJPpl5/2rhRTYGPRfuTJsze0JFcgn67BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734322072; c=relaxed/relaxed;
	bh=DSRi32pmZVA539jKS7pLo7rgTN02chX/vM3hbLEQJMU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RPuEtHNVkh81KCnRb0D5FcfxCr87u4dtVzU4/ZDLo7pAXnFgVYO7UkZIe896Z0Mb9t6/l+R0H04TEq6KtgxFNX8Tj8BjqgiKF+R6nR2iejKjr00cITMmooSosqX30bzk0qxUzoPKcSWi068sWbSbViCLWlYJhzUp2rx8FPq6iiQNDKhCIacWoxhnwUIt/mLQyQZJ3ANp93Dx315Ruiv7dNRNzAS52BTKlIPtPDvAolguDacnYNGqDlXWW5Yy59VSFgn3MkpCt9nqeTHslm5FWYtKCkf2/3Dxok86QT5/EWsQL1w1tX28/DmYt+vIQGgMNnfXzSYsuSP92uWLUSO0Dg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=s2HaDX5x; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=s2HaDX5x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBRHV3tGrz2xWt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 15:07:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734322065;
	bh=DB5vwIg/fJ2YfNc/WxQNGHUdA0VU+r4WEQnW+S6JazE=;
	h=From:Subject:Date:To:Cc:From;
	b=s2HaDX5x5XeUnfpVDt/XL/l6toztQOrHq0IeXCAxExummg9X4XnFpCez7ryztUw+q
	 +Xr9KJ73E6POFyu1IfA55fLVAVBQnYA9EHmOZlqpnXhrncQAb4RXATgtl2/vxLEf59
	 npfur4KTyGL1D/9uXibPsWmX7atHUGXp1Iugsiyw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/5] powerpc: Constify 'struct bin_attribute'
Date: Mon, 16 Dec 2024 05:07:42 +0100
Message-Id: <20241216-sysfs-const-bin_attr-powerpc-v1-0-bbed8906f476@weissschuh.net>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAI6nX2cC/x3MwQqDMAwA0F+RnBdYqzL1V8YQ28WZS1uS4hTx3
 y0e3+UdoCRMCkN1gNDKyjEUmEcFfpnCj5C/xWCftjHWtKi7zoo+Bs3oOIxTzoIp/kmSx87X1Lp
 X76g2UIokNPN29+/PeV54Gva2bgAAAA==
X-Change-ID: 20241215-sysfs-const-bin_attr-powerpc-8c3e5b79be31
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734322065; l=1297;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=DB5vwIg/fJ2YfNc/WxQNGHUdA0VU+r4WEQnW+S6JazE=;
 b=2qz6e6tK3FpAt91+mlHLwa1ANToXuXtEIRSqG88YZLsebOMdN9BXOJcJPMV85TldC5lwjnb8w
 tOErlwkVB1HAA+fobbrvQbYUdDesW4w6zCQ+XFLrtr+Usl0twwWTNPG
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (5):
      powerpc/secvar: Mark __init functions as such
      powerpc/secvar: Constify 'struct bin_attribute'
      powerpc/powernv/ultravisor: Constify 'struct bin_attribute'
      powerpc/powernv/opal: Constify 'struct bin_attribute'
      powerpc/perf/hv-24x7: Constify 'struct bin_attribute'

 arch/powerpc/kernel/secvar-sysfs.c           | 24 ++++++++++++------------
 arch/powerpc/perf/hv-24x7.c                  |  8 ++++----
 arch/powerpc/platforms/powernv/opal-core.c   | 10 +++++-----
 arch/powerpc/platforms/powernv/opal-dump.c   |  4 ++--
 arch/powerpc/platforms/powernv/opal-elog.c   |  4 ++--
 arch/powerpc/platforms/powernv/opal-flash.c  |  4 ++--
 arch/powerpc/platforms/powernv/opal-msglog.c |  6 +++---
 arch/powerpc/platforms/powernv/ultravisor.c  |  6 +++---
 8 files changed, 33 insertions(+), 33 deletions(-)
---
base-commit: dccbe2047a5b0859de24bf463dae9eeea8e01c1e
change-id: 20241215-sysfs-const-bin_attr-powerpc-8c3e5b79be31

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


