Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B652587677
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 06:53:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxjL908kPz3cB8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 14:53:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxjKm4ByJz2xHB
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 14:52:59 +1000 (AEST)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 2724oWWl004209;
	Mon, 1 Aug 2022 23:50:33 -0500
Message-ID: <9fb802d118eca207ffb887201b7b12970b054a27.camel@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/powermac/udbg_scc: Fix refcount leak bug in
 udbg_scc_init()
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Liang He <windhl@126.com>, mpe@ellerman.id.au, paulus@samba.org,
        linuxppc-dev@lists.ozlabs.org
Date: Tue, 02 Aug 2022 14:50:32 +1000
In-Reply-To: <20220716074344.540049-1-windhl@126.com>
References: <20220716074344.540049-1-windhl@126.com>
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

On Sat, 2022-07-16 at 15:43 +0800, Liang He wrote:
> During the iteration of for_each_child_of_node(), we need to call
> of_node_put() for the old references stored in to 'ch_def' and 'ch_a'
> as their refcounters have been increased in last iteration.

None of these matter since those nodes are never *ever* released and
those machines don't use dynamic node allocation but ...

> Fixes: 51d3082fe6e5 ("[PATCH] powerpc: Unify udbg (#2)")
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  arch/powerpc/platforms/powermac/udbg_scc.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powermac/udbg_scc.c
> b/arch/powerpc/platforms/powermac/udbg_scc.c
> index 734df5a32f99..1b7c39e841ee 100644
> --- a/arch/powerpc/platforms/powermac/udbg_scc.c
> +++ b/arch/powerpc/platforms/powermac/udbg_scc.c
> @@ -81,10 +81,14 @@ void __init udbg_scc_init(int force_scc)
>  	if (path != NULL)
>  		stdout = of_find_node_by_path(path);
>  	for_each_child_of_node(escc, ch) {
> -		if (ch == stdout)
> +		if (ch == stdout) {
> +			of_node_put(ch_def);
>  			ch_def = of_node_get(ch);
> -		if (of_node_name_eq(ch, "ch-a"))
> +		}
> +		if (of_node_name_eq(ch, "ch-a")) {
> +			of_node_put(ch_a);
>  			ch_a = of_node_get(ch);
> +		}
>  	}
>  	if (ch_def == NULL && !force_scc)
>  		goto bail;

