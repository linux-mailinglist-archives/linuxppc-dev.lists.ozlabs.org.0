Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9067D6E2480
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 15:43:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pyd243QSYz3fWK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:43:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ldJN0aoD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pyccx24J1z3fTj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 23:25:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ldJN0aoD;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pyccx1H6lz4xN6;
	Fri, 14 Apr 2023 23:25:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681478705;
	bh=vxU8RGorMi0a3p1CtqHnzSMDK6a97zKkl14pOEnR3Ic=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ldJN0aoDm/xdZmWWHU1ZZjS3H+0z7JeuYIM161JWLdLjie1hTwYMBoccek1z5roJT
	 C2fbjuxWZlHA5Cy5O8+JghnB63N0mhAYSw4SPPDIGh7PTe6FWma8StAuouMhRP/KiV
	 5ZlOuRQC3yNTP7ghLMnVRDvfqzwaK/3nTmT/oFURkhydn44K2OmmRAi0faFcO5Uj9f
	 z5eAT8a9OdCdlYs3URv+xFEeKRkcEyWCKKW7UkDTfTVDntmo97IDzA93FpuhJi+2TX
	 vZSB02/hCg9p0H1QpW+GJayBbQO8ItJLZ9Y2vVSW1ihfdYpKGGAsqQn36NlbbkzWmi
	 DM/VRjyjla8ag==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 24/32] powerpc/configs/64s: Drop REISERFS
Date: Fri, 14 Apr 2023 23:24:07 +1000
Message-Id: <20230414132415.821564-24-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414132415.821564-1-mpe@ellerman.id.au>
References: <20230414132415.821564-1-mpe@ellerman.id.au>
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

No reason to use this anymore.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/ppc64_defconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index b7c6cd72a0ce..12d49f3e56b7 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -312,10 +312,6 @@ CONFIG_EXT2_FS_SECURITY=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
 CONFIG_EXT4_FS_SECURITY=y
-CONFIG_REISERFS_FS=m
-CONFIG_REISERFS_FS_XATTR=y
-CONFIG_REISERFS_FS_POSIX_ACL=y
-CONFIG_REISERFS_FS_SECURITY=y
 CONFIG_JFS_FS=m
 CONFIG_JFS_POSIX_ACL=y
 CONFIG_JFS_SECURITY=y
-- 
2.39.2

