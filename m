Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 290DB88802B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Mar 2024 23:55:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XH0PZUU/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V2rxl6N8Gz3dVJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 09:55:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XH0PZUU/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V2rwz1hMkz30Pp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 09:54:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CDDBECE0E5D;
	Sun, 24 Mar 2024 22:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F9E0C43330;
	Sun, 24 Mar 2024 22:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711320880;
	bh=Vql+8js91BRX0rn5qU3meYIvkq3/iZebYzGwS509XTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XH0PZUU/46IFy8sp/+S5J2rWTXJcondn8GwtpQ6j2PcAO4JftmUyhtMoBm8y8xmZr
	 nJT1PggckArlgyaFJseQHRKMSTLT8Q8EMeu4O0EFrsYIcCWIaS+qQCtAOV+MDe7I9s
	 Fww8XlgD3i5NEG9pax/uQeuiF0Dok6MDFkHzgPnNgVFCfMtcQQFS9L/pSK/lzTNifm
	 eVHba0MMrcPYWG+yjUmp1SwXOab8LmJEAMRW3OElxQ9gNLGq8dnicv+otg1UJD562O
	 w1bX2UbvY8YajhxVPWIrYyX62G+w81kp/BTkgWZlbLcGQcrSfYL8N7ovfr/WXq7s36
	 zQ+z3p4GVRdow==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 6.7 444/713] drivers/ps3: select VIDEO to provide cmdline functions
Date: Sun, 24 Mar 2024 18:42:50 -0400
Message-ID: <20240324224720.1345309-445-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240324224720.1345309-1-sashal@kernel.org>
References: <20240324224720.1345309-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org, Geoff Levand <geoff@infradead.org>, dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 7edd06233958d9086a9e3eb723a8768d3c5a9ce1 ]

When VIDEO is not set, there is a build error. Fix that by selecting
VIDEO for PS3_PS3AV.

ERROR: modpost: ".video_get_options" [drivers/ps3/ps3av_mod.ko] undefined!

Fixes: dae7fbf43fd0 ("driver/ps3: Include <video/cmdline.h> for mode parsing")
Fixes: a3b6792e990d ("video/cmdline: Introduce CONFIG_VIDEO for video= parameter")
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Cc: Naveen N. Rao <naveen.n.rao@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Geoff Levand <geoff@infradead.org>
Acked-by: Geoff Levand <geoff@infradead.org>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20240207161322.8073-1-rdunlap@infradead.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/ps3/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/ps3/Kconfig b/arch/powerpc/platforms/ps3/Kconfig
index a44869e5ea70f..1bd1b0b49bc62 100644
--- a/arch/powerpc/platforms/ps3/Kconfig
+++ b/arch/powerpc/platforms/ps3/Kconfig
@@ -67,6 +67,7 @@ config PS3_VUART
 config PS3_PS3AV
 	depends on PPC_PS3
 	tristate "PS3 AV settings driver" if PS3_ADVANCED
+	select VIDEO
 	select PS3_VUART
 	default y
 	help
-- 
2.43.0

