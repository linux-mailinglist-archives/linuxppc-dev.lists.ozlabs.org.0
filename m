Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C70135504
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 09:59:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tg682gstzDqY2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 19:59:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=abdhalee@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tg4P23sjzDqXb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2020 19:57:56 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0098veCZ078727; Thu, 9 Jan 2020 03:57:43 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xe0sk0ca7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2020 03:57:42 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0098vfJ0078821;
 Thu, 9 Jan 2020 03:57:41 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xe0sk0c6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2020 03:57:41 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0098vO1g008358;
 Thu, 9 Jan 2020 08:57:29 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 2xajb7exgr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2020 08:57:29 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0098vT4I47120646
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jan 2020 08:57:29 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19E222805C;
 Thu,  9 Jan 2020 08:57:29 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C5A028059;
 Thu,  9 Jan 2020 08:57:26 +0000 (GMT)
Received: from [9.124.35.18] (unknown [9.124.35.18])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  9 Jan 2020 08:57:26 +0000 (GMT)
Message-ID: <1578560245.30409.0.camel@abdul.in.ibm.com>
Subject: Re: [linux-next/mainline][bisected 3acac06][ppc] Oops when
 unloading mpt3sas driver
From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Date: Thu, 09 Jan 2020 14:27:25 +0530
In-Reply-To: <1578489498.29952.11.camel@abdul>
References: <1578489498.29952.11.camel@abdul>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-09_02:2020-01-08,
 2020-01-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 clxscore=1011 phishscore=0 adultscore=0 mlxlogscore=723 impostorscore=0
 spamscore=0 suspectscore=2 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-2001090078
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
Cc: sachinp <sachinp@linux.vnet.ibm.com>,
 linux-scsi <linux-scsi@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 jcmvbkbc@gmail.com, linux-next <linux-next@vger.kernel.org>,
 Oliver <oohall@gmail.com>, "aneesh.kumar" <aneesh.kumar@linux.vnet.ibm.com>,
 Brian King <brking@linux.vnet.ibm.com>, manvanth <manvanth@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+ CC Christoph Hellwig

