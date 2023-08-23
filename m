Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AD5784FBD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 06:48:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pijAWz0L;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVtyx5wk2z3c2L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 14:48:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pijAWz0L;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVty36j4yz2yDY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 14:48:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692766087;
	bh=B88V4iE7zzlEKCRetdzlYjgqK4KYJQQVOM6Prcu69FA=;
	h=From:To:Cc:Subject:Date:From;
	b=pijAWz0Le6GDxA0JBdZcxiRKe6SK/mN8kRXkhBNM9DWL878HfMecr9Z1cQKy+mHPy
	 xTo9KBDQXY9+yLla7Z++vbf8xXSbFDMJXE56L5wq9UeRC31dO5Qj1RXEw1NMiPr28O
	 hrPG6tzXA3kW6uBcjs/WOzpxiBFNP7LCeuWMeDMaielP/vxBj6vKmAH9DumCiC9y0Z
	 EcHZNM2AN7buywqChU6JeALXvnIPW0Xv6YC2wkA7fCK5cq/VLHBZ4v35o5R6zIcAJo
	 Q+CrY5Jh2b2tBGfXDsWepqXLNXXT7wYJyxMo/XDcQdiPxSoGIQMRn0Xvks6NfHHNmH
	 uVSdn36me7wSA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RVtxz39xBz4wxn;
	Wed, 23 Aug 2023 14:48:07 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] cxl: Drop unused detach_spa()
Date: Wed, 23 Aug 2023 14:48:03 +1000
Message-ID: <20230823044803.737175-1-mpe@ellerman.id.au>
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
Cc: fbarrat@linux.ibm.com, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Clang warns:
  drivers/misc/cxl/native.c:272:20: error: unused function 'detach_spa' [-Werror,-Wunused-function]

It was created as part of some refactoring in commit 05155772f642 ("cxl:
Allocate and release the SPA with the AFU"), but has never been called
in its current form. Drop it.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 drivers/misc/cxl/native.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/misc/cxl/native.c b/drivers/misc/cxl/native.c
index 50b0c44bb8d7..fbe16a6ab7ad 100644
--- a/drivers/misc/cxl/native.c
+++ b/drivers/misc/cxl/native.c
@@ -269,11 +269,6 @@ static void attach_spa(struct cxl_afu *afu)
 	cxl_p1n_write(afu, CXL_PSL_SPAP_An, spap);
 }
 
-static inline void detach_spa(struct cxl_afu *afu)
-{
-	cxl_p1n_write(afu, CXL_PSL_SPAP_An, 0);
-}
-
 void cxl_release_spa(struct cxl_afu *afu)
 {
 	if (afu->native->spa) {
-- 
2.41.0

