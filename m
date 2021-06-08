Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AF439F5D5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 13:58:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fzpfl6x9pz3bsT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 21:58:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pKxKBKCn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pKxKBKCn; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzpfD5kvyz2xvZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 21:58:12 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 158Bj8kV127608; Tue, 8 Jun 2021 07:57:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=s7779BGF1RwzQdzaBMMzm+zqsP2uZ91w1g6TrDmS+dk=;
 b=pKxKBKCnnqIrlBIQu8z3N8bL9hpzWLaSkPe0PMFHrddvkjoxoy3gwWjTdBK1FMpTmqxP
 cvT+iOQjvxiSYC51uVf+Z3nsVreqICJCW467QspE1Oya/Pm53bGddixpRWHF2ryFu4jB
 l+7sSDj0mbflo4j5x8M+gWBnRSu5y02pXB1YnvV8SleElb8aehHr/RlKIWmBNmvch/XQ
 OB3xrOzN47cKBf1zzr1obFzI3HakzKad1RHIr77WV5aiDkdNZjGpf3WqARuEs0FkytsX
 h7c87uGk0vx827AmLT1FPPEA+pKMn6zg9o6dnz5nDLLU31vBxThdIGlfnN7Foa1Tddx7 Jw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3927xrrb8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Jun 2021 07:57:38 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 158BqwFr002331;
 Tue, 8 Jun 2021 11:57:36 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3900w89g6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Jun 2021 11:57:36 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 158BvXwb33882582
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Jun 2021 11:57:33 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 366424C046;
 Tue,  8 Jun 2021 11:57:33 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 284CA4C040;
 Tue,  8 Jun 2021 11:57:14 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.43.72])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  8 Jun 2021 11:57:13 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, peterz@infradead.org
Subject: [PATCH 0/4] Add perf interface to expose nvdimm
Date: Tue,  8 Jun 2021 17:26:56 +0530
Message-Id: <20210608115700.85933-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1-w3_azq6HHOTW6Honi2Hi3E_BHIK41C
X-Proofpoint-ORIG-GUID: 1-w3_azq6HHOTW6Honi2Hi3E_BHIK41C
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-08_09:2021-06-04,
 2021-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106080077
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
Cc: santosh@fossix.org, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 aneesh.kumar@linux.ibm.com, atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
 vaibhav@linux.ibm.com, dan.j.williams@intel.com, ira.weiny@intel.com,
 tglx@linutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patchset adds performance stats reporting support for nvdimm.
Added interface includes support for pmu register/unregister
functions. A structure is added called nvdimm_pmu to be used for
adding arch/platform specific data such as supported events, cpumask
pmu event functions like event_init/add/read/del.
User could use the standard perf tool to access perf
events exposed via pmu.

Added implementation to expose IBM pseries platform nmem*
device performance stats using this interface.

Result from power9 pseries lpar with 2 nvdimm device:
command:# perf list nmem
  nmem0/cchrhcnt/                                    [Kernel PMU event]
  nmem0/cchwhcnt/                                    [Kernel PMU event]
  nmem0/critrscu/                                    [Kernel PMU event]
  nmem0/ctlresct/                                    [Kernel PMU event]
  nmem0/ctlrestm/                                    [Kernel PMU event]
  nmem0/fastwcnt/                                    [Kernel PMU event]
  nmem0/hostlcnt/                                    [Kernel PMU event]
  nmem0/hostldur/                                    [Kernel PMU event]
  nmem0/hostscnt/                                    [Kernel PMU event]
  nmem0/hostsdur/                                    [Kernel PMU event]
  nmem0/medrcnt/                                     [Kernel PMU event]
  nmem0/medrdur/                                     [Kernel PMU event]
  nmem0/medwcnt/                                     [Kernel PMU event]
  nmem0/medwdur/                                     [Kernel PMU event]
  nmem0/memlife/                                     [Kernel PMU event]
  nmem0/noopstat/                                    [Kernel PMU event]
  nmem0/ponsecs/                                     [Kernel PMU event]
  nmem1/cchrhcnt/                                    [Kernel PMU event]
  nmem1/cchwhcnt/                                    [Kernel PMU event]
  nmem1/critrscu/                                    [Kernel PMU event]
  ...
  nmem1/noopstat/                                    [Kernel PMU event]
  nmem1/ponsecs/                                     [Kernel PMU event]

