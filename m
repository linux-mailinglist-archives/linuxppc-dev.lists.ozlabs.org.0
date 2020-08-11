Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82648241AA2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 13:51:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQrks37mDzDqNS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 21:51:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQrhX00cGzDqHL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Aug 2020 21:48:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=TXaMuft5; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BQrhW2xwfz9sRN;
 Tue, 11 Aug 2020 21:48:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1597146539;
 bh=FGZslSUS+tuxP95Yq2auQ+tkuegpm6BzCdbaBayKzY4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=TXaMuft5PmRtKNikAQdY6CR+PcIOaxmonyCfug9jYwbo2hKCjmeS+Jcdv98WisZdh
 JRIFDI0r8rtiYrXi/NL8mx/yO8eFABUTpzUTU/6Cxy6eXmWboz8xDA9HUbOBLh058e
 Gmzlgvmexe76cJ8//san/KsXPoEbhjdn+a65mcCy/9G+EToDev/3A1I1ano9KbkwsV
 NGfqeR5Md1anMTtqxzE1bhkuCfDG3iiuFrsVZOVNq3/aG+B4gGbR96DkfFyUO7LVyz
 8uy18Bs2cI9cZ9yBDxACsoBxj131fOcwGze65S6YM4vHPwY1/4haxf30s1XoUXdVAd
 QsuzBcwjdCCpw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/rtas: Restrict RTAS requests from userspace
In-Reply-To: <1ff85ddd-1b75-f49d-0ae2-edf9e5a199e2@linux.ibm.com>
References: <20200702161932.18176-1-ajd@linux.ibm.com>
 <87bljjxau2.fsf@mpe.ellerman.id.au>
 <1ff85ddd-1b75-f49d-0ae2-edf9e5a199e2@linux.ibm.com>
Date: Tue, 11 Aug 2020 21:48:57 +1000
Message-ID: <87tux99zdi.fsf@mpe.ellerman.id.au>
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
Cc: nathanl@linux.ibm.com, leobras.c@gmail.com, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan <ajd@linux.ibm.com> writes:
> On 10/8/20 4:40 pm, Michael Ellerman wrote:
>> Hi ajd,
>> 
>> Thanks for taking care of this.
>> 
>> I was going to merge this as-is, but given it's fixing a long standing
>> issue there's not really a big rush. So a few comments below.
>
> Thanks for the review.
>
>>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>>> index a09eba03f180..ec1cae52d8bd 100644
>>> --- a/arch/powerpc/kernel/rtas.c
>>> +++ b/arch/powerpc/kernel/rtas.c
...
>> 
>>> +	{ "ibm,activate-firmware", -1, -1, -1, -1 },
>> 
>> Would it be worth making the indices 1-based, allowing 0 to be the
>> unused value, meaning you only have to initialise the used fields?
>
> 1-based array indices are morally reprehensible. It would make it 
> cleaner but I kind of prefer an obvious and clear constant for unused, idk

In my defence they wouldn't be 1-based, they'd be 0-based but off-by-one :P

I'm happy either way, your choice.

cheers
