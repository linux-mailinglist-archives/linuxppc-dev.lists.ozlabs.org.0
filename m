Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1B471184A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 22:39:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QS0Kg67tLz3fDl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 06:39:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=hsCL+sMj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=hsCL+sMj;
	dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QS0Js2jdTz3fBm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 06:39:08 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-bacf685150cso182101276.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 May 2023 13:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685047145; x=1687639145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbD1OYIGibvwFMRrdJMTdc4wGgHOsGEW6NjvtgF3JXU=;
        b=hsCL+sMjCSPEeQwY9ipI1+Ugi88AzJEwmAmsO1IR16vD0JLbTTRj1EWY5Xyhze+GRV
         OIRanM33HOk1xRjR7/GHHUD5lVS6HFpcFxeDfzeE8/I0OcBZz8czUxvwLPGCPl3ZI/jZ
         DVqHoFaNkDaMUMuSYvpfhlO6EV7GylFCaeIZ84F6j+93L973raF6hD3O66C/pZ4eWLz+
         QLbFT/lbaOp/9U1+H051UFvXelrd7lzOtz3vj1HsEWe84ksN1HTRbSJYJedE8uZu9k6u
         F1jI+oM85Ujez7vT22bFzFiXTlvVTKRouPJkd38Xldm/McWaSi1VxP376ACeyocGF45q
         tGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685047145; x=1687639145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VbD1OYIGibvwFMRrdJMTdc4wGgHOsGEW6NjvtgF3JXU=;
        b=V8VbZx1Vz8M+vmaH2dMh0X93kX14KlphuBIII0AAT6y6U7SDiaZsMBbbzufbVWTPtg
         wJczjn583Cd2LFQhOy7JGE1033M8cMwirF25/sVV3xXek52PRNk9uxgwum4qTbsx3pyr
         2idMtbE/h3+9CAwReQw2LhBeUgD9DXCYlc+D9IOL9SngMiETUI3P3e4Cj1BYDT8D18cp
         z0sPmVYVIlzaIVLZPJ80ImdfUqecejb6RdrDHlL6sZ/fYKmfnG0Qz4xMqjE/VGdKUVUl
         2YddLmLVdnhIqmGs8WswZ+PuvYfGov35lW104q0o7slsl+pzpfALtctljMS8w84rIzjI
         j+aw==
X-Gm-Message-State: AC+VfDw6oNHAXl3EZt2Bupi++c4hfxWiVkI5uHwcyCtGpwM7OENRRi/h
	38IizcymMKxA8tEVwGyE4v0UUuYC3g83EPZmXgo=
X-Google-Smtp-Source: ACHHUZ4OcPsUwJDpZZlKfNKbpYbRuRkX6Q4UETTfFRyNyytwfdAtGP02e8IuqJSt1+a/7sd0aU+yePVkYawV73NLE1o=
X-Received: by 2002:a25:d111:0:b0:ba8:4b48:1de0 with SMTP id
 i17-20020a25d111000000b00ba84b481de0mr4810389ybg.47.1685047145065; Thu, 25
 May 2023 13:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-2-vishal.moola@gmail.com> <20230525085555.GV4967@kernel.org>
 <CAOzc2pxx489C26NnS9NHkUQY9PYiagzt-nYK6LnkJ1N3NYQWzg@mail.gmail.com> <20230525202011.GZ4967@kernel.org>
In-Reply-To: <20230525202011.GZ4967@kernel.org>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 25 May 2023 13:38:54 -0700
Message-ID: <CAOzc2pzGPBYL3S=noc1AAEtep04GexRmn2f_T3BPgVFZKaqXTg@mail.gmail.com>
Subject: Re: [PATCH v2 01/34] mm: Add PAGE_TYPE_OP folio functions
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

On Thu, May 25, 2023 at 1:20=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Thu, May 25, 2023 at 10:00:23AM -0700, Vishal Moola wrote:
> > On Thu, May 25, 2023 at 1:56=E2=80=AFAM Mike Rapoport <rppt@kernel.org>=
 wrote:
> > >
> > > Hi,
> > >
> > > On Mon, May 01, 2023 at 12:27:56PM -0700, Vishal Moola (Oracle) wrote=
:
> > > > No folio equivalents for page type operations have been defined, so
> > > > define them for later folio conversions.
> > >
> > > Can you please elaborate why would we need folios for page table desc=
riptors?
> >
> > Thanks for the review!
> >
> > These macros are for callers that care about the page type, i.e. Table =
and
> > Buddy. Aside from accounting for those cases, the page tables don't use=
 folios.
> > These are more for the cleanliness of those callers.
>
> But why using folio APIs for PageType will be cleaner than using page API=
s?
> Do you have an example?

Ah, for example in mm/memory-failure.c there are a couple uses of PageTable=
.
Like the line :
if (folio_test_slab(folio) || PageTable(&folio->page) ||
folio_test_reserved(folio))
where that PageTable(&folio->page) can now be written as folio_test_table(f=
olio)
instead.

Also there are numerous uses of PageBuddy in mm/compaction.c that will
likely need to be converted to folios as well.
