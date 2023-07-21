Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18ED075D0CC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 19:42:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=DoHzE6IB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6xj474HKz3c5X
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 03:42:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=DoHzE6IB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3pmo6zaykdnkn95ie7bjjbg9.7jhgdipskk7-89qgdnon.jug56n.jmb@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6xgP1gyFz3cCn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jul 2023 03:41:19 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-cf4cb742715so2061952276.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 10:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689961276; x=1690566076;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0EsEuc6ZrLkBpjfXrbTj3wl8CGw2RCGPAyUMK4WwkjA=;
        b=DoHzE6IB/gTaLmkueM9yb30EUG6tzOb2A5AXrz9PQw1Ifq3ks790NG9A8kHnulrV92
         RNCrZzNkmPOc83fANNDf5nXf1wPVFL2y5FNAhz+fPjDVllxc5Oizeq9OoCoSO3jrCWPO
         Fdo3zuU1ITNzecPSKDNY0XL2xmTCfJibF/rCjlkemXFUh+Sr371B5TqkScdP+lHN0Bsv
         l8bJ71cW4eJgHOkXZEVFnapIkfHWHqvRivBGgXBk81wx3rhHxJzYdjltDTwHbRDPypPU
         FqCvfBjArc5TGgWA7G3s9Jm2aOIc06rnT78obfljmzEALSkpFg35cZZdMznfZTRdtzpx
         x88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689961276; x=1690566076;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0EsEuc6ZrLkBpjfXrbTj3wl8CGw2RCGPAyUMK4WwkjA=;
        b=QEbQ9C7H7UAYq4Z2hY8x+FzrcDMFsmOhgMiyOvX5d/MzYBIyMD7mdrtWTek+tEOjLh
         kOBLNi8fm2wJRXUnIdLZDe8DTymms59vbYgqmb01n6NZaJY1SFcP4z327SqK6VPau2ex
         V96A0M09a6fn5YNf7AKE7ICV1GQEcJMfWBOllPFnAE7VbqK+Z08ceAE9V+Zl5hU3Gc5g
         BvudGAvK1TdfygTQo9dTCmVy9+RXS5MxDa4xwadz60P5xmAO7xmCFUs8Na+cgpR4OJVj
         MSek112SheqzfPsaueggS7vxGTM3+IKswn/hM0E+5serOu9WdV9VOmGnoda+Ime4dEaI
         6RQQ==
X-Gm-Message-State: ABy/qLaoXH4kKj7mhSdAEEOYzcUE2IQhIAIFfbfmmi6DYACBMO/8PnOc
	pW8uQ4tnytU9DgVdw0kc3ObU3vbk2HA=
X-Google-Smtp-Source: APBJJlFxyzDv1jxbiR1ec3ea79Hb3YohAr96lgMadcKGyfL8Br8SJoCJpXRoXSNCjiu8EtZhgF/6XBpHBow=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:4f41:0:b0:cb6:6c22:d0f8 with SMTP id
 d62-20020a254f41000000b00cb66c22d0f8mr17638ybb.4.1689961276130; Fri, 21 Jul
 2023 10:41:16 -0700 (PDT)
Date: Fri, 21 Jul 2023 10:41:14 -0700
In-Reply-To: <6118063e-5c91-acc4-129f-3bacc19f25ce@redhat.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-10-seanjc@google.com>
 <6118063e-5c91-acc4-129f-3bacc19f25ce@redhat.com>
Message-ID: <ZLrDOljnluTrt+l+@google.com>
Subject: Re: [RFC PATCH v11 09/29] KVM: x86: Disallow hugepages when memory
 attributes are mixed
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-s
 ecurity-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 21, 2023, Paolo Bonzini wrote:
> On 7/19/23 01:44, Sean Christopherson wrote:
> > +static bool range_has_attrs(struct kvm *kvm, gfn_t start, gfn_t end,
> > +			    unsigned long attrs)
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
> 
> Can you move this function to virt/kvm/kvm_main.c?

Ah, yeah, that's a good idea.
