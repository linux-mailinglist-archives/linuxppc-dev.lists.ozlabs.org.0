Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2A685359C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 17:06:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RbOfyOcL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZ5mT5Lfpz3dnN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 03:06:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RbOfyOcL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZ5lj1lRNz3c2C
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 03:05:52 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41DFpPJk011016;
	Tue, 13 Feb 2024 16:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : from : to : cc
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=rLxtQUcCyyKuXIeB9jaP75L5+oTLQrw5RzCxx4o/DO0=;
 b=RbOfyOcLweilCV7WEB9RtEFP7Z/7BE3emiWTH+70aTHzuX8qXj9CfuEq0MLj1MhyOe3t
 8jjUoaCsKuXbltAChkcqGpPob+RgY745VpuE3r0R/8ulmFJzLIuxItmr5tYW+bZb+V76
 8h2jDAOgA7PfmowBUKhkhdf+Qco16W9/xAr5RSd8GdTHBz8QACd0aVzBRPXL9poiA2YN
 IzTTzyjJfmy4cP+RRzaUNRI9vH1sQ0/7Q8RUXZnkuwHtq51bgrudoSDKJd4x3H9+wfPK
 sL55cQo4i4ABDh0exIqAEl1hkn/ag1GBSnjuwN9l9Z2CsuDIColP5quTVYSDsIq3W4Dk YA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w876tqjkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 16:05:33 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41DFqQFR016291;
	Tue, 13 Feb 2024 16:05:32 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w876tqjk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 16:05:32 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41DDEqbZ009914;
	Tue, 13 Feb 2024 16:05:31 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6p62quhh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 16:05:31 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41DG5QOO25494264
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Feb 2024 16:05:28 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 482C52004F;
	Tue, 13 Feb 2024 16:05:26 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9AB8320043;
	Tue, 13 Feb 2024 16:05:23 +0000 (GMT)
Received: from ltcd48-lp2.aus.stglab.ibm.com (unknown [9.3.101.175])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 Feb 2024 16:05:23 +0000 (GMT)
Subject: [PATCH] powerpc/iommu: Fix the missing iommu_group_put() during
 platform domain attach
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: iommu@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Date: Tue, 13 Feb 2024 10:05:22 -0600
Message-ID: <170784021983.6249.10039296655906636112.stgit@linux.ibm.com>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jfJf4Z8YxA_Y0Rk2X8-LmH_n6-rB5V3Y
X-Proofpoint-GUID: q0OqJzcgkPMFV6-hjCFOY-jRUaoT6lUg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_08,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 mlxlogscore=339 phishscore=0 impostorscore=0
 clxscore=1011 mlxscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402130126
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
Cc: venkat88@linux.vnet.ibm.com, jroedel@suse.de, gbatra@linux.vnet.ibm.com, sbhat@linux.ibm.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, jgg@ziepe.ca, tpearson@raptorengineering.com, npiggin@gmail.com, bgray@linux.ibm.com, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, aik@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The function spapr_tce_platform_iommu_attach_dev() is missing to call
iommu_group_put() when the domain is already set. This refcount leak
shows up with BUG_ON() during DLPAR remove operation as,

  KernelBug: Kernel bug in state 'None': kernel BUG at arch/powerpc/platforms/pseries/iommu.c:100!
  Oops: Exception in kernel mode, sig: 5 [#1]
  LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=8192 NUMA pSeries
  <snip>
  Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1060.00 (NH1060_016) hv:phyp pSeries
  NIP:  c0000000000ff4d4 LR: c0000000000ff4cc CTR: 0000000000000000
  REGS: c0000013aed5f840 TRAP: 0700   Tainted: G          I         (6.8.0-rc3-autotest-g99bd3cb0d12e)
  MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 44002402  XER: 20040000
  CFAR: c000000000a0d170 IRQMASK: 0
  GPR00: c0000000000ff4cc c0000013aed5fae0 c000000001512700 c0000013aa362138
  GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000119c8afd0
  GPR08: 0000000000000000 c000001284442b00 0000000000000001 0000000000001003
  GPR12: 0000000300000000 c0000018ffff2f00 0000000000000000 0000000000000000
  GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR24: c0000013aed5fc40 0000000000000002 0000000000000000 c000000002757d90
  GPR28: c0000000000ff440 c000000002757cb8 c00000183799c1a0 c0000013aa362b00
  NIP [c0000000000ff4d4] iommu_reconfig_notifier+0x94/0x200
  LR [c0000000000ff4cc] iommu_reconfig_notifier+0x8c/0x200
  Call Trace:
  [c0000013aed5fae0] [c0000000000ff4cc] iommu_reconfig_notifier+0x8c/0x200 (unreliable)
  [c0000013aed5fb10] [c0000000001a27b0] notifier_call_chain+0xb8/0x19c
  [c0000013aed5fb70] [c0000000001a2a78] blocking_notifier_call_chain+0x64/0x98
  [c0000013aed5fbb0] [c000000000c4a898] of_reconfig_notify+0x44/0xdc
  [c0000013aed5fc20] [c000000000c4add4] of_detach_node+0x78/0xb0
  [c0000013aed5fc70] [c0000000000f96a8] ofdt_write.part.0+0x86c/0xbb8
  [c0000013aed5fce0] [c00000000069b4bc] proc_reg_write+0xf4/0x150
  [c0000013aed5fd10] [c0000000005bfeb4] vfs_write+0xf8/0x488
  [c0000013aed5fdc0] [c0000000005c0570] ksys_write+0x84/0x140
  [c0000013aed5fe10] [c000000000033358] system_call_exception+0x138/0x330
  [c0000013aed5fe50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec
  --- interrupt: 3000 at 0x20000433acb4
  <snip>
  ---[ end trace 0000000000000000 ]---

The patch adds the missing iommu_group_put() call.

Fixes: a8ca9fc9134c ("powerpc/iommu: Do not do platform domain attach atctions after probe")
Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
 arch/powerpc/kernel/iommu.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index d71eac3b2887..a9bebfd56b3b 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1289,8 +1289,10 @@ spapr_tce_platform_iommu_attach_dev(struct iommu_domain *platform_domain,
 	struct iommu_table_group *table_group;
 
 	/* At first attach the ownership is already set */
-	if (!domain)
+	if (!domain) {
+		iommu_group_put(grp);
 		return 0;
+	}
 
 	table_group = iommu_group_get_iommudata(grp);
 	/*


