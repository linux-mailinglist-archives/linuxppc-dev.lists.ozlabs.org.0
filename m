Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E451BE9423
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 01:38:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472qLh1brhzF3jp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 11:38:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472qJY4x7vzDrNM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 11:36:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="ZrnBz8u9"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 472qJX3hTfz9sPc;
 Wed, 30 Oct 2019 11:36:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1572395789;
 bh=cULIR7FKewGoqcCdVz8c9GWUqTWBzH9vqip6TO04VUc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ZrnBz8u9UtK35OIBdIYRAEKio8qsnCeoIwPBgPl54K4vLbIV96JpIRijFpj2d6VB/
 3yh38Zr83pyrrBKy1ob5pSFhYxjuOlDR0wxkT8j7sl+eURIwkfQTLhKOPMbjRLCHNq
 MPU6tRZ65hAlAqqvCFI2RrdLVQrG78Wr2+aweqLgfwKHT2b4iNG1L0VLagLCRgHq71
 9Qowav3rgtSLYQrVlsSwHP5FNWVuKn5384n4lcPyxoq23HnVPJULVs58QCVxd2xxKS
 D2BpI2IuAS9K0kM2/GMwh2a5yxiVaLELSZ6BKELGQ4NYJ1J1dErqYrlReUBS6dnZ/y
 akJSpbqkFajEA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 4/7] soc: fsl: qe: replace spin_event_timeout by
 readx_poll_timeout_atomic
In-Reply-To: <a11aaeaa-7075-4ad0-aa26-d8d7eafa72f5@rasmusvillemoes.dk>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191018125234.21825-5-linux@rasmusvillemoes.dk>
 <20191018160852.GA13036@infradead.org>
 <a11aaeaa-7075-4ad0-aa26-d8d7eafa72f5@rasmusvillemoes.dk>
Date: Wed, 30 Oct 2019 11:36:27 +1100
Message-ID: <87wocnf4s4.fsf@mpe.ellerman.id.au>
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
Cc: Qiang Zhao <qiang.zhao@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rasmus Villemoes <linux@rasmusvillemoes.dk> writes:
> On 18/10/2019 18.08, Christoph Hellwig wrote:
>> On Fri, Oct 18, 2019 at 02:52:31PM +0200, Rasmus Villemoes wrote:
>>>  	/* wait for the QE_CR_FLG to clear */
>>> -	ret = spin_event_timeout((ioread32be(&qe_immr->cp.cecr) & QE_CR_FLG) == 0,
>>> -				 100, 0);
>>> -	/* On timeout (e.g. failure), the expression will be false (ret == 0),
>>> -	   otherwise it will be true (ret == 1). */
>>> +	ret = readx_poll_timeout_atomic(ioread32be, &qe_immr->cp.cecr, val, (val & QE_CR_FLG) == 0,
>> 
>> This creates an overly long line.
>
> Yeah, readx_poll_timeout_atomic is a mouthful, and then one also has to
> put in the name of the accessor... I'll wrap it when I respin the
> series, thanks.
>
>> Btw, given how few users of spin_event_timeout we have it might be good
>> idea to just kill it entirely.
>
> Maybe. That's for the ppc folks to comment on; the iopoll.h helpers are
> not completely equivalent (because obviously they don't read tbl
> directly).

AFAICS it was added by and only ever used by Freescale folks, most of
whom have now moved on to other things.

I'd be happy to see it replaced with something generic.

I created an issue in our github to remind us to do that cleanup. Though
in practice that probably just means we'll never get around to it:

  https://github.com/linuxppc/issues/issues/280

> Maybe the generic versions should be taught
> spin_begin/spin_end/spin_cpu_relax so at least that part would be
> drop-in replacement.

That would be nice. Though TBH the intersection of platforms that use
spin_event_timeout() and also define a non-empty spin_begin() etc. is
close to if not zero.

cheers
