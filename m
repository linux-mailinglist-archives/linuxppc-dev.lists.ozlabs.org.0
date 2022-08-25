Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CAA5A0AF0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 10:04:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCwTp2jrJz3bxC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 18:04:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pVbzN5oW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCwTD40xqz2yMK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 18:03:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pVbzN5oW;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MCwTD30b3z4x1J;
	Thu, 25 Aug 2022 18:03:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1661414624;
	bh=O14Xj2lywTDFEF6CkYPDHXc1idVfkK9bHMPZjyK4Qhs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pVbzN5oW4h0isKtJDlBGywGafKNw3vsWSumgE6DNB4YLDa2SQmGp1h6JfuSuZn4u1
	 E4iqCRsNoe0IsO3lUes4NZt5WefaZpRY2KkL5svStkHL8DVPv7ngOz0e63pcI6t5Bp
	 +PeM6eUShy+oTQd5601n5jsn/P/7W/sp00M4IDqMJEYReoUV0JDMbESB9/t2zIkNaB
	 RQh7sE1SMCQvkIcINRGAj2yuZnQsEgRqqeLmdJqDx1yeqaO/XLd4MbCVB988RLytQB
	 tTplMFsK5I+Ut+5V1s4ec1kmHkN40kO5T8PtQ0Lxu6cJmKq4VQlOV5IFvMjmybxipv
	 iQyFroe1KyE/w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/2] powerpc/rtas: Fix RTAS MSR[HV] handling for Cell
In-Reply-To: <c100477ab300d3e017ff1746a0be103e98048c49.camel@gmail.com>
References: <20220823115952.1203106-1-mpe@ellerman.id.au>
 <20220823115952.1203106-2-mpe@ellerman.id.au>
 <ae28ea837d733d5bdb86c9c2e44c74808fa5ee8b.camel@gmail.com>
 <87bks9luep.fsf@mpe.ellerman.id.au>
 <c100477ab300d3e017ff1746a0be103e98048c49.camel@gmail.com>
Date: Thu, 25 Aug 2022 18:03:44 +1000
Message-ID: <871qt4lpgf.fsf@mpe.ellerman.id.au>
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
Cc: rmclure@linux.ibm.com, ldufour@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe <jniethe5@gmail.com> writes:
> On Wed, 2022-08-24 at 22:04 +1000, Michael Ellerman wrote:
>> Jordan Niethe <jniethe5@gmail.com> writes:
>> > On Tue, 2022-08-23 at 21:59 +1000, Michael Ellerman wrote:
>> > > The semi-recent changes to MSR handling when entering RTAS (firmware)
>> > > cause crashes on IBM Cell machines. An example trace:
>> ...
>> > > diff --git a/arch/powerpc/kernel/rtas_entry.S b/arch/powerpc/kernel/rtas_entry.S
>> > > index 9a434d42e660..6ce95ddadbcd 100644
>> > > --- a/arch/powerpc/kernel/rtas_entry.S
>> > > +++ b/arch/powerpc/kernel/rtas_entry.S
>> > > @@ -109,8 +109,12 @@ _GLOBAL(enter_rtas)
>> > >  	 * its critical regions (as specified in PAPR+ section 7.2.1). MSR[S]
>> > >  	 * is not impacted by RFI_TO_KERNEL (only urfid can unset it). So if
>> > >  	 * MSR[S] is set, it will remain when entering RTAS.
>> > > +	 * If we're in HV mode, RTAS must also run in HV mode, so extract MSR_HV
>> > > +	 * from the saved MSR value and insert into the value RTAS will use.
>> > >  	 */
>> > 
>> > Interestingly it looks like these are the first uses of these extended
>> > mnemonics in the kernel?
>> 
>> We used to have at least one use I know of in TM code, but it's since
>> been converted to C.
>> 
>> > > +	extrdi	r0, r6, 1, 63 - MSR_HV_LG
>> > 
>> > Or in non-mnemonic form...
>> > rldicl  r0, r6, 64 - MSR_HV_LG, 63
>> 
>> It's rldicl all the way down.
>> 
>> > >  	LOAD_REG_IMMEDIATE(r6, MSR_ME | MSR_RI)
>> > > +	insrdi	r6, r0, 1, 63 - MSR_HV_LG
>> > 
>> > Or in non-mnemonic form...
>> > rldimi	r6, r0, MSR_HV_LG, 63 - MSR_HV_LG
>> 
>> I think the extended mnemonics are slightly more readable than the
>> open-coded versions?
>
> Yeah definitely. I was just noting the plain instruction as I think we
> have some existing patterns that may be potential candidates for conversion to the
> extended version. Like in exceptions-64s.S
>
> 	rldicl. r0, r12, (64-MSR_TS_LG), (64-2) 
> 	to 
> 	extrdi. r0, r12, 2, 63 - MSR_TS_LG - 1
>
> Would it be worth changing these?

Some folks are very comfortable with rldicl and probably prefer the
former, but I'm not sure there's many of those people around anymore :)

I think the extrdi is a bit more readable.

You could use MSR_TS_T_LG to avoid the - 1? All those uses have a
comment about it being 2 bits already.

cheers
