Return-Path: <linuxppc-dev+bounces-9839-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD95EAEA4A3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 19:43:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSmJN1zqZz30Pg;
	Fri, 27 Jun 2025 03:43:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750959828;
	cv=none; b=FDYG6CaiQrqBSsqbUJGXSIozhyvjetQ7uf7dGiSA19FQ4pXrrAAUrKC05Ptv2jWT7udmtsxJxeCQH/IAfvSv98PY1jCOKvqoZWZT6TQe15ckNb7tIAFrFruGKYHmu82kp8YAkFMuzPTiL5iUukjqlSUHxn3N21cFQfS12yeidW7iQhvDyMGW8H5z287qFtcHlBYGuv/wcg5uKNj8QA/xmtHK/IX6sLTwrTlFGZDmbsBCZh5KNcpgmyJQC1xecOQ6giPYulgZTAMwcmFNbqcdEmX1lrX3oM+N7ZZk4uNDW/t/PJN74OyP1mdotrUaqsh+Oon+YQIlyQ70yoUj3Pb5HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750959828; c=relaxed/relaxed;
	bh=wzwuJqhyKPA6pFtaKqL29WQiBrCe4P+CAFqirUycMO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T3JV+kG6pkbg7ZKLmMXtAi4PZ8IoddK0wimwGvcZYD9BqKrbcclN5daez/h6E4UbHSaafaSPVNVp7saycMh7oBi8yPBJ3+9N8ytj8ouQyDjWTjkitbMgchuW4lw0m1ei7DdVoGNUHENYQwmhNqplqRHnnhf+NOKR6FKDpOsogC0alZUmITXrPAzfWdVvPU0+Y6KAbTIUpDliREsUt1fqXBZJaLHbAqnWQunB+PDalqyRJ7vSSYYvOgpQbEcx+bEq/QqfI1Q/lCf1mIpmRusmxpo0VkTclpRF+4j0V7CZhxNZnfcyM4EiFNHGYtWLYUtMZxfsP1q9ZAqxsJSzY+wusw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=YSmniEQx; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2b; helo=mail-qv1-xf2b.google.com; envelope-from=glider@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=YSmniEQx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f2b; helo=mail-qv1-xf2b.google.com; envelope-from=glider@google.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSmJL4gDgz30NP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 03:43:45 +1000 (AEST)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6fada2dd785so17002156d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 10:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750959823; x=1751564623; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzwuJqhyKPA6pFtaKqL29WQiBrCe4P+CAFqirUycMO4=;
        b=YSmniEQxZmZkwN5Xo7N6nBp5YRK9QrDKWq2vr8cpf9ArtxUoCfUQGzSoIqjv7D3Mgs
         3i6LgBaBGasM/zik1SgOLrivkEzNsvGukclH/H7ZJnDWaP7vjN4KgyJMJXcKOrXw3sg/
         xKPijVS2amGKiBzpSfMh+NbPvjLjkWLsHGtIT0NovmObH1D955vHdWB0VodmxkDOj25k
         Bm0NXKUhd6hALcCkhAzWPcHwg0udI5i98quAszyVrA9zTUOvqeJ/mFMmoFM5vDnlLfAk
         k9TG936HUaMws3zytIYnNJsbzk+M2b//kLobhyYALA1xxn1/XqxrkBCCleJaxp4+laPD
         CoSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750959823; x=1751564623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzwuJqhyKPA6pFtaKqL29WQiBrCe4P+CAFqirUycMO4=;
        b=vBSB+WwmcBtSYIih+1WGZMGeSDWL/5znXLTllX5dXsnmfoBjSckL/Ej+taZb2/n+YA
         YtD2FDDu16YbWPLqZOonRhPxA3Do2p9Ee7aZdq/mxvr4BbzFjD32gRjjNr9qFKHRZfd7
         QqS2SFKn0SyH85YNiES0NgHidMk1Yp50vLroK8lJlabrjv5FBAdAEfMpPsnpKJNjTnEQ
         7++6n6hnqqSHAuZD0EIUKoIBKTPwRk3sqCfcb9Hu79/o/ztOczVOA8HIdsm4SFN+3olB
         524nXYLN91XWLosFXW0h6KtaX1Cla7BBlZNsxKRUxOYkva5TS8/JA1lKzCmgW/u1R/Kx
         J4lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXCA620PZRrkRyhgKgJhVSSUEMxS4l+fnsctlM9SVg/lcxsAeny+uVAexXCJ3DvS94/7Yp6xMWwHLy/F0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz5o/pnsSaFhyTjFRWyVEZ3Bfcuqw+W+KJHTIgH/OIwv2CmJnxK
	HM1Di0ElNI3PX86U37IasFBh/ZEPc7V3v/4l/j6Dff3+V7xMYgjuPrIoPHUXCdwRmSRIz9Pekn2
	4mUPXLD4oKKrv6mWe7+rRkNh4p8ZjJ/YmotczZu70
X-Gm-Gg: ASbGnctHzamgHTG03f0jqZBw4+pCzD5ZhRyRPqwebjkBuy27UVszRxIVxmqkApFenQL
	qetc3D1Y6ifmjxRwFOcHdfInWPOZTS67J2hFPM2UT6fEQoDaD0GcB4XU/Ef3sf5Cfv336ZtXHYK
	9t7U2iiVyFQiui0PmBQCw/H45HCAnZzai1Ammbc9I2rEcRQqtJUta9Ij5zk9CYsGlI+0fYsi9Yr
	A==
X-Google-Smtp-Source: AGHT+IGdh/IJuNTnlJ5wP1tLYohn6WiFRhrAxLVoOATEeK6niUOWXM6UN14DbuitTFowPzRbNWX5WutFoxjvCZRzqB8=
X-Received: by 2002:a05:6214:2aa1:b0:6fb:5f1d:bf8c with SMTP id
 6a1803df08f44-6fffdcff5c9mr6100526d6.11.1750959822639; Thu, 26 Jun 2025
 10:43:42 -0700 (PDT)
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
In-Reply-To: <cabe5b75fe1201baa6ecd209546c1f0913fc02ef.1750854543.git.leon@kernel.org>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 26 Jun 2025 19:43:06 +0200
X-Gm-Features: Ac12FXyaDZROOxurpvkcs9ZXthsb5DglqUebhn0NTWwPhDYnIEGQjkQ7oqhUUFw
Message-ID: <CAG_fn=XWP-rpV-D2nV-a3wMbzqLn2T-43tyGnoS2AhVGU8oZMw@mail.gmail.com>
Subject: Re: [PATCH 5/8] kmsan: convert kmsan_handle_dma to use physical addresses
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
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

On Wed, Jun 25, 2025 at 3:19=E2=80=AFPM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> From: Leon Romanovsky <leonro@nvidia.com>

Hi Leon,

>
> Convert the KMSAN DMA handling function from page-based to physical
> address-based interface.
>
> The refactoring renames kmsan_handle_dma() parameters from accepting
> (struct page *page, size_t offset, size_t size) to (phys_addr_t phys,
> size_t size).

Could you please elaborate a bit why this is needed? Are you fixing
some particular issue?

> A PFN_VALID check is added to prevent KMSAN operations
> on non-page memory, preventing from non struct page backed address,
>
> As part of this change, support for highmem addresses is implemented
> using kmap_local_page() to handle both lowmem and highmem regions
> properly. All callers throughout the codebase are updated to use the
> new phys_addr_t based interface.

KMSAN only works on 64-bit systems, do we actually have highmem on any of t=
hese?

