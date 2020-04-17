Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C45C51AE3B3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 19:21:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493jYd6sgpzDrgv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Apr 2020 03:21:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=vbabka@suse.cz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.cz
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493jWF6vj7zDrgS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Apr 2020 03:19:21 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 19711AE0D;
 Fri, 17 Apr 2020 17:19:18 +0000 (UTC)
Subject: Re: ppc64 early slub caches have zero random value
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org
References: <20200417165304.GF25468@kitsune.suse.cz>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <8c93960b-587e-a576-91b8-666f106f8b60@suse.cz>
Date: Fri, 17 Apr 2020 19:19:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200417165304.GF25468@kitsune.suse.cz>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/17/20 6:53 PM, Michal Suchánek wrote:
> Hello,

Hi, thanks for reproducing on latest upstream!

> instrumenting the kernel with the following patch
> 
> ---
>  mm/slub.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index d6787bbe0248..d40995d5f8ff 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -3633,6 +3633,7 @@ static int kmem_cache_open(struct kmem_cache *s, slab_flags_t flags)
>  	s->flags = kmem_cache_flags(s->size, flags, s->name, s->ctor);
>  #ifdef CONFIG_SLAB_FREELIST_HARDENED
>  	s->random = get_random_long();
> +	pr_notice("Creating cache %s with s->random=%ld\n", s->name, s->random);
>  #endif
>  
>  	if (!calculate_sizes(s, -1))
> 
> I get:
> 
> [    0.000000] random: get_random_u64 called from kmem_cache_open+0x3c/0x5b0
with crng_init=0
> [    0.000000] Creating cache kmem_cache_node with s->random=0
> [    0.000000] Creating cache kmem_cache with s->random=0
> [    0.000000] Creating cache kmalloc-8 with s->random=0
> [    0.000000] Creating cache kmalloc-16 with s->random=0
> [    0.000000] Creating cache kmalloc-32 with s->random=0
> [    0.000000] Creating cache kmalloc-64 with s->random=0
> [    0.000000] Creating cache kmalloc-96 with s->random=0
> [    0.000000] Creating cache kmalloc-128 with s->random=0
> [    0.000000] Creating cache kmalloc-192 with s->random=-682532147323126958
> 
> The earliest caches created invariably end up with s->random of zero.

It seems that reliably it's the first 8 calls get_random_u64(), which sounds
more like some off-by-X bug than a genuine lack entropy that would become fixed
in the meanwhile?

> This is a problem for crash which does not recognize these as randomized
> and fails to read them. While this can be addressed in crash is it
> intended to create caches with zero random value in the kernel?

Definitely not. The question is more likely what guarantees we have with
crng_init=0. Probably we can't expect cryptographically strong randomness, but
zeroes still do look like a bug to me?

> This is broken at least in the 5.4~5.7 range but it is not clear if this
> ever worked. All examples of earlier kernels I have at hand use slab mm.
> 
> Thanks
> 
> Michal
> 

