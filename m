Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 380953296E7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 09:28:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqVf00RPyz3cRD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 19:28:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=VjVyB7rF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=VjVyB7rF; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqVdW3dkhz30Ms
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 19:28:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=QIDoycnXV4u4apFX/LX0JZIstXHhhjNZbn+dJEAjxXY=; b=VjVyB7rFd93m5C2LrWCFcP6i5P
 +JDCMN11DWzqdn4erC+f+L0KTco+yE21te+GYXWOgGV4f7I3aLfwC8m+mprhVHkix7l0sJCuVojEg
 bRKwvsvzM2cuRghPI3plbQgNYEIa5H5CjF/6ehIfy36bCG5iIZUVZNRjjrJ+XwA4rYw2+OGlsei9M
 PYjueUjNPmK/Vrv4GPpT9DqLs56O0seUMs0QCEqMg6feXogi/FCJB71lj/QIubGJAFb/f0If/uZo6
 Quh1g5M+EHgMufJzYI9rIoL/2VEFSXp6ve5/iab/0yMKtV5sHzk7S+M3g8LZJk+wuvTwfj5bihU7d
 UaT3ZKnQ==;
Received: from [2601:1c0:6280:3f0::3ba4] (helo=merlin.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lH0O7-0002OX-QD; Tue, 02 Mar 2021 08:28:16 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: iommu: fix build when neither PCI or IBMVIO is set
Date: Tue,  2 Mar 2021 00:28:11 -0800
Message-Id: <20210302082811.8671-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 kernel test robot <lkp@intel.com>, Anton Blanchard <anton@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When neither CONFIG_PCI nor CONFIG_IBMVIO is enabled:

../arch/powerpc/kernel/iommu.c:178:30: error: 'fail_iommu_bus_notifier' defined but not used [-Werror=unused-variable]
  178 | static struct notifier_block fail_iommu_bus_notifier = {

If only that struct is bounded by 2 #if defined() phrases (PCI && IBMVIO):

../arch/powerpc/kernel/iommu.c:162:12: error: 'fail_iommu_bus_notify' defined but not used [-Werror=unused-function]
  162 | static int fail_iommu_bus_notify(struct notifier_block *nb,

If that function is also guarded by 2 #if defined() phrases:

In file included from ../include/linux/dma-mapping.h:7,
                 from ../arch/powerpc/kernel/iommu.c:19:
../include/linux/device.h:131:26: error: 'dev_attr_fail_iommu' defined but not used [-Werror=unused-variable]
  131 |  struct device_attribute dev_attr_##_name = __ATTR_RW(_name)
../arch/powerpc/kernel/iommu.c:160:8: note: in expansion of macro 'DEVICE_ATTR_RW'
  160 | static DEVICE_ATTR_RW(fail_iommu);

and the snowball continues to grow.
Next I got this one:

../arch/powerpc/kernel/iommu.c: In function 'iommu_range_alloc':
../arch/powerpc/kernel/iommu.c:234:6: error: implicit declaration of function 'should_fail_iommu'; did you mean 'should_failslab'? [-Werror=implicit-function-declaration]
  234 |  if (should_fail_iommu(dev))

and

../arch/powerpc/kernel/iommu.c: In function 'should_fail_iommu':
../arch/powerpc/kernel/iommu.c:122:50: error: 'fail_iommu' undeclared (first use in this function)
  122 |  return dev->archdata.fail_iommu && should_fail(&fail_iommu, 1);

So combine CONFIG_FAIL_IOMMU && (CONFIG_PCI || CONFIG_IBMVIO)
to decide on building some of this code/data.

This came from a .config file from the kernel test robot, but it was
not for this particular build problem.

Fixes: d6b9a81b2a45 ("powerpc: IOMMU fault injection")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Anton Blanchard <anton@samba.org>
---
Found/seen in v5.12-rc1.

 arch/powerpc/kernel/iommu.c |   13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

--- lnx-512-rc1.orig/arch/powerpc/kernel/iommu.c
+++ lnx-512-rc1/arch/powerpc/kernel/iommu.c
@@ -115,7 +115,13 @@ static int __init setup_iommu_pool_hash(
 }
 subsys_initcall(setup_iommu_pool_hash);
 
-#ifdef CONFIG_FAIL_IOMMU
+#if defined(CONFIG_FAIL_IOMMU) && \
+   (defined(CONFIG_PCI) || defined(CONFIG_IBMVIO))
+
+static bool should_fail_iommu(struct device *dev)
+{
+	return dev->archdata.fail_iommu && should_fail(&fail_iommu, 1);
+}
 
 static DECLARE_FAULT_ATTR(fail_iommu);
 
@@ -125,11 +131,6 @@ static int __init setup_fail_iommu(char
 }
 __setup("fail_iommu=", setup_fail_iommu);
 
-static bool should_fail_iommu(struct device *dev)
-{
-	return dev->archdata.fail_iommu && should_fail(&fail_iommu, 1);
-}
-
 static int __init fail_iommu_debugfs(void)
 {
 	struct dentry *dir = fault_create_debugfs_attr("fail_iommu",
