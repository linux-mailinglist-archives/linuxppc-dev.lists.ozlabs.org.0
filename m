Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C639559B71
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 16:24:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTzrr2SzGz3cgQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 00:24:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=odhF0LyJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=srs0=w98e=w7=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=odhF0LyJ;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTzrB6jjlz2xXw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 00:23:38 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BF3ADB8269B;
	Fri, 24 Jun 2022 14:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0459BC34114;
	Fri, 24 Jun 2022 14:23:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="odhF0LyJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1656080611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DDHqAmqsZ4bloLWJ5SSgC0PVJ41EyjROF8QxHskmM0g=;
	b=odhF0LyJPkU94nBENBOG8XASoqmfAfDlY7Ad5w1YoA4Uea+cLNHo7dVlY9YILvLUzi3kXc
	LYssvyQbaIxMw7mCRLWYbHXMc9GqYOXAxp6oItn3aq425b/2TkENK/HUVa+BQru7/G95Ut
	6KCt5J59Fs/qbRr7Oq4wTdsa99goVdo=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8c97580c (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Fri, 24 Jun 2022 14:23:31 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Fabiano Rosas <farosas@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	LKML <linux-kernel@vger.kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 0/2] powerpc rng cleanups
Date: Fri, 24 Jun 2022 16:23:20 +0200
Message-Id: <20220624142322.2049826-1-Jason@zx2c4.com>
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

These are two small cleanups for -next.

Jason A. Donenfeld (2):
  powerpc/powernv: rename remaining rng powernv_ functions to pnv_
  powerpc/kvm: don't crash on missing rng, and use darn

 arch/powerpc/include/asm/archrandom.h |  7 +--
 arch/powerpc/kvm/book3s_hv_builtin.c  |  7 +--
 arch/powerpc/platforms/powernv/rng.c  | 63 ++++++++++-----------------
 drivers/char/hw_random/powernv-rng.c  |  2 +-
 4 files changed, 29 insertions(+), 50 deletions(-)

-- 
2.35.1

