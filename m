Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5269294372C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 22:37:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=4jLn21E+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZ3mk1qpmz3dHD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 06:37:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=4jLn21E+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3sqcqzgykdhehtpcyrvddvat.rdbaxcjmeer-stkaxhih.doapqh.dgv@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZ3lz6qQCz2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 06:36:30 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e0bcd04741fso172454276.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 13:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722458187; x=1723062987; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kd/mYHbPzOSIwsUM5m5UMPqJkKyWoklOLcVSOqbILGs=;
        b=4jLn21E+uAcuSpX9OSfvwTSvSthWx1dA74H2cHqmX4nceketzG7VIGKc2u8vgEBSxX
         zkCnVIsJceWLqLUbjdu8MCO8tg8iPvsHVNiD0gnf/JLv24QP/RL9179ym2Mf+6C1/YJO
         ifUdXsOSNodsTHGY1MHJxSqgiP8A7yrh1tRIRgUZ3KBj56PAua/87gwi0/tYA9WF8G0X
         q8aLR1ojZVZkQFj7eGmoA5qEkjWVRFW3cxARJM9Xh0yUAff5Vin8q1J3iwQ1+Nf0QecQ
         hxzCdDZnMikulCBflHiCw7NF/RFuze3qhAn2LEtbw6LeQtAPOQxEy0QIqnYdUCN8RUew
         AOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722458187; x=1723062987;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Kd/mYHbPzOSIwsUM5m5UMPqJkKyWoklOLcVSOqbILGs=;
        b=wmzUmPl9KVw0fqPAI3rgZYesBHNhGYyNQeipUz4v54bLgc5COyri8NXbzLbZQwIc/P
         IgxcfwA0LkU5+nVrxCuOLpQTJTtgubMFcg4kdyJJCqfjg2wXcDB7sV8IsvxoeLxxPiit
         dmmWc+nORaIUVj8ZJEtOMG9WKDw+PI1EQg05m3pEI3d5BGO3qTFkZ2djLUWEIkMGR0sR
         4jzyk1Qscvf5XaH0GLqWcmpNyhe7MNA1tD5XFLIZNq0dfBsMrtPDdQ7WlY8ICfeUURB5
         q/iM+KliZO+Rrw/sOHuR7VK59YtaxoNAv9iJeaJIGnw1DkZn1YCBr853mYmO0rOvXEdB
         3uQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDZZr7IqMay8B9gIXFWlk2zq0Utv5F+OxTh76porW/quKRjlneAuxa2IouKvEARd1UCatYkycMNl+pZV/1zEDpQWCoZslHGa6YPh2rMA==
X-Gm-Message-State: AOJu0YyazS1+CRtz9fe8sOHdclTwSCpiWF62wr7mg5rKG1S3HJSvSBBJ
	fAqI0M9sEWn6Iqpa33ABCry3syXFRDBVAFtZQNfQnSHPRj7wX0v/yMmS9qdJgqRf1vksM4bmKGk
	fgw==
X-Google-Smtp-Source: AGHT+IH0DRpeCdEjd5+EVXte2iiNPB7q7dTvECq86U0Z8nMo4fguKYduL9RXt42ZsXAM2SH8mq6gA4JZJ0k=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:18d2:b0:e0b:bf20:4ff8 with SMTP id
 3f1490d57ef6-e0bccf7b434mr932276.0.1722458186501; Wed, 31 Jul 2024 13:36:26
 -0700 (PDT)
Date: Wed, 31 Jul 2024 13:36:25 -0700
In-Reply-To: <87a5hxfs3d.fsf@draig.linaro.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-2-seanjc@google.com>
 <87a5hxfs3d.fsf@draig.linaro.org>
Message-ID: <ZqqgSW1Z07aBGwQh@google.com>
Subject: Re: [PATCH v12 01/84] KVM: arm64: Release pfn, i.e. put page, if
 copying MTE tags hits ZONE_DEVICE
From: Sean Christopherson <seanjc@google.com>
To: "Alex =?utf-8?Q?Benn=C3=A9e?=" <alex.bennee@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jul 31, 2024, Alex Benn=C3=A9e wrote:
> Sean Christopherson <seanjc@google.com> writes:
>=20
> > Put the page reference acquired by gfn_to_pfn_prot() if
> > kvm_vm_ioctl_mte_copy_tags() runs into ZONE_DEVICE memory.  KVM's less-
> > than-stellar heuristics for dealing with pfn-mapped memory means that K=
VM
> > can get a page reference to ZONE_DEVICE memory.
> >
> > Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a gu=
est")
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/arm64/kvm/guest.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> > index 11098eb7eb44..e1f0ff08836a 100644
> > --- a/arch/arm64/kvm/guest.c
> > +++ b/arch/arm64/kvm/guest.c
> > @@ -1059,6 +1059,7 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
> >  		page =3D pfn_to_online_page(pfn);
> >  		if (!page) {
> >  			/* Reject ZONE_DEVICE memory */
> > +			kvm_release_pfn_clean(pfn);
>=20
> I guess this gets renamed later in the series.
>=20
> However my main comment is does lack of page always mean a ZONE_DEVICE?

Nope.

> Looking at pfn_to_online_page() I see a bunch of other checks first. Why
> isn't it that functions responsibility to clean up after itself if its
> returning NULLs?

pfn_to_online_page() is more strict than gfn_to_pfn_prot().  At least in th=
eory,
gfn_to_pfn_prot() could return a pfn that has an associated "struct page", =
with
a reference held to said page.  But for that same pfn, pfn_to_online_page()=
 could
return NULL, in which case KVM needs to put the reference it acquired via
gfn_to_pfn_prot().