On Wed, 2020-01-08 at 18:48 +0530, Abdul Haleem wrote:
> Greeting's 
> 
> Kernel Oops on my powerpc system when unloading driver mpt3sas.
> 
> Thanks Oliver for bisecting it to commit 3acac06 ("dma-mapping: merge
> the generic remapping helpers into dma-direct")
> 
> Christoph, could you please have a look
> 
> Kernel version : latest mainline and next kernel
> System : powerpc bare-metal
> config: attached kernel config
> test: rmmod mpt3sas
> 
> trace:
> kernel: mpt3sas_cm0: enclosure logical id(0x500304801f080d3f), slot(12)
> kernel: mpt3sas_cm0: enclosure level(0x0000), connector name(     )
> kernel: mpt3sas_cm0: expander_remove: handle(0x0009),
> sas_addr(0x500304801f080d3f)
> kernel: mpt3sas_cm0: sending diag reset !!
> kernel: mpt3sas_cm0: diag reset: SUCCESS
> kernel: BUG: Unable to handle kernel data access on write at
> 0xc04a000000017c34
> kernel: Faulting instruction address: 0xc0000000002f9c70
> kernel: Oops: Kernel access of bad area, sig: 11 [#1]
> kernel: LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA PowerNV
> kernel: Dumping ftrace buffer:
> kernel:   (ftrace buffer empty)
> kernel: Modules linked in: ixgbe i40e iptable_mangle xt_MASQUERADE
> iptable_nat nf_nat xt_conntrack nf_conntrack nf_defrag_ipv4 ipt_REJECT
> nf_reject_ipv4 xt_tcpudp tun bridge stp llc iptable_filter btrfs
> blake2b_generic xor zstd_decompress zstd_compress lzo_compress
> vmx_crypto gf128mul raid6_pq powernv_rng rng_core kvm_hv kvm nfsd
> binfmt_misc ip_tables x_tables autofs4 xfs libcrc32c qla2xxx nvme_fc
> nvme_fabrics mdio nvme_core mpt3sas(-) raid_class scsi_transport_sas
> [last unloaded: ixgbe]
> kernel: CPU: 61 PID: 138496 Comm: rmmod Not tainted 5.5.0-rc3-autotest-autotest #1
> kernel: NIP:  c0000000002f9c70 LR: c0000000001a9b44 CTR: c000000000049ef0
> kernel: REGS: c000003f225af5e0 TRAP: 0380   Not tainted  (5.5.0-rc3-autotest-autotest)
> kernel: MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24002424  XER: 20000000
> kernel: CFAR: c0000000001a9b40 IRQMASK: 0 #012GPR00: c000000000049f88
> c000003f225af870 c0000000012fc900 c04a000000017c00 #012GPR04:
> 0000000000000000 c000003fbbe70000 003e000000017c00 0000000000000000
> #012GPR08: 0000000000000000 c0000000013ad000 c04a000000017c34
> c00800000fbbe9e0 #012GPR12: c000000000049ef0 c000003ffffcaa80
> 0000000000000000 0000000000000000 #012GPR16: 0000000000000000
> 0000000000000000 0000010029f601e0 0000000010020098 #012GPR20:
> 0000000010020050 0000000010020038 0000000010020078 00000000100200b0
> #012GPR24: 0000000000000000 c000000000d4c2f8 0000000005f00000
> 0000000000000000 #012GPR28: c00000000126e038 c000003fbbe70000
> 0000000000010000 c000003fdd22d0a8 
> kernel: NIP [c0000000002f9c70] __free_pages+0x10/0x50
> kernel: LR [c0000000001a9b44] dma_direct_free_pages+0x54/0x90
> kernel: Call Trace:
> kernel: [c000003f225af870] [c0000000001a9b44] dma_direct_free_pages+0x54/0x90 (unreliable)
> kernel: [c000003f225af890] [c000000000049f88] dma_iommu_free_coherent+0x98/0xd0
> kernel: [c000003f225af8e0] [c0000000001a8b78] dma_free_attrs+0xf8/0x100
> kernel: [c000003f225af930] [c000000000310af4] dma_pool_destroy+0x174/0x200
> kernel: [c000003f225af9d0] [c00800000fb917b8] _base_release_memory_pools+0x1d8/0x620 [mpt3sas]
> kernel: [c000003f225afa60] [c00800000fb9b3b0] mpt3sas_base_detach+0x40/0x150 [mpt3sas]
> kernel: [c000003f225afad0] [c00800000fbabdfc] _scsih_flush_running_cmds+0x5bc/0x1140 [mpt3sas]
> kernel: [c000003f225afb90] [c00000000060eda4] pci_device_remove+0x64/0x110
> kernel: [c000003f225afbd0] [c0000000006c4c44] device_release_driver_internal+0x154/0x260
> kernel: [c000003f225afc10] [c0000000006c4e1c] driver_detach+0x8c/0x140
> kernel: [c000003f225afc50] [c0000000006c2f28] bus_remove_driver+0x78/0x100
> kernel: [c000003f225afc80] [c0000000006c5b30] driver_unregister+0x40/0x90
> kernel: [c000003f225afcf0] [c00000000060e4c8] pci_unregister_driver+0x38/0x110
> kernel: [c000003f225afd40] [c00800000fbbe338] cleanup_module+0x50/0x3fd8 [mpt3sas]
> kernel: [c000003f225afda0] [c0000000001d866c] sys_delete_module+0x1dc/0x2a0
> kernel: [c000003f225afe20] [c00000000000b9d0] system_call+0x5c/0x68
> kernel: Instruction dump:
> kernel: 88830051 2fa40000 41de0008 4bffe86c 7d234b78 4bfffe94 60000000 60420000
> kernel: 3c4c0100 38422ca0 39430034 7c0004ac <7d005028> 3108ffff 7d00512d 40c2fff4
> kernel: ---[ end trace ef72317ef11520bc ]---
> kernel:
> kernel: qla2xxx [0020:04:00.1]-b079:20: Removing driver
> kernel: qla2xxx [0020:04:00.1]-00af:20: Performing ISP error recovery - ha=00000000ec46524c.
> kernel: qla2xxx [0020:04:00.0]-b079:19: Removing driver
> kernel: qla2xxx [0020:04:00.0]-00af:19: Performing ISP error recovery - ha=00000000af37b975.
> kernel: qla2xxx [0020:03:00.1]-b079:18: Removing driver
> 


-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre



