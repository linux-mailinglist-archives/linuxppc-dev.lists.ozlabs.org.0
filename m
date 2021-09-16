Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E3340D101
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 02:41:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8yv70HQMz30Ph
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 10:41:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bluescreens.de (client-ip=2001:67c:2050::465:102;
 helo=mout-p-102.mailbox.org; envelope-from=cmr@bluescreens.de;
 receiver=<UNKNOWN>)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050::465:102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8ytk078Zz2yJP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Sep 2021 10:41:01 +1000 (AEST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4H8ytd6T7YzQjym;
 Thu, 16 Sep 2021 02:40:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Subject: Re: [PATCH v6 4/4] powerpc/64s: Initialize and use a temporary mm
 for patching on Radix
From: "Christopher M. Riedl" <cmr@bluescreens.de>
To: "Jordan Niethe" <jniethe5@gmail.com>
Date: Wed, 15 Sep 2021 19:45:24 -0500
Message-Id: <CEAW7GNXW96H.18ANPMC01JA2C@wrwlf0000>
In-Reply-To: <CACzsE9qr6QK_Xm6yVXT061sxR9SXaeFx5fkjiNAXFBFr6WDQOw@mail.gmail.com>
X-Rspamd-Queue-Id: 0FFAF1813
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Sep 14, 2021 at 11:24 PM CDT, Jordan Niethe wrote:
> On Sat, Sep 11, 2021 at 12:39 PM Christopher M. Riedl
> <cmr@bluescreens.de> wrote:
> > ...=20
> > +/*
> > + * This can be called for kernel text or a module.
> > + */
> > +static int map_patch_mm(const void *addr, struct patch_mapping *patch_=
mapping)
> > +{
> > +       struct page *page;
> > +       struct mm_struct *patching_mm =3D __this_cpu_read(cpu_patching_=
mm);
> > +       unsigned long patching_addr =3D __this_cpu_read(cpu_patching_ad=
dr);
> > +
> > +       if (is_vmalloc_or_module_addr(addr))
> > +               page =3D vmalloc_to_page(addr);
> > +       else
> > +               page =3D virt_to_page(addr);
> > +
> > +       patch_mapping->ptep =3D get_locked_pte(patching_mm, patching_ad=
dr,
> > +                                            &patch_mapping->ptl);
> > +       if (unlikely(!patch_mapping->ptep)) {
> > +               pr_warn("map patch: failed to allocate pte for patching=
\n");
> > +               return -1;
> > +       }
> > +
> > +       set_pte_at(patching_mm, patching_addr, patch_mapping->ptep,
> > +                  pte_mkdirty(mk_pte(page, PAGE_KERNEL)));
>
> I think because switch_mm_irqs_off() will not necessarily have a
> barrier so a ptesync would be needed.
> A spurious fault here from __patch_instruction() would not be handled
> correctly.

Sorry I don't quite follow - can you explain this to me in a bit more
detail?
