Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E456E249B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 15:49:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pyd8Y0QHcz2xHJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:49:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IpvX5mHs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pycd0371Kz3chl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 23:25:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IpvX5mHs;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pycd01nG7z4xV1;
	Fri, 14 Apr 2023 23:25:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681478708;
	bh=4x86PLY76jz4B3/9MpNRTb5Tou8zTeZZBHyRaGGXdMM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IpvX5mHscNIcyhQBbVvIAay3bGfGx/FLqXpOphWVkoxFWl2CuRNGgPcI2o12xjx5h
	 pRN0FlyA6QGVI+vQJMX0FWPhc7UZe/z0XBD5pD1S2kD8yBxLg+SoarC7pVDX/tCb2C
	 ePA+XNKJHSJpW+tSRnlGDyssyoo8P3eZfOm2Y2og84u2F4Wqe3PKI4Kfc0xmM9e59P
	 BDRQsi2l0nXC5870Zu/M0OQ4XuyBrPXvsIDmtybQXuhGnQyEbIMK2VsIFWEBJZdAU+
	 gMIxYrAnffn1U/CQHusN8azlgv6ZYgR8QJGiRHm1JmOYf4YZEpo3pKsiTD3MvaqOyL
	 G7FoBJA8zsfrA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 30/32] powerpc/configs: Incorporate generic kvm_guest.config into guest configs
Date: Fri, 14 Apr 2023 23:24:13 +1000
Message-Id: <20230414132415.821564-30-mpe@ellerman.id.au>
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

Incorporate the generic kvm_guest.config into the powerpc guest configs,
ppc64[le]_guest_defconfig.

This brings in some useful options, in particular 9P support, and also
means future additions to the generic file will be automatically picked
up by the powerpc configs.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Makefile                 | 4 ++--
 arch/powerpc/configs/kvm_guest.config | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)
 create mode 120000 arch/powerpc/configs/kvm_guest.config

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index e86a989d445c..55c9b7968fbf 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -258,11 +258,11 @@ generated_configs += ppc64le_defconfig
 
 generated_configs += ppc64le_guest_defconfig
 ppc64le_guest_defconfig:
-	$(call merge_into_defconfig,ppc64_defconfig,le guest)
+	$(call merge_into_defconfig,ppc64_defconfig,le guest kvm_guest)
 
 generated_configs += ppc64_guest_defconfig
 ppc64_guest_defconfig:
-	$(call merge_into_defconfig,ppc64_defconfig,be guest)
+	$(call merge_into_defconfig,ppc64_defconfig,be guest kvm_guest)
 
 generated_configs += powernv_be_defconfig
 powernv_be_defconfig:
diff --git a/arch/powerpc/configs/kvm_guest.config b/arch/powerpc/configs/kvm_guest.config
new file mode 120000
index 000000000000..a5f7a2fa74ef
--- /dev/null
+++ b/arch/powerpc/configs/kvm_guest.config
@@ -0,0 +1 @@
+../../../kernel/configs/kvm_guest.config
\ No newline at end of file
-- 
2.39.2

