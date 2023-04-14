Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B95906E2488
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 15:46:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pyd5m4lzcz3gV3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:46:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OvErV7CY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pyccz2CqNz3fTy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 23:25:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OvErV7CY;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pyccz1R81z4xP9;
	Fri, 14 Apr 2023 23:25:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681478707;
	bh=ENvZhku7x4EgX1i0IGvjrcPUenNp0p3XwcDFNbGj4k8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OvErV7CYgROuc9TJsn4mbi85qY70AbUgGvIExrR70AUCyWwVXywM3ifLDgWg+F3O8
	 AgGJ39Qx0+UVV/CK+Wj9zXnIjLJotcLjzz+jgu4EKkQlawu6j3WAoaIgdiAsLnajCM
	 DMWINQLd7kYQpUhLDAS3MYXJ7zKcvkm4B566pIvaB+B2hLqlaTWFiz7Z0YcEKzF67Y
	 l31H1GEtJbCOkTqYWhmJQ4Sh4bUKp1jwoy5eKPncPEOKixx3CIXU/viwhwyAGMfxYr
	 mGAU7tT5CrOCcgU7forVMFVhd44o/3NWdZAYg5GY1FTxzTFKibqIT96teo7malts/H
	 92MXcGhqzUDFQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 28/32] powerpc/configs/64s: Enable Device Mapper options
Date: Fri, 14 Apr 2023 23:24:11 +1000
Message-Id: <20230414132415.821564-28-mpe@ellerman.id.au>
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

Add device mapper options for test coverage and in case folks are
booting systems that require them.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/ppc64_defconfig | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 037219dda19f..a17cb31105e3 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -167,18 +167,30 @@ CONFIG_BLK_DEV_MD=y
 CONFIG_MD_LINEAR=y
 CONFIG_MD_RAID0=y
 CONFIG_MD_RAID1=y
-CONFIG_MD_RAID10=m
-CONFIG_MD_RAID456=m
 CONFIG_MD_MULTIPATH=m
 CONFIG_MD_FAULTY=m
 CONFIG_BLK_DEV_DM=y
+CONFIG_DM_UNSTRIPED=m
 CONFIG_DM_CRYPT=m
 CONFIG_DM_SNAPSHOT=m
+CONFIG_DM_THIN_PROVISIONING=m
+CONFIG_DM_CACHE=m
+CONFIG_DM_WRITECACHE=m
+CONFIG_DM_EBS=m
+CONFIG_DM_ERA=m
+CONFIG_DM_CLONE=m
 CONFIG_DM_MIRROR=m
+CONFIG_DM_LOG_USERSPACE=m
+CONFIG_DM_RAID=m
 CONFIG_DM_ZERO=m
 CONFIG_DM_MULTIPATH=m
 CONFIG_DM_MULTIPATH_QL=m
 CONFIG_DM_MULTIPATH_ST=m
+CONFIG_DM_MULTIPATH_HST=m
+CONFIG_DM_MULTIPATH_IOA=m
+CONFIG_DM_DELAY=m
+CONFIG_DM_DUST=m
+CONFIG_DM_INIT=y
 CONFIG_DM_UEVENT=y
 CONFIG_ADB_PMU=y
 CONFIG_PMAC_SMU=y
-- 
2.39.2

