Return-Path: <linuxppc-dev+bounces-10350-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DFAB0D4C6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jul 2025 10:36:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bmVx65H5zz3bgw;
	Tue, 22 Jul 2025 18:36:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753173402;
	cv=none; b=Has2iqAYjoK/JYjcb55x7mWOXZ77mzPCrF/3eIJDccOQMdQoLov9GkZH7R2MSRV+W9gPTlCiuZZP80pTzv1Yn20SkoN6UpUWLJ2yyOfNYLHKIodB/VRUnoEsGTzZcpTlC/3FNUiCMtTC7eN3IgfEIjivh2m17loO+eB6SmOWJ0H74bJrAKQy6Do7jp8PK+NdoZntmWhkO2xg/R/OY0z4daXLVxkym/DlVgZ3i7JBmz6Uzopcn3PTS2zqTh5ne4qIYa8T3OsbtW5cXIeQkQ8LXiAhv00J35radCgrvomKCDDNNBSBBM6yRE5S9JBQu26FnKokoG8Fkfz0EZLjuycaOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753173402; c=relaxed/relaxed;
	bh=e75x+0k65W8f4FC2a1TxDEZ+WPaahL6AqQLqZk6dAE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bc6qHpcuP8ICnfgWqbuGj00XxZ7grLLYH10N2WE6qeV5UvDdTh5RQtEZOy48Z7R+FaCmlCjZQutSFbKa7U3nyTv/nkzYcOfuBGyzhnSkTJ+QNU82cbs2MzdcN4zX8oJECSWX7jcn01IUTsfrMdV/1+RAcSXIHhQT52JtWhLegCtxgkee8IaYrOrVoLzvscPcf0T5pdjxmOynNPWRMmo3FVIUw8kqZGnNTZDgx/GfvYLz+/mRoudcDqTaT5xzI9hozW3SV2PYQOqa0SzxWf9Iq5qGiTD9UnK5L5kq/04XGef6VvYT1xGqqn8YVdeVZG8nHpZejcX5dEawswRvqgdd/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KQ15NPqn; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KQ15NPqn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bmVx55K58z2yHs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jul 2025 18:36:41 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LIscnI023211;
	Tue, 22 Jul 2025 08:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=e75x+0k65W8f4FC2a1TxDEZ+WPaahL
	6AqQLqZk6dAE8=; b=KQ15NPqnk+ucjQP5ICBuTeLm/Sx6hlYRPUjEtdDH2Oyo6o
	503igu9qKrOk1pzwiiXYR6O7+m7BN56hbsNgC643LLjo5FTHIoMvUBdC7zVMMpV/
	xf/b7DWJrVJnQkcM3a6ZMvZSr78eylec9LUkg/NRZdflt7HACisOx69CKZk2luMY
	pjK4DzCDpce/ysbqhpF8foiuNrX8Z3ZVHWgrTK++aYnnINj15jEWipfK4OMnyv5R
	7QTJXXisYC+9oTyefqeTmEsWITu+/1dwImAe7E0H5jkkgIpTNhYHY1MpiuSq27Nh
	XB7ieXJdqaY84xk+Zyex6fgRoCz7bNhr8g2lybxg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4805ut5b67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 08:36:05 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 56M8a4lG027108;
	Tue, 22 Jul 2025 08:36:04 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4805ut5b63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 08:36:04 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56M6AH0v005470;
	Tue, 22 Jul 2025 08:36:03 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 480tvqs7qr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 08:36:03 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56M8a2Lq51446176
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Jul 2025 08:36:02 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2DEBB2004B;
	Tue, 22 Jul 2025 08:36:02 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE72E20040;
	Tue, 22 Jul 2025 08:35:59 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.124.209.19])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 22 Jul 2025 08:35:59 +0000 (GMT)
Date: Tue, 22 Jul 2025 14:05:55 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] powerpc: Cleanup and convert to MSI parent domain
Message-ID: <aH9Na8ZqrI0jPhtl@li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com>
References: <cover.1750861319.git.namcao@linutronix.de>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1750861319.git.namcao@linutronix.de>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA2NiBTYWx0ZWRfXzz4dVHZESiQ/
 1qENOBBkytkrrVtYv3NNDmU+ZM278fHVR09fFNCGw5eaKCeUqGcoa564zc0+PraLQQOdm0k+3Qu
 v1EqWZhFdCgrk978/kSvUvlZ3x9IKp0n6JTvuqmUABzJtMnDqGxNqIFQBkz6d6Od5g1pfO91Jtt
 fDkzmsWVuKjok+pOD2DkIVUFcZwOUkh9juz84EdoRHcIrcxpuNEtnVc+S+J+G0oaV6KL2jKLQfK
 EFdbEPQXStcqnDLh47JLXBgkKcrUKxqm3DlXeQO8tywazyKMYQNt9yopoU6Np2bI0Tj8lWcDcJC
 z/MIucxmzxqwej2iOD6K2ptAHbJ0jueVM8H5E7BJSJonofCqhPAk1JONp2EmHkxESYK7qwfslUo
 p7XRH7hyAN+HgGZd3EeucXwIKIlBkNcggGu4UjCWksJFVHH5ewY7TybLCTbxuMz3UadUfJvQ
