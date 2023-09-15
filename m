Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AF47A28F5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 23:06:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Ao+/0aMm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnRZ10n4Lz3dG1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 07:06:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Ao+/0aMm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::c49; helo=mail-oo1-xc49.google.com; envelope-from=3gccezqykdogcokxtmqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc49.google.com (mail-oo1-xc49.google.com [IPv6:2607:f8b0:4864:20::c49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnRY96H0Pz3bbW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Sep 2023 07:05:32 +1000 (AEST)
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-5733fc73957so3695880eaf.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 14:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694811929; x=1695416729; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yleJC+7YBNlUjlYVNZzM9vt9cQFuPW3G+hVjyHJnwaw=;
        b=Ao+/0aMmIfYTa5EQViSctF6XPWZg4qQIQ9mtcjgyJ95CPUJBtpA4FeojsnKJa0QuPr
         kTdqP66D9/qL6kbCxpRG8I2EtA+u5P5K7CONuvGGJW+1LO0k1W8J6VLDjWIJzQeFn+IA
         SdTnzdh+YE+6WNtwtBY9JFGQ4gEAhXSVaLcS+10rUyyAG3voHwciDQdcLlptTMvtHk87
         dg5kNnTW9Hb9J9Py/hjI95Z+v07H8UZWcBnGCgKMsbZewao9zmGF7E+sCwUY+qLdVRnO
         Mn9BDjTNyrRGF6a6SoLzOVLgjup01+tg21dUu1LI++JCOuGPbFZUjgG7HVeZ7dwot9qA
         /GFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694811929; x=1695416729;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yleJC+7YBNlUjlYVNZzM9vt9cQFuPW3G+hVjyHJnwaw=;
        b=qh3S04ofAYb3SRLb/S+JW1cV3IQbhFsr4z9rxwUBLAJOH2gajOc7rDcDY78aaJa+Cu
         GfW8FK2Rk5XDNnHiT4N33D1LHOjecu9ZlILAjG7wHQM6lz+dTRsY72lsdvLHYWqY+8Zw
         +SJ1W1EVVUVoMiO1ebKVt2i31oveMNLs3YaKLIsdBFe/RhvQiOyOKzN/4OFtaFA/T7cX
         Kw9MjQH8Sdjofj/J9qsXduelfUg4nsDpkby58M4XvdWtOEdVHwBhDgcvop9JI74qo+B1
         +dPt52xq+dSY8xznqyOCMYkZ4kp1U5v+IL0pUcJGujXkxfULrrogijJpWqf+Nv/N/CKS
         HMqQ==
X-Gm-Message-State: AOJu0YwksvvbVAw2Voqz/kil52oBk2XHTv+uqI/ruTT19EkKKzhS+l55
	OWbSGOgJYywhMb2PnMZ21q9PLs32cCQ=
X-Google-Smtp-Source: AGHT+IF9PpTOkzcgimAJrduyF4qwfWt2KP5EbzIhLTMy/s4gm21Ep/5FIgTjRytGlNZlubXZjpDBAQBvLB0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a4a:2c02:0:b0:571:1762:7718 with SMTP id
 o2-20020a4a2c02000000b0057117627718mr908496ooo.1.1694811929595; Fri, 15 Sep
 2023 14:05:29 -0700 (PDT)
Date: Fri, 15 Sep 2023 14:05:27 -0700
In-Reply-To: <d4166c97-6ab3-89a2-eb12-f492f7521f69@intel.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-2-seanjc@google.com>
 <d4166c97-6ab3-89a2-eb12-f492f7521f69@intel.com>
Message-ID: <ZQTHF3J+6FXwRx98@google.com>
Subject: Re: [RFC PATCH v12 01/33] KVM: Tweak kvm_hva_range and hva_handler_t
 to allow reusing for gfn ranges
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@orac
 le.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 15, 2023, Xiaoyao Li wrote:
> On 9/14/2023 9:54 AM, Sean Christopherson wrote:
> > Rework and rename "struct kvm_hva_range" into "kvm_mmu_notifier_range" so
> > that the structure can be used to handle notifications that operate on gfn
> > context, i.e. that aren't tied to a host virtual address.
> > 
> > Practically speaking, this is a nop for 64-bit kernels as the only
> > meaningful change is to store start+end as u64s instead of unsigned longs.
> > 
> > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >   virt/kvm/kvm_main.c | 34 +++++++++++++++++++---------------
> >   1 file changed, 19 insertions(+), 15 deletions(-)
> > 
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 486800a7024b..0524933856d4 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -541,18 +541,22 @@ static inline struct kvm *mmu_notifier_to_kvm(struct mmu_notifier *mn)
> >   	return container_of(mn, struct kvm, mmu_notifier);
> >   }
> > -typedef bool (*hva_handler_t)(struct kvm *kvm, struct kvm_gfn_range *range);
> > +typedef bool (*gfn_handler_t)(struct kvm *kvm, struct kvm_gfn_range *range);
> 
> Is it worth mentioning the rename of it as well in changelog?

Meh, I suppose.  At some point, we do have to assume a certain level of code
literacy though :-)
