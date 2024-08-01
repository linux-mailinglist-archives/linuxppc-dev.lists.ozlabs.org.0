Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3277194527F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 20:02:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tqipnU2F;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZcHS0qt2z3dRm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 04:02:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tqipnU2F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3e82rzgykdaiugcpleiqqing.eqonkpwzrre-fgxnkuvu.q1ncdu.qti@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZcGl6959z30Wc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2024 04:01:34 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7a23a0fb195so7397196a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Aug 2024 11:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722535292; x=1723140092; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xl2Pju3NY9Fnm1xajnPNr4ZOFDET+sfv7XV8JXyIerc=;
        b=tqipnU2Fzxk8dDfkeB/IkKdFGgviVP9Vn9bgiEO0vmSP7SXvhKBQupRSruSwp/qEZI
         NoISbCQO5AlKR0z2rTXwaXsIjtCcb/pe74C7fA3e2zkvPWAsuImAkdNWJZz1Sd9SYIOU
         GZyAhcUCR5czfpPEtDo+u2Zm29whFculWpkaksQonMk/N7wkIdX6FEFTh92mXMwEg8Rq
         IHOnr4tg4QHQjrbBa8K5obElXVkyRysG+b2Kxl6GPN+z5YyxxfjwP48N63rdyjWM785E
         jxIESNfyNOezeZZVyDp1OhjDPQ4WvGh/5h3A+EK8kCFZUI8twQqe532AAqaHqEXzQ6JH
         LIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722535292; x=1723140092;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xl2Pju3NY9Fnm1xajnPNr4ZOFDET+sfv7XV8JXyIerc=;
        b=Q8/LHW43MXEEI2v3eJs138nJW1wshY6wcs1x6MqF8w2unX9kEF7B1rg4H8VDKram0n
         uZeuDSXLC5fYKzfs/V7Gl+ilXOkDvMC7iDmb/aCCG/8KIcfl4kCAxefjYRPGIZ8ffd1q
         Fxy/rRVQ6iMHmJiQlhixsW9W5BvgU3jFkg0zw7tlipPTEq+KcfeWZAGrja/3E597JEPW
         isnzvYv04UTVcSKjLZH6znQaqgaZQJ/PeZ6lknnRHkh4bMkBAP/TsWMUpVAxECnPZfb5
         eG61q5vhTnRWqm75vOLUBdJcbdUorUQSShGwjyeqDEVnK59FeTgYvNZ+9gz14+H9R1UX
         C3pg==
X-Forwarded-Encrypted: i=1; AJvYcCXmJEFalriPh3kiTGV2NpeNfGGzMNDNZpWla2mtJwMMZqxM500jkE2nkPCsLiuS9fW9VzBsoSW/NN/kUMQBiyOkpN09zBwqYRBbgnKyKA==
X-Gm-Message-State: AOJu0YyQiTYOVMVxZNIqNHXsQjbPO0zDNSNj5IUdpmG+MFhBkGxZiCyt
	NJEVZ3Dmzwllo7eQQlKfUUd4g3Gd45OmGRsRibrRpUpKEUWtD5KC+XGIfeI9CnOxWkb8VwPB+/j
	SNQ==
X-Google-Smtp-Source: AGHT+IF64U8Ib+bNIe3iPxoSzJOvvilQGXPjPZq7Y/8acNPwlcg0hACHnvmYPGnFv3dx9aufX4l27GJDySU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a65:6252:0:b0:75a:b299:85b6 with SMTP id
 41be03b00d2f7-7b74669c7b3mr1534a12.2.1722535291408; Thu, 01 Aug 2024 11:01:31
 -0700 (PDT)
Date: Thu, 1 Aug 2024 11:01:30 -0700
In-Reply-To: <yq5aikwku25o.fsf@kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-3-seanjc@google.com>
 <yq5aikwku25o.fsf@kernel.org>
Message-ID: <ZqvNekQAjs-SN-se@google.com>
Subject: Re: [PATCH v12 02/84] KVM: arm64: Disallow copying MTE to guest
 memory while KVM is dirty logging
From: Sean Christopherson <seanjc@google.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, David Stevens <stevensd@chromium.org>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 01, 2024, Aneesh Kumar K.V wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > Disallow copying MTE tags to guest memory while KVM is dirty logging, as
> > writing guest memory without marking the gfn as dirty in the memslot could
> > result in userspace failing to migrate the updated page.  Ideally (maybe?),
> > KVM would simply mark the gfn as dirty, but there is no vCPU to work with,
> > and presumably the only use case for copy MTE tags _to_ the guest is when
> > restoring state on the target.
> >
> > Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a guest")
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/arm64/kvm/guest.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> > index e1f0ff08836a..962f985977c2 100644
> > --- a/arch/arm64/kvm/guest.c
> > +++ b/arch/arm64/kvm/guest.c
> > @@ -1045,6 +1045,11 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
> >  
> >  	mutex_lock(&kvm->slots_lock);
> >  
> > +	if (write && atomic_read(&kvm->nr_memslots_dirty_logging)) {
> > +		ret = -EBUSY;
> > +		goto out;
> > +	}
> > +
> >
> 
> is this equivalent to kvm_follow_pfn() with kfp->pin = 1 ?

No, gfn_to_pfn_prot() == FOLL_GET, kfp->pin == FOLL_PIN.  But that's not really
relevant.

> Should all those pin request fail if kvm->nr_memslots_dirty_logging != 0? 

No, the conflict with dirty logging is specifically that this code doesn't invoke
mark_page_dirty().  And it can't easily do that, because there's no loaded ("running")
vCPU, i.e. doing so would trip this WARN:

#ifdef CONFIG_HAVE_KVM_DIRTY_RING
	if (WARN_ON_ONCE(vcpu && vcpu->kvm != kvm))
		return;

	WARN_ON_ONCE(!vcpu && !kvm_arch_allow_write_without_running_vcpu(kvm)); <====
#endif
