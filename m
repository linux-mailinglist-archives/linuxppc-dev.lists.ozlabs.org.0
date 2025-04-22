Return-Path: <linuxppc-dev+bounces-7878-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C2FA95D1F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 06:51:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhVFL39YLz3bqq;
	Tue, 22 Apr 2025 14:51:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745297494;
	cv=none; b=on3WvQEyeSMTQOtLwbJdJUSXsRnMI4FyG0auUzesiC44Pvk82Qfs/6UgCiGymCzwIp8CirvvDXujj+WzELVBkvdMpRJx4jQTw+SEwJ1VwxoCWYEWBMvGS+I7A3FEEIzV0ea/74piaBISu1n3Cl2jc2kPULKj1gZpfU71QzzXKxrowGWSyxe1Ix0p0K3EYBvbRiE+yaY7So6Q5hOxsJ5cjOU+0qjehNuJJMKAKmEFFL4l/CsIa5PeokslPFOXl6yLCWf/tZWn6sfrdqOGcExY6IJ8d5svfUddNgU8YzvV9dVOB5DG2JHTM2816pkjZnvK5dJUAsMA5O2UGte+VJu81g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745297494; c=relaxed/relaxed;
	bh=kWzUlK1mc0ow8mfqhy4TYwRqkl7sStXHUVzyyC6kzdE=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=Zs50oFOMoqWQFK0RKvmRGtNI36PAH0zYOAsgCQz8kmvOzUD2wIkRwfsM8pr0xDeQXWLgvW5UjOR4/LXqkd3KZVdy0o1pSVmFKQzE0tHsidhZzhzUTZQxL5noi644SL0oSARH1WrRSa8c+ggdfQgu18BuBpnEOs5Nf7OBcRQGTQfEw38py8yQ+XNfwIo2XxgAGaxeIAYYZScaZps6b77dXYk+MBKGLnDEmHAVZb+IM9XXTpJvWhSypZhs3q0PmhGEgr4X6KbcfmWL4kfOY2tBxJcCYKVy/AsaxCruYzinPJUwJIPXdBUso71WqTihi+L7vGn1KR6xDCBXAfrREKEjew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SVtwE/Bq; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SVtwE/Bq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhVFK0XfBz3bps
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 14:51:32 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LNkv8F032319;
	Tue, 22 Apr 2025 04:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=kWzUlK1mc0ow8mfqhy4TYwRqkl7s
	StXHUVzyyC6kzdE=; b=SVtwE/BqtGMNXxZwPewLFBmbX3pwyIe4LHd4AQyZhgDv
	GaL8J+tP2z4W1FLY/SysDKYEgTvgQE2P3DnIHVuV1pEH7PJPI1h4K8TWIJxjLetp
	rTgnrlk6q54Lhb5xkkX9Qcdz27VDXptNJ/3pCIXzGXbTNUHqeoCkZs7cnjGSKVex
	x9CfIJ02kuumtQvUYHtjp9frzFYJgNjml47KeE6Q0W+fCHS6CFsR6O+a4Xmf+CWQ
	X4tsewoU9vl8VvUuziWEJGSDPPIsoBHNjjybgTxze72Z1hyq+OoUfU1Mspwuii8g
	3gEVc598nbqvVYx3wRgtlGiildOWTSXhKgcN30vTXQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 466000rv9q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 04:51:12 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53M4aXaC020853;
	Tue, 22 Apr 2025 04:51:11 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 466000rv9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 04:51:11 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53M3YglQ001563;
	Tue, 22 Apr 2025 04:51:11 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 464rck133m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 04:51:11 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53M4p7ZQ30606004
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 04:51:07 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 790155804B;
	Tue, 22 Apr 2025 04:51:09 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 60F4A58059;
	Tue, 22 Apr 2025 04:51:06 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.204.204.179])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 22 Apr 2025 04:51:06 +0000 (GMT)
From: Venkat <venkat88@linux.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH] powerpc/pseries/msi: Avoid reading PCI device registers
 in reduced power states
Message-Id: <3E89A76F-21AD-48BB-9333-1A43C04DB3B7@linux.ibm.com>
Date: Tue, 22 Apr 2025 10:20:53 +0530
Cc: christophe.leroy@csgroup.eu, LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
        Michael Ellerman <mpe@ellerman.id.au>, naveen@kernel.org,
        npiggin@gmail.com, vaibhav@linux.ibm.com, venkat88@linux.ibm.com
To: gautam@linux.ibm.com
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: z-4OhsSuDGxULhVEBR37XHiVRME4ggCf
X-Proofpoint-ORIG-GUID: P8eONft-5Cpo1zNG2YdXomlPyi-AFG9n
X-Authority-Analysis: v=2.4 cv=N6QpF39B c=1 sm=1 tr=0 ts=68072040 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=TGiKNIM0BPefvecU2IEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_02,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 mlxlogscore=249
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504220033
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Gautam,