Patch1:
        Introduces the nvdimm_pmu structure
Patch2:
	Adds common interface to add arch/platform specific data
	includes supported events, pmu event functions. It also
	adds code for cpu hotplug support.
Patch3:
        Add code in arch/powerpc/platform/pseries/papr_scm.c to expose
        nmem* pmu. It fills in the nvdimm_pmu structure with event attrs
        cpumask andevent functions and then registers the pmu by adding
        callbacks to register_nvdimm_pmu.
Patch4:
        Sysfs documentation patch

Changelog
---
RFC v3 -> PATCH
- Link to the RFC v3 patchset : https://lkml.org/lkml/2021/5/29/28

- Remove RFC tag.

- Add nvdimm_pmu_cpu_online function.

- A new variable 'arch_cpumask' is added to the struct nvdimm_pmu
  which can be used to provide cpumask by the arch specific code.
  It will used incase cpu hotplug is not handled by arch code.
  Now common interface first check for any active cpu in arch_cpumask
  to designate cpu to collect counter data and incase we dont have any
  active cpu in that mask, it will look into cpumask of the device
  numa node.

-Add code in papr_scm to fill arch_cpumask variable with required
 cpumask.

- Some optimizations/fixes from previous RFC code

v2 -> v3
- Link to the RFC v2 patchset : https://lkml.org/lkml/2021/5/25/591

- Moved hotplug code changes from papr_scm code to generic interface
  with required functionality as suggested by Peter Zijlstra

- Changed function parameter of unregister_nvdimm_pmu function from
  struct pmu to struct nvdimm_pmu.

- Now cpumask will get updated based on numa node of corresponding nvdimm
  device as suggested by Peter Zijlstra.

v1 -> v2
- Link to the RFC v1 patchset : https://lkml.org/lkml/2021/5/12/2747

- Removed intermediate functions nvdimm_pmu_read/nvdimm_pmu_add/
  nvdimm_pmu_del/nvdimm_pmu_event_init and directly assigned
  platfrom specific routines. Also add check for any NULL functions.
  Suggested by: Peter Zijlstra

- Add macros for event attribute array index which can be used to
  assign dynamically allocated attr_groups.

- New function 'nvdimm_pmu_mem_free' is added to free dynamic
  memory allocated for attr_groups in papr_scm.c

- PMU register call moved from papr_scm_nvdimm_init() to papr_scm_probe()

- Move addition of cpu/node/cpuhp_state attributes in struct nvdimm_pmu
  to patch 4 where cpu hotplug code added

- Removed device attribute from the attribute list of
  add/del/read/event_init functions in nvdimm_pmu structure
  as we need to assign them directly to pmu structure.

---

Kajol Jain (4):
  drivers/nvdimm: Add nvdimm pmu structure
  drivers/nvdimm: Add perf interface to expose nvdimm performance stats
  powerpc/papr_scm: Add perf interface support
  powerpc/papr_scm: Document papr_scm sysfs event format entries

 Documentation/ABI/testing/sysfs-bus-papr-pmem |  31 ++
 arch/powerpc/include/asm/device.h             |   5 +
 arch/powerpc/platforms/pseries/papr_scm.c     | 365 ++++++++++++++++++
 drivers/nvdimm/Makefile                       |   1 +
 drivers/nvdimm/nd_perf.c                      | 230 +++++++++++
 include/linux/nd.h                            |  46 +++
 6 files changed, 678 insertions(+)
 create mode 100644 drivers/nvdimm/nd_perf.c

-- 
2.27.0

