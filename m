Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC26584C32
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 08:53:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvJBr1vnnz3bpW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 16:53:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gokuqtaq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvJBH0M0Dz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 16:53:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gokuqtaq;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvJBG0jjkz4x1Y;
	Fri, 29 Jul 2022 16:53:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1659077590;
	bh=mMQHa95tZrtKAkKeRbCcHdd7SVD3uqX6L7aTavd4BmI=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=gokuqtaqlk17LP6I/P2clgOWiapPyjljq5Fa/jnOMj8Ln7tdwUAC0mIq6pqLZv4aO
	 lMg02ahMBupC9gROCF1HCPi23mzBTxYMxU2kjZi/4L5TH54rktOb7l8EMpEar1e77w
	 PCOlMuj6i98zKM10riGf3w100QnM/4j1AQDycpU8CyEvPP13IgfxiThCvn635/5SFd
	 KnCuaUkSRLpBvu91Yevu9mtCwZzU5XNdzKkqyoSXiJ7tPQ8Q2t9dD/muO063u0lmAl
	 30zdzIfNi7CXYXcjt//J/A4IsvnN44+o3KJadZFs/01KWsz3JWw+TbN/60NpCe8HoM
	 OCQ7kVw2QyWAw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Miaoqian Lin <linmq006@gmail.com>, Scott Wood <oss@buserror.net>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Miaoqian Lin <linmq006@gmail.com>, Nick Child <nick.child@ibm.com>, Nate
 Case <ncase@xes-inc.com>, Kumar Gala <galak@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] powerpc/85xx: Fix reference leak in
 xes_mpc85xx_setup_arch
In-Reply-To: <20220603121752.23548-1-linmq006@gmail.com>
References: <20220603121752.23548-1-linmq006@gmail.com>
Date: Fri, 29 Jul 2022 16:53:06 +1000
Message-ID: <87pmhobeb1.fsf@mpe.ellerman.id.au>
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

Miaoqian Lin <linmq006@gmail.com> writes:
> of_find_node_by_path() returns remote device nodepointer with
> refcount incremented, we should use of_node_put() on it when done.
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: 3038acf9091f ("powerpc/85xx: Add platform support for X-ES MPC85xx boards")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
> changes in v2:
> - update Fixes tag.
> v1 Link: https://lore.kernel.org/all/20220603120907.19999-1-linmq006@gmail.com
> ---
>  arch/powerpc/platforms/85xx/xes_mpc85xx.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/powerpc/platforms/85xx/xes_mpc85xx.c b/arch/powerpc/platforms/85xx/xes_mpc85xx.c
> index 5836e4ecb7a0..93f67b430714 100644
> --- a/arch/powerpc/platforms/85xx/xes_mpc85xx.c
> +++ b/arch/powerpc/platforms/85xx/xes_mpc85xx.c
> @@ -130,6 +130,8 @@ static void __init xes_mpc85xx_setup_arch(void)
>  	mpc85xx_smp_init();
>  
>  	fsl_pci_assign_primary();
> +
> +	of_node_put(root);
>  }

For context, here is the full function:

static void __init xes_mpc85xx_setup_arch(void)
{
	struct device_node *root;
	const char *model = "Unknown";

	root = of_find_node_by_path("/");
	if (root == NULL)
		return;

	model = of_get_property(root, "model", NULL);

	printk(KERN_INFO "X-ES MPC85xx-based single-board computer: %s\n",
	       model + strlen("xes,"));

	xes_mpc85xx_fixups();

	mpc85xx_smp_init();

	fsl_pci_assign_primary();
}


So yes it's missing an of_node_put(root).

But rather than add the of_node_put(), it would be simpler to just use
of_root directly, then it doesn't need an of_node_put() at all.

But then look closer. To begin with model is assigned "Unknown", but
then unconditionally overwritten by the of_get_property() call. So
that's a waste of space.

And then if there's no model property of_get_property() will return
NULL, and then the model + strlen("xes,") would oops.

And all of that just to print the model at boot, which is not really
necessary, anyone who cares can look it up in /proc/device-tree
after the system has booted.

So please just remove the lookup and printing of model entirely.

cheers
