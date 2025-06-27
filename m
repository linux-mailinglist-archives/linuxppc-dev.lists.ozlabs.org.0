Return-Path: <linuxppc-dev+bounces-9852-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FADAAEBD4F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jun 2025 18:29:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bTLbX6C5nz2yNG;
	Sat, 28 Jun 2025 02:28:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f35"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751041736;
	cv=none; b=IqEPOplBR12J5UISdEmG3tl8jymvqDBWCbQXGW0DqFC/lBh3piLDPWXWh/4mlkA7z4m9Aqu0yF3AuuxGqM4z5NS4X4gKWCQvTGixvvH7d1gxVYvQnQtx3vFnurEobtrvHFc4rK4jpj00s0sZeGeMcV9aNg6n0wm9MDLGDfiTR8cvt5/sct2+qV0jngjUlKnikCHfy76fV5SVKo9P6ZKeOV5xgioc16w81AzRQ6MOKVx9ID6Y9FFaL9OWkJFVCqffmYLNJWUaErVfCF6SNW1eQLh6XhaDlsLSA6R8CcQNKgOIeaJ0Yxch+HnfVbUQGZycjoK8E3+26LCu2R/k14nvmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751041736; c=relaxed/relaxed;
	bh=Pwe6yBI0hTTSV4QKO/x65G0lF6NWazoC/YzcyBgyfJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WmGezALXHUjymAvLGtOIIM/bAsPFaCPX+H9eLryo+OwFovUrhKfb8o2fbQQyD1Q6C6b/dJsZmTMEt13dBCeRFn3/8mKQIWtO2DtlwqoSrPouyTDax+jGSYYY5WpGEjv+yzqe6VUMfthE9XVzLxAfNjpuMHSR7I5zyecgq3VXYjnMDpUHJIaHlMTGQhcPYnc0ByndZnOTixC0MvZxSGHwtECnfwsNRclHd7Lm3oX1lptes8iqQSAwHXYRD0NEufvGtYM1hxPRqz4UussIc8LK044ov6UkeOBxrw9R2U6CWdwOKglaQS0UuCIM1J8BrtaVFxKEyOMpY3+CFFSzZIXJJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=n3Rk+G7/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f35; helo=mail-qv1-xf35.google.com; envelope-from=glider@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=n3Rk+G7/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f35; helo=mail-qv1-xf35.google.com; envelope-from=glider@google.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bTLbW4NsHz2xBb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jun 2025 02:28:55 +1000 (AEST)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6fad79433bbso421526d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 09:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751041731; x=1751646531; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pwe6yBI0hTTSV4QKO/x65G0lF6NWazoC/YzcyBgyfJc=;
        b=n3Rk+G7/c9+2+SYqKmQcEhUylTYcjMVeKIUxtiU2ypt2Z6wR71YCOlnu3CQJ00oS7Y
         Li0iGMTYWE/UsROq7N8moZYg1KtFcM1hTf0KonaloZMcWCLzGhJaFaBA75JLlvD2a96C
         dQwiBNYWvuTFWVmSL3ZDjOpTD+HVtyTA8p829KGtCCy4s5EexTp0cVUYCUwQADPfyW0f
         6ywxL439QPjC3YdxCsn8t9xVY5vHf+jjlNKJ4TfYCTyWO7W34iuyW2p+zG3/AhVbsssa
         4xpVJjLUV2OSutc6+JtkldFVVYYaF4Ij/JhQMbmzOOiGylACrp/WtjSqC0K4BHs3NTxL
         CgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751041731; x=1751646531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pwe6yBI0hTTSV4QKO/x65G0lF6NWazoC/YzcyBgyfJc=;
        b=JnTesi6U5p12g883gnvsQoE7Kxd+yH2eMCeEDTuJqXrZ5B2+U0GELFeIozfpTZE/SD
         PwKO2kOBReTjiuFkBeNfnAn0U5yf00wBtggteTn4NHm9OvdLI6vqKjOimQ4oh4UHjBgI
         ezeQEeMUYEhh5fr/2a84D+s8FLX160PUB3J6Nz3t13Kzccj+gIHdbPaGcIntlYtxjc6y
         w0V2fzOOpPyrFwz05GEORV2DeVg40lucKfmR+4IuUZH1lcx5D6NHBmbydhcHYPt4znXl
         B+KHtoMCWN3tZY5eYb3X+Gbp158GBWlqW/3BEBCrBrPLfi9awxhTnUz/ooIsVkeB/aOf
         iDGg==
X-Forwarded-Encrypted: i=1; AJvYcCWKwJ7a0HghPhs20C0om0FAbvsbd0gzwiX6SDg3dapxsdJqPcjCY5hEePFmRdOqaFidVVhm2cMYMk0aN6A=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwqRaT4AY3O4/WIXZHYUsyjCt7ejoDSEaXvuhFkCtsbMbdsl3qw
	tHFZRhL2WXIQu1tDAnn/okU4olUpadO6PRk9WGTEtIcuT/J5ezTde57LfPZEiuKuIedW3O9GwFR
	5Qd9Psqo26mTvcp9GOHPAqHCrWxYv+rxiUK6rKMQO
