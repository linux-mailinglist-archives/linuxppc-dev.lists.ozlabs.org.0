Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF791C67E3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 08:08:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H5kH5c8szDqq3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 16:08:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=huawei.com;
 envelope-from=zou_wei@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
X-Greylist: delayed 966 seconds by postgrey-1.36 at bilbo;
 Wed, 06 May 2020 12:43:48 AEST
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H1BD3m2jzDqVq
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 12:43:44 +1000 (AEST)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 69940334E4C9448177D9;
 Wed,  6 May 2020 10:27:32 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Wed, 6 May 2020 10:27:25 +0800
From: Samuel Zou <zou_wei@huawei.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>
Subject: [PATCH -next] powerpc/kernel/sysfs: Use ARRAY_SIZE instead of
 calculating the array size
Date: Wed, 6 May 2020 10:33:36 +0800
Message-ID: <1588732416-33233-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 06 May 2020 16:06:55 +1000
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
Cc: Samuel Zou <zou_wei@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

fix coccinelle warning, use ARRAY_SIZE

arch/powerpc/kernel/sysfs.c:853:34-35: WARNING: Use ARRAY_SIZE
arch/powerpc/kernel/sysfs.c:860:33-34: WARNING: Use ARRAY_SIZE
arch/powerpc/kernel/sysfs.c:868:28-29: WARNING: Use ARRAY_SIZE
arch/powerpc/kernel/sysfs.c:947:34-35: WARNING: Use ARRAY_SIZE
arch/powerpc/kernel/sysfs.c:954:33-34: WARNING: Use ARRAY_SIZE
arch/powerpc/kernel/sysfs.c:962:28-29: WARNING: Use ARRAY_SIZE

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Samuel Zou <zou_wei@huawei.com>
---
 arch/powerpc/kernel/sysfs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index 571b325..13d2423 100644
--- a/arch/powerpc/kernel/sysfs.c
+++ b/arch/powerpc/kernel/sysfs.c
@@ -850,14 +850,14 @@ static int register_cpu_online(unsigned int cpu)
 #ifdef HAS_PPC_PMC_IBM
 	case PPC_PMC_IBM:
 		attrs = ibm_common_attrs;
-		nattrs = sizeof(ibm_common_attrs) / sizeof(struct device_attribute);
+		nattrs = ARRAY_SIZE(ibm_common_attrs);
 		pmc_attrs = classic_pmc_attrs;
 		break;
 #endif /* HAS_PPC_PMC_IBM */
 #ifdef HAS_PPC_PMC_G4
 	case PPC_PMC_G4:
 		attrs = g4_common_attrs;
-		nattrs = sizeof(g4_common_attrs) / sizeof(struct device_attribute);
+		nattrs = ARRAY_SIZE(g4_common_attrs);
 		pmc_attrs = classic_pmc_attrs;
 		break;
 #endif /* HAS_PPC_PMC_G4 */
@@ -865,7 +865,7 @@ static int register_cpu_online(unsigned int cpu)
 	case PPC_PMC_PA6T:
 		/* PA Semi starts counting at PMC0 */
 		attrs = pa6t_attrs;
-		nattrs = sizeof(pa6t_attrs) / sizeof(struct device_attribute);
+		nattrs = ARRAY_SIZE(pa6t_attrs);
 		pmc_attrs = NULL;
 		break;
 #endif
@@ -944,14 +944,14 @@ static int unregister_cpu_online(unsigned int cpu)
 #ifdef HAS_PPC_PMC_IBM
 	case PPC_PMC_IBM:
 		attrs = ibm_common_attrs;
-		nattrs = sizeof(ibm_common_attrs) / sizeof(struct device_attribute);
+		nattrs = ARRAY_SIZE(ibm_common_attrs);
 		pmc_attrs = classic_pmc_attrs;
 		break;
 #endif /* HAS_PPC_PMC_IBM */
 #ifdef HAS_PPC_PMC_G4
 	case PPC_PMC_G4:
 		attrs = g4_common_attrs;
-		nattrs = sizeof(g4_common_attrs) / sizeof(struct device_attribute);
+		nattrs = ARRAY_SIZE(g4_common_attrs);
 		pmc_attrs = classic_pmc_attrs;
 		break;
 #endif /* HAS_PPC_PMC_G4 */
@@ -959,7 +959,7 @@ static int unregister_cpu_online(unsigned int cpu)
 	case PPC_PMC_PA6T:
 		/* PA Semi starts counting at PMC0 */
 		attrs = pa6t_attrs;
-		nattrs = sizeof(pa6t_attrs) / sizeof(struct device_attribute);
+		nattrs = ARRAY_SIZE(pa6t_attrs);
 		pmc_attrs = NULL;
 		break;
 #endif
-- 
2.6.2

