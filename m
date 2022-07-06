Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86846568563
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 12:22:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdFwt2kctz3c08
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 20:22:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=txmb5oAo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=txmb5oAo;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdFwH5chzz3bl3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 20:22:23 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0BA21B81BD2;
	Wed,  6 Jul 2022 10:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56115C3411C;
	Wed,  6 Jul 2022 10:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657102939;
	bh=SMQcYq8ni/D8jrt39kIE8+5UERyv9ocsQz7ZXYAUkIc=;
	h=From:To:Cc:Subject:Date:From;
	b=txmb5oAobChslywtvbJ+gpAXqasBVWhd6fmlE51OsCkOYpAIPcblocnnezSWIrZCA
	 LmFXulu9mSy9W6fxEZTIiFiBYLAxpx4VQTG5BG7N++VYgmAPWq499lxsP2E+gadJg/
	 U7VJVjLZ2p2yylClQFtvinkB3mYF8fukQ9TAgp0aTPChyscJ9YH0F+o/LiayPDyhRS
	 7sDelXC3ceihiXBqc4dnA4Ex6lutvhNvKcuZ+l+FFhXDh1+HhlAxmBnoVdOCU92Yq0
	 ZdTRaEPN1YoAvu9tyl3Fp0KTwR3e1s/DRFbdr3mIHDOabZ6HbAg2nP5fR3CIyose/3
	 uecTIOhge4t3g==
Received: by pali.im (Postfix)
	id D5CD77BA; Wed,  6 Jul 2022 12:22:16 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Guowen Shan <gshan@redhat.com>,
	Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: [PATCH v2 1/2] powerpc/pci: Add config option for using OF 'reg' for PCI domain
Date: Wed,  6 Jul 2022 12:21:47 +0200
Message-Id: <20220706102148.5060-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit 63a72284b159 ("powerpc/pci: Assign fixed PHB number based on
device-tree properties"), powerpc kernel always fallback to PCI domain
assignment from OF / Device Tree 'reg' property of the PCI controller.

In most cases 'reg' property is not zero and therefore there it cause that
PCI domain zero is not present in system anymore.

PCI code for other Linux architectures use increasing assignment of the PCI
domain for individual controllers (assign the first free number), like it
was also for powerpc prior mentioned commit. Also it starts numbering
domains from zero.

Upgrading powerpc kernels from LTS 4.4 version (which does not contain
mentioned commit) to new LTS versions brings a change in domain assignment.

It can be problematic for embedded machines with single PCIe controller
where it is expected that PCIe card is connected on the domain zero.
Also it can be problematic as that commit changes PCIe domains in
multi-controller setup with fixed number of controller (without hotplug
support).

Originally that change was intended for powernv and pservers and specially
server machines with more PCI domains or hot plug support.

Fix this issue and introduce a new option CONFIG_PPC_PCI_DOMAIN_FROM_OF_REG.
When this option is disabled then powerpc kernel would assign PCI domains
in the similar way like it is doing kernel for other architectures,
starting from zero and also how it was done prior that commit.

This option is by default enabled for powernv and pseries platform for which
was that commit originally intended.

With this change upgrading kernels from LTS 4.4 version does not change PCI
domain on smaller embedded platforms with fixed number of PCIe controllers.
And also ensure that PCI domain zero is present as before that commit.

Fixes: 63a72284b159 ("powerpc/pci: Assign fixed PHB number based on device-tree properties")
Signed-off-by: Pali Rohár <pali@kernel.org>
---
Changes in v2:
* Enable CONFIG_PPC_PCI_DOMAIN_FROM_OF_REG by default on powernv and pseries
---
 arch/powerpc/Kconfig             | 11 +++++++++++
 arch/powerpc/kernel/pci-common.c |  4 ++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index f66084bc1dfe..053a88e84049 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -386,6 +386,17 @@ config PPC_OF_PLATFORM_PCI
 	depends on PCI
 	depends on PPC64 # not supported on 32 bits yet
 
+config PPC_PCI_DOMAIN_FROM_OF_REG
+	bool "Use OF reg property for PCI domain"
+	depends on PCI
+	default y if PPC_PSERIES || PPC_POWERNV
+	help
+	  By default PCI domain for host bridge during its registration is
+	  chosen as the lowest unused PCI domain number.
+
+	  When this option is enabled then PCI domain can be determined
+	  also from lower bits of the OF / Device Tree 'reg' property.
+
 config ARCH_SUPPORTS_UPROBES
 	def_bool y
 
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index 068410cd54a3..7f959df34833 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -74,7 +74,6 @@ void __init set_pci_dma_ops(const struct dma_map_ops *dma_ops)
 static int get_phb_number(struct device_node *dn)
 {
 	int ret, phb_id = -1;
-	u32 prop_32;
 	u64 prop;
 
 	/*
@@ -83,7 +82,8 @@ static int get_phb_number(struct device_node *dn)
 	 * reading "ibm,opal-phbid", only present in OPAL environment.
 	 */
 	ret = of_property_read_u64(dn, "ibm,opal-phbid", &prop);
-	if (ret) {
+	if (ret && IS_ENABLED(CONFIG_PPC_PCI_DOMAIN_FROM_OF_REG)) {
+		u32 prop_32;
 		ret = of_property_read_u32_index(dn, "reg", 1, &prop_32);
 		prop = prop_32;
 	}
-- 
2.20.1

