Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B67E13A0C4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 06:49:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xffw1KXxzDqNv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 16:49:44 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xfdC35M3zDqD2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 16:48:14 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00E5lZP1125933; Tue, 14 Jan 2020 00:48:01 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xfvjfk7yk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jan 2020 00:48:01 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 00E5m16B127552;
 Tue, 14 Jan 2020 00:48:01 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xfvjfk7y9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jan 2020 00:48:01 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00E5kEwq006242;
 Tue, 14 Jan 2020 05:48:00 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma05wdc.us.ibm.com with ESMTP id 2xf755gut9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jan 2020 05:48:00 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00E5lxu124772898
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jan 2020 05:47:59 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60D51C6057;
 Tue, 14 Jan 2020 05:47:59 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45600C6055;
 Tue, 14 Jan 2020 05:47:56 +0000 (GMT)
Received: from [9.85.73.158] (unknown [9.85.73.158])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 14 Jan 2020 05:47:55 +0000 (GMT)
Message-ID: <1578980874.11996.3.camel@abdul.in.ibm.com>
Subject: Re: [linux-next/mainline][bisected 3acac06][ppc] Oops when
 unloading mpt3sas driver
From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
To: Christoph Hellwig <hch@infradead.org>
Date: Tue, 14 Jan 2020 11:17:54 +0530
In-Reply-To: <20200109142218.GA16477@infradead.org>
References: <1578489498.29952.11.camel@abdul>
 <1578560245.30409.0.camel@abdul.in.ibm.com>
 <20200109142218.GA16477@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-14_01:2020-01-13,
 2020-01-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=2
 impostorscore=0 malwarescore=0 mlxlogscore=759 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001140051
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
 linux-scsi <linux-scsi@vger.kernel.org>,
 manvanth <manvanth@linux.vnet.ibm.com>, jcmvbkbc@gmail.com,
 linux-next <linux-next@vger.kernel.org>, Oliver <oohall@gmail.com>,
 "aneesh.kumar" <aneesh.kumar@linux.vnet.ibm.com>,
 Brian King <brking@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-01-09 at 06:22 -0800, Christoph Hellwig wrote:
> On Thu, Jan 09, 2020 at 02:27:25PM +0530, Abdul Haleem wrote:
> > + CC Christoph Hellwig
> 
> The only thing this commit changed for the dma coherent case (which
> ppc64 uses) is that we now look up the page to free by the DMA address
> instead of the virtual address passed in.  Which suggests this call
> stack passes in a broken dma address.  I suspect we somehow managed
> to disable the ppc iommu bypass mode after allocating memory, which
> would cause symptoms like this, and thus the commit is just exposing
> a pre-existing problem.

Trace with printk added for page->addr, will this help ?

