Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B433C94854D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 00:10:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=xCEcxFHW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wd9bc4WBlz3cfx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 08:10:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=xCEcxFHW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3kk2xzgykdc8dplyunrzzrwp.nzxwtyfiaan-opgwtded.zkwlmd.zcr@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wd9Zx40LPz2yvh
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2024 08:09:27 +1000 (AEST)
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-70d188c9cabso9334568b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Aug 2024 15:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722895763; x=1723500563; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=C2PiU8MTrEuvmn4oJRZEcNoPreaY/lLc5L+V0JuLroE=;
        b=xCEcxFHWNJJ2ItSdwQJiNlucsIyB7FQgsRcmphx3JMyIvSFbG8yeJHVaz8QIkydG8T
         dvFGNCTC62yytKJ0eVu8IBnFDmBycVqTtu9C5cthdWH2CzHI3JEs2zTi54EQoWqLTyIO
         CzIhMcnxus3g1nFI68hpMOMNASU6G+Gf7F9NgpuWwEArXdzKLjQF5g3++m0LMOtXfowm
         UQM3qJZBT5CAkzkggfkg4MN545sU9/HwxRTj4VgXizLxkloIs9H1agrWv2rwVND7rzjG
         ljS4bysj/Wc9JymMd/4XYf9CRcoChvtrrGTBLZ8A6SPjOXvbpu59TduLiyf7Lgy75e4m
         EzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722895763; x=1723500563;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C2PiU8MTrEuvmn4oJRZEcNoPreaY/lLc5L+V0JuLroE=;
        b=RMfCKGk1Gct1534RYyVgGFjh31DFHHSqeh4VVT7slFyjq159VR9OV7gqGelRXVE45G
         sKy42B0NxMy+ZU4YxXgT8ZiOlf5ELMMq2RhyvX+PUDf+iQdvSBxB78M6H9mTcn8HRy/9
         yAIjqdoc4jD9Le07NFcokCfAoy2rlnjI0zMt7A8Vef+EzFDilPNdVCO/UelCw449F0oh
         QiNjKLntXnThnIYYCl2ZX/v86HU8nlD68gpX1PN5Zw1ETHAfe+8gUI75Zb0OKalSZVfi
         407ofcrOIwmWf5fR3wTFUILVsxSQYtC6rsgbVis6OvseIM4dXoGH6OyrTOji+Z8DGwuL
         BuuQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4rXamATX9J7h4eUaVbkAvR/9VmRT0rg9nu1t8QgHy/ySVc3G4H9KtaLGKfXZuViEF/1acEZ7Ooaqs+TtJDtprbJhVaN1OgfzNYGfpoQ==
X-Gm-Message-State: AOJu0Yx1KhlxvBuYff99qs+5tTzxAcN8JyKVesmGg11c2gqsadUMU9V+
	0v3bLtqrCEpBXvqP2lNSF8SmZsXVQGIvbbVI63hKWRwqAoMbY4YGTVPa/wKw5CqXlnKubSfTmeh
	mwg==
X-Google-Smtp-Source: AGHT+IFHGqnQ2aZELEsNF/YUFUu/OdaSqANvJ2o5+KNT08fnEczrxRkzi5g08NacDnyiiIzp3YSr6oxKzK4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:6f0e:b0:710:4d08:e41f with SMTP id
 d2e1a72fcca58-7106d08296emr87588b3a.4.1722895762937; Mon, 05 Aug 2024
 15:09:22 -0700 (PDT)
Date: Mon, 5 Aug 2024 15:09:21 -0700
In-Reply-To: <yq5a5xsftna9.fsf@kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-3-seanjc@google.com>
 <yq5aikwku25o.fsf@kernel.org> <ZqvNekQAjs-SN-se@google.com> <yq5a5xsftna9.fsf@kernel.org>
Message-ID: <ZrFNkSU4-0Hli7JC@google.com>
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

On Mon, Aug 05, 2024, Aneesh Kumar K.V wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > On Thu, Aug 01, 2024, Aneesh Kumar K.V wrote:
> >> Sean Christopherson <seanjc@google.com> writes:
> >> 
> >> > Disallow copying MTE tags to guest memory while KVM is dirty logging, as
> >> > writing guest memory without marking the gfn as dirty in the memslot could
> >> > result in userspace failing to migrate the updated page.  Ideally (maybe?),
> >> > KVM would simply mark the gfn as dirty, but there is no vCPU to work with,
> >> > and presumably the only use case for copy MTE tags _to_ the guest is when
> >> > restoring state on the target.
> >> >
> >> > Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a guest")
> >> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> >> > ---
> >> >  arch/arm64/kvm/guest.c | 5 +++++
> >> >  1 file changed, 5 insertions(+)
> >> >
> >> > diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> >> > index e1f0ff08836a..962f985977c2 100644
> >> > --- a/arch/arm64/kvm/guest.c
> >> > +++ b/arch/arm64/kvm/guest.c
> >> > @@ -1045,6 +1045,11 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
> >> >  
> >> >  	mutex_lock(&kvm->slots_lock);
> >> >  
> >> > +	if (write && atomic_read(&kvm->nr_memslots_dirty_logging)) {
> >> > +		ret = -EBUSY;
> >> > +		goto out;
> >> > +	}
> >> > +
> >> >
> >> 
> >> is this equivalent to kvm_follow_pfn() with kfp->pin = 1 ?
> >
> > No, gfn_to_pfn_prot() == FOLL_GET, kfp->pin == FOLL_PIN.  But that's not really
> > relevant.
> 
> What I meant was, should we consider mte_copy_tags_from_user() as one
> that update the page contents (even though it is updating tags) and
> use kvm_follow_pfn() with kfp->pin = 1 instead?

Yes, that's my understanding as well.  However, this series is already ludicruosly
long, and I don't have the ability to test the affected code, so rather than blindly
churn more arch code, I opted to add a FIXME in patch 76 instead.

https://lore.kernel.org/all/20240726235234.228822-76-seanjc@google.com
