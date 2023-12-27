Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A69D381EB05
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 01:46:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KGsmrGBM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T0CcX2mMwz30gC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 11:46:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KGsmrGBM;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T0Cbg6KVVz2yl1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 11:45:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1703637915;
	bh=6tfB8NVprQLkYBXdgGgiZqGVbBwkRH8ck3CiALnCtRo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KGsmrGBMs0xb0zD4RZcDYgTaKETlxUVGI2hcw6B2HccFigRsdsdHZHH+jE0ggdvc7
	 9C6qUZRuTFGpoAsOXzs+jGu3T6ZtpBtVToQqMak54CanOLxZ0zKK7m4Q4qWKl3wGbN
	 f74EBEy5rAs3u1P0WN4ja9HsOaiRMONVYGCgR2GK5Xc7RKIYqejtmO/Y7M2NbTbo05
	 OExf0OrsecOdiSvP4ijHxxCH4gsVvL8Agwf2iRkFFVXDuzZ2+fN74T/7IitWi/w0oB
	 /1pHcXMpXFLQuPPh1eF1syLq8cpd8S2rTRTX7Oi7TEeADEoivTthKupLPyjY5Edevh
	 k+7vCEdo524bg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T0CbZ5lZBz4wc3;
	Wed, 27 Dec 2023 11:45:14 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
Subject: Re: [PATCH] arch: powerpc: kernel: fixed some typos
In-Reply-To: <CAG-Bmoejy6t-EHv96OTnGhvo-P82fhw5pSUM-LqLfh7Hgh5Qew@mail.gmail.com>
References: <20231215115857.575697-1-ghanshyam1898@gmail.com>
 <87il4rlrw2.fsf@mail.lhotse>
 <CAG-Bmoejy6t-EHv96OTnGhvo-P82fhw5pSUM-LqLfh7Hgh5Qew@mail.gmail.com>
Date: Wed, 27 Dec 2023 11:45:13 +1100
Message-ID: <8734volbhi.fsf@mail.lhotse>
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
Cc: mahesh@linux.ibm.com, linux-kernel@vger.kernel.org, oohall@gmail.com, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ghanshyam Agrawal <ghanshyam1898@gmail.com> writes:
> On Thu, Dec 21, 2023 at 4:55=E2=80=AFPM Michael Ellerman <mpe@ellerman.id=
.au> wrote:
>>
>> Ghanshyam Agrawal <ghanshyam1898@gmail.com> writes:
>> > Fixed some typos
>> >
>> > Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
>> > ---
>> >  arch/powerpc/kernel/eeh_pe.c | 6 +++---
>> >  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> Please also fix the case in arch/powerpc/include/asm/eeh.h
>>
>> The subject should use the correct prefix. You can see what it should be
>> using:
>>
>> $ git log --oneline arch/powerpc/kernel/eeh_pe.c
>>
>> Please give the patch a better subject, not "some typos", tell me what
>> misspelling you're fixing. Same comment for the commit description.
>>
>> > diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe=
.c
>> > index e0ce81279624..8e0c1a8b8641 100644
>> > --- a/arch/powerpc/kernel/eeh_pe.c
>> > +++ b/arch/powerpc/kernel/eeh_pe.c
>> > @@ -24,10 +24,10 @@ static int eeh_pe_aux_size =3D 0;
>> >  static LIST_HEAD(eeh_phb_pe);
>> >
>> >  /**
>> > - * eeh_set_pe_aux_size - Set PE auxillary data size
>> > - * @size: PE auxillary data size
>> > + * eeh_set_pe_aux_size - Set PE auxiliary data size
>> > + * @size: PE auxiliary data size
>>
>> While you're changing it you could also mention what the units of the
>> size are.
>>
>> >   *
>> > - * Set PE auxillary data size
>> > + * Set PE auxiliary data size
>>
>> This should gain a full stop at the end of the sentence.
>>
>> >   */
>> >  void eeh_set_pe_aux_size(int size)
>> >  {
>> > --
>> > 2.25.1
>
> Hi Michael,
>
> Thank you very much for your suggestions. I will implement them
> and send a v2 patch.
>
> You mentioned I need to specify the units of "PE auxiliary data size".
> Is the unit BYTES? Sorry for the silly question, I am only beginning
> to contribute to the linux kernel.

That's OK. Yes it's bytes.

If you look for where eeh_pe_aux_size is used, it's added to some other
values and then eventually passed to kzalloc(), which takes a size in
bytes. So you can infer that it is also in units of bytes.

cheers
