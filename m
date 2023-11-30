Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 367AE7FE941
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 07:39:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rOr5qxeA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sgmks5CPxz3dDp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 17:39:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rOr5qxeA;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sgmk22f85z2yDD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 17:38:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701326330;
	bh=scy1etpzFyR1jZIjJ7/tF1TmQ4Wr4ZPAn1YidjcB+F0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rOr5qxeAp7+hwSCT9su1OJ57aJsQ7ggH9hU8d+p4CPkIHvFtYa8VDMQB3aJSsQb9x
	 7KnwcbuuavH9TzQFqPQ8saFsfUnd/CUwi1aH82O7OZCKp9c2bNDVx1/Ej+L1puiA9T
	 giyTyN5MW7HA52VJWCV0K0RgS6V9liqDJhHujqnVprWA5JMydiETZgA0m/mzz+BFZZ
	 f0N5fEszptc/Dt1zIijywxUjRhlR4ocAB6HhjB/7jY9SUx2tXcLAHOwcfZoSLu6dhy
	 vq6qJFI38c7f1IYdQT8Zh8HrWTsEQ/gdV9KMGmEyoAaS9NkZGtkUNvNtJJH5nFk/Rk
	 PqeKz/k0JOiew==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sgmjz2zZwz4xWj;
	Thu, 30 Nov 2023 17:38:47 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sean Christopherson <seanjc@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: Ping? Re: [PATCH rc] kvm: Prevent compiling virt/kvm/vfio.c
 unless VFIO is selected
In-Reply-To: <ZWftIIEpbLP2xF5H@google.com>
References: <0-v1-08396538817d+13c5-vfio_kvm_kconfig_jgg@nvidia.com>
 <87edgy87ig.fsf@mail.lhotse> <ZWagNsu1XQIqk5z9@google.com>
 <875y1k3nm9.fsf@mail.lhotse> <ZWfgYdSoJAZqL2Gx@google.com>
 <20231130011650.GD1389974@nvidia.com> <ZWftIIEpbLP2xF5H@google.com>
Date: Thu, 30 Nov 2023 17:38:43 +1100
Message-ID: <87y1ef21ak.fsf@mail.lhotse>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Sven Schnelle <svens@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sean Christopherson <seanjc@google.com> writes:
> On Wed, Nov 29, 2023, Jason Gunthorpe wrote:
>> On Wed, Nov 29, 2023 at 05:07:45PM -0800, Sean Christopherson wrote:
>> > On Wed, Nov 29, 2023, Michael Ellerman wrote:
>> > > Sean Christopherson <seanjc@google.com> writes:
>> > > > On Fri, Nov 10, 2023, Michael Ellerman wrote:
>> > > >> Jason Gunthorpe <jgg@nvidia.com> writes:
>> > > >> > There are a bunch of reported randconfig failures now because of this,
>> > > >> > something like:
>> > > >> >
>> > > >> >>> arch/powerpc/kvm/../../../virt/kvm/vfio.c:89:7: warning: attribute declaration must precede definition [-Wignored-attributes]
>> > > >> >            fn = symbol_get(vfio_file_iommu_group);
>> > > >> >                 ^
>> > > >> >    include/linux/module.h:805:60: note: expanded from macro 'symbol_get'
>> > > >> >    #define symbol_get(x) ({ extern typeof(x) x __attribute__((weak,visibility("hidden"))); &(x); })
>> > > >> >
>> > > >> > It happens because the arch forces KVM_VFIO without knowing if VFIO is
>> > > >> > even enabled.
>> > > >> 
>> > > >> This is still breaking some builds. Can we get this fix in please?
>> > > >> 
>> > > >> cheers
>> > > >> 
>> > > >> > Split the kconfig so the arch selects the usual HAVE_KVM_ARCH_VFIO and
>> > > >> > then KVM_VFIO is only enabled if the arch wants it and VFIO is turned on.
>> > > >
>> > > > Heh, so I was trying to figure out why things like vfio_file_set_kvm() aren't
>> > > > problematic, i.e. why the existing mess didn't cause failures.  I can't repro the
>> > > > warning (requires clang-16?), but IIUC the reason only the group code is problematic
>> > > > is that vfio.h creates a stub for vfio_file_iommu_group() and thus there's no symbol,
>> > > > whereas vfio.h declares vfio_file_set_kvm() unconditionally.
>> > > 
>> > > That warning I'm unsure about.
>> > 
>> > Ah, it's the same warning, I just missed the CONFIG_MODULES=n requirement.
>> 
>> Oh, wait, doesn't that mean the approach won't work? IIRC doesn't
>> symbol_get turn into just &fn when non-modular turning this into a
>> link failure without the kconfig part?

It does build.

I haven't boot tested it, but TBH I don't really care as long as the
build is green, I don't think anyone's actually using this weird
combination of config options.

> Yes, but it doesn't cause linker errors.  IIUC, because the extern declaration
> is tagged "weak", a dummy default is used.  E.g. on x86, this is what is generated
> with VFIO=y
>
>                 fn = symbol_get(vfio_file_is_valid);
>                 if (!fn)
>    0xffffffff810396c5 <+5>:	mov    $0xffffffff81829230,%rax
>    0xffffffff810396cc <+12>:	test   %rax,%rax
>
> whereas VFIO=n gets
>
>                 fn = symbol_get(vfio_file_is_valid);
>                 if (!fn)
>    0xffffffff810396c5 <+5>:	mov    $0x0,%rax
>    0xffffffff810396cc <+12>:	test   %rax,%rax
>
> I have no idea if the fact that symbol_get() generates '0', i.e. the !NULL checks
> work as expected, is intentional or if KVM works by sheer dumb luck.

I think it's intentional:

  https://lore.kernel.org/all/20030117045054.9A2F72C073@lists.samba.org/

cheers
