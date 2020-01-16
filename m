Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4468313D476
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 07:44:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yvmt5bXHzDqX3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 17:44:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yvkn28k4zDqRK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 17:42:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=rZHWYGd4; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47yvkm21R7z9sNx;
 Thu, 16 Jan 2020 17:42:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579156944;
 bh=jGM/CA3ogVM7Lr0fo9k6o/pd3NvxUAI1LpN455WTxNk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=rZHWYGd4nrpfpszgxVZsNCaGEWFDD9uV3qxIILaTPl7qFDhMrN90ooJpqgdvysWBx
 0MRpbCxzwA3sArn592vEaqokSQFqnfP4OaErqA3MPMimKlsZgt8kC2fKFJ9NkuBV7Q
 dZloiNC19I6T1D8skkNtYLkIoHAYJStDuOpxsbd823Vo1rE9204ApXf5NLrEoRSZaC
 gLMRGLTwbwPSZNN4X0pt9xuWOtRnvFy/QbWX6Q8YOeKL2A7Kl6DIeEPjdMmMHJBbEj
 eKeE9Vbo4KD2/oxpqhF8kso9QW4ynL+3WjZGZmwpOhdesIP9riPWBMlKINAgFNoNJk
 Uh2B2iA2cshlA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 Christoph Hellwig <hch@infradead.org>
Subject: Re: [linux-next/mainline][bisected 3acac06][ppc] Oops when unloading
 mpt3sas driver
In-Reply-To: <1578980874.11996.3.camel@abdul.in.ibm.com>
References: <1578489498.29952.11.camel@abdul>
 <1578560245.30409.0.camel@abdul.in.ibm.com>
 <20200109142218.GA16477@infradead.org>
 <1578980874.11996.3.camel@abdul.in.ibm.com>
Date: Thu, 16 Jan 2020 16:42:30 +1000
Message-ID: <87tv4v9a21.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, jcmvbkbc@gmail.com,
 linux-next <linux-next@vger.kernel.org>, Oliver <oohall@gmail.com>,
 "aneesh.kumar" <aneesh.kumar@linux.vnet.ibm.com>,
 Brian King <brking@linux.vnet.ibm.com>, manvanth <manvanth@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Abdul Haleem <abdhalee@linux.vnet.ibm.com> writes:
> On Thu, 2020-01-09 at 06:22 -0800, Christoph Hellwig wrote:
>> On Thu, Jan 09, 2020 at 02:27:25PM +0530, Abdul Haleem wrote:
>> > + CC Christoph Hellwig
>> 
>> The only thing this commit changed for the dma coherent case (which
>> ppc64 uses) is that we now look up the page to free by the DMA address
>> instead of the virtual address passed in.  Which suggests this call
>> stack passes in a broken dma address.  I suspect we somehow managed
>> to disable the ppc iommu bypass mode after allocating memory, which
>> would cause symptoms like this, and thus the commit is just exposing
>> a pre-existing problem.
>
> Trace with printk added for page->addr, will this help ?
>
> mpt3sas_cm0: removing handle(0x000f), sas_addr(0x500304801f080d3d)
> mpt3sas_cm0: enclosure logical id(0x500304801f080d3f), slot(12)
> mpt3sas_cm0: enclosure level(0x0000), connector name(     )
> mpt3sas_cm0: mpt3sas_transport_port_remove: removed:
> sas_addr(0x500304801f080d3f)
> mpt3sas_cm0: expander_remove: handle(0x0009),
> sas_addr(0x500304801f080d3f)
> mpt3sas_cm0: sending diag reset !!
> mpt3sas_cm0: diag reset: SUCCESS 
> page->vaddr = 0xc000003f2d200000
> page->vaddr = 0xc000003f2ef00000
> page->vaddr = 0xc000003f38430000
> page->vaddr = 0xc000003f3d7d0000
> page->vaddr = 0xc000003f75760000
> BUG: Unable to handle kernel data access on write at 0xc04a000000017c34

