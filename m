Return-Path: <linuxppc-dev+bounces-1352-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4354978B90
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2024 00:57:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X58pD4fL4z2yn2;
	Sat, 14 Sep 2024 08:57:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::82d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726244855;
	cv=none; b=CYfch6AR+pL85r2Wm64E9xcdL6uMhGZEmC6OM4zj5b2mYpY+wu2+kaEikAoVRinTnZLgRHETlNNSuAiXR8JNhSEOK8rYuW3++Tkj0Wtmq9vN3607flJ8glyzDfYqHMyaG9xTDyplWk7q/Ms8GeM7bDupgD7YTSwkbVpXJnYXkqQIELECqQ1oRaXKo03wPkGjfEd75syJPsQyb8SfZjVZpcN3803tOWuRCXFtZ99OYyEQEMB9P4puqtMlokd1HznVp81TjI5+Z2YeGddFKHpakVNAzDZrHLiumZwKPXhCLccBE08HTasZVWXRf/9D/TSaGN3tYE9AXBl/DyFIR2/lOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726244855; c=relaxed/relaxed;
	bh=Kaogzt0x83O50oW2Cdc8KsfEPIv2RHrKFooPdPcHuF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D0U6DR7CEQ6wAElycMhH+vxypBMuCWWGTYbGrQrelz+bLWZ64I08OpBp/CDPmCdeulY/jLocLiPrdRf6Px2hZdlg5vdSq0AsnVy9TV77lUO9giWYQGhVFja9/18R+SwCFZhfo7NbVqT4V/vR8Ukfod5P5dIxWfMPjObMc8qIjv8oTqjFnsWYecalFW+ahCZQW4x+ZA54kozu93YGEjI5R9Lf2fAuxok7Sw4HeDqttPl9dYAXxkCXjxdYNPDzofuMpximFAxKHP86N3tv38dUbk0+UMjUy4fPJCCN24ZPFZ7tNGH1c6gIw7PQu8SluNLGJq7jxb/i6AS+CGld/nX1uA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JGBL/yi0; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com; envelope-from=almasrymina@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JGBL/yi0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com; envelope-from=almasrymina@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X508R0G2Mz2yvh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 02:27:33 +1000 (AEST)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4582a5b495cso234271cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 09:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726244850; x=1726849650; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kaogzt0x83O50oW2Cdc8KsfEPIv2RHrKFooPdPcHuF0=;
        b=JGBL/yi04KU56JKySZm9Ka4cpjddpqHeq6j8QtSUpx6wTwishbTylWKzTKlFuW0ide
         7wB3jLlBCXz70SEsEtHcwC8XpmTou5BwoB/U3idj5dKDFZwsUozfsYX1b5xWhDwI+Vjo
         ZWn332+rVLw87h2vakjh0h3rteyHAzFzmfbvzOfyZsIij7WppyjiB3dD6L5ydsMJ2sL4
         fphXmWk/Hz5bLZIlhcCmtAauFznuPcBeCH8Lxux878r4GDq1hje+u+Cw9RvCOnNRAQFL
         XM0mHXVMc9lXSWZioSkwwnc+sUKeUytsF0xDaHLPnK2eVJvrByN8l1m0MMuwPoI4ql11
         lzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726244850; x=1726849650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kaogzt0x83O50oW2Cdc8KsfEPIv2RHrKFooPdPcHuF0=;
        b=HgMIhAIwul0k6+jLL43vRi3vt6jW3yS1vJ6x6WPVaj9uqGXcM9iv/U8aVDCRr/Aq2i
         bWR8tVWA4qy3OYXbcmfo4Ee7aS4FPnnlUTw+RNGseKLnwK4o6YAKYi9EVUdGufxdE+/d
         HJFXFrl8EoP8CS1ItyxzoUggdJDz+P5GNVWJshkzSa4NgL3UsIOPQGio4bK4JUxPXiwi
         8EL+eOXd4XKAU3VhLU18Rn2eC/fnzr7kVCHvfJFNB+/Dq/G+S5Pi/NT/5dMojf8CU7QS
         j3x9nO39yx5zZx/4Qx9EhpDDvZCx473lmdmjiPSD1uRghD+k/iUG5CqkWJtsTH/yaNzf
         uR+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNY757amVEoXz3BEO+5IXi2KH7Zd541PyfTpuFQrYq+Umoxj5CS6nJlct+dHkc+cbxGme8ongcq6PuhzA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxjWTXy1+MnZGgGfbeNhj01/hOA31N5fSePOJsKEJka3S+5/DDy
	WYn1bjirHmfwvYPTjEBJrWsJN/PefgWjg9FqutmxHobNp7PQ0qxQQPUZuUjTlf4+8Aeun+sVZ8/
	FHd6RQIqDVZLXeOSeZu2bxUhYyIBkJelyFQuU
