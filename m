Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91830347AA1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 15:24:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F59VV4dp8z30LB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 01:24:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com;
 envelope-from=yuehaibing@huawei.com; receiver=<UNKNOWN>)
X-Greylist: delayed 1007 seconds by postgrey-1.36 at boromir;
 Thu, 25 Mar 2021 01:24:34 AEDT
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F59VB2JnXz30C3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 01:24:34 +1100 (AEDT)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F594C2mlrz19HW9;
 Wed, 24 Mar 2021 22:05:31 +0800 (CST)
Received: from localhost (10.174.179.96) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Wed, 24 Mar 2021
 22:07:21 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <ruscur@russell.cc>, <oohall@gmail.com>, <mpe@ellerman.id.au>,
 <benh@kernel.crashing.org>, <paulus@samba.org>
Subject: [PATCH -next] powerpc/eeh: Remove unused inline function
 eeh_dev_phb_init_dynamic()
Date: Wed, 24 Mar 2021 22:07:14 +0800
Message-ID: <20210324140714.19612-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.96]
X-CFilter-Loop: Reflected
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
Cc: YueHaibing <yuehaibing@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

commit 475028efc708 ("powerpc/eeh: Remove eeh_dev_phb_init_dynamic()")
left behind this, so can remove it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 arch/powerpc/include/asm/eeh.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index b1a5bba2e0b9..ee0e7b8eac60 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -333,8 +333,6 @@ static inline bool eeh_enabled(void)
 
 static inline void eeh_show_enabled(void) { }
 
-static inline void eeh_dev_phb_init_dynamic(struct pci_controller *phb) { }
-
 static inline int eeh_check_failure(const volatile void __iomem *token)
 {
 	return 0;
-- 
2.17.1

