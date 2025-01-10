Return-Path: <linuxppc-dev+bounces-4974-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4696A092AA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 14:56:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV3900Gz5z3cCt;
	Sat, 11 Jan 2025 00:56:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736517379;
	cv=none; b=JIrlNii9KNC/IN7F5SypcEJntlQBgmO9S9DevXYigFwvpdTxHVVBH6PJqNvO9q5UWrnJMGChUo+uso/l3P3nEIPOnU435M7y5ahDIo0h1nng7XXPXyndJrlTsgvN2JMh5NCkwNQBif1BMIdoaw7mgdC1Db9uCPKJdXeMQfm1LTK6EZJ4l1yKZMNavhdKA0AXkrWQEpMNtazcpfaEr6Bgn6HhRgBMJ1myqHfupXY1Nzm0xLxKt7xTKGU7I9rwtxF/3q0boBSR2R5KNYb2y6LbstbFFR6j/lo66HJZFv+u4AfI3Kw+2hNMm+Pb3/mlf2Q1RjFUbttnh/Shs9yLMZagZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736517379; c=relaxed/relaxed;
	bh=NoMrBm3VEXgh0CyVC+9K7hpPhvK7yQo2dqbuMGa56hw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=geZ0c1MAJx1hUdGsOZXHPmU+1kDychxD4zJWuJjbYYF6ClNI015qIScVUUN2OI+FxMwvOjaveQJLoMGrNslnS7z8/ovhLLrjVzEFJeAIHR32OddyUf3te3lypKR3sUfPblCx9LxAiw6XyBC6P10cQlkSGI4mlBdmRBdKPRboOsBLNyVaPsarNPu/EnoS/BFOVcCPLEyvmBdM7TT54VtYk6SrTrk9hEkWnaBVsgTOUCVQ0WEVMUGpvSub3LDtGk7SnPA/v8dhtHkrXukOz0SKHMIwzP95JmAhtXrvt/apMaml3Gfs3HmkhuhumYZXbX7ECfaQ29AcBgqiiYPkQk+IfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yh9e1NjN; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yh9e1NjN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV38y3Ltbz3cCC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 00:56:17 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ADBdxB010531;
	Fri, 10 Jan 2025 13:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=NoMrBm
	3VEXgh0CyVC+9K7hpPhvK7yQo2dqbuMGa56hw=; b=Yh9e1NjN+XhPxjBLFqL+GK
	MXfWReCortAn09tLnyJ/T3M3ZEIrt7UTDcXnDQgskL9wFwxRqnNznx3I6XUctSGu
	BVYsC8asvrjny6urjw7sXxVU8f1ybvwS6QqpInEaothYz/E33jQr5XuGej/AiWa6
	8GkwEJf7ezv2s6PT7iZGqDNw7cHcCa2Y5ulkqEnkZEJ2zAidxa43jREGPJzcs9em
	IDdrbI79oMCbEyCyB2rxMSViUYiI0QsoPjmH3UXRSzmwC9FygMeutzW2XamaRDZt
	H/NCyqF+0RgnL23UhBjx3jb9qzj7lTrsjnn/obW2u7sc6JSW469o/OtVBohpD3NA
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 442fx5d4ww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 13:56:07 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50AA40a1015795;
	Fri, 10 Jan 2025 13:56:06 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43ygtmadf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 13:56:06 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50ADu5rc18809536
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 13:56:05 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B86658067;
	Fri, 10 Jan 2025 13:56:05 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E8EC5805B;
	Fri, 10 Jan 2025 13:56:04 +0000 (GMT)
Received: from [9.171.75.200] (unknown [9.171.75.200])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Jan 2025 13:56:04 +0000 (GMT)
Message-ID: <d5a174ff-d84c-477a-a5df-be88b2502d42@linux.ibm.com>
Date: Fri, 10 Jan 2025 19:26:02 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/pseries/iommu: IOMMU incorrectly marks MMIO range
 in DDW
