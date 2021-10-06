Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D913F423FD4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 16:08:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPbsS5lgRz2xY2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 01:08:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BH0nUUhA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BH0nUUhA; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPbrj0ywcz2yb9
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 01:08:04 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 196DX84K031779; 
 Wed, 6 Oct 2021 10:07:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=2/CwbrDYEROWm2F23M/a6pNb6yR5dyy0cPVcUz17CEw=;
 b=BH0nUUhA/gI1aX10c/jBcUXVSTW/dC2yBdKF4IpvYn+O0+6YMACLjf/+rcXdfper3Ige
 /JKsHPTBpHrnEYf3Bv/V4dBDYgmWCZooLSMJhPtGygh9gAJl3sTTa4PmN8qlF42SmtqS
 lhkJoop2lPkrU9ajIfIJeWrTFCPn5cpRq9WcnMtZHf5q0WlN06hudnRQCi08+0cCgNa0
 kOHQEIzXLna46Ec1zfizP/DooXg1ybH/pNef0mtBX3M8zMI36j2kVO9VlRj/kehdo3kw
 kqMXqigBpbRSA9cBpHWMm9YKaG410s80RfMO8tr+WA8H0obAtScHYZcJP7eObWTOE4WE 1A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bhcscgwpy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Oct 2021 10:07:32 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 196DcCqr019251;
 Wed, 6 Oct 2021 10:07:32 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bhcscgwp5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Oct 2021 10:07:31 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 196E7PBd030189;
 Wed, 6 Oct 2021 14:07:30 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 3bef2a3gnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Oct 2021 14:07:30 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 196E7Nrg44040580
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Oct 2021 14:07:23 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE826A4071;
 Wed,  6 Oct 2021 14:07:22 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B98DA4064;
 Wed,  6 Oct 2021 14:07:14 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.124.20])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  6 Oct 2021 14:07:14 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com,
 acme@kernel.org, jolsa@kernel.org, namhyung@kernel.org, ak@linux.intel.com
Subject: [PATCH v3 0/4] Add mem_hops field in perf_mem_data_src structure
Date: Wed,  6 Oct 2021 19:36:50 +0530
Message-Id: <20211006140654.298352-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zEICujVBASsRaBRDmaZOFLcwjaibtFJk
X-Proofpoint-GUID: gJ9cnBL_oY3bFs55H4fWf606s5flQpHX
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-06_03,2021-10-06_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 clxscore=1015 phishscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110060089
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
Cc: mark.rutland@arm.com, songliubraving@fb.com, atrajeev@linux.vnet.ibm.com,
 daniel@iogearbox.net, rnsastry@linux.ibm.com,
 alexander.shishkin@linux.intel.com, kjain@linux.ibm.com, ast@kernel.org,
 linux-perf-users@vger.kernel.org, yao.jin@linux.intel.com, maddy@linux.ibm.com,
 paulus@samba.org, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch set adds a new field called 'mem_hops' in the perf_mem_data_src structure
which can be used to represent intra-node/package or inter-node/off-package
details. This field is of size 3 bits where PERF_MEM_HOPS_{NA, 0..6} value
can be used to present different hop levels data.

Patch 1 of the patch-set adds a comment about current state of
PERF_MEM_LVL_* namespace and remove an extra line present in
perf_mem__lvl_scnprintf function.

Patch 2 & 3 adds tool and kernel side changes to add mem_hops field.

Patch 4 of the patch-set fix the data source encodings to represent
L2.1/L3.1 cache access data for powerpc platform.

Changelog:
v2 -> v3
- Since added field HOPS related to NUMA, update the data presented
  by HOPS_0 to denotes accesses from 'remote core, same node' as
  suggested by Peter Zijlstra.

- Link to the patchset v2: https://lkml.org/lkml/2021/10/5/271

v1 -> v2:
- Rather then adding new macros for L2.1/L3.1 (same chip, different
  core) entries as part of field lvlnum, we are introducing new field
  called 'mem_hops' which can be used to get hops
  level data(intra-chip/package or inter-chip/off-package details).
  As suggested by Peter Zijlstra.

- Using OnChip to denote data accesses from 'another core of same chip'
  is not too clear. Update it to 'remote core, same chip' as pointed by
  Michael Ellerman.

- Update the fix patch of correcting data source encodings to use new
  added field 'mem_hops'

- Link to the patchset v1: https://lkml.org/lkml/2021/9/4/37

Kajol Jain (4):
  perf: Add comment about current state of PERF_MEM_LVL_* namespace and
    remove an extra line
  perf: Add mem_hops field in perf_mem_data_src structure
  tools/perf: Add mem_hops field in perf_mem_data_src structure
  powerpc/perf: Fix data source encodings for L2.1 and L3.1 accesses

 arch/powerpc/perf/isa207-common.c     | 26 +++++++++++++++++++++-----
 arch/powerpc/perf/isa207-common.h     |  2 ++
 include/uapi/linux/perf_event.h       | 19 ++++++++++++++++---
 tools/include/uapi/linux/perf_event.h | 19 ++++++++++++++++---
 tools/perf/util/mem-events.c          | 20 ++++++++++++++++++--
 5 files changed, 73 insertions(+), 13 deletions(-)

-- 
2.26.2