X-Google-Smtp-Source: AGHT+IFLIVO3GAQiV32AIRq5tRq8/+Y6XmNS4xK792rwOjota6Ua04VI9PjqMQ/wHusA5aDseJUdCQZv6B0+BHgZ16k=
X-Received: by 2002:a05:622a:4cc:b0:456:796b:2fe5 with SMTP id
 d75a77b69052e-45864512051mr7158501cf.9.1726244849858; Fri, 13 Sep 2024
 09:27:29 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240913125302.0a06b4c7@canb.auug.org.au> <20240912200543.2d5ff757@kernel.org>
 <20240913204138.7cdb762c@canb.auug.org.au> <20240913083426.30aff7f4@kernel.org>
 <20240913084938.71ade4d5@kernel.org> <913e2fbd-d318-4c9b-aed2-4d333a1d5cf0@cs-soprasteria.com>
In-Reply-To: <913e2fbd-d318-4c9b-aed2-4d333a1d5cf0@cs-soprasteria.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 13 Sep 2024 09:27:17 -0700
Message-ID: <CAHS8izPf29T51QB4u46NJRc=C77vVDbR1nXekJ5-ysJJg8fK8g@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the net-next tree
To: christophe.leroy2@cs-soprasteria.com
Cc: Jakub Kicinski <kuba@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
	Networking <netdev@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 9:13=E2=80=AFAM LEROY Christophe
<christophe.leroy2@cs-soprasteria.com> wrote:
>
>
>
> Le 13/09/2024 =C3=A0 17:49, Jakub Kicinski a =C3=A9crit :
> > On Fri, 13 Sep 2024 08:34:26 -0700 Jakub Kicinski wrote:
> >>> The second "asm" above (CONFIG_PPC_KERNEL_PREFIXED is not set).  I am
> >>> guessing by searching for "39" in net/core/page_pool.s
> >>>
> >>> This is maybe called from page_pool_unref_netmem()
> >>
> >> Thanks! The compiler version helped, I can repro with GCC 14.
> >>
> >> It's something special about compound page handling on powerpc64,
> >> AFAICT. I'm guessing that the assembler is mad that we're doing
> >> an unaligned read:
> >>
> >>     3300         ld 8,39(8)       # MEM[(const struct atomic64_t *)_29=
].counter, t
> >>
> >> which does indeed look unaligned to a naked eye. If I replace
> >> virt_to_head_page() with virt_to_page() on line 867 in net/core/page_p=
ool.c
> >> I get:
> >>
> >>     2982         ld 8,40(10)      # MEM[(const struct atomic64_t *)_94=
].counter, t
> >>
> >> and that's what we'd expect. It's reading pp_ref_count which is at
> >> offset 40 in struct net_iov. I'll try to take a closer look at
> >> the compound page handling, with powerpc assembly book in hand,
> >> but perhaps this rings a bell for someone?
> >
> > Oh, okay, I think I understand now. My lack of MM knowledge showing.
> > So if it's a compound head we do:
> >
> > static inline unsigned long _compound_head(const struct page *page)
> > {
> >          unsigned long head =3D READ_ONCE(page->compound_head);
> >
> >          if (unlikely(head & 1))
> >                  return head - 1;
> >          return (unsigned long)page_fixed_fake_head(page);
> > }
> >
> > Presumably page->compound_head stores the pointer to the head page.
> > I'm guessing the compiler is "smart" and decides "why should I do
> > ld (page - 1) + 40, when I can do ld page + 39 :|
> >
> > I think it's a compiler bug...
> >
>
> Would it work if you replace it with following ?
>
>         return head & ~1;
>

I was able to reproduce with the correct compiler version, and yes,
this fixes the build for me. Thanks!

Probably healthy to add UL, yes?

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 5769fe6e4950..ea4005d2d1a9 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -239,8 +239,8 @@ static inline unsigned long _compound_head(const
struct page *page)
 {
        unsigned long head =3D READ_ONCE(page->compound_head);

-       if (unlikely(head & 1))
-               return head - 1;
+       if (unlikely(head & 1UL))
+               return head & ~1UL;
        return (unsigned long)page_fixed_fake_head(page);
 }

Other than that I think this is a correct fix. Jakub, what to do here.
Do I send this fix to the mm tree or to net-next?

--=20
Thanks,
Mina

