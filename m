Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D3C75B899
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 22:21:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=mbsHztlE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6PGB3H2pz2ykc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 06:21:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=mbsHztlE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3_za5zaykdd4xjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6PFG0Zvrz3bX5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 06:20:16 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-bd69bb4507eso1031183276.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 13:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689884413; x=1690489213;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=s1/m4T5EZ9UQZdIAs+CFQOUhGGMJn3z6NAlZtvxtssM=;
        b=mbsHztlENnOTDgeCIXRdF8x4x9OfLSlTRQf7EJhk2yHC8ssudjPjJb663muGwwAUde
         HXusCSecX8QAy71He4xwRicW2VAZ7RFVOVmJQZun5eygpfocaFcEhJVdz1DXPqrP14f5
         Q9r/63tqP/iMmto5FytBtXhV7bicbpwNBGhhzc7AVroN6uvn7SvVpiEQCLnIHWcphWhi
         L6PAVpT/JWEQDmjGRRbXmNFkgwEJImoyKV1xDjpLesAAmXECVa9yb/PUNJmSrVHElsLh
         RUk/Cxj/0yokxjf+pISM5EmdcaPLl3odQz7EeG720kJEtO6hviZvCg7ubhY+cpI9tJBr
         NkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689884413; x=1690489213;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s1/m4T5EZ9UQZdIAs+CFQOUhGGMJn3z6NAlZtvxtssM=;
        b=J/hrvTRCbOCxsMNRyKthEB8A5pVmC3DQTUdnmDO0jhTp3fvUoZ0E6Qor4cj1Zo51Md
         qXrYths395C7NCU6+kPrcedelSloQukbWzNHt64ci0ThRL2o2Yrmxgk4SJjFRehfLqn+
         9hQibTqcSXx4KnQc8kbF/6sUNl8GdjGXK6jbY7CDpHfaPkqhWMLOVnhRHoEvHMkhyc1s
         b5W5l6Su4TcRhBQ1JxX6bpqHs2NZfm/ynK+xjuFuWlMVEPhWPf4Ut7PB3riiozAJhmJH
         viHlV9mGMqCXIGafROg8sHG4g61l+Xr7sS4zY6osvK8nSpAkUa4pTjTORqAN50TTNF0z
         Hwqg==
X-Gm-Message-State: ABy/qLYQ9c45+ZNyWLS/rLBhccE3AHmec5DXkR0TdBndblhRgcFGgL3v
	fsyvO2q1QuaFcmhK1HEIyPv7ZjBy2cA=
X-Google-Smtp-Source: APBJJlHJCm6H269xOtL/2AMirqWxt3kOhxlKiB8lLLwF2CbQnv6wXW7fNhFjFSiI4U52DqkXiLsyKn98s/w=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:4d08:0:b0:c6c:6122:5b69 with SMTP id
 a8-20020a254d08000000b00c6c61225b69mr236ybb.8.1689884413509; Thu, 20 Jul 2023
 13:20:13 -0700 (PDT)
Date: Thu, 20 Jul 2023 13:20:11 -0700
In-Reply-To: <20230720190211.GF25699@ls.amr.corp.intel.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-9-seanjc@google.com>
 <20230720080912.g56zi5hywazrhnam@yy-desk-7060> <20230720190211.GF25699@ls.amr.corp.intel.com>
Message-ID: <ZLmW+9G6EbKLkOOz@google.com>
Subject: Re: [RFC PATCH v11 08/29] KVM: Introduce per-page memory attributes
From: Sean Christopherson <seanjc@google.com>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, Paul Moore <paul@paul-moore.com>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Yuan Yao <yuan.yao@linux.intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton
  <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 20, 2023, Isaku Yamahata wrote:
> On Thu, Jul 20, 2023 at 04:09:12PM +0800,
> Yuan Yao <yuan.yao@linux.intel.com> wrote:
> 
> > On Tue, Jul 18, 2023 at 04:44:51PM -0700, Sean Christopherson wrote:
> > > @@ -2301,4 +2305,14 @@ static inline void kvm_account_pgtable_pages(void *virt, int nr)
> > >  /* Max number of entries allowed for each kvm dirty ring */
> > >  #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
> > >
> > > +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> > > +static inline unsigned long kvm_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
> > > +{
> > > +	return xa_to_value(xa_load(&kvm->mem_attr_array, gfn));
> > > +}
> > > +
> > > +bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
> > > +					 struct kvm_gfn_range *range);
> > 
> > Used but no definition in this patch, it's defined in next patch 09.
> > How about add weak version in this patch and let ARCHs to overide it ?
> 
> It is guarded by CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES.

Yep.  I don't love the ordering, e.g. this patch can't even be compile tested
until later in the series, but I wanted to separate x86 usage from the generic
support code.
