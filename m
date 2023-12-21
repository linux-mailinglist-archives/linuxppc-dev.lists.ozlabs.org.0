Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCA381B4DE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 12:25:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UVAEsq1w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Swp5N4PD7z3cTb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 22:25:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UVAEsq1w;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Swp4Z3vlBz30Q3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 22:25:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1703157902;
	bh=FEH0A7jz7vXNvZgR/E0+au0EVLX99YxTzXY6b6eAv40=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UVAEsq1wLn9+mnU9rDvkKvREUHvZ2B1o29gMCbNQJsjq5rD2GZWCSsBfngwMoSb2H
	 H07uyGdzhdeXKCnIyQsGSKsD1RQmIZmvo6m0nJGPQxEi4aJTMIHPRKVc80HkIt1Dx4
	 +yscMrdXLBkI0dBELSx1XhFvg8znOKNTtHkXaC7SqNseL0XJmSuAPaXJi0IE/CedYj
	 3xpTEwpE5ktNJRT8ralxe/O79+HB+gguAHbmgFD/o5ldHMz3w6mUlTbbuwuwW/QHOO
	 Jz+vMLXteXdLEilwDkriX1qKyrQf9LxLDTskaLXJ0cwszCXR2ezv7NEz5RNf/SqcCR
	 KetiZLajfYtFA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Swp4Z2MYlz4xVd;
	Thu, 21 Dec 2023 22:25:02 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ghanshyam Agrawal <ghanshyam1898@gmail.com>, mahesh@linux.ibm.com,
 oohall@gmail.com, npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH] arch: powerpc: kernel: fixed some typos
In-Reply-To: <20231215115857.575697-1-ghanshyam1898@gmail.com>
References: <20231215115857.575697-1-ghanshyam1898@gmail.com>
Date: Thu, 21 Dec 2023 22:25:01 +1100
Message-ID: <87il4rlrw2.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, Ghanshyam Agrawal <ghanshyam1898@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ghanshyam Agrawal <ghanshyam1898@gmail.com> writes:
> Fixed some typos
>
> Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
> ---
>  arch/powerpc/kernel/eeh_pe.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Please also fix the case in arch/powerpc/include/asm/eeh.h

The subject should use the correct prefix. You can see what it should be
using:

$ git log --oneline arch/powerpc/kernel/eeh_pe.c

Please give the patch a better subject, not "some typos", tell me what
misspelling you're fixing. Same comment for the commit description.

> diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
> index e0ce81279624..8e0c1a8b8641 100644
> --- a/arch/powerpc/kernel/eeh_pe.c
> +++ b/arch/powerpc/kernel/eeh_pe.c
> @@ -24,10 +24,10 @@ static int eeh_pe_aux_size = 0;
>  static LIST_HEAD(eeh_phb_pe);
>  
>  /**
> - * eeh_set_pe_aux_size - Set PE auxillary data size
> - * @size: PE auxillary data size
> + * eeh_set_pe_aux_size - Set PE auxiliary data size
> + * @size: PE auxiliary data size
 
While you're changing it you could also mention what the units of the
size are.

>   *
> - * Set PE auxillary data size
> + * Set PE auxiliary data size
 
This should gain a full stop at the end of the sentence.

>   */
>  void eeh_set_pe_aux_size(int size)
>  {
> -- 
> 2.25.1


cheers
