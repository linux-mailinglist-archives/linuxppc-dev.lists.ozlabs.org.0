Return-Path: <linuxppc-dev+bounces-7634-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FB6A870B7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Apr 2025 06:56:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZZymP11gMz2xrb;
	Sun, 13 Apr 2025 14:55:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744520149;
	cv=none; b=BEqllwgizz31jjgJ6q1+Hz3ndUU/d/N046S4IzqOb3dDUytYVFMse1fUE543fMBj/2+LzlBE56Gk2emR/5lGG/oIOCVMBGQ6OKcYOo8l/1vKCK3MrB+k2MB1xiIuyF85XmiZrv/DtZiPMp7PJ+V+5cywBnhaX3gNOUSCYaePqNbpD+R9WQ6aFhe8A4pGziED0+OuIfBbQ3zMGG7jbvAgF4ZlJ+HjeCAM9nkudks7yNIne1g1fVRvZJMpAzeH9Crwn4Yzldv/kE4SxO9y7aeYkyT0fVYJf8phoogIIQyhRR8VHYUs7k2zUGr6XrHK9p6mmcf1vIwYyUAczRsCCCl9KA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744520149; c=relaxed/relaxed;
	bh=+XAO5wt0ktJuJ5hEdlkeCvL90T0dhvyuQigSTjc3SHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SHxcOOOMfIWNKDU4It+5bzaBvb2Q3V5obF7iDQVra7WYOwBlU7hdsnxaQOCgM3ugSA82uX98wgOpIkOJIzNEm9348kxFRRLA364/oEN6lXtyOcFQSoz02modNpIP6d7GnIVTD22aOA5AtaL0EuMfh+odHtXCfYQKpwVaqgCH/5V+AQ9JrmkA6KtpTyNKXokIHjUUoR246FXq+QQI8Al7tsy2JN2n3n+ydt1PQ+BDQ23B1X9u0yqrFR/D9JsnZkJ9sCpwdR9QtuRsor2T7cn0eECRMItpxjTeJDfTRvgr8ocB21FOSeq4wlP25HyHtpjWsWj0ex5r8WS4aBmCDoDurQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Yc/ME7eQ; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Yc/ME7eQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZZymL4qF9z2yGZ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Apr 2025 14:55:46 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D74CDA40709;
	Sun, 13 Apr 2025 04:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35EB2C4CEDD;
	Sun, 13 Apr 2025 04:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744520139;
	bh=KIyhx1f4Q7uvfnMxlwu8uJX8GawuhnAXHEOquMlum8c=;
	h=From:To:Cc:Subject:Date:From;
	b=Yc/ME7eQGv8kGFM/ofAJq9o/X0+8PKRBpM3Wp5A+5TdNIaSiKI9px1zivC+4ScNOE
	 edV34Vx6yTLrfmA6YUyw5zdvhZoT23tXp10pvsPW7szRHx12TRNTLtMyrg/X+YqTQp
	 jPiyzNsejFq70gbzcjMylWY8tJzHDhjL2q/fGBAsYQXAqZ2lgNWp+Z5QIIiFeUDz9X
	 CnonudAtwDp1I5jboQgmoWL3IVF/z/968+wE/w6DgOrbLOQRwJzSSFg5+BjyipQWSY
	 Ur5ba8acNYG7o1Ehc6NJ+tF4e1U7N1lHgTSXt2pPaKe9V+6IC59DbmTmOx1mKwPWgl
	 jY4IW/oULs7Zw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH 0/9] Remove per-architecture poly1305 shash glue code
Date: Sat, 12 Apr 2025 21:54:12 -0700
Message-ID: <20250413045421.55100-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
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
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,SUSPICIOUS_RECIPS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This series removes the per-architecture poly1305 shash glue code and
re-implements the poly1305 shashes on top of the Poly1305 library
functions.  This ends up being much simpler, and it is how it should
have been done originally.  This follows similar changes to crc32,
crc32c, and chacha20.

This series also makes the Poly1305 library be optimized on PowerPC.
Previously the PowerPC-optimized Poly1305 code only supported shash.

Eric Biggers (9):
  crypto: powerpc/poly1305 - implement library instead of shash
  crypto: poly1305 - centralize the shash wrappers for arch code
  crypto: arm/poly1305 - remove redundant shash algorithm
  crypto: arm64/poly1305 - remove redundant shash algorithm
  crypto: mips/poly1305 - drop redundant dependency on CONFIG_MIPS
  crypto: mips/poly1305 - remove redundant shash algorithm
  crypto: x86/poly1305 - remove redundant shash algorithm
  crypto: x86/poly1305 - don't select CRYPTO_LIB_POLY1305_GENERIC
  crypto: poly1305 - remove rset and sset fields of poly1305_desc_ctx

 arch/arm/crypto/Kconfig                 |   6 -
 arch/arm/crypto/poly1305-glue.c         | 170 ++----------------------
 arch/arm64/crypto/Kconfig               |   6 -
 arch/arm64/crypto/poly1305-glue.c       | 143 ++------------------
 arch/mips/crypto/Kconfig                |   6 -
 arch/mips/crypto/poly1305-glue.c        | 120 +----------------
 arch/powerpc/crypto/Kconfig             |  11 +-
 arch/powerpc/crypto/poly1305-p10-glue.c | 134 ++++++-------------
 arch/x86/crypto/Kconfig                 |   8 --
 arch/x86/crypto/poly1305_glue.c         |  99 ++------------
 crypto/Makefile                         |   3 +-
 crypto/poly1305.c                       | 153 +++++++++++++++++++++
 crypto/poly1305_generic.c               | 149 ---------------------
 include/crypto/poly1305.h               |  13 +-
 lib/crypto/poly1305.c                   |   2 -
 15 files changed, 242 insertions(+), 781 deletions(-)
 create mode 100644 crypto/poly1305.c
 delete mode 100644 crypto/poly1305_generic.c


base-commit: 3be3f70ee95da03a87d94c4a714ee679a5c7b34d
-- 
2.49.0


