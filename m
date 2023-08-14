Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4008C77C2D8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 23:55:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=WyQ6Tn/5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPp9Y1GTlz3cNV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 07:55:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=WyQ6Tn/5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3mqlazaykdhcnzviexbjjbgz.xjhgdipskkx-yzqgdnon.jugvwn.jmb@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPp8d0gJNz30fF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 07:54:39 +1000 (AEST)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-55c964d031aso8936777a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 14:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692050074; x=1692654874;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WLV8cwl+q0+MgeCaKnjEbSXBm+ijn/cuT9eg2QvMQy8=;
        b=WyQ6Tn/5h37xMsEIDmbWcY+nQiTqqFoftlXVBTiztMb2A7vinkou0FyJxT5Tj+pa31
         3y4mktmY47itqZcGsKCOeUubQi9MQwPyYS/ntrx9oV/jIdUAoZkwRuGY0yw403B+hUV5
         PyUzYrySs29/O30p+yDsELGRzby+1aqFcxoBBJ6omQFPygNitIVTJAp2Hnd4R0/QcY2H
         EgizfgVBfhm/BlB4owWFjSnqlPuhKRjVS+MvDjPpwOsN8USa7haRJjhrCn+/9m5M/b9b
         HnVauoeuLnwYhNy2SBnjlv/xkJdMMlVKqHESswng1uUarqPNC4oB5B1VogZQC9cpA3Kv
         gLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692050074; x=1692654874;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WLV8cwl+q0+MgeCaKnjEbSXBm+ijn/cuT9eg2QvMQy8=;
        b=U86T9Bnc09KCMSyc4eGh90ZZQo19qJ+5zoHYHL882suLK2YwjJ1MfM4lFP5KoLm5Gi
         jFrIrJcx5/i/9q6me8v3x41QyvoeZh0q7RRIYDCuka/GGD1YpWX0CgoktRPG0xOXZl/9
         PNqjI7P4uvcEcGAi0vjuTjkRenwI+1kytCVvWlblgpV+NXjg5xls19vlJFMWgI2I4Dbk
         eDVdOlMKWJDysRYR680ADRlqnpJS1ra8+ZR8rZBvRo3lJ8sAgt3TqqDJ0YDcaZuwpNfo
         22uq3x8ey3KZq8W3VFLNtVLm34DP/Hp2isSUcCJiv7y8JGCJTCb1AI4dn/IvFqXhrPqS
         AJGg==
X-Gm-Message-State: AOJu0YyeHsTlsiUALgl1wdCKWAkHzT0Ye4PxnV73ROgQ02TjJUv/qtU4
	jAeSRlYBd/g9RUvfz+fKhxJNFu41YJg=
X-Google-Smtp-Source: AGHT+IGPzyG2ye2a1feyqcG86dyCHC82qzx5i2/p6ALHRmr0rfFoFMM8MlFz9jxGz9wjwtqC3ppaRbddXVE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:9f12:0:b0:565:3355:87b0 with SMTP id
 g18-20020a639f12000000b00565335587b0mr2044577pge.5.1692050074189; Mon, 14 Aug
 2023 14:54:34 -0700 (PDT)
Date: Mon, 14 Aug 2023 14:54:32 -0700
In-Reply-To: <02239d95-0253-a223-28c2-016cca3ab4d2@linux.intel.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-9-seanjc@google.com>
 <02239d95-0253-a223-28c2-016cca3ab4d2@linux.intel.com>
Message-ID: <ZNqimGhCD+70q/lG@google.com>
Subject: Re: [RFC PATCH v11 08/29] KVM: Introduce per-page memory attributes
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver
  Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 14, 2023, Binbin Wu wrote:
> 
> On 7/19/2023 7:44 AM, Sean Christopherson wrote:
> > +	struct kvm_mmu_notifier_range post_set_range = {
> > +		.start = start,
> > +		.end = end,
> > +		.arg.attributes = attributes,
> > +		.handler = kvm_arch_post_set_memory_attributes,
> > +		.on_lock = (void *)kvm_null_fn,
> > +		.on_unlock = kvm_mmu_invalidate_end,
> > +		.may_block = true,
> > +	};
> > +	unsigned long i;
> > +	void *entry;
> > +	int r;
> > +
> > +	entry = attributes ? xa_mk_value(attributes) : NULL;
> Why attributes of value 0 is considered not a value? Is it because 0 is not
> a valid value when RWX is considered in the future?

0 values don't require an entry in the xarray, i.e. don't need to be stored and
so don't consume memory.  The potential conflict with a RWX=0 entry has already
been noted, but we'll cross that bridge when we get to it, e.g. KVM can easily
support RWX=0 by using an internal "valid" flag.

> Both the changelog and the document added mention that the address and size
> of attrs will be updated to
> "reflect the actual pages of the memory range have been successfully set to
> the attributes", but it doesn't.

Yeah, on the todo list, all of the changelogs are horribly stale.
