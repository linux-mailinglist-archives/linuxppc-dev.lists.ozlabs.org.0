Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A826568569
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 12:23:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdFxX3rXJz3c5b
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 20:23:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TIRgolfA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TIRgolfA;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdFwJ4Z0Cz3bl3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 20:22:24 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0FF4861E1C;
	Wed,  6 Jul 2022 10:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B26C341C0;
	Wed,  6 Jul 2022 10:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657102940;
	bh=5RJNNFRIVghvmdUSW6GuwgiuwsPcvqMprUl9pG2CXAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TIRgolfAO2xEEw7akxf7//984YrubOnA0R8bW1OE6XDQJxiyw+77sZBa1fj+WlZv/
	 d/URcRVv6rQHA/wtyn33AP0T/phtAXwwyN7ngWhcLsFwIEGav9gYP8NfrevZb7BoBL
	 UWgm3BUAAFRH4nTqmYvQN8DuJZiq0Vc+L1t4fgQT/ygCtrvDZT7+zYgocVUtPRcA/v
	 JgDC1x558eTV5Nxj+9PGYjGyAGRiZYI/2K3QP9PJ3g3uDJh7sdJwKatBBqd+tItnaG
	 p0vJmPNOcCj2d0DU2FijgNMNRafXxWCVTQyoNfiP8Kd9+MHrdm8e4zJNXUbY4mG5a8
	 oxIF+7fqD69zg==
Received: by pali.im (Postfix)
	id C570A7F1; Wed,  6 Jul 2022 12:22:17 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Guowen Shan <gshan@redhat.com>,
	Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: [PATCH v2 2/2] powerpc/pci: Prefer PCI domain assignment via DT 'linux,pci-domain' and alias
Date: Wed,  6 Jul 2022 12:21:48 +0200
Message-Id: <20220706102148.5060-2-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220706102148.5060-1-pali@kernel.org>
References: <20220706102148.5060-1-pali@kernel.org>
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

Other Linux architectures use DT property 'linux,pci-domain' for specifying
fixed PCI domain of PCI controller specified in Device-Tree.

And lot of Freescale powerpc boards have defined numbered pci alias in
Device-Tree for every PCIe controller which number specify preferred PCI
domain.

So prefer usage of DT property 'linux,pci-domain' (via function
of_get_pci_domain_nr()) and DT pci alias (via function of_alias_get_id())
on powerpc architecture for assigning PCI domain to PCI controller.

Fixes: 63a72284b159 ("powerpc/pci: Assign fixed PHB number based on device-tree properties")
Signed-off-by: Pali Rohár <pali@kernel.org>
---
Changes in v2:
* New patch
---
 arch/powerpc/kernel/pci-common.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index 7f959df34833..0715d74855b3 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -78,10 +78,25 @@ static int get_phb_number(struct device_node *dn)
 
 	/*
 	 * Try fixed PHB numbering first, by checking archs and reading
-	 * the respective device-tree properties. Firstly, try powernv by
-	 * reading "ibm,opal-phbid", only present in OPAL environment.
+	 * the respective device-tree properties. Firstly, try reading
+	 * standard "linux,pci-domain", then try reading "ibm,opal-phbid"
+	 * (only present in powernv OPAL environment), then try device-tree
+	 * alias and as the last try to use lower bits of "reg" property
+	 * (only if CONFIG_PPC_PCI_DOMAIN_FROM_OF_REG is enabled).
 	 */
-	ret = of_property_read_u64(dn, "ibm,opal-phbid", &prop);
+	ret = of_get_pci_domain_nr(dn);
+	if (ret >= 0) {
+		prop = ret;
+		ret = 0;
+	}
+	if (ret)
+		ret = of_property_read_u64(dn, "ibm,opal-phbid", &prop);
+	if (ret)
+		ret = of_alias_get_id(dn, "pci");
+	if (ret >= 0) {
+		prop = ret;
+		ret = 0;
+	}
 	if (ret && IS_ENABLED(CONFIG_PPC_PCI_DOMAIN_FROM_OF_REG)) {
 		u32 prop_32;
 		ret = of_property_read_u32_index(dn, "reg", 1, &prop_32);
@@ -95,10 +110,7 @@ static int get_phb_number(struct device_node *dn)
 	if ((phb_id >= 0) && !test_and_set_bit(phb_id, phb_bitmap))
 		return phb_id;
 
-	/*
-	 * If not pseries nor powernv, or if fixed PHB numbering tried to add
-	 * the same PHB number twice, then fallback to dynamic PHB numbering.
-	 */
+	/* If everything fails then fallback to dynamic PHB numbering. */
 	phb_id = find_first_zero_bit(phb_bitmap, MAX_PHBS);
 	BUG_ON(phb_id >= MAX_PHBS);
 	set_bit(phb_id, phb_bitmap);
-- 
2.20.1

