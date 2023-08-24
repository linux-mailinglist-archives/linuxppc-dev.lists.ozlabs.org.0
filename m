Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4338786F06
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 14:29:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=e8sJYwXZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWj873wVsz3cGw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 22:29:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=e8sJYwXZ;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWj7G2mJ9z2yTc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 22:28:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692880133;
	bh=xHpUcn6D3KL14DU9d4bOFac6hxbKN3QlpZXRyLBlVJo=;
	h=From:To:Cc:Subject:Date:From;
	b=e8sJYwXZltaSjeMGQMGsgE4jB9W/RgGGZDSZA1cJShWgO0U9FfzlAIMKPgnXyrlP7
	 5frNF7rfn4ckJFmXsFcnGRVtDwBjx5aWW0F9nhBVdSzlTZ/ROQNN/5fTay767uNJxk
	 ua92ZBb17XMPpeIV0IkUWL53RApiX4767qtUQ0n0EhMn/cbbhR8oHCwWw4R+pdYcKt
	 X2gxofgYBvdTrcl8VEWfTYG4NC/dJXZ6icj4R1izxXo+ANxtNErXrvJXJE8ulFj1zK
	 Ri/fc/nkE46OR9i3Pf8YfRCMI7cn2h16tTloiTfMWfTNK0unI9zvw9VLikwbn3bDHs
	 /ktTamTu/w2yg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RWj786VL9z4wb8;
	Thu, 24 Aug 2023 22:28:52 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/mm: Allow ARCH_FORCE_MAX_ORDER up to 12
Date: Thu, 24 Aug 2023 22:28:49 +1000
Message-ID: <20230824122849.942072-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
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

Christophe reported that the change to ARCH_FORCE_MAX_ORDER to limit the
range to 10 had broken his ability to configure hugepages:

  # echo 1 > /sys/kernel/mm/hugepages/hugepages-8192kB/nr_hugepages
  sh: write error: Invalid argument

Several of the powerpc defconfigs previously set the
ARCH_FORCE_MAX_ORDER value to 12, via the definition in
arch/powerpc/configs/fsl-emb-nonhw.config, used by:

  mpc85xx_defconfig
  mpc85xx_smp_defconfig
  corenet32_smp_defconfig
  corenet64_smp_defconfig
  mpc86xx_defconfig
  mpc86xx_smp_defconfig

Fix it by increasing the allowed range to 12 to restore the previous
behaviour.

Fixes: 358e526a1648 ("powerpc/mm: Reinstate ARCH_FORCE_MAX_ORDER ranges")
Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://msgid.link/id:8011d806-5b30-bf26-2bfe-a08c39d57e20@csgroup.eu
---
 arch/powerpc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Christophe, can you confirm this fixes your system?

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c831e20cf40f..8977fa73c09e 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -928,7 +928,7 @@ config ARCH_FORCE_MAX_ORDER
 	default "6" if PPC32 && PPC_64K_PAGES
 	range 4 10 if PPC32 && PPC_256K_PAGES
 	default "4" if PPC32 && PPC_256K_PAGES
-	range 10 10
+	range 10 12
 	default "10"
 	help
 	  The kernel page allocator limits the size of maximal physically
-- 
2.41.0

