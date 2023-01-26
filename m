Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F01167D59F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 20:46:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2rmg1whcz3fWX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 06:46:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VoyKzLiN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VoyKzLiN;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2rfw2H6Mz3fKR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 06:41:12 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E9B71B81EE0;
	Thu, 26 Jan 2023 19:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A54AEC4339C;
	Thu, 26 Jan 2023 19:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674762066;
	bh=3YjWfRUjo1ft3vovfj8Qj3jVfoFZUWVVSPF5um0H8zE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VoyKzLiNEea4r35ZvjOAjIE9GUFTldWwpSUnLI7E55mloCSr7TsbGm6/pJQ0+n37j
	 Ey3424GqS0m6y6wvsA6a01ivb6oq/gKzpvviM0ASv/lK4h9ClorDIMEtm81rSQ90B8
	 d49B4DHagpUBxkO0N84eFsxptnABs+HFtUKDIKeW65vgXmcMMLIxbih7TzgBji6j/z
	 DomLaK/PhQavIqoKjaeL9JpDz8oBnF7vdRjLWkhR2ejUFY7MRSF7wS3ks/FcapV5KH
	 yn+Dtbj/M2HckZSj5kuumdgcprFLcGYxS1dXf5R2gASVuKyjuHPu7+HIKUYMthXIja
	 CVEbdGOSsbMhw==
Date: Thu, 26 Jan 2023 21:40:41 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v4 1/7] kernel/fork: convert vma assignment to a memcpy
Message-ID: <Y9LXOUMTY4hW3+SQ@kernel.org>
References: <20230126193752.297968-1-surenb@google.com>
 <20230126193752.297968-2-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126193752.297968-2-surenb@google.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity
 .net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 26, 2023 at 11:37:46AM -0800, Suren Baghdasaryan wrote:
> Convert vma assignment in vm_area_dup() to a memcpy() to prevent compiler
> errors when we add a const modifier to vma->vm_flags.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Acked-by: Mel Gorman <mgorman@techsingularity.net>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  kernel/fork.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 441dcec60aae..9260f975b8f4 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -472,7 +472,7 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
>  		 * orig->shared.rb may be modified concurrently, but the clone
>  		 * will be reinitialized.
>  		 */
> -		*new = data_race(*orig);
> +		data_race(memcpy(new, orig, sizeof(*new)));
>  		INIT_LIST_HEAD(&new->anon_vma_chain);
>  		dup_anon_vma_name(orig, new);
>  	}
> -- 
> 2.39.1
> 

-- 
Sincerely yours,
Mike.
