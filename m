Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF317ADDE5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 19:38:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=mGP9/qPb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvVTn07X1z3c5b
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 03:38:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=mGP9/qPb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3z8urzqykdggykgtpimuumrk.iusrotadvvi-jkbroyzy.ufrghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvVSr3jj4z3byL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 03:37:47 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5a1d352a86dso12107417b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 10:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695663464; x=1696268264; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4OSNJSuzGEyn2eFVxut8UHIn8mk8UoHB1vJTBDeWUjg=;
        b=mGP9/qPbX07ArWSsQQ6oKlCSREzzGAuQAEm8v7sopCKysgzMpFo+kz2ymVFBwE4ANG
         86Xtzq1ETJ+yRw8XTkYfqHqL/2iXc1T0eV959k6Cm9UoyWiFDKbk4+SBRxPMCH7lvt9i
         eqN5YqoBS1nhw33lx9U3+/E5FIbAxPi7HSHf6SW/FxO6K8Ua6NHyIq2gVZ0TcjjNUJiJ
         OpvES/pmfStgcbsWDeFzOb7RiTq1PGdkJQmJfv0PSKptHjivB7vCyzsi0di2uIs3kOvA
         sa/sDUqNPKiY1PnfRG9YA6llRsRpTotWLtjvcVlG9MyRnUqe1Isrfax48MFyWH+1rrtL
         vYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695663464; x=1696268264;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4OSNJSuzGEyn2eFVxut8UHIn8mk8UoHB1vJTBDeWUjg=;
        b=X8V2Eo/wXSc54Ndv3udFYXPq6n+K95Jblo7tApiPv9oHdzkd9egPzRDZ+D+TEBJkYy
         6Oh7wNAXgjDX+0UCBGHBoKA4CZawC3kqGMcRdpMbUIrgCnCC9ZnzD8vx9Snhcjy2QQIQ
         TfSTur43uTBNYmL8QcpCrgtY4MUcrp3NxxmCL2VvN35+7L/MpjDNWuxXmK94WUzr9V72
         Q7g7HAQu1QyY1+NYYuqljdPnbZAvtQC87WVye7czVCvZ8k8GcGzO5O66V8cXIXpTh55I
         /orx3kav50ThJcnhr0V/uJB5Z2vB5ZPzXJahsS/x7bm7V9HGSuH5ae3PXogoNB9W38RE
         jZQw==
X-Gm-Message-State: AOJu0Yy2R+Qpzyn8T+MT+8v+2K1dRYXiXKPH7mdf6i/mV3WR7zerW/uT
	xNd1vwV0TM2cfoWkCSh6Nk0nQ/t1T0M=
X-Google-Smtp-Source: AGHT+IFbdNqdQBINXaKsxLFNsbPAlNsb64v79jTXlms6OpZDsyyWIMsDvfLKOISLOkUltg3c0KbHgHQxQwM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:abac:0:b0:d81:fc08:29ea with SMTP id
 v41-20020a25abac000000b00d81fc0829eamr67094ybi.2.1695663463860; Mon, 25 Sep
 2023 10:37:43 -0700 (PDT)
Date: Mon, 25 Sep 2023 10:37:42 -0700
In-Reply-To: <ZQuahXpq2fy8rMDV@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-12-seanjc@google.com>
 <ZQP6ZqXH81V24Lj/@yzhao56-desk.sh.intel.com> <ZQtdZmJ3SekURjiQ@google.com> <ZQuahXpq2fy8rMDV@yzhao56-desk.sh.intel.com>
Message-ID: <ZRHFZmaa/6HQnZD1@google.com>
Subject: Re: [RFC PATCH v12 11/33] KVM: Introduce per-page memory attributes
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
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

On Thu, Sep 21, 2023, Yan Zhao wrote:
> On Wed, Sep 20, 2023 at 02:00:22PM -0700, Sean Christopherson wrote:
> > On Fri, Sep 15, 2023, Yan Zhao wrote:
> > > On Wed, Sep 13, 2023 at 06:55:09PM -0700, Sean Christopherson wrote:
> > > > +/* Set @attributes for the gfn range [@start, @end). */
> > > > +static int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> > > > +				     unsigned long attributes)
> > > > +{
> > > > +	struct kvm_mmu_notifier_range pre_set_range = {
> > > > +		.start = start,
> > > > +		.end = end,
> > > > +		.handler = kvm_arch_pre_set_memory_attributes,
> > > > +		.on_lock = kvm_mmu_invalidate_begin,
> > > > +		.flush_on_ret = true,
> > > > +		.may_block = true,
> > > > +	};
> > > > +	struct kvm_mmu_notifier_range post_set_range = {
> > > > +		.start = start,
> > > > +		.end = end,
> > > > +		.arg.attributes = attributes,
> > > > +		.handler = kvm_arch_post_set_memory_attributes,
> > > > +		.on_lock = kvm_mmu_invalidate_end,
> > > > +		.may_block = true,
> > > > +	};
> > > > +	unsigned long i;
> > > > +	void *entry;
> > > > +	int r = 0;
> > > > +
> > > > +	entry = attributes ? xa_mk_value(attributes) : NULL;
> > > Also here, do we need to get existing attributes of a GFN first ?
> > 
> > No?  @entry is the new value that will be set for all entries.  This line doesn't
> > touch the xarray in any way.  Maybe I'm just not understanding your question.
> Hmm, I thought this interface was to allow users to add/remove an attribute to a GFN
> rather than overwrite all attributes of a GFN. Now I think I misunderstood the intention.
> 
> But I wonder if there is a way for users to just add one attribute, as I don't find
> ioctl like KVM_GET_MEMORY_ATTRIBUTES for users to get current attributes and then to
> add/remove one based on that. e.g. maybe in future, KVM wants to add one attribute in
> kernel without being told by userspace ?

The plan is that memory attributes will be 100% userspace driven, i.e. that KVM
will never add its own attributes.  That's why there is (currently) no
KVM_GET_MEMORY_ATTRIBUTES, the intended usage model is that userspace is fully
responsible for managing attributes, and so should never need to query information
that it already knows.  If there's a compelling case for getting attributes then
we could certainly add such an ioctl(), but I hope we never need to add a GET
because that likely means we've made mistakes along the way.

Giving userspace full control of attributes allows for a simpler uAPI, e.g. if
userspace doesn't have full control, then setting or clearing bits requires a RMW
operation, which means creating a more complex ioctl().  That's why its a straight
SET operation and not an OR type operation.
