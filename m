Return-Path: <linuxppc-dev+bounces-7864-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C9BA9506A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Apr 2025 13:50:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zh3bG35RYz3c8Y;
	Mon, 21 Apr 2025 21:50:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745236234;
	cv=none; b=j+X3L3FXdjglexoS2Ts/62BDbw8Oq9YS/04kId5d8/HXOwRiBFyBix+SzYAh8UbDTXOxLaNwqDNGfTOeJF0im+qBg0LqdR+wpLbzFUwacC7p0nreBDrTn6zDyRjlhodRrrqpVAGLE90KP1/brYyrkXNz4n4Xnu+j/nx97vR+0RM7KVCFHzQ0nAJfYucBGGwyOS+ZffE791wGlG7tuPhBRIlKxsZcUSX1hwUVh1R7rgvghWL0X2dnrAY9HUwCUesjwgdBLWaY+nTbeVG3WsPUCLENF1e0CXPlWn3qVADMZ2NNB+iFe0ZB+l8U+xDO2DOEdEv/AQRVxdA62O77f9/D3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745236234; c=relaxed/relaxed;
	bh=hN4zG5R3enJX2OMcr2mXN7QUjbNu2ACnQiD/BEJAzII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dTZWoeN+0VgG1ch5JiJnYqDN78oI+O25s32wY2Jz2ygQuHuyFu2MGltn87hVAHskey9LE7OGo+7+yfTFoAsG5SlzwmBS2PxqUb8KCs5RI2Rer/qMzgfO8OLh3qtQC8uO/09wqc7TTrS/7BREvkxkyC/9Agd57v+FPMXI3iV3bJrUm+NxS1tprUb+7HTy4DUFHBJCuiG/yLisKlv7d3/CmpVJqnZpaQDyIBx8u6883FCzTiT6BBbE4vja8v4krPCvdUq7ylmbeBVK2IExU3aRtzJi25bgqq9LlNBeu1MJxSSwkhaRMajlC3dYMX1TKnIkJfzLOR3hALBpmRnIxp8feQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VX6xYAH+; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VX6xYAH+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zh3bF1wxpz3c86
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 21:50:32 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LAexPj011252;
	Mon, 21 Apr 2025 11:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=hN4zG5R3enJX2OMcr2mXN7QUjbNu2A
	CnQiD/BEJAzII=; b=VX6xYAH+Jzu9wLK4IrfN49dE3O65++WWAPQ8E3fvjKXOcj
	zlwzwBfEb03BKLkQmnHr3yfjR86J1Zcqo4sfG0lgpApwnvcCH41i09YU0WrAA9QV
	cWFUSqBw1aAZOLGQ8HIkiNPY5wX+mIdaxVOUfSJg9B9X2rrMyubr3OowzDBa1BDt
	4xcXslu7U78XOtQa/QqclV88ADHV9qOpdiDqZD2gUrvjACVO5VQljtb0jaKTc+RZ
	1RUWrzXXeNW0+FzxqpvTI0rZfvuIXRijdvWejXw1zINbzF1Brm0fceqxg9MuaDQI
	HdquxnP+GIaY4nQGenJhEkOzuq3O+v6srD3E+tVQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 465mfs880w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 11:50:18 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53LBoILU028139;
	Mon, 21 Apr 2025 11:50:18 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 465mfs880u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 11:50:18 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53LALK3n012355;
	Mon, 21 Apr 2025 11:50:17 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 464p5sxc8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 11:50:17 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53LBoDmu50266594
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 11:50:13 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A2F8720043;
	Mon, 21 Apr 2025 11:50:13 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08B3220040;
	Mon, 21 Apr 2025 11:50:12 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.204.206.66])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 21 Apr 2025 11:50:11 +0000 (GMT)
Date: Mon, 21 Apr 2025 17:20:08 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/pseries/msi: Avoid reading PCI device registers
 in reduced power states
Message-ID: <pjuk4ckhtlpu2m6qykrpv6jw4eafymnarrpun4psn6yptogj2b@5ird52o5ml4p>
References: <20250305090237.294633-1-gautam@linux.ibm.com>
 <87tt81tr8t.fsf@vajain21.in.ibm.com>
 <0baf5da4-3cf9-47d0-a4da-68e50a0fce80@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0baf5da4-3cf9-47d0-a4da-68e50a0fce80@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=cM/gskeN c=1 sm=1 tr=0 ts=680630fa cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=_u-ZW7uzS0qod4lKHOEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: OH3feazQ_ztt-DO_Eg5vcSjhhLEhr4IB
X-Proofpoint-ORIG-GUID: WZAgA8JbT8PHj0Cgwy8SKe-O1vl13pft
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 adultscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=486 priorityscore=1501
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210089
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Venkat,

Thanks for the report. I looked into this and found that the new warning
you reported can be observed even on current distro kernels, and is not
caused by the patch I've posted.

I was able to observe the same warning with fedora distro kernel 6.13.7-200.fc41