mpt3sas_cm0: removing handle(0x000f), sas_addr(0x500304801f080d3d)
mpt3sas_cm0: enclosure logical id(0x500304801f080d3f), slot(12)
mpt3sas_cm0: enclosure level(0x0000), connector name(     )
mpt3sas_cm0: mpt3sas_transport_port_remove: removed:
sas_addr(0x500304801f080d3f)
mpt3sas_cm0: expander_remove: handle(0x0009),
sas_addr(0x500304801f080d3f)
mpt3sas_cm0: sending diag reset !!
mpt3sas_cm0: diag reset: SUCCESS 
page->vaddr = 0xc000003f2d200000
page->vaddr = 0xc000003f2ef00000
page->vaddr = 0xc000003f38430000
page->vaddr = 0xc000003f3d7d0000
page->vaddr = 0xc000003f75760000
BUG: Unable to handle kernel data access on write at 0xc04a000000017c34
Faulting instruction address: 0xc0000000002fb2b0
Oops: Kernel access of bad area, sig: 11 [#1]
LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA PowerNV
Modules linked in: iptable_mangle xt_MASQUERADE iptable_nat nf_nat
xt_conntrack nf_conntrack nf_defrag_ipv4 ipt_REJECT nf_reject_ipv4
xt_tcpudp tun bridge stp llc btrfs blake2b_generic xor zstd_decompress
zstd_compress lzo_compress iptable_filter raid6_pq mpt3sas(-) vmx_crypto
gf128mul nfsd powernv_rng rng_core raid_class scsi_transport_sas kvm_hv
kvm binfmt_misc ip_tables x_tables xfs libcrc32c qla2xxx ixgbe i40e
nvme_fc nvme_fabrics mdio nvme_core autofs4
CPU: 13 PID: 17267 Comm: rmmod Not tainted 5.5.0-rc5-next-20200108-autotest-00002-g36e1367-dirty #1
NIP:  c0000000002fb2b0 LR: c0000000001aa5b4 CTR: c00000000004a010
REGS: c000003fc3f9f5d0 TRAP: 0380   Not tainted  (5.5.0-rc5-next-20200108-autotest-00002-g36e1367-dirty)
MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 22002424  XER: 20000000  
CFAR: c0000000001aa5b0 IRQMASK: 0 
GPR00: c00000000004a0a8 c000003fc3f9f860 c000000001311300 c04a000000017c00 
GPR04: 0000000000000000 c000003f75760000 003e000000017c00 0000000000000000 
GPR08: 0000000000000000 c0000000013bd000 c04a000000017c34 00000000000005bf 
GPR12: c00000000004a010 c000003fffff4a80 0000000000000000 0000000000000000 
GPR16: 0000000000000000 0000000000000000 000001001b4e0180 0000000010020098 
GPR20: 0000000010020050 0000000010020038 0000000010020078 0000000005f00000 
GPR24: c000000000d4e8a8 c000000000d4e8c8 0000000005f00000 0000000000000000 
GPR28: c000000001299398 c000003f75760000 0000000000010000 c000003fdde0d0a8 
NIP [c0000000002fb2b0] __free_pages+0x10/0x50
LR [c0000000001aa5b4] dma_direct_free_pages+0x54/0x90
Call Trace:
[c000003fc3f9f860] [c000000000d4e8a8] str_spec.72296+0x199114/0x2009cc (unreliable)
[c000003fc3f9f880] [c00000000004a0a8] dma_iommu_free_coherent+0x98/0xd0
[c000003fc3f9f8d0] [c0000000001a95e8] dma_free_attrs+0xf8/0x100
[c000003fc3f9f920] [c00000000031205c] dma_pool_destroy+0x19c/0x230
[c000003fc3f9f9d0] [c00800001c181e98] _base_release_memory_pools+0x1d8/0x4b0 [mpt3sas]
[c000003fc3f9fa60] [c00800001c18b9f0] mpt3sas_base_detach+0x40/0x150 [mpt3sas]
[c000003fc3f9fad0] [c00800001c19c92c] scsih_remove+0x24c/0x3e0 [mpt3sas]
[c000003fc3f9fb90] [c0000000006126a4] pci_device_remove+0x64/0x110
[c000003fc3f9fbd0] [c0000000006c7ea4] device_release_driver_internal+0x154/0x260
[c000003fc3f9fc10] [c0000000006c807c] driver_detach+0x8c/0x140
[c000003fc3f9fc50] [c0000000006c6188] bus_remove_driver+0x78/0x100
[c000003fc3f9fc80] [c0000000006c8d90] driver_unregister+0x40/0x90
[c000003fc3f9fcf0] [c000000000611dc8] pci_unregister_driver+0x38/0x110
[c000003fc3f9fd40] [c00800001c1af108] _mpt3sas_exit+0x50/0x40c8 [mpt3sas]
[c000003fc3f9fda0] [c0000000001d8ed8] sys_delete_module+0x1a8/0x2a0
[c000003fc3f9fe20] [c00000000000b9d0] system_call+0x5c/0x68
Instruction dump:
88830051 2fa40000 41de0008 4bffe87c 7d234b78 4bfffe94 60000000 60420000 
3c4c0101 38426060 39430034 7c0004ac <7d005028> 3108ffff 7d00512d 40c2fff4 
---[ end trace c5ab52378eb942ad ]---
Segmentation fault

-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre



