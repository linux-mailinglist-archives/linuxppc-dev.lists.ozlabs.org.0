Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E766736492
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 09:31:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=kQcnC5U4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qldbv3nPGz30h2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 17:31:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=kQcnC5U4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QldZx5SWbz2yyc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 17:30:32 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b539102474so15393335ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 00:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687246228; x=1689838228;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYV4rW6gKPpoa3eFGZn6o9TgBp896EY80rdpl9Nfr2s=;
        b=kQcnC5U4PfyLQDSNkgJ+ZABIfGbRvyggeR2C8Y/N456McznJImrS63FChLkZaxR5tR
         Yq9f7Fxc2W99C/vYKA7o90DjifVQOxR0zUmPd2QEoj+ZsFWgSwqMn23Ryj/MQnhi07XE
         +FR5gSzkjkQbqq3p+O+0CpJeIdKu999apYycR+66zy89IamAqsRPerriuP6fbapd6VKd
         9HKmNtYaXYD5JqcEUNTemZQjEs9szfcsmT7wGpnlhLG3lNn6gmpsq11BV3U2q6pLf8KZ
         hLgEt3KZCnMPg6XY/thkZMJk7T5TBObUL6+V3k5F2FiirDyfxWxH5sIOasXCkEmGX1a3
         i+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687246228; x=1689838228;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pYV4rW6gKPpoa3eFGZn6o9TgBp896EY80rdpl9Nfr2s=;
        b=ISPjOP2NQVJxJ6DI6E44TO9/15hA0aYlieNM2onftKFWHIxZ3ZH//MBqs5lCeao8Jz
         xmuXoKGuCoEhMHSVQPRTxmcKcpV+uoZRR+wcM2BIq2iGV8TRaep2Rz3Vwr1CVtItPPGf
         25UmdAFlzqD6axX+jsNIhGRYjDzPDJS6+/agVtf6gV95ZJpv1xXiR+h3v6zQ0pyD+qvg
         Edl+QaEQekX3OKRJvbEIap7DqAWuzhxgz5gGPWgPBlx6JIFL/T54lvs8XAK1lJzO9jgO
         W4uKLHRAbcIXHXSSY7dWKAzv8hLbD0E4Wz7soynktnRYDC+F0Y9JFHfgPnQSjKe+p62A
         lQYA==
X-Gm-Message-State: AC+VfDwp+2tlWwV7mZFCOjubLsNCFgb4Kg8+20U0P+9jsTsyv5k/ZsRB
	R/2QL6BjEGlg7Bj6b3ipLpc=
X-Google-Smtp-Source: ACHHUZ43eep1AAmMl46MrK15oMgQPLrGXyP67yrmCY8AmGwY+QIfVnfreQMQhLQu3G2HRVKs6stwBg==
X-Received: by 2002:a17:902:c14a:b0:1b2:404c:7d46 with SMTP id 10-20020a170902c14a00b001b2404c7d46mr6394563plj.54.1687246227734;
        Tue, 20 Jun 2023 00:30:27 -0700 (PDT)
Received: from localhost ([124.170.190.103])
        by smtp.gmail.com with ESMTPSA id iy22-20020a170903131600b001b04b1fae4dsm958860plb.35.2023.06.20.00.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 00:30:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jun 2023 17:30:09 +1000
Message-Id: <CTHAV43JUAN4.I7HNUHO778BB@wheely>
To: "Yu Zhao" <yuzhao@google.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Paolo Bonzini" <pbonzini@redhat.com>
Subject: Re: [PATCH mm-unstable v2 01/10] mm/kvm: add
 mmu_notifier_ops->test_clear_young()
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.14.0
References: <20230526234435.662652-1-yuzhao@google.com>
 <20230526234435.662652-2-yuzhao@google.com>
In-Reply-To: <20230526234435.662652-2-yuzhao@google.com>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, Marc
 Zyngier <maz@kernel.org>, "H. Peter
 Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Jason
 Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas
 Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Borislav Petkov <bp@alien8.de>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Fabiano Rosas <farosas@linux.ibm.com>, Michael Larabel <michael@michaellarabel.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Oliver
 Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat May 27, 2023 at 9:44 AM AEST, Yu Zhao wrote:
> Add mmu_notifier_ops->test_clear_young() to supersede test_young()
> and clear_young().
>
> test_clear_young() has a fast path, which if supported, allows its
> callers to safely clear the accessed bit without taking
> kvm->mmu_lock.
>
> The fast path requires arch-specific code that generally relies on
> RCU and CAS: the former protects KVM page tables from being freed
> while the latter clears the accessed bit atomically against both the
> hardware and other software page table walkers. If the fast path is
> unsupported, test_clear_young() falls back to the existing slow path
> where kvm->mmu_lock is then taken.
>
> test_clear_young() can also operate on a range of KVM PTEs
> individually according to a bitmap, if the caller provides it.

It would be better if you could do patch 1 that only touches the
mmu_notifier code and implements mmu_notifier_test_clear_young() in
terms of existing callbacks, and next patch swaps KVM to new callbacks
and remove the old ones.

> diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
> index 64a3e051c3c4..dfdbb370682d 100644
> --- a/include/linux/mmu_notifier.h
> +++ b/include/linux/mmu_notifier.h
> @@ -60,6 +60,8 @@ enum mmu_notifier_event {
>  };
> =20
>  #define MMU_NOTIFIER_RANGE_BLOCKABLE (1 << 0)
> +#define MMU_NOTIFIER_RANGE_LOCKLESS	(1 << 1)
> +#define MMU_NOTIFIER_RANGE_YOUNG	(1 << 2)
> =20
>  struct mmu_notifier_ops {
>  	/*
> @@ -122,6 +124,10 @@ struct mmu_notifier_ops {
>  			  struct mm_struct *mm,
>  			  unsigned long address);
> =20
> +	int (*test_clear_young)(struct mmu_notifier *mn, struct mm_struct *mm,
> +				unsigned long start, unsigned long end,
> +				bool clear, unsigned long *bitmap);

This should have a comment like the others. Callback wants to know how
to implement it.

Could add a _range on it as well while you're here, to correct that
inconsistency.

> +
>  	/*
>  	 * change_pte is called in cases that pte mapping to page is changed:
>  	 * for example, when ksm remaps pte to point to a new shared page.
> @@ -392,6 +398,9 @@ extern int __mmu_notifier_clear_young(struct mm_struc=
t *mm,
>  				      unsigned long end);
>  extern int __mmu_notifier_test_young(struct mm_struct *mm,
>  				     unsigned long address);
> +extern int __mmu_notifier_test_clear_young(struct mm_struct *mm,
> +					   unsigned long start, unsigned long end,
> +					   bool clear, unsigned long *bitmap);
>  extern void __mmu_notifier_change_pte(struct mm_struct *mm,
>  				      unsigned long address, pte_t pte);
>  extern int __mmu_notifier_invalidate_range_start(struct mmu_notifier_ran=
ge *r);
> @@ -440,6 +449,35 @@ static inline int mmu_notifier_test_young(struct mm_=
struct *mm,
>  	return 0;
>  }
> =20
> +/*
> + * mmu_notifier_test_clear_young() returns nonzero if any of the KVM PTE=
s within
> + * a given range was young. Specifically, it returns MMU_NOTIFIER_RANGE_=
LOCKLESS
> + * if the fast path was successful, MMU_NOTIFIER_RANGE_YOUNG otherwise.
> + *
> + * The last parameter to the function is a bitmap and only the fast path
> + * supports it: if it is NULL, the function falls back to the slow path =
if the
> + * fast path was unsuccessful; otherwise, the function bails out.

Then if it was NULL, you would just not populate it. Minmize differences
and cases for the caller/implementations.

> + *
> + * The bitmap has the following specifications:
> + * 1. The number of bits should be at least (end-start)/PAGE_SIZE.
> + * 2. The offset of each bit should be relative to the end, i.e., the of=
fset
> + *    corresponding to addr should be (end-addr)/PAGE_SIZE-1. This is co=
nvenient
> + *    for batching while forward looping.
> + *
> + * When testing, this function sets the corresponding bit in the bitmap =
for each
> + * young KVM PTE. When clearing, this function clears the accessed bit f=
or each
> + * young KVM PTE whose corresponding bit in the bitmap is set.

I think this is over-designed as a first pass. The secondary MMU should
just implement the call always. If it can't do it locklessly, then just
do individual lookups. If the benefit is in the batching as you say then
the locked version will get similar benefit. Possibly more because locks
like some amount of batching when contended.

I think that would reduce some concerns about cases of secondary MMUs
that do not not support the lockless version yet, and avoid
proliferation of code paths by platform.

_If_ that was insufficient then I would like to see numbers and profiles
and incremental patch to expose more complexity like this.

Also mmu notifier code should say nothing about KVM PTEs or use kvm
names in any code or comments either. "if the page was accessed via the
secondary MMU" or similar is mutually understandable to KVM and mm
developers.

> @@ -880,6 +887,72 @@ static int kvm_mmu_notifier_test_young(struct mmu_no=
tifier *mn,
>  					     kvm_test_age_gfn);
>  }
> =20
> +struct test_clear_young_args {
> +	unsigned long *bitmap;
> +	unsigned long end;
> +	bool clear;
> +	bool young;
> +};
> +
> +bool kvm_should_clear_young(struct kvm_gfn_range *range, gfn_t gfn)
> +{
> +	struct test_clear_young_args *args =3D range->args;
> +
> +	VM_WARN_ON_ONCE(gfn < range->start || gfn >=3D range->end);
> +
> +	args->young =3D true;
> +
> +	if (args->bitmap) {
> +		int offset =3D hva_to_gfn_memslot(args->end - 1, range->slot) - gfn;
> +
> +		if (args->clear)
> +			return test_bit(offset, args->bitmap);
> +
> +		__set_bit(offset, args->bitmap);
> +	}
> +
> +	return args->clear;
> +}

I don't quite understnd what's going on here. This is actually the
function that notes the young pte, despite its name suggesting it is
only a query.

Shouldn't it set the bitmap bit even in the clear case? And why is it
testing at all? Oh, it seems to be some strange mix of test *or* clear
young. With the bitmap being a predicate in some cases for the clear
case.

This is a fairly confusing multi-modal API then. I think it should
take 2 bitmaps, one is the young bitmap and the other is the predicate
bitmap, and either/or can be NULL.

Also this kvm_should_clear_young helper is clunky and misnamed. If you
just provided an inline helper to get test_clear_young bitmap offset
from gfn, then set/clear bit in the caller is quite trivial.

> +
> +static int kvm_mmu_notifier_test_clear_young(struct mmu_notifier *mn, st=
ruct mm_struct *mm,
> +					     unsigned long start, unsigned long end,
> +					     bool clear, unsigned long *bitmap)
> +{
> +	struct kvm *kvm =3D mmu_notifier_to_kvm(mn);
> +	struct kvm_hva_range range =3D {
> +		.start		=3D start,
> +		.end		=3D end,
> +		.on_lock	=3D (void *)kvm_null_fn,
> +		.on_unlock	=3D (void *)kvm_null_fn,
> +	};
> +
> +	trace_kvm_age_hva(start, end);
> +
> +	if (kvm_arch_has_test_clear_young()) {
> +		struct test_clear_young_args args =3D {
> +			.bitmap	=3D bitmap,
> +			.end	=3D end,
> +			.clear	=3D clear,
> +		};
> +
> +		range.args =3D &args;
> +		range.lockless =3D true;
> +		range.handler =3D kvm_arch_test_clear_young;
> +
> +		if (!__kvm_handle_hva_range(kvm, &range))
> +			return args.young ? MMU_NOTIFIER_RANGE_LOCKLESS : 0;
> +	}
> +
> +	if (bitmap)
> +		return 0;
> +
> +	range.args =3D NULL;
> +	range.lockless =3D false;
> +	range.handler =3D clear ? kvm_age_gfn : kvm_test_age_gfn;

Minor thing, but KVM's "young" handling has been called "age" until now.
Any reason not to stick with that theme?

Thanks,
Nick
