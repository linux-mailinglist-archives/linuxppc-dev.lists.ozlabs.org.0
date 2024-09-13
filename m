Return-Path: <linuxppc-dev+bounces-1363-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0768978BDA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2024 01:26:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X59RY2Dcbz3020;
	Sat, 14 Sep 2024 09:26:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::833"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726269977;
	cv=none; b=Z0sfZDo2TaO54nJF+IPLGOkdeX8LHbo24TbeUKwbkHGUirrag9MR9cVIpcwy3sSFFmufabofWRWTl+b79TlzSlKbLgT4eB3U/LwnoikdJ+IckEExPoK/wKjCNv34QPO1OiMoQqsfS0wrvrIw5HavMjC3rP6+BD74Ii8FpI/JDBaLp11CnhqAwP95ybmznPuA6bkxZbg/re1vs9j0ykVA2yD/MsIStCcy0EGGszJ+vFO9G0RMQpUn+54VDdr7rejzkTOoiFOK5ErX21m1u+eVwyJrppyai4gEB5pLqAGc8XqUEENo2ECOXNtTecLNcn5/4YjSXqMB/NwIgFiiMZawuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726269977; c=relaxed/relaxed;
	bh=y/zSGPiOArXOzzX0HwJWO9XDkJRj9M2wk/pUWi0k/Ks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T7SxcpMXacLlxxplpJ2AS9oxM59aUOPKYaQ3IEQDTFhuXOCPK6cNw1muYrWJuckpQSIBLQ6BV/77kPSu7vP391TJoTzYIwdAZcKG3Qy4v9YysbPcjJnaeqKt2V40HzknJQzZCWe3UeoilZUnPntzOjfQtLPosx8vNN+aNYGR9m0yUZP9yjEKRVGT7ChWXhwpVsDRJd+L65M7IGDpGOQ+mRijgQJQhgmLaXmdSTHoU3MLm1BoPJ7H4jbDqcYZV1nMkfBmynE5ZSVCfeQRDrbCXzCsjo/EFsR/a38TfRKP4FUHogjyJc5agRGMyQh8fkO6wuNz3G1A7klAUbCyCL7erw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JZ/cFaCv; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com; envelope-from=almasrymina@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JZ/cFaCv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com; envelope-from=almasrymina@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X59RX2kBRz2ywC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 09:26:15 +1000 (AEST)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4581cec6079so108331cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 16:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726269973; x=1726874773; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/zSGPiOArXOzzX0HwJWO9XDkJRj9M2wk/pUWi0k/Ks=;
        b=JZ/cFaCvqJk9Fi/WjtbVvOwZu/4H5S9mNkjNeXHLgh51xYAAR3c77n6G72Vna3HCLe
         wVrpZvFtkEGt2iCbA5/g6z9fSsyePwvu7rGgPmRzmS7EQPj5o4GGG2VE4pyaXnoXS53E
         75Ntv+Q71J9gwtM8iOHciuIVioAbHL3AYne669/nYQH+IvglAacYdHyi2Wad3jB/7lvo
         Epm4WXWnTvJzktK+cY7Pma2CpG6/Oc+bLdgVA5Tje0RYecXDi/0senxh6Pdzjpr3bMAI
         GupnXB430BI1V5XZhG1KMXNEUX7CooNuKDyCTu7IplzfhXKvtf8WRAKdMtC6mCzANBNg
         r5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726269973; x=1726874773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/zSGPiOArXOzzX0HwJWO9XDkJRj9M2wk/pUWi0k/Ks=;
        b=b8KFJCcALz4gy0aEfe4BsulGqj7VKROREl+URUQt1vtmq9V6IuE5vZt6uvpt0aZEu9
         uxddHelU7QMUltVLFEl4ND12rolNxoAALd4YC5shCrcnOzFo0d8cQx3cATDWSPycGKze
         LzfnuhoHYvcb6K5wlvFO7ldZ9TQG6hFeyJvxkwawcpgVsT3XK1ni63HTRvGWp7+AUSoA
         H3yviGrxqgXx304wZ8SJKv2QKgMF/RuwIVTvW16HGMGQmwyitgK7OlWiBUFiVTf4I+TQ
         1P7FA5WqtjvsnLYUevgDZr+8gZbvQojh55vDnM7SOl0EJ7x/dkTvHxvBd3DFP1fdq0TP
         kLkg==
X-Forwarded-Encrypted: i=1; AJvYcCV/NMhuxRG6IHwc8I9tZtTqk/F/W/WFNR2gUiPLmsFrFGhF7OP7UnOqxJBLA7sIFwst0IpKxrMrE/pBXKs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzTCHaPrK27Pr7mBlGHk3IAGgei2MNgqB/Yi2zHQwo1V0NXQenx
	jQ0XgbCv33M92f320R6bg9pOchNpNEbGLEMtCyR3Zq1CCPWk6YwNVF/4DN4g3QNuSVHZqDRtt6Y
	MjpLf/8XffYHB+PIQXp0O3cE1tXcoHamrPNyj
X-Google-Smtp-Source: AGHT+IEXO5gvdbs+il7CDpTLc6xhdGle0XlSKxYKCooQsafNwkd1uFCAY64vKMmqs8XWP2QDEPY442O3slWn7LVJZhU=
X-Received: by 2002:ac8:5a89:0:b0:456:7513:44ba with SMTP id
 d75a77b69052e-45860789e90mr8634561cf.4.1726269972348; Fri, 13 Sep 2024
 16:26:12 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240913213351.3537411-1-almasrymina@google.com>
 <ZuS0x5ZRCGyzvTBg@mini-arch> <ZuS1u8G6M9ch2tLC@casper.infradead.org> <ZuS8Zp_iiMfi0PX9@mini-arch>
In-Reply-To: <ZuS8Zp_iiMfi0PX9@mini-arch>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 13 Sep 2024 16:26:00 -0700
Message-ID: <CAHS8izMV48MeqcFB3QS_TkHNLWkQb1CjFrMk+XSS4dVqO66t2w@mail.gmail.com>
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 3:27=E2=80=AFPM Stanislav Fomichev <stfomichev@gmai=
l.com> wrote:
>
> On 09/13, Matthew Wilcox wrote:
> > On Fri, Sep 13, 2024 at 02:55:19PM -0700, Stanislav Fomichev wrote:
> > > On 09/13, Mina Almasry wrote:
> > > > Building net-next with powerpc with GCC 14 compiler results in this
> > > > build error:
> > > >
> > > > /home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
> > > > /home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (3=
9 is
> > > > not a multiple of 4)
> > > > make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229:
> > > > net/core/page_pool.o] Error 1
> > >
> > > Are we sure this is the only place where we can hit by this?
> >
> > It's a compilation error, so yes, we're sure.
>
> We also have netmem_compound_head() which does page_to_netmem(compound_he=
ad()).
> Wondering whether we'll eventually hit a similar issue over there.

A bit of a head scratcher why the compiler isn't running into the same
issue for netmem_compound_head.

The callsites of netmem_compound_head are in net/core/skbuff.c, in
skb_pp_frag_ref & napi_pp_put_page. Looking at the assembly generated,
looks like somehow the compiler completely optimized out the call in
napi_pp_put_page, and the call in skb_pp_frag_ref morphs into:

 # net/core/skbuff.c:1047:      return
napi_pp_put_page(page_to_netmem(virt_to_page(data)));
        addis 9,2,.LC63@toc@ha   # tmp158,,
        ld 10,.LC63@toc@l(9)     #, tmp140
 # ./arch/powerpc/include/asm/page.h:230:       return __pa(kaddr) >>
PAGE_SHIFT;
        rldicl 9,31,48,20        #, _17, head,
 # net/core/skbuff.c:1047:      return
napi_pp_put_page(page_to_netmem(virt_to_page(data)));
        sldi 9,9,6       #, _18, _17
 # net/core/skbuff.c:1047:      return
napi_pp_put_page(page_to_netmem(virt_to_page(data)));
        ld 3,0(10)       # vmemmap, vmemmap
 # net/core/skbuff.c:1047:      return
napi_pp_put_page(page_to_netmem(virt_to_page(data)));
        add 3,3,9        #, vmemmap, _18

Since it's page_to_netmem(virt_to_page(data)) (not virt_to_head_page),
the we don't hit there right now. It's certainly possible to trigger
this in the future.

I think we could also READ_ONCE in netmem_compound_head for some
future proofness.

--
Thanks,
Mina

