Return-Path: <linuxppc-dev+bounces-5359-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C89A15010
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2025 14:06:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YZKkj60c2z2xrJ;
	Sat, 18 Jan 2025 00:06:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737119213;
	cv=none; b=U5OeevJz5Y3cLie/7ZGrZ6ply69Fu18wTbHhs1oar4TpVULhZzJhY6uesGiHbq4n3vc7Sh2s6RycN7X+RLeQNxZs/8LJn0eu5MikzSz0Eo8uahUxR5XntgMl23ZGKZuBXdq1e2kCKNlVbJ22aJWuhOA3oUGPCGrX+805hy5EVjwldH0/tbVs0ouZQGveTj/842Qj0B76QQC90+SbFk2PHb3odiX6GPmC98wycbshbfyP96HHDgpdmd1zDLtsWzaHidxKdTd/09cAmf3DGhp35+ZyFW69hj0VObYqW4rr7uwP96DslrABBT4FodWb3qA/WVE6x3fDJJTMUCRrkJGOZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737119213; c=relaxed/relaxed;
	bh=hY4yjRKCRod/AXSrQsJwmxP2ZGQ5suLIGcArrFvDpVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0lwhPJ7MfUIgcyip1ehviywsvQqPjSUp4lb2nOAMyMu1YPOkklF6ZYur8yCmcCATDIxzF8Ccb+eP7CMGWeRK2OtOjKKihMH7q3qcZ6j3W6cyQCY1p07//h58ogzcDOhSmjWPr7BxSCOKdncE+ClOHokLll8UXwxvZolxLe+f1Rb43f+EFdE2zx0uNwGG1sPABEVDfpUeCcnYMPT6UDGt3TuuemAHqcsWGOck9YQDNyEx/RanKa8LVY7iF+zf6OiXWb3h5vv+ocqFo8ozG8Y24fr2seQATGfUmjtZF28tVms4XDPcnt4p8InugCe/YDTy/molrEaNiIGUwpctqMdUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dFRmjx5M; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=9WBtT9o6; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dFRmjx5M;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=9WBtT9o6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZKkg6c8tz2xHl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2025 00:06:51 +1100 (AEDT)
Date: Fri, 17 Jan 2025 14:06:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1737119206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hY4yjRKCRod/AXSrQsJwmxP2ZGQ5suLIGcArrFvDpVc=;
	b=dFRmjx5M4i6s3ggklbqmIkVzFIrTqF0HonDj4Fv0mkCWGdMMmXs/T4/aSZdlLnp9tDYulp
	dOrJ1qvFIdpw2j+rkJejTrRhUP3yi/7EnsZbDeWctkLCbFohSfoxlpbacT0aCO9j005tO7
	4d9QEEA/e6HnhqxBmSV7sxR9p/I1U87l3nRx1D5+AeULcoNr5zi5RNEVIIQkKIlOhRB/Cc
	T+XyrhUPg9A7kfM+e+Db0MOXf3DfC7cFsra4/3Lyk4VVZ5yvZN/svBgywKGdkfmJiB9/Qp
	YMWMdYADkR3PP0h1ES+igS/fNEhmgPbZ66rKlMUffachERibFukINTqnKkrhGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1737119206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hY4yjRKCRod/AXSrQsJwmxP2ZGQ5suLIGcArrFvDpVc=;
	b=9WBtT9o6vTQ88sIgTNnDvZ7GnfUlb5LHAN1EezNk61xvUNfyG771NRpLCOCbVUMQmPLw1J
	4BV1hYPZ5MMWLZDg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Basharath Hussain Khaja <basharath@couthit.com>
Cc: Rob Herring <robh@kernel.org>, mpe@ellerman.id.au, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	saravanak@google.com, danishanwar <danishanwar@ti.com>, krishna <krishna@couthit.com>, 
	mohan <mohan@couthit.com>, parvathi <parvathi@couthit.com>, pmohan <pmohan@couthit.com>
Subject: Re: [PATCH] of: address: Unify resource bounds overflow checking
Message-ID: <20250117134255-bee95a37-250c-437a-a101-938800cba218@linutronix.de>
References: <87mskbqher.fsf@mail.lhotse>
 <20250108140414.13530-1-basharath@couthit.com>
 <CAL_JsqLLGW_o9i6a5wcUj=Z=4nL-GhzHwAQMFtQkb9OSHuSgTA@mail.gmail.com>
 <2089813158.341858.1737096833060.JavaMail.zimbra@couthit.local>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2089813158.341858.1737096833060.JavaMail.zimbra@couthit.local>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 17, 2025 at 12:23:53PM +0530, Basharath Hussain Khaja wrote:
> >> >> Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de> writes:
> >> >> > The members "start" and "end" of struct resource are of type
> >> >> > "resource_size_t" which can be 32bit wide.
> >> >> > Values read from OF however are always 64bit wide.
> >> >> >
> >> >> > Refactor the diff overflow checks into a helper function.
> >> >> > Also extend the checks to validate each calculation step.
> >> >> >
> >> >> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> >> >> > ---
> >> >> >  drivers/of/address.c | 45 ++++++++++++++++++++++++++-------------------
> >> >> >  1 file changed, 26 insertions(+), 19 deletions(-)
> >> >> >
> >> >> > diff --git a/drivers/of/address.c b/drivers/of/address.c
> >> >> > index 7e59283a4472..df854bb427ce 100644
> >> >> > --- a/drivers/of/address.c
> >> >> > +++ b/drivers/of/address.c
> >> >> > @@ -198,6 +198,25 @@ static u64 of_bus_pci_map(__be32 *addr, const __be32
> >> >> > *range, int na, int ns,
> >> >> >
> >> >> >  #endif /* CONFIG_PCI */
> >> >> >
> >> >> > +static int __of_address_resource_bounds(struct resource *r, u64 start, u64
> >> >> > size)
> >> >> > +{
> >> >> > +     u64 end = start;
> >> >> > +
> >> >> > +     if (overflows_type(start, r->start))
> >> >> > +             return -EOVERFLOW;
> >> >> > +     if (size == 0)
> >> >> > +             return -EOVERFLOW;
> >> >> > +     if (check_add_overflow(end, size - 1, &end))
> >> >> > +             return -EOVERFLOW;
> >> >> > +     if (overflows_type(end, r->end))
> >> >> > +             return -EOVERFLOW;
> >> >>
> >> >> This breaks PCI on powerpc qemu. Part of the PCI probe reads a resource
> >> >> that's zero sized, which used to succeed but now fails due to the size
> >> >> check above.
> >> >>
> >> >> The diff below fixes it for me.
> >> >
> >> > I fixed it up with your change.
> >>
> >>
> >> This commit is breaking Ethernet functionality on the TI AM57xx platform due to
> >> zero byte SRAM block size allocation during initialization. Prior to this
> >> patch, zero byte block sizes were handled properly.
> > 
> > What driver and where exactly?
> 
> We found an issue while developing the driver [1] and more
> specifically in [2] (lines 313-327), but it looks like this is a
> generic issue which can block 1 byte of memory, when a zero size
> request has been initiated for the reserved region.
>
> static int __of_address_resource_bounds(struct resource *r, u64 start, u64 size)
> {
>     u64 end = start;
> 
>     if (overflows_type(start, r->start))
>         return -EOVERFLOW;
>     if (size && check_add_overflow(end, size - 1, &end))
>         return -EOVERFLOW;
>     if (overflows_type(end, r->end))
>         return -EOVERFLOW;
> 
>     r->start = start;
>     r->end = end;
> 
>     return 0;
> }
> 
> Though we have the start address handling already in place above, we
> do see an issue with the end address, because there is an
> unconditional +1 afterwards in resource_size() API below which is
> responsible for reserving the extra byte
> 
> static inline resource_size_t resource_size(const struct resource *res)
> {
>         return res->end - res->start + 1;
> }

Now the report makes more sense.

> We have 4 ways of fixing it.
> 
> Option 1: Modify the function to handle the size zero case
> 
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index c1f1c810e810..8db6ae9a12b8 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -204,6 +204,12 @@ static int __of_address_resource_bounds(struct resource *r, u64 start, u64 size)
>  
>         if (overflows_type(start, r->start))
>                 return -EOVERFLOW;
> +       if (!size) {
> +               r->start = start;
> +               r->end = end - 1;
> +
> +               return 0;
> +       }
>         if (size && check_add_overflow(end, size - 1, &end))
>                 return -EOVERFLOW;
>         if (overflows_type(end, r->end))
> 
> This seems to be the simplest solution.

Fixing it in __of_address_resource_bounds() looks correct to me.
The proposed solution doesn't look as clean as I'd like though,
this is highly subjective, though.

What about the following (untested)?

static int __of_address_resource_bounds(struct resource *r, u64 start, u64 size)
{
	if (overflows_type(start, r->start))
		return -EOVERFLOW;

	r->start = start;
	r->end = start;

	if (!size)
		r->end -= 1; /* May underflow for empty resources. */
	else if (check_add_overflow(r->end, size - 1, &r->end))
		return -EOVERFLOW;

	return 0;
}

A kunit test looks to be in order in any case, to make sure all the
edgecases are handled.

> Option 2: Handle in resource_size().
> static inline resource_size_t resource_size(const struct resource *res)
> {      
>           return  (res->end == res->start) ? 0 : (res->end - res->start + 1);
> }
> There are plenty of places where we are using this API and there is an assumption that the end address should always be start + size -1. We are a bit unsure about the side effects of this change.
> 
> Option 3: Handle in sram_reserve_region().
> We can avoid calling the resource_size() API and handle size zero as a special case. We are a bit unsure about the side effects of this change as well.
> 
> Option 4: Handle this in dts [2] with non zero size. Estimate the approximate size and update that value in dts file with extra buffer. However, as indicated in [2] in lines 313-327, the size is not known apriori and the actual size is only known in runtime. So if we set some size for this buffer, then this will always be blocked and may or may not be used subsequently.
> 
> [1] https://lore.kernel.org/all/20250109105600.41297-1-basharath@couthit.com/
> [2] https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/ti/omap/dra7.dtsi
> 
> 
> Thanks & Best Regards,
> Basharath

