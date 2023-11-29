Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C56127FCCD9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 03:22:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BTxwXjeD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sg34p29rhz3cbt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 13:22:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BTxwXjeD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3okbmzqykdeuzlhuqjnvvnsl.jvtspu14wwj-kl2spz0z.v6shiz.vyn@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sg33x1pfQz30Jy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 13:21:47 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5c994880223so92988147b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Nov 2023 18:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701224505; x=1701829305; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mJUgPg47d4/pgx8Qlc5dU8QTKw0KSk/PtK3yQegaG7g=;
        b=BTxwXjeDYMh9a2HsTo5bUHnTY2AmYXF7EMAANFyB8AhPHVWEkO4xHK1wKABhFPxYDm
         5EuPe17T2nVqFx+NYSWLg0D9GccN0ZC5YuSR/9sjmKntvwBqOOAvvawnMF2OOzCanUZA
         dPLUfX20PPVwKcVrs2F4FbWXm7Vf+7W0Y1dYZQYyu4pW+uXJ1dWKFAoSPMlNS/OPnJ7b
         gFh7qHqpNwKm1oSnRG4Zpk0CXGfJdmbV3xVeublIpkVH4NkkqhDQ+MWeuctCicuhCoiY
         ydJLJJJ/6iTK+FjwhAZQGUS02dyTf+7NUvcZqCcs5Ewyfu9Ekbdhk+pFogT0cEqf8bEr
         1ROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701224505; x=1701829305;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJUgPg47d4/pgx8Qlc5dU8QTKw0KSk/PtK3yQegaG7g=;
        b=KHZIVvAm9+uc3Gd6uIIOhJtAbPr2+MbzcoiK9rlUfI+Wu3NsD4VRoy2bsJ9dg1ncJy
         u8YrKo7JuEQC1xYV9w28Nci/TkrCxvB+anrfGcxt6xzFBh3MXUwWUCL/6Ls1fY4pD10S
         /WZArXr7EjrnKx+woigPFTKmVdY8Kzw0wSF5bRgMMbo5ftKZ2fU2Vdp13KbNwJDEu3YQ
         euqwSQ9By5uAingfjx1mbYBA8KybXrYTuGUrtc6qtUt6yLTqvlhlcxDUe5836L/ZF/dr
         ArTAvV2smN/LsvuZ14aZelpyOd9960lQ+k0Crp3KunVWEgDq6VibD5+eH3FwaAZDFAPr
         VVNA==
X-Gm-Message-State: AOJu0Yx69mw7oz0ZeOkbjYGCNrCdGKegkyd3zY6Vz54PfyS4XgDH26D6
	ac2F2KuXG+mCMcnh7ZP+jGyPh6NO6Pg=
X-Google-Smtp-Source: AGHT+IEzvdnB4YF3ag5ypaUivwQ+a/1gSiOiue26Vf+Kzl2dkVc1+0BYVi7jXds4GjyyxEfKmNI6Cd+a9DA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:ff05:0:b0:5cd:c47d:d89a with SMTP id
 k5-20020a81ff05000000b005cdc47dd89amr593254ywn.2.1701224504362; Tue, 28 Nov
 2023 18:21:44 -0800 (PST)
Date: Tue, 28 Nov 2023 18:21:42 -0800
In-Reply-To: <87edgy87ig.fsf@mail.lhotse>
Mime-Version: 1.0
References: <0-v1-08396538817d+13c5-vfio_kvm_kconfig_jgg@nvidia.com> <87edgy87ig.fsf@mail.lhotse>
Message-ID: <ZWagNsu1XQIqk5z9@google.com>
Subject: Re: Ping? Re: [PATCH rc] kvm: Prevent compiling virt/kvm/vfio.c
 unless VFIO is selected
From: Sean Christopherson <seanjc@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Zenghui Yu <yuzenghui@huawei.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Sven Schnelle <svens@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 10, 2023, Michael Ellerman wrote:
> Jason Gunthorpe <jgg@nvidia.com> writes:
> > There are a bunch of reported randconfig failures now because of this,
> > something like:
> >
> >>> arch/powerpc/kvm/../../../virt/kvm/vfio.c:89:7: warning: attribute declaration must precede definition [-Wignored-attributes]
> >            fn = symbol_get(vfio_file_iommu_group);
> >                 ^
> >    include/linux/module.h:805:60: note: expanded from macro 'symbol_get'
> >    #define symbol_get(x) ({ extern typeof(x) x __attribute__((weak,visibility("hidden"))); &(x); })
> >
> > It happens because the arch forces KVM_VFIO without knowing if VFIO is
> > even enabled.
> 
> This is still breaking some builds. Can we get this fix in please?
> 
> cheers
> 
> > Split the kconfig so the arch selects the usual HAVE_KVM_ARCH_VFIO and
> > then KVM_VFIO is only enabled if the arch wants it and VFIO is turned on.

Heh, so I was trying to figure out why things like vfio_file_set_kvm() aren't
problematic, i.e. why the existing mess didn't cause failures.  I can't repro the
warning (requires clang-16?), but IIUC the reason only the group code is problematic
is that vfio.h creates a stub for vfio_file_iommu_group() and thus there's no symbol,
whereas vfio.h declares vfio_file_set_kvm() unconditionally.

Because KVM is doing symbol_get() and not taking a direct dependency, the lack of
an exported symbol doesn't cause problems, i.e. simply declaring the symbol makes
the compiler happy.

Given that the vfio_file_iommu_group() stub shouldn't exist (KVM is the only user,
and so if I'm correct the stub is worthless), what about this as a temporary "fix"?

I'm 100% on-board with fixing KVM properly, my motivation is purely to minimize
the total amount of churn.  E.g. if this works, then the only extra churn is to
move the declaration of vfio_file_iommu_group() back under the #if, versus having
to churn all of the KVM Kconfigs twice (once now, and again for the full cleanup).

diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 454e9295970c..a65b2513f8cd 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -289,16 +289,12 @@ void vfio_combine_iova_ranges(struct rb_root_cached *root, u32 cur_nodes,
 /*
  * External user API
  */
-#if IS_ENABLED(CONFIG_VFIO_GROUP)
 struct iommu_group *vfio_file_iommu_group(struct file *file);
+
+#if IS_ENABLED(CONFIG_VFIO_GROUP)
 bool vfio_file_is_group(struct file *file);
 bool vfio_file_has_dev(struct file *file, struct vfio_device *device);
 #else
-static inline struct iommu_group *vfio_file_iommu_group(struct file *file)
-{
-       return NULL;
-}
-
 static inline bool vfio_file_is_group(struct file *file)
 {
        return false;

