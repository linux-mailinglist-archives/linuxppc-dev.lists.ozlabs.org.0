Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4C3944E48
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 16:43:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KA49viHC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZWtf41YKz3dWS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 00:43:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KA49viHC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3ap-rzgykdcszlhuqjnvvnsl.jvtspubewwj-klcspzaz.vgshiz.vyn@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZWsy3Wqtz304l
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2024 00:43:16 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e0872023b7dso10883014276.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Aug 2024 07:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722523395; x=1723128195; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9BUCK9RfTKafiexBRvCEwFw2qC43V57hNjDHfumiy08=;
        b=KA49viHC6dOCCh+JpkTKRo76BEVzNkkW6xFu7bgX70I7f/BnnWArM4YRAKun++/5JR
         WxL48MGVRMSnC12AZFuDC80KiVCmhEjxmAgYu7/hCswGb0sbKkkQ6JW3zFQWawY41nKh
         gs7NRXyvPDk2hLClQRu5JN5JMBto/OOkzUvOrVGV4SQY6xPYC6XdonFY1PSKWePj8ky+
         4QmDQp5lYt3ruSIFy2+fmLbZ1Usro4uCZvLyGO+WNgNGnB3H8zff+cJ5zuMZer8M6zv2
         Zu/QR19rdC5/Eyzikpi44S+YUQZG2iUZyYdLrZ7HZjIwwiRNBNSgEPQZ5uLjvkJNgmVy
         lfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722523395; x=1723128195;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9BUCK9RfTKafiexBRvCEwFw2qC43V57hNjDHfumiy08=;
        b=YR2UdZPkPWetZ0lOpsWgIcNLY5Z2Fjtzg58T7Y+XyItK1z43D+t7VxBi/J/WmJoyvi
         /CEyNwoLZn4CaapTnYQcweKv/I521DXqKDsWIMKie304L3flkmuY1JDT5goL0KokVlFw
         ORs8zS7c+aR4j9Wk0BBqmlSS+JNCcjk3TDRFeCkJX9S+YPhtDNj2sZO4sNfJacPR/tny
         I5Hc1aybG6uJrpqcU7hjvmqkbY0d8lKk2z+QVUovfsGk7w849VlgGPTrpYaReWGP1VOc
         q4lFZC/EU/oSt/oxVPQTtA0pfIxIGenQHr5zZ0UgnkdgC79ByV+uunyIoo5Ux1JtZyqx
         vdZA==
X-Forwarded-Encrypted: i=1; AJvYcCXZcXJoEJj5pmISYa0fN4GdQGYlVKOXMOBP3cemr25txmYH4jjzUOL7fa62EPUKeQOETTyjMyJZQOnxR21tVRLDWQCE/xH8kItoANYJJA==
X-Gm-Message-State: AOJu0YxCfp3uiVjaP59qPllUoj7AbVNMy1AjUSEdtXdfX560pf7x0gaK
	zmwW5gDd8wZ7C/BhJHFLY6PbBze8DMoQ75gVbQ+ajuNVRQj+tF+poWIAnyaoWQLbZvBnbMxD0Ec
	7Eg==
X-Google-Smtp-Source: AGHT+IHkE7Ce/eHqXIIWUhOrz6iZ7wUAM+0kNmbjyrQoG1wEe6+vtvmxZ2gwjb9N0RAQKGaJuDaT2daG0VE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1104:b0:e0b:b6f3:85 with SMTP id
 3f1490d57ef6-e0bde2f0105mr658276.2.1722523394843; Thu, 01 Aug 2024 07:43:14
 -0700 (PDT)
Date: Thu, 1 Aug 2024 07:43:13 -0700
In-Reply-To: <87wml0egzo.fsf@draig.linaro.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-6-seanjc@google.com>
 <87wml0egzo.fsf@draig.linaro.org>
Message-ID: <ZqufAYyVOa9M1z76@google.com>
Subject: Re: [PATCH v12 05/84] KVM: Add kvm_release_page_unused() API to put
 pages that KVM never consumes
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

On Thu, Aug 01, 2024, Alex Benn=C3=A9e wrote:
> Sean Christopherson <seanjc@google.com> writes:
>=20
> > Add an API to release an unused page, i.e. to put a page without markin=
g
> > it accessed or dirty.  The API will be used when KVM faults-in a page b=
ut
> > bails before installing the guest mapping (and other similar flows).
> >
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  include/linux/kvm_host.h | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 3d9617d1de41..c5d39a337aa3 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -1201,6 +1201,15 @@ unsigned long gfn_to_hva_prot(struct kvm *kvm, g=
fn_t gfn, bool *writable);
> >  unsigned long gfn_to_hva_memslot(struct kvm_memory_slot *slot, gfn_t g=
fn);
> >  unsigned long gfn_to_hva_memslot_prot(struct kvm_memory_slot *slot, gf=
n_t gfn,
> >  				      bool *writable);
> > +
> > +static inline void kvm_release_page_unused(struct page *page)
> > +{
> > +	if (!page)
> > +		return;
> > +
> > +	put_page(page);
> > +}
>=20
> I guess it's unfamiliarity with the mm layout but I was trying to find
> where the get_pages come from to see the full pattern of allocate and
> return. I guess somewhere in the depths of hva_to_pfn() from
> hva_to_pfn_retry()?

If successful, get_user_page_fast_only() and get_user_pages_unlocked() grab=
 a
reference on behalf of the caller.

As of this patch, hva_to_pfn_remapped() also grabs a reference to pages tha=
t
appear to be refcounted, which is the underlying wart this series aims to f=
ix.
In KVM's early days, it _only_ supported GUP, i.e. if KVM got a pfn, that p=
fn
was (a) backed by struct page and (b) KVM had a reference to said page.  Th=
at
led to the current mess, as KVM didn't get reworked to properly track pages=
 vs.
pfns when support for VM_MIXEDMAP was added.

	/*
	 * Get a reference here because callers of *hva_to_pfn* and
	 * *gfn_to_pfn* ultimately call kvm_release_pfn_clean on the
	 * returned pfn.  This is only needed if the VMA has VM_MIXEDMAP
	 * set, but the kvm_try_get_pfn/kvm_release_pfn_clean pair will
	 * simply do nothing for reserved pfns.
	 *
	 * Whoever called remap_pfn_range is also going to call e.g.
	 * unmap_mapping_range before the underlying pages are freed,
	 * causing a call to our MMU notifier.
	 *
	 * Certain IO or PFNMAP mappings can be backed with valid
	 * struct pages, but be allocated without refcounting e.g.,
	 * tail pages of non-compound higher order allocations, which
	 * would then underflow the refcount when the caller does the
	 * required put_page. Don't allow those pages here.
	 */
	if (!kvm_try_get_pfn(pfn))
		r =3D -EFAULT;