X-Authority-Analysis: v=2.4 cv=Nd/m13D4 c=1 sm=1 tr=0 ts=687f4d75 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=76nLhgCsE6b-H4haFt8A:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: Yjy4XcpThh8zWYZaqCeL7Qz2gSyIbtMz
X-Proofpoint-GUID: _S-XL2vw14GQ7IXo-fbuU1N2BTNcYyhc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 clxscore=1011
 mlxlogscore=723 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 impostorscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220066
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

I am seeing a boot failure after applying this series on top of the pci
tree [1]. Note that this error was seen on a system where I have a
dedicated NVME. Systems without dedicated disk boot fine

[    2.119058] nvme nvme3: D3 entry latency set to 8 seconds
[    2.132609] xive: H_INT_GET_SOURCE_INFO lisn=0x1 failed -55
[    4.486307] nvme nvme0: D3 entry latency set to 10 seconds
[   28.193633] watchdog: BUG: soft lockup - CPU#280 stuck for 26s! [kworker/280:0:1436]
[   28.193637] CPU#280 Utilization every 4s during lockup:
[   28.193640]  #1: 101% system,          0% softirq,     0% hardirq,     0% idle
[   28.193648]  #2: 100% system,          0% softirq,     0% hardirq,     0% idle
[   28.193650]  #3: 100% system,          0% softirq,     0% hardirq,     0% idle
[   28.193653]  #4: 101% system,          0% softirq,     0% hardirq,     0% idle
[   28.193654]  #5: 100% system,          0% softirq,     0% hardirq,     0% idle
[   28.193657] Modules linked in: nvme nvme_core nvme_keyring nvme_auth pseries_wdt scsi_dh_rdac scsi_dh_emc scsi_dh_alua aes_gcm_p10_crypto crypto_simd cryptd
[   28.193672] CPU: 280 UID: 0 PID: 1436 Comm: kworker/280:0 Not tainted 6.16.0-rc1+ #5 VOLUNTARY
[   28.193675] Hardware name: IBM,9080-HEX Power11 (architected) 0x820200 0xf000007 of:IBM,FW1110.00 (NH1110_015) hv:phyp pSeries
[   28.193677] Workqueue: events work_for_cpu_fn
[   28.193684] NIP:  c0000000017d8a84 LR: c00000000032d168 CTR: c0000000001a3c20
[   28.193686] REGS: c000001c03b8b0d0 TRAP: 0900   Not tainted  (6.16.0-rc1+)
[   28.193687] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24442220  XER: 00000010
[   28.193694] CFAR: 0000000000000000 IRQMASK: 0
[   28.193694] GPR00: 18000003852fe563 c000001c03b8b370 c000000001fb8100 c000001c297f1b0c
[   28.193694] GPR04: 0000000000000003 0000000000000009 0000000038c78f48 0000000000000004
[   28.193694] GPR08: ffffffffffffffff 0000000000000020 c000001c297f2b50 0000000000000003
[   28.193694] GPR12: c000001c297f2b00 c00000258fffeb00 c000000000296018 c000000003d7c040
[   28.193694] GPR16: 0000000000000000 0000000000000000 0000000000000000 c000001c03b8b8b0
[   28.193694] GPR20: c000001c02365800 c000000027da9000 c00000000298b9e8 0000000000000002
[   28.193694] GPR24: 0000000000000001 0000000000000001 000000000000003f 0000000000000001
[   28.193694] GPR28: 000000010000003e c000000001a4e298 0000000038c78f48 3fffffe3d680d500
[   28.193712] NIP [c0000000017d8a84] mtree_load+0x244/0x370
[   28.193717] LR [c00000000032d168] irq_to_desc+0x28/0x40
[   28.193721] Call Trace:
[   28.193722] [c000001c03b8b370] [0000000000000001] 0x1 (unreliable)
[   28.193727] [c000001c03b8b420] [c00000000032d168] irq_to_desc+0x28/0x40
[   28.193729] [c000001c03b8b440] [c0000000003367dc] irq_get_irq_data+0x1c/0x40
[   28.193733] [c000001c03b8b460] [c00000000033bbbc] irq_domain_free_irqs_hierarchy+0x5c/0xe0
[   28.193736] [c000001c03b8b4a0] [c0000000001eaa88] pseries_irq_domain_alloc+0x1d8/0x2e0
[   28.193740] [c000001c03b8b5c0] [c00000000033b790] irq_domain_alloc_irqs_parent+0x40/0xa0
[   28.193742] [c000001c03b8b620] [c0000000003418bc] msi_domain_alloc+0xcc/0x230
[   28.193744] [c000001c03b8b6a0] [c00000000033b824] irq_domain_alloc_irqs_hierarchy+0x34/0x90
[   28.193747] [c000001c03b8b700] [c00000000033d16c] irq_domain_alloc_irqs_locked+0x16c/0x5a0
[   28.193749] [c000001c03b8b7e0] [c00000000033dbc0] __irq_domain_alloc_irqs+0x70/0xd0
[   28.193751] [c000001c03b8b880] [c000000000342988] __msi_domain_alloc_irqs+0x208/0x510
[   28.193754] [c000001c03b8b940] [c0000000003445ec] msi_domain_alloc_irqs_all_locked+0x6c/0x100
[   28.193757] [c000001c03b8b9a0] [c000000000eca400] pci_msi_setup_msi_irqs+0x60/0x80
[   28.193761] [c000001c03b8b9c0] [c000000000ec8bcc] msix_setup_interrupts+0x18c/0x2f0
[   28.193764] [c000001c03b8baa0] [c000000000ec92ac] __pci_enable_msix_range+0x57c/0x840
[   28.193767] [c000001c03b8bb70] [c000000000ec6948] pci_alloc_irq_vectors_affinity+0xf8/0x1d0
[   28.193769] [c000001c03b8bc00] [c0080000131641cc] nvme_setup_io_queues+0x2c4/0x570 [nvme]
[   28.193776] [c000001c03b8bd00] [c008000013167e98] nvme_probe+0x340/0x450 [nvme]
[   28.193780] [c000001c03b8bda0] [c000000000eb6bb4] local_pci_probe+0x64/0xf0
[   28.193784] [c000001c03b8be20] [c000000000280804] work_for_cpu_fn+0x34/0x50
[   28.193786] [c000001c03b8be50] [c0000000002865c0] process_one_work+0x1f0/0x500
[   28.193788] [c000001c03b8bf00] [c00000000028800c] worker_thread+0x33c/0x510
[   28.193791] [c000001c03b8bf90] [c000000000296160] kthread+0x150/0x160
[   28.193793] [c000001c03b8bfe0] [c00000000000ded8] start_kernel_thread+0x14/0x18
[   28.193795] Code: 2c090001 4182fe5c 4bfffeb8 280b0002 79291d68 4081ffac 280b0003 39400000 4082ffb0 394c0050 7c6a482a 7c2004ac <e92c0000> 792905e4 7c2c4840 4082ffac



