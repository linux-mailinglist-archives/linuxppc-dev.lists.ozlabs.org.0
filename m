Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E85F842AAF2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 19:41:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTNHp32Dtz305J
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 04:41:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JvXQduYy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JvXQduYy; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTNHB2znwz2yPp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 04:40:38 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2BF1D610C9;
 Tue, 12 Oct 2021 17:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634060435;
 bh=oHNW8iAwbLiMCjrD2yZb/l/38uU1PY+XDUI9AYIgDSw=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=JvXQduYyAbXhNr5vuechmeVPWZyzChGeSQ+79iVtPuL9rzOlBZV0VAlN1v76MWzuI
 CpNFrsAhXr9w2S0J2n6xu1dpL/IrQVM4i3YfQuUEdkwDmxOA09dReDy1YJGT2BHLMG
 LD1IRF2h+YgL/N2KoP/Rvjj+FYeBnoww/jDU4HalsPKsKL5OGEZ8sVg+uzgG+MTsj6
 ArjKPRNf885la5mJXmUihbKMcR9tV5zovLcDM8Lp2un6KWV1JLhYHMeBPrPYT0UIYE
 5k5pGTuV+t8A1A1aYTaf9ORTDczgvJNgOSl/cX9rw8oSIF6DN67yRrKx7vCMqxZKTM
 FlyfyXwYTOWDg==
Message-ID: <c36327cce24449b3eb79209c374514e750b38eb4.camel@kernel.org>
Subject: Re: [PATCH] tpm: ibmvtpm: Make use of dma_alloc_coherent()
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Date: Tue, 12 Oct 2021 20:40:32 +0300
In-Reply-To: <20211012154325.GI2688930@ziepe.ca>
References: <20211010160147.590-1-caihuoqing@baidu.com>
 <31619f2f192a4f1584e458f468422cf6e8f7542f.camel@kernel.org>
 <20211012154325.GI2688930@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, Cai Huoqing <caihuoqing@baidu.com>,
 Paul Mackerras <paulus@samba.org>, Peter Huewe <peterhuewe@gmx.de>,
 linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2021-10-12 at 12:43 -0300, Jason Gunthorpe wrote:
> On Tue, Oct 12, 2021 at 06:29:58PM +0300, Jarkko Sakkinen wrote:
> > On Mon, 2021-10-11 at 00:01 +0800, Cai Huoqing wrote:
> > > Replacing kmalloc/kfree/get_zeroed_page/free_page/dma_map_single/
> > =C2=A0 ~~~~~~~~~
> > =C2=A0 Replace
> >=20
> > > dma_unmap_single() with dma_alloc_coherent/dma_free_coherent()
> > > helps to reduce code size, and simplify the code, and coherent
> > > DMA will not clear the cache every time.
> > >=20
> > > Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> >=20
> > If this does not do functionally anything useful, there's no
> > reason to apply this.
>=20
> At least in this case it looks like the ibmvtpm is not using the DMA
> API properly. There is no sync after each data transfer. Replacing
> this wrong usage with the coherent API is reasonable.

Thank you. As long as this is documented to the commit message,
I'm cool with the change itself.

E.g. something like this would be perfectly fine replacement for the
current commit message:

"The current usage pattern for the DMA API is inappropriate, as
data transfers are not synced. Replace the existing DMA code
with the coherent DMA API."

/Jarkko
