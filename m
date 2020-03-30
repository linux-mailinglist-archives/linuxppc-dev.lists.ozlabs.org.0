Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C66BA197A75
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 13:12:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rVDQ5xsRzDqQt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 22:12:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rV9s5MBxzDq7j
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 22:10:25 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02UB4HAc097035
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 07:10:22 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 301ygust3p-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 07:10:21 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Mon, 30 Mar 2020 12:10:09 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 30 Mar 2020 12:10:06 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02UBAFFl41943062
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Mar 2020 11:10:15 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6756AA405C;
 Mon, 30 Mar 2020 11:10:15 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E8CCA4054;
 Mon, 30 Mar 2020 11:10:13 +0000 (GMT)
Received: from vajain21.in.ibm.com.com (unknown [9.79.185.237])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 30 Mar 2020 11:10:12 +0000 (GMT)
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org
Subject: [PATCH v3 0/4] powerpc/papr_scm: Add support for reporting nvdimm
 health
Date: Mon, 30 Mar 2020 16:39:39 +0530
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20033011-4275-0000-0000-000003B630D3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20033011-4276-0000-0000-000038CB7C9A
Message-Id: <20200330110943.214097-1-vaibhav@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-30_01:2020-03-27,
 2020-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003300101
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
Cc: Alastair D'Silva <alastair@au1.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Jeff Moyer <jmoyer@redhat.com>, Oliver O'Halloran <oohall@gmail.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Vaibhav Jain <vaibhav@linux.ibm.com>,
 Michael Ellerman <ellerman@au1.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The PAPR standard[1][3] provides mechanisms to query the health and
performance stats of an NVDIMM via various hcalls as described in Ref[2].
Until now these stats were never available nor exposed to the user-space
tools like 'ndctl'. This is partly due to PAPR platform not having support
for ACPI and NFIT. Hence 'ndctl' is unable to query and report the dimm
health status and a user had no way to determine the current health status
of a NDVIMM.

To overcome this limitation, this patch-set updates papr_scm kernel module
to query and fetch nvdimm health stats using hcalls described in Ref[2].
This health and performance stats are then exposed to userspace via syfs
and Dimm-Specific-Methods(DSM) issued by libndctl.

These changes coupled with proposed ndtcl changes located at Ref[4] should
provide a way for the user to retrieve NVDIMM health status using ndtcl.

Below is a sample output using proposed kernel + ndctl for PAPR NVDIMM in
a emulation environment:

 # ndctl list -DH
[
  {
    "dev":"nmem0",
    "health":{
      "health_state":"fatal",
      "shutdown_state":"dirty"
    }
  }
]

Dimm health report output on a pseries guest lpar with vPMEM or HMS
based nvdimms that are in perfectly healthy conditions:
	
 # ndctl list -d nmem0 -H
[
  {
    "dev":"nmem0",
    "health":{
      "health_state":"ok",
      "shutdown_state":"clean"
    }
  }
]

PAPR Dimm-Specific-Methods(DSM)
================================

As the name suggests DSMs are used by vendor specific code in libndctl to
execute certain operations or fetch certain information for NVDIMMS. DSMs
can be sent to papr_scm module via libndctl (userspace) and libnvdimm
(kernel) using the ND_CMD_CALL ioctl which can be handled in the dimm
control function papr_scm_ndctl(). For PAPR this patchset proposes a single
DSM to retrieve DIMM health, defined in the newly introduced uapi header
named 'papr_scm_dsm.h'. Support for more DSMs will be added in future.

Structure of the patch-set
==========================

The patchset starts with implementing support for fetching nvdimm health
information from PHYP and partially exposing it to user-space via nvdimm
flags.

Second & Third patches deal with implementing support for servicing DSM
commands papr_scm.

Finally the Fourth patch implements support for servicing DSM
'DSM_PAPR_SCM_HEALTH' that returns the nvdimm health information to
libndctl.

Change-log
==========
v2..v3:

* Updated the papr_scm_dsm.h header to be more confimant general kernel
  guidelines for UAPI headers. [Aneesh]

* Changed the definition of macro PAPR_SCM_DIMM_UNARMED_MASK to not
  include case when the nvdimm is unarmed because its a vPMEM
  nvdimm. [Aneesh]

v1..v2:

* Restructured the patch-set based on review comments on V1 patch-set to
simplify the patch review. Multiple small patches have been combined into
single patches to reduce cross referencing that was needed in earlier
patch-set. Hence most of the patches in this patch-set as now new. [Aneesh]

* Removed the initial work done for fetch nvdimm performance statistics.
These changes will be re-proposed in a separate patch-set. [Aneesh]

* Simplified handling of versioning of 'struct
nd_papr_scm_dimm_health_stat_v1' as only one version of the structure is
currently in existence.

References:
[1]: "Power Architecture Platform Reference"
      https://en.wikipedia.org/wiki/Power_Architecture_Platform_Reference
[2]: commit 58b278f568f0
     ("powerpc: Provide initial documentation for PAPR hcalls")
[3]: "Linux on Power Architecture Platform Reference"
     https://members.openpowerfoundation.org/document/dl/469
[4]: https://patchwork.kernel.org/project/linux-nvdimm/list/?series=244625

Vaibhav Jain (4):
  powerpc/papr_scm: Fetch nvdimm health information from PHYP
  ndctl/uapi: Introduce NVDIMM_FAMILY_PAPR_SCM as a new NVDIMM DSM
    family
  powerpc/papr_scm,uapi: Add support for handling PAPR DSM commands
  powerpc/papr_scm: Implement support for DSM_PAPR_SCM_HEALTH

 arch/powerpc/include/asm/papr_scm.h          |  48 ++++
 arch/powerpc/include/uapi/asm/papr_scm_dsm.h | 201 ++++++++++++++
 arch/powerpc/platforms/pseries/papr_scm.c    | 269 ++++++++++++++++++-
 include/uapi/linux/ndctl.h                   |   1 +
 4 files changed, 510 insertions(+), 9 deletions(-)
 create mode 100644 arch/powerpc/include/asm/papr_scm.h
 create mode 100644 arch/powerpc/include/uapi/asm/papr_scm_dsm.h

-- 
2.24.1

