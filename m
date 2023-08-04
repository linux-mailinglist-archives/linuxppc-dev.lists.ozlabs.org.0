Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30869770BB9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 00:05:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=vM4uC4Ru;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHfsk0Wxrz3cRP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 08:05:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=vM4uC4Ru;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3v3xnzaykda46so1xqu22uzs.q20zw18b33q-rs9zw676.2dzop6.25u@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHfqp1gH1z2xVP
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Aug 2023 08:03:48 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d087ffcc43cso2579527276.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Aug 2023 15:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691186623; x=1691791423;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z5QE4e6WPNCCTrcuQvD50h/cVU5OOyClG9aBSPF6enk=;
        b=vM4uC4RuClRcmFO2qH/TANlQsWDEW+w4U9sW+sG8F4CCDdcV2tNthcz4YJ6PXz+56B
         oqFUNpVY1eBEVrxwliIA57bmsHnqMhmzXjy8U521V1m+rWHXTXQ/nE9iB9PLwoS2cdGY
         7UF3A0KKoCLferkfuF10jA2qDrwRUIQERhyJN66ymiLypJRXtzrYN9HmsXdOXjm4P3TN
         8r6STBjd9bG6Nix6A+scDPT6fGkyHJA56x9OaL5i8xMACEqeMxgiVcUju8xRuBySakA/
         RLQ9me9mrk7MBFj6YOhouZwKr3MwcQlfeVPnrAJGTBAcNtiUcjLAzNf1ojAR1NejBXa+
         Dt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691186623; x=1691791423;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z5QE4e6WPNCCTrcuQvD50h/cVU5OOyClG9aBSPF6enk=;
        b=TepmQWbIAiuLUPRoIvF7s926Et1xBGZZpytgjnD+GAiIA3f4DiFTMJ/J7/xtGGO/oA
         02zJaH2FErWYO5EyvcQnIkAvRaUB8g1F+cOVdyt6G/c7/gVMfdb8EpUYyILm0ljbEEEu
         ikIWzOii575XCV1QP/tG2SMwn1VAjk5gdPW+xJFDH/3vUSa/Wmv7fsCYscTMpJiA4vNb
         7hwWqj6FJf1UqAGXx99Ja1XOOG7wOB9He0iKauRPNN1uR4cJdhd5trX0/jOSlGLbbC3D
         ykVWg4jyg5IEmKQ3DtERDBXetfrkAV3M8xoXxlcXDOuDWsUJ2qVQAcCdDSqa8Sj9RsrV
         ORuw==
X-Gm-Message-State: AOJu0YxXH5Ul5+2kZe1uKmYUhTAyynCCAq+n1sQOitLtOzEq3C7APf11
	Igy5KoGjKYJStzPi0wJtqzKaYzyXJL0=
X-Google-Smtp-Source: AGHT+IFjaw3aSm7rjvvmijnXEXzRTq5HabQb/vYjmBeBj+YyrmCXw7NTiGSmKknyLfkweNzeT9xhYtbm3aE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:f807:0:b0:d09:b450:22eb with SMTP id
 u7-20020a25f807000000b00d09b45022ebmr14827ybd.1.1691186623542; Fri, 04 Aug
 2023 15:03:43 -0700 (PDT)
Date: Fri, 4 Aug 2023 15:03:41 -0700
In-Reply-To: <20230706145247.ddjqsvmfdeimzva6@linux.intel.com>
Mime-Version: 1.0
References: <20230704075054.3344915-1-stevensd@google.com> <20230704075054.3344915-3-stevensd@google.com>
 <20230705031002.xrxk42hli6oavtlt@linux.intel.com> <CAD=HUj6-VbznOOtn5WJee7Of_nh33ygg7_ph2G=hgnvNk_Cbsw@mail.gmail.com>
 <20230705105343.iounmlflfued7lco@linux.intel.com> <CAD=HUj5ezWt7rLAv2qOpFsMHyFU87Hqtw_p8pWNF5+oxbLhxDg@mail.gmail.com>
 <20230706145247.ddjqsvmfdeimzva6@linux.intel.com>
