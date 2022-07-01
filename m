Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A50562ED6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 10:50:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZ86l1FqBz3dth
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 18:50:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=eqqxK/+P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=1wh/=xg=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=eqqxK/+P;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZ8666bQcz2y8F
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 18:50:06 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7666B6225A;
	Fri,  1 Jul 2022 08:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB77C3411E;
	Fri,  1 Jul 2022 08:50:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="eqqxK/+P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1656665401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=449YNFr5l4pO+zrwowN1esUAezPscvj/8QJHEXujaSM=;
	b=eqqxK/+PEm7eKUtgQZRAk6GddFMw0dUr84r6J2KfQCMBP/pDx0++B/AQtADmqVVSgCM+kr
	DKLTVUksFcAKQ1YskRffeW3QtXnTowxbJ7gZA1gesHODGV7OfC04XOvQkGQbKugKxVv0OG
	7JU+5IQ9gbrx6sd4OGIeUqmiJ0dWjfA=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c96ae116 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Fri, 1 Jul 2022 08:50:01 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Sachin Sant <sachinp@linux.ibm.com>,
	christophe.leroy@csgroup.eu
Subject: [PATCH v4 0/2] powerpc rng cleanups
Date: Fri,  1 Jul 2022 10:49:44 +0200
Message-Id: <20220701084946.225357-1-Jason@zx2c4.com>
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

This is meant to be atop
https://lore.kernel.org/all/20220630121654.1939181-1-Jason@zx2c4.com/
which is expected to land first.

v4 fixes up an inversion of thr DR flag.

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

