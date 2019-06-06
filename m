Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6369637B63
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 19:49:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KY7n73nbzDqxl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 03:49:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KXtS2TbZzDqMd
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 03:37:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45KXtR6nNKz8tQv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 03:37:51 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45KXtQ3C0Qz9sNm; Fri,  7 Jun 2019 03:37:50 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cclaudio@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45KXtP3yvdz9sNk
 for <linuxppc-dev@ozlabs.org>; Fri,  7 Jun 2019 03:37:49 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x56HbgsD042841
 for <linuxppc-dev@ozlabs.org>; Thu, 6 Jun 2019 13:37:47 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sy4vpg49n-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 06 Jun 2019 13:37:44 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <cclaudio@linux.ibm.com>;
 Thu, 6 Jun 2019 18:37:36 +0100
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 6 Jun 2019 18:37:33 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x56HaHbl26673432
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jun 2019 17:36:17 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0325AC059;
 Thu,  6 Jun 2019 17:36:16 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 172C2AC064;
 Thu,  6 Jun 2019 17:36:15 +0000 (GMT)
Received: from rino.br.ibm.com (unknown [9.18.235.79])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  6 Jun 2019 17:36:14 +0000 (GMT)
From: Claudio Carvalho <cclaudio@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v3 0/9] kvmppc: Paravirtualize KVM to support ultravisor
Date: Thu,  6 Jun 2019 14:36:05 -0300
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19060617-0072-0000-0000-000004387653
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011224; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01214150; UDB=6.00638204; IPR=6.00995229; 
 MB=3.00027209; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-06 17:37:34
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060617-0073-0000-0000-00004C8709EE
Message-Id: <20190606173614.32090-1-cclaudio@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-06_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906060118
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Bauermann <bauermann@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

POWER platforms that supports the Protected Execution Facility (PEF)
introduce features that combine hardware facilities and firmware to
enable secure virtual machines. That includes a new processor mode
(ultravisor mode) and the ultravisor firmware.

In PEF enabled systems, the ultravisor firmware runs at a privilege
level above the hypervisor and also takes control over some system
resources. The hypervisor, though, can make system calls to access these
resources. Such system calls, a.k.a. ucalls, are handled by the
ultravisor firmware.

The processor allows part of the system memory to be configured as
secure memory, and introduces a a new mode, called secure mode, where
any software entity in that mode can access secure memory. The
hypervisor doesn't (and can't) run in secure mode, but a secure guest
and the ultravisor firmware do.

This patch set adds support for ultravisor calls and do some preparation
for running secure guests.

---
Changelog:
---
v2->v3:
 - Squashed patches:
     "[PATCH v2 08/10] KVM: PPC: Ultravisor: Return to UV for hcalls from SVM"
     "[PATCH v2 09/10] KVM: PPC: Book3S HV: Fixed for running secure guests"
 - Renamed patch from/to:
     "[PATCH v2 08/10] KVM: PPC: Ultravisor: Return to UV for hcalls from SVM"
     "[PATCH v3 08/09] KVM: PPC: Ultravisor: Enter a secure guest
 - Rebased
 - Addressed comments from Paul Mackerras
     - Dropped ultravisor checks made in power8 code
     - Updated the commit message for:
         "[PATCH v3 08/09] KVM: PPC: Ultravisor: Enter a secure guest"
 - Addressed comments from Maddy
     - Dropped imc-pmu.c changes
 - Changed opal-imc.c to fail the probe when the ultravisor is enabled
 - Fixed "ucall defined but not used" issue when CONFIG_PPC_UV not set 

v1->v2:
 - Addressed comments from Paul Mackerras:
     - Write the pate in HV's table before doing that in UV's
     - Renamed and better documented the ultravisor header files. Also added
       all possible return codes for each ucall
     - Updated the commit message that introduces the MSR_S bit 
     - Moved ultravisor.c and ucall.S to arch/powerpc/kernel
     - Changed ucall.S to not save CR
 - Rebased
 - Changed the patches order
 - Updated several commit messages
 - Added FW_FEATURE_ULTRAVISOR to enable use of firmware_has_feature()
 - Renamed CONFIG_PPC_KVM_UV to CONFIG_PPC_UV and used it to ifdef the ucall
   handler and the code that populates the powerpc_firmware_features for 
   ultravisor
 - Exported the ucall symbol. KVM may be built as module.
 - Restricted LDBAR access if the ultravisor firmware is available
 - Dropped patches:
     "[PATCH 06/13] KVM: PPC: Ultravisor: UV_RESTRICTED_SPR_WRITE ucall"
     "[PATCH 07/13] KVM: PPC: Ultravisor: UV_RESTRICTED_SPR_READ ucall"
     "[PATCH 08/13] KVM: PPC: Ultravisor: fix mtspr and mfspr"
 - Squashed patches:
     "[PATCH 09/13] KVM: PPC: Ultravisor: Return to UV for hcalls from SVM"
     "[PATCH 13/13] KVM: PPC: UV: Have fast_guest_return check secure_guest"

Anshuman Khandual (1):
  KVM: PPC: Ultravisor: Add PPC_UV config option

Claudio Carvalho (2):
  powerpc: Introduce FW_FEATURE_ULTRAVISOR
  KVM: PPC: Ultravisor: Restrict LDBAR access

Michael Anderson (2):
  KVM: PPC: Ultravisor: Use UV_WRITE_PATE ucall to register a PATE
  KVM: PPC: Ultravisor: Check for MSR_S during hv_reset_msr

Ram Pai (2):
  KVM: PPC: Ultravisor: Add generic ultravisor call handler
  KVM: PPC: Ultravisor: Restrict flush of the partition tlb cache

Sukadev Bhattiprolu (2):
  KVM: PPC: Ultravisor: Introduce the MSR_S bit
  KVM: PPC: Ultravisor: Enter a secure guest

 arch/powerpc/Kconfig                      | 20 +++++++
 arch/powerpc/include/asm/firmware.h       |  5 +-
 arch/powerpc/include/asm/kvm_host.h       |  1 +
 arch/powerpc/include/asm/reg.h            |  3 ++
 arch/powerpc/include/asm/ultravisor-api.h | 24 +++++++++
 arch/powerpc/include/asm/ultravisor.h     | 49 +++++++++++++++++
 arch/powerpc/kernel/Makefile              |  1 +
 arch/powerpc/kernel/asm-offsets.c         |  1 +
 arch/powerpc/kernel/prom.c                |  6 +++
 arch/powerpc/kernel/ucall.S               | 31 +++++++++++
 arch/powerpc/kernel/ultravisor.c          | 28 ++++++++++
 arch/powerpc/kvm/book3s_64_mmu_hv.c       |  1 +
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 39 +++++++++++---
 arch/powerpc/mm/book3s64/hash_utils.c     |  3 +-
 arch/powerpc/mm/book3s64/pgtable.c        | 65 +++++++++++++++++------
 arch/powerpc/mm/book3s64/radix_pgtable.c  |  9 ++--
 arch/powerpc/platforms/powernv/idle.c     |  6 ++-
 arch/powerpc/platforms/powernv/opal-imc.c |  7 +++
 18 files changed, 269 insertions(+), 30 deletions(-)
 create mode 100644 arch/powerpc/include/asm/ultravisor-api.h
 create mode 100644 arch/powerpc/include/asm/ultravisor.h
 create mode 100644 arch/powerpc/kernel/ucall.S
 create mode 100644 arch/powerpc/kernel/ultravisor.c

-- 
2.20.1

