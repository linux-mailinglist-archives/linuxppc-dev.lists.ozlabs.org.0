Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CA15BE6BF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 15:11:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MX23y3jX5z3c8Z
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 23:11:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
X-Greylist: delayed 331 seconds by postgrey-1.36 at boromir; Tue, 20 Sep 2022 23:10:45 AEST
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MX23T1fqtz2xmr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 23:10:43 +1000 (AEST)
Received: from ole.1.ozlabs.ru (localhost [IPv6:::1])
	by ozlabs.ru (Postfix) with ESMTP id 9F1B482ED0;
	Tue, 20 Sep 2022 09:05:13 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v2 2/3] powerpc/pci_64: Init pcibios subsys a bit later
Date: Tue, 20 Sep 2022 23:04:56 +1000
Message-Id: <20220920130457.29742-3-aik@ozlabs.ru>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920130457.29742-1-aik@ozlabs.ru>
References: <20220920130457.29742-1-aik@ozlabs.ru>
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
Cc: kvm@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>, Nicholas Piggin <npiggin@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>, Alex Williamson <alex.williamson@redhat.com>, kvm-ppc@vger.kernel.org, Frederic Barrat <fbarrat@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The following patches are going to add dependency/use of iommu_ops which
is initialized in subsys_initcall as well.

This moves pciobios_init() to the next initcall level.

This should not cause behavioral change.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/kernel/pci_64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/pci_64.c b/arch/powerpc/kernel/pci_64.c
index 0c7cfb9fab04..9cd763d512ae 100644
--- a/arch/powerpc/kernel/pci_64.c
+++ b/arch/powerpc/kernel/pci_64.c
@@ -73,7 +73,7 @@ static int __init pcibios_init(void)
 	return 0;
 }
 
-subsys_initcall(pcibios_init);
+subsys_initcall_sync(pcibios_init);
 
 int pcibios_unmap_io_space(struct pci_bus *bus)
 {
-- 
2.37.3

