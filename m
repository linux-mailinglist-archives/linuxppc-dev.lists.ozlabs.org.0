Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FA5289BA4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Oct 2020 00:11:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C7Mjb6lJKzDqg8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Oct 2020 09:11:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C7Jg85mWCzDqLZ;
 Sat, 10 Oct 2020 06:54:12 +1100 (AEDT)
IronPort-SDR: JFJ5hRSm2R9ey3XDjVBALwgwSJbqkh4mDHo8N5zvEfyQ8Coxu+hrUabHjQUYfe5uO7x+RsBwmc
 pLEt0jEhvENQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="227179241"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="227179241"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:54:10 -0700
IronPort-SDR: LoljxrxdEbdUiebRGt6guGtjo6SPfpWGHMJuLgTgYB7BeDU8CJtiGau7DzbQyZ+Y5gpHVnCtT5
 urTwCEpflSRg==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="343972696"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:54:09 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC PKS/PMEM 58/58] [dax|pmem]: Enable stray access protection
Date: Fri,  9 Oct 2020 12:50:33 -0700
Message-Id: <20201009195033.3208459-59-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
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
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kselftest@vger.kernel.org,
 samba-technical@lists.samba.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, linux-afs@lists.infradead.org,
 cluster-devel@redhat.com, linux-cachefs@redhat.com,
 intel-wired-lan@lists.osuosl.org, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
 linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 io-uring@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ira Weiny <ira.weiny@intel.com>

Protecting against stray writes is particularly important for PMEM
because, unlike writes to anonymous memory, writes to PMEM persists
across a reboot.  Thus data corruption could result in permanent loss of
data.

While stray writes are more serious than reads, protection is also
enabled for reads.  This helps to detect bugs in code which would
incorrectly access device memory and prevents a more serious machine
checks should those bug reads from a poison page.

Enable stray access protection by setting the flag in pgmap which
requests it.  There is no option presented to the user.  If Zone Device
Access Protection not be supported this flag will have no affect.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/dax/device.c  | 2 ++
 drivers/nvdimm/pmem.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/dax/device.c b/drivers/dax/device.c
index 1e89513f3c59..e6fb35b4f0fb 100644
--- a/drivers/dax/device.c
+++ b/drivers/dax/device.c
@@ -430,6 +430,8 @@ int dev_dax_probe(struct device *dev)
 	}
 
 	dev_dax->pgmap.type = MEMORY_DEVICE_GENERIC;
+	dev_dax->pgmap.flags |= PGMAP_PROT_ENABLED;
+
 	addr = devm_memremap_pages(dev, &dev_dax->pgmap);
 	if (IS_ERR(addr))
 		return PTR_ERR(addr);
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index e4dc1ae990fc..9fcd8338e23f 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -426,6 +426,8 @@ static int pmem_attach_disk(struct device *dev,
 		return -EBUSY;
 	}
 
+	pmem->pgmap.flags |= PGMAP_PROT_ENABLED;
+
 	q = blk_alloc_queue(dev_to_node(dev));
 	if (!q)
 		return -ENOMEM;
-- 
2.28.0.rc0.12.gb6a658bd00c9

