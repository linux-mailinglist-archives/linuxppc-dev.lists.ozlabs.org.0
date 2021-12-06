Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A179469234
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 10:19:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J6yYq2xP2z30HR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 20:19:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EEqMDoby;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EEqMDoby; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J6yY63QDvz2yN4
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Dec 2021 20:19:05 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B67nSPw027849; 
 Mon, 6 Dec 2021 09:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=CGumk23jEK8sgi7ARQJzRZVUz22ruT3G4D1pfW0Gs2s=;
 b=EEqMDoby4t8Qp2qiEwJrQh5jgQHkW0MPNtJlL/8Ej8nUmoQZGKwlRUFQIvF7xg4i3237
 pt1BhyNQOeNm8A44g490P+YLcH8h4KKLIOzoPQMd0Hp4oi9VvsYAy3anu/IjtuCVH3l2
 AeispWSbQ9vrPBI8vQsIWsYUVmg1DCWh/ZZAgKTYhQxkLp5+axhDlsUY6i+5cdup0da7
 zb5yHETdXnXuopdeJBAsKWDPikgQg670xKbbL2Ew7NTWk8jgPLoEFy3zWPDuQMvwZ4ET
 0ZC3lYVuoVSzSbPqBn1JB4TeotXLoCgrB2IWozez7Hjltn52wWfnKYuEENzUmv2G4O0L uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cs9kgx63y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 09:18:40 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B69HhhU025213;
 Mon, 6 Dec 2021 09:18:39 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cs9kgx637-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 09:18:39 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B69Dg1D022008;
 Mon, 6 Dec 2021 09:18:36 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 3cqyy99vbu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 09:18:36 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B69ID4S30409150
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Dec 2021 09:18:13 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1CB81A407B;
 Mon,  6 Dec 2021 09:18:13 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEDFFA4059;
 Mon,  6 Dec 2021 09:18:06 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.39.249]) by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Dec 2021 09:18:06 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com,
 acme@kernel.org, jolsa@kernel.org, namhyung@kernel.org, ak@linux.intel.com
Subject: [PATCH 0/4] perf: Add new macros for mem_hops field
Date: Mon,  6 Dec 2021 14:47:45 +0530
Message-Id: <20211206091749.87585-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9idYJ3LfwjeQn45I-_D097VnvnCVC1K7
X-Proofpoint-ORIG-GUID: EZqK0e2t2HjGUzRclyp8xm5NLStx-D6G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-06_03,2021-12-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1011
 impostorscore=0 phishscore=0 mlxscore=0 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112060054
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

Patchset adds new macros for mem_hops field which can be
used to represent remote-node, socket and board level details.

Currently the code had macro for HOPS_0, which corresponds
to data coming from another core but same node.
Add new macros for HOPS_1 to HOPS_3 to represent
remote-node, socket and board level data.

For ex: Encodings for mem_hops fields with L2 cache:

L2                      - local L2
L2 | REMOTE | HOPS_0    - remote core, same node L2
L2 | REMOTE | HOPS_1    - remote node, same socket L2
L2 | REMOTE | HOPS_2    - remote socket, same board L2
L2 | REMOTE | HOPS_3    - remote board L2

Patch 1 & 2 adds tool and kernel side changes to add new macros for
mem_hops field

Patch 3 add data source encodings for power10 and older platforms
to represent data based on newer composite  PERF_MEM_LVLNUM* fields

Patch 4 add data source encodings with proper sub_index used to
represent memory/cache level data for power10 platform.

Kajol Jain (4):
  perf: Add new macros for mem_hops field
  tools/perf: Add new macros for mem_hops field
  powerpc/perf: Add encodings to represent data based on newer composite
    PERF_MEM_LVLNUM* fields
  powerpc/perf: Add data source encodings for power10 platform

 arch/powerpc/perf/isa207-common.c     | 60 ++++++++++++++++++++-------
 include/uapi/linux/perf_event.h       |  5 ++-
 tools/include/uapi/linux/perf_event.h |  5 ++-
 tools/perf/util/mem-events.c          | 29 ++++++++-----
 4 files changed, 71 insertions(+), 28 deletions(-)

-- 
2.27.0

