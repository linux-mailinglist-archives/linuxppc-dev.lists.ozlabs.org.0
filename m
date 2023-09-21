Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FE97AA5BA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 01:39:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WeIS+vrd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsBgf5B5dz3cSQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 09:39:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WeIS+vrd;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsBfq1jvpz30fd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 09:38:27 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4RsBfp6JJXz4x3H; Fri, 22 Sep 2023 09:38:26 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1695339506;
	bh=6jsoJ550h6J2wvmtXAG2PTk1r7NG/t43FwHW1M1e698=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WeIS+vrdY4jpLPJrvF5yx7J0yPcmKhqCBKKOp/Z3CJ5ttWO30JFtnFrcV43hYF5M9
	 beIclRLR0PFo55TmgYveoWObZDKIf9D7GdDlMLJAi8mKa625Scmm6yxzwx33mwIri9
	 Xalps4O0aH01kq7oJmqQVUYvMzSf5FzM2O2NwduFvUu0bLaBKD9FQf0R5iWwPusEQY
	 cI4bTS9r3Zus0Kp85evJ2oQH6EtqXzARsHL2RH1ssRJI0emxsjRZMg39G/89rvCQNz
	 O+8cm24iNXPrA/x12snJB8my9IWwdtFHO7a82OSNHIdL/56gO5ZzPDWUZysuos8g2l
	 sdbJSsllLnuMw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RsBfp5VKPz4x2b;
	Fri, 22 Sep 2023 09:38:26 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Aditya Gupta
 <adityag@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] powerpc: add `cur_cpu_spec` symbol to vmcoreinfo
In-Reply-To: <87pm2chrfh.fsf@linux.ibm.com>
References: <20230920105706.853626-1-adityag@linux.ibm.com>
 <87y1h1vy53.fsf@linux.ibm.com>
 <qja6dkvqkcgxjxmgjo4cu6rpa7zvcgnvwa3gxux3f3sjpenejx@7dfbbykea3fw>
 <87pm2chrfh.fsf@linux.ibm.com>
Date: Fri, 22 Sep 2023 09:38:26 +1000
Message-ID: <87v8c3m70t.fsf@mail.lhotse>
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
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>, Sachin Sant <sachinp@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> Aditya Gupta <adityag@linux.ibm.com> writes:
>> On Wed, Sep 20, 2023 at 05:45:36PM +0530, Aneesh Kumar K.V wrote:
>>> Aditya Gupta <adityag@linux.ibm.com> writes:
>>>
>>> > Since below commit, address mapping for vmemmap has changed for Radix
>>> > MMU, where address mapping is stored in kernel page table itself,
>>> > instead of earlier used 'vmemmap_list'.
>>> >
>>> >     commit 368a0590d954 ("powerpc/book3s64/vmemmap: switch radix to use
>>> >     a different vmemmap handling function")
>>> >
>>> > Hence with upstream kernel, in case of Radix MMU, makedumpfile fails to do
>>> > address translation for vmemmap addresses, as it depended on vmemmap_list,
>>> > which can now be empty.
>>> >
>>> > While fixing the address translation in makedumpfile, it was identified
>>> > that currently makedumpfile cannot distinguish between Hash MMU and
>>> > Radix MMU, unless VMLINUX is passed with -x flag to makedumpfile.
>>> > And hence fails to assign offsets and shifts correctly (such as in L4 to
>>> > PGDIR offset calculation in makedumpfile).
>>> >
>>> > For getting the MMU, makedumpfile uses `cur_cpu_spec.mmu_features`.
>>> >
>>> > Add `cur_cpu_spec` symbol and offset of `mmu_features` in the
>>> > `cpu_spec` struct, to VMCOREINFO, so that makedumpfile can assign the
>>> > offsets correctly, without needing a VMLINUX.
>>> >
>>> > Fixes: 368a0590d954 ("powerpc/book3s64/vmemmap: switch radix to use a different vmemmap handling function")
>>> > Reported-by: Sachin Sant <sachinp@linux.ibm.com>
>>> > Tested-by: Sachin Sant <sachinp@linux.ibm.com>
>>> > Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>
>>> >
>>> > ---
>>> > Corresponding makedumpfile patches to fix address translation, in Radix
>>> > MMU case:
>>> >
>>> > Link: https://lore.kernel.org/kexec/B5F0F00E-F2B1-47D7-A143-5683D10DC29A@linux.ibm.com/T/#t
>>> > ---
>>> > ---
>>> >  arch/powerpc/kexec/core.c | 2 ++
>>> >  1 file changed, 2 insertions(+)
>>> >
>>> > diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
>>> > index de64c7962991..369b8334a4f0 100644
>>> > --- a/arch/powerpc/kexec/core.c
>>> > +++ b/arch/powerpc/kexec/core.c
>>> > @@ -63,6 +63,8 @@ void arch_crash_save_vmcoreinfo(void)
>>> >  #ifndef CONFIG_NUMA
>>> >  	VMCOREINFO_SYMBOL(contig_page_data);
>>> >  #endif
>>> > +	VMCOREINFO_SYMBOL(cur_cpu_spec);
>>> > +	VMCOREINFO_OFFSET(cpu_spec, mmu_features);
>>> >  #if defined(CONFIG_PPC64) && defined(CONFIG_SPARSEMEM_VMEMMAP)
>>> >  	VMCOREINFO_SYMBOL(vmemmap_list);
>>> >  	VMCOREINFO_SYMBOL(mmu_vmemmap_psize);
>>> >
>>>
>>> That implies we now have to be careful when updating MMU_FTR_* #defines.
>>> It is not bad considering other hacks we do in crash to identify kernel
>>> changes tied to version number. But i am wondering if there another way
>>> to identify radix vs hash?
>>>
>>
>> I could not find another way to get any other flag for RADIX vs HASH in
>> makedumpfile. And currently I don't know of any other way.
>>
>> Both makedumpfile and crash look for '0x40' flag set in
>> 'cur_cpu_spec.mmu_features', so only requirement for 'MMU_FTR_TYPE_RADIX' is to
>> be '0x40', or we will need to change the value accordingly in the tools.
>
> Instead of exporting cur_cpu_spec.mmu_feature, you could do
> coreinfo_mmu_features that does
>
> if (radix_enabled())
>    coreinfo_mmu_feature = VMCORE_INFO_RADIX_TRANSLATION;

On other arches they seem to use vmcoreinfo_append_str() for more things
than we do on powerpc.

eg. x86:

       vmcoreinfo_append_str("NUMBER(pgtable_l5_enabled)=%d\n", pgtable_l5_enabled());

Could we do something like that instead:

       vmcoreinfo_append_str("RADIX_MMU=%d\n", early_radix_enabled());

cheers