[   70.294478] icp_hv_set_xirr: bad return code eoi xirr=0x50a0002 returned -4
[   70.294521] ------------[ cut here ]------------
[   70.294546] WARNING: CPU: 7 PID: 54 at arch/powerpc/sysdev/xics/icp-hv.c:55 icp_hv_eoi+0xf8/0x120
[   70.294599] Modules linked in: xt_conntrack xt_MASQUERADE bridge stp llc ip6table_nat ip6table_filter ip6_tables xt_set ip_set iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 xt_addrtype iptable_filter ip_tables kvm rpcrdma rdma_cm iw_cm ib_cm ib_core bonding overlay rfkill binfmt_misc vmx_crypto pseries_rng nfsd auth_rpcgss nfs_acl loop dm_multipath lockd grace nfs_localio nfnetlink vsock_loopback vmw_vsock_virtio_transport_common vsock xfs nvme_tcp nvme_fabrics nvme_keyring nvme_core nvme_auth ibmvscsi ibmveth scsi_transport_srp crct10dif_vpmsum crc32c_vpmsum pseries_wdt sunrpc be2iscsi bnx2i cnic uio cxgb4i cxgb4 tls cxgb3i cxgb3 mdio libcxgbi libcxgb qla4xxx iscsi_boot_sysfs iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi scsi_dh_rdac scsi_dh_emc scsi_dh_alua fuse aes_gcm_p10_crypto crypto_simd cryptd
[   70.295015] CPU: 7 UID: 0 PID: 54 Comm: ksoftirqd/7 Kdump: loaded Not tainted 6.13.7-200.fc41.ppc64le #1
[   70.295064] Hardware name: IBM,9080-HEX POWER8 (architected) 0x800200 0xf000004 of:IBM,FW1060.00 (NH1060_022) hv:phyp pSeries
[   70.295120] NIP:  c000000000197c98 LR: c000000000197c94 CTR: 0000000000000000
[   70.295157] REGS: c000000007dd3a20 TRAP: 0700   Not tainted  (6.13.7-200.fc41.ppc64le)
[   70.295197] MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 24004202  XER: 00000001
[   70.295247] CFAR: c00000000032731c IRQMASK: 1
[   70.295247] GPR00: c000000000197c94 c000000007dd3cc0 c0000000024daa00 000000000000003f
[   70.295247] GPR04: 00000000ffff7fff 00000000ffff7fff c000000007dd3ae8 00000007ec8e0000
[   70.295247] GPR08: 0000000000000027 0000000000000000 0000000000000000 0000000000004000
[   70.295247] GPR12: 0000000000000000 c00000000ffc6f00 c000000000287ef8 c000000004a51080
[   70.295247] GPR16: 0000000000000000 0000000004208040 c000000003d62c80 c0000000031faf80
[   70.295247] GPR20: 00000000ffffa63b 000000000000000a c0000000031e6990 c000000000335f10
[   70.295247] GPR24: 0000000000000001 0000000000000000 0000000000000006 0000000000000002
[   70.295247] GPR28: c0000007efac68b8 0000000000000000 00000000050a0002 00000000050a0002
[   70.295603] NIP [c000000000197c98] icp_hv_eoi+0xf8/0x120
[   70.295633] LR [c000000000197c94] icp_hv_eoi+0xf4/0x120
[   70.295661] Call Trace:
[   70.295675] [c000000007dd3cc0] [c000000000197c94] icp_hv_eoi+0xf4/0x120 (unreliable)
[   70.295717] [c000000007dd3d40] [c000000000337a5c] handle_fasteoi_irq+0x16c/0x350
[   70.295757] [c000000007dd3d70] [c000000000335fd0] resend_irqs+0xc0/0x190
[   70.295793] [c000000007dd3db0] [c000000000254064] tasklet_action_common+0x154/0x440
[   70.295833] [c000000007dd3e20] [c000000000253458] handle_softirqs+0x168/0x4f0
[   70.295871] [c000000007dd3f10] [c000000000253848] run_ksoftirqd+0x68/0xb0
[   70.295912] [c000000007dd3f30] [c000000000292f20] smpboot_thread_fn+0x1d0/0x240
[   70.295951] [c000000007dd3f90] [c000000000288020] kthread+0x130/0x140
[   70.295984] [c000000007dd3fe0] [c00000000000ded8] start_kernel_thread+0x14/0x18
[   70.296022] Code: 48c84251 60000000 e9210068 4bffff98 7c661b78 3c82ff31 3c62ff7d 7fc5f378 38842b40 38639bf8 4818f649 60000000 <0fe00000> 38210080 7be34622 e8010010
[   70.296104] ---[ end trace 0000000000000000 ]---
[   70.297273] PM: resume devices took 0.000 seconds
[   70.297415] OOM killer enabled.
[   70.297433] Restarting tasks ... done.
[   70.298959] random: crng reseeded on system resumption
[   70.299106] PM: suspend exit


This can be tracked as a separate bug, as it is unrelated to the patch.

Thanks,
Gautam

