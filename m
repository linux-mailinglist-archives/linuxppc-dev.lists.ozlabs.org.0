Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4E7770C1A
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 00:46:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=vyT9iRvB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHgnV4nMVz2xVP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 08:46:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=vyT9iRvB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3kh_nzaykdpelxtgcvzhhzex.vhfebgnqiiv-wxoeblml.hsetul.hkz@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHgm51KFWz2yhZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Aug 2023 08:45:39 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-586a5cd0ea9so13156627b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Aug 2023 15:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691189136; x=1691793936;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzzGQVsyCKQuIHhNuvYJJsNQNLnIEOy51Xxy7T0276E=;
        b=vyT9iRvBkAPxrhUM4loOuXv0ZWxpARTSozCHpx4ia9Cea9tMKrN/2RonnEmIi/91Y6
         D9/kIxa3brvZlRc6QGKk01Hyt0jEboWVl3Z8oGFhLtizQUeXWjYBQlLJ3hEkbES8ojIp
         xRHERUnWaRuKMo9qbYUtw33JY4PImnq6niFxGhMqp8fDR7KFDwcJ/mK4TqIKH6HSmO9R
         Cw2H5HztJsHwRfX7RoC4cz33QJ8+8AwE8bdX3ip787drt5sStO7eeTcFQcC2vu6O5EC1
         Jrv3s4q/GFzOUfGTyRixDp4N8PQ6wNQ7wlh9jGLouPYEjbTRIjnzGQFCnlolt9BIg96Q
         MmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691189136; x=1691793936;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qzzGQVsyCKQuIHhNuvYJJsNQNLnIEOy51Xxy7T0276E=;
        b=iHyABKaKzfsR3P6rc3TpfcOFIpbzO97TUYq39OPoSc1xK3PCbVS4MeAGWmXF7Sb3V3
         lhv71zKOodFlmFwLzCH8pmDgMRjNvQ6mgLhyrAwqS4jtJlzSIQNBmbvpFqJQGP8e1vNr
         XOMqrgdtt80CpENGxAJlW0uRCz76JvOyIj6AElgfR2axTHKAMVadrk9rURtV+8Zt9IWb
         v58eswgn1QzAegIXOrYSmNS1TNx6HR4cQ4G7CmHWDinXpiKGj+IiErE1HXN+e5bv7P41
         kG4mG5ctCqQ+8R08KshenkL0dDBtk9cR/l3sdVMjPxiiEkkZdWh/UBj6EQehYB2ro9+z
         0E5g==
X-Gm-Message-State: AOJu0Yx1t2WqByyIf+S0t+HnDI1qZ2dXXGoFdaLC7YPPoXUl1iBgo4Eb
	Fwl7jVs4TubzZkAwPJF0SzY06sS4wEY=
X-Google-Smtp-Source: AGHT+IEWfwtnQQ08PS920/iWYAxu1snSlSkt7kEi/UPqLCtV3oacTE1j6eL7G0tfMsosYlmzaiDwjq+gcnQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:6b4a:0:b0:cb6:6c22:d0f8 with SMTP id
 o10-20020a256b4a000000b00cb66c22d0f8mr16070ybm.4.1691189136427; Fri, 04 Aug
 2023 15:45:36 -0700 (PDT)
Date: Fri, 4 Aug 2023 15:45:34 -0700
In-Reply-To: <CAD=HUj41PAKC0x+c3zWAr-aCm59K7hs2zRh1uWs9778_Mai4UA@mail.gmail.com>
Mime-Version: 1.0
References: <20230704075054.3344915-1-stevensd@google.com> <20230704075054.3344915-6-stevensd@google.com>
 <20230705101800.ut4c6topn6ylwczs@linux.intel.com> <CAD=HUj41PAKC0x+c3zWAr-aCm59K7hs2zRh1uWs9778_Mai4UA@mail.gmail.com>
Message-ID: <ZM1/jhJXu8OGUrkb@google.com>
Subject: Re: [PATCH v7 5/8] KVM: x86/mmu: Don't pass FOLL_GET to __kvm_follow_pfn
From: Sean Christopherson <seanjc@google.com>
To: David Stevens <stevensd@chromium.org>
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
Cc: kvm@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 06, 2023, David Stevens wrote:
> On Wed, Jul 5, 2023 at 7:17=E2=80=AFPM Yu Zhang <yu.c.zhang@linux.intel.c=
om> wrote:
> >
> > On Tue, Jul 04, 2023 at 04:50:50PM +0900, David Stevens wrote:
> > > From: David Stevens <stevensd@chromium.org>
> > >
> > > Stop passing FOLL_GET to __kvm_follow_pfn. This allows the host to ma=
p
> > > memory into the guest that is backed by un-refcounted struct pages - =
for
> > > example, higher order non-compound pages allocated by the amdgpu driv=
er
> > > via ttm_pool_alloc_page.
> >
> > I guess you mean the tail pages of the higher order non-compound pages?
> > And as to the head page, it is said to be set to one coincidentally[*],
> > and shall not be considered as refcounted.  IIUC, refcount of this head
> > page will be increased and decreased soon in hva_to_pfn_remapped(), so
> > this may not be a problem(?). But treating this head page differently,
> > as a refcounted one(e.g., to set the A/D flags), is weired.
> >
> > Or maybe I missed some context, e.g., can the head page be allocted to
> > guest at all?
>=20
> Yes, this is to allow mapping the tail pages of higher order
> non-compound pages - I should have been more precise in my wording.
> The head pages can already be mapped into the guest.

Recording for posterity (or to make an incorrect statment and get corrected=
),
because I recently had a conversation about the head page not actually bein=
g
refcounted.  (I can't remember with whom I had the conversation, but I'm pr=
etty
sure it wasn't an imaginary friend).

Even though whatever allocates the page doesn't explicit refcount the head =
page,
__free_pages() will still do the right thing and (a) keep the head page aro=
und
until its last reference is put.  And my understanding is that even though =
it's
a "head" page, it's not a PG_head page, i.e. not a compound page and so is =
treated
as an order-0 page when KVM invoke put_page().

void __free_pages(struct page *page, unsigned int order)
{
	/* get PageHead before we drop reference */
	int head =3D PageHead(page);

	if (put_page_testzero(page))  <=3D=3D=3D will evaluate false if KVM holds =
a ref
		free_the_page(page, order);
	else if (!head)  <=3D=3D=3D will be false for non-compound pages
		while (order-- > 0)
			free_the_page(page + (1 << order), order);
}
EXPORT_SYMBOL(__free_pages);
