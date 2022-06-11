Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6649554738D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 12:05:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKtkV2RW4z3cd2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 20:05:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=c5ArRhjg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=qlft=ws=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=c5ArRhjg;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKtjy0pDyz306l
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 20:05:09 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 355A2B8360F;
	Sat, 11 Jun 2022 10:05:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AABFC34116;
	Sat, 11 Jun 2022 10:05:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="c5ArRhjg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1654941903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K8Fih1pMzbVI+b3h1u5AjgJXQiwLKTClqbDyl1iljVs=;
	b=c5ArRhjg4H54HtkZZoMU9fiXH+0tj5yv7Mf/BNtUopdXPcjeHx+AYoga5qFuwfYji9J5iI
	jFwKQfMTJJSh38GgD7nJPj8lRKEdb4rGFu1+NrhZsBzg1Raj4iRkNkHYZRrl1yxseL0Bj3
	p949vJSpPkmQjvjlp3APGXpYbhTZCFI=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 62c13b0c (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Sat, 11 Jun 2022 10:05:03 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 0/3] powerpc: wire up rng during setup_arch
Date: Sat, 11 Jun 2022 12:04:44 +0200
Message-Id: <20220611100447.5066-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The platform's RNG must be available before random_init() in order to be
useful for initial seeding, which in turn means that it needs to be
called from setup_arch(), rather than from an init call. This series
wires that up properly on the three platforms that currently initialize
the RNG from the wrong place.

Jason A. Donenfeld (3):
  powerpc/microwatt: wire up rng during setup_arch
  powerpc/powernv: wire up rng during setup_arch
  powerpc/pseries: wire up rng during setup_arch

 arch/powerpc/platforms/microwatt/rng.c   |  9 ++-------
 arch/powerpc/platforms/microwatt/setup.c |  8 ++++++++
 arch/powerpc/platforms/powernv/rng.c     | 17 ++++-------------
 arch/powerpc/platforms/powernv/setup.c   |  4 ++++
 arch/powerpc/platforms/pseries/rng.c     | 11 ++---------
 arch/powerpc/platforms/pseries/setup.c   |  3 +++
 6 files changed, 23 insertions(+), 29 deletions(-)

-- 
2.35.1

