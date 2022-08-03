Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0B4588765
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 08:32:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LyMVB2v0Dz3c5p
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 16:32:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mqp/ng79;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LyMTY4nDYz2xHm
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Aug 2022 16:32:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mqp/ng79;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LyMTV6Bj7z4x1J;
	Wed,  3 Aug 2022 16:31:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1659508320;
	bh=gMxNTB2P7jrP7bugWS0RZMfmn51Z7HvbcM//an+Nm3U=;
	h=From:To:Cc:Subject:Date:From;
	b=mqp/ng79HG1I9l5s0SVVVq3hyUdb9H0kix+P+YWHW0+yq3f8nvwtRdPNdn8hrfXea
	 mwR+mK5GbPB7+rNCt9XnGM7g4yB6kyr7DeWqVICfpdjo1OnT/d7467zrYsFtNUUMzW
	 QD+rmrIyTAbOcWwwUo7J+x+R+tHLy4tmFzj5/oSzh/fVdXi3RGKzyCnSls3e0vIkLP
	 0dDN8D4GfJbl3nlwcv8gE3uBE8S371pFu73TRaPg5uH7lceBi2gBeLyAJDcuH1Df93
	 yhYfwi2OL1ugC7yXAinQqSuKgHMEOjUC4URlsrVnarJYAcTlSwArL/uhAwsEOZhu+4
	 Gs3sWZNnUF1Vg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/64e: Fix kexec build error
Date: Wed,  3 Aug 2022 16:31:52 +1000
Message-Id: <20220803063152.1249270-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.3
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
Cc: aik@ozlabs.ru
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When building ppc64_book3e_allmodconfig the build fails with:

  arch/powerpc/kexec/file_load_64.c:1063:14: error: implicit declaration of function ‘firmware_has_feature’
   1063 |         if (!firmware_has_feature(FW_FEATURE_LPAR))
        |              ^~~~~~~~~~~~~~~~~~~~

Add a direct include of asm/firmware.h to fix the error.

Fixes: b1fc44eaa9ba ("pseries/iommu/ddw: Fix kdump to work in absence of ibm,dma-window")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kexec/file_load_64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 5d2c22aa34fb..683462e4556b 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -23,6 +23,7 @@
 #include <linux/vmalloc.h>
 #include <asm/setup.h>
 #include <asm/drmem.h>
+#include <asm/firmware.h>
 #include <asm/kexec_ranges.h>
 #include <asm/crashdump-ppc64.h>
 
-- 
2.35.3

