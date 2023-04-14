Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B366E24B0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 15:49:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pyd9S5tPWz3gjX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:49:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=b2iznGDH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pycd06P0bz3fSs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 23:25:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=b2iznGDH;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pycd05Bqyz4xVF;
	Fri, 14 Apr 2023 23:25:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681478708;
	bh=MhQgFQGd29Ey5Oz6Xwdrp0bRx+bzruK6rA1rv8xnnJc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=b2iznGDH8ynId94pk/cWh4TkBo7iHGHQOb+xh4RNCg6zZ0H/9ijAmZFkkC79KFlfd
	 Y2vlam6lndAQYrb9slYSwFNrC9WBz5Oa1D+zwamgCkuggGb3T/EOrbqSjD3SbygfQK
	 DFdzgfcRKEuqgtbanjDHGnpb1vHQASN3WDn+aEY8gm5pfCwqsZ9Yi9hrvCKMONl1BU
	 RK8NVDYH06miQBQ/79w24x7dbcCN7hsHc7hMIMBJhHyjogRZfXa+7+dVVSP/MSw4fp
	 bHXF8PxBj4hVW8Z9rRKMUrGmhd9hL/JmcAtkXJBsrsj0s2QOGSmOTlSWDhC+yqVmoE
	 WYZewF2Ce5+tw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 31/32] powerpc/configs: Make pseries_le an alias for ppc64le_guest
Date: Fri, 14 Apr 2023 23:24:14 +1000
Message-Id: <20230414132415.821564-31-mpe@ellerman.id.au>
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

Rather than trying to keep multiple configs up to date, make
pseries_le_defconfig an alias for ppc64le_guest_defconfig.

ppc64le_guest_defconfig should work in all cases that
pseries_le_defconfig currently does, but if not we can update it.

Move pseries_le_defconfig down in the Makefile, so it appears after
ppc64le_guest_defconfig in the help output.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Makefile | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 55c9b7968fbf..5b332d222ede 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -248,10 +248,6 @@ PHONY += bootwrapper_install
 
 include $(srctree)/scripts/Makefile.defconf
 
-generated_configs += pseries_le_defconfig
-pseries_le_defconfig:
-	$(call merge_into_defconfig,pseries_defconfig,le)
-
 generated_configs += ppc64le_defconfig
 ppc64le_defconfig:
 	$(call merge_into_defconfig,ppc64_defconfig,le)
@@ -264,6 +260,9 @@ generated_configs += ppc64_guest_defconfig
 ppc64_guest_defconfig:
 	$(call merge_into_defconfig,ppc64_defconfig,be guest kvm_guest)
 
+generated_configs += pseries_le_defconfig
+pseries_le_defconfig: ppc64le_guest_defconfig
+
 generated_configs += powernv_be_defconfig
 powernv_be_defconfig:
 	$(call merge_into_defconfig,powernv_defconfig,be)
-- 
2.39.2

