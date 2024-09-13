Return-Path: <linuxppc-dev+bounces-1348-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BAD9789E5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 22:24:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X55Q36SHsz2ytQ;
	Sat, 14 Sep 2024 06:24:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726259083;
	cv=none; b=kD7wsuQWdyJTIVoeOZ+fbfwYa6Ot2R6wQaGrKwQq9kLT+boQUC39U/p7k5xd8q2muOl6raJpbIleicg4OjyFh+pWlFJYhi9vfpP06nk+MU8xkH4eQ+Xspgp1T/KXQhiJTWoGrwHgpWILU/4TanCppYBvdm2fmGKyS9g9AKn+n9aqvo6mrhE03XA8UCeU3+I2Wi8eNJDvdnH/v+pFK0oGdiTL2Y5Rz9h75b91jt20TQnMhgCUWZNW7fzHX97YEZzCbdc3fzVsKHvwpfQo8xh4OvcdP+HuR2bQiswCeJ+FtvFCVFA4U3+LVO9t/JuBcP1hiGv7PR47rA1XKGHQZcsjiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726259083; c=relaxed/relaxed;
	bh=vVUy3TAsyvuDd/zPcRhcxwX63nrqUWaxEmgfKwVKzAY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hm2qb0Jhimne80pRFh2i1x2ChYthtmZ9Eov7zeJ4+y97BalqEQauL3b64TZDIbLrj4fGPcryeV9judqj5vQf4wmMEpfmbApJjEISxNsKwGscEurUS1suB2zMIWU5zdT8MUDDGJZYPWFO8ZT9Z/IC82mQwNptnvhIGZEH30UvoWDSP4OR1dHlKbJ5Hj3H7sbMWiHeMrheh9iq1TVE4AahWKiF0/tID7/2VYskk4tSkZLztBGzH/TxQtiRgqzbQIAOkgiKpnDNFmNdjI53Ti0kanUOiZFTsXECIB1kKTTfLq/a437sMceHy8xS7LkuQD9P7AJlWaJ5nTDy3Gbzutq4mQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZMbr6xew; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZMbr6xew;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X55Q33XDKz2yst
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 06:24:43 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 49A255C47A7;
	Fri, 13 Sep 2024 20:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39B63C4CEC0;
	Fri, 13 Sep 2024 20:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726259079;
	bh=SLAQonTzL+ETpOKN32UdFXtUV4JfAqDvyG7i/mcZUuY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZMbr6xewxaHNK3ojM9J9pajyvXeWe5WgsUPGP70h8Yc4iy6AYb1YF3RogVna6Y43l
	 eX/Wjf3kxcl0yNJpZV4VHvb1N5Hq+IQW3OjMCY0AngOQVPcqbEK5sgh4QkYnkLwSgd
	 t8kqzXb3u07J+r4Xzx/qOMlPwkbxOln0ZBXWntIKo9gUC5AB7/3opz8rEuxyJrpMGX
	 jI66HLUDzuayUrQw/4C6+rUMQcRSw01t5/t03SACah6W8x1LwStSwZdXzWz2sFFlkv
	 VhQOhkT+iOxlhLl2A8Bra8P+gTU+BdYAqgpIdFnoFcSkze/BkELe5gkr45it+JfCBl
	 2QZv4LSzZaMfg==
Date: Fri, 13 Sep 2024 13:24:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: Matthew Wilcox <willy@infradead.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, christophe.leroy2@cs-soprasteria.com, David Miller
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: build failure after merge of the net-next tree
Message-ID: <20240913132438.4235abe4@kernel.org>
In-Reply-To: <CAHS8izNSjZ9z2JfODbpo-ULgOcz1dGe5xe7_LKU-8LzJN_z-iw@mail.gmail.com>
References: <20240913125302.0a06b4c7@canb.auug.org.au>
	<20240912200543.2d5ff757@kernel.org>
	<20240913204138.7cdb762c@canb.auug.org.au>
	<20240913083426.30aff7f4@kernel.org>
	<20240913084938.71ade4d5@kernel.org>
	<913e2fbd-d318-4c9b-aed2-4d333a1d5cf0@cs-soprasteria.com>
	<CAHS8izPf29T51QB4u46NJRc=C77vVDbR1nXekJ5-ysJJg8fK8g@mail.gmail.com>
	<20240913113619.4bf2bf16@kernel.org>
	<CAHS8izNSjZ9z2JfODbpo-ULgOcz1dGe5xe7_LKU-8LzJN_z-iw@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Sep 2024 13:05:32 -0700 Mina Almasry wrote:
> Change, got NAKed:
> https://lore.kernel.org/netdev/ZuSQ9BT9Vg7O2kXv@casper.infradead.org/

Humpf.

> But AFAICT we don't really need to do this inside of mm, affecting
> things like compound_head. This equivalent change also makes the build
> pass. Does this look good?
> 
> diff --git a/include/net/netmem.h b/include/net/netmem.h
> index 8a6e20be4b9d..58f2120cd392 100644
> --- a/include/net/netmem.h
> +++ b/include/net/netmem.h
> @@ -100,7 +100,15 @@ static inline netmem_ref net_iov_to_netmem(struct
> net_iov *niov)
> 
>  static inline netmem_ref page_to_netmem(struct page *page)
>  {
> -       return (__force netmem_ref)page;
> +       /* page* exported from the mm stack would not have the LSB set, but the
> +        * GCC 14 powerpc compiler will optimize reads into this pointer into
> +        * unaligned reads as it sees address arthemetic in _compound_head().
> +        *
> +        * Explicitly clear the LSB until what looks like a GCC compiler issue
> +        * is resolved.
> +        */
> +       DEBUG_NET_WARN_ON_ONCE((unsigned long)page & 1UL);
> +       return (__force netmem_ref)page & ~1UL;
>  }

Hmm. Not really, the math this is doing is a bit of a cargo cult,
AFAIU the operation itself is meaningless. It works because it
achieves breaking the optimization/register chain in the compiler.
But the exact ALU op doesn't matter. So pretending LSB is meaningful 
could be confusing to the reader.

I think this will achieve the same effect without the spurious ALU
operations (apologies for broken whitespace):

diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index a813d30d2135..b7e0acaed933 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -864,7 +864,11 @@ void page_pool_put_page_bulk(struct page_pool *pool, void **data,
        allow_direct = page_pool_napi_local(pool);
 
        for (i = 0; i < count; i++) {
-               netmem_ref netmem = page_to_netmem(virt_to_head_page(data[i]));
+               struct page *page = virt_to_head_page(data[i]);
+               netmem_ref netmem;
+
+               /* $explanation */
+               netmem = page_to_netmem(READ_ONCE(page));
 
                /* It is not the last user for the page frag case */
                if (!page_pool_is_last_ref(netmem))

If it makes sense could you polish it up and submit?

