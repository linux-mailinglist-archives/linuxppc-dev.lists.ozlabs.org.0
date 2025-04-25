Return-Path: <linuxppc-dev+bounces-7993-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC90CA9CF1F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Apr 2025 19:08:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZkfRx3gznz305S;
	Sat, 26 Apr 2025 03:08:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745600893;
	cv=none; b=l+XNc+mgUlKPczw5q0J7TNOBpcqB2tjFabT0eUE6htTA+u9a/qHT8oo6DCcvvvT6F5sO0vH8+JrLd8f69K3GRt2+WQkWcGu23pZsOIHv/HStl9oGFy8g6skH8XdmXLcYFH5b0FdNGHNH1ZmFEAqlbTsomWnNAyzvfumoudlYQfsaPxZwBPLJTLdvP02+zlES5mFYGIoZzF9VzMAnR03j8W2Iwf3WSqV4JEr6BN4faBh0EbLexT9IJRe4jJUqPR4ZyGOZI0BTl502jzgrHZwJAJuZjXpnpmYKDtjVvdajIGUDmP5/TDhPjIECq9XKNn5BqkBTBqVp6fKMBlOvwKQCag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745600893; c=relaxed/relaxed;
	bh=a2ZLlGIfwX9z+OPL7YX9BYuD4NUW+dbN5PxlcO6fbzA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ob+85jIuyapk0ggGsoPlu87ZN+ibYM7q1FgLtOkHEr79bVsKa7K9zxyF5j+2pC+uKwdt7rdQqj5bzCNpU3Fj/1rQKKWS6dyRaMFvAMnUa09TZG6Gopsp883NfV2eU0WWj60MY3b8jqHj7uOsPVb9O7hFdOol92ip4zQY1Hj7zsPTEfQkUWeF2WCdZB6CEjz/Rz2VJpXQoGiUczlYtHhQ6o7bBbZpM9+Wt42veFd4xjNSpyGqS7MwEzsS8whUP8WQoapk9/4iH2BZVqQP5RakhoXyLtAao667mYzTCAk/oWyDrh71w3Y5/8wUgWtBADn70E0uLimUxfL3lHNtlmm5+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ejYRv6hK; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gbatra@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ejYRv6hK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gbatra@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZkfRw1vwYz302b
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 03:08:12 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PCJZKq025095
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 17:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=a2ZLlGIfwX9z+OPL7YX9BYuD4NUW+dbN5PxlcO6fb
	zA=; b=ejYRv6hKUS0FiKVS74m4QWjQuQEL72UsDVJA9v+fjyRVDbyVdr2khUkuy
	BYV9Nnq9g6z1WZWWS5Nx4Xiw8zduGFAWnaMI0TBOtk2egWQfoUWzOLmxdCnF7LWH
	lWT8MRLR/WGbc0d65P/l5/4Ma29uFqs60VBFg83lwTR7Q6lBbXfC+wdms6JKes8i
	AyVNk8BaTY05Wq9mg+3yLc63Mj6dK8MfCz1kGqtoc4iz5GoCZwGvQp+W1bK7Xbue
	F/gf+JEtuOMDdd26vMzesYeRos2hpTpEP0vtPVow7tNXAEVtlSdMl8t8IpO3/AIU
	hVkzCBcGXYSaiwldmAxFhOLZhdJhg==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 467y90v3xn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 17:08:09 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGLHQ7004052
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 17:08:08 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 466jg069gm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 17:08:08 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53PH86G414811878
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 17:08:07 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BA765806A;
	Fri, 25 Apr 2025 17:08:06 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8460B58056;
	Fri, 25 Apr 2025 17:08:06 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.24.22.94])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 25 Apr 2025 17:08:06 +0000 (GMT)