Message-ID: <ZM11vUK3vIjjykaz@google.com>
Subject: Re: [PATCH v7 2/8] KVM: Introduce __kvm_follow_pfn function
From: Sean Christopherson <seanjc@google.com>
To: Yu Zhang <yu.c.zhang@linux.intel.com>
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
Cc: kvm@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, David Stevens <stevensd@chromium.org>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 06, 2023, Yu Zhang wrote:
> On Thu, Jul 06, 2023 at 02:29:24PM +0900, David Stevens wrote:
> > On Wed, Jul 5, 2023 at 7:53=E2=80=AFPM Yu Zhang <yu.c.zhang@linux.intel=
.com> wrote:
> > >
> > > On Wed, Jul 05, 2023 at 06:22:59PM +0900, David Stevens wrote:
> > > > On Wed, Jul 5, 2023 at 12:10=E2=80=AFPM Yu Zhang <yu.c.zhang@linux.=
intel.com> wrote:
> > > > >
> > > > > > @@ -2514,35 +2512,26 @@ static bool hva_to_pfn_fast(unsigned lo=
ng addr, bool write_fault,
> > > > > >   * The slow path to get the pfn of the specified host virtual =
address,
> > > > > >   * 1 indicates success, -errno is returned if error is detecte=
d.
> > > > > >   */
> > > > > > -static int hva_to_pfn_slow(unsigned long addr, bool *async, bo=
ol write_fault,
> > > > > > -                        bool interruptible, bool *writable, kv=
m_pfn_t *pfn)
> > > > > > +static int hva_to_pfn_slow(struct kvm_follow_pfn *foll, kvm_pf=
n_t *pfn)
> > > > > >  {
> > > > > > -     unsigned int flags =3D FOLL_HWPOISON;
> > > > > > +     unsigned int flags =3D FOLL_HWPOISON | FOLL_GET | foll->f=
lags;
> > > > > >       struct page *page;
> > > > > >       int npages;
> > > > > >
> > > > > >       might_sleep();
> > > > > >
> > > > > > -     if (writable)
> > > > > > -             *writable =3D write_fault;
> > > > > > -
> > > > > > -     if (write_fault)
> > > > > > -             flags |=3D FOLL_WRITE;
> > > > > > -     if (async)
> > > > > > -             flags |=3D FOLL_NOWAIT;
> > > > > > -     if (interruptible)
> > > > > > -             flags |=3D FOLL_INTERRUPTIBLE;
> > > > > > -
> > > > > > -     npages =3D get_user_pages_unlocked(addr, 1, &page, flags)=
;
> > > > > > +     npages =3D get_user_pages_unlocked(foll->hva, 1, &page, f=
lags);
> > > > > >       if (npages !=3D 1)
> > > > > >               return npages;
> > > > > >
> > > > > > +     foll->writable =3D (foll->flags & FOLL_WRITE) && foll->al=
low_write_mapping;
> > > > > > +
> > > > > >       /* map read fault as writable if possible */
> > > > > > -     if (unlikely(!write_fault) && writable) {
> > > > > > +     if (unlikely(!foll->writable) && foll->allow_write_mappin=
g) {
> > > > >
> > > > > I guess !foll->writable should be !(foll->flags & FOLL_WRITE) her=
e.
> > > >
> > > > The two statements are logically equivalent, although I guess using
> > > > !(foll->flags & FOLL_WRITE) may be a little clearer, if a little mo=
re
> > > > verbose.
> > >
> > > Well, as the comment says, we wanna try to map the read fault as writ=
able
> > > whenever possible. And __gfn_to_pfn_memslot() will only set the FOLL_=
WRITE
> > > for write faults. So I guess using !foll->writable will not allow thi=
s.
> > > Did I miss anything?
> >=20
> > We just set the foll->writable out parameter to be equal to
> > ((foll->flags & FOLL_WRITE) && foll->allow_write_mapping). Taking a =3D
> > foll->flags & FOLL_WRITE and b =3D foll->allow_write_mapping, we have
> > !(a && b) && b -> (!a || !b) && b -> (!a && b) || (!b && b) -> !a &&
> > b.
>=20
> Ouch, my bad again... I typed "!foll->writable", but missed the "!" in
> my head while calculating... Thanks! :)

The code is funky and confusing though.  Specifically, FOLL_WRITE without
allow_write_mapping is nonsensical, and yields the even more nonsensical ou=
tput
of a successful FOLL_WRITE with foll->writable=3D=3D%false.

It "works" because callers only consume foll->writable when foll->allow_wri=
te_mapping
is true, but relying on that is ugly and completely unnecessary.   Similarl=
y, the
"allow" terminology is misleading.  FOLL_WRITE *always* allows writable map=
pings.

This wasn't as much of problem in the previous code because the lower level=
s took
the pointer, i.e. avoided the "allow" terminology entirely.

So we should either keep that behavior, i.e. replace "bool allow_write_mapp=
ing"
with "bool *writable", or rename allow_write_mapping to something like
opportunistically_map_writable, and then unconditionally set foll->writable
whenever KVM obtains a writable mapping, i.e. regardless of whether the ori=
ginal
fault was a read or a write.

My vote is for the latter.  If opportunistically_map_writable is too verbos=
e,
try_map_writable would be another option.  Hmm, I'll make "try_map_writable=
" my
official vote.

Ah, and I also vote to use an if-elif instead of unconditionally setting fo=
ll->writable.
That makes the relationship between FOLL_WRITE and try_map_writable a bit m=
ore
obvious IMO.  E.g.

static bool hva_to_pfn_fast(struct kvm_follow_pfn *foll, kvm_pfn_t *pfn)
{
	struct page *page[1];

	/*
	 * Fast pin a writable pfn only if it is a write fault request
	 * or the caller allows to map a writable pfn for a read fault
	 * request.
	 */
	if (!((foll->flags & FOLL_WRITE) || foll->try_map_writable))
		return false;

	if (get_user_page_fast_only(foll->hva, FOLL_WRITE, page)) {
		*pfn =3D page_to_pfn(page[0]);
		foll->writable =3D true;
		return true;
	}

	return false;
}

/*
 * The slow path to get the pfn of the specified host virtual address,
 * 1 indicates success, -errno is returned if error is detected.
 */
static int hva_to_pfn_slow(struct kvm_follow_pfn *foll, kvm_pfn_t *pfn)
{
	unsigned int flags =3D FOLL_HWPOISON | FOLL_GET | foll->flags;
	struct page *page;
	int npages;

	might_sleep();

	npages =3D get_user_pages_unlocked(foll->hva, 1, &page, flags);
	if (npages !=3D 1)
		return npages;

	if (foll->flags & FOLL_WRITE) {
		foll->writable =3D true;
	} else if (foll->try_map_writable) {
		struct page *wpage;

		/* map read fault as writable if possible */
		if (get_user_page_fast_only(foll->hva, FOLL_WRITE, &wpage)) {
			foll->writable =3D true;
			put_page(page);
			page =3D wpage;
		}
	}
	*pfn =3D page_to_pfn(page);
	return npages;
}

