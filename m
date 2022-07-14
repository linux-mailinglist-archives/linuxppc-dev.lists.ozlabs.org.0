Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8965B57468D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 10:18:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lk6p93Z2wz3cf0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 18:18:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lk6np0jk9z3bx3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 18:18:36 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
	by ozlabs.ru (Postfix) with ESMTP id 58DA2804CB;
	Thu, 14 Jul 2022 04:18:26 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel 0/3] powerpc/iommu: Add iommu_ops to report capabilities and allow blocking domains
Date: Thu, 14 Jul 2022 18:18:19 +1000
Message-Id: <20220714081822.3717693-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
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
Cc: kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, Daniel Henrique Barboza <danielhb413@gmail.com>, Deming Wang <wangdeming@inspur.com>, kvm-ppc@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Here is another take on iommu_ops on POWER to make VFIO work
again on POWERPC64.

The tree with all prerequisites is here:
https://github.com/aik/linux/tree/kvm-fixes-wip

The previous discussion is here:
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220707135552.3688927-1-aik@ozlabs.ru/
https://patchwork.ozlabs.org/project/kvm-ppc/patch/20220701061751.1955857-1-aik@ozlabs.ru/

Please comment. Thanks.



Alexey Kardashevskiy (3):
  powerpc/iommu: Add "borrowing" iommu_table_group_ops
  powerpc/pci_64: Init pcibios subsys a bit later
  powerpc/iommu: Add iommu_ops to report capabilities and allow blocking
    domains

 arch/powerpc/include/asm/iommu.h          |   6 +-
 arch/powerpc/include/asm/pci-bridge.h     |   7 +
 arch/powerpc/platforms/pseries/pseries.h  |   5 +
 arch/powerpc/kernel/iommu.c               | 257 +++++++++++++++++++++-
 arch/powerpc/kernel/pci_64.c              |   2 +-
 arch/powerpc/platforms/powernv/pci-ioda.c |  36 ++-
 arch/powerpc/platforms/pseries/iommu.c    |  27 +++
 arch/powerpc/platforms/pseries/setup.c    |   3 +
 drivers/vfio/vfio_iommu_spapr_tce.c       |  96 ++------
 9 files changed, 345 insertions(+), 94 deletions(-)

-- 
2.30.2

