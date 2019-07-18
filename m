Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3FA6C7F5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 05:33:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45q09B4mbGzDqW9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 13:33:50 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45q04H0HQHzDqFL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 13:29:34 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6I3SrGW094990; Wed, 17 Jul 2019 23:29:18 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ttf0tkdxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jul 2019 23:29:17 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x6I3TH2G098803;
 Wed, 17 Jul 2019 23:29:17 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ttf0tkdwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jul 2019 23:29:17 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x6I3QDYF010971;
 Thu, 18 Jul 2019 03:29:16 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 2trtmrcufr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jul 2019 03:29:16 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6I3TFav8520532
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Jul 2019 03:29:15 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E5F7AE05F;
 Thu, 18 Jul 2019 03:29:15 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2DC2AE05C;
 Thu, 18 Jul 2019 03:29:10 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.85.129.123])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 18 Jul 2019 03:29:10 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: x86@kernel.org
Subject: [PATCH v3 0/6] Remove x86-specific code from generic headers
Date: Thu, 18 Jul 2019 00:28:52 -0300
Message-Id: <20190718032858.28744-1-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-18_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=13 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907180037
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
Cc: linux-s390@vger.kernel.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Mike Anderson <andmike@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 Alexey Dobriyan <adobriyan@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Lendacky <Thomas.Lendacky@amd.com>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-fsdevel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

This version is mostly about splitting up patch 2/3 into three separate
patches, as suggested by Christoph Hellwig. Two other changes are a fix in
patch 1 which wasn't selecting ARCH_HAS_MEM_ENCRYPT for s390 spotted by
Janani and removal of sme_active and sev_active symbol exports as suggested
by Christoph Hellwig.

These patches are applied on top of today's dma-mapping/for-next.

I don't have a way to test SME, SEV, nor s390's PEF so the patches have only
been build tested.

Changelog

Since v2:

- Patch "x86,s390: Move ARCH_HAS_MEM_ENCRYPT definition to arch/Kconfig"
  - Added "select ARCH_HAS_MEM_ENCRYPT" to config S390. Suggested by Janani.

- Patch "DMA mapping: Move SME handling to x86-specific files"
  - Split up into 3 new patches. Suggested by Christoph Hellwig.

- Patch "swiotlb: Remove call to sme_active()"
  - New patch.

- Patch "dma-mapping: Remove dma_check_mask()"
  - New patch.

- Patch "x86,s390/mm: Move sme_active() and sme_me_mask to x86-specific header"
  - New patch.
  - Removed export of sme_active symbol. Suggested by Christoph Hellwig.

- Patch "fs/core/vmcore: Move sev_active() reference to x86 arch code"
  - Removed export of sev_active symbol. Suggested by Christoph Hellwig.

- Patch "s390/mm: Remove sev_active() function"
  - New patch.

Since v1:

- Patch "x86,s390: Move ARCH_HAS_MEM_ENCRYPT definition to arch/Kconfig"
  - Remove definition of ARCH_HAS_MEM_ENCRYPT from s390/Kconfig as well.
  - Reworded patch title and message a little bit.

- Patch "DMA mapping: Move SME handling to x86-specific files"
  - Adapt s390's <asm/mem_encrypt.h> as well.
  - Remove dma_check_mask() from kernel/dma/mapping.c. Suggested by
    Christoph Hellwig.

Thiago Jung Bauermann (6):
  x86,s390: Move ARCH_HAS_MEM_ENCRYPT definition to arch/Kconfig
  swiotlb: Remove call to sme_active()
  dma-mapping: Remove dma_check_mask()
  x86,s390/mm: Move sme_active() and sme_me_mask to x86-specific header
  fs/core/vmcore: Move sev_active() reference to x86 arch code
  s390/mm: Remove sev_active() function

 arch/Kconfig                        |  3 +++
 arch/s390/Kconfig                   |  4 +---
 arch/s390/include/asm/mem_encrypt.h |  5 +----
 arch/s390/mm/init.c                 |  8 +-------
 arch/x86/Kconfig                    |  4 +---
 arch/x86/include/asm/mem_encrypt.h  | 10 ++++++++++
 arch/x86/kernel/crash_dump_64.c     |  5 +++++
 arch/x86/mm/mem_encrypt.c           |  2 --
 fs/proc/vmcore.c                    |  8 ++++----
 include/linux/crash_dump.h          | 14 ++++++++++++++
 include/linux/mem_encrypt.h         | 15 +--------------
 kernel/dma/mapping.c                |  8 --------
 kernel/dma/swiotlb.c                |  3 +--
 13 files changed, 42 insertions(+), 47 deletions(-)

