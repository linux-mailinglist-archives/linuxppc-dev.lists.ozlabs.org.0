Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E54358F78B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Aug 2022 08:23:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3Gvq2d25z3bmL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Aug 2022 16:23:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=geVgM6Jb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3GvB3P6Tz2xrj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 16:22:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=geVgM6Jb;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4M3Gv938kvz4x1L;
	Thu, 11 Aug 2022 16:22:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1660198965;
	bh=+wiW3psmm6CZl6wElCrFpx786nCBT9Ynt+1sfGkPkQs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=geVgM6JbeQwzS+Vekw4TCoMXu54Zo5DiZukfgg0asSfhyUU1WZH1k5Wd8PrGAb8xs
	 YCqRImP962Ho0sUUN4mxATtyvSx2q4MUmWfgSB2lLO6TSsFyhFDyBdU+daYCXwk7hU
	 GHsRUiGNq0RQplu/XsNd8N69sKV93vUxH+gZ1XsIMYTbISSIUTxGpUJAlBeYN8NAIF
	 19qvb1gCr+0YDzZ6Pkovi41zHqjF9HiU/Pf8YN069SKqbZqg/G7P5jbm1TOe2l+60U
	 eT2FrEdr56NXw6OUFWi6BWi180edv4aaxUivxHb29AG90vUiWZZw8ZxqYWFz9jM2wf
	 EkcvTum/eyB3Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] MAINTAINERS: Remove myself as EEH maintainer
In-Reply-To: <20220806085301.25142-1-ruscur@russell.cc>
References: <20220806085301.25142-1-ruscur@russell.cc>
Date: Thu, 11 Aug 2022 16:22:43 +1000
Message-ID: <87lervcn9o.fsf@mpe.ellerman.id.au>
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, oohall@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Russell Currey <ruscur@russell.cc> writes:
> I haven't touched EEH in a long time I don't have much knowledge of the
> subsystem at this point either, so it's misleading to have me as a
> maintainer.

Thank you for your service.

> I remain grateful to Oliver for picking up my slack over the years.

Ack.

But I wonder if he is still happy being listed as the only maintainer.
Given the status is "Supported" that means "Someone is actually paid to
look after this" - and I suspect Oracle are probably not paying him to
do that?

Should we change the status? Or just drop the entry entirely and fold it
into the top-level powerpc one?

cheers

> diff --git a/MAINTAINERS b/MAINTAINERS
> index a9f77648c107..dfe6081fa0b3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15639,7 +15639,6 @@ F:	drivers/pci/endpoint/
>  F:	tools/pci/
>  
>  PCI ENHANCED ERROR HANDLING (EEH) FOR POWERPC
> -M:	Russell Currey <ruscur@russell.cc>
>  M:	Oliver O'Halloran <oohall@gmail.com>
>  L:	linuxppc-dev@lists.ozlabs.org
>  S:	Supported
> -- 
> 2.37.1
