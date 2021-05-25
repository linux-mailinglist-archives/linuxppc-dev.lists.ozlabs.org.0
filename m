Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 172BE390218
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 15:23:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqFBt3Rzxz30NR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 23:23:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OR4P3ot9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OR4P3ot9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqFBP2Q61z2xvQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 23:22:53 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14PDEq7b102974; Tue, 25 May 2021 09:22:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=DdnPmdS+XvZUlVj35Urit2LTe3WzUvh8ODyNSBZEU9U=;
 b=OR4P3ot9CMCop3HEJTLpFsJNXQhpdGfi25sMMXBNPu1LHdwoCNblc0ZppQ9pzOqrhbGS
 KY6GlpRzX5s+4/gDJlag+11Z0s1D4nCYj71NF4lmin59qET3TfCONhhV7SBU3hru67hc
 5VehxneS4a2yf1TAs2CgVDtELLIg7xuUtb6K51Y5I5bUbVQ4FcIF7jWPSAQSBiDouiWe
 1L3/+abcXV3Ru6yUMPYUiS4JU3K0xYPPs0f57TljSoqrWsiG/bi06XyJvcptAo75tbo3
 RSLX8fKyfM/r8PMeiIOy162fzMXaNBv3bU0OxAYqKWVgy0UGArVDza43hMhDRCGjFBSc SQ== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38s1xtr8q8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 09:22:35 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14PDFn3t002907;
 Tue, 25 May 2021 13:22:33 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 38s1hq80ew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 13:22:33 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14PDMUlQ26804536
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 May 2021 13:22:30 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6252EAE051;
 Tue, 25 May 2021 13:22:30 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68A91AE045;
 Tue, 25 May 2021 13:22:26 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.34.186])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 May 2021 13:22:26 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 linux-nvdimm@lists.01.org, linux-kernel@vger.kernel.org,
 peterz@infradead.org
Subject: [RFC v2 0/4] Add perf interface to expose nvdimm
Date: Tue, 25 May 2021 18:52:12 +0530
Message-Id: <20210525132216.1239259-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: j9dp8IQQwLXqo_NxCeVNqxLvLVkLeD90
X-Proofpoint-ORIG-GUID: j9dp8IQQwLXqo_NxCeVNqxLvLVkLeD90
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-25_06:2021-05-25,
 2021-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105250081
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

Patch adds performance stats reporting support for nvdimm.
Added interface includes support for pmu register/unregister
functions. A structure is added called nvdimm_pmu to be used for
adding arch/platform specific data such as supported events and pmu
event functions like event_init/add/read/del.
User could use the standard perf tool to access perf
events exposed via pmu.

Patchset includes implementation to expose IBM pseries platform nmem*
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
        Introduces the nvdimm_pmu structure, common function for pmu
        register along with callback routine check.
Pacth2
        Add code in arch/powerpc/platform/pseries/papr_scm.c to expose
        nmem* pmu. It fills in the nvdimm_pmu structure with event attrs
        and event functions and then registers the pmu by adding
        callbacks to register_nvdimm_pmu.
Patch3:
        Sysfs documentation patch
Patch4:
        Adds cpuhotplug support.

Changelog
---
v1 -> v2
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

- Some optimizations/fixes from previous RFC code

Kajol Jain (4):
  drivers/nvdimm: Add perf interface to expose nvdimm performance stats
  powerpc/papr_scm: Add perf interface support
  powerpc/papr_scm: Document papr_scm sysfs event format entries
  powerpc/papr_scm: Add cpu hotplug support for nvdimm pmu device

 Documentation/ABI/testing/sysfs-bus-papr-pmem |  31 ++
 arch/powerpc/include/asm/device.h             |   5 +
 arch/powerpc/platforms/pseries/papr_scm.c     | 419 ++++++++++++++++++
 drivers/nvdimm/Makefile                       |   1 +
 drivers/nvdimm/nd_perf.c                      |  58 +++
 include/linux/nd.h                            |  42 ++
 6 files changed, 556 insertions(+)
 create mode 100644 drivers/nvdimm/nd_perf.c

-- 
2.27.0

