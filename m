Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AF47A8E21
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 23:01:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BpiPqpAj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrWCz1BPyz3cPN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 07:01:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BpiPqpAj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3af0lzqykdh8vhdqmfjrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrWC34mJVz303l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 07:00:29 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d818e01823aso422656276.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 14:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695243624; x=1695848424; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WD85YU6GCdPtOsLZeVlIeZZfzAYdtoOH/7wu6gyWXNI=;
        b=BpiPqpAj36hhv7mwWfIPnWHPfSBoVniJr0miM9XAkN6V0zGbGQ/fQcMzR0JDrcS03i
         N/GvH9V0yQ8sDe5Drn4z8NmmoFK3GwpQk4wjkJ+iyC0BfISBUQj3ElID9JnhFRjF7C+R
         CHHqiIxzYY9A/YffBUop6kwp29WX4g6iT71Uo2ueyDLLKgr7hJPWKRXHm9I8jn/jdLEA
         RIMRi2NcVrW+AIoxUiRBtTWjm97fZC6sPhMnpn6d7gzshc/nvTr4crBkmqyibgLSfyNr
         H7D4rhDOJThi04I7fmYg7cXSmY2IeaN79zySnvgIxBo78sjnHu5EynCMjhg9lVL/8xIH
         11MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695243624; x=1695848424;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WD85YU6GCdPtOsLZeVlIeZZfzAYdtoOH/7wu6gyWXNI=;
        b=PHCs7YEI6DMYX9/qHes84apkrDe3YDfAzkIcKGUAQm81GXzmKxcUwtXSwj5wI8tIrQ
         OEWbmBMzZKQ116kKyf8ZChQQ7PlHhFBkt884BNJFHAmS0nd6voOp1alW1XQn2fI2yjQH
         mkaQRnJXnAIRnt1eBV4BTmRBVAU+h2qxE/7wF/GZPKpQi4HKq/Fyo9jEQHkLp7J6wyk8
         glhNSavV2rea741wl0d0EM5wyE6PvAxrDKBzfDwt9M5aPSTFfCFBjw3WK5/FZsZbQV5q
         ypqUsqJ24ZroKjm9EJWVpUBpkw0HTzc77C5ERLatrb8Exfba7Y6zfxhy6fCeW8b1H9PR
         ZYlw==
X-Gm-Message-State: AOJu0Yy8us4LMdkGhduxT9sPHkAL72ymmhWerlbOc3q9QuZOC9XB/3pP
	IVdti5w99+St3CMcYlH8MTYJrQRQyx4=
X-Google-Smtp-Source: AGHT+IE6bowhyf6hyHthYBPyW6IZfmwFxVZA3ErkF6QZibGvin1ESoG81Vf7MPhR8G5wDRxCxsmQT8EV7w4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:496:0:b0:d7f:2cb6:7d88 with SMTP id
 144-20020a250496000000b00d7f2cb67d88mr58003ybe.13.1695243624102; Wed, 20 Sep
 2023 14:00:24 -0700 (PDT)
Date: Wed, 20 Sep 2023 14:00:22 -0700
In-Reply-To: <ZQP6ZqXH81V24Lj/@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-12-seanjc@google.com>
 <ZQP6ZqXH81V24Lj/@yzhao56-desk.sh.intel.com>
Message-ID: <ZQtdZmJ3SekURjiQ@google.com>
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

On Fri, Sep 15, 2023, Yan Zhao wrote:
> On Wed, Sep 13, 2023 at 06:55:09PM -0700, Sean Christopherson wrote:
> > From: Chao Peng <chao.p.peng@linux.intel.com>
> > 
> > In confidential computing usages, whether a page is private or shared is
> > necessary information for KVM to perform operations like page fault
> > handling, page zapping etc. There are other potential use cases for
> > per-page memory attributes, e.g. to make memory read-only (or no-exec,
> > or exec-only, etc.) without having to modify memslots.
> > 
> ...
> >> +bool kvm_range_has_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
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
> > +		goto out;
> > +	}
> > +
> > +	has_attrs = true;
> > +	for (index = start; index < end; index++) {
> > +		do {
> > +			entry = xas_next(&xas);
> > +		} while (xas_retry(&xas, entry));
> > +
> > +		if (xas.xa_index != index || xa_to_value(entry) != attrs) {
> Should "xa_to_value(entry) != attrs" be "!(xa_to_value(entry) & attrs)" ?

No, the exact comparsion is deliberate.  The intent of the API is to determine
if the entire range already has the desired attributes, not if there is overlap
between the two.

E.g. if/when RWX attributes are supported, the exact comparison is needed to
handle a RW => R conversion.

> > +			has_attrs = false;
> > +			break;
> > +		}
> > +	}
> > +
> > +out:
> > +	rcu_read_unlock();
> > +	return has_attrs;
> > +}
> > +
> ...
> > +/* Set @attributes for the gfn range [@start, @end). */
> > +static int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> > +				     unsigned long attributes)
> > +{
> > +	struct kvm_mmu_notifier_range pre_set_range = {
> > +		.start = start,
> > +		.end = end,
> > +		.handler = kvm_arch_pre_set_memory_attributes,
> > +		.on_lock = kvm_mmu_invalidate_begin,
> > +		.flush_on_ret = true,
> > +		.may_block = true,
> > +	};
> > +	struct kvm_mmu_notifier_range post_set_range = {
> > +		.start = start,
> > +		.end = end,
> > +		.arg.attributes = attributes,
> > +		.handler = kvm_arch_post_set_memory_attributes,
> > +		.on_lock = kvm_mmu_invalidate_end,
> > +		.may_block = true,
> > +	};
> > +	unsigned long i;
> > +	void *entry;
> > +	int r = 0;
> > +
> > +	entry = attributes ? xa_mk_value(attributes) : NULL;
> Also here, do we need to get existing attributes of a GFN first ?

No?  @entry is the new value that will be set for all entries.  This line doesn't
touch the xarray in any way.  Maybe I'm just not understanding your question.
