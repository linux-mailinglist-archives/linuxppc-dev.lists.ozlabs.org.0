Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7C95AC915
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 05:26:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLYpD09Kbz304v
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 13:26:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kvS2IfOG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLYnc0d7Cz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 13:25:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kvS2IfOG;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MLYnb0rRLz4wgr;
	Mon,  5 Sep 2022 13:25:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1662348355;
	bh=j+uE9sAdBVUdQdvKBc3MYPSExiI/5iV7d0KFmt7Iwlk=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=kvS2IfOGLQiO+DcIm1Xb1gejx3j92nRgowBU3c59KwC3Chadnp5N+oFqJBIQhDOEL
	 Lwqwo4QKLwRAAlSzjFsoC7/euL45h34/voNJvw/XkeVbchZIvP3eOqAv+zQZPBe/oN
	 hvcR6IkA5fM8TvAV3Eugy7RSny2kHQpNm1mv8xqkLnGH9UNoEa4PTk1bG1FPtFb/gm
	 7aTl7az2n28vYiaiQwDI9tVmLWeqTNDZ2OnIJdT1VP4IEXUQafICT0qzZBiA7kmTRg
	 MTTXM/dU2ae3VW0uEHC0EhhtgYDIE+RX8YOnw9HTJEM3e4oZHFwSvi9FtxP3iBMRzU
	 KyoEFoTEZjdKQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Liang He <windhl@126.com>, benh@kernel.crashing.org, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, windhl@126.com
Subject: Re: [PATCH v2] powerpc: kernel: legacy_serial: Fix missing
 of_node_put() in add_legacy_soc_port()
In-Reply-To: <20220702013714.263614-1-windhl@126.com>
References: <20220702013714.263614-1-windhl@126.com>
Date: Mon, 05 Sep 2022 13:25:38 +1000
Message-ID: <87czcatsct.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Liang He <windhl@126.com> writes:
> We should call of_node_put() for the reference 'tsi' returned by
> of_get_parent() which will increase the refcount.
>
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  changelog:
>
>  v2: use more conservative way to call of_node_put()
>  v1: mov 'of_node_put()' into the 'if' condition
>
>  v1 Link: https://lore.kernel.org/all/20220701130203.240023-1-windhl@126.com/
>
>  arch/powerpc/kernel/legacy_serial.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/kernel/legacy_serial.c b/arch/powerpc/kernel/legacy_serial.c
> index f048c424c525..cca72081b864 100644
> --- a/arch/powerpc/kernel/legacy_serial.c
> +++ b/arch/powerpc/kernel/legacy_serial.c
> @@ -166,7 +166,7 @@ static int __init add_legacy_soc_port(struct device_node *np,
>  {
>  	u64 addr;
>  	const __be32 *addrp;
> -	struct device_node *tsi = of_get_parent(np);
> +	struct device_node *tsi;
>  
>  	/* We only support ports that have a clock frequency properly
>  	 * encoded in the device-tree.
> @@ -194,12 +194,17 @@ static int __init add_legacy_soc_port(struct device_node *np,
>  	/* Add port, irq will be dealt with later. We passed a translated
>  	 * IO port value. It will be fixed up later along with the irq
>  	 */
> -	if (of_node_is_type(tsi, "tsi-bridge"))
> +	tsi = of_get_parent(np);
> +	if (of_node_is_type(tsi, "tsi-bridge")) {
> +		of_node_put(tsi);
>  		return add_legacy_port(np, -1, UPIO_TSI, addr, addr,
>  				       0, legacy_port_flags, 0);
> -	else
> +	}
> +	else {
> +		of_node_put(tsi);
>  		return add_legacy_port(np, -1, UPIO_MEM, addr, addr,
>  				       0, legacy_port_flags, 0);
> +	}
>  }

The two legs of the else end up with duplicated code except for a single
parameter to add_legacy_port().

Better would be:

{
	int iotype;
        ...

	tsi = of_get_parent(np);
	if (of_node_is_type(tsi, "tsi-bridge"))
		iotype = UPIO_TSI;
	else
		iotype = UPIO_MEM;

	of_node_put(tsi);
        return add_legacy_port(np, -1, iotype, addr, addr, 0, legacy_port_flags, 0);
}


cheers
