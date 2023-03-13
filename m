Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5A96B808E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 19:30:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb4w26nPJz3cMr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 05:30:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=wjYC2fVs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=wjYC2fVs;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb4v57140z3bjY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 05:29:36 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 18F126147F;
	Mon, 13 Mar 2023 18:29:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E072C433D2;
	Mon, 13 Mar 2023 18:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678732172;
	bh=GZi6aIFaPbxyiWC7UgPxZNnPYWjFOCtg9+DHkUvetJc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wjYC2fVsQqfI5jh0QjqMMazt/qp4hQhyThWH9kCVBnHP1bow+OIbEgfcq3ow8wBJc
	 zD42zt3S7WDI0mpOSupC59RB09h7Or69T0tSWWIo/DotEOx1J+jhb/MPlgBQ3dhTgB
	 XYzC3m5S//TVyAc0td0hGo9n6uJJDpSOsvNO69OI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 12/36] powerpc/sysfs: move to use bus_get_dev_root()
Date: Mon, 13 Mar 2023 19:28:54 +0100
Message-Id: <20230313182918.1312597-12-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313182918.1312597-1-gregkh@linuxfoundation.org>
References: <20230313182918.1312597-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2139; i=gregkh@linuxfoundation.org; h=from:subject; bh=GZi6aIFaPbxyiWC7UgPxZNnPYWjFOCtg9+DHkUvetJc=; b=owGbwMvMwCRo6H6F97bub03G02pJDCn82eVP0u/d4E282/La+Y9Ge8br9zerjNax/HkmpCth9 X/H228nO2JZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAiYRwMC/b3P2fd75zX8XC9 8Nc57tnK866IszHMs1O3/T3dc4P9K86TE1i3JX65nm+wDAA=
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
Cc: David Hildenbrand <david@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Direct access to the struct bus_type dev_root pointer is going away soon
so replace that with a call to bus_get_dev_root() instead, which is what
it is there for.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
Note, this is a patch that is a prepatory cleanup as part of a larger
series of patches that is working on resolving some old driver core
design mistakes.  It will build and apply cleanly on top of 6.3-rc2 on
its own, but I'd prefer if I could take it through my driver-core tree
so that the driver core changes can be taken through there for 6.4-rc1.

 arch/powerpc/kernel/sysfs.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index ef9a61718940..0f39a6b84132 100644
--- a/arch/powerpc/kernel/sysfs.c
+++ b/arch/powerpc/kernel/sysfs.c
@@ -217,13 +217,18 @@ static DEVICE_ATTR(dscr_default, 0600,
 static void __init sysfs_create_dscr_default(void)
 {
 	if (cpu_has_feature(CPU_FTR_DSCR)) {
+		struct device *dev_root;
 		int cpu;
 
 		dscr_default = spr_default_dscr;
 		for_each_possible_cpu(cpu)
 			paca_ptrs[cpu]->dscr_default = dscr_default;
 
-		device_create_file(cpu_subsys.dev_root, &dev_attr_dscr_default);
+		dev_root = bus_get_dev_root(&cpu_subsys);
+		if (dev_root) {
+			device_create_file(dev_root, &dev_attr_dscr_default);
+			put_device(dev_root);
+		}
 	}
 }
 #endif /* CONFIG_PPC64 */
@@ -746,7 +751,12 @@ static DEVICE_ATTR(svm, 0444, show_svm, NULL);
 
 static void __init create_svm_file(void)
 {
-	device_create_file(cpu_subsys.dev_root, &dev_attr_svm);
+	struct device *dev_root = bus_get_dev_root(&cpu_subsys);
+
+	if (dev_root) {
+		device_create_file(dev_root, &dev_attr_svm);
+		put_device(dev_root);
+	}
 }
 #else
 static void __init create_svm_file(void)
-- 
2.39.2

