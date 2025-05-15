Return-Path: <linuxppc-dev+bounces-8595-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3FAAB7B6F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 May 2025 04:10:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZyYb50Rlrz301Y;
	Thu, 15 May 2025 12:10:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747275041;
	cv=none; b=fgB8ONudgSpRQm5IyiVxAXUcMU/oJV4HbSGwgy2WR+BhvkHt6QDG/JODsxeNA1nLXfab46+CK8a2twUrxEvxgR1jWONlzd5+qYrot1JvTXGkb/0qB7sVzcXA+OGK9WMEAB+jWnR10VTAgG1NTFQ/fXmIaWnW0scNponM6Tn1ssBAP6+OuEOsbpjw2LtaHhtWM0Wre5QMOIKEUmUgp87iUp1Wu2lX5DjwTMX7ZPZKUalBGcqMr/kvmhYN+qk3Ot0uNRHk8xuMuSlNM5EwAxx3LqcMLYzeYMTiiO1msxGfFQNl0eOyKf9BKiHTt8LI0+HzLs6A9pJD33M8wljm6FwNXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747275041; c=relaxed/relaxed;
	bh=9OEU6IES7eFPDsF41jBYUq3IDtt0/P5xjuptgC1MYUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fv7KYkGDIQ1rcmVNL4ugBTDekoAOFJBqyx4+f9VcRtsZxZ9ATy72lYlW+Wj3ozmKlHk4OmCjO1LU2NTxfA9lz1AGj4L++vy0u0uMqytIqM1YiTep6el4Q/ZH7XE+v7yGCgIHGbkITM4J26/1Pb+n6Ad+MWLBDpxf2MQ81uau/BtQ7TL7GdAhKV+RRO3zPlNKBbB/avL71FLAC0ay55DKHX8MAy6hzTNSdi7jsvk9QGOWzWEg1DHTNoOVegMEmPWtjRNRpnr4jrRsHasIPOxc2sBi8OR2uYeYjzTCpnpIpdHVTlvE9WUhsj5mGHYpRX38SUkL3AEyD8Oaqlf/ib2j+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=p7OwC/2e; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=p7OwC/2e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZyYb414S3z2ymg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 May 2025 12:10:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=9OEU6IES7eFPDsF41jBYUq3IDtt0/P5xjuptgC1MYUg=; b=p7OwC/2e36XHYXR8OunAzbwvCI
	kBCjfhT7HyoJnPZdsg4CJBJc4JTIQLpd/G8jAGDG0sFfPWTXo+ebSX89xzR6GhdOrOe1ypgcOPuXR
	3aYV/XV6hh2OYeKBI+e2q2oDGFgJTGOIXH16y274YLhyC8pb+zQV/LUvMErOrA3RJZEKSUtJtqy/2
	igPiebsyH7dg/UEU5FO6dt83UETCQhDevJfFuTwd/MT8VrGlhDJ5MeTruGvmOHN96PIiUKetcbS9f
	o9ZMSMaDBF+8tnn9DIMhToGmGZIVzWQg5Y9RaOWUx7Wlc48NHKBuUWivDzXIprullon3Y44DKjQWd
	5gtdQu/Q==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uFO3P-006CgW-04;
	Thu, 15 May 2025 10:10:36 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 15 May 2025 10:10:35 +0800
Date: Thu, 15 May 2025 10:10:35 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, naveen@kernel.org, dtsen@linux.ibm.com,
	segher@kernel.crashing.org, stable@vger.kernel.org
Subject: Re: [PATCH] crypto: powerpc/poly1305 - add depends on BROKEN for now
Message-ID: <aCVNG2lm9x9dzu6x@gondor.apana.org.au>
References: <20250514051847.193996-1-ebiggers@kernel.org>
 <aCRlU0J7QoSJs5sy@gondor.apana.org.au>
 <20250514162933.GB1236@sol>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514162933.GB1236@sol>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 14, 2025 at 09:29:33AM -0700, Eric Biggers wrote:
>
> I didn't notice that.  Probably, though I don't have time to review this subtle
> Poly1305 code.  Especially with all the weird unions in the code.  Would be
> great if the PowerPC folks would take a look.

Of course more reviews would be great and I think they're all on
the cc list.

I did test this by manually forcing the conversion, which is how
I discovered that powerpc wasn't even using donna64.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

