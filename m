Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7397B6965
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 14:48:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=bj8ZBYwG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0Hgj5fDrz3cDN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 23:48:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=bj8ZBYwG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::732; helo=mail-qk1-x732.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0Hfs2b0Nz30PJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Oct 2023 23:48:04 +1100 (AEDT)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-77574dec71bso65351185a.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Oct 2023 05:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696337280; x=1696942080; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YZe9z/CDJkweGhxZy3F+7e7AP42NZQg1sBDsRc6xWLw=;
        b=bj8ZBYwGjC0imt4tjNT9YxqXkqDRLZ9cuDnwq1Ky2EUhDPw9BE5wtNdqPFvLtDkoGg
         6DqNZZlSj3XFKAHDHF8UrK/H0soAq3R4o4EuU80XTLgxisuyC3fGm7jNgR1j/FXrl0GU
         lJK/NGF7GdyS0B5mtE8aRKqd/PdWeAt3NWExy/B2bFPU9zJHLyG7WUuEruul98oY9/fI
         6wn78XkyWf/xcM7gbvOj1lTQAoXa0kZhlsk3buPLskhFl7D8R0nnQ4VD3ATz/Mn1nOQS
         UD4/aTYnyGUGdFyaHiitH1XF/NgJ5aYPBstvm9hHQFEcQQXiGUthiV2EB+N1HMf309lC
         CIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696337280; x=1696942080;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YZe9z/CDJkweGhxZy3F+7e7AP42NZQg1sBDsRc6xWLw=;
        b=Xdh7GSARC4Vma98fkbWBqfP60Dgl8MMmBQnf2M0jrM7hfhJRm7Wk2kVZqapLjqQ7Va
         4fz6xpbZaCaTloTPbrQH/dZwx6p1NYfZt3KDNmiMh2m/nMy1prPnDxvbM369qhF+Igdt
         QPgupQ/x9GFv6CpN722pl++APZESTzHnFZbGHqFNiaff/4e5bmRvg70qVMli/2KYbSsc
         HrKedV/C0vwz7Q4oEifUarVsP7G1/1qk2YnTy6cWpOHmf7rEJJGDkOdkxLXladI9lkcK
         C5aXXAQLAM+vfs2jnZ6zG7r45iAEQfkpeGDAkRIJxAbAwCfdoKwJkXTE0uuF1utO/2vs
         9thg==
X-Gm-Message-State: AOJu0YxLb4vS5YnCol1nnRKEbitXYbeTE2Bvu2+qYNNL0K5qky62/7Mq
	ytAXJITy6khSDZ1sN6fljWyo6RfhEUrMC1n8szTQeg==
X-Google-Smtp-Source: AGHT+IGdg5KfMiaxwpI9vdrZwCI62gGbA1qcJqHvAfDGqDxEQ2JSHryTMBO/72MMo9L0zK8WyPrlSIxRkNMNwCJdjzY=
X-Received: by 2002:a0c:e493:0:b0:656:347b:ea75 with SMTP id
 n19-20020a0ce493000000b00656347bea75mr13564335qvl.24.1696337280208; Tue, 03
 Oct 2023 05:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-12-seanjc@google.com>
In-Reply-To: <20230914015531.1419405-12-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 3 Oct 2023 13:47:23 +0100
Message-ID: <CA+EHjTzSUXx8P9gWmUERg4owxH6r6yNPm1_RL-BzS_2CNPtRKw@mail.gmail.com>
Subject: Re: [RFC PATCH v12 11/33] KVM: Introduce per-page memory attributes
To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel
 .org, Oliver Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index d2d913acf0df..f8642ff2eb9d 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1227,6 +1227,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE 228
>  #define KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES 229
>  #define KVM_CAP_USER_MEMORY2 230
> +#define KVM_CAP_MEMORY_ATTRIBUTES 231
>
>  #ifdef KVM_CAP_IRQ_ROUTING
>
> @@ -2293,4 +2294,17 @@ struct kvm_s390_zpci_op {
>  /* flags for kvm_s390_zpci_op->u.reg_aen.flags */
>  #define KVM_S390_ZPCIOP_REGAEN_HOST    (1 << 0)
>
> +/* Available with KVM_CAP_MEMORY_ATTRIBUTES */
> +#define KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES    _IOR(KVMIO,  0xd2, __u64)
> +#define KVM_SET_MEMORY_ATTRIBUTES              _IOW(KVMIO,  0xd3, struct kvm_memory_attributes)
> +
> +struct kvm_memory_attributes {
> +       __u64 address;
> +       __u64 size;
> +       __u64 attributes;
> +       __u64 flags;
> +};
> +
> +#define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
> +

In pKVM, we don't want to allow setting (or clearing) of
PRIVATE/SHARED attributes from userspace. However, we'd like to use
the attributes xarray to track the sharing state of guest pages at the
host kernel.

Moreover, we'd rather the default guest page state be PRIVATE, and
only specify which pages are shared. All pKVM guest pages start off as
private, and the majority will remain so.

I'm not sure if this is the best way to do this: One idea would be to
move the definition of KVM_MEMORY_ATTRIBUTE_PRIVATE to
arch/*/include/asm/kvm_host.h, which is where
kvm_arch_supported_attributes() lives as well. This would allow
different architectures to specify their own attributes (i.e., instead
we'd have a KVM_MEMORY_ATTRIBUTE_SHARED for pKVM). This wouldn't help
in terms of preventing userspace from clearing attributes (i.e.,
setting a 0 attribute) though.

The other thing, which we need for pKVM anyway, is to make
kvm_vm_set_mem_attributes() global, so that it can be called from
outside of kvm_main.c (already have a local patch for this that
declares it in kvm_host.h), and not gate this function by
KVM_GENERIC_MEMORY_ATTRIBUTES. This would let pKVM select only
KVM_PRIVATE_MEM (as opposed to KVM_GENERIC_PRIVATE_MEM, which selects
KVM_GENERIC_MEMORY_ATTRIBUTES), preventing userspace from setting
these attributes, while allowing pKVM to call
kvm_vm_set_mem_attributes().

What do you think?

Thanks,
/fuad
