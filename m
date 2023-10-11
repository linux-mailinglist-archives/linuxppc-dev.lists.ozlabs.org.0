Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DD27C613C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 01:48:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=llZ4fOjk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5TxY1y6gz3cPd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 10:48:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=llZ4fOjk;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5Twd47Zjz2yhZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Oct 2023 10:48:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697068081;
	bh=v6nwpHe4J/UW7amVCn9IXv2fo3diti+324I5sej05bs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=llZ4fOjk+Ah8EX3I+mPNK/G8vzII/W9vLjvmN95boRJgsA8RXjBNicfFEjRsWp6d0
	 qTZEyvsA9XVrPRSpoLH2Vc+Oj3a9qwYOjODCvdN+LDC4GTeX29/QXl97QRM7qaull7
	 XzKovJNrTKvqrf5GMVjJH8qC+/MReuJ5tcMmPzGG2wnXjStc+kK+b7YYkuCyDr50wF
	 Me3JBoper4KaL5P2hcWXYPIIm/jYXJ5G491RFOL1zsctxH7bNGRAr4WV0QOYYOCmTB
	 ZOt6hNCJ6HqbtpljdmynOYPYz7B34ut4is4Zr6/+i6hCsdFtNvWPEb2fJthVb04IED
	 OiW9m2PJyEG3w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S5Twd1Fb3z4xWF;
	Thu, 12 Oct 2023 10:48:00 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Erhard Furtner <erhard_f@mailbox.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Bisected] PowerMac G5 fails booting kernel 6.6-rc3 (BUG:
 Unable to handle kernel data access at 0xfeffbb62ffec65fe)
In-Reply-To: <20230929132750.3cd98452@yea>
References: <20230929132750.3cd98452@yea>
Date: Thu, 12 Oct 2023 10:47:51 +1100
Message-ID: <87r0m0raag.fsf@mail.lhotse>
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
Cc: willy@infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Erhard Furtner <erhard_f@mailbox.org> writes:
> Greetings!
>
> Kernel 6.5.5 boots fine on my PowerMac G5 11,2 but kernel 6.6-rc3
> fails to boot with following dmesg shown on the OpenFirmware console
> (transcribed screenshot):

Thanks for transcribing all that :)

I don't see this crash on my quad G5.

I notice that your config has CONFIG_FLATMEM=y. Can you try switching to
SPARSEMEM and see if that helps? It might help us narrow down the bug at
least.

cheers
