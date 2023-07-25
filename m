Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C59761DFC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 18:04:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=dW59zwmr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9MLG6hN3z3cXx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 02:04:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=dW59zwmr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3cfk_zaykdiiykgtpimuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9MKN1JjHz30Ql
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 02:04:05 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-584139b6b03so19313547b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 09:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690301041; x=1690905841;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JzfMU5Qs8JliFSPK4e1C5em4CWxZCGfzp6e2iymS9Yg=;
        b=dW59zwmrsLAamcGnirE6A1LfKT51T61DtWDAOhx4/cSvK3sOAiDmr+BlK4XiPthtzP
         CN9MlQi3HhBVcH71uuUqq+M14CfwGnGPEE/BpfevOBdEFKHG7J0iaICViLaRAky8BhEp
         HFcQ65KDccgqhPQn/ChYInnlcEfq7qr0Ma/Jgkr7SmWI+05vO/bEbUCWl8Rn7I2emovI
         UeVOyMZohBruEuz8fBipp3NgVzf/qbnB/hnqT0XX1CDCZ3KOl7DJQE2yXx50QpLL6+Az
         IlluRAj7yyIarMAgzXmFlQrKZdiqjqFyPfBBVM/tbJmItA4hkVu10uPsnU/tUYfyPMpN
         N63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690301041; x=1690905841;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JzfMU5Qs8JliFSPK4e1C5em4CWxZCGfzp6e2iymS9Yg=;
        b=a7gfggJ1/irtYqXfYlOGIzd8CWUX8wqGXzjeHgUblH0VBF2yN3ifjWusDumRqd2+Tp
         WjyAqu9+6W9RmW49OskiZxAe7MrL0FeacB5l2lrzg3aX+4PVg7y5zH0JCzqIPLxA1XxY
         I0n8zcXpnf5sRdcnxkD3SqrKCfWIjzXk8uEfYpUHpcU49+2qWrv03KSGZ/ocpxoNitSd
         gzeodCqgJFTXa5YaMhRvqbm+/mY7pI+vrujVGTEZMqMQ7DiJW9cH7Pp4uTjigNOp05rP
         IudMbcTeL8SrM3rFApsv1qkHJy6VA5MT9vQDPR+Vgd2+GmE03OdLam+adU+rKeppzB5I
         KPZA==
X-Gm-Message-State: ABy/qLaRvZyS+b3QMMk6oG7j7tBmA0Gj5TvUZIWN+gtkrSCQ4ivucpfj
	k33Uij2IpYKaCADLV120YtWdxxeD9qs=
X-Google-Smtp-Source: APBJJlH1niyzp4cjBeRls9BsaNe03YLK4iKuUQJEO3t7N9JW3OW9U+d5kcfXqA22KUPE/pwVy1vkIiRVphQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:46d4:0:b0:cf9:3564:33cc with SMTP id
 t203-20020a2546d4000000b00cf9356433ccmr81585yba.13.1690301041144; Tue, 25 Jul
 2023 09:04:01 -0700 (PDT)
Date: Tue, 25 Jul 2023 09:03:59 -0700
In-Reply-To: <DS0PR11MB637386533A4A10667BA6DF03DC03A@DS0PR11MB6373.namprd11.prod.outlook.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
 <DS0PR11MB637386533A4A10667BA6DF03DC03A@DS0PR11MB6373.namprd11.prod.outlook.com>
Message-ID: <ZL/yb4wL4Nhf9snZ@google.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Wei W Wang <wei.w.wang@intel.com>
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Chao Peng <chao.p.peng@linux.intel.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "linux-arm-kernel@lists.infradead.o
 rg" <linux-arm-kernel@lists.infradead.org>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Oliver Upton <oliver.upton@linux.dev>, "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, Anup Patel <anup@brainfault.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 25, 2023, Wei W Wang wrote:
> On Wednesday, July 19, 2023 7:45 AM, Sean Christopherson wrote:
> > +int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
> > +		     gfn_t gfn, kvm_pfn_t *pfn, int *max_order) {
> > +	pgoff_t index = gfn - slot->base_gfn + slot->gmem.pgoff;
> > +	struct kvm_gmem *gmem;
> > +	struct folio *folio;
> > +	struct page *page;
> > +	struct file *file;
> > +
> > +	file = kvm_gmem_get_file(slot);
> > +	if (!file)
> > +		return -EFAULT;
> > +
> > +	gmem = file->private_data;
> > +
> > +	if (WARN_ON_ONCE(xa_load(&gmem->bindings, index) != slot)) {
> > +		fput(file);
> > +		return -EIO;
> > +	}
> > +
> > +	folio = kvm_gmem_get_folio(file_inode(file), index);
> > +	if (!folio) {
> > +		fput(file);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	page = folio_file_page(folio, index);
> > +
> > +	*pfn = page_to_pfn(page);
> > +	*max_order = compound_order(compound_head(page));
> 
> Maybe better to check if caller provided a buffer to get the max_order:
> if (max_order)
> 	*max_order = compound_order(compound_head(page));
> 
> This is what the previous version did (restrictedmem_get_page),
> so that callers who only want to get a pfn don't need to define
> an unused "order" param.

My preference would be to require @max_order.  I can kinda sorta see why a generic
implementation (restrictedmem) would make the param optional, but with gmem being
KVM-internal I think it makes sense to require the param.  Even if pKVM doesn't
_currently_ need/want the order of the backing allocation, presumably that's because
hugepage support is still on the TODO list, not because pKVM fundamentally doesn't
need to know the order of the backing allocation.
