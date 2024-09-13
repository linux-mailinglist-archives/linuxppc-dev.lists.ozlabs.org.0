Return-Path: <linuxppc-dev+bounces-1354-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F45A978B97
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2024 01:00:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X58sl1KcZz2yw7;
	Sat, 14 Sep 2024 09:00:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::836"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726257949;
	cv=none; b=AHGv4K+5kh+i2uziZOTSO4Vl9tacns1iaP6m6W0kPKqg0sYzAjEQStLB9w8HwNoXBeAtIKJV0K5U/bbWPtweTjMkHXMpnwCTprBMwwtXFoFJB4aLwRXKt89RzBEdfI8teqWvjpXbHm7+tA9J0N6bH8kTc36guPCmyW5NjhMKlNs37J5sl/3lUSzccY7pbjn95fQ0IgxA36vg6PIb8DyIPD0+BUaPUNWKRO3RgTtSQjbCxaM8KD5PjO8jF7LSN8e8oNDj8u5/B3KE9WJPm7txbTYP4w0Jx/F8j/WtDPvxE8UzxO9UhRYpug4AaSQEbV5zUt9GOa3GW62TlF2T6nbOFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726257949; c=relaxed/relaxed;
	bh=428AI888COZr85p2dtQB4DhBQ69x1Du1oaYIZ9Pz7II=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kamjGIZWR+sejgA5s0X4i2dzWGyc2qfhyi5gtwkXo+wC7PYeNZ1zZ8XzTUSxImUTwcVZ0U+DKKolYDmkgM5T/ZOH5kar+/UJSHYssiLedCFODWnddXNXy+lbOGfpfoc4rFu+0jbhbODUx/fYXR+Ff7+HKwX0aj97jX3BZ13kiwGOuWIhAK5p7Xj979twjbzv4UfMUg6UlJI69ThXVQprbAC+DgL0K1n2Ja3YElULiiwPUBSYnQAW0x5k0WNoaDwOEtc/93t+JS3x9UvzSjnYOiQKK0WxcIwu1FkqxLOZZWfGpoUCkd4j4Ls3afdUL3ORlEW0TF1tiM91Vp+tdIMf5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=IN9iNPFK; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com; envelope-from=almasrymina@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=IN9iNPFK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com; envelope-from=almasrymina@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X550F1xvlz2ysf
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 06:05:48 +1000 (AEST)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4582fa01090so63721cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 13:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726257945; x=1726862745; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=428AI888COZr85p2dtQB4DhBQ69x1Du1oaYIZ9Pz7II=;
        b=IN9iNPFKDCnTM431W8xTFqcd4v3lZWqXCsNvEPUAegt9LF2s84l/fwSml8ppvqSzUC
         uKZ6JJa8pyVG1I/lPHyPD8k2/u7+kWQe5bFjRjgV5EwxIB37JEeuxQO/sFZovd8liPlS
         En1/6yCzqVfkxeSAWytmnItuRia8hLq7cCFipXnBRXZpt6CzDgEyA7RwemOx/jNbbIlz
         MGSTG0u0cXVNX1nsUaf6QlO9HB5yMvtv1mNS9q8YBKgfmyk2uDYUKyNR/K3X/Tfxq+pJ
         0Bn+gYfzRHtBgkCVUL3mqQOLqjiYdjCYbsM5RMSpGDhomqJUmvJbYGtaZjIKyXkSomgp
         EpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726257945; x=1726862745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=428AI888COZr85p2dtQB4DhBQ69x1Du1oaYIZ9Pz7II=;
        b=HsSbOdNsvs/DAXFnu4yZUdW7VEyRARlMj9nYNLplWtZuYKSMAuv5xA/T4Lr5dAZDVN
         1T4o4e3ZkjdEw+slmY0pudLv3gQiMhxMWYZLJxNG5UYOvPDnXVqtFt0cHdLdkhh4l8ld
         3ZLihT6t++EbBmnlY+Oiu+dGwNXNTIsdc5HUrO/MFl/PafqH1HtZKWyVocprOd1cd8cC
         1renXv6EqUnIT2lOUSaubJwNFCuQVJxdgMVuolaIOCx5ccHCOdA8g0WYqcc0OqmrLBU3
         k2u7dprm5JvHmVj4kiksk6XL9Ya8rv1vmkA59O52PWhJ+djVfjIFYEzTYFaUyAbvop4R
         zMTw==
