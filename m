Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF3267875
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2019 06:48:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ly3N3L8czDqsX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2019 14:48:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ly176g3wzDqnD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 14:46:19 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6D4foiu114262
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 00:46:15 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tq5mjvb4w-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 00:46:15 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Sat, 13 Jul 2019 05:46:14 +0100
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 13 Jul 2019 05:46:09 +0100
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6D4k80Q56164730
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2019 04:46:08 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F21D0BE051;
 Sat, 13 Jul 2019 04:46:07 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B303BE04F;
 Sat, 13 Jul 2019 04:46:03 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.85.135.203])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 13 Jul 2019 04:46:03 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: x86@kernel.org
Subject: [PATCH 0/3] Remove x86-specific code from generic headers
Date: Sat, 13 Jul 2019 01:45:51 -0300
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19071304-0012-0000-0000-0000174F2918
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011418; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01231409; UDB=6.00648690; IPR=6.01012701; 
 MB=3.00027699; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-13 04:46:14
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071304-0013-0000-0000-0000580BA0F3
Message-Id: <20190713044554.28719-1-bauerman@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-13_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907130055
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

This version mostly changes patch 2/3, removing dma_check_mask() from
kernel/dma/mapping.c as suggested by Christoph Hellwig, and also adapting
s390's <asm/mem_encrypt.h>. There's also a small change in patch 1/3 as
mentioned in the changelog below.

Patch 3/3 may or may not need to change s390 code depending on how Tom
Lendacky's patch is fixed to avoid breaking that architecture, so I haven't
made any changes for now.

These patches are applied on top of today's master which at the time was at
commit 9787aed57dd3 ("coresight: Make the coresight_device_fwnode_match
declaration's fwnode parameter const"), plus a cherry-pick of commit
e67a5ed1f86f ("dma-direct: Force unencrypted DMA under SME for certain DMA
masks"), which is in dma-mapping/for-next and comes from this patch:

https://lore.kernel.org/linux-iommu/10b83d9ff31bca88e94da2ff34e30619eb396078.1562785123.git.thomas.lendacky@amd.com/

I don't have a way to test SME, SEV, nor s390's PEF so the patches have only
been build tested.

Original cover letter below:

Both powerpc¹ and s390² are adding <asm/mem_encrypt.h> headers. Currently,
they have to supply definitions for functions and macros which only have a
meaning on x86: sme_me_mask, sme_active() and sev_active().

Christoph Hellwig made a suggestion to "clean up the Kconfig and generic
headers bits for memory encryption so that we don't need all this
boilerplate code", and this is what this patch does.

After this patch set, this is powerpc's <asm/mem_encrypt.h>:

    #ifndef _ASM_POWERPC_MEM_ENCRYPT_H
    #define _ASM_POWERPC_MEM_ENCRYPT_H

    #include <asm/svm.h>

    static inline bool mem_encrypt_active(void)
    {
	    return is_secure_guest();
    }

    static inline bool force_dma_unencrypted(struct device *dev)
    {
	    return is_secure_guest();
    }

    int set_memory_encrypted(unsigned long addr, int numpages);
    int set_memory_decrypted(unsigned long addr, int numpages);

    #endif /* _ASM_POWERPC_MEM_ENCRYPT_H */

Changelog

Since v1:

- Patch "x86,s390: Move ARCH_HAS_MEM_ENCRYPT definition to arch/Kconfig"
  - Remove definition of ARCH_HAS_MEM_ENCRYPT from s390/Kconfig as well.
  - Reworded patch title and message a little bit.

- Patch "DMA mapping: Move SME handling to x86-specific files"
  - Adapt s390's <asm/mem_encrypt.h> as well.
  - Remove dma_check_mask() from kernel/dma/mapping.c. Suggested by
    Christoph Hellwig.

-- 

¹ https://lore.kernel.org/linuxppc-dev/20190521044912.1375-12-bauerman@linux.ibm.com/
² https://lore.kernel.org/kvm/20190612111236.99538-2-pasic@linux.ibm.com/

Thiago Jung Bauermann (3):
  x86,s390: Move ARCH_HAS_MEM_ENCRYPT definition to arch/Kconfig
  DMA mapping: Move SME handling to x86-specific files
  fs/core/vmcore: Move sev_active() reference to x86 arch code

 arch/Kconfig                        |  3 +++
 arch/s390/Kconfig                   |  3 ---
 arch/s390/include/asm/mem_encrypt.h |  4 +---
 arch/x86/Kconfig                    |  4 +---
 arch/x86/include/asm/mem_encrypt.h  | 10 ++++++++++
 arch/x86/kernel/crash_dump_64.c     |  5 +++++
 fs/proc/vmcore.c                    |  8 ++++----
 include/linux/crash_dump.h          | 14 ++++++++++++++
 include/linux/mem_encrypt.h         | 15 +--------------
 kernel/dma/mapping.c                |  8 --------
 kernel/dma/swiotlb.c                |  3 +--
 11 files changed, 40 insertions(+), 37 deletions(-)

