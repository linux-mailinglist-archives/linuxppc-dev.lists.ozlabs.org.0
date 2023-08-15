Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7C577CBEB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 13:46:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LUPBAVlS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQ8c95G21z3cRC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 21:46:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LUPBAVlS;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQ8bK3F6Qz3c4b
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 21:45:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692099933;
	bh=B7H1wPFCpZ/hwcxJ8xFa02xLG2LsuWtZGZq9nBFeRnc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LUPBAVlSpuRgIRR98QO4bxof9MsLaohXOUN9wiGby8bl8wipoJbYkvf1YY2cn89Gv
	 t45/vrPScckhf5z+hnEE/5ZU5T5Jb4YvvKRHOrgDgyj+RdqTnXbHt2XPfb+G60EKCy
	 k/l8A9wXO5UlsY2/Rb2nb3tShkZyeYnddkCZ7v1l8rg8iCvPwTSIa1uCbU956KtWoH
	 +rtEvUs4pTxUM/6h51Azav1JywoSc5ncSo9Qf+tq/0Wl1woiTqTuEfQcsp4sDATmo/
	 OWA4st3T3eJe60cxapz/6wpFSdJMlMofxxrBGHPXbsf1JduhLa/Oj8pbQjkd5PJJEV
	 2b9U2x+yNCfWg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RQ8bK0G9fz4wZs;
	Tue, 15 Aug 2023 21:45:33 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] powerpc: Make virt_to_pfn() a static inline
In-Reply-To: <CACRpkdZuLeMKg1vG9+8tcUtWUNN-EowhpPmt6VnGuS+f9ok81g@mail.gmail.com>
References: <20230809-virt-to-phys-powerpc-v1-1-12e912a7d439@linaro.org>
 <87y1icdaoq.fsf@mail.lhotse>
 <CACRpkdZuLeMKg1vG9+8tcUtWUNN-EowhpPmt6VnGuS+f9ok81g@mail.gmail.com>
Date: Tue, 15 Aug 2023 21:45:30 +1000
Message-ID: <87il9gcyw5.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus Walleij <linus.walleij@linaro.org> writes:
> On Tue, Aug 15, 2023 at 9:30=E2=80=AFAM Michael Ellerman <mpe@ellerman.id=
.au> wrote:
>> Linus Walleij <linus.walleij@linaro.org> writes:
>
>> > -     return ((unsigned long)__va(pmd_val(pmd) & ~PMD_MASKED_BITS));
>> > +     return (const void *)((unsigned long)__va(pmd_val(pmd) & ~PMD_MA=
SKED_BITS));
>>
>> This can also just be:
>>
>>         return __va(pmd_val(pmd) & ~PMD_MASKED_BITS);
>>
>> I've squashed that in.
>
> Oh you applied it, then I don't need to send revised versions, thanks Mic=
hael!

Yeah, it's in my next-test, so I can still change it if needed for a day
or two. But if you're happy with me squashing those changes in then
that's easy, no need to send a v2.

cheers
