Return-Path: <linuxppc-dev+bounces-13175-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 304CEBFDF89
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Oct 2025 21:08:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csJc25SYcz30RJ;
	Thu, 23 Oct 2025 06:08:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::54a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761160130;
	cv=none; b=QlUTNIp43O8QqZjWSq5CZWF86dPrlksB+3mkO6wy3ZKd/EDp2fCRFo55SBcFutb3Uag7i80j0P58Rb8f+eiYhDvUqxCuEkc8+BTpfA7G7HN0bc9XA63/OuYyRIh+ptvnLHjTfUYxQihiQOXOOF1uTpkcdu5AHCpQy3z9e/UnVS8Q3D718lweLlb1IdgzTEaGUMEx4DUErTYa2qI0LJ6NuH176+XubXemdjxt0E0hgW2Zraasz7IUjKGQEbZDAcn3iEg0lUy/NseI6vn5V04AJu+k3Rv8J1L3TpYZIYWyRnpVcgkgkEb/bPo95KOa5M8diCZHpP5la36kEqjo7TZNBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761160130; c=relaxed/relaxed;
	bh=wREzy7rE27X1qKmfXOWprRl7YFBX8aFkFx3LWlFCsNc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e5uvvgF83j9/4MIQNxIfZqUM6G4uiPtQ0sbU8enlgV9+Nk6jBFa4sbLjG8C9rjQ6r0NmzdcX5sb6YY+HryT9wzV7mxovjgZgGFYXsYngfXf4RwQaqR+IQT1+CQYf91yebI6XSuSOgqzPwo7LhyJ/BwfCQv9ucTm9GrG/fCKSSLs4rVhmv+osvWgGh25g32QwnjV9EN1t2H9w0kPQ+uHcxx+fi5HTRiR5OA/+zWWbVWMLe1MOZXQKM1hNXeJ1bfqY/zHFKZb8UYiUpvrmgdULmv3dfR99Y5BfhN3nZp/FNACYY4rt1WwynBHJHkk7lkcj9rFGQ3WKHx/ouXacqDKtWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=PnWrWuVx; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3vyv5aaykdeo4qmzvos00sxq.o0yxuz6911o-pq7xu454.0bxmn4.03s@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=PnWrWuVx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3vyv5aaykdeo4qmzvos00sxq.o0yxuz6911o-pq7xu454.0bxmn4.03s@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csJc167F7z2yyx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 06:08:49 +1100 (AEDT)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b6ce1b57b3eso1411550a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 12:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761160127; x=1761764927; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wREzy7rE27X1qKmfXOWprRl7YFBX8aFkFx3LWlFCsNc=;
        b=PnWrWuVx9IhmSbtzKwCWDRKD/+Ng6pczLmJJgei1rghHolNJDDcdm0yflmIR4wVb83
         Gs8T7A4iiOrfjRIlAiNXvbZU5lCyA20iwhBC2RfyM8DpbR/Rg0ZHvO/42hrB/t5eC6CJ
         2zVBSJgm8yauTE2HMpBKg5B+IZJscJ2/qDZM4tDr7fHgG7wG6dKj6KThGV0I+o/jtV6h
         z26qcURmVMzlPz5CC8mdWAU35OhSGQaDHz9UTMTatvHU7Bf8LMZhUEbluVgz6zUj2WSl
         rKgWFcIZzt8aLaF0V9RX9bgB6Zq2T+WY+zWeWrrXMjplz6ocV4lZvW4ZSzcj2h6UEUyS
         8t/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761160127; x=1761764927;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wREzy7rE27X1qKmfXOWprRl7YFBX8aFkFx3LWlFCsNc=;
        b=WaLYEhFEVdryc3kKo3oD+7dI37aY9vPxheZaSgocShdKnsSeSBmlbxLrV+4bD9ls/U
         k9Lff//H5V/bDnUUrpko6jwSC47cCdlz6i5+jDW3JV6b6GLgZIJVri0Qad7e6nmY8WHb
         Jm1KuwjMr2Zxp/2ZHVPjgJl8CMqKu5LAh0mfgqx9+jiaIqG3r7qt8PtXQB/5qux7IMda
         PbPqO8SsZE9+I5qg1m784WKcrvJeOKUIIeJuBcRFPyEPtYU1/x++b9jv25GG3EhrPUq4
         4BT7TaItqENbKK4tZJWcpJ9yET57wtgXKWGRUt5znQbTxZ+zRaXQV+S//nK8PM1vS2QA
         rpnA==
