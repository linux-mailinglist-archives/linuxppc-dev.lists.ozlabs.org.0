Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E289E5A7131
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 00:56:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHN2y5KcYz3c96
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 08:56:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OipFgRsY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OipFgRsY;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHN2H4mYZz2xGK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 08:55:51 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 22CC5614CB;
	Tue, 30 Aug 2022 22:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D86C433D7;
	Tue, 30 Aug 2022 22:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661900146;
	bh=dmBMU10Cnw8oAmaoJBci0czuI1FsIM74P4Qly19Szk8=;
	h=From:To:Cc:Subject:Date:From;
	b=OipFgRsYU258ug8u2T8Pa48/9qqcaBUlU/SGCXR7cHm5lpgj00XrcMe9qUeTpbwpj
	 djsrOjN4Dmhuvq1YoxfR3JnvTU8NL2pVAv+mM1fgvpCXga4ZchjwDhD5KBEKrM3hNa
	 Zqbq0wXNls9eAc9D+c3GDgzM7lQ7JLR5xbySvypoyl2hMm6lIbLvIc/JqkBchSv9+i
	 i1+BqzAH7Or9SIY06zV05wubPHeIDmP4DDe5GZI+2hcEtL3erkpdwTfR93u6gGytga
	 6CB22SY6ym4M311jI8aDZTfq3TWnh6LXjNyVPNQl2qn9GIyAAnuhFGUlTCakq7f0H4
	 TXDtPtj/MYRYg==
Received: by pali.im (Postfix)
	id 5094A834; Wed, 31 Aug 2022 00:55:43 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: dts: turris1x.dts: Fix NOR partitions labels
Date: Wed, 31 Aug 2022 00:55:00 +0200
Message-Id: <20220830225500.8856-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Partition partition@20000 contains generic kernel image and it does not
have to be used only for rescue purposes. Partition partition@1c0000
contains bootable rescue system and partition partition@340000 contains
factory image/data for restoring to NAND. So change partition labels to
better fit their purpose by removing possible misleading substring "rootfs"
from these labels.

Fixes: 54c15ec3b738 ("powerpc: dts: Add DTS file for CZ.NIC Turris 1.x routers")
Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/boot/dts/turris1x.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/boot/dts/turris1x.dts b/arch/powerpc/boot/dts/turris1x.dts
index b7635f0b87a9..64c0dd733e40 100644
--- a/arch/powerpc/boot/dts/turris1x.dts
+++ b/arch/powerpc/boot/dts/turris1x.dts
@@ -263,21 +263,21 @@
 				};
 
 				partition@20000 {
-					/* 1.7 MB for Rescue Linux Kernel Image */
+					/* 1.7 MB for Linux Kernel Image */
 					reg = <0x00020000 0x001a0000>;
-					label = "rescue-kernel";
+					label = "kernel";
 				};
 
 				partition@1c0000 {
 					/* 1.5 MB for Rescue JFFS2 Root File System */
 					reg = <0x001c0000 0x00180000>;
-					label = "rescue-rootfs";
+					label = "rescue";
 				};
 
 				partition@340000 {
-					/* 11 MB for TAR.XZ Backup with content of NAND Root File System */
+					/* 11 MB for TAR.XZ Archive with Factory content of NAND Root File System */
 					reg = <0x00340000 0x00b00000>;
-					label = "backup-rootfs";
+					label = "factory";
 				};
 
 				partition@e40000 {
-- 
2.20.1

