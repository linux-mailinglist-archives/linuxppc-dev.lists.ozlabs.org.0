Return-Path: <linuxppc-dev+bounces-2465-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBF99A71F0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2024 20:09:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXNbt3RfVz2xjM;
	Tue, 22 Oct 2024 05:08:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729534138;
	cv=none; b=Ld3yzYZLakzpe/3CSLPqlyApuL+QzSTgoiLdsXn1LDt5ei7Pj0LQbJMCvIPKNN4T/2XcqKnWP/zXqJo/Rs5BJNdpJFdQes5//CLSlPq25rXU9NlpV+3hhIhGY+XUoAbUQxYSJFUaJdC27tddxrB21UqLXfaDcryUj/6tqvIK0IF5owFfNm52Qd5SLV3pVZyYik2sF5vnXV1Uvxnae3xWmpcPN8IFvTISGCIfOGGaB3Nae7TXnqGA7brcrq+Zj7V7dQgrnDLTFyq1RHcOQCiRSpHbtk7g7Ac+oJRIbdjr4VEi6ac0RVoiVbqaxbzk0sTicmLAEG4PE3qUWlr95cwO2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729534138; c=relaxed/relaxed;
	bh=B4nB5AD8jm9woOflkJu9LaOALYzY3FWUJ+pKW1FSB8o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aZqrja14uSQDG+tLf6UetzeduU/Su+2NIeS1k2A7K+NSKEEBkyqstlJug8WUGVLrxfp14JmIwiV1DOadYcqi4PQ//XelsjaHNRGRm1cmz3GDJ1oiEWXvF3u4x9d09vMjWiK/jLfYNyj7ABefX66wGpJZ8+lWRp9U+Uamdm67qMGFMsxIYtojjFwOTSjF8fHmDHZcDdV5YcjeKFSGkAqjSNBcdkDMsSoXI1bwdDPOe4gZps/2ovyBNM/8pcXpavfiXPu4dKGE6pT0L5voIQNiIGCBUMlz6DZ6M1pZC0kbNN/Cja7ElJ/zv37x5ngICjswXtAOk1UByXoXqn6rDL+kOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=qD0uGQ4F; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3spgwzwykdh0tfbokdhpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=qD0uGQ4F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3spgwzwykdh0tfbokdhpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXNbr63gmz2xZK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2024 05:08:55 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2e5c75bee71so1376766a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 11:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729534131; x=1730138931; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B4nB5AD8jm9woOflkJu9LaOALYzY3FWUJ+pKW1FSB8o=;
        b=qD0uGQ4Fz9RHwTCz49PVNNw2yyNUmdAXY+RlTL1zrueYkj34pDDZCwn3W3VAs+sak7
         ykvabx4NwgKyOB4B6iLoTPtLWuKzRkZq34EiPiGwGnXgzKkOXczE6F4ZDk8lGEqbXdtE
         ZnlNVRzggbTgPY5UhUL95ZpHMgh9//fL7iVXjSiCLeJ+MwWwN772jDHvu3DO+4YLBsC0
         z0wSF9yVR2A728PfThQyIgF6d4qSK8TvcuOKUSBH9dLGBJ/IttWn9OebdniYJ6bBSLtN
         E5n0T4Gm1neArE1YtCGqGKZptr2QDVnsaR8Czj7uNiCD/+Iqn6r+IrEnJ+5Q3K0DfSZz
         QBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729534131; x=1730138931;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B4nB5AD8jm9woOflkJu9LaOALYzY3FWUJ+pKW1FSB8o=;
        b=vC72o96ul64IlZ4o+RLYWaUa9ZhBXfMoUWULi7KSFw+otD3XCXfFwAKARZOBxW/bJm
         /EC9cNS06TLC+swDHkgyNbPxSliveoP5+fBun8ifLxkUlE0Gp+R1fVfj+6HmNAplHYZk
         kUBwFFuK1jLzLGK6W95WY2ixf/IVpSG258EJKclF2LNZPXjTdq3aRt8DjX13z3TCKDmP
         J2LSr0Z6FKXPOu/yTDv5LfnysvpMjq5+TlJE90+hWkD/8Uc0HZLP+mEIzqr6elDSsO38
         lOlaSsuf+37FYuZsBlrSpze3hNGOPJms+NTtmp9YVPTP31HPrRFm7KEjMltDHXjEE6Ut
         BBoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyrlTDBthjnW/iEWi6DZi9ccTL4xkQ7mAjj/buHAPUAjmlMYHJC1TmFUdpghnlf+MLtZ/0SlYhigWxJv0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywb+fJNDPi+8xDq2xUckGOu1u1tL7wb9yGwzMatSqU+IAwEqPMQ
	jSHv8rfqruF3z+gHqnzFaUOwbiRKeifOCwA69KjbijC0M4kVv0Ttfhcm4g8KL3wdEkamONERAPK
	F3Q==
X-Google-Smtp-Source: AGHT+IHz/sqxbIaZMzAhwQE+KHAQ50pc4vGOx7OQ/MlEMfrpYKQ16K4ySzEgLcCV5+myw9EmSbX31Z6uvf4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:e147:b0:2d8:a9c2:2f3a with SMTP id
 98e67ed59e1d1-2e5616d8f42mr22750a91.3.1729534130899; Mon, 21 Oct 2024
 11:08:50 -0700 (PDT)
Date: Mon, 21 Oct 2024 11:08:49 -0700
In-Reply-To: <ZxYVnsW9WF1Wp8mx@yzhao56-desk.sh.intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com> <20241010182427.1434605-20-seanjc@google.com>
 <ZxYVnsW9WF1Wp8mx@yzhao56-desk.sh.intel.com>
Message-ID: <ZxaYsfc0m6UHmi10@google.com>
Subject: Re: [PATCH v13 19/85] KVM: Introduce kvm_follow_pfn() to eventually
 replace "gfn_to_pfn" APIs
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"Alex =?utf-8?Q?Benn=C3=A9e?=" <alex.bennee@linaro.org>, David Matlack <dmatlack@google.com>, 
	David Stevens <stevensd@chromium.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Oct 21, 2024, Yan Zhao wrote:
> On Thu, Oct 10, 2024 at 11:23:21AM -0700, Sean Christopherson wrote:
> > --- a/virt/kvm/pfncache.c
> > +++ b/virt/kvm/pfncache.c
> > @@ -159,6 +159,12 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cache *gpc)
> >  	kvm_pfn_t new_pfn = KVM_PFN_ERR_FAULT;
> >  	void *new_khva = NULL;
> >  	unsigned long mmu_seq;
> > +	struct kvm_follow_pfn kfp = {
> > +		.slot = gpc->memslot,
> > +		.gfn = gpa_to_gfn(gpc->gpa),
> > +		.flags = FOLL_WRITE,
> > +		.hva = gpc->uhva,
> > +	};
> Is .map_writable uninitialized?

Nope, per C99, "subobjects without explicit initializers are initialized to zero",
i.e. map_writable is initialized to "false".

