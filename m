Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D13625057
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 03:34:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7jTl0rbYz3cd4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 13:34:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WST3di4B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WST3di4B;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7jSr1p1jz3bhR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Nov 2022 13:34:04 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EA6B261E87;
	Fri, 11 Nov 2022 02:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3C1C433B5;
	Fri, 11 Nov 2022 02:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668134040;
	bh=gjdMWEiszGHlgAUbV/wraW2CCRlUI9SwcqtTzT00osE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WST3di4BKL3S+8oSeD3XVPe7gNuwOlyrmzBXWK0O/AZN1q0d9KLCsaWUc7RDU7T08
	 XqN8C2N6BHlfJher3IvLae7dyOoNzMzBDvlyjZaHpvzgtuDL8wAZigotB2x9nw4tGL
	 JR2bDcotFy4Ct8qqHDzUHxMsbkiXwmPrKBoV5xtYsHpPvr/P5DUgQcia5mXa/f+F3v
	 HGxSY7yMi90AbPtz01bhusLD1BXVfeja5nnuS3CnR5bIYnZVppOfKYlCW90uQ8eKdv
	 Y8fkCCkyrDe95q0iFpiCTI+EZLiZZQIKqrnW0i4EN90eXFpbFfoqiA425lCIh3/45U
	 v7NruHhPKOVjA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 10/30] powerpc/64e: Fix amdgpu build on Book3E w/o AltiVec
Date: Thu, 10 Nov 2022 21:33:18 -0500
Message-Id: <20221111023340.227279-10-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221111023340.227279-1-sashal@kernel.org>
References: <20221111023340.227279-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman <mpe@ellerman.id.au>

[ Upstream commit 2153fc9623e5465f503d793d4c94ad65e9ec9b5f ]

There's a build failure for Book3E without AltiVec:
  Error: cc1: error: AltiVec not supported in this target
  make[6]: *** [/linux/scripts/Makefile.build:250:
  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o] Error 1

This happens because the amdgpu build is only gated by
PPC_LONG_DOUBLE_128, but that symbol can be enabled even though AltiVec
is disabled.

The only user of PPC_LONG_DOUBLE_128 is amdgpu, so just add a dependency
on AltiVec to that symbol to fix the build.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20221027125626.1383092-1-mpe@ellerman.id.au
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index cbe7bb029aec..c1d36a22de30 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -284,7 +284,7 @@ config PPC
 	#
 
 config PPC_LONG_DOUBLE_128
-	depends on PPC64
+	depends on PPC64 && ALTIVEC
 	def_bool $(success,test "$(shell,echo __LONG_DOUBLE_128__ | $(CC) -E -P -)" = 1)
 
 config PPC_BARRIER_NOSPEC
-- 
2.35.1

