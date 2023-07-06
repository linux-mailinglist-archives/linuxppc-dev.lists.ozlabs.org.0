Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3951D749525
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 07:54:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GZRLr3+/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxQh815X1z3bwZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 15:54:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GZRLr3+/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=stevensd@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxQgF0P3Sz30MY
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 15:53:10 +1000 (AEST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b703caf344so3444101fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jul 2023 22:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688622786; x=1691214786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbLurLZ62LRhBoyKK/a+NkMCNn75BCIX5dmoVcJnOa4=;
        b=GZRLr3+/iND4JiH/eec95IEfwzWiwvuMeewhoW9LLRb5Yu/99cTNAL1uQuRKsNRAbR
         0wkM50R3efN4vAq8LK923KkRdgxTsnCIhWVut85AV4dlUZIUz26nPcE0AmQYEOorUmjh
         k/ccFYU0ooJp8B2LxZPf8d8q1xZ3Oo6bDy+Lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688622786; x=1691214786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MbLurLZ62LRhBoyKK/a+NkMCNn75BCIX5dmoVcJnOa4=;
        b=QjaqmpZp8Rlbn8pR4VDQtbon8sTnvVmuPoFCnUdANA8hWZOzkUE5TIehPE0GMx3zKv
         ja4yJcQzzXiOVFBA7q4maCjr3QaolfM/zZ36UGrOvuEvijwDy0ruj27lkenixr1VSnU0
         WicRp7VvVlF5FvwAbtkSl44msD8Q1VQBFT9v7LgKU5IHc5AIEXd26Sarhz1aN0dJ84J5
         NZnrhtpABJcxyduTzuEbLTSw7jmKCtBGPATeeO8HOe/0/XDGbR1uzKJgVm83FU5xUSan
         sUbdALPH48nNuETewO/An1IoS2usSw1on5+wKvRYAYp8kaxsq1apHQiV9fC3NYOU5Vw0
         vw9A==
X-Gm-Message-State: ABy/qLa8y0yOwZhJov7zVXbAgnEg8GxlNqZ0BszNrvr6GByl7EGTnZxp
	OiW/jkzdUzE5WlaD0j3cp0pfAAYLKwVsygsHG2cXyA==
X-Google-Smtp-Source: APBJJlF24HPQiLK/1UsY/Js5Vw/5R/DCo1JszMm+dpVp9f3gL+oA7VggoMNxpxtVwaFC87wS94UcWfopl/L3i9jY5zk=
X-Received: by 2002:a2e:9015:0:b0:2b6:de41:b72f with SMTP id
 h21-20020a2e9015000000b002b6de41b72fmr578113ljg.4.1688622786051; Wed, 05 Jul
 2023 22:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230704075054.3344915-1-stevensd@google.com> <20230704075054.3344915-3-stevensd@google.com>
 <20230706013423.GA3894444@ls.amr.corp.intel.com>
In-Reply-To: <20230706013423.GA3894444@ls.amr.corp.intel.com>
From: David Stevens <stevensd@chromium.org>
Date: Thu, 6 Jul 2023 14:52:55 +0900
Message-ID: <CAD=HUj4e3G6W74CyxicGH5k8mLmXt+JUK0ju5LCC6ESQ7EYgqQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/8] KVM: Introduce __kvm_follow_pfn function
To: Isaku Yamahata <isaku.yamahata@gmail.com>
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
Cc: Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 6, 2023 at 10:34=E2=80=AFAM Isaku Yamahata <isaku.yamahata@gmai=
l.com> wrote:
>
> On Tue, Jul 04, 2023 at 04:50:47PM +0900,
> David Stevens <stevensd@chromium.org> wrote:
>
> > From: David Stevens <stevensd@chromium.org>
> >
> > Introduce __kvm_follow_pfn, which will replace __gfn_to_pfn_memslot.
> > __kvm_follow_pfn refactors the old API's arguments into a struct and,
> > where possible, combines the boolean arguments into a single flags
> > argument.
> >
> > Signed-off-by: David Stevens <stevensd@chromium.org>
> > ---
> >  include/linux/kvm_host.h |  16 ++++
> >  virt/kvm/kvm_main.c      | 171 ++++++++++++++++++++++-----------------
> >  virt/kvm/kvm_mm.h        |   3 +-
> >  virt/kvm/pfncache.c      |   8 +-
> >  4 files changed, 122 insertions(+), 76 deletions(-)
> >
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 9d3ac7720da9..ef2763c2b12e 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -97,6 +97,7 @@
> >  #define KVM_PFN_ERR_HWPOISON (KVM_PFN_ERR_MASK + 1)
> >  #define KVM_PFN_ERR_RO_FAULT (KVM_PFN_ERR_MASK + 2)
> >  #define KVM_PFN_ERR_SIGPENDING       (KVM_PFN_ERR_MASK + 3)
> > +#define KVM_PFN_ERR_NEEDS_IO (KVM_PFN_ERR_MASK + 4)
> >
> >  /*
> >   * error pfns indicate that the gfn is in slot but faild to
> > @@ -1156,6 +1157,21 @@ unsigned long gfn_to_hva_memslot_prot(struct kvm=
_memory_slot *slot, gfn_t gfn,
> >  void kvm_release_page_clean(struct page *page);
> >  void kvm_release_page_dirty(struct page *page);
> >
> > +struct kvm_follow_pfn {
> > +     const struct kvm_memory_slot *slot;
> > +     gfn_t gfn;
> > +     unsigned int flags;
> > +     bool atomic;
> > +     /* Allow a read fault to create a writeable mapping. */
> > +     bool allow_write_mapping;
>
> Maybe, make them const for input arguments?

Unfortunately using const isn't straightforward as long as the kernel
continues to use -Wdeclaration-after-statement. If these fields were
const, then they would need to be specified in the initializer when
declaring the variable, but that's not necessarily always possible.

-David
