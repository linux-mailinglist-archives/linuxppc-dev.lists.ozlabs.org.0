Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9177FD7F5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 14:23:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BJSzTYw/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgKlj33VPz3clY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 00:23:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BJSzTYw/;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgKgL5bFLz3d8x
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 00:19:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701263989;
	bh=ood126AEmPXN2ZgrJ4jy6sUKjnSBWzxHaRg6mSEzgjM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BJSzTYw/eR/ITrJa2TUxd4flMiHqt1Cq9NOm2Y+WRHYgTtpEpkC0VNRnIO6ieXc/c
	 3147zof5yCXU+WojThSqKAg/BDho4i8ZY1tJZH+pYTiL7yDe5QtUCzzg2f8OThzBQu
	 0f4QTPwENsS7ECQs+oaHws4aBQSA4S/iSPbP+3phNa8z0aLlgfOaiSSANuv4btH9jb
	 4c0m6mmrzl0K9wdvm7G0ApmtijlhU8KSTQuJXUTb8100iaFQsX+9ARnD2AgEn1HVbN
	 VYNe9PvBjjW/G9eFcSA6RhWtHAdFVMMMm0CzW9hkrJHhH7CX1Cn24mT/QuGfij9UdB
	 E4hPvMywBMy/Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SgKg90c5Bz4xSy;
	Thu, 30 Nov 2023 00:19:49 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 3/5] powerpc/512x: Fix missing prototype warnings
Date: Thu, 30 Nov 2023 00:19:17 +1100
Message-ID: <20231129131919.2528517-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231129131919.2528517-1-mpe@ellerman.id.au>
References: <20231129131919.2528517-1-mpe@ellerman.id.au>
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
Cc: arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The mpc512x_defconfig build fails with:

  arch/powerpc/platforms/512x/mpc5121_ads_cpld.c:142:1: error: no previous prototype for ‘mpc5121_ads_cpld_map’ [-Werror=missing-prototypes]
  142 | mpc5121_ads_cpld_map(void)
      | ^~~~~~~~~~~~~~~~~~~~
  arch/powerpc/platforms/512x/mpc5121_ads_cpld.c:157:1: error: no previous prototype for ‘mpc5121_ads_cpld_pic_init’ [-Werror=missing-prototypes]
  157 | mpc5121_ads_cpld_pic_init(void)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~

There are prototypes for these functions but the header they are in is
not included by mpc5121_ads_cpld.c. Include it to fix the build error.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/512x/mpc5121_ads_cpld.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/512x/mpc5121_ads_cpld.c b/arch/powerpc/platforms/512x/mpc5121_ads_cpld.c
index 6f08d07aee3b..e995eb30bf09 100644
--- a/arch/powerpc/platforms/512x/mpc5121_ads_cpld.c
+++ b/arch/powerpc/platforms/512x/mpc5121_ads_cpld.c
@@ -17,6 +17,8 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 
+#include "mpc5121_ads.h"
+
 static struct device_node *cpld_pic_node;
 static struct irq_domain *cpld_pic_host;
 
-- 
2.41.0