To: Gaurav Batra <gbatra@linux.ibm.com>, mpe@ellerman.id.au
Cc: linuxppc-dev@lists.ozlabs.org
References: <20241206210039.93172-1-gbatra@linux.ibm.com>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <20241206210039.93172-1-gbatra@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5vI3Bljl9p9cibFEyVC8NRexZyPxNYtw
X-Proofpoint-ORIG-GUID: 5vI3Bljl9p9cibFEyVC8NRexZyPxNYtw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501100106
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 12/7/24 2:30 AM, Gaurav Batra wrote:
> Power Hypervisor can possibily allocate MMIO window intersecting with
> Dynamic DMA Window (DDW) range, which is over 32-bit addressing.
> 
> These MMIO pages needs to be marked as reserved so that IOMMU doesn't map
> DMA buffers in this range.
> 
> The current code is not marking these pages correctly which is resulting
> in LPAR to OOPS while booting. The stack is at below
> 
> BUG: Unable to handle kernel data access on read at 0xc00800005cd40000
> Faulting instruction address: 0xc00000000005cdac
> Oops: Kernel access of bad area, sig: 11 [#1]
> LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> Modules linked in: af_packet rfkill ibmveth(X) lpfc(+) nvmet_fc nvmet nvme_keyring crct10dif_vpmsum nvme_fc nvme_fabrics nvme_core be2net(+) nvme_auth rtc_generic nfsd auth_rpcgss nfs_acl lockd grace sunrpc fuse configfs ip_tables x_tables xfs libcrc32c dm_service_time ibmvfc(X) scsi_transport_fc vmx_crypto gf128mul crc32c_vpmsum dm_mirror dm_region_hash dm_log dm_multipath dm_mod sd_mod scsi_dh_emc scsi_dh_rdac scsi_dh_alua t10_pi crc64_rocksoft_generic crc64_rocksoft sg crc64 scsi_mod
> Supported: Yes, External
> CPU: 8 PID: 241 Comm: kworker/8:1 Kdump: loaded Not tainted 6.4.0-150600.23.14-default #1 SLE15-SP6 b44ee71c81261b9e4bab5e0cde1f2ed891d5359b
> Hardware name: IBM,9080-M9S POWER9 (raw) 0x4e2103 0xf000005 of:IBM,FW950.B0 (VH950_149) hv:phyp pSeries
> Workqueue: events work_for_cpu_fn
> NIP:  c00000000005cdac LR: c00000000005e830 CTR: 0000000000000000
> REGS: c00001400c9ff770 TRAP: 0300   Not tainted  (6.4.0-150600.23.14-default)
> MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24228448  XER: 00000001
> CFAR: c00000000005cdd4 DAR: c00800005cd40000 DSISR: 40000000 IRQMASK: 0
> GPR00: c00000000005e830 c00001400c9ffa10 c000000001987d00 c00001400c4fe800
> GPR04: 0000080000000000 0000000000000001 0000000004000000 0000000000800000
> GPR08: 0000000004000000 0000000000000001 c00800005cd40000 ffffffffffffffff
> GPR12: 0000000084228882 c00000000a4c4f00 0000000000000010 0000080000000000
> GPR16: c00001400c4fe800 0000000004000000 0800000000000000 c00000006088b800
> GPR20: c00001401a7be980 c00001400eff3800 c000000002a2da68 000000000000002b
> GPR24: c0000000026793a8 c000000002679368 000000000000002a c0000000026793c8
> GPR28: 000008007effffff 0000080000000000 0000000000800000 c00001400c4fe800
> NIP [c00000000005cdac] iommu_table_reserve_pages+0xac/0x100
> LR [c00000000005e830] iommu_init_table+0x80/0x1e0
> Call Trace:
> [c00001400c9ffa10] [c00000000005e810] iommu_init_table+0x60/0x1e0 (unreliable)
> [c00001400c9ffa90] [c00000000010356c] iommu_bypass_supported_pSeriesLP+0x9cc/0xe40
> [c00001400c9ffc30] [c00000000005c300] dma_iommu_dma_supported+0xf0/0x230
> [c00001400c9ffcb0] [c00000000024b0c4] dma_supported+0x44/0x90
> [c00001400c9ffcd0] [c00000000024b14c] dma_set_mask+0x3c/0x80
> [c00001400c9ffd00] [c0080000555b715c] be_probe+0xc4/0xb90 [be2net]
> [c00001400c9ffdc0] [c000000000986f3c] local_pci_probe+0x6c/0x110
> [c00001400c9ffe40] [c000000000188f28] work_for_cpu_fn+0x38/0x60
> [c00001400c9ffe70] [c00000000018e454] process_one_work+0x314/0x620
> [c00001400c9fff10] [c00000000018f280] worker_thread+0x2b0/0x620
> [c00001400c9fff90] [c00000000019bb18] kthread+0x148/0x150
> [c00001400c9fffe0] [c00000000000ded8] start_kernel_thread+0x14/0x18
> 
> There are 2 issues in the code
> 
> 1. The index is "int" while the address is "unsigned long". This results in
>    negative value when setting the bitmap.
> 
> 2. The DMA offset is page shifted but the MMIO range is used as-is (64-bit
>    address). MMIO address needs to be page shifted as well.
> 
> Fixes: 3c33066a2190 ("powerpc/kernel/iommu: Add new iommu_table_in_use() helper")
> 
> Signed-off-by: Gaurav Batra <gbatra@linux.ibm.com>

Looks good to me:

Reviewed-by: Nilay Shroff <nilay@linux.ibm.com>



