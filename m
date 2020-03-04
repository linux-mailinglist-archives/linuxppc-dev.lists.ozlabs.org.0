Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF2F178864
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 03:34:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XHyD3s6CzDqXq
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 13:34:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XHl72c6dzDqQx
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 13:24:35 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Mar 2020 18:24:30 -0800
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; d="scan'208";a="263436259"
Received: from dwillia2-desk3.jf.intel.com (HELO
 dwillia2-desk3.amr.corp.intel.com) ([10.54.39.16])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Mar 2020 18:24:30 -0800
Subject: [PATCH v4 4/5] libnvdimm/region: Introduce NDD_LABELING
From: Dan Williams <dan.j.williams@intel.com>
To: linux-nvdimm@lists.01.org
Date: Tue, 03 Mar 2020 18:08:24 -0800
Message-ID: <158328770472.2223916.5413598505602504160.stgit@dwillia2-desk3.amr.corp.intel.com>
In-Reply-To: <158328768294.2223916.16551505954326988623.stgit@dwillia2-desk3.amr.corp.intel.com>
References: <158328768294.2223916.16551505954326988623.stgit@dwillia2-desk3.amr.corp.intel.com>
User-Agent: StGit/0.18-3-g996c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, linux-kernel@vger.kernel.org,
 Jeff Moyer <jmoyer@redhat.com>, Oliver O'Halloran <oohall@gmail.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The NDD_ALIASING flag is used to indicate where pmem capacity might
alias with blk capacity and require labeling. It is also used to
indicate whether the DIMM supports labeling. Separate this latter
capability into its own flag so that the NDD_ALIASING flag is scoped to
true aliased configurations.

To my knowledge aliased configurations only exist in the ACPI spec,
there are no known platforms that ship this support in production.

This clarity allows namespace-capacity alignment constraints around
interleave-ways to be relaxed.

Cc: Vishal Verma <vishal.l.verma@intel.com>
Cc: Oliver O'Halloran <oohall@gmail.com>
Reviewed-by: Jeff Moyer <jmoyer@redhat.com>
Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Link: https://lore.kernel.org/r/158041477856.3889308.4212605617834097674.stgit@dwillia2-desk3.amr.corp.intel.com
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 arch/powerpc/platforms/pseries/papr_scm.c |    2 +-
 drivers/acpi/nfit/core.c                  |    4 +++-
 drivers/nvdimm/dimm.c                     |    2 +-
 drivers/nvdimm/dimm_devs.c                |    9 +++++----
 drivers/nvdimm/namespace_devs.c           |    2 +-
 drivers/nvdimm/nd.h                       |    2 +-
 drivers/nvdimm/region_devs.c              |   10 +++++-----
 include/linux/libnvdimm.h                 |    2 ++
 8 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 0b4467e378e5..589858cb3203 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -328,7 +328,7 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 	}
 
 	dimm_flags = 0;
-	set_bit(NDD_ALIASING, &dimm_flags);
+	set_bit(NDD_LABELING, &dimm_flags);
 
 	p->nvdimm = nvdimm_create(p->bus, p, NULL, dimm_flags,
 				  PAPR_SCM_DIMM_CMD_MASK, 0, NULL);
diff --git a/drivers/acpi/nfit/core.c b/drivers/acpi/nfit/core.c
index a3320f93616d..71d7f2aa1b12 100644
--- a/drivers/acpi/nfit/core.c
+++ b/drivers/acpi/nfit/core.c
@@ -2026,8 +2026,10 @@ static int acpi_nfit_register_dimms(struct acpi_nfit_desc *acpi_desc)
 			continue;
 		}
 
