Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDFE7A8E30
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 23:04:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ig6HgbWP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrWHn64zqz3cgL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 07:04:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ig6HgbWP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3nl4lzqykde89vr40tx55x2v.t532z4be66t-uvc2z9a9.5g2rs9.58x@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrWGx3WzPz307h
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 07:03:53 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1c4375c1406so1910555ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 14:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695243830; x=1695848630; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QFTXI1M20f8gmG6BvRAdcxEpoXePrbyr+CokqbvWBWc=;
        b=ig6HgbWPR5QsMZ3/GFuqUggEcB8oHt9PM/X5y3ybtNQkGkosRu0R+ToUoPhaoIEQk1
         q59E+4h+RqhGjwoXebuWWjG5IuMt4tA2Y3U3wr9Z+jimNTOOjglWRI5CQZMeWmiviPnp
         UKiS0ZghzAdQHfzVpPPRuYNc0Gm4kYckd2I6vMqagGbHaX0menmD+OySTQn1M8c9fdPn
         iVmx0i9MA2LWbJ5XZ2dPYw1hnN0JOidS5JD3dkp0jreY7KtCiO1MHr0/THtebChynUcx
         sMBRU9IvuWjK9GCnwL4yrwkWQFjDzFbLXqv2zsrCEiN4eH5FkLy7dZr/47sYDAiirJ19
         YzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695243830; x=1695848630;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QFTXI1M20f8gmG6BvRAdcxEpoXePrbyr+CokqbvWBWc=;
        b=pd+Posh2mYB3SLbuvq9fVoUAy49DADdFkTQKXrHR7jsjQ80jnXjCB4zVanCDWDlzvD
         k8cGiIJB2mf/JylP+Ysymt1dlznZlglTS+D4dCJQI29CAbqJnkA0R8qHovahQtQIJgCY
         Qn60C32eqMobjvOR+7oDzRV4X5xWBC+G32gc+eez16IXFQJ4Q2wxkspFC9jb3KYGwiDB
         HImKLxIFejqdBn/+ME/kHaRGYCyWXWoO0t3Z8PMWTMAHYpG/mwLwiPYjWRg8XohzDRpL
         II4FTfkDl9q3uRwrhsjAi51/TTxlhKUbWOBNzxMJkRJNCJSWQVCh03JUKlLhBHHMjH6y
         JKqg==
X-Gm-Message-State: AOJu0YzQO612/TOb5nxmI/WIfmlbkL6ojX+cdygloLAHYuddkwbNKwfC
	nKRHC/oKNRAmWy0qqmXaiPZ/d8TZLvA=
X-Google-Smtp-Source: AGHT+IH5QBEwnaGAG6ouJVZQG2FiwG4z7ywKiDhgLSOOF+0VMXfLus6G3HR8pg7XpQjZrIgu3wnPZ1Tf/l8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:c407:b0:1c3:411c:9b7c with SMTP id
 k7-20020a170902c40700b001c3411c9b7cmr51568plk.13.1695243830643; Wed, 20 Sep
 2023 14:03:50 -0700 (PDT)
Date: Wed, 20 Sep 2023 14:03:49 -0700
In-Reply-To: <d66795f8-e524-2912-4b71-92ca4ffe8807@linux.intel.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-12-seanjc@google.com>
 <d66795f8-e524-2912-4b71-92ca4ffe8807@linux.intel.com>
Message-ID: <ZQteNbPfx6P3r6B8@google.com>
Subject: Re: [RFC PATCH v12 11/33] KVM: Introduce per-page memory attributes
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
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

On Mon, Sep 18, 2023, Binbin Wu wrote:
> 
> 
> On 9/14/2023 9:55 AM, Sean Christopherson wrote:
> > From: Chao Peng <chao.p.peng@linux.intel.com>
> [...]
> > +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> > +/*
> > + * Returns true if _all_ gfns in the range [@start, @end) have attributes
> > + * matching @attrs.
> > + */
> > +bool kvm_range_has_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> > +				     unsigned long attrs)
> > +{
> > +	XA_STATE(xas, &kvm->mem_attr_array, start);
> > +	unsigned long index;
> > +	bool has_attrs;
> > +	void *entry;
> > +
> > +	rcu_read_lock();
> > +
> > +	if (!attrs) {
> > +		has_attrs = !xas_find(&xas, end);
> IIUIC, xas_find() is inclusive for "end", so here should be "end - 1" ?

Yes, that does appear to be the case.  Inclusive vs. exclusive on gfn ranges has
is the bane of my existence.
