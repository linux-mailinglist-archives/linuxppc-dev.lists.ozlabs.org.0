Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CB7269797
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 23:19:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bqzl12nwwzDqQk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 07:19:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=79.137.123.220;
 helo=smtpout1.mo804.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo804.mail-out.ovh.net
 (smtpout1.mo804.mail-out.ovh.net [79.137.123.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqzXW0lyMzDqQG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 07:10:18 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.7])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id ADC016192E9A;
 Mon, 14 Sep 2020 23:10:15 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 14 Sep
 2020 23:10:14 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006efc5e924-5fbe-4737-a182-293eb6884393,
 D669A8CAADBA69FE96853FFB68FF36F34E8DD5E5) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 5/7] powerpc/powernv/pci: Remove unused variable 'parent'
 in pnv_ioda_configure_pe()
Date: Mon, 14 Sep 2020 23:10:05 +0200
Message-ID: <20200914211007.2285999-6-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200914211007.2285999-1-clg@kaod.org>
References: <20200914211007.2285999-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 960e9d83-80fa-4093-b570-87a759713cfd
X-Ovh-Tracer-Id: 15868151815293733670
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudeiiedgudeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This fixes a compile error with W=1.

CC      arch/powerpc/platforms/powernv/pci-ioda.o
../arch/powerpc/platforms/powernv/pci-ioda.c: In function ‘pnv_ioda_configure_pe’:
../arch/powerpc/platforms/powernv/pci-ioda.c:897:18: error: variable ‘parent’ set but not used [-Werror=unused-but-set-variable]
  struct pci_dev *parent;
                  ^~~~~~

Cc: Oliver O'Halloran <oohall@gmail.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 023a4f987bb2..2b4ceb5e6ce4 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -894,7 +894,6 @@ int pnv_ioda_deconfigure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
 
 int pnv_ioda_configure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
 {
-	struct pci_dev *parent;
 	uint8_t bcomp, dcomp, fcomp;
 	long rc, rid_end, rid;
 
@@ -904,7 +903,6 @@ int pnv_ioda_configure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
 
 		dcomp = OPAL_IGNORE_RID_DEVICE_NUMBER;
 		fcomp = OPAL_IGNORE_RID_FUNCTION_NUMBER;
-		parent = pe->pbus->self;
 		if (pe->flags & PNV_IODA_PE_BUS_ALL)
 			count = resource_size(&pe->pbus->busn_res);
 		else
@@ -925,12 +923,6 @@ int pnv_ioda_configure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
 		}
 		rid_end = pe->rid + (count << 8);
 	} else {
-#ifdef CONFIG_PCI_IOV
-		if (pe->flags & PNV_IODA_PE_VF)
-			parent = pe->parent_dev;
-		else
-#endif /* CONFIG_PCI_IOV */
-			parent = pe->pdev->bus->self;
 		bcomp = OpalPciBusAll;
 		dcomp = OPAL_COMPARE_RID_DEVICE_NUMBER;
 		fcomp = OPAL_COMPARE_RID_FUNCTION_NUMBER;
-- 
2.25.4