X-Forwarded-Encrypted: i=1; AJvYcCW70oHcuALDiFDGO2eK3nCpS/u2Ce+8oFHwdEfKOAqc8GlA6XIzIqRy7viXgalkBNgnvjjxkeQcssDVxMw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwW1dNkMuukqWYxUYv3wkNIGlkvq98Rnmv1XoZotqgA6lIhEPaX
	jIvteH+yzd8q8GQxvy0VTy07Yah7EjdmkdxfnReR7cR4qU2rQHpaNCfyom+VFT+8JD/Rp+C/p+x
	BFgN4b0xy3nyDJevxBpjT7nhpO+Hh4aWA35Zq
X-Google-Smtp-Source: AGHT+IF5n1mXupbErXFG4ufgiVBKgZXbeEDAnZXN3Paf7T9SpKrEw2qr89Hq947jCuTgHivZFmuNQ00T2DIMXKQJkVo=
X-Received: by 2002:a05:622a:34a:b0:456:7ef1:929d with SMTP id
 d75a77b69052e-4586079cda4mr8791071cf.12.1726257944603; Fri, 13 Sep 2024
 13:05:44 -0700 (PDT)
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
 <CAHS8izPf29T51QB4u46NJRc=C77vVDbR1nXekJ5-ysJJg8fK8g@mail.gmail.com> <20240913113619.4bf2bf16@kernel.org>
In-Reply-To: <20240913113619.4bf2bf16@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 13 Sep 2024 13:05:32 -0700
Message-ID: <CAHS8izNSjZ9z2JfODbpo-ULgOcz1dGe5xe7_LKU-8LzJN_z-iw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the net-next tree
To: Jakub Kicinski <kuba@kernel.org>, Matthew Wilcox <willy@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, christophe.leroy2@cs-soprasteria.com, 
	David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
	Networking <netdev@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 11:36=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Fri, 13 Sep 2024 09:27:17 -0700 Mina Almasry wrote:
> > diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> > index 5769fe6e4950..ea4005d2d1a9 100644
> > --- a/include/linux/page-flags.h
> > +++ b/include/linux/page-flags.h
> > @@ -239,8 +239,8 @@ static inline unsigned long _compound_head(const
> > struct page *page)
> >  {
> >         unsigned long head =3D READ_ONCE(page->compound_head);
> >
> > -       if (unlikely(head & 1))
> > -               return head - 1;
> > +       if (unlikely(head & 1UL))
> > +               return head & ~1UL;
> >         return (unsigned long)page_fixed_fake_head(page);
> >  }
> >
> > Other than that I think this is a correct fix. Jakub, what to do here.
> > Do I send this fix to the mm tree or to net-next?
>
> Yes, please, send this out and CC all the relevant people.
> We can decide which tree it will go into once its reviewed.
>
> Stephen, would you be willing to slap this on top of linux-next for now?
> I can't think of a better bandaid we could put in net-next,
> and it'd be sad to revert a major feature because of a compiler bug(?)

Change, got NAKed:
https://lore.kernel.org/netdev/ZuSQ9BT9Vg7O2kXv@casper.infradead.org/

But AFAICT we don't really need to do this inside of mm, affecting
things like compound_head. This equivalent change also makes the build
pass. Does this look good?

diff --git a/include/net/netmem.h b/include/net/netmem.h
index 8a6e20be4b9d..58f2120cd392 100644
--- a/include/net/netmem.h
+++ b/include/net/netmem.h
@@ -100,7 +100,15 @@ static inline netmem_ref net_iov_to_netmem(struct
net_iov *niov)

 static inline netmem_ref page_to_netmem(struct page *page)
 {
-       return (__force netmem_ref)page;
+       /* page* exported from the mm stack would not have the LSB set, but=
 the
+        * GCC 14 powerpc compiler will optimize reads into this pointer in=
to
+        * unaligned reads as it sees address arthemetic in _compound_head(=
).
+        *
+        * Explicitly clear the LSB until what looks like a GCC compiler is=
sue
+        * is resolved.
+        */
+       DEBUG_NET_WARN_ON_ONCE((unsigned long)page & 1UL);
+       return (__force netmem_ref)page & ~1UL;
 }

--
Thanks,
Mina

