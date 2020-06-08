Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E38DD1F2166
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 23:14:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gmG9375pzDqQv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 07:14:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gmD01gMDzDqNK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 07:12:16 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 058L1uW8132355; Mon, 8 Jun 2020 17:11:41 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31gg8168cr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 17:11:41 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 058L2Dpm133298;
 Mon, 8 Jun 2020 17:11:38 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31gg8168b9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 17:11:37 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 058LB8at031517;
 Mon, 8 Jun 2020 21:11:34 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 31g2s7swfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 21:11:33 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 058LBVh360686590
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Jun 2020 21:11:31 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9A62A405B;
 Mon,  8 Jun 2020 21:11:30 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12444A405C;
 Mon,  8 Jun 2020 21:11:26 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.85.74.153])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  8 Jun 2020 21:11:25 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Tue, 09 Jun 2020 02:41:24 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v12 0/6] powerpc/papr_scm: Add support for reporting nvdimm
 health
Date: Tue,  9 Jun 2020 02:40:20 +0530
Message-Id: <20200608211026.67573-1-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-08_18:2020-06-08,
 2020-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006080144
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
Cc: Santosh Sivaraj <santosh@fossix.org>, Steven Rostedt <rostedt@goodmis.org>,
 Oliver O'Halloran <oohall@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Changes since v11 [1]:
* Minor update to 'papr_pdsm.h' fixing a misleading comment about
  'possible' padding being added by GCC which doesn't apply in case
  structs are marked as __packed.
* Fix the order of initialization of 'struct nd_papr_pdsm_health' in
  papr_pdsm_health().
* Added acks from Ira for various patches.

[1] https://lore.kernel.org/linux-nvdimm/20200607131339.476036-1-vaibhav@linux.ibm.com
---

The PAPR standard[2][4] provides mechanisms to query the health and
performance stats of an NVDIMM via various hcalls as described in
Ref[3].  Until now these stats were never available nor exposed to the
user-space tools like 'ndctl'. This is partly due to PAPR platform not
having support for ACPI and NFIT. Hence 'ndctl' is unable to query and
report the dimm health status and a user had no way to determine the
current health status of a NDVIMM.

To overcome this limitation, this patch-set updates papr_scm kernel
module to query and fetch NVDIMM health stats using hcalls described
in Ref[3].  This health and performance stats are then exposed to
userspace via sysfs and PAPR-NVDIMM-Specific-Methods(PDSM) issued by
libndctl.

These changes coupled with proposed ndtcl changes located at Ref[5]
should provide a way for the user to retrieve NVDIMM health status
using ndtcl.

Below is a sample output using proposed kernel + ndctl for PAPR NVDIMM
in a emulation environment:

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
based NVDIMMs that are in perfectly healthy conditions:

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

PAPR NVDIMM-Specific-Methods(PDSM)
==================================

PDSM requests are issued by vendor specific code in libndctl to
execute certain operations or fetch information from NVDIMMS. PDSMs
requests can be sent to papr_scm module via libndctl(userspace) and
libnvdimm (kernel) using the ND_CMD_CALL ioctl command which can be
handled in the dimm control function papr_scm_ndctl(). Current
patchset proposes a single PDSM to retrieve NVDIMM health, defined in
the newly introduced uapi header named 'papr_pdsm.h'. Support for
more PDSMs will be added in future.

Structure of the patch-set
==========================

The patch-set starts with a doc patch documenting details of hcall
H_SCM_HEALTH. Second patch exports kernel symbol seq_buf_printf()
thats used in subsequent patches to generate sysfs attribute content.

Third patch implements support for fetching NVDIMM health information
from PHYP and partially exposing it to user-space via a NVDIMM sysfs
flag.

Fourth patch updates papr_scm_ndctl() to handle a possible error case
and also improve debug logging.

Fifth patch deals with implementing support for servicing PDSM
commands in papr_scm module.

Finally the last patch implements support for servicing PDSM
'PAPR_PDSM_HEALTH' that returns the NVDIMM health information to
libndctl.

References:
[2] "Power Architecture Platform Reference"
      https://en.wikipedia.org/wiki/Power_Architecture_Platform_Reference
[3] commit 58b278f568f0
     ("powerpc: Provide initial documentation for PAPR hcalls")
[4] "Linux on Power Architecture Platform Reference"
     https://members.openpowerfoundation.org/document/dl/469
[5] https://github.com/vaibhav92/ndctl/tree/papr_scm_health_v12

---

Vaibhav Jain (6):
  powerpc: Document details on H_SCM_HEALTH hcall
  seq_buf: Export seq_buf_printf
  powerpc/papr_scm: Fetch nvdimm health information from PHYP
  powerpc/papr_scm: Improve error logging and handling papr_scm_ndctl()
  ndctl/papr_scm,uapi: Add support for PAPR nvdimm specific methods
  powerpc/papr_scm: Implement support for PAPR_PDSM_HEALTH

 Documentation/ABI/testing/sysfs-bus-papr-pmem |  27 ++
 Documentation/powerpc/papr_hcalls.rst         |  46 ++-
 arch/powerpc/include/uapi/asm/papr_pdsm.h     | 125 ++++++
 arch/powerpc/platforms/pseries/papr_scm.c     | 373 +++++++++++++++++-
 include/uapi/linux/ndctl.h                    |   1 +
 lib/seq_buf.c                                 |   1 +
 6 files changed, 562 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-papr-pmem
 create mode 100644 arch/powerpc/include/uapi/asm/papr_pdsm.h

-- 
2.26.2

