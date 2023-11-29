Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 699A37FD2FB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 10:39:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=myoOwtYn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgDnP6Q5Zz3dFx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 20:39:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=myoOwtYn;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgDmb4P8wz2yQL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 20:39:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701250743;
	bh=vsrPdG817FSeXCk8MleL83TvHrXPh57pIp04z21H6/U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=myoOwtYnCMYNkSic9zkY8PttdYTgpbf4PL7ltVmiCcjFDDHamvpvFsbPNb5ijDUmL
	 /TpbvQtdmVfVWR+njBWEGRP92NjOV5+MZQaX+tT89yOGy8xnklIfEunWGvAO7qhC8O
	 gT3a7LpOh5roXxVSpgc34BoYlbs1qN2ZqeqB+tkQi/cq/vRGIdQ6gtBxxE68+B6k4i
	 bYNiLeavOIdFfO73cqyMi9+84hbh5vDQJZlxxEqHgEVKoICfhApON15kYD+5UgsOr+
	 89EIItQ+H6NgAGLE4Ijuygow0sOrow+YyHqye6OErP4sEbng//26tIroIU1W0W/3dG
	 Dt/Jm7l9QS0Ow==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SgDmP5ZxZz4xSy;
	Wed, 29 Nov 2023 20:39:01 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: Ping? Re: [PATCH rc] kvm: Prevent compiling virt/kvm/vfio.c
 unless VFIO is selected
In-Reply-To: <ZWagNsu1XQIqk5z9@google.com>
References: <0-v1-08396538817d+13c5-vfio_kvm_kconfig_jgg@nvidia.com>
 <87edgy87ig.fsf@mail.lhotse> <ZWagNsu1XQIqk5z9@google.com>
Date: Wed, 29 Nov 2023 20:38:54 +1100
Message-ID: <875y1k3nm9.fsf@mail.lhotse>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Zenghui Yu <yuzenghui@huawei.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Sven Schnelle <svens@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sean Christopherson <seanjc@google.com> writes:
> On Fri, Nov 10, 2023, Michael Ellerman wrote:
>> Jason Gunthorpe <jgg@nvidia.com> writes:
>> > There are a bunch of reported randconfig failures now because of this,
>> > something like:
>> >
>> >>> arch/powerpc/kvm/../../../virt/kvm/vfio.c:89:7: warning: attribute declaration must precede definition [-Wignored-attributes]
>> >            fn = symbol_get(vfio_file_iommu_group);
>> >                 ^
>> >    include/linux/module.h:805:60: note: expanded from macro 'symbol_get'
>> >    #define symbol_get(x) ({ extern typeof(x) x __attribute__((weak,visibility("hidden"))); &(x); })
>> >
>> > It happens because the arch forces KVM_VFIO without knowing if VFIO is
>> > even enabled.
>> 
>> This is still breaking some builds. Can we get this fix in please?
>> 
>> cheers
>> 
>> > Split the kconfig so the arch selects the usual HAVE_KVM_ARCH_VFIO and
>> > then KVM_VFIO is only enabled if the arch wants it and VFIO is turned on.
>
> Heh, so I was trying to figure out why things like vfio_file_set_kvm() aren't
> problematic, i.e. why the existing mess didn't cause failures.  I can't repro the
> warning (requires clang-16?), but IIUC the reason only the group code is problematic
> is that vfio.h creates a stub for vfio_file_iommu_group() and thus there's no symbol,
> whereas vfio.h declares vfio_file_set_kvm() unconditionally.

That warning I'm unsure about.

But the final report linked in Jason's mail shows a different one:

   In file included from arch/powerpc/kvm/../../../virt/kvm/vfio.c:17:
   include/linux/vfio.h: In function 'kvm_vfio_file_iommu_group':
   include/linux/vfio.h:294:35: error: weak declaration of 'vfio_file_iommu_group' being applied to a already existing, static definition
     294 | static inline struct iommu_group *vfio_file_iommu_group(struct file *file)
         |                                   ^~~~~~~~~~~~~~~~~~~~~

Which is simple to reproduce, just build ppc64le_defconfig and then turn
off CONFIG_MODULES (I'm using GCC 13, the report is for GCC 12).

> Because KVM is doing symbol_get() and not taking a direct dependency, the lack of
> an exported symbol doesn't cause problems, i.e. simply declaring the symbol makes
> the compiler happy.
>
> Given that the vfio_file_iommu_group() stub shouldn't exist (KVM is the only user,
> and so if I'm correct the stub is worthless), what about this as a temporary "fix"?
>
> I'm 100% on-board with fixing KVM properly, my motivation is purely to minimize
> the total amount of churn.  E.g. if this works, then the only extra churn is to
> move the declaration of vfio_file_iommu_group() back under the #if, versus having
> to churn all of the KVM Kconfigs twice (once now, and again for the full cleanup).

Fine by me.

> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index 454e9295970c..a65b2513f8cd 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -289,16 +289,12 @@ void vfio_combine_iova_ranges(struct rb_root_cached *root, u32 cur_nodes,
>  /*
>   * External user API
>   */
> -#if IS_ENABLED(CONFIG_VFIO_GROUP)
>  struct iommu_group *vfio_file_iommu_group(struct file *file);
> +
> +#if IS_ENABLED(CONFIG_VFIO_GROUP)
>  bool vfio_file_is_group(struct file *file);
>  bool vfio_file_has_dev(struct file *file, struct vfio_device *device);
>  #else
> -static inline struct iommu_group *vfio_file_iommu_group(struct file *file)
> -{
> -       return NULL;
> -}
> -
>  static inline bool vfio_file_is_group(struct file *file)
>  {
>         return false;

That fixes the build for me.

Tested-by: Michael Ellerman <mpe@ellerman.id.au>


cheers
