Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EED06E2467
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 15:39:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PycxS05L3z3fch
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:39:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EKA9Nxc3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pyccv16ztz3fSy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 23:25:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EKA9Nxc3;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pyccq6nDdz4xMs;
	Fri, 14 Apr 2023 23:24:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681478700;
	bh=4plTnvf1qFyPCSmjzLZC+M/DebtvpGDJjDqX0yq0HJk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EKA9Nxc3jBJ+qD4gmpFNb9Gfk9CGBhipfWXtzRB3xHJLPyxBtstcdbNN298SS6InU
	 PgcYMVCo1yVMkGQtEmRu3dHRrh5HrIVc7Ep1LV+8V1wpmb1ovH0fZAxtdHqmeu+Ky7
	 arkjjSz+TNgiyGPMs1zqTKmx9u3o2gJ/zB7pMX7polIfoSHGwDBcQObStlndESjszs
	 WPsHGZr3GECAIRBzDDwaUprKLcIWcZLu6KsniKr3OHB9ccZG2XRQoIxy2kGG35apAJ
	 dxEigB1dwbwwiVPspsGcly6BCRtV8ygZ4qs7KcFZ0IxD8vO3pcPdtT200q4VA4HFYh
	 +9NpOfJm1jFng==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 14/32] powerpc/configs/64s: Enable ZSWAP & ZRAM
Date: Fri, 14 Apr 2023 23:23:57 +1000
Message-Id: <20230414132415.821564-14-mpe@ellerman.id.au>
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

Most distros enable these. In particular Fedore uses zram in the default
install.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/ppc64_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 07a92f02e1f8..59b9d8eb1c7b 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -78,6 +78,9 @@ CONFIG_MODVERSIONS=y
 CONFIG_MODULE_SRCVERSION_ALL=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_BINFMT_MISC=m
+CONFIG_ZSWAP=y
+CONFIG_Z3FOLD=y
+CONFIG_ZSMALLOC=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_MEMORY_HOTPLUG=y
 CONFIG_MEMORY_HOTREMOVE=y
@@ -114,6 +117,7 @@ CONFIG_ELECTRA_CF=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_BLK_DEV_FD=y
+CONFIG_ZRAM=m
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_NBD=m
 CONFIG_BLK_DEV_RAM=y
-- 
2.39.2

