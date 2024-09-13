Return-Path: <linuxppc-dev+bounces-1351-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C022F978B02
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 23:59:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X57WR3GQlz2yF6;
	Sat, 14 Sep 2024 07:59:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726264771;
	cv=none; b=LHGEd3x8HvBx5BKmMTUJNj51c+SRwiBpHEZd9UxO5Wnnuv66EKFbBW82lec6OWMlSzpNqyD9JCrz8WrOJnNssZb2QeVLA/obcYhIIhcI9UnLustojv9ksyrdHUFZriwDTzb0XBvbR72j/GRwDb8qcDid9CzPqpoSvntdSAt5KtlsT6XM2zRMcCRG4wUkrCZ+LZje90CnqNczNDk1SSwv3DclDniz2B3LmTnwK7UMI8UkiO29sqICWFjr7J85PTsMDBxpgX7LybIUg6/kqN+B+xrK/aXXsABV8Z9HrUHFem6iENKPDpYE7/pEqT3tbj7ZDtsXzWhVQn9bq2gTetEtxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726264771; c=relaxed/relaxed;
	bh=dZoc+H8/pDEQCpX/wXMW7qS2ky0b0EzCVbkT2OhZPi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YmchxSJabz3lGydrWzSWTP34ATDKINs/VYZT17RlCzECQ4RUb3RCbo/8ATq4akVORDn2zXIeG9jXwFYtexK0Qpc28LVzS0rlvR7gwpEmMNBaX3lI56udQcdimNEOZSfz1RSscFVQQyFeoMKr+pJoe0CnGhTYZJcLJ8mJbYKhW4ItJkp23++jEk7wAh2iGaAb6/wTNyLb0qQIZ/LwjJsQNjViw9caVxiR9q7c00jAmKJFjZaX5f35Hy0EAjNrSVvRHhwKwUUmPzvi2TmMeD+nMQNxfQgdQdWiCS8ERA16kjk6T1RaxKgKHOWAorl9bg8BpnWMkIzRfqi9hpj00QRwcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=uaRfarTu; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=uaRfarTu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X57WR14m7z2xps
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 07:59:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dZoc+H8/pDEQCpX/wXMW7qS2ky0b0EzCVbkT2OhZPi0=; b=uaRfarTu1HzENb/Y+zwaEQxeNA
	wBB2TtgiupMRvPIByotu+DXsMiRa14oqxGPKu3ea2kO3uknWuTP3tR9GmqwPTpxddg5MaJqlVRf0J
	42mi8pTeJeUTLONQ7fbfdFNacjDz05FazWZG1cpG/M26HmYRR91XDUOLpjZUip5bVuJNvzwt583w3
	taoWpCKqOf7yYjohYa53gNaZncwEar5KIgA5XmgEKCbq6V3/qKfvYI9LVk51WrvKAOj1GFrfy3DUN
	HKs7ghC35dnIT89UDnVJA3TT8HSg6Rfq5ZGU5X4lVsPNOy8Rjst2gUAyPbWGJ5yju9fYnHpNREHZ5
	BVW/3kxA==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1spEK3-0000000H288-3MUq;
	Fri, 13 Sep 2024 21:59:23 +0000
Date: Fri, 13 Sep 2024 22:59:23 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
Message-ID: <ZuS1u8G6M9ch2tLC@casper.infradead.org>
References: <20240913213351.3537411-1-almasrymina@google.com>
 <ZuS0x5ZRCGyzvTBg@mini-arch>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuS0x5ZRCGyzvTBg@mini-arch>

On Fri, Sep 13, 2024 at 02:55:19PM -0700, Stanislav Fomichev wrote:
> On 09/13, Mina Almasry wrote:
> > Building net-next with powerpc with GCC 14 compiler results in this
> > build error:
> > 
> > /home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
> > /home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is
> > not a multiple of 4)
> > make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229:
> > net/core/page_pool.o] Error 1
> 
> Are we sure this is the only place where we can hit by this?

It's a compilation error, so yes, we're sure.

