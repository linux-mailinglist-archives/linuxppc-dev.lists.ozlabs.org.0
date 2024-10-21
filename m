Return-Path: <linuxppc-dev+bounces-2466-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B52509A7209
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2024 20:13:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXNhp2kV8z2xwH;
	Tue, 22 Oct 2024 05:13:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729534394;
	cv=none; b=Fr5tO5VNsPQNRqk2ddxXbx0hl/P30lx8x80V2Fs8ujUw7x1TXjZy73id591YIskwlDq9QM4TPsDCxvQ4PeD9+90C9pIHthPbPuQPeYDzVgoJgsnO50+DHJFSfPtqmPwpQZRTXwNT1LInyOqs+iQ533MZ86GYFqydaGq/hTY99RHZrsLgrqUjPCrHjOlYfzH//AjQ3EGuujaTnml9AyyNGAt2Neffp7eTwaTEfBPZEOgCF9kFsLpw7k5pbPDQRyw2WDCLqDiV4HlHD0h9X32l6SoEEHWCn1uQ0G8Okd5aDAxgZT7HKrBOR21yjSOtl4+GeJDBIX1CAXbQRljwCuyaVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729534394; c=relaxed/relaxed;
	bh=/aTJKIPGdXYIQ4z1/mPhLVqGYb++KmSjcoFUbuTd6EE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IGaAKBAPoLENK3YdAibPgM03B1GZ6BAU2K8EXBWee6w8h18pqtJxtk8P0tNhoMwTTqXbb3Ps+3N0owM3Hii2Gt8tsjgDQScl3VjDqpTgx7T29bxNQIOoD5rDSxLiBSxdcKB/Zy9IGcKX/gGKOTOT0zQPmZ6xfPvYxjvmEg0oQV0gu2wPIE1jJ5MPmDoqICeOE8AisfNtUKNvNIKza5dKjuxa6RGqSRGnbjMNyvt1wxLfDNNCITbZ2Eo0yu2uWCzUph50r4/63NKYXSt2vAxCOR+NQnZJ4c5Kv0PjASGl4+h3J1YoXTN4PIqpv/LWPGxWl4UWGsI9k8pNZgERcHUHyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=RxTjmIfK; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3tzkwzwykdiiykgtpimuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=RxTjmIfK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3tzkwzwykdiiykgtpimuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXNhn1gyMz2xrJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2024 05:13:12 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e24a31ad88aso6866448276.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 11:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729534390; x=1730139190; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/aTJKIPGdXYIQ4z1/mPhLVqGYb++KmSjcoFUbuTd6EE=;
        b=RxTjmIfK1kvyVmvPnyLs94SCjCOv1vrSeXiY0KMUdjPubvQhfCv7MFBmeCLASjgR8N
         uqNjEMPTq+W1S9USgj+GZKYH+3HjrU6VDVCQW6rSa6MhsGE98uHyjWP5oo3tEuFIauA4
         q5ZDMblaTiCfgOhdzEK3p3rNo1QjTYITv++cw6GsdUCli5ai5KU8l870pek59TEVTkZk
         B8w1fGB/ewxFEvXhA+FQDwdSrCJMEQ/DvVf/F3BM2pTG1ZAXF3+ceYLr1P9fdi2CZSn3
         fK7dQKpf8zmTTYKssEF31FhPNN/qJFZDEDAIoysGdzuvu15khXy7Wu0ip9V43HmPs9fC
         5qxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729534390; x=1730139190;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/aTJKIPGdXYIQ4z1/mPhLVqGYb++KmSjcoFUbuTd6EE=;
        b=k0GzSnkQNjHt5iO2fVy89VO/W8kMfMpli/TxijSS4EDv8zzbfOcL1xZtGlF8sdwhlw
         xtzblf4yPj7+KkKu9+gK4JSIyZB3IJbmvDhmuBxntsq/ugVzz1zgsWIBBx7f6vZbSxlo
         nCIUAqymw7XwHh4MOLYalgjO6HlgnaHoxvoy1THl62nQy8p1KPcbz6drIhcxgznIufxh
         wQoAuMBMFkD7eMayk5Btailoir9v5KWhBwtLXp6s4gkbJjwUFNE7kP4GXcMeWGSKuTux
         n8Iu6RzJmqN6Y6TPoZrEJ/D7P/BNXKtTM/5xnZkch5Ho67zqAc6rYc8lLxTiCP6oW1wK
         T7ug==
X-Forwarded-Encrypted: i=1; AJvYcCVfCYTAUpoNEb/6KQOgAg8BkRKVa+2f8VCEF6LQVyldd5IAf1wJ/ZfIcrdBAO/jpuFN8uIMKYDBKM4JsOY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxR970CF3Zsjg9QOpn3nsJpg3hhDsZULfKcRB2r/0e0Yulhd9G/
	YFnqVStENLNMXY3y+9+ooVp/cmkmYYQVAOEINU7a8zm5sLpucX0tXmvcrz8eRymTDI5Cq3nPGJ+
	77Q==
X-Google-Smtp-Source: AGHT+IGB051RPG0qZ1hHpRMmy9gqDX/0GH7so+xa+rGGnhbzxuPrj+6CH4debSRqPENvRC2d7Upq2p/funE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:8389:0:b0:e2b:e955:d58a with SMTP id
 3f1490d57ef6-e2be955d949mr2592276.7.1729534389536; Mon, 21 Oct 2024 11:13:09
 -0700 (PDT)
Date: Mon, 21 Oct 2024 11:13:08 -0700
In-Reply-To: <ZxYeFKl2KbZ3Ila1@yzhao56-desk.sh.intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com> <20241010182427.1434605-35-seanjc@google.com>
 <ZxYeFKl2KbZ3Ila1@yzhao56-desk.sh.intel.com>
Message-ID: <ZxaZtJGfN2_5Db6h@google.com>
Subject: Re: [PATCH v13 34/85] KVM: Get writable mapping for __kvm_vcpu_map()
 only when necessary
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Oct 21, 2024, Yan Zhao wrote:
> On Thu, Oct 10, 2024 at 11:23:36AM -0700, Sean Christopherson wrote:
> > When creating a memory map for read, don't request a writable pfn from =
the
> > primary MMU.  While creating read-only mappings can be theoretically sl=
ower,
> > as they don't play nice with fast GUP due to the need to break CoW befo=
re
> > mapping the underlying PFN, practically speaking, creating a mapping is=
n't
> > a super hot path, and getting a writable mapping for reading is weird a=
nd
> > confusing.
> >=20
> > Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  virt/kvm/kvm_main.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 080740f65061..b845e9252633 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -3122,7 +3122,7 @@ int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t g=
fn, struct kvm_host_map *map,
> >  	struct kvm_follow_pfn kfp =3D {
> >  		.slot =3D gfn_to_memslot(vcpu->kvm, gfn),
> >  		.gfn =3D gfn,
> > -		.flags =3D FOLL_WRITE,
> > +		.flags =3D writable ? FOLL_WRITE : 0,
> >  		.refcounted_page =3D &map->pinned_page,
> >  		.pin =3D true,
> >  	};
> When writable is false, could we set ".pin =3D false," ?

Hmm, maybe?  I can't imagine anything would actually break, but unless FOLL=
_PIN
implies writing, my preference would still be to pin the page so that KVM a=
lways
pins when accessing the actual data of a page.

> Also not sure if ".map_writable =3D NULL" is missing.

Doh, my previous response was slightly wrong, it's implicitly initialized t=
o NULL,
not false.  I forgot map_writable is a pointer to a bool.