I eventually see a kernel OOPS

[  119.622966] xive: H_INT_GET_SOURCE_INFO lisn=0x1 failed -55
[  119.623008] Kernel attempted to read user page (0) - exploit attempt? (uid: 0)
[  119.623028] BUG: Kernel NULL pointer dereference on read at 0x00000000
[  119.623048] Faulting instruction address: 0xc0000000001a0e48
[  119.623056] Oops: Kernel access of bad area, sig: 11 [#1]
[  119.623062] LE PAGE_SIZE=64K MMU=Radix  SMP NR_CPUS=2048 NUMA pSeries
[  119.623074] Modules linked in: nvme nvme_core nvme_keyring nvme_auth pseries_wdt scsi_dh_rdac scsi_dh_emc scsi_dh_alua aes_gcm_p10_crypto crypto_simd cryptd
[  119.623096] CPU: 48 UID: 0 PID: 1 Comm: systemd Tainted: G             L      6.16.0-rc1+ #5 VOLUNTARY
[  119.623104] Tainted: [L]=SOFTLOCKUP
[  119.623108] Hardware name: IBM,9080-HEX Power11 (architected) 0x820200 0xf000007 of:IBM,FW1110.00 (NH1110_015) hv:phyp pSeries
[  119.623115] NIP:  c0000000001a0e48 LR: c0000000003334b8 CTR: c0000000001a0de0
[  119.623122] REGS: c000000008087080 TRAP: 0300   Tainted: G             L       (6.16.0-rc1+)
[  119.623129] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24484408  XER: 00000155
[  119.623157] CFAR: c0000000001a0e78 DAR: 0000000000000000 DSISR: 40000000 IRQMASK: 1
[  119.623157] GPR00: c000000000333a98 c000000008087320 c000000001fb8100 c0000008ed903118
[  119.623157] GPR04: 0000000000000001 0000000000000061 0000000000000000 0000000000000000
[  119.623157] GPR08: c0000008ed903000 0000000002030001 0000000000000000 0000000000000000
[  119.623157] GPR12: c0000000001a0de0 c0000008cffc4700 0000000000000000 0000000000000000
[  119.623157] GPR16: c000000001997440 c000000061001400 c0000008ed432e80 0000000000500001
[  119.623157] GPR20: 000fffffffe00000 0000000000500001 ffffffffffffffff c000000001dd7478
[  119.623157] GPR24: 0000000000000000 c00000128de55000 c0000008ed903194 c0000008ed903248
[  119.623157] GPR28: 000000000000003a c000000000334168 c000000063929800 0000000000000001
[  119.623223] NIP [c0000000001a0e48] xive_irq_set_type+0x68/0x130
[  119.623230] LR [c0000000003334b8] __irq_set_trigger+0x88/0x270
[  119.623238] Call Trace:
[  119.623242] [c000000008087320] [c000000008087390] 0xc000000008087390 (unreliable)
[  119.623250] [c0000000080873b0] [c000000000333a98] __setup_irq+0x3f8/0x980
[  119.623257] [c000000008087450] [c000000000334168] request_threaded_irq+0x148/0x270
[  119.623265] [c0000000080874c0] [c000000000fb6ff4] notifier_add_irq+0x64/0x90
[  119.623274] [c0000000080874f0] [c000000000fb56a4] hvc_open+0x94/0x1b0
[  119.623281] [c000000008087570] [c000000000f81304] tty_open+0x1f4/0x7e0
[  119.623289] [c000000008087620] [c0000000007c6778] chrdev_open+0x158/0x390
[  119.623297] [c000000008087690] [c0000000007b59c4] do_dentry_open+0x294/0x790
[  119.623305] [c0000000080876f0] [c0000000007b816c] vfs_open+0x3c/0x140
[  119.623313] [c000000008087730] [c0000000007d75cc] do_open+0x35c/0x540
[  119.623322] [c000000008087790] [c0000000007dd080] path_openat+0x140/0x310
[  119.623328] [c000000008087800] [c0000000007dd324] do_filp_open+0xd4/0x1c0
[  119.623334] [c000000008087940] [c0000000007b87bc] do_sys_openat2+0xbc/0x160
[  119.623340] [c0000000080879c0] [c0000000007b8c1c] sys_openat+0x7c/0xd0
[  119.623346] [c000000008087a20] [c000000000032610] system_call_exception+0x160/0x310
[  119.623353] [c000000008087e50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec
[  119.623360] ---- interrupt: 3000 at 0x7fff7fd18694
[  119.623364] NIP:  00007fff7fd18694 LR: 00007fff7fd18694 CTR: 0000000000000000
[  119.623368] REGS: c000000008087e80 TRAP: 3000   Tainted: G             L       (6.16.0-rc1+)
[  119.623373] MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 48488408  XER: 00000000
[  119.623384] IRQMASK: 0
[  119.623384] GPR00: 000000000000011e 00007fffc3826190 0000000000100000 ffffffffffffff9c
[  119.623384] GPR04: 00007fff8070cd78 0000000000080101 0000000000000000 0000000000000000
[  119.623384] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[  119.623384] GPR12: 0000000000000000 00007fff808d2b80 0000000000000000 00007fffc3826708
[  119.623384] GPR16: 00007fffc38266d0 00007fff80715230 0000000000000001 00000001183fc840
[  119.623384] GPR20: 00007fffc38266b0 00007fff807244a8 0000000000000006 00007fff807244a8
[  119.623384] GPR24: 0000000000000000 0000000000000000 00007fffc3826570 00007fff8070cd78
[  119.623384] GPR28: 0000000000080101 00007fffc3826278 0000000000000015 fffffffffffffff7
[  119.623430] NIP [00007fff7fd18694] 0x7fff7fd18694
[  119.623433] LR [00007fff7fd18694] 0x7fff7fd18694
[  119.623436] ---- interrupt: 3000
[  119.623439] Code: 55290036 91280000 e9030010 60420000 81280000 7d292378 91280000 e9030010 60420000 81280000 65290200 91280000 <e9270000> 5528fffe 552907bc 7c0a4000
[  119.623455] ---[ end trace 0000000000000000 ]---
[  119.625060] nvme nvme1: D3 entry latency set to 10 seconds
[  119.627351] pstore: backend (nvram) writing error (-1)
[  119.627358]
[  120.627361] note: systemd[1] exited with irqs disabled
[  120.627425] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[  121.709848] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---



[1] : https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=controller/msi-parent


Thanks,
Gautam