X-Forwarded-Encrypted: i=1; AJvYcCUsL6Oqt5giFTQubkPL9pmrnU5jMwdRAJoLDVNwy0ZeOPZPULAMshjsyFHm/hcYDw78Pq/8XQ6TdU/kXlc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwmG+mU3UmMIo9d7Pj4kCjl0oT/NTFrWEzo8xjbmX/cblhnj5Hd
	51HJwW1g53FfaK/46xa29b+SnW4UISPJ4xXD7BCxiXzLueBJbHfOlL1upikXTENY6TixR7fveoQ
	yTyMYhQ==
X-Google-Smtp-Source: AGHT+IG7bMbvOV7PjecaO9CgeAeXZcwC+wb3hcO8vOg4iH6Jor9tS/5vQmEcVRzTkSnVuCY2g2HzBv4NWV8=
X-Received: from pjbpc16.prod.google.com ([2002:a17:90b:3b90:b0:330:9870:9f18])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:218a:b0:2e5:c9ee:96fa
 with SMTP id adf61e73a8af0-334a861743bmr28027967637.34.1761160127099; Wed, 22
 Oct 2025 12:08:47 -0700 (PDT)
Date: Wed, 22 Oct 2025 12:08:45 -0700
In-Reply-To: <aPiZ2DEQ6qW5r5rY@yzhao56-desk.sh.intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-11-seanjc@google.com>
 <aPiZ2DEQ6qW5r5rY@yzhao56-desk.sh.intel.com>
Message-ID: <aPkrvWcm3JF9WlVd@google.com>
Subject: Re: [PATCH v3 10/25] KVM: x86/mmu: Drop the return code from kvm_x86_ops.remove_external_spte()
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Michael Roth <michael.roth@amd.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 22, 2025, Yan Zhao wrote:
> On Thu, Oct 16, 2025 at 05:32:28PM -0700, Sean Christopherson wrote:
> > Opportunistically pass the spte instead of the pfn, as the API is clearly
> > about removing an spte.
> >From my perspective, "remove_external_spte" means removing an external SPTE (not
> a mirror SPTE). So passing in pfn_for_gfn seems reasonable as well.
> 
> Additionally, passing in the pfn eliminates potential concerns about incorrect
> spte content.

No, it just makes bugs harder to debug.  E.g. it doesn't magically guarantee the
@pfn matches the pfn that was mapped into the S-EPT.

> > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> > index 48598d017d6f..7e92aebd07e8 100644
> > --- a/arch/x86/include/asm/kvm_host.h
> > +++ b/arch/x86/include/asm/kvm_host.h
> > @@ -1855,8 +1855,8 @@ struct kvm_x86_ops {
> >  				 void *external_spt);
> >  
> >  	/* Update external page table from spte getting removed, and flush TLB. */
> > -	int (*remove_external_spte)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
> > -				    kvm_pfn_t pfn_for_gfn);
> > +	void (*remove_external_spte)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
> > +				     u64 spte);

Thinking more about what "spte" actually tracks, I think I'll rename it to
"mirror_spte".

> Also update set_external_spte?

Ooh, yeah, good call.  And we can use the mirror_spte information to assert that
KVM expects full RWX permissions, e.g. that we aren't creation a security hole by
letting the guest write memory that KVM thinks is read-only (extreme paranoia,
more for documentation purposes).

