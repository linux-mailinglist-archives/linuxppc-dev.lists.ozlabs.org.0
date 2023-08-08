Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C51C7737C6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 05:57:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKfXZ5z8Dz3bP2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 13:57:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=wangxiongfeng2@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKfWv5BX6z2xsY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 13:56:55 +1000 (AEST)
Received: from dggpemm500002.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RKfSR5cbkz1hwCb;
	Tue,  8 Aug 2023 11:53:59 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500002.china.huawei.com (7.185.36.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 11:56:47 +0800
From: Xiongfeng Wang <wangxiongfeng2@huawei.com>
To: <bhelgaas@google.com>, <fbarrat@linux.ibm.com>, <ajd@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <ben.widawsky@intel.com>
Subject: [PATCH v2 0/2] Introduce pci_find_next_dvsec_capability() to simplify the code
Date: Tue, 8 Aug 2023 12:08:56 +0800
Message-ID: <20230808040858.183568-1-wangxiongfeng2@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500002.china.huawei.com (7.185.36.229)
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
Cc: linux-pci@vger.kernel.org, yangyingliang@huawei.com, helgaas@kernel.org, david.e.box@linux.intel.com, jonathan.cameron@huawei.com, linuxppc-dev@lists.ozlabs.org, wangxiongfeng2@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some devices may have several DVSEC (Designated Vendor-Specific Extended
Capability) entries with the same DVSEC ID. Introduce
pci_find_next_dvsec_capability() to simplify the code.

ChangeLog:
v1->v2:  Add Reviewed-by and Acked-by tags
	 Modify commit message and document a little for the first patch

Xiongfeng Wang (2):
  PCI: Add pci_find_next_dvsec_capability to find next Designated VSEC
  ocxl: use pci_find_next_dvsec_capability() to simplify the code

 arch/powerpc/platforms/powernv/ocxl.c | 20 ++------------
 drivers/misc/ocxl/config.c            | 21 +++++----------
 drivers/pci/pci.c                     | 39 ++++++++++++++++++---------
 include/linux/pci.h                   |  2 ++
 include/misc/ocxl-config.h            |  4 ---
 5 files changed, 36 insertions(+), 50 deletions(-)

-- 
2.20.1

