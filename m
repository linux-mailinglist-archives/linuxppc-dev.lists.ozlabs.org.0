Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C4256C96C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jul 2022 14:44:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lg8wP6th5z3bsK
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jul 2022 22:44:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B58a5ISe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B58a5ISe;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lg8vm1p9Bz3blZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Jul 2022 22:43:32 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4A2D6B817D3;
	Sat,  9 Jul 2022 12:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8ADCC3411C;
	Sat,  9 Jul 2022 12:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657370606;
	bh=nXYb8YzZctpIOUjhb+F2KTD1t1leXFU48frkQUUUoo8=;
	h=From:To:Cc:Subject:Date:From;
	b=B58a5ISetczC6NCJU+6mMVEAUpl/q5hllgS8lWOQjwyWQyEcbkWND6cq+wOI1b57w
	 SASyAMxgk4iCthA67IKqSw/2NVXk7eqFGBHzi+Okrnk8lZd9tNXzse4o5cliiwGxSW
	 NIq6z8JSkfgL5icynk6j3FP91DYH4Ph2hjFagzgg61NIunqPdKBMWO3WJak3nN0N2G
	 CovEpsorx9KVR7XuE4Zcm3/ccG2vV50+qg5fJfrjCsppzlD+3uHosbRBj5i3PgW6Kk
	 FUsBuqJgDTJEqJRIO/XACqs77DzYLNFBMy0PMU1kida+FsQkBKIhNu7P7vyClZwTKE
	 PMwOsS0zF6LfA==
Received: by pali.im (Postfix)
	id CC341AFA; Sat,  9 Jul 2022 14:43:22 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Scott Wood <oss@buserror.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>
Subject: [PATCH] powerpc/85xx: Fix description of MPC85xx and P1/P2 boards options
Date: Sat,  9 Jul 2022 14:43:05 +0200
Message-Id: <20220709124305.17559-1-pali@kernel.org>
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

More MPC85xx and P1/P2 boards options have incorrect description. Fix them
to include list of all boards for which they enable/disable support.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/platforms/85xx/Kconfig | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/Kconfig b/arch/powerpc/platforms/85xx/Kconfig
index 2be17ffe8714..be16eba0f704 100644
--- a/arch/powerpc/platforms/85xx/Kconfig
+++ b/arch/powerpc/platforms/85xx/Kconfig
@@ -62,13 +62,13 @@ config MPC85xx_CDS
 	  This option enables support for the MPC85xx CDS board
 
 config MPC85xx_MDS
-	bool "Freescale MPC85xx MDS"
+	bool "Freescale MPC8568 MDS / MPC8569 MDS / P1021 MDS"
 	select DEFAULT_UIMAGE
 	select PHYLIB if NETDEVICES
 	select HAVE_RAPIDIO
 	select SWIOTLB
 	help
-	  This option enables support for the MPC85xx MDS board
+	  This option enables support for the MPC8568 MDS, MPC8569 MDS and P1021 MDS boards
 
 config MPC8536_DS
 	bool "Freescale MPC8536 DS"
@@ -78,28 +78,30 @@ config MPC8536_DS
 	  This option enables support for the MPC8536 DS board
 
 config MPC85xx_DS
-	bool "Freescale MPC85xx DS"
+	bool "Freescale MPC8544 DS / MPC8572 DS / P2020 DS"
 	select PPC_I8259
 	select DEFAULT_UIMAGE
 	select FSL_ULI1575 if PCI
 	select SWIOTLB
 	help
-	  This option enables support for the MPC85xx DS (MPC8544 DS) board
+	  This option enables support for the MPC8544 DS, MPC8572 DS and P2020 DS boards
 
 config MPC85xx_RDB
-	bool "Freescale MPC85xx RDB"
+	bool "Freescale P102x MBG/UTM/RDB and P2020 RDB"
 	select PPC_I8259
 	select DEFAULT_UIMAGE
 	select FSL_ULI1575 if PCI
 	select SWIOTLB
 	help
-	  This option enables support for the MPC85xx RDB (P2020 RDB) board
+	  This option enables support for the P1020 MBG PC, P1020 UTM PC,
+	  P1020 RDB PC, P1020 RDB PD, P1020 RDB, P1021 RDB PC, P1024 RDB,
+	  P1025 RDB, P2020 RDB and P2020 RDB PC boards
 
 config P1010_RDB
-	bool "Freescale P1010RDB"
+	bool "Freescale P1010 RDB"
 	select DEFAULT_UIMAGE
 	help
-	  This option enables support for the MPC85xx RDB (P1010 RDB) board
+	  This option enables support for the P1010 RDB board
 
 	  P1010RDB contains P1010Si, which provides CPU performance up to 800
 	  MHz and 1600 DMIPS, additional functionality and faster interfaces
-- 
2.20.1

