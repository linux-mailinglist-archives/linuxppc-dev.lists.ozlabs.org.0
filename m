Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF108747A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 10:43:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464f0q4vLqzDqrj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 18:43:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bharata@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464dy167CPzDqRH
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2019 18:41:28 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x798cFpa092663
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 9 Aug 2019 04:41:23 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2u92w7p5mv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Aug 2019 04:41:23 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Fri, 9 Aug 2019 09:41:21 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 9 Aug 2019 09:41:18 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x798fGi851904514
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Aug 2019 08:41:16 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABE50A4062;
 Fri,  9 Aug 2019 08:41:16 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AFE64A405C;
 Fri,  9 Aug 2019 08:41:14 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.85.95.61])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  9 Aug 2019 08:41:14 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 0/7] KVMPPC driver to manage secure guest pages
Date: Fri,  9 Aug 2019 14:11:01 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19080908-0020-0000-0000-0000035DA566
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19080908-0021-0000-0000-000021B2ABF1
Message-Id: <20190809084108.30343-1-bharata@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-09_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=769 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908090089
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
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org, jglisse@redhat.com,
 aneesh.kumar@linux.vnet.ibm.com, paulus@au1.ibm.com,
 sukadev@linux.vnet.ibm.com, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

A pseries guest can be run as a secure guest on Ultravisor-enabled
POWER platforms. On such platforms, this driver will be used to manage
the movement of guest pages between the normal memory managed by
hypervisor(HV) and secure memory managed by Ultravisor(UV).

Private ZONE_DEVICE memory equal to the amount of secure memory
available in the platform for running secure guests is created
via a char device. Whenever a page belonging to the guest becomes
secure, a page from this private device memory is used to
represent and track that secure page on the HV side. The movement
of pages between normal and secure memory is done via
migrate_vma_pages().

The page-in or page-out requests from UV will come to HV as hcalls and
HV will call back into UV via uvcalls to satisfy these page requests.

These patches are against Christoph Hellwig's migrate_vma-cleanup.2
branch
(http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/migrate_vma-cleanup.2)

plus

Claudio Carvalho's base ultravisor enablement patchset
(https://lore.kernel.org/linuxppc-dev/20190808040555.2371-1-cclaudio@linux.ibm.com/T/#t)

These patches along with Claudio's above patches are required to
run a secure pseries guest on KVM.

Changes in v6
=============
Updated the driver to account for the changes in HMM and migrate_vma()
by Christoph Hellwig.
 - Not using any HMM routines any more.
 - Switched to using migrate_vma_pages()

v5: https://www.mail-archive.com/linuxppc-dev@lists.ozlabs.org/msg153294.html

Anshuman Khandual (1):
  KVM: PPC: Ultravisor: Add PPC_UV config option

Bharata B Rao (6):
  kvmppc: Driver to manage pages of secure guest
  kvmppc: Shared pages support for secure guests
  kvmppc: H_SVM_INIT_START and H_SVM_INIT_DONE hcalls
  kvmppc: Handle memory plug/unplug to secure VM
  kvmppc: Radix changes for secure guest
  kvmppc: Support reset of secure guest

 Documentation/virtual/kvm/api.txt          |  18 +
 arch/powerpc/Kconfig                       |  18 +
 arch/powerpc/include/asm/hvcall.h          |   9 +
 arch/powerpc/include/asm/kvm_book3s_devm.h |  48 ++
 arch/powerpc/include/asm/kvm_host.h        |  28 +
 arch/powerpc/include/asm/kvm_ppc.h         |   2 +
 arch/powerpc/include/asm/ultravisor-api.h  |   6 +
 arch/powerpc/include/asm/ultravisor.h      |  36 ++
 arch/powerpc/kvm/Makefile                  |   3 +
 arch/powerpc/kvm/book3s_64_mmu_radix.c     |  22 +
 arch/powerpc/kvm/book3s_hv.c               | 115 ++++
 arch/powerpc/kvm/book3s_hv_devm.c          | 668 +++++++++++++++++++++
 arch/powerpc/kvm/powerpc.c                 |  12 +
 include/uapi/linux/kvm.h                   |   1 +
 14 files changed, 986 insertions(+)
 create mode 100644 arch/powerpc/include/asm/kvm_book3s_devm.h
 create mode 100644 arch/powerpc/kvm/book3s_hv_devm.c

-- 
2.21.0

