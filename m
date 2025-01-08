Return-Path: <linuxppc-dev+bounces-4870-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0023A0663F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 21:37:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YT09D18v2z301B;
	Thu,  9 Jan 2025 07:37:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=162.240.238.73
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736346341;
	cv=none; b=Fxro98TUeXmLDGH3n9DygUgzkUfLgZQpdEmcV42bMpJNSEK/I5788h0Lnn/+ztMsbWzJdEvD4J23ZCcCvrfj2/bfYNsXfrhWRrZasojYi4dYdstdAcPlMVJvxvbPIK2+kVnKwexo2TKTfAbNjQpGw2AT2b00cXscSj60eDPkQy2Cog8CDnvFrhFch5k+KGXSddb6gJk6MM7polJlEKsZcZMJkZ4y7Hvm1dUVApJAh+WD/FIidKzB/KKrCEn2ILMa0FViUPba11TYPFq3hHx9ayi4nLXh5wHz9l7JlYZ6hD+gK7bE+ycJP7iQqv5Auxppp1J5y3AEiGS4NX6FFO+Zdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736346341; c=relaxed/relaxed;
	bh=o3+neP8aeeIFPqI/lL7EOOrgM0uRKroB1bs8o3zpJWY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KC3tt0KsKIfyLanU1oP9rvgAQ92Lrb+qQgnyPlKIJnaRFwuuW2qBJ9xQPRqFmc3RXJyEWRIaUg8KuzPkczZV6UlH4SCqEOXHm6kl6AXpQRZoI5rCEnvwYz31T70HCpwC5NJlKn+MDm5J9loQoengEZEHloaeKgpqUUOeYKLo9F0c9z1jpi6a6cyMc8C5CWJNA7Aip7sAiGmB96QwAiBXdagTSnVFCqsgzgrXXPrSsZdxu2831URVso7I1qFzb8c8m5oaIVRaoEim8JIx5lUI/MQ75FMvADPRrioEkPB4iE59DhBLeNLAQLw6156StnASczFmfKhpK7HfFKz40WbTKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=couthit.com; dkim=pass (2048-bit key; unprotected) header.d=couthit.com header.i=@couthit.com header.a=rsa-sha256 header.s=default header.b=GLgEGooG; dkim-atps=neutral; spf=pass (client-ip=162.240.238.73; helo=server.wki.vra.mybluehostin.me; envelope-from=basharath@couthit.com; receiver=lists.ozlabs.org) smtp.mailfrom=couthit.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=couthit.com header.i=@couthit.com header.a=rsa-sha256 header.s=default header.b=GLgEGooG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=couthit.com (client-ip=162.240.238.73; helo=server.wki.vra.mybluehostin.me; envelope-from=basharath@couthit.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1269 seconds by postgrey-1.37 at boromir; Thu, 09 Jan 2025 01:25:38 AEDT
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSqvk5pPSz30TC
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 01:25:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References
	:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=o3+neP8aeeIFPqI/lL7EOOrgM0uRKroB1bs8o3zpJWY=; b=GLgEGooG7UkcsXby1uEwokCfe9
	s7iqTJT6t7fQ4bL0NWVQMCEd65TTxjAFKf2+LqVADVmFKTCVURhW1aCfK8Trf65EDbc4KVqSV1ltD
	lSGtUlzcMkXUU5yDZ/k7C1puX4VVmPeOxgWAP8bAlDLPpUnt+MgzkKma8BGraXxrxAX/yiYF9EQVD
	6xQYRtKfMLjxsM3coBB6+X8FTlZL4w8iAHs5O2jw6Vf+mT82Vn1U8n+xvb6u+f0XHVKwtyMSEBeFP
	x7pTMmGFOo36RpQTGWOd5Fayup4mYlEPt6DmvG2igOHvsqIVolcaygPwdnk26spE8ENxUQsdFlb1q
	LObjzvOQ==;
Received: from [122.175.9.182] (port=22813 helo=cypher.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpa (Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tVWfY-0001mA-0L;
	Wed, 08 Jan 2025 19:34:24 +0530
From: Basharath Hussain Khaja <basharath@couthit.com>
To: robh@kernel.org,
	mpe@ellerman.id.au,
	thomas.weissschuh@linutronix.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	saravanak@google.com,
	basharath@couthit.com,
	danishanwar@ti.com,
	krishna@couthit.com,
	mohan@couthit.com,
	parvathi@couthit.com,
	pmohan@couthit.com
Subject: Re: [PATCH] of: address: Unify resource bounds overflow checking
Date: Wed,  8 Jan 2025 19:34:14 +0530
Message-Id: <20250108140414.13530-1-basharath@couthit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87mskbqher.fsf@mail.lhotse>
References: <87mskbqher.fsf@mail.lhotse>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: basharath@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: basharath@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

>> Thomas Weißschuh <thomas.weissschuh@linutronix.de> writes:
>> > The members "start" and "end" of struct resource are of type
>> > "resource_size_t" which can be 32bit wide.
>> > Values read from OF however are always 64bit wide.
>> >
>> > Refactor the diff overflow checks into a helper function.
>> > Also extend the checks to validate each calculation step.
>> >
>> > Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
>> > ---
>> >  drivers/of/address.c | 45 ++++++++++++++++++++++++++-------------------
>> >  1 file changed, 26 insertions(+), 19 deletions(-)
>> >
>> > diff --git a/drivers/of/address.c b/drivers/of/address.c
>> > index 7e59283a4472..df854bb427ce 100644
>> > --- a/drivers/of/address.c
>> > +++ b/drivers/of/address.c
>> > @@ -198,6 +198,25 @@ static u64 of_bus_pci_map(__be32 *addr, const __be32 *range, int na, int ns,
>> >
>> >  #endif /* CONFIG_PCI */
>> >
>> > +static int __of_address_resource_bounds(struct resource *r, u64 start, u64 size)
>> > +{
>> > +     u64 end = start;
>> > +
>> > +     if (overflows_type(start, r->start))
>> > +             return -EOVERFLOW;
>> > +     if (size == 0)
>> > +             return -EOVERFLOW;
>> > +     if (check_add_overflow(end, size - 1, &end))
>> > +             return -EOVERFLOW;
>> > +     if (overflows_type(end, r->end))
>> > +             return -EOVERFLOW;
>>
>> This breaks PCI on powerpc qemu. Part of the PCI probe reads a resource
>> that's zero sized, which used to succeed but now fails due to the size
>> check above.
>>
>> The diff below fixes it for me.
>
> I fixed it up with your change.


This commit is breaking Ethernet functionality on the TI AM57xx platform due to zero byte SRAM block size allocation during initialization. Prior to this patch, zero byte block sizes were handled properly.

The issue is with the following line of code:

if (size && check_add_overflow(end, size - 1, &end))  // check_add_overflow not called when size is zero

We feel check_add_overflow() should be invoked even when the size is zero to ensure correct block size allocation.

Thanks & Best Regards,
Basharath