X-Gm-Gg: ASbGncuDJs4uaspMHG/WUG+35C64zeaSw2KBYbs9gt1XNkK9faNJDGeMiYVkliaCe33
	esSxCNijvLjL4R2VRC20lcl4WWowDD6WrFWEOBABkV8XrlMg1V6wS5u+GM9rvsCOX9W2YnL+bL7
	v41bFEmk7Rn1G4IiAmYlzL0aKJiDeqmCjOWqI3bUSw5XAtG0Imx+PqNlVv+3TknSrxKJFKlB+KQ
	g==
X-Google-Smtp-Source: AGHT+IEaFjJbudXPZvs4+gz+Ul1aN+IO1A0S+wtT0rUBrPe4/pZbkYPC1YJ6B1u6KB5gj2C6Oj3GAR3BNtAmvLY3bsQ=
X-Received: by 2002:ad4:5c6b:0:b0:6fb:33f7:5f34 with SMTP id
 6a1803df08f44-70002ee7d52mr61421106d6.43.1751041731049; Fri, 27 Jun 2025
 09:28:51 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1750854543.git.leon@kernel.org> <cabe5b75fe1201baa6ecd209546c1f0913fc02ef.1750854543.git.leon@kernel.org>
 <CAG_fn=XWP-rpV-D2nV-a3wMbzqLn2T-43tyGnoS2AhVGU8oZMw@mail.gmail.com> <20250626184504.GK17401@unreal>
In-Reply-To: <20250626184504.GK17401@unreal>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 27 Jun 2025 18:28:14 +0200
X-Gm-Features: Ac12FXzk502TgF39Kdk9rDaSo7SztNg9o8ROEHR27kqxNaOw7yX3TSWKD6zOmLM
Message-ID: <CAG_fn=WeK8q2g0bRna+fFx+ks4HbfoG3Tnw8PpSdmfdH=3+S=A@mail.gmail.com>
Subject: Re: [PATCH 5/8] kmsan: convert kmsan_handle_dma to use physical addresses
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Christoph Hellwig <hch@lst.de>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	=?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	iommu@lists.linux.dev, virtualization@lists.linux.dev, 
	kasan-dev@googlegroups.com, linux-trace-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-16.2 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jun 26, 2025 at 8:45=E2=80=AFPM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> On Thu, Jun 26, 2025 at 07:43:06PM +0200, Alexander Potapenko wrote:
> > On Wed, Jun 25, 2025 at 3:19=E2=80=AFPM Leon Romanovsky <leon@kernel.or=
g> wrote:
> > >
> > > From: Leon Romanovsky <leonro@nvidia.com>
Acked-by: Alexander Potapenko <glider@google.com>

> >
> > Hi Leon,
> >
> > >
> > > Convert the KMSAN DMA handling function from page-based to physical
> > > address-based interface.
> > >
> > > The refactoring renames kmsan_handle_dma() parameters from accepting
> > > (struct page *page, size_t offset, size_t size) to (phys_addr_t phys,
> > > size_t size).
> >
> > Could you please elaborate a bit why this is needed? Are you fixing
> > some particular issue?
>
> It is soft of the fix and improvement at the same time.
> Improvement:
> It allows direct call to kmsan_handle_dma() without need
> to convert from phys_addr_t to struct page for newly introduced
> dma_map_phys() routine.
>
> Fix:
> It prevents us from executing kmsan for addresses that don't have struct =
page
> (for example PCI_P2PDMA_MAP_THRU_HOST_BRIDGE pages), which we are doing
> with original code.
>
> dma_map_sg_attrs()
>  -> __dma_map_sg_attrs()
>   -> dma_direct_map_sg()
>    -> PCI_P2PDMA_MAP_THRU_HOST_BRIDGE and nents > 0
>     -> kmsan_handle_dma_sg();
>      -> kmsan_handle_dma(g_page(item) <---- this is "fake" page.
>
> We are trying to build DMA API that doesn't require struct pages.

Thanks for clarifying that!

> > KMSAN only works on 64-bit systems, do we actually have highmem on any =
of these?
>
> I don't know, but the original code had this check:
>   344         if (PageHighMem(page))
>   345                 return;
>
> Thanks

Ouch, I overlooked that, sorry!

I spent a while trying to understand where this code originated from,
and found the following discussion:
https://lore.kernel.org/all/20200327170647.GA22758@lst.de/

It's still unclear to me whether we actually need this check, because
with my config it doesn't produce any code.
But I think this shouldn't be blocking your patch, I'd rather make a
follow-up fix.

