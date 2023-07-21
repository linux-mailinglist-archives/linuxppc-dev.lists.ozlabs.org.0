Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A494275D78E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 00:34:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=N3JmIIRF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R749F41Y2z3c4C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 08:34:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=N3JmIIRF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3rqe7zaykdnqi40d926ee6b4.2ecb8dknff2-34lb8iji.epb01i.eh6@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R748K3jPdz3bX5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jul 2023 08:33:19 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-573d70da2dcso24458287b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 15:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689978797; x=1690583597;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7T9EVRBobAr4a8JPgfiIjIX72kF/VyhERBKOIDOEvTo=;
        b=N3JmIIRFuucWrTRji2j76NW5FMl4jS4wLA3POQW0VLRrR4sFhmKgj7pRUj3gSs0yqe
         WZvjiVqpyglaAnq94LWefXiOIlgXr/PrbktD6W+TBAFf6s+alvi+gxgQyH8TNpVAsODx
         OCRkSmym8Xr89af+taUXT0Vhz6Xh0SqYzK++E+LxDlItaWIfk/xiv3hy/q9bOsyCLBei
         XOyxBMd+5ThifDUK6/o5f+QTqfW/eyfYM90Y+kU5f1e/gaMgZLzn2OVn9bd0Flf7Aat3
         ovp2GWeXuTu2BrzRvrwJog7aZBAUD7Ob8wE6NUPaB8bQmPi6OopUS5w2j6M71SZpRLW7
         K0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689978797; x=1690583597;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7T9EVRBobAr4a8JPgfiIjIX72kF/VyhERBKOIDOEvTo=;
        b=i2UQXA82ifgEOq49Ic+1CXAyanFc4ifxfpUgMxZw2Brz1srloJTJ1KfJA3C4zDdZXG
         WNeCXv7GX9T5L9kDE5FdRGYoCmHboyE4g20HAUSqBqfPzqRzIeZbExbXTf/G3/lVAvzS
         s6CWfFi0DwoV0NT5JOxkrSVXoOCVRZctSRqwCdxC46qmu68f61G/ayAHyf1SECBYcNTs
         NzFFDZP3u+Y0NTJoAJ+0WqOlGybRoeUXVggeauWBGdSAsQTmG1h6rzEuP1ZgTVECD5SP
         p9rVtk9Hd1RC/YHAOA1NmTQDBubYcJTx0eoORGY06dM6XJMZkxpC3HKVGhSDBaRBcuYU
         EKbQ==
X-Gm-Message-State: ABy/qLYrV3wWPZKO11pLnzTHen2CpPf7hA9r9y3e/rpW116wbstoVBaL
	otWumMGsb+DYVp5YzWYW0nyPGQ8ohEM=
X-Google-Smtp-Source: APBJJlHilhePzxpErmYmDQimNKPr2Kn3t6yMJLQXIDH2a2VxS3jSVStiMTfJxkBt/UbXzPR1R9iVHrOiOZs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:ce82:0:b0:d04:faa6:e62b with SMTP id
 x124-20020a25ce82000000b00d04faa6e62bmr11683ybe.6.1689978797172; Fri, 21 Jul
 2023 15:33:17 -0700 (PDT)
Date: Fri, 21 Jul 2023 15:33:15 -0700
In-Reply-To: <20230721222704.GJ25699@ls.amr.corp.intel.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
 <20230721061314.3ls6stdawz53drv3@yy-desk-7060> <20230721222704.GJ25699@ls.amr.corp.intel.com>
Message-ID: <ZLsHq69sMG7pmRiz@google.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
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

On Fri, Jul 21, 2023, Isaku Yamahata wrote:
> On Fri, Jul 21, 2023 at 02:13:14PM +0800,
> Yuan Yao <yuan.yao@linux.intel.com> wrote:
> > > +static int kvm_gmem_error_page(struct address_space *mapping, struct page *page)
> > > +{
> > > +	struct list_head *gmem_list = &mapping->private_list;
> > > +	struct kvm_memory_slot *slot;
> > > +	struct kvm_gmem *gmem;
> > > +	unsigned long index;
> > > +	pgoff_t start, end;
> > > +	gfn_t gfn;
> > > +
> > > +	filemap_invalidate_lock_shared(mapping);
> > > +
> > > +	start = page->index;
> > > +	end = start + thp_nr_pages(page);
> > > +
> > > +	list_for_each_entry(gmem, gmem_list, entry) {
> > > +		xa_for_each_range(&gmem->bindings, index, slot, start, end - 1) {
> > > +			for (gfn = start; gfn < end; gfn++) {
> > 
> > Why the start end range used as gfn here ?

Math is hard?  I almost always mess up these types of things, and then catch my
bugs via tests.  But I don't have tests for this particular flow...   Which
reminds me, we need tests for this :-)  Hopefully error injection provides most
of what we need?

> > the page->index is offset of inode's page cache mapping and
> > gmem address space, IIUC, gfn calculation should follow same
> > way as kvm_gmem_invalidate_begin().
> 
> Also instead of sending signal multiple times, we can utilize lsb argument.

As Vishal pointed out, this code shouldn't be sending signals in the first place.
