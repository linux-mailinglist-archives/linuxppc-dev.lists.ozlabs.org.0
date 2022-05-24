Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD05653290E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 13:32:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6sWC4W7pz3fj1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:32:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YJM1gGBw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YJM1gGBw; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6sKW1KDHz3gQC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 21:24:14 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OA1hVR015197;
 Tue, 24 May 2022 11:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=kykubJkzX1oGNgeN6ESKMNHxM8yz3Sga91HNs+hXK9A=;
 b=YJM1gGBwg/54LDliHFrem99cSHzyQEBb+FL3BdR4pg/rbcDRdDMWgZaqNVZe+g0pKmmx
 aUB6qzJHSRqHX4eZCuhTSzT/nvYjTK4MoJitkzcyXi+5YyUqtEuQd8WGofJB8driXo9s
 vJ4Oq95zBLyAAJL0u6J/ZsspR8uMnLto23n7p/k+ffZyoZ3a3wlT3taufNAQfJjHNZNo
 ozh0zlmlJYB1sbMhJ3g/gabxfY+qUrQLUQIsp6dcvNbxea8N5acYgnYvr6ZaDGMyUzqb
 NAERqDOpRzDDgB38KwbCxDiwqwjB+GGgcLpJfKNa61GGNcrvOtAEfRarnUlZEcfjJM7n 1w== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g8w8g1fya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 11:24:04 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24OBCD6a027258;
 Tue, 24 May 2022 11:24:02 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3g6qbjcbnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 11:24:02 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24OBNxFs40829284
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 11:23:59 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 868EC52052;
 Tue, 24 May 2022 11:23:59 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.43.16.48])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 2670C5204F;
 Tue, 24 May 2022 11:23:55 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Tue, 24 May 2022 16:53:54 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: nvdimm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/papr_scm: don't requests stats with '0' sized stats
 buffer
Date: Tue, 24 May 2022 16:53:53 +0530
Message-Id: <20220524112353.1718454-1-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: d2l_vtGwXDQrm6Kiv6av3OVqPcbbjDCU
X-Proofpoint-ORIG-GUID: d2l_vtGwXDQrm6Kiv6av3OVqPcbbjDCU
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-24_06,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 spamscore=0 impostorscore=0
 mlxlogscore=916 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205240057
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
Cc: Shivaprasad G Bhat <sbhat@linux.ibm.com>,
 Sachin Sant <sachinp@linux.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sachin reported [1] that on a POWER-10 lpar he is seeing a kernel panic being
reported with vPMEM when papr_scm probe is being called. The panic is of the
form below and is observed only with following option disabled(profile) for the
said LPAR 'Enable Performance Information Collection' in the HMC:

 Kernel attempted to write user page (1c) - exploit attempt? (uid: 0)
 BUG: Kernel NULL pointer dereference on write at 0x0000001c
 Faulting instruction address: 0xc008000001b90844
 Oops: Kernel access of bad area, sig: 11 [#1]
<snip>
 NIP [c008000001b90844] drc_pmem_query_stats+0x5c/0x270 [papr_scm]
 LR [c008000001b92794] papr_scm_probe+0x2ac/0x6ec [papr_scm]
 Call Trace:
       0xc00000000941bca0 (unreliable)
       papr_scm_probe+0x2ac/0x6ec [papr_scm]
       platform_probe+0x98/0x150
       really_probe+0xfc/0x510
       __driver_probe_device+0x17c/0x230
<snip>
 ---[ end trace 0000000000000000 ]---
 Kernel panic - not syncing: Fatal exception

On investigation looks like this panic was caused due to a 'stat_buffer' of
size==0 being provided to drc_pmem_query_stats() to fetch all performance
stats-ids of an NVDIMM. However drc_pmem_query_stats() shouldn't have been called
since the vPMEM NVDIMM doesn't support and performance stat-id's. This was caused
due to missing check for 'p->stat_buffer_len' at the beginning of
papr_scm_pmu_check_events() which indicates that the NVDIMM doesn't support
performance-stats.

Fix this by introducing the check for 'p->stat_buffer_len' at the beginning of
papr_scm_pmu_check_events().

[1] https://lore.kernel.org/all/6B3A522A-6A5F-4CC9-B268-0C63AA6E07D3@linux.ibm.com

Fixes: 0e0946e22f3665d2732 ("powerpc/papr_scm: Fix leaking nvdimm_events_map elements")
Reported-by: Sachin Sant <sachinp@linux.ibm.com>
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 181b855b3050..82cae08976bc 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -465,6 +465,9 @@ static int papr_scm_pmu_check_events(struct papr_scm_priv *p, struct nvdimm_pmu
 	u32 available_events;
 	int index, rc = 0;
 
+	if (!p->stat_buffer_len)
+		return -ENOENT;
+
 	available_events = (p->stat_buffer_len  - sizeof(struct papr_scm_perf_stats))
 			/ sizeof(struct papr_scm_perf_stat);
 	if (available_events == 0)
-- 
2.35.1

