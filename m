Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB577DC37D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 01:19:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=4wliHHLW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SK9jn4JVGz3c5H
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 11:19:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=4wliHHLW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3zudazqykdi4aws51uy66y3w.u64305cf77u-vwd30aba.6h3sta.69y@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SK9hx3Mr0z2yDM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 11:18:23 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5af9b0850fdso45068547b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 17:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698711501; x=1699316301; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=A/LRaTLkejTxBM8pIW/wY9k081He9jXDc1u8/vyc5yU=;
        b=4wliHHLWv42j7juFiNA2ORekfVMKuoYQayjscAzJA/cWmALewjBxy4Nzw7LXFiwBQT
         dwW/dZK3RkALuo+PEmTYniJyk2Jl6tzYgdCJH0UXFWZ/O1YwgRceVMjtiFfgla4+IKet
         L43A8QCJAIc5FYBgp2/QuPONTlwVk4DdAdiJF5Zw43DB5g4TRpgMucYKtZQfLZHeSSHp
         2fpImo1Q5wdbw0yAf+6+f4IUTzaR3Ba82BV1LNpeyDWN8wllsPw9eL3W6diJGGXWYE4d
         0hkqODlFrYE78jcxW4PnQTCSw0R4H+gWH0BCHOfB+G1RLEovfi+lyLsJvtzYWOIL2sfY
         EXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698711501; x=1699316301;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A/LRaTLkejTxBM8pIW/wY9k081He9jXDc1u8/vyc5yU=;
        b=If6zlBGYx1QMk01LN4yal+kgwf0/MagsG0ijPEH52o14kyyvZO6zFvAo2mNbbK6ylf
         oTC0WBuO5Eb2bqjiL+1ym+KorHdj4AfOnbVcYAkSoYWhqYjcXU7+5B11wwDRaRMSNUOI
         PPb1Br46aL660nf03wbvNWolTCy0L7pg7FuUbcaPrxKG48Yz0Tjb9gBy3/sGbebdueDJ
         nj83XDkUDOCa+F3B+TBCERcqlfbKq3FsFG7m5ea6bI224cpKGzNXVvn+6DemLnHPnUYX
         wKMoBpr0i/bMeSSOWBA8fMw30tvD9CZk85SLwlWZq5CVenw2RtIzJaqCmCGddt5xNaXD
         Hk0Q==
X-Gm-Message-State: AOJu0YwdYQt38R1PHUN9iX/BaI86+yunKXdaN8YT7SOryoVNMbTzWdYP
	eOMXbaEf5a6dP3Y6QchuxB0XL4GPHag=
X-Google-Smtp-Source: AGHT+IHXEBSMgWOLLItH3ZyzwVZ95nnvcf8ZeQIGcTFfJ9alEhiQZOfJ5t56nJTNUPAWz2jzQYzE0vm4h+I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a0d:ca0f:0:b0:5a1:d329:829c with SMTP id
 m15-20020a0dca0f000000b005a1d329829cmr241205ywd.0.1698711501089; Mon, 30 Oct
 2023 17:18:21 -0700 (PDT)
Date: Mon, 30 Oct 2023 17:18:19 -0700
In-Reply-To: <afa0d4ec-4b37-4a67-b546-016148ef4efe@redhat.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-9-seanjc@google.com>
 <211d093f-4023-4a39-a23f-6d8543512675@redhat.com> <ZUARTvhpChFSGF9s@google.com>
 <afa0d4ec-4b37-4a67-b546-016148ef4efe@redhat.com>
Message-ID: <ZUBHy3rrJN8kbFCH@google.com>
Subject: Re: [PATCH v13 08/35] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, l
 inux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 31, 2023, Paolo Bonzini wrote:
> On 10/30/23 21:25, Sean Christopherson wrote:
> > > Probably worth adding a check on valid flags here.
> > 
> > Definitely needed.  There's a very real bug here.  But rather than duplicate flags
> > checking or plumb @ioctl all the way to __kvm_set_memory_region(), now that we
> > have the fancy guard(mutex) and there are no internal calls to kvm_set_memory_region(),
> > what if we:
> > 
> >    1. Acquire/release slots_lock in __kvm_set_memory_region()
> >    2. Call kvm_set_memory_region() from x86 code for the internal memslots
> >    3. Disallow *any* flags for internal memslots
> >    4. Open code check_memory_region_flags in kvm_vm_ioctl_set_memory_region()
> 
> I dislike this step, there is a clear point where all paths meet
> (ioctl/internal, locked/unlocked) and that's __kvm_set_memory_region().
> I think that's the place where flags should be checked.  (I don't mind
> the restriction on internal memslots; it's just that to me it's not a
> particularly natural way to structure the checks).

Yeah, I just don't like the discrepancy it causes where some flags are explicitly
checked and allowed, allowed and then later disallowed.

> On the other hand, the place where to protect from out-of-bounds
> accesses, is the place where you stop caring about struct
> kvm_userspace_memory_region vs kvm_userspace_memory_region2 (and
> your code gets it right, by dropping "ioctl" as soon as possible).
> 
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 87f45aa91ced..fe5a2af14fff 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1635,6 +1635,14 @@ bool __weak kvm_arch_dirty_log_supported(struct kvm *kvm)
>  	return true;
>  }
> +/*
> + * Flags that do not access any of the extra space of struct
> + * kvm_userspace_memory_region2.  KVM_SET_USER_MEMORY_REGION_FLAGS
> + * only allows these.
> + */
> +#define KVM_SET_USER_MEMORY_REGION_FLAGS \

Can we name this KVM_SET_USER_MEMORY_REGION_LEGACY_FLAGS, or something equally
horrific?  As is, this sounds way too much like a generic "allowed flags for any
memory region".

Or maybe invert the macro?  I.e. something to make it more obvious that it's
effectively a versioning check, not a generic "what's supported?" check.

#define KVM_SET_USER_MEMORY_FLAGS_V2_ONLY \
	(~(KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY))


> +	(KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)
> +
>  static int check_memory_region_flags(struct kvm *kvm,
>  				     const struct kvm_userspace_memory_region2 *mem)
>  {
> @@ -5149,10 +5149,16 @@ static long kvm_vm_ioctl(struct file *filp,
>  		struct kvm_userspace_memory_region2 mem;
>  		unsigned long size;
> -		if (ioctl == KVM_SET_USER_MEMORY_REGION)
> +		if (ioctl == KVM_SET_USER_MEMORY_REGION) {
> +			/*
> +			 * Fields beyond struct kvm_userspace_memory_region shouldn't be
> +			 * accessed, but avoid leaking kernel memory in case of a bug.
> +			 */
> +			memset(&mem, 0, sizeof(mem));
>  			size = sizeof(struct kvm_userspace_memory_region);
> -		else
> +		} else {
>  			size = sizeof(struct kvm_userspace_memory_region2);
> +		}
>  		/* Ensure the common parts of the two structs are identical. */
>  		SANITY_CHECK_MEM_REGION_FIELD(slot);
> @@ -5165,6 +5167,11 @@ static long kvm_vm_ioctl(struct file *filp,
>  		if (copy_from_user(&mem, argp, size))
>  			goto out;
> +		r = -EINVAL;
> +		if (ioctl == KVM_SET_USER_MEMORY_REGION &&
> +		    (mem->flags & ~KVM_SET_USER_MEMORY_REGION_FLAGS))
> +			goto out;
> +
>  		r = kvm_vm_ioctl_set_memory_region(kvm, &mem);
>  		break;
>  	}
> 
> 
> That's a kind of patch that you can't really get wrong (though I have
> the brown paper bag ready).
> 
> Maintainance-wise it's fine, since flags are being added at a pace of
> roughly one every five years,

Heh, true.

> and anyway it's also future proof: I placed the #define near
> check_memory_region_flags so that in five years we remember to keep it up to
> date.  But worst case, the new flags will only be allowed by
> KVM_SET_USER_MEMORY_REGION2 unnecessarily; there are no security issues
> waiting to bite us.
>
> In sum, this is exactly the only kind of fix that should be in the v13->v14
> delta.

Boiling the ocean can be fun too ;-)
