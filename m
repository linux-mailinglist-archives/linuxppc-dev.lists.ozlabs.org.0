Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A4189B726
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 07:29:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=l13nWhqg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCd2B1QQmz3vWy
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 15:29:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=l13nWhqg;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCd1V0D3Rz3bfS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 15:29:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1712554141;
	bh=YaJc4hAKyVAyUGlKeEz26A8dZKKd75WpuyJPiLKVz94=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=l13nWhqgc3bRToxvUFycvA7lVA9dBc3YPCNj2uqG/l/kDCIG2e8Sb6jGQgeFivQoH
	 EFe110IQLmfEBjxFOAcViyBp1+B4Rq0QeY99r7Hlyx8uJovPEugC4WvRf7DAwdYiD+
	 gpHhY1ZBM8eXOfUGKGI5F9zyy4e+7qPj/EEI+9vf05fAgW+a8ZZHvRFVXpvfLfRB6M
	 YihltItPcWL16DBjvylW6uTPJGnokpeFH2JYmtGRLH0wdCpMuTh0jjnhVT6bh2U9EP
	 y+VrneMNgn34p/RJM3GY5JwegnbTV3aE9wI9CDHalYsEVkziNm8l3icev1KfmDhnna
	 bygEnbD15vrPA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VCd1T2x73z4wxt;
	Mon,  8 Apr 2024 15:29:00 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Finn Thain <fthain@linux-m68k.org>, Jiri Slaby <jirislaby@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] serial/pmac_zilog: Remove flawed mitigation for rx irq
 flood
In-Reply-To: <4bddf8ec-97f1-07f6-9c0a-523c102c0a1b@linux-m68k.org>
References: <dda2187e128bfaaf092351812e4538e2e41c17f6.1711599093.git.fthain@linux-m68k.org>
 <Zg3YZN-QupyVaTPm@surfacebook.localdomain>
 <8f234f26-d5e3-66ed-ab0c-86d3c9852b4a@linux-m68k.org>
 <CAHp75VcxLez_Nm0N8=gpWd7SKGd9JF2QXEOOB_gvX3ZtTzj6HQ@mail.gmail.com>
 <87y19s7bk6.fsf@mail.lhotse>
 <4bddf8ec-97f1-07f6-9c0a-523c102c0a1b@linux-m68k.org>
Date: Mon, 08 Apr 2024 15:29:00 +1000
Message-ID: <87v84sbexv.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, linux-serial@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Finn Thain <fthain@linux-m68k.org> writes:
> On Fri, 5 Apr 2024, Michael Ellerman wrote:
>> >> > > ---
>> >> > (here is a good location for Cc:)
>> >>
>> >> Documentation/process/submitting-patches.rst indicats that it should 
>> >> be above the "---" separator together with Acked-by etc. Has this 
>> >> convention changed recently?
>> 
>> The docs don't really say where to put the Cc: tags, although they are 
>> mentioned along with other tags which clearly are intended to go above 
>> the separator.
>
> I see no ambiguity there. What's the point of copying the message headers 
> into the message body unless it was intended that they form part of the 
> commit log?

In many cases I think it's the reverse. The Cc headers are in the commit
log *so that* git-send-email will add them to the Cc list when the patch
is sent.

In that case they can sit below the separator and still function.

IMO there is no value in having them in the commit log. The fact that
someone was Cc'ed on a patch 10 years ago is not interesting. If it ever
was interesting, for some forensic purpose, the mail archives would be
the place to look anyway.

>> > I see, I will prepare a patch to discuss this aspect.
>> 
>> FYI there was a discussion about this several years ago, where at least 
>> some maintainers agreed that Cc: tags don't add much value and are 
>> better placed below the --- separator.
>> 
>
> Maintainers who merge patches almost always add tags. And they can use the 
> Cc tags from the message headers if they wish to. Or they can omit them or 
> remove them. I don't mind. And I'd be happy to resubmit the patch with 
> different tags if that's what is needed by the workflow used by Jiri Slaby 
> or Greg Kroah-Hartman.

Many maintainers won't drop Cc: tags if they are there in the submitted
patch. So I agree with Andy that we should encourage folks not to add
them in the first place.

But that's getting very off topic for your submission :)

cheers
