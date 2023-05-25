Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1626711886
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 22:54:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QS0fT4F9Yz3fGv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 06:54:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=PRDb4uH8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=PRDb4uH8;
	dkim-atps=neutral
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QS0dc1gPkz3fBm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 06:53:38 +1000 (AEST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-565a022ef06so2574387b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 May 2023 13:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685048015; x=1687640015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e72vGCwhPoa8gN25X6qmdDXVUsdWWJFQx8MjqDcoGDA=;
        b=PRDb4uH8g3Vv6gZWsZ1gkHY+ANMWnqtSqEQNi+t68NKJyRAPGtGIjXS+o6ABKHZ7yv
         q51K7Vr8Q1brsvSZQkdt4WeLJo6vXr04Grr6RxGrB/PY5E3pp1cBQWvGni0wb9TWYIbM
         5FWOkPlw4M42rE2TxcMBGldDhB3WLqb55j0CqgwQEW0TmVHxxCeHx2Zs7VLCqGumlN8c
         PmQWTAjBOIMu7fHadjtAjQF7IDQQLa3x/OUyFY2aJiBpGADt0K07OCNxrHer3KqiVV69
         GxawL7cJdKwcX3ZUAGYa8EVBTKoLWza/yXtntrwGkP8KyxHL6U40gF5XovIoxt2V2Fr9
         5Wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685048015; x=1687640015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e72vGCwhPoa8gN25X6qmdDXVUsdWWJFQx8MjqDcoGDA=;
        b=kJADxOuNy2GSPrpJ2oI2Myq+a77E7QQdX44htIlT2Mg8sHmy4d3RUnpgBm7uG6oEW0
         d+2RV8gFtHIJvT52hjgQpAyf7Xr7ZpFEaENWlqegs492SP02Y46X62jHWPsT8/RM3brQ
         e5kqoiwxnynSnoMQ8f1HUYfhYGBTUGBBJVH7cEBCRvNuNWau2WCTFuuX9rHgl6lqsYyY
         KPF0g6S5xr1744ZatUe7J4h+16heCRlfbB1ofsd2fZE9c1IxvsNPpy+z5/+PJsid07al
         7+2qQA+6f9bbwHsekzc6rxgXsooKSBNKCg6hYoXG90PGl5BHZes2/5s+C8UgE0avGTR4
         hBzw==
X-Gm-Message-State: AC+VfDyPLo4lLzCU29i+DVNOR/FSaabDvVS+2B2LUIMFkTzfeVpYUW7h
	WBgk1ICOo4sNIwMMyw8gtv0DU/nIfG2IgxICSg4=
X-Google-Smtp-Source: ACHHUZ6an6zID91jt8f3LQ4QGAvFJ9u++x53xf0fSCLXe0WivFCmGXJlgIcqvJgo7KICituWVYFJf3qgdSw5/O75Zdg=
X-Received: by 2002:a81:4810:0:b0:55a:84c9:e952 with SMTP id
 v16-20020a814810000000b0055a84c9e952mr1013445ywa.17.1685048014974; Thu, 25
 May 2023 13:53:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-6-vishal.moola@gmail.com> <20230525090956.GX4967@kernel.org>
 <CAOzc2pxSH6GhBnAoSOjvYJk2VdMDFZi3H_1qGC5Cdyp3j4AzPQ@mail.gmail.com> <20230525202537.GA4967@kernel.org>
In-Reply-To: <20230525202537.GA4967@kernel.org>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 25 May 2023 13:53:24 -0700
Message-ID: <CAOzc2pxD21mxisy-M5b_SDUv0MYwNHqaVDJnJpARuDG_HjCbOg@mail.gmail.com>
Subject: Re: [PATCH v2 05/34] mm: add utility functions for ptdesc
To: Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Matthew Wilcox <willy@infradead.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 25, 2023 at 1:26=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Thu, May 25, 2023 at 11:04:28AM -0700, Vishal Moola wrote:
> > On Thu, May 25, 2023 at 2:10=E2=80=AFAM Mike Rapoport <rppt@kernel.org>=
 wrote:
> > > > +
> > > > +static inline struct ptdesc *ptdesc_alloc(gfp_t gfp, unsigned int =
order)
> > > > +{
> > > > +     struct page *page =3D alloc_pages(gfp | __GFP_COMP, order);
> > > > +
> > > > +     return page_ptdesc(page);
> > > > +}
> > > > +
> > > > +static inline void ptdesc_free(struct ptdesc *pt)
> > > > +{
> > > > +     struct page *page =3D ptdesc_page(pt);
> > > > +
> > > > +     __free_pages(page, compound_order(page));
> > > > +}
> > >
> > > The ptdesc_{alloc,free} API does not sound right to me. The name
> > > ptdesc_alloc() implies the allocation of the ptdesc itself, rather th=
an
> > > allocation of page table page. The same goes for free.
> >
> > I'm not sure I see the difference. Could you elaborate?
>
> I read ptdesc_alloc() as "allocate a ptdesc" rather than as "allocate a
> page for page table and return ptdesc pointing to that page". Seems very
> confusing to me already and it will be even more confusion when we'll sta=
rt
> allocating actual ptdescs.

Hmm, I see what you're saying. I'm envisioning this function evolving into
one that allocates a ptdesc later. I don't see why we would need to have bo=
th a
page table page AND ptdesc at any point, but that may be a lack of knowledg=
e
from my part.

I was thinking later, if necessary, we could make another function
(only to be used internally) to allocate page table pages.
