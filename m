Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E2A5475F1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 17:10:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LL1Vl3Pkjz3cKm
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jun 2022 01:10:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=kttCWqMq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=qlft=ws=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=kttCWqMq;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LL1VD5LVRz306l
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jun 2022 01:10:28 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EFEAF61001;
	Sat, 11 Jun 2022 15:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97C3C34116;
	Sat, 11 Jun 2022 15:10:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="kttCWqMq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1654960222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qF416RNckkOUpRlpwH6/BPTNNSan6sPETx4V80w0A2c=;
	b=kttCWqMq4NWyq0k+UrViGCTrQpBQXIUTG+7tlS7oTxPOiebyfjDs6JuVV2JZade3OUE8aZ
	CwQoFQub0jXH1Vr0emNUG6e0U5Px9+iRZ+lhTRcLPw/WoDCcUvqy8UxVEkuUEvtoXE2b6I
	pWr7ROxHzpLwwzTOAChNvf9WxYM2Kxs=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 121c7299 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Sat, 11 Jun 2022 15:10:22 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 0/3] powerpc: wire up rng during setup_arch
Date: Sat, 11 Jun 2022 17:10:12 +0200
Message-Id: <20220611151015.548325-1-Jason@zx2c4.com>
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

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>

Jason A. Donenfeld (3):
  powerpc/microwatt: wire up rng during setup_arch
  powerpc/powernv: wire up rng during setup_arch
  powerpc/pseries: wire up rng during setup_arch

 arch/powerpc/platforms/microwatt/microwatt.h |  7 +++++++
 arch/powerpc/platforms/microwatt/rng.c       | 10 +++-------
 arch/powerpc/platforms/microwatt/setup.c     |  8 ++++++++
 arch/powerpc/platforms/powernv/powernv.h     |  2 ++
 arch/powerpc/platforms/powernv/rng.c         | 18 +++++-------------
 arch/powerpc/platforms/powernv/setup.c       |  2 ++
 arch/powerpc/platforms/pseries/pseries.h     |  2 ++
 arch/powerpc/platforms/pseries/rng.c         | 11 +++--------
 arch/powerpc/platforms/pseries/setup.c       |  1 +
 9 files changed, 33 insertions(+), 28 deletions(-)
 create mode 100644 arch/powerpc/platforms/microwatt/microwatt.h

-- 
2.35.1

