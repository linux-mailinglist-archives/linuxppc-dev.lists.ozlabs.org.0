Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD29490EE7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 18:13:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jcz4W6tWpz3fZb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 04:12:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lT/ayJG/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lT/ayJG/; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jcyqp1H6Kz3cNt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 04:01:58 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D564DB8115C;
 Mon, 17 Jan 2022 17:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDFB5C36AEC;
 Mon, 17 Jan 2022 17:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642438914;
 bh=FjNJmuvmKPUn0Y/tUQqXZwC+h96sYOLijJ9A1+62c5o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lT/ayJG/Y+FgoP7Anxcg4hy6JwLTQ4wy1r7xQJ/qx7FRo3decb+zeFuVjiwQ47YQL
 04bWihcP1M9EahjPAH1+YYAd81+7/nwPZorSK2Siijmvbj/2GIcWHZO4TWXRxR7gf6
 gFpyn/ds7CHdUIla/qPhdS1tcAVYa+TpeJo5R8ObB2Gb6cfRcIVyz/M1ZPkXbqaFo6
 kOAYi2CfbicSH4DvHfwyNrHXo2e5VqIhSxBvelaMAHp91letm6Xe6h652mB4oWPwk/
 o6QuXbbWMTcpiNZhp1wmHJbc1tWgJgXH9/Kt6JzpB4Fplk1Ov/9GyenHQMoH8cUzAo
 2N+1nGerSK06Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 12/44] powerpc/powermac: Add missing
 lockdep_register_key()
Date: Mon, 17 Jan 2022 12:00:55 -0500
Message-Id: <20220117170127.1471115-12-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117170127.1471115-1-sashal@kernel.org>
References: <20220117170127.1471115-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Erhard Furtner <erhard_f@mailbox.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

[ Upstream commit df1f679d19edb9eeb67cc2f96b29375f21991945 ]

KeyWest i2c @0xf8001003 irq 42 /uni-n@f8000000/i2c@f8001000
BUG: key c2d00cbc has not been registered!
------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(1)
WARNING: CPU: 0 PID: 1 at kernel/locking/lockdep.c:4801 lockdep_init_map_type+0x4c0/0xb4c
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.15.5-gentoo-PowerMacG4 #9
NIP:  c01a9428 LR: c01a9428 CTR: 00000000
REGS: e1033cf0 TRAP: 0700   Not tainted  (5.15.5-gentoo-PowerMacG4)
MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 24002002  XER: 00000000

GPR00: c01a9428 e1033db0 c2d1cf20 00000016 00000004 00000001 c01c0630 e1033a73
GPR08: 00000000 00000000 00000000 e1033db0 24002004 00000000 f8729377 00000003
GPR16: c1829a9c 00000000 18305357 c1416fc0 c1416f80 c006ac60 c2d00ca8 c1416f00
GPR24: 00000000 c21586f0 c2160000 00000000 c2d00cbc c2170000 c216e1a0 c2160000
NIP [c01a9428] lockdep_init_map_type+0x4c0/0xb4c
LR [c01a9428] lockdep_init_map_type+0x4c0/0xb4c
Call Trace:
[e1033db0] [c01a9428] lockdep_init_map_type+0x4c0/0xb4c (unreliable)
[e1033df0] [c1c177b8] kw_i2c_add+0x334/0x424
[e1033e20] [c1c18294] pmac_i2c_init+0x9ec/0xa9c
[e1033e80] [c1c1a790] smp_core99_probe+0xbc/0x35c
[e1033eb0] [c1c03cb0] kernel_init_freeable+0x190/0x5a4
[e1033f10] [c000946c] kernel_init+0x28/0x154
[e1033f30] [c0035148] ret_from_kernel_thread+0x14/0x1c

Add missing lockdep_register_key()

Reported-by: Erhard Furtner <erhard_f@mailbox.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/69e4f55565bb45ebb0843977801b245af0c666fe.1638264741.git.christophe.leroy@csgroup.eu
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/powermac/low_i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platforms/powermac/low_i2c.c
index f77a59b5c2e1a..de34fa34c42d8 100644
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -582,6 +582,7 @@ static void __init kw_i2c_add(struct pmac_i2c_host_kw *host,
 	bus->close = kw_i2c_close;
 	bus->xfer = kw_i2c_xfer;
 	mutex_init(&bus->mutex);
+	lockdep_register_key(&bus->lock_key);
 	lockdep_set_class(&bus->mutex, &bus->lock_key);
 	if (controller == busnode)
 		bus->flags = pmac_i2c_multibus;
-- 
2.34.1

