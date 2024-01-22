Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA238837486
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jan 2024 21:50:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fPKDmKPz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJj6G4X52z3cRk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 07:50:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fPKDmKPz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=yosryahmed@google.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJj5T5BTpz2yst
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 07:49:48 +1100 (AEDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a28a6cef709so357829466b.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jan 2024 12:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705956582; x=1706561382; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3IFgXkLl95HUfhHT8xvYlvUcRJv9Sps5HuKi7yJyr0=;
        b=fPKDmKPzS3f1fEOLMaJGZLIyF99GmxdNzl2Q8d3Hdg+ODy7wg3yE6nubXCCFFcOJIh
         Ub1YxZeA+Ny8PXkYzLLfA73mGBC1OLJBp+mnDL7sIzdW5B35L8GbrcSWi/S2Ob3gSutg
         FtV03D/ZwVrXHLoJC50iWXvCLMHMdtX785x5OXzgF+5dZZcLNz0hYlAPqo3CmECQQ+AF
         jlfU4WJr9k1SZv5KQvqPGV4fiJHji52OJBKdYvqrCNmCtHrrGNnHlXsSXLatH7m58PWw
         brsj+4U3c9UgNb36AOnL9vVlGhsgGX51W2EokVTXE3mHwRNKZqQ0kLRuPBVGZNMjVeND
         U8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705956582; x=1706561382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3IFgXkLl95HUfhHT8xvYlvUcRJv9Sps5HuKi7yJyr0=;
        b=ftYc8HEgkwihAK8w9VxbCnnK1iMSnlKnX00i298nyq4mgCoxuCYnPoEO3kGFpHIros
         PBz6eiVObKqf6MRKb/pwCaDODdij/9b8R0KUMhpgis0reqTYIdkD+CQiC/+LmL5d+ME9
         EGYyKxI6bECN+UpTPAq8ZTvF3gadhBbCOp8X/Rx5k3LH1tulTi46jesajY5fwDCV+cDH
         TqK1a273itS0FN9VTaEO7EkWMm9gA/GzB3qEvLyf0Ky0OAqigUYw8ooQu8ROio8EfX7m
         a4m94tQSJbzlLjFC2OCPqs/+slyqgOyhSqNUJML9bwRs2fud1Mudl9BhYV8ORBYf7iMg
         i96Q==
X-Gm-Message-State: AOJu0Yy/0uwwrMyrv4hv17/PsFvWyV3vfAYha1IZoeLG5CLi9zy4U5sR
	O9/HUeWkbb3N2jHXAoyye5+hSaMgiRDfsD3HsevoPkxkRTHxFVho4e5erdZIpISFZls8vVUrC92
	+8MuyjjWy9gQBo2K5geJM9jFvBznKZxM7bPzt
X-Google-Smtp-Source: AGHT+IHmoA2jzTQf7fFoYCB9p19IElaggUb5JNtVRvLZRR2GWNFR0iDWTD7SCEap+uVo0WQVp+gXFBeD6HpBvfznDFE=
X-Received: by 2002:a17:906:3a8f:b0:a28:b574:8551 with SMTP id
 y15-20020a1709063a8f00b00a28b5748551mr2420412ejd.147.1705956581807; Mon, 22
 Jan 2024 12:49:41 -0800 (PST)
MIME-Version: 1.0
References: <20240112193103.3798287-1-yosryahmed@google.com>
 <CAKEwX=PXfZssERxeMS3FpMP7H0psMzC72C2ga3fqr_Qh88M75A@mail.gmail.com>
 <CAJD7tkYqKve5V4eJjbZE8kPZ=-5DU1Xh6jym8OfE1twQz-vbUA@mail.gmail.com>
 <CAKEwX=P21VvVyfmAADzXe0=Mqz3Htyx9nQuiivLchcDZRumh6Q@mail.gmail.com>
 <ZaajDheNtqKkCoeD@infradead.org> <CAJD7tkaYu2+g-3y3k35KaiLEsrFVtfpSS=9uv+ic3Zwv6fTS3w@mail.gmail.com>
 <Za4cT3tATxVlMki3@infradead.org>
In-Reply-To: <Za4cT3tATxVlMki3@infradead.org>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Mon, 22 Jan 2024 12:49:05 -0800
Message-ID: <CAJD7tkYWS88bmC9SRaBFJK1feKLJ9bYVBqwEDx1iXwqWYzfSgw@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to CONFIG_Z3FOLD_DEPRECATED
To: Christoph Hellwig <hch@infradead.org>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Nhat Pham <nphamcs@gmail.com>, linux-mm@kvack.org, Chris Li <chrisl@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, loongarch@lists.linux.dev, Johannes Weiner <hannes@cmpxchg.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, WANG Xuerui <kernel@xen0n.name>, Vitaly Wool <vitaly.wool@konsulko.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jan 21, 2024 at 11:42=E2=80=AFPM Christoph Hellwig <hch@infradead.o=
rg> wrote:
>
> On Tue, Jan 16, 2024 at 12:19:39PM -0800, Yosry Ahmed wrote:
> > Well, better compression ratios for one :)
> >
> > I think a long time ago there were complaints that zsmalloc had higher
> > latency than zbud/z3fold, but since then a lot of things have changed
> > (including nice compaction optimization from Sergey, and compaction
> > was one of the main factors AFAICT). Also, recent experiments that
> > Chris Li conducted showed that (at least in our setup), the
> > decompression is only a small part of the fault latency with zswap
> > (i.e. not the main factor) -- so I am not sure if it actually matters
> > in practice.
> >
> > That said, I have not conducted any experiments personally with z3fold
> > or zbud, which is why I proposed the conservative approach of marking
> > as deprecated first. However, if others believe this is unnecessary I
> > am fine with removal as well. Whatever we agree on is fine by me.
>
> In general deprecated is for code that has active (intentional) users
> and/or would break setups.  I does sound to me like that is not the
> case here, but others might understand this better.

I generally agree. So far we have no knowledge of active users, and if
there are some, I expect most of them to be able to switch to zsmalloc
with no problems. That being said, I was trying to take the
conservative approach. If others agree I can send a removal patch
instead.
