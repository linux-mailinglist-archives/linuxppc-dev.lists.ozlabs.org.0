Return-Path: <linuxppc-dev+bounces-17919-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WE+pEzQKr2lzMQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17919-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 18:58:12 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2379623E177
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 18:58:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fV4Vk3ZrQz3c9r;
	Tue, 10 Mar 2026 04:58:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773079086;
	cv=none; b=AsGuJ5ZPbm+f2FpNHd4jx9l2u4H509oEHp/z1B0OsFeHnU9FU6bXvQHVvgnE4sh4o/hlVbEbi0o4hjU9H7KhBQ2u3wmb1TQh9ivWqP6+nCUrm0lIQxKAYfoXdZ3LnaxaOjQC9kbnn5TiE/Gp68IS1JHEO8rBWAxshLt4tgQZmWVKIJtTP9Qu+zcPNg6MJyZk50L+kaK4yYZywdBBBVNUFLVRfgsdBNDAnhQk5s+BZb5hi7wN5lW7uMx5+wbh/ODP4CuW1hHZ9IQcSf/QNOTcJiD/NqupT+wgof0o/jdsqO7Li5RP6/A46y3026FoxTtw3RyuOK2Vlyx9Jy1+uu2/4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773079086; c=relaxed/relaxed;
	bh=Lg6QT/ciwQ8IaXNDewQrJalQh2lsehd22aTbQ2/Kb+o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=ntaocKXcR479CozgOWUJgjcg+5beGAa3pPMyP2gDhsE2qbPJmKO3NHyHdJAZereT5RKHWfLSoIxnj1XaVzCoQv9BuyYhU9EgtrB9Ueg/4Xh5KmX1ZmnoadJB3lYCNSioH4DOQ+F5lMpbu/2CypUqnW+JcA92/pMH3w9WoTyhrl7hoY2+Mk3BP5iPhRitQBI3uSRJfO260+bW2QJFD5N+uMpu0vKl4M2+rxdJmCEy3B8D2nMVXgvCkdPa+TPUCJeoXxsHu9BIloqBKwrPjPK2eK1wjuje+bp3QppNFZ1q+scm97N9hldWc9B/k7GOTMRUUDER6MC4dsvOWZe1C3Avpg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Iu7aeDWT; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Iu7aeDWT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fV4Vj0VV1z3c8h
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2026 04:58:04 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629FORXb1502518;
	Mon, 9 Mar 2026 17:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=Lg6QT/ciwQ8IaXNDewQrJalQh2ls
	ehd22aTbQ2/Kb+o=; b=Iu7aeDWTcj8+79T05DPGcv92DL6zSS2EMJkHuJ45k6kL
	k3UD0yem6lpDssPdqmSDZR/kg1HXoPQdWbP7SM8iRMTnw2xumLOknEo4TkZcwVWD
	uDA7jzpQiYGKVejMS4292egirmFfHikiXRjxsEx6Ak5MG0x7Povmxd3xRWLSZnp+
	ZCwryc3p9/KwCO+MlBLJooWCeoGywzl/N88SarcsXuPUEewR9qEkIz4Y4kfS1lMz
	QCjYsZQAAwtdOmcEOiCcpm/d5+tPu1Bai3w6rQmfT5VvW6LzBItEqmdkw0vcvk9J
	V1rk5xFTLQN4Cvl5viQ7dwT/vsadHLeaXLk9bvxyBQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4crcvr7jsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 17:57:49 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 629DT6gA021168;
	Mon, 9 Mar 2026 17:57:48 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4crxbsp4tx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 17:57:48 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 629Hvl6G29033094
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Mar 2026 17:57:47 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5EF725804E;
	Mon,  9 Mar 2026 17:57:47 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EBAF958054;
	Mon,  9 Mar 2026 17:57:43 +0000 (GMT)
