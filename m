Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1066A58767A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 06:53:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxjLZ6Wblz3dry
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 14:53:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxjL44sZsz3c6d
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 14:53:16 +1000 (AEST)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 2724p8Yr004225;
	Mon, 1 Aug 2022 23:51:09 -0500
Message-ID: <2c9150f2af2147bb7c40c646de51f46620ddb8b9.camel@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/powermac/pfunc_base: Fix refcount leak bug in
 macio_gpio_init_one()
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Liang He <windhl@126.com>, mpe@ellerman.id.au, paulus@samba.org,
        linuxppc-dev@lists.ozlabs.org
Date: Tue, 02 Aug 2022 14:51:08 +1000
In-Reply-To: <20220716073111.539739-1-windhl@126.com>
References: <20220716073111.539739-1-windhl@126.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Sat, 2022-07-16 at 15:31 +0800, Liang He wrote:
> We should call of_node_put() for the reference 'gparent' escaped
> out of the for_each_child_of_node() as it has increased the refcount.

Same comment as before. That stuff happens once at boot, there's never
any dynamic allocation/deallocation of these, they just don't matter,
but feel free .... :-)

> Fixes: 5b9ca526917b ("[PATCH] 3/5 powerpc: Add platform functions
> interpreter")
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  arch/powerpc/platforms/powermac/pfunc_base.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/platforms/powermac/pfunc_base.c
> b/arch/powerpc/platforms/powermac/pfunc_base.c
> index 9c2947a3edd5..085e0ad20eba 100644
> --- a/arch/powerpc/platforms/powermac/pfunc_base.c
> +++ b/arch/powerpc/platforms/powermac/pfunc_base.c
> @@ -136,6 +136,8 @@ static void __init macio_gpio_init_one(struct
> macio_chip *macio)
>  	for_each_child_of_node(gparent, gp)
>  		pmf_do_functions(gp, NULL, 0, PMF_FLAGS_ON_INIT, NULL);
>  
> +	of_node_put(gparent);
> +
>  	/* Note: We do not at this point implement the "at sleep" or
> "at wake"
>  	 * functions. I yet to find any for GPIOs anyway
>  	 */

