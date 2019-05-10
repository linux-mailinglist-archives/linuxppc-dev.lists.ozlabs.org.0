Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA541A557
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 May 2019 00:38:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4514qD5DnjzDqSv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 May 2019 08:38:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4514nt3XwlzDqSP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 May 2019 08:36:50 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AMagCt021752
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 18:36:46 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sdeqqfbxh-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 18:36:46 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Fri, 10 May 2019 23:36:45 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 10 May 2019 23:36:41 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4AMafcV25755650
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 May 2019 22:36:41 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5C7CAC05F;
 Fri, 10 May 2019 22:36:40 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D3E7AC068;
 Fri, 10 May 2019 22:36:39 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.80.222.100])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 10 May 2019 22:36:39 +0000 (GMT)
References: <20190507062559.20295-1-aik@ozlabs.ru>
 <20190507062559.20295-2-aik@ozlabs.ru>
User-agent: mu4e 1.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel 1/2] powerpc/pseries/dma: Allow swiotlb
In-reply-to: <20190507062559.20295-2-aik@ozlabs.ru>
Date: Fri, 10 May 2019 19:36:34 -0300
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19051022-0052-0000-0000-000003BDB830
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011083; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01201494; UDB=6.00630503; IPR=6.00982390; 
 MB=3.00026837; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-10 22:36:44
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051022-0053-0000-0000-000060D97533
Message-Id: <871s162az1.fsf@morokweng.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-10_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=18 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905100143
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
Cc: Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Alexey Kardashevskiy <aik@ozlabs.ru> writes:

> The commit 8617a5c5bc00 ("powerpc/dma: handle iommu bypass in
> dma_iommu_ops") merged direct DMA ops into the IOMMU DMA ops allowing
> SWIOTLB as well but only for mapping; the unmapping and bouncing parts
> were left unmodified.
>
> This adds missing direct unmapping calls to .unmap_page() and .unmap_sg().
>
> This adds missing sync callbacks and directs them to the direct DMA hooks.
>
> Fixes: 8617a5c5bc00 (powerpc/dma: handle iommu bypass in dma_iommu_ops)
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Nice! Thanks for working on this. I have the patch at the end of this
email to get virtio-scsi-pci and virtio-blk-pci working in a secure
guest.

I applied your patch and reverted my patch and unfortunately the guest
hangs right after mounting the disk:

[    0.185659] virtio-pci 0000:00:04.0: enabling device (0100 -> 0102)
[    0.187082] virtio-pci 0000:00:04.0: ibm,query-pe-dma-windows(2026) 2000 8000000 20000000 returned 0
[    0.187497] virtio-pci 0000:00:04.0: ibm,create-pe-dma-window(2027) 2000 8000000 20000000 10 20 returned 0 (liobn = 0x80000001 startin
g addr = 8000000 0)
[    0.226654] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.227094] Non-volatile memory driver v1.3
[    0.228950] brd: module loaded
[    0.230666] loop: module loaded
[    0.230773] ipr: IBM Power RAID SCSI Device Driver version: 2.6.4 (March 14, 2017)
[    0.233323] scsi host0: Virtio SCSI HBA
[    0.235439] scsi 0:0:0:0: Direct-Access     QEMU     QEMU HARDDISK    2.5+ PQ: 0 ANSI: 5
[    0.369009] random: fast init done
[    0.370819] sd 0:0:0:0: Attached scsi generic sg0 type 0
[    0.371320] sd 0:0:0:0: Power-on or device reset occurred

<snip>

[    0.380378] sd 0:0:0:0: [sda] 31457280 512-byte logical blocks: (16.1 GB/15.0 GiB)
[    0.381102] sd 0:0:0:0: [sda] Write Protect is off
[    0.381195] sd 0:0:0:0: [sda] Mode Sense: 63 00 00 08
[    0.382436] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    0.383630] sd 0:0:0:0: [sda] Optimal transfer size 0 bytes < PAGE_SIZE (65536 bytes)
[    0.391562]  sda: sda1 sda2
[    0.398101] sd 0:0:0:0: [sda] Attached SCSI disk
[    0.398205] md: Waiting for all devices to be available before autodetect
[    0.398318] md: If you don't use raid, use raid=noautodetect
[    0.398515] md: Autodetecting RAID arrays.
[    0.398585] md: autorun ...
[    0.398631] md: ... autorun DONE.
[    0.403552] EXT4-fs (sda2): mounted filesystem with ordered data mode. Opts: (null)
[    0.403700] VFS: Mounted root (ext4 filesystem) readonly on device 8:2.
[    0.405258] devtmpfs: mounted
[    0.406427] Freeing unused kernel memory: 4224K
[    0.406519] This architecture does not have kernel memory protection.
[    0.406633] Run /sbin/init as init process

Sorry, I don't have any information on where the guest is stuck. I tried
<sysrq>+l, <sysrq>+t and <sysrq>+w but nothing out of the ordinary
showed up. Will try something else later.

--
Thiago Jung Bauermann
IBM Linux Technology Center



From 70d2fba809119ae2d35c9ca4269405bb5c28413a Mon Sep 17 00:00:00 2001
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Date: Thu, 24 Jan 2019 22:40:16 -0200
Subject: [PATCH 1/1] powerpc/pseries/iommu: Don't use dma_iommu_ops on secure
 guests

Secure guest memory is inacessible to devices so regular DMA isn't
possible.

In that case set devices' dma_map_ops to NULL so that the generic
DMA code path will use SWIOTLB and DMA to bounce buffers.

Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 36eb1ddbac69..1636306007eb 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -50,6 +50,7 @@
 #include <asm/udbg.h>
 #include <asm/mmzone.h>
 #include <asm/plpar_wrappers.h>
+#include <asm/svm.h>

 #include "pseries.h"

@@ -1335,7 +1336,10 @@ void iommu_init_early_pSeries(void)
 	of_reconfig_notifier_register(&iommu_reconfig_nb);
 	register_memory_notifier(&iommu_mem_nb);

-	set_pci_dma_ops(&dma_iommu_ops);
+	if (is_secure_guest())
+		set_pci_dma_ops(NULL);
+	else
+		set_pci_dma_ops(&dma_iommu_ops);
 }

 static int __init disable_multitce(char *str)

