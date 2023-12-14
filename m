Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F770812D17
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 11:35:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OzCRiAsf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrTK76DHQz3wKg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 21:35:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OzCRiAsf;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrTDl5zSKz3vhl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 21:32:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1702549927;
	bh=wq25GBJsbyghd55GhhhgbPyxN8BeAnr9gNBYTVIUpPs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OzCRiAsfvE/MJiS5OPusWIC2gJQhPD09SHuFxXokr64wyYQrZialQTGpNYmkqBA2j
	 66UMyYAW7tdn20EOajWVbv8Fl+dnYz8URxGFLoCAuVxH3949xRhkes/6gF0TVeLcwT
	 4KoMFWw3cqGdMT9K/wxlyduoSwqROYlggR7dRay7RybY+Mw5NsUu0KdbTia+yXyZYw
	 +oscrfxUhR2gODqFFbD5C3ceZ6DsQtKdU7/4Ku6jHfIsQMAOI62qP2ey7rRYwntI+r
	 pT2vDS08k4EFuW4ZXvua/HhmtdOd+jXZIgVh5Of8aQiJTyFIlxSBO7PR3DB52HAlxQ
	 eLX2dzWM+Q9wA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SrTDl4rgGz4xRn;
	Thu, 14 Dec 2023 21:32:07 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 5/5] powerpc: Stop using of_root
Date: Thu, 14 Dec 2023 21:31:52 +1100
Message-ID: <20231214103152.12269-5-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214103152.12269-1-mpe@ellerman.id.au>
References: <20231214103152.12269-1-mpe@ellerman.id.au>
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
Cc: robh+dt@kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

Replace all usages of of_root by of_find_node_by_path("/")

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/secure_boot.c        |  8 ++++++--
 arch/powerpc/kexec/ranges.c              |  8 +++++---
 arch/powerpc/mm/drmem.c                  | 10 +++++-----
 arch/powerpc/mm/numa.c                   |  6 ++++--
 arch/powerpc/platforms/52xx/efika.c      |  4 +++-
 arch/powerpc/platforms/pasemi/pci.c      |  4 +++-
 arch/powerpc/platforms/pseries/lparcfg.c |  6 +++++-
 arch/powerpc/platforms/pseries/setup.c   | 12 +++++++++---
 8 files changed, 40 insertions(+), 18 deletions(-)

v2: Unchanged.

diff --git a/arch/powerpc/kernel/secure_boot.c b/arch/powerpc/kernel/secure_boot.c
index f9af305d9579..9e0efb657f39 100644
--- a/arch/powerpc/kernel/secure_boot.c
+++ b/arch/powerpc/kernel/secure_boot.c
@@ -32,8 +32,10 @@ bool is_ppc_secureboot_enabled(void)
 	if (enabled)
 		goto out;
 
-	if (!of_property_read_u32(of_root, "ibm,secure-boot", &secureboot))
+	node = of_find_node_by_path("/");
+	if (!of_property_read_u32(node, "ibm,secure-boot", &secureboot))
 		enabled = (secureboot > 1);
+	of_node_put(node);
 
 out:
 	pr_info("Secure boot mode %s\n", enabled ? "enabled" : "disabled");
@@ -54,8 +56,10 @@ bool is_ppc_trustedboot_enabled(void)
 	if (enabled)
 		goto out;
 
-	if (!of_property_read_u32(of_root, "ibm,trusted-boot", &trustedboot))
+	node = of_find_node_by_path("/");
+	if (!of_property_read_u32(node, "ibm,trusted-boot", &trustedboot))
 		enabled = (trustedboot > 0);
+	of_node_put(node);
 
 out:
 	pr_info("Trusted boot mode %s\n", enabled ? "enabled" : "disabled");
diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
index fb3e12f15214..33b780049aaf 100644
--- a/arch/powerpc/kexec/ranges.c
+++ b/arch/powerpc/kexec/ranges.c
@@ -385,14 +385,16 @@ int add_opal_mem_range(struct crash_mem **mem_ranges)
 int add_reserved_mem_ranges(struct crash_mem **mem_ranges)
 {
 	int n_mem_addr_cells, n_mem_size_cells, i, len, cells, ret = 0;
+	struct device_node *root = of_find_node_by_path("/");
 	const __be32 *prop;
 
-	prop = of_get_property(of_root, "reserved-ranges", &len);
+	prop = of_get_property(root, "reserved-ranges", &len);
+	n_mem_addr_cells = of_n_addr_cells(root);
+	n_mem_size_cells = of_n_size_cells(root);
+	of_node_put(root);
 	if (!prop)
 		return 0;
 
-	n_mem_addr_cells = of_n_addr_cells(of_root);
-	n_mem_size_cells = of_n_size_cells(of_root);
 	cells = n_mem_addr_cells + n_mem_size_cells;
 
 	/* Each reserved range is an (address,size) pair */
diff --git a/arch/powerpc/mm/drmem.c b/arch/powerpc/mm/drmem.c
index fde7790277f7..c110ab8fa8a3 100644
--- a/arch/powerpc/mm/drmem.c
+++ b/arch/powerpc/mm/drmem.c
@@ -393,17 +393,17 @@ static const __be32 *of_get_usable_memory(struct device_node *dn)
 int walk_drmem_lmbs(struct device_node *dn, void *data,
 		    int (*func)(struct drmem_lmb *, const __be32 **, void *))
 {
+	struct device_node *root = of_find_node_by_path("/");
 	const __be32 *prop, *usm;
 	int ret = -ENODEV;
 
-	if (!of_root)
+	if (!root)
 		return ret;
 
 	/* Get the address & size cells */
-	of_node_get(of_root);
-	n_root_addr_cells = of_n_addr_cells(of_root);
-	n_root_size_cells = of_n_size_cells(of_root);
-	of_node_put(of_root);
+	n_root_addr_cells = of_n_addr_cells(root);
+	n_root_size_cells = of_n_size_cells(root);
+	of_node_put(root);
 
 	if (init_drmem_lmb_size(dn))
 		return ret;
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index f6c4ace3b221..a490724e84ad 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -1111,7 +1111,7 @@ static void __init setup_node_data(int nid, u64 start_pfn, u64 end_pfn)
 
 static void __init find_possible_nodes(void)
 {
-	struct device_node *rtas;
+	struct device_node *rtas, *root;
 	const __be32 *domains = NULL;
 	int prop_length, max_nodes;
 	u32 i;
@@ -1132,10 +1132,12 @@ static void __init find_possible_nodes(void)
 	 * If the LPAR is migratable, new nodes might be activated after a LPM,
 	 * so we should consider the max number in that case.
 	 */
-	if (!of_get_property(of_root, "ibm,migratable-partition", NULL))
+	root = of_find_node_by_path("/");
+	if (!of_get_property(root, "ibm,migratable-partition", NULL))
 		domains = of_get_property(rtas,
 					  "ibm,current-associativity-domains",
 					  &prop_length);
+	of_node_put(root);
 	if (!domains) {
 		domains = of_get_property(rtas, "ibm,max-associativity-domains",
 					&prop_length);
diff --git a/arch/powerpc/platforms/52xx/efika.c b/arch/powerpc/platforms/52xx/efika.c
index aa82e6b437f3..37a67120f257 100644
--- a/arch/powerpc/platforms/52xx/efika.c
+++ b/arch/powerpc/platforms/52xx/efika.c
@@ -195,8 +195,10 @@ static void __init efika_setup_arch(void)
 
 static int __init efika_probe(void)
 {
-	const char *model = of_get_property(of_root, "model", NULL);
+	struct device_node *root = of_find_node_by_path("/");
+	const char *model = of_get_property(root, "model", NULL);
 
+	of_node_put(root);
 	if (model == NULL)
 		return 0;
 	if (strcmp(model, "EFIKA5K2"))
diff --git a/arch/powerpc/platforms/pasemi/pci.c b/arch/powerpc/platforms/pasemi/pci.c
index f27d31414737..60f990a336c4 100644
--- a/arch/powerpc/platforms/pasemi/pci.c
+++ b/arch/powerpc/platforms/pasemi/pci.c
@@ -270,16 +270,18 @@ static int __init pas_add_bridge(struct device_node *dev)
 
 void __init pas_pci_init(void)
 {
+	struct device_node *root = of_find_node_by_path("/");
 	struct device_node *np;
 	int res;
 
 	pci_set_flags(PCI_SCAN_ALL_PCIE_DEVS);
 
-	np = of_find_compatible_node(of_root, NULL, "pasemi,rootbus");
+	np = of_find_compatible_node(root, NULL, "pasemi,rootbus");
 	if (np) {
 		res = pas_add_bridge(np);
 		of_node_put(np);
 	}
+	of_node_put(root);
 }
 
 void __iomem *__init pasemi_pci_getcfgaddr(struct pci_dev *dev, int offset)
diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index 1c151d77e74b..f73c4d1c26af 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -346,9 +346,13 @@ static int read_rtas_lpar_name(struct seq_file *m)
  */
 static int read_dt_lpar_name(struct seq_file *m)
 {
+	struct device_node *root = of_find_node_by_path("/");
 	const char *name;
+	int ret;
 
-	if (of_property_read_string(of_root, "ibm,partition-name", &name))
+	ret = of_property_read_string(root, "ibm,partition-name", &name);
+	of_node_put(root);
+	if (ret)
 		return -ENOENT;
 
 	seq_printf(m, "partition_name=%s\n", name);
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index ecea85c74c43..284a6fa04b0c 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -1029,9 +1029,11 @@ static void __init pseries_add_hw_description(void)
 		return;
 	}
 
-	if (of_property_read_bool(of_root, "ibm,powervm-partition") ||
-	    of_property_read_bool(of_root, "ibm,fw-net-version"))
+	dn = of_find_node_by_path("/");
+	if (of_property_read_bool(dn, "ibm,powervm-partition") ||
+	    of_property_read_bool(dn, "ibm,fw-net-version"))
 		seq_buf_printf(&ppc_hw_desc, "hv:phyp ");
+	of_node_put(dn);
 }
 
 /*
@@ -1091,7 +1093,11 @@ static void pseries_power_off(void)
 
 static int __init pSeries_probe(void)
 {
-	if (!of_node_is_type(of_root, "chrp"))
+	struct device_node *root = of_find_node_by_path("/");
+	bool ret = of_node_is_type(root, "chrp");
+
+	of_node_put(root);
+	if (!ret)
 		return 0;
 
 	/* Cell blades firmware claims to be chrp while it's not. Until this
-- 
2.43.0

