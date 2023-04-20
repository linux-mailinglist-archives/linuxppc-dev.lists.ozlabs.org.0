Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4BD6E8979
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 07:17:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q25W03yDgz3fR7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 15:17:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iuC2mgMg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q25V96DRmz3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 15:16:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iuC2mgMg;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q25V870rkz4xDr;
	Thu, 20 Apr 2023 15:16:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681967777;
	bh=d//MadnsbxqLfgtf1S2Bs5oN1Kpjuq32y0PfrIZQwAg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iuC2mgMgyhq5ni5y7N/gQDn13FOXuz1yJuBSg03TwWFwOLtD1EwRhn3x9BHQ0DpLl
	 i7OLjHoDeBcFSGsbN0y0MNHN3gsWf3/VodPnbVxuwgRVlVlG7Kp1I9HnbTNa/E7f8q
	 Or6p6dTA1p0ykHnG8DBReAU7+O5/ZnzJWriAYFFcSlwuNmOu6iUxbUUmXJtylqLKzR
	 YINRaRYx+DnY5zZzSTw5KFVln4MZ+j9pFqIAWz1uA10oieH2lAM+5WNu46SX+CPLsq
	 QtGPaeLPuRrfFM45WTp1+FyMpexBZwF/+2QHZvetOJF3BG9LZPrHVv9aoM0Sjuz1/f
	 EWjAhFYF7BD/A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/2] powerpc/configs/64s: Drop JFS Filesystem
Date: Thu, 20 Apr 2023 15:16:09 +1000
Message-Id: <20230420051609.1324201-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420051609.1324201-1-mpe@ellerman.id.au>
References: <20230420051609.1324201-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Unlikely that anyone is still regularly using JFS, drop it from the
defconfig.

Suggested-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/ppc64_defconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 2836190448d5..7e8bc53f4e64 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -322,9 +322,6 @@ CONFIG_LIBNVDIMM=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
 CONFIG_EXT4_FS_SECURITY=y
-CONFIG_JFS_FS=m
-CONFIG_JFS_POSIX_ACL=y
-CONFIG_JFS_SECURITY=y
 CONFIG_XFS_FS=y
 CONFIG_XFS_POSIX_ACL=y
 CONFIG_BTRFS_FS=m
-- 
2.39.2

