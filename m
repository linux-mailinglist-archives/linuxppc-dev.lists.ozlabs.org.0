Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 057321D7654
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 13:12:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Qbvr1FNHzDqRq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 21:12:40 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QbqD24TCzDqRL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 21:08:39 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04IB4tCA060074; Mon, 18 May 2020 07:08:29 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312c21xram-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 07:08:28 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04IB6DLs078031;
 Mon, 18 May 2020 07:08:28 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312c21xr9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 07:08:28 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04IB5a7m030822;
 Mon, 18 May 2020 11:08:26 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3127t5kyhw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 11:08:25 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04IB8NaR10420728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 May 2020 11:08:23 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34D0C4C04E;
 Mon, 18 May 2020 11:08:23 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5AA5A4C046;
 Mon, 18 May 2020 11:08:20 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.102.2.238])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 18 May 2020 11:08:20 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Mon, 18 May 2020 16:38:19 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org
Subject: [RFC PATCH 0/4] powerpc/papr_scm: Add support for reporting NVDIMM
 performance statistics
Date: Mon, 18 May 2020 16:38:10 +0530
Message-Id: <20200518110814.145644-1-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-18_04:2020-05-15,
 2020-05-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 cotscore=-2147483648 lowpriorityscore=0 adultscore=0 malwarescore=0
 mlxlogscore=676 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005180096
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
Cc: Santosh Sivaraj <santosh@fossix.org>, Oliver O'Halloran <oohall@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch-set proposes to add support for fetching and reporting
performance statistics for PAPR compliant NVDIMMs as described in
documentation for H_SCM_PERFORMANCE_STATS hcall Ref[1]. The patch-set
also implements mechanisms to expose NVDIMM performance stats via
sysfs and newly introduced PDSMs[2] for libndctl.

This patch-set combined with corresponding ndctl and libndctl changes
proposed at Ref[3] should enable user to fetch PAPR compliant NVDIMMs
using following command:

 # ndctl list -D --stats
[
  {
    "dev":"nmem0",
    "stats":{
      "Controller Reset Count":2,
      "Controller Reset Elapsed Time":603331,
      "Power-on Seconds":603931,
      "Life Remaining":"100%",
      "Critical Resource Utilization":"0%",
      "Host Load Count":5781028,
      "Host Store Count":8966800,
      "Host Load Duration":975895365,
      "Host Store Duration":716230690,
      "Media Read Count":0,
      "Media Write Count":6313,
      "Media Read Duration":0,
      "Media Write Duration":9679615,
      "Cache Read Hit Count":5781028,
      "Cache Write Hit Count":8442479,
      "Fast Write Count":8969912
    }
  }
]

The patchset is dependent on existing patch-set "[PATCH v7 0/5]
powerpc/papr_scm: Add support for reporting nvdimm health" available
at Ref[2] that adds support for reporting PAPR compliant NVDIMMs in
'papr_scm' kernel module.

Structure of the patch-set
==========================

The patch-set starts with implementing functionality in papr_scm
module to issue H_SCM_PERFORMANCE_STATS hcall, fetch & parse dimm
performance stats and exposing them as a PAPR specific libnvdimm
attribute named 'perf_stats'

Patch-2 introduces a new PDSM named FETCH_PERF_STATS that can be
issued by libndctl asking papr_scm to issue the
H_SCM_PERFORMANCE_STATS hcall using helpers introduced earlier and
storing the results in a dimm specific perf-stats-buffer.

Patch-3 introduces a new PDSM named READ_PERF_STATS that can be
issued by libndctl to read the perf-stats-buffer in an incremental
manner to workaround the 256-bytes envelop limitation of libnvdimm.

Finally Patch-4 introduces a new PDSM named GET_PERF_STAT that can be
issued by libndctl to read values of a specific NVDIMM performance
stat like "Life Remaining".

References
==========
[1] Documentation/powerpc/papr_hcals.rst

[2] https://lore.kernel.org/linux-nvdimm/20200508104922.72565-1-vaibhav@linux.ibm.com/

[3] https://github.com/vaibhav92/ndctl/tree/papr_scm_stats_v1

Vaibhav Jain (4):
  powerpc/papr_scm: Fetch nvdimm performance stats from PHYP
  powerpc/papr_scm: Add support for PAPR_SCM_PDSM_FETCH_PERF_STATS
  powerpc/papr_scm: Implement support for PAPR_SCM_PDSM_READ_PERF_STATS
  powerpc/papr_scm: Add support for PDSM GET_PERF_STAT

 Documentation/ABI/testing/sysfs-bus-papr-scm  |  27 ++
 arch/powerpc/include/uapi/asm/papr_scm_pdsm.h |  60 +++
 arch/powerpc/platforms/pseries/papr_scm.c     | 391 ++++++++++++++++++
 3 files changed, 478 insertions(+)

-- 
2.26.2

