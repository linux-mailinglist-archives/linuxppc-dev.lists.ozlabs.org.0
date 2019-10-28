Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 730ACE6A70
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 02:14:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471cFm5ctrzDqfH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 12:14:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 471cCr0mT2zDqd2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 12:13:10 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Oct 2019 18:13:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,238,1569308400"; d="scan'208";a="224486495"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 27 Oct 2019 18:13:02 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iOtag-0004hM-6I; Mon, 28 Oct 2019 09:13:02 +0800
Date: Mon, 28 Oct 2019 09:12:52 +0800
From: kbuild test robot <lkp@intel.com>
To: Alastair D'Silva <alastair@au1.ibm.com>
Subject: [RFC PATCH] nvdimm: scm_get() can be static
Message-ID: <20191028011252.ebr7djanid6k25ok@4978f4969bb8>
References: <20191025044721.16617-9-alastair@au1.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191025044721.16617-9-alastair@au1.ibm.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: Oscar Salvador <osalvador@suse.com>, Michal Hocko <mhocko@suse.com>,
 David Hildenbrand <david@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Wei Yang <richard.weiyang@gmail.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, Ira Weiny <ira.weiny@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, alastair@d-silva.org,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 Qian Cai <cai@lca.pw>, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Keith Busch <keith.busch@intel.com>, kbuild-all@lists.01.org,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Fixes: 0d40f55b9035 ("nvdimm: Add driver for OpenCAPI Storage Class Memory")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 ocxl-scm.c          |    4 ++--
 ocxl-scm_internal.c |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/nvdimm/ocxl-scm.c b/drivers/nvdimm/ocxl-scm.c
index f4e6cc022de8a..c169cb0bc71d4 100644
--- a/drivers/nvdimm/ocxl-scm.c
+++ b/drivers/nvdimm/ocxl-scm.c
@@ -733,7 +733,7 @@ static void scm_put(struct scm_data *scm_data)
 	put_device(&scm_data->dev);
 }
 
-struct scm_data *scm_get(struct scm_data *scm_data)
+static struct scm_data *scm_get(struct scm_data *scm_data)
 {
 	return (get_device(&scm_data->dev) == NULL) ? NULL : scm_data;
 }
@@ -2142,7 +2142,7 @@ static int scm_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	return -ENXIO;
 }
 
-struct pci_driver scm_pci_driver = {
+static struct pci_driver scm_pci_driver = {
 	.name = "ocxl-scm",
 	.id_table = scm_pci_tbl,
 	.probe = scm_probe,
diff --git a/drivers/nvdimm/ocxl-scm_internal.c b/drivers/nvdimm/ocxl-scm_internal.c
index e7c247835817b..ee11fb72e1ecd 100644
--- a/drivers/nvdimm/ocxl-scm_internal.c
+++ b/drivers/nvdimm/ocxl-scm_internal.c
@@ -64,8 +64,8 @@ int scm_admin_command_request(struct scm_data *scm_data, u8 op_code)
 	return scm_command_request(scm_data, &scm_data->admin_command, op_code);
 }
 
-int scm_command_response(const struct scm_data *scm_data,
-			 const struct command_metadata *cmd)
+static int scm_command_response(const struct scm_data *scm_data,
+				const struct command_metadata *cmd)
 {
 	u64 val;
 	u16 id;
