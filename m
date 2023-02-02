Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F51687FC9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 15:20:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P71CS4Mzqz3f5Y
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 01:20:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=nIGqz7tJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=nIGqz7tJ;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P71BW1Lhcz3c7l
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 01:19:30 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3F230B8266B;
	Thu,  2 Feb 2023 14:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D18C433EF;
	Thu,  2 Feb 2023 14:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675347565;
	bh=KnwbQz85rWjqz+hLEZM33hkE3pw3OH0c20SYsWCSuzU=;
	h=From:To:Cc:Subject:Date:From;
	b=nIGqz7tJGv6F1L20Nh/+Tl5V50cONLA9FukNblG4cy56k6BMcqZbjWKikVp/0LBrj
	 0Sgn7V3zQxSHhk3OKzQTXcQzvADpyPbZ5coRI1G01Eq21vNLKNGfS0rryOmogXmLba
	 fIlWfPlgD5ZtgzRHqhV/U5AUv3t6UV0yfI1a0Xq4=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] ppc: iommu: fix memory leak with using debugfs_lookup()
Date: Thu,  2 Feb 2023 15:19:19 +0100
Message-Id: <20230202141919.2298821-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1279; i=gregkh@linuxfoundation.org; h=from:subject; bh=KnwbQz85rWjqz+hLEZM33hkE3pw3OH0c20SYsWCSuzU=; b=owGbwMvMwCRo6H6F97bub03G02pJDMm3j6Vb7y/YsYtZckL5o9fubhNcFP9M5eyzu9e1cF+d5GlT ht0TO2JZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAiFaUM8525LKI9JrNeP+nxOTjPft PbSvYSQYb50Qc2vmT0nVLO7LOXYX+c0+RjpXL/AQ==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When calling debugfs_lookup() the result must have dput() called on it,
otherwise the memory will leak over time.  To make things simpler, just
call debugfs_lookup_and_remove() instead which handles all of the logic
at once.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/kernel/iommu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index caebe1431596..ee95937bdaf1 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -67,11 +67,9 @@ static void iommu_debugfs_add(struct iommu_table *tbl)
 static void iommu_debugfs_del(struct iommu_table *tbl)
 {
 	char name[10];
-	struct dentry *liobn_entry;
 
 	sprintf(name, "%08lx", tbl->it_index);
-	liobn_entry = debugfs_lookup(name, iommu_debugfs_dir);
-	debugfs_remove(liobn_entry);
+	debugfs_lookup_and_remove(name, iommu_debugfs_dir);
 }
 #else
 static void iommu_debugfs_add(struct iommu_table *tbl){}
-- 
2.39.1

