Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0A98549B2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 13:54:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XE2pPkt3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZdRv6Qh7z3dXh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 23:54:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XE2pPkt3;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZdR94hVQz30h8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 23:53:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1707915205;
	bh=2yGYnjksCOnTrmVt4RdgHftQySQabm4BEhRKLQZMYvw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XE2pPkt3SjW8DtGmMvWJGhlsNBiE4/O11nAWaHS4X4tOUavECaHl3WodQ6RZ02WrI
	 almV87Vjd3dekGxaIEk1nq2vrEFBC2fwJlTQC/NPMmv0sAH/9z39AzF6g5JkxVx15l
	 4FN5phMtb9ZgcugZSS2XWi1jNOejnfyLXMLHdYCK63VX6KVnD6nU9JaU6EscAzSUN7
	 Ys+WtcnU4s1YvhKkoHxFUey4JGkmQX3rrPk7lI9QULOLTewhWjgb2c3Cc2zl/lb8UM
	 PsMeR4O6sjG9HMH7rLAzoW0HSRxfrXXLAbJi30sBWqLW1D9qwqc4uVEgsFAZ4R7U3q
	 LXiQPCup57nYg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TZdR636lbz4wcp;
	Wed, 14 Feb 2024 23:53:22 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>, Jason Gunthorpe
 <jgg@ziepe.ca>, Shivaprasad G Bhat <sbhat@linux.ibm.com>
Subject: Re: [PATCH] powerpc/iommu: Fix the missing iommu_group_put() during
 platform domain attach
In-Reply-To: <4f5e638d-30a2-4207-b515-d07c20b0fb47@linux.vnet.ibm.com>
References: <170784021983.6249.10039296655906636112.stgit@linux.ibm.com>
 <20240213172128.GM765010@ziepe.ca>
 <4f5e638d-30a2-4207-b515-d07c20b0fb47@linux.vnet.ibm.com>
Date: Wed, 14 Feb 2024 23:53:20 +1100
Message-ID: <87le7n6wcf.fsf@mail.lhotse>
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
Cc: jroedel@suse.de, gbatra@linux.vnet.ibm.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, tpearson@raptorengineering.com, iommu@lists.linux.dev, npiggin@gmail.com, bgray@linux.ibm.com, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, aik@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com> writes:
> Thanks for the patch. Applied this patch and verified and issue is fixed.
>
> This issue way originally reported in the below mail.
>
> https://marc.info/?l=linux-kernel&m=170737160630106&w=2

Please use lore for links, in this case:

https://lore.kernel.org/all/274e0d2b-b5cc-475e-94e6-8427e88e271d@linux.vnet.ibm.com/

cheers

> On 13/02/24 10:51 pm, Jason Gunthorpe wrote:
>> On Tue, Feb 13, 2024 at 10:05:22AM -0600, Shivaprasad G Bhat wrote:
>>> The function spapr_tce_platform_iommu_attach_dev() is missing to call
>>> iommu_group_put() when the domain is already set. This refcount leak
>>> shows up with BUG_ON() during DLPAR remove operation as,
>>>
>>>    KernelBug: Kernel bug in state 'None': kernel BUG at arch/powerpc/platforms/pseries/iommu.c:100!
>>>    Oops: Exception in kernel mode, sig: 5 [#1]
>>>    LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=8192 NUMA pSeries
>>>    <snip>
>>>    Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1060.00 (NH1060_016) hv:phyp pSeries
>>>    NIP:  c0000000000ff4d4 LR: c0000000000ff4cc CTR: 0000000000000000
>>>    REGS: c0000013aed5f840 TRAP: 0700   Tainted: G          I         (6.8.0-rc3-autotest-g99bd3cb0d12e)
>>>    MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 44002402  XER: 20040000
>>>    CFAR: c000000000a0d170 IRQMASK: 0
>>>    GPR00: c0000000000ff4cc c0000013aed5fae0 c000000001512700 c0000013aa362138
>>>    GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000119c8afd0
>>>    GPR08: 0000000000000000 c000001284442b00 0000000000000001 0000000000001003
>>>    GPR12: 0000000300000000 c0000018ffff2f00 0000000000000000 0000000000000000
>>>    GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>>    GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>>>    GPR24: c0000013aed5fc40 0000000000000002 0000000000000000 c000000002757d90
>>>    GPR28: c0000000000ff440 c000000002757cb8 c00000183799c1a0 c0000013aa362b00
>>>    NIP [c0000000000ff4d4] iommu_reconfig_notifier+0x94/0x200
>>>    LR [c0000000000ff4cc] iommu_reconfig_notifier+0x8c/0x200
>>>    Call Trace:
>>>    [c0000013aed5fae0] [c0000000000ff4cc] iommu_reconfig_notifier+0x8c/0x200 (unreliable)
>>>    [c0000013aed5fb10] [c0000000001a27b0] notifier_call_chain+0xb8/0x19c
>>>    [c0000013aed5fb70] [c0000000001a2a78] blocking_notifier_call_chain+0x64/0x98
>>>    [c0000013aed5fbb0] [c000000000c4a898] of_reconfig_notify+0x44/0xdc
>>>    [c0000013aed5fc20] [c000000000c4add4] of_detach_node+0x78/0xb0
>>>    [c0000013aed5fc70] [c0000000000f96a8] ofdt_write.part.0+0x86c/0xbb8
>>>    [c0000013aed5fce0] [c00000000069b4bc] proc_reg_write+0xf4/0x150
>>>    [c0000013aed5fd10] [c0000000005bfeb4] vfs_write+0xf8/0x488
>>>    [c0000013aed5fdc0] [c0000000005c0570] ksys_write+0x84/0x140
>>>    [c0000013aed5fe10] [c000000000033358] system_call_exception+0x138/0x330
>>>    [c0000013aed5fe50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec
>>>    --- interrupt: 3000 at 0x20000433acb4
>>>    <snip>
>>>    ---[ end trace 0000000000000000 ]---
>>>
>>> The patch adds the missing iommu_group_put() call.
>>>
>>> Fixes: a8ca9fc9134c ("powerpc/iommu: Do not do platform domain attach atctions after probe")
>>> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
>>> ---
>>>   arch/powerpc/kernel/iommu.c |    4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>> Doh, that is a weird splat for this but thanks for finding it
>>
>> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>>
>> Jason
>>