From: Gaurav Batra <gbatra@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com
Cc: Gaurav Batra <gbatra@linux.ibm.com>
Subject: [PATCH] powerpc/iommu: Memory leak in TCE table userspace view
Date: Fri, 25 Apr 2025 12:08:06 -0500
Message-Id: <20250425170806.28987-1-gbatra@linux.ibm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=aZRhnQot c=1 sm=1 tr=0 ts=680bc179 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=_ic8xWZxl3AzqVNFu_8A:9
X-Proofpoint-GUID: LfdiaZosS-Y_seNCURIr8nGK8qapeQUl
X-Proofpoint-ORIG-GUID: LfdiaZosS-Y_seNCURIr8nGK8qapeQUl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyMSBTYWx0ZWRfX2pk8imnEWAvX 6sM6fTFIqwJ5Z8FH/9+J3/tOXPepHoTkpGPw0znviqce0akOuIrAqxo3TOAwKl0uD4Wl6nyZbwS gwkn/TMnn4oo5HUpRkOEKjE7+rEXzTyUXGRpUF7E5UU7+kIdF5b4vj3/D/xB2S0FtSdSlKQoB42
 c6BdEUtcJAvVl32OgHZl8KGsPzGBjs3+H2y2hOCE1b3oGkGzZWIyFLgFOutn09XIrizBVvTYLY0 4Ig7yiQx27hKa1VwR2gAzOJTGFHkDT3Yl+N5zi49o/fENaU72ozxRW7jZHHPmxYoK9J1x4cGm13 hv9x147i527RIe0TD1NEJClA39f/6Vjy+cr+tyL3s0Z2ssW4vtZnTDuRYUD+IzFGAXeH6Vb8ey/
 hKATsQthNDersz6K4g1ldtg+y6aDhLmsiXzRU4JHx0SBW71Ql0Kc5Eba/r9KUW8bRs7cdTrL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 mlxlogscore=878 impostorscore=0 mlxscore=0 malwarescore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250121
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When a device is opened by a userspace driver, via VFIO interface, DMA
window is created. This DMA window has TCE Table and a corresponding
data for userview of
TCE table.

When the userspace driver closes the device, all the above infrastructure
is free'ed and the device control given back to kernel. Both DMA window
and TCE table is getting free'ed. But due to a code bug, userview of the
TCE table is not getting free'ed. This is resulting in a memory leak.

Befow is the information from KMEMLEAK

unreferenced object 0xc008000022af0000 (size 16777216):
  comm "senlib_unit_tes", pid 9346, jiffies 4294983174
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 0):
    kmemleak_vmalloc+0xc8/0x1a0
    __vmalloc_node_range+0x284/0x340
    vzalloc+0x58/0x70
    spapr_tce_create_table+0x4b0/0x8d0
    tce_iommu_create_table+0xcc/0x170 [vfio_iommu_spapr_tce]
    tce_iommu_create_window+0x144/0x2f0 [vfio_iommu_spapr_tce]
    tce_iommu_ioctl.part.0+0x59c/0xc90 [vfio_iommu_spapr_tce]
    vfio_fops_unl_ioctl+0x88/0x280 [vfio]
    sys_ioctl+0xf4/0x160
    system_call_exception+0x164/0x310
    system_call_vectored_common+0xe8/0x278
unreferenced object 0xc008000023b00000 (size 4194304):
  comm "senlib_unit_tes", pid 9351, jiffies 4294984116
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 0):
    kmemleak_vmalloc+0xc8/0x1a0
    __vmalloc_node_range+0x284/0x340
    vzalloc+0x58/0x70
    spapr_tce_create_table+0x4b0/0x8d0
    tce_iommu_create_table+0xcc/0x170 [vfio_iommu_spapr_tce]
    tce_iommu_create_window+0x144/0x2f0 [vfio_iommu_spapr_tce]
    tce_iommu_create_default_window+0x88/0x120 [vfio_iommu_spapr_tce]
    tce_iommu_ioctl.part.0+0x57c/0xc90 [vfio_iommu_spapr_tce]
    vfio_fops_unl_ioctl+0x88/0x280 [vfio]
    sys_ioctl+0xf4/0x160
    system_call_exception+0x164/0x310
    system_call_vectored_common+0xe8/0x278

Fixes: f431a8cde7f1 ("powerpc/iommu: Reimplement the iommu_table_group_ops for pSeries")
Signed-off-by: Gaurav Batra <gbatra@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index d6ebc19fb99c..eec333dd2e59 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -197,7 +197,7 @@ static void tce_iommu_userspace_view_free(struct iommu_table *tbl)
 
 static void tce_free_pSeries(struct iommu_table *tbl)
 {
-	if (!tbl->it_userspace)
+	if (tbl->it_userspace)
 		tce_iommu_userspace_view_free(tbl);
 }
 

base-commit: 02ddfb981de88a2c15621115dd7be2431252c568
-- 
2.39.3 (Apple Git-146)