-		if (nfit_mem->bdw && nfit_mem->memdev_pmem)
+		if (nfit_mem->bdw && nfit_mem->memdev_pmem) {
 			set_bit(NDD_ALIASING, &flags);
+			set_bit(NDD_LABELING, &flags);
+		}
 
 		/* collate flags across all memdevs for this dimm */
 		list_for_each_entry(nfit_memdev, &acpi_desc->memdevs, list) {
diff --git a/drivers/nvdimm/dimm.c b/drivers/nvdimm/dimm.c
index 64776ed15bb3..7d4ddc4d9322 100644
--- a/drivers/nvdimm/dimm.c
+++ b/drivers/nvdimm/dimm.c
@@ -99,7 +99,7 @@ static int nvdimm_probe(struct device *dev)
 	if (ndd->ns_current >= 0) {
 		rc = nd_label_reserve_dpa(ndd);
 		if (rc == 0)
-			nvdimm_set_aliasing(dev);
+			nvdimm_set_labeling(dev);
 	}
 	nvdimm_bus_unlock(dev);
 
diff --git a/drivers/nvdimm/dimm_devs.c b/drivers/nvdimm/dimm_devs.c
index 94ea6dba6b4f..39a61a514746 100644
--- a/drivers/nvdimm/dimm_devs.c
+++ b/drivers/nvdimm/dimm_devs.c
@@ -32,7 +32,7 @@ int nvdimm_check_config_data(struct device *dev)
 
 	if (!nvdimm->cmd_mask ||
 	    !test_bit(ND_CMD_GET_CONFIG_DATA, &nvdimm->cmd_mask)) {
-		if (test_bit(NDD_ALIASING, &nvdimm->flags))
+		if (test_bit(NDD_LABELING, &nvdimm->flags))
 			return -ENXIO;
 		else
 			return -ENOTTY;
@@ -173,11 +173,11 @@ int nvdimm_set_config_data(struct nvdimm_drvdata *ndd, size_t offset,
 	return rc;
 }
 
-void nvdimm_set_aliasing(struct device *dev)
+void nvdimm_set_labeling(struct device *dev)
 {
 	struct nvdimm *nvdimm = to_nvdimm(dev);
 
-	set_bit(NDD_ALIASING, &nvdimm->flags);
+	set_bit(NDD_LABELING, &nvdimm->flags);
 }
 
 void nvdimm_set_locked(struct device *dev)
@@ -312,8 +312,9 @@ static ssize_t flags_show(struct device *dev,
 {
 	struct nvdimm *nvdimm = to_nvdimm(dev);
 
-	return sprintf(buf, "%s%s\n",
+	return sprintf(buf, "%s%s%s\n",
 			test_bit(NDD_ALIASING, &nvdimm->flags) ? "alias " : "",
+			test_bit(NDD_LABELING, &nvdimm->flags) ? "label " : "",
 			test_bit(NDD_LOCKED, &nvdimm->flags) ? "lock " : "");
 }
 static DEVICE_ATTR_RO(flags);
diff --git a/drivers/nvdimm/namespace_devs.c b/drivers/nvdimm/namespace_devs.c
index 77e211c7d94d..01f6c22f0d1a 100644
--- a/drivers/nvdimm/namespace_devs.c
+++ b/drivers/nvdimm/namespace_devs.c
@@ -2538,7 +2538,7 @@ static int init_active_labels(struct nd_region *nd_region)
 		if (!ndd) {
 			if (test_bit(NDD_LOCKED, &nvdimm->flags))
 				/* fail, label data may be unreadable */;
-			else if (test_bit(NDD_ALIASING, &nvdimm->flags))
+			else if (test_bit(NDD_LABELING, &nvdimm->flags))
 				/* fail, labels needed to disambiguate dpa */;
 			else
 				return 0;
diff --git a/drivers/nvdimm/nd.h b/drivers/nvdimm/nd.h
index c9f6a5b5253a..ca39abe29c7c 100644
--- a/drivers/nvdimm/nd.h
+++ b/drivers/nvdimm/nd.h
@@ -252,7 +252,7 @@ int nvdimm_set_config_data(struct nvdimm_drvdata *ndd, size_t offset,
 		void *buf, size_t len);
 long nvdimm_clear_poison(struct device *dev, phys_addr_t phys,
 		unsigned int len);
-void nvdimm_set_aliasing(struct device *dev);
+void nvdimm_set_labeling(struct device *dev);
 void nvdimm_set_locked(struct device *dev);
 void nvdimm_clear_locked(struct device *dev);
 int nvdimm_security_setup_events(struct device *dev);
diff --git a/drivers/nvdimm/region_devs.c b/drivers/nvdimm/region_devs.c
index a19e535830d9..a5fc6e4c56ff 100644
--- a/drivers/nvdimm/region_devs.c
+++ b/drivers/nvdimm/region_devs.c
@@ -195,16 +195,16 @@ EXPORT_SYMBOL_GPL(nd_blk_region_set_provider_data);
 int nd_region_to_nstype(struct nd_region *nd_region)
 {
 	if (is_memory(&nd_region->dev)) {
-		u16 i, alias;
+		u16 i, label;
 
-		for (i = 0, alias = 0; i < nd_region->ndr_mappings; i++) {
+		for (i = 0, label = 0; i < nd_region->ndr_mappings; i++) {
 			struct nd_mapping *nd_mapping = &nd_region->mapping[i];
 			struct nvdimm *nvdimm = nd_mapping->nvdimm;
 
-			if (test_bit(NDD_ALIASING, &nvdimm->flags))
-				alias++;
+			if (test_bit(NDD_LABELING, &nvdimm->flags))
+				label++;
 		}
-		if (alias)
+		if (label)
 			return ND_DEVICE_NAMESPACE_PMEM;
 		else
 			return ND_DEVICE_NAMESPACE_IO;
diff --git a/include/linux/libnvdimm.h b/include/linux/libnvdimm.h
index 9df091bd30ba..18da4059be09 100644
--- a/include/linux/libnvdimm.h
+++ b/include/linux/libnvdimm.h
@@ -37,6 +37,8 @@ enum {
 	NDD_WORK_PENDING = 4,
 	/* ignore / filter NSLABEL_FLAG_LOCAL for this DIMM, i.e. no aliasing */
 	NDD_NOBLK = 5,
+	/* dimm supports namespace labels */
+	NDD_LABELING = 6,
 
 	/* need to set a limit somewhere, but yes, this is likely overkill */
 	ND_IOCTL_MAX_BUFLEN = SZ_4M,