We also want the dma address, Abdul did another run resulting in:

  mpt3sas_cm0: mpt3sas_transport_port_remove: removed: sas_addr(0x500304801f080d3f)
  mpt3sas_cm0: expander_remove: handle(0x0009), sas_addr(0x500304801f080d3f)
  mpt3sas_cm0: sending diag reset !!
  mpt3sas_cm0: diag reset: SUCCESS
  page->vaddr = 0xc000003fc5880000
  page->dma = 0x800003fc5880000
  page->vaddr = 0xc000003fc5900000
  page->dma = 0x800003fc5900000
  page->vaddr = 0xc000003fc5980000
  page->dma = 0x800003fc5980000
  page->vaddr = 0xc000003fc5990000
  page->dma = 0x800003fc5990000
  page->vaddr = 0xc000003fc7c70000
  page->dma = 0x5f00000
  BUG: Unable to handle kernel data access on write at 0xc04a000000017c34
  Faulting instruction address: 0xc000000000300780
  Oops: Kernel access of bad area, sig: 11 [#1]
  LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 DEBUG_PAGEALLOC NUMA PowerNV
  Modules linked in: iptable_mangle xt_MASQUERADE iptable_nat nf_nat xt_conntrack nf_conntrack nf_defrag_ipv4 ipt_REJECT nf_reject_ipv4 xt_tcpudp tun bridge stp llc iptable_filter btrfs blake2b_generic xor zstd_decompress zstd_compress lzo_compress raid6_pq vmx_crypto gf128mul powernv_rng rng_core kvm_hv nfsd kvm binfmt_misc ip_tables x_tables xfs libcrc32c qla2xxx ixgbe nvme_fc nvme_fabrics mdio nvme_core i40e mpt3sas(-) raid_class scsi_transport_sas autofs4
  CPU: 149 PID: 17518 Comm: rmmod Not tainted 5.5.0-rc5-next-20200108-autotest-00002-g36e1367-dirty #2
  NIP:  c000000000300780 LR: c0000000001aabe4 CTR: c00000000004a030
  REGS: c0000078ffab75d0 TRAP: 0380   Not tainted  (5.5.0-rc5-next-20200108-autotest-00002-g36e1367-dirty)
  MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24002424  XER: 20000000
  CFAR: c0000000001aabe0 IRQMASK: 0
  GPR00: c00000000004a0c8 c0000078ffab7860 c000000001321a00 c04a000000017c00
  GPR04: 0000000000000000 c000003fc7c70000 003e000000017c00 0000000000000000
  GPR08: 0000000000000000 c0000000013cd000 c04a000000017c34 0000000000000230
  GPR12: c00000000004a030 c000007ffef35000 0000000000000000 0000000000000000
  GPR16: 0000000000000000 0000000000000000 00000100140c0180 0000000010020098
  GPR20: 0000000010020050 0000000010020038 0000000005f00000 c000000000d60870
  GPR24: c000000000d60890 c000000000d608a8 0000000000000000 c0000000012a9818
  GPR28: 0000000005f00000 c000003fc7c70000 0000000000010000 c000003fdaa4c8a8
  NIP [c000000000300780] __free_pages+0x10/0x50
  LR [c0000000001aabe4] dma_direct_free_pages+0x54/0x90
  Call Trace:
  [c0000078ffab7880] [c00000000004a0c8] dma_iommu_free_coherent+0x98/0xd0
  [c0000078ffab78d0] [c0000000001a9c10] dma_free_attrs+0x110/0x120
  [c0000078ffab7920] [c000000000317750] dma_pool_destroy+0x1d0/0x270
  [c0000078ffab79d0] [c00800000dc51e98] _base_release_memory_pools+0x1d8/0x4b0 [mpt3sas]
  [c0000078ffab7a60] [c00800000dc5b9f0] mpt3sas_base_detach+0x40/0x150 [mpt3sas]
  [c0000078ffab7ad0] [c00800000dc6c92c] scsih_remove+0x24c/0x3e0 [mpt3sas]
  [c0000078ffab7b90] [c0000000006199a4] pci_device_remove+0x64/0x110
  [c0000078ffab7bd0] [c0000000006cf1a4] device_release_driver_internal+0x154/0x260
  [c0000078ffab7c10] [c0000000006cf37c] driver_detach+0x8c/0x140
  [c0000078ffab7c50] [c0000000006cd488] bus_remove_driver+0x78/0x100
  [c0000078ffab7c80] [c0000000006d0090] driver_unregister+0x40/0x90
  [c0000078ffab7cf0] [c0000000006190c8] pci_unregister_driver+0x38/0x110
  [c0000078ffab7d40] [c00800000dc7f188] _mpt3sas_exit+0x50/0x4118 [mpt3sas]
  [c0000078ffab7da0] [c0000000001dda18] sys_delete_module+0x1a8/0x2a0
  [c0000078ffab7e20] [c00000000000b9d0] system_call+0x5c/0x68
  Instruction dump:
  88830051 2fa40000 41de0008 4bffe7fc 7d234b78 4bfffe94 60000000 60420000
  3c4c0102 38421290 39430034 7c0004ac <7d005028> 3108ffff 7d00512d 40c2fff4
  ---[ end trace b8cbc679eff3dfcc ]---
  Segmentation fault


cheers
