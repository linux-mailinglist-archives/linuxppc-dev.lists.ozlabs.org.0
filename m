Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 075597A8417
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 15:56:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=0GCnVMcB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrKn969WRz3bw9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 23:55:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=0GCnVMcB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3uvkkzqykdak1njwslpxxpun.lxvurw36yyl-mn4ur121.x8ujk1.x0p@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrKmH3Tkpz2xYt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 23:55:09 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5924b2aac52so89054657b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 06:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695218106; x=1695822906; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0APReAt4bNnnd5kx+NahuCYj0tgbUgwxY6/xmv3q1x8=;
        b=0GCnVMcBO/XLEWkhFR8jICfNlDKw3ydCxvnGpVJVx/H81FgBbWmbdn+K2dnzwndJ1h
         tew3ysu+jDx/NZdlGOGh8XvG2pTPtRPVJELlBfut4JggGjQNZ87woyBhxAzzTMnC6P9k
         YSZ3cSpNLNCS9ad7T2Rs8zwgqfREsIJtnw85sOEgCLpxIODOKBAERmmZyp+pbKR/ioFw
         rsRC4xzFChasYy+NfN95ZnKcS5dfBBJ5M4B5lvYkeMbpmFhm5IFPTpxqWqhE3Ia53Mmb
         GKnn1X9NXtWLALJMdA7XkT6JO+n9F6uynY2bCfGWY/Nyes4TYDYve4qRFLmQI6eOGS+W
         S+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695218106; x=1695822906;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0APReAt4bNnnd5kx+NahuCYj0tgbUgwxY6/xmv3q1x8=;
        b=iG6qlmhckqhC+7ntot/EQp7Z0Aaer04KE7F/I+JpoGiSS4iX7hTuQiLsafA7+e2sYo
         /ZLvJE38ynBcVQpv/nbIPEdYGsPurUNc2G2MRnY5u9icp5OhPqRE7nLcjP5TnS0hUt/8
         siwXh6hPiloLBuwjTe3dlQ7+toTM1zLoJj3/m6G56MyTXoR+vXSDB5HsJ7i8GnRUp6H0
         hC58/N2fSZA7+yu0ijE3wyHfjYlzlIrnk19xMKgwv6sK896UQC4X03mqdP0YcchB9Q3o
         oYFLzKMFVHog2LLoC+e0ugSI0A07634RiOWuiXYKbEKXFVbBW5OKH9dJ+RRZ1mf7rPIp
         Ol3Q==
X-Gm-Message-State: AOJu0YwVHx/pJUMnRjkts2NRa5XRyMWRG0z7KwPUxfEOPc6fRrz4ZyCr
	r3k12tEN9CcjBYSIiwLXFhJEOA0AD9Y=
X-Google-Smtp-Source: AGHT+IHuQ24Hy0wlZqpKThD2hndi3rYWapG+J/d1L/ai4z7W/k7rmZdxNg2zwHr4zmYKJTJyjaSKmjFgB/U=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:ae57:0:b0:59b:ee27:bbe9 with SMTP id
 g23-20020a81ae57000000b0059bee27bbe9mr35901ywk.9.1695218106527; Wed, 20 Sep
 2023 06:55:06 -0700 (PDT)
Date: Wed, 20 Sep 2023 06:55:05 -0700
In-Reply-To: <ZQqMBEL61p739dpF@yilunxu-OptiPlex-7050>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-3-seanjc@google.com>
 <ZQqMBEL61p739dpF@yilunxu-OptiPlex-7050>
Message-ID: <ZQr5uXhV6Cnx4DYT@google.com>
Subject: Re: [RFC PATCH v12 02/33] KVM: Use gfn instead of hva for mmu_notifier_retry
From: Sean Christopherson <seanjc@google.com>
To: Xu Yilun <yilun.xu@intel.com>
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
 le.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 20, 2023, Xu Yilun wrote:
> On 2023-09-13 at 18:55:00 -0700, Sean Christopherson wrote:
> > +void kvm_mmu_invalidate_range_add(struct kvm *kvm, gfn_t start, gfn_t end)
> > +{
> > +	lockdep_assert_held_write(&kvm->mmu_lock);
> > +
> > +	WARN_ON_ONCE(!kvm->mmu_invalidate_in_progress);
> > +
> >  	if (likely(kvm->mmu_invalidate_in_progress == 1)) {
> >  		kvm->mmu_invalidate_range_start = start;
> >  		kvm->mmu_invalidate_range_end = end;
> 
> IIUC, Now we only add or override a part of the invalidate range in
> these fields, IOW only the range in last slot is stored when we unlock.

Ouch.  Good catch!

> That may break mmu_invalidate_retry_gfn() cause it can never know the
> whole invalidate range.
> 
> How about we extend the mmu_invalidate_range_start/end everytime so that
> it records the whole invalidate range:
> 
> if (kvm->mmu_invalidate_range_start == INVALID_GPA) {
> 	kvm->mmu_invalidate_range_start = start;
> 	kvm->mmu_invalidate_range_end = end;
> } else {
> 	kvm->mmu_invalidate_range_start =
> 		min(kvm->mmu_invalidate_range_start, start);
> 	kvm->mmu_invalidate_range_end =
> 		max(kvm->mmu_invalidate_range_end, end);
> }

Yeah, that does seem to be the easiest solution.

I'll post a fixup patch, unless you want the honors.