Received: from [9.39.22.83] (unknown [9.39.22.83])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Mar 2026 17:57:43 +0000 (GMT)
Message-ID: <d5c834ff-4c95-44dd-8bef-57242d63aeee@linux.ibm.com>
Date: Mon, 9 Mar 2026 23:27:42 +0530
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
Subject: [bug report]: iommu WARNING is observed on powerpc system during pci
 enumeration at boot up
To: iommu@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Cc: joerg.roedel@amd.com, nicolinc@nvidia.com, jgg@nvidia.com,
        baolu.lu@linux.intel.com, kevin.tian@intel.com,
        Madhavan Srinivasan <maddy@linux.ibm.com>, sbhat@linux.ibm.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE1OCBTYWx0ZWRfX/uHsxPjfoTBg
 W+53DYHieojF/XQ+Tnelm+cwhWufdnwBLpIG65p81gs4NyFcWcokYU8H2pTznUt8DH+kdXtGrzW
 X84T64lwOySH74Pz6NJNBEfv9F0RIETnEPgGqgOierf0QBDHI9HnOOPxBUwmjVak+PMD1dQJHz3
 SGaJBhuFqFzJhyZlT08xmgEAeQlrIKgbARzvWGQ923D8n03QT26Yf545gAzrbyK3kCm3dGooKPn
 0bpp2vXTz0ixuWXlL5UtZpXh6HuNuduGWzMB1nURLPUwbr7cLgoqGnpJd3Fdl4/31kLFxwYSvR9
 UA3bIiVHTfKSPv2JECFF1U2o5I/ip1sizXrAQx519x5tnqzjN5J7sTFg9u7kW5WpOh5TwDamIm+
 plmOZ6C1TNLdDIzkzOG1wKKnn0g4+RQLUMvzU6/6HVyUSMFUCshr8JAgaqgNTTYD4+s5xBWuZ9w
 TSFxsThV8NEX+u68/dg==
