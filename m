Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5348C7793
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 15:27:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rCg1CvzU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vg9qt2kbbz3flg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 23:27:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rCg1CvzU;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vg9q70MTMz2xPd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2024 23:26:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1715865995;
	bh=1QVjEA954JwvsGvekR60DDM6Sw1ly2dtY7Brkq1FwqY=;
	h=From:To:Subject:Date:From;
	b=rCg1CvzUULDnhoIeTj/n1ND/7DNgUvjHfMkb0AR3O1hW31wpadMUmGTAjAnr0Ambg
	 KcErlWo2BdRv8g0UccXJ12wTsi2DKxADfVoyWm3UJHEdBka3m67kyscywD04WPSBta
	 i5cRMs4wClagHcG4mMgfrmqRSrGZtLWmFwucjcw0h6UJqeVm4Q4t6hVKdMMZYiAlEP
	 taXShyfhRegW0abzUV3PAlg0oJIWe4IhIcW3tGcI2i0fWN0DyqAM99D+HHzBvEHRhU
	 5Arwad75gzZNeKGT1sQzxh0f8N8SINIA5zaOWpPdqQQtmiH7iJf/iegN0aHd8ocEjr
	 fqkiE7Zcnb8jQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vg9pz1HRWz4wbp;
	Thu, 16 May 2024 23:26:35 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/fadump: Fix section mismatch warning
Date: Thu, 16 May 2024 23:26:31 +1000
Message-ID: <20240516132631.347956-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.45.0
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

With some compilers/configs fadump_setup_param_area() isn't inlined into
its caller (which is __init), leading to a section mismatch warning:

  WARNING: modpost: vmlinux: section mismatch in reference:
  fadump_setup_param_area+0x200 (section: .text.fadump_setup_param_area)
  -> memblock_phys_alloc_range (section: .init.text)

Fix it by adding an __init annotation.

Fixes: 683eab94da75 ("powerpc/fadump: setup additional parameters for dump capture kernel")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20240515163708.3380c4d1@canb.auug.org.au/
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/all/202405140922.oucLOx4Y-lkp@intel.com/
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/fadump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 2276bacc4170..60f974775fc8 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1740,7 +1740,7 @@ static void __init fadump_process(void)
  * Reserve memory to store additional parameters to be passed
  * for fadump/capture kernel.
  */
-static void fadump_setup_param_area(void)
+static void __init fadump_setup_param_area(void)
 {
 	phys_addr_t range_start, range_end;
 
-- 
2.45.0

