Return-Path: <linuxppc-dev+bounces-205-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F0D957EBE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 08:57:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wp0dJ21dmz2xs0;
	Tue, 20 Aug 2024 16:57:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=axE4SqEU;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wp0dH5jbpz2xZK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 16:57:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724137027;
	bh=yn0spGPQ1gcO3bDrcuKQobhnoFhdDlhZan4CDlUKo3s=;
	h=From:To:Subject:Date:From;
	b=axE4SqEUIa2tkQf95abG2R9DjO1ANPR7CM4AzsMm9QdLBsVo899kVyJJ1TFCizaKn
	 Dxt4OnZkxFCKbYXfW3nkq4ec0TVKlRx00tHbnhBC5FoPUQsQoLJGthO25At+9fMW4e
	 r9sdXRwX5xjiCzC6i1UmwLP8xptndtdItwkbA5akP+i0C3qYiBQQSMd+OSWOuw0POy
	 +INTGDv9namcmFh4tIYpZ07POcaRyzmg8vpsTIi4kNEOfUBs5Bc7emMWNJbPgSvEzc
	 f5x32F5rAzXVIeQJtinBDv0hkIFlveu2i+1oIbXq5M0xlePq0n4u2R1AXpVwczMTJR
	 yKOYeAFMMRQzw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wp0dH4MB2z4x2M;
	Tue, 20 Aug 2024 16:57:07 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/configs/64s: Enable DEFERRED_STRUCT_PAGE_INIT
Date: Tue, 20 Aug 2024 16:57:05 +1000
Message-ID: <20240820065705.660812-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.46.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It can speed up initialisation of page structs at boot on large
machines.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/ppc64_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 544a65fda77b..6001d580c0dd 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -93,6 +93,7 @@ CONFIG_MEMORY_HOTREMOVE=y
 CONFIG_KSM=y
 CONFIG_TRANSPARENT_HUGEPAGE=y
 CONFIG_MEM_SOFT_DIRTY=y
+CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
 CONFIG_ZONE_DEVICE=y
 CONFIG_NET=y
 CONFIG_PACKET=y
-- 
2.46.0