X-Proofpoint-GUID: etO3V_SMkZy-_0DEyGofkhY9ePNtoxKy
X-Proofpoint-ORIG-GUID: etO3V_SMkZy-_0DEyGofkhY9ePNtoxKy
X-Authority-Analysis: v=2.4 cv=QoFTHFyd c=1 sm=1 tr=0 ts=69af0a1d cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=j26iQA2w5fMJB5oFc84A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090158
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 2379623E177
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-17919-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[nilay@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:iommu@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:joerg.roedel@amd.com,m:nicolinc@nvidia.com,m:jgg@nvidia.com,m:baolu.lu@linux.intel.com,m:kevin.tian@intel.com,m:maddy@linux.ibm.com,m:sbhat@linux.ibm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[nilay@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action


Hi,

The following iommu WARNING is observed on powerpc system during pci enumeration at boot up using recent
upstream kernel:

pci 0048:01:00.0: Adding to iommu group 0
------------[ cut here ]------------
WARNING: drivers/iommu/iommu.c:2252 at iommu_get_domain_for_dev+0x38/0x80, CPU#2: swapper/0/1
Modules linked in:
CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.0.0-rc2+ #35 PREEMPT
Hardware name: IBM,9105-22A Power11 (architected) 0x820200 0xf000007 of:IBM,FW1120.00 (RB1120_115) hv:phyp pSeries
NIP:  c000000000c244c4 LR: c00000000005b5a4 CTR: c00000000005b578
REGS: c00000000a7bf280 TRAP: 0700   Not tainted  (7.0.0-rc2+)
MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 22004422  XER: 0000000a
CFAR: c000000000c24508 IRQMASK: 0
GPR00: c00000000005b5a4 c00000000a7bf520 c000000001dc8100 0000000000000001
GPR04: c00000000f972f10 0000000000000000 0000000000000000 0000000000000001
GPR08: 0000001ffbc60000 0000000000000001 0000000000000000 0000000000000000
GPR12: c00000000005b578 c000001fffffe480 c000000000011618 0000000000000000
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR20: ffffffffffffefff 0000000000000000 c000000002d30eb0 0000000000000001
GPR24: c0000000017881f8 0000000000000000 0000000000000001 c00000000f972e00
GPR28: c00000000bbba0d0 0000000000000000 c00000000bbba0d0 c00000000f972e00
NIP [c000000000c244c4] iommu_get_domain_for_dev+0x38/0x80
LR [c00000000005b5a4] spapr_tce_platform_iommu_attach_dev+0x2c/0x98
Call Trace:
[c00000000a7bf520] [c000000000c244f4] iommu_get_domain_for_dev+0x68/0x80 (unreliable)
[c00000000a7bf550] [c00000000005b5a4] spapr_tce_platform_iommu_attach_dev+0x2c/0x98
[c00000000a7bf580] [c000000000c27518] __iommu_attach_device+0x44/0x220
[c00000000a7bf610] [c000000000c277e8] __iommu_device_set_domain+0xf4/0x194
[c00000000a7bf6a0] [c000000000c27974] __iommu_group_set_domain_internal+0xec/0x228
[c00000000a7bf700] [c000000000c2a3a0] iommu_setup_default_domain+0x5f4/0x6a4
[c00000000a7bf7d0] [c000000000c2b09c] __iommu_probe_device+0x674/0x724
[c00000000a7bf890] [c000000000c2b228] iommu_probe_device+0x50/0xb4
[c00000000a7bf8d0] [c00000000005b3a0] iommu_add_device+0x48/0x198
[c00000000a7bf940] [c000000000102498] pci_dma_dev_setup_pSeriesLP+0x198/0x4f0
[c00000000a7bfa30] [c000000000078f30] pcibios_bus_add_device+0x80/0x464
[c00000000a7bfae0] [c000000000af3c90] pci_bus_add_device+0x40/0x100
[c00000000a7bfb20] [c000000000af3da4] pci_bus_add_devices+0x54/0xb0
[c00000000a7bfb60] [c00000000201b2c8] pcibios_init+0xd8/0x140
[c00000000a7bfbe0] [c000000000010f04] do_one_initcall+0x8c/0x598
[c00000000a7bfcd0] [c0000000020065ac] kernel_init_freeable+0x3ec/0x850
[c00000000a7bfde0] [c000000000011644] kernel_init+0x34/0x270
[c00000000a7bfe50] [c00000000000dd3c] ret_from_kernel_user_thread+0x14/0x1c
---- interrupt: 0 at 0x0
Code: 7c0802a6 60000000 fbe1fff8 f821ffd1 ebe30480 2c3f0000 41820020 3d2200f7 39298db0 81290000 2c090000 40820020 <0b090000> ebff0170 38210030 7fe3fb78
irq event stamp: 422464
hardirqs last  enabled at (422463): [<c00000000024d838>] __up_console_sem+0xd4/0x110
hardirqs last disabled at (422464): [<c00000000002ab50>] interrupt_enter_prepare+0x88/0x260
softirqs last  enabled at (422062): [<c00000000016ad7c>] handle_softirqs+0x688/0x6a0
softirqs last disabled at (422007): [<c000000000018970>] do_softirq_own_stack+0x40/0x54
---[ end trace 0000000000000000 ]---
pci 0048:01:00.1: Adding to iommu group 0
------------[ cut here ]------------

Looking at the warning it seems that this is a regression caused due to
commit a75b2be249d6 ("iommu: Add iommu_driver_get_domain_for_dev() helper").

Any help from the iommu expert would be appreciated. Though I am not expert,
it seems the following patch help fix this warning (I encourage the iommu
developers to confirm and/or take this forward) :

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 0ce71310b7d9..d122e8447831 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1159,7 +1159,7 @@ spapr_tce_platform_iommu_attach_dev(struct iommu_domain *platform_domain,
                                     struct device *dev,
                                     struct iommu_domain *old)
  {
-       struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
+       struct iommu_domain *domain = iommu_driver_get_domain_for_dev(dev);
         struct iommu_table_group *table_group;
         struct iommu_group *grp;


Please let me know if any further information is needed.

Thanks,
--Nilay