Makes sense to track this observation separately. I tried it on fedora41 =
with kernel, 6.11.4-301.fc41.ppc64le, and this warning is there also.=20


Traces:

[  105.121663] ------------[ cut here ]------------
[  105.121664] WARNING: CPU: 0 PID: 16 at =
arch/powerpc/sysdev/xics/icp-hv.c:55 icp_hv_eoi+0xf8/0x120
[  105.121683] Modules linked in: bonding tls nft_fib_inet nft_fib_ipv4 =
nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 =
nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 =
nf_defrag_ipv4 rfkill nf_tables sunrpc ibmveth
[  105.121719] PM: suspend exit
[  105.121720]  pseries_rng vmx_crypto crct10dif_vpmsum fuse =
dm_multipath loop nfnetlink zram vsock_loopback =
vmw_vsock_virtio_transport_common vsock xfs ibmvscsi scsi_transport_srp =
crc32c_vpmsum scsi_dh_rdac scsi_dh_emc scsi_dh_alua
[  105.121790] CPU: 0 UID: 0 PID: 16 Comm: ksoftirqd/0 Not tainted =
6.11.4-301.fc41.ppc64le #1
[  105.121800] Hardware name: IBM,8375-42A POWER9 (architected) 0x4e0202 =
0xf000005 of:IBM,FW950.A0 (VL950_144) hv:phyp pSeries
[  105.121808] NIP:  c0000000000d5068 LR: c0000000000d5064 CTR: =
c00000000011d810
[  105.121811] REGS: c000000004c87a20 TRAP: 0700   Not tainted  =
(6.11.4-301.fc41.ppc64le)
[  105.121821] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 44004202  XER: 00000010
[  105.121845] CFAR: c000000000246c2c IRQMASK: 1=20
[  105.121845] GPR00: c0000000000d5064 c000000004c87cc0 c0000000021c0900 =
000000000000003f=20
[  105.121845] GPR04: 00000000ffffdfff 00000000ffffdfff c000000004c87ab8 =
00000007f8e50000=20
[  105.121845] GPR08: 0000000000000027 c0000007fc007190 0000000000000001 =
0000000044004202=20
[  105.121845] GPR12: c00000000011d810 c000000003f40000 c0000000001bf378 =
c000000004f07640=20
[  105.121845] GPR16: 0000000000000000 0000000004208040 c000000003d12a80 =
c000000003242e80=20
[  105.121845] GPR20: 00000000ffffb375 000000000000000a c0000000031b6980 =
c0000000002532f0=20
[  105.121845] GPR24: 0000000000000001 0000000000000000 0000000000000006 =
0000000000000002=20
[  105.121845] GPR28: c0000007fc006898 0000000000000000 00000000050a0002 =
00000000050a0002=20
[  105.121945] NIP [c0000000000d5068] icp_hv_eoi+0xf8/0x120
[  105.121953] LR [c0000000000d5064] icp_hv_eoi+0xf4/0x120
[  105.121961] Call Trace:
[  105.121965] [c000000004c87cc0] [c0000000000d5064] =
icp_hv_eoi+0xf4/0x120 (unreliable)
[  105.121976] [c000000004c87d40] [c000000000254eac] =
handle_fasteoi_irq+0x16c/0x350
[  105.121987] [c000000004c87d70] [c0000000002533b0] =
resend_irqs+0xc0/0x190
[  105.121997] [c000000004c87db0] [c00000000018b690] =
tasklet_action_common.isra.0+0x150/0x430
[  105.122007] [c000000004c87e20] [c00000000018aafc] =
handle_softirqs+0x17c/0x4f0
[  105.122017] [c000000004c87f10] [c00000000018aed8] =
run_ksoftirqd+0x68/0xb0
[  105.122025] [c000000004c87f30] [c0000000001ca460] =
smpboot_thread_fn+0x1e0/0x250
[  105.122036] [c000000004c87f90] [c0000000001bf4a4] kthread+0x134/0x140
[  105.122047] [c000000004c87fe0] [c00000000000ded8] =
start_kernel_thread+0x14/0x18
[  105.122056] Code: 48bc88c1 60000000 e9210068 4bffff9c 7c661b78 =
3c82ff40 3c62ff85 7fc5f378 3884ca50 38637628 48171b85 60000000 =
<0fe00000> 38210080 7be34622 e8010010=20
[  105.122094] ---[ end trace 0000000000000000 ]=E2=80=94


Regards,
Venkat.=

