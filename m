Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D9F83B42E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jan 2024 22:41:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=IW9rx67r;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TKy8d28hQz3cT9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 08:41:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=IW9rx67r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=yosryahmed@google.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TKy7p003Dz30MQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 08:41:08 +1100 (AEDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a277339dcf4so659819866b.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jan 2024 13:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706132461; x=1706737261; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gdx+IUjeaUFcylNxhLz8scMMaJ9E79xhrBh38+G7OAE=;
        b=IW9rx67rv/Vmhit6xi7vlb/tFeNmk50nwT7o9JOmXVxWFosHaPAhdUSAz+DuwHtMLX
         jWkkFYwn7oIP5febUdlT9fhw8Cq1Lyo4+FhR/IdLGutAyIV5Ww27wXML97H+C5zQFYIw
         e3zyasOu8WFDsw7KqsqTx9bFL5WEd0D7njOiSjAUCpkffY5t4wRJK0S7hfYxBmJB2z3e
         NdcY4td4/GQUz3MgNC7Qk1j9di4urQnwyqsoCT+HNSVgEsH3i65NoJEJ43IP/QDz5usY
         00uogBm12ydelrjU98I6qt1CvGK0ruO6C0zQMHXUhC++nDnwyrEP/3+KQ2i7tUnKy1lu
         Bxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706132461; x=1706737261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gdx+IUjeaUFcylNxhLz8scMMaJ9E79xhrBh38+G7OAE=;
        b=Zap/jPTWfiLKEHHPuBI4E33gicUCLy/83YAAnJxFZcH7fFb1FS3LCbE7xCOu2eqCkM
         CGFsXY+FWEbe4DcsMW2IGU2x9qEih4bIF6z8dcVmkDKX/QjCLN11h609EzU1k9cKlXnP
         G7eYYoz0ShN96Nq0rHlX4uhCD8MQk+JO3nmoQhgvdXFJHdJFmJu/kvt/YUimRGmlsWZo
         B2qT+e6TNimvMQQxDyPkQ/KEuP/wtLjYhNkmboltQXCJQU3OICeg8E0ASEicPsQEP4gE
         s3WbPBwP6tTh0HtxFRIAAMuQlqUaClyaahgoVmialFVW0wx4JQ4/XMopU8SZO4WZraZ7
         Rd4g==
X-Gm-Message-State: AOJu0YxBT+hGRAMrkRP7MqPvWZmwEma+PU+2Sp1fOR1KJqoMVbuT8I7S
	DZgaDpVwNxFdoPudT0ut9/aYD1W+l0EJ+8FCXmUDD87haMmj9z2nc6X5HtovFG9hROk5QsvnYuZ
	pabHZvwoby2T/l7Sb8Ck59/cwNSy6Ur0lWJd1
X-Google-Smtp-Source: AGHT+IFjEoF4u+IMowFOiDBleDGBDyR1EL8Is/Z+o4fzErE2dFPJZE576v7LzN33Rzm2e5yXyrn0pa07Li0HkM6mKxw=
X-Received: by 2002:a17:906:cd04:b0:a30:f55a:b54c with SMTP id
 oz4-20020a170906cd0400b00a30f55ab54cmr1114691ejb.132.1706132461253; Wed, 24
 Jan 2024 13:41:01 -0800 (PST)
MIME-Version: 1.0
References: <20240112193103.3798287-1-yosryahmed@google.com>
 <CAKEwX=PXfZssERxeMS3FpMP7H0psMzC72C2ga3fqr_Qh88M75A@mail.gmail.com>
 <CAJD7tkYqKve5V4eJjbZE8kPZ=-5DU1Xh6jym8OfE1twQz-vbUA@mail.gmail.com>
 <CAKEwX=P21VvVyfmAADzXe0=Mqz3Htyx9nQuiivLchcDZRumh6Q@mail.gmail.com>
 <ZaajDheNtqKkCoeD@infradead.org> <CAJD7tkaYu2+g-3y3k35KaiLEsrFVtfpSS=9uv+ic3Zwv6fTS3w@mail.gmail.com>
 <Za4cT3tATxVlMki3@infradead.org> <CAJD7tkYWS88bmC9SRaBFJK1feKLJ9bYVBqwEDx1iXwqWYzfSgw@mail.gmail.com>
In-Reply-To: <CAJD7tkYWS88bmC9SRaBFJK1feKLJ9bYVBqwEDx1iXwqWYzfSgw@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Wed, 24 Jan 2024 13:40:22 -0800
Message-ID: <CAJD7tkbOv9BtJHoCmqxFig6_+oU07yVchV5G0jye3B_XTSRWrA@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to CONFIG_Z3FOLD_DEPRECATED
To: Andrew Morton <akpm@linux-foundation.org>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nhat Pham <nphamcs@gmail.com>, linux-mm@kvack.org, Chris Li <chrisl@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Christoph Hellwig <hch@infradead.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, loongarch@lists.linux.dev, Johannes Weiner <hannes@cmpxchg.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Minchan Kim <minchan@kernel.org>, WANG Xuerui <kernel@xen0n.name>, linuxppc-dev@lists.ozlabs.org, Vitaly Wool <vitaly.wool@konsulko.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 22, 2024 at 12:49=E2=80=AFPM Yosry Ahmed <yosryahmed@google.com=
> wrote:
>
> On Sun, Jan 21, 2024 at 11:42=E2=80=AFPM Christoph Hellwig <hch@infradead=
.org> wrote:
> >
> > On Tue, Jan 16, 2024 at 12:19:39PM -0800, Yosry Ahmed wrote:
> > > Well, better compression ratios for one :)
> > >
> > > I think a long time ago there were complaints that zsmalloc had highe=
r
> > > latency than zbud/z3fold, but since then a lot of things have changed
> > > (including nice compaction optimization from Sergey, and compaction
> > > was one of the main factors AFAICT). Also, recent experiments that
> > > Chris Li conducted showed that (at least in our setup), the
> > > decompression is only a small part of the fault latency with zswap
> > > (i.e. not the main factor) -- so I am not sure if it actually matters
> > > in practice.
> > >
> > > That said, I have not conducted any experiments personally with z3fol=
d
> > > or zbud, which is why I proposed the conservative approach of marking
> > > as deprecated first. However, if others believe this is unnecessary I
> > > am fine with removal as well. Whatever we agree on is fine by me.
> >
> > In general deprecated is for code that has active (intentional) users
> > and/or would break setups.  I does sound to me like that is not the
> > case here, but others might understand this better.
>
> I generally agree. So far we have no knowledge of active users, and if
> there are some, I expect most of them to be able to switch to zsmalloc
> with no problems. That being said, I was trying to take the
> conservative approach. If others agree I can send a removal patch
> instead.

Andrew, do you have an opinion here?

We are not sure that there are active users for z3fold. It seems like
we have all sorts of opinions here from "don't deprecate" to "remove
directly, no need to deprecate first".
