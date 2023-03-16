Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9106BC508
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 04:59:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcYR601Wxz3cjR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 14:58:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=htShWEoh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcYQB3Q1lz3cMS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 14:58:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=htShWEoh;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PcYQ43zL3z4x4r;
	Thu, 16 Mar 2023 14:58:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1678939085;
	bh=42DOmCYnfFitbAJMdd0iLS327njtRQ3yzPRoQKunOk4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=htShWEohpinnGHC5CiLFPfDqt+XFVGYznhXQwthhnuq7fUExtFNuu0qN9mWPvxCNF
	 5x1bd6e48mLt2SKe5Z7EUV9vH1fU5aQnD27stvBABbwef0Fvw6XMuavm3VXdjOxfQm
	 arntoPBMGjPsea34pRQqYvWEZd3fjfIwadf/eyilrxxPt2qtZAScgy7NzIaE50MD8W
	 AHSjym3WbqofZ5IhfySyoTDFTVX89G0E9fmr6IlwS5gJAbdN4xnbSfEpt9QN2XerFM
	 GPP+QX3x7vP5sRBmAwk7oX+Uso8pDZHR4ykfuHxmjWZzdKHBbca4pv8xoybl3jLG9S
	 Aa2CeV54WDFqQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] crypto: p10-aes-gcm - remove duplicate include header
In-Reply-To: <ZBE8/Rg9mK3JGBi8@gondor.apana.org.au>
References: <202303141631511535639@zte.com.cn>
 <dbbd6ff3-5e17-9b63-9027-359e37ace668@csgroup.eu>
 <ZBA1EVdy1DvfxgRO@gondor.apana.org.au> <87mt4fobmj.fsf@mpe.ellerman.id.au>
 <ZBE8/Rg9mK3JGBi8@gondor.apana.org.au>
Date: Thu, 16 Mar 2023 14:58:04 +1100
Message-ID: <87r0tpmjoz.fsf@mpe.ellerman.id.au>
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
Cc: "ye.xingchen@zte.com.cn" <ye.xingchen@zte.com.cn>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "davem@davemloft.net" <davem@davemloft.net>, dtsen@linux.ibm.com, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Herbert Xu <herbert@gondor.apana.org.au> writes:
> On Tue, Mar 14, 2023 at 09:44:52PM +1100, Michael Ellerman wrote:
>>
>> Hmm. Seems none of them were ever Cc'ed to linuxppc-dev. So this is the
>> first I've seen of them.
>
> Sorry, I didn't know that you weren't aware of this change.  I
> will be more careful with these ppc patches in future.

No worries, not your fault. My comments were mostly intended for Danny.

Although one question I do have for you is what rules, if any, do we
have for deciding whether crypto code goes in drivers/crypto vs
arch/*/crypto?

On powerpc we have some in arch/powerpc/crypto and some in
drivers/crypto/vmx, and I don't really know why it's split that way.

It seems like drivers/crypto is where non-CPU crypto accelerator drivers
go, but then it also has lots of in-CPU crypto code as well AFAICS.

I wonder if we should move drivers/crypto/vmx into arch/powerpc/crypto,
so that all the powerpc CRYPTOGAMS code is in one place. That would help
to clean up some of the duplication of perl scripts we now have.

cheers
