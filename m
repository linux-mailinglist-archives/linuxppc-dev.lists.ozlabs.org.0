Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9327DC249
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 23:06:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vy01LS0j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SK6n770pjz3cLY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 09:06:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vy01LS0j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3xihazqykdek3plyunrzzrwp.nzxwty5800n-op6wt343.zawlm3.z2r@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SK6mF4BQnz3bXH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 09:06:03 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5af9b0850fdso43633077b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 15:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698703558; x=1699308358; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1IwVDVsbZSN9+qsHUIXJ8IN4aMaIP7o7r0dMzi80JWo=;
        b=vy01LS0jfiJKLmmKpkSzUVJ/pcSP7m9SiVySLWbyQIqjXFmoewG+EuRKsBmvISCqmd
         +F777UYvT0UV5vh0UHLJIBPjuTs4REgswcEjnUBOlCwcn42I5rIsGUL56R2T8RrRD3Dy
         N5gj28d5t7ueVJye3pAa+fqX2miOqdjv1KjctYSE/+gLfzneOnXBj12XHWtafHw9I9Dy
         jv3sIg4OJPH9Fh0d+++aG2Z7k49PmjUuBjZ+miAgAIs3UkqeAUIL0LR4XfnlDt7zt3I3
         oMTc/4aiDvg4ckbk3gykSiuOw9owyt723TShXheOAOt4z6zp3Xu0z9ZODpnXT/6EZ4pR
         3gWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698703558; x=1699308358;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1IwVDVsbZSN9+qsHUIXJ8IN4aMaIP7o7r0dMzi80JWo=;
        b=ngv+Wl41Wvi6jfwnCCWLHJjK5PyNg9ugOrp2Kd4Ky8s5DmQTDlwV0YxIB3qe/fP+HX
         ++FiIHuX3NGcIV9Fh61mgAdQgXPNKJM2zWeZ7+SyuX8KoeZFpb1QbiN6xIZIoMSU6ZyJ
         G6fAIgScfOHwe5Ycg36BfwDsHIjmOsl/uZhoKPnYXL//GyWIJyeokDzsvKkI9oIiT7cw
         Zd2j8zUM9eo7Ceb2ncgsKye954TX9Z3jm/SeMLXxHLecQgWE+jd11p8wWtih7kHxMVK7
         +Oo1S/zMuem/ZOiWPCizG/aMXLfXBL1ovOyVekpiIh/3cNLxennPxbppmtkophIQ+7T2
         RuVA==
X-Gm-Message-State: AOJu0Ywh4dRATc71MNBzWHPKR4N2cESqU0WcMSoqu5DSnD4crox7YaGm
	OZBITKyb3JCACUz0qXiM2TeHdQhMHKs=
X-Google-Smtp-Source: AGHT+IEdUnGiaB+HWnyvBXIWgJEvc4p4Jj6o8XAknp5F2BcjElHvOjmW/sQ9BadeZP3HZD1+EeGEwSi+J0Q=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:b108:0:b0:d99:3750:d607 with SMTP id
 g8-20020a25b108000000b00d993750d607mr203752ybj.8.1698703558464; Mon, 30 Oct
 2023 15:05:58 -0700 (PDT)
Date: Mon, 30 Oct 2023 15:05:56 -0700
In-Reply-To: <ZT_ViJOW1p4TN_fI@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-14-seanjc@google.com>
 <ZT9lQ9c7Bik6FIpw@chao-email> <ZT_ViJOW1p4TN_fI@google.com>
Message-ID: <ZUAoxCZJnpPGWjpu@google.com>
Subject: Re: [PATCH v13 13/35] KVM: Introduce per-page memory attributes
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, L
 iam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 30, 2023, Sean Christopherson wrote:
> On Mon, Oct 30, 2023, Chao Gao wrote:
> > On Fri, Oct 27, 2023 at 11:21:55AM -0700, Sean Christopherson wrote:
> > >From: Chao Peng <chao.p.peng@linux.intel.com>
> > >
> > >In confidential computing usages, whether a page is private or shared is
> > >necessary information for KVM to perform operations like page fault
> > >handling, page zapping etc. There are other potential use cases for
> > >per-page memory attributes, e.g. to make memory read-only (or no-exec,
> > >or exec-only, etc.) without having to modify memslots.
> > >
> > >Introduce two ioctls (advertised by KVM_CAP_MEMORY_ATTRIBUTES) to allow
> > >userspace to operate on the per-page memory attributes.
> > >  - KVM_SET_MEMORY_ATTRIBUTES to set the per-page memory attributes to
> > >    a guest memory range.
> > 
> > >  - KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES to return the KVM supported
> > >    memory attributes.
> > 
> > This ioctl() is already removed. So, the changelog is out-of-date and needs
> > an update.
> 
> Doh, I lost track of this and the fixup for KVM_CAP_MEMORY_ATTRIBUTES below.
> 
> > >+:Capability: KVM_CAP_MEMORY_ATTRIBUTES
> > >+:Architectures: x86
> > >+:Type: vm ioctl
> > >+:Parameters: struct kvm_memory_attributes(in)
> > 
> > 					   ^ add one space here?
> 
> Ah, yeah, that does appear to be the standard.
> > 
> > 
> > >+static bool kvm_pre_set_memory_attributes(struct kvm *kvm,
> > >+					  struct kvm_gfn_range *range)
> > >+{
> > >+	/*
> > >+	 * Unconditionally add the range to the invalidation set, regardless of
> > >+	 * whether or not the arch callback actually needs to zap SPTEs.  E.g.
> > >+	 * if KVM supports RWX attributes in the future and the attributes are
> > >+	 * going from R=>RW, zapping isn't strictly necessary.  Unconditionally
> > >+	 * adding the range allows KVM to require that MMU invalidations add at
> > >+	 * least one range between begin() and end(), e.g. allows KVM to detect
> > >+	 * bugs where the add() is missed.  Rexlaing the rule *might* be safe,
> > 
> > 					    ^^^^^^^^ Relaxing
> > 
> > >@@ -4640,6 +4850,17 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
> > > 	case KVM_CAP_BINARY_STATS_FD:
> > > 	case KVM_CAP_SYSTEM_EVENT_DATA:
> > > 		return 1;
> > >+#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> > >+	case KVM_CAP_MEMORY_ATTRIBUTES:
> > >+		u64 attrs = kvm_supported_mem_attributes(kvm);
> > >+
> > >+		r = -EFAULT;
> > >+		if (copy_to_user(argp, &attrs, sizeof(attrs)))
> > >+			goto out;
> > >+		r = 0;
> > >+		break;
> > 
> > This cannot work, e.g., no @argp in this function and is fixed by a later commit:
> > 
> > 	fcbef1e5e5d2 ("KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for guest-specific backing memory")
> 
> I'll post a fixup patch for all of these, thanks much!

Heh, that was an -ENOCOFFEE.  Fixup patches for a changelog goof and an ephemeral
bug are going to be hard to post.

Paolo, do you want to take care of all of these fixups and typos, or would you
prefer that I start a v14 branch and then hand it off to you at some point?
