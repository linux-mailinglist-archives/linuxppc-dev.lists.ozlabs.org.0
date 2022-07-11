Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E33D570E3D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 01:25:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lhg3Y2q4Zz3c9Z
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 09:25:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=d3aWGlkY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=g9ii=xq=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=d3aWGlkY;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lhg2y6zgQz302d
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 09:24:58 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 55E256145F;
	Mon, 11 Jul 2022 23:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16E7EC34115;
	Mon, 11 Jul 2022 23:24:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="d3aWGlkY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1657581892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NmYicdfsseYgls9XyLsN6eO4Eqo0Fw/zWhZFBkI25sg=;
	b=d3aWGlkYcAHifE8hBoclTSQxZA272pbu34TXoopVXe4EPC7eEnWTEMGHCUNht1vyf/F6tG
	7NSub/jwscV5rb3FSC/qzDYmtJuBHl6JqkNHimrg1uLXhuoWWlv+ceuSDLx6cdDiCrlm88
	tyHBH9BES32/MN9LPA02RDb5T9bLzBg=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9e003974 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Mon, 11 Jul 2022 23:24:52 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linuxppc-dev@lists.ozlabs.org,
	mpe@ellerman.id.au,
	sachinp@linux.ibm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] powerpc rng cleanups
Date: Tue, 12 Jul 2022 01:24:46 +0200
Message-Id: <20220711232448.136765-1-Jason@zx2c4.com>
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

These are two small cleanups for -next. This v5 rebases on the latest
git master, as some whitespace was added that made v4 no longer apply.

Jason A. Donenfeld (2):
  powerpc/powernv: rename remaining rng powernv_ functions to pnv_
  powerpc/kvm: don't crash on missing rng, and use darn

 arch/powerpc/include/asm/archrandom.h |  7 +--
 arch/powerpc/kvm/book3s_hv_builtin.c  |  7 +--
 arch/powerpc/platforms/powernv/rng.c  | 66 ++++++++++-----------------
 drivers/char/hw_random/powernv-rng.c  |  2 +-
 4 files changed, 30 insertions(+), 52 deletions(-)

-- 
2.35.1

