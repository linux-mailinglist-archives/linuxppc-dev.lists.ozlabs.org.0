Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D56E8D16
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 17:45:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472crv15b0zF39h
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 03:45:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=virtuozzo.com (client-ip=185.231.240.75; helo=relay.sw.ru;
 envelope-from=aryabinin@virtuozzo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=virtuozzo.com
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472cpn2yVxzF381
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 03:43:26 +1100 (AEDT)
Received: from [172.16.25.5] by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <aryabinin@virtuozzo.com>)
 id 1iPUaS-0006WW-BR; Tue, 29 Oct 2019 19:43:16 +0300
Subject: Re: [PATCH v10 1/5] kasan: support backing vmalloc space with real
 shadow memory
To: Daniel Axtens <dja@axtens.net>, kasan-dev@googlegroups.com,
 linux-mm@kvack.org, x86@kernel.org, glider@google.com, luto@kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, dvyukov@google.com,
 christophe.leroy@c-s.fr
References: <20191029042059.28541-1-dja@axtens.net>
 <20191029042059.28541-2-dja@axtens.net>
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Message-ID: <f847fc8c-f875-8d93-9d49-8f03d4c6303a@virtuozzo.com>
Date: Tue, 29 Oct 2019 19:42:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191029042059.28541-2-dja@axtens.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 gor@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/29/19 7:20 AM, Daniel Axtens wrote:
> Hook into vmalloc and vmap, and dynamically allocate real shadow
> memory to back the mappings.
> 
> Most mappings in vmalloc space are small, requiring less than a full
> page of shadow space. Allocating a full shadow page per mapping would
> therefore be wasteful. Furthermore, to ensure that different mappings
> use different shadow pages, mappings would have to be aligned to
> KASAN_SHADOW_SCALE_SIZE * PAGE_SIZE.
> 
> Instead, share backing space across multiple mappings. Allocate a
> backing page when a mapping in vmalloc space uses a particular page of
> the shadow region. This page can be shared by other vmalloc mappings
> later on.
> 
> We hook in to the vmap infrastructure to lazily clean up unused shadow
> memory.
> 
> To avoid the difficulties around swapping mappings around, this code
> expects that the part of the shadow region that covers the vmalloc
> space will not be covered by the early shadow page, but will be left
> unmapped. This will require changes in arch-specific code.
> 
> This allows KASAN with VMAP_STACK, and may be helpful for architectures
> that do not have a separate module space (e.g. powerpc64, which I am
> currently working on). It also allows relaxing the module alignment
> back to PAGE_SIZE.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=202009
> Acked-by: Vasily Gorbik <gor@linux.ibm.com>
> Co-developed-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Mark Rutland <mark.rutland@arm.com> [shadow rework]
> Signed-off-by: Daniel Axtens <dja@axtens.net>


Small nit bellow, otherwise looks fine:

Reviewed-by: Andrey Ryabinin <aryabinin@virtuozzo.com>



>  static __always_inline bool
> @@ -1196,8 +1201,8 @@ static void free_vmap_area(struct vmap_area *va)
>  	 * Insert/Merge it back to the free tree/list.
>  	 */
>  	spin_lock(&free_vmap_area_lock);
> -	merge_or_add_vmap_area(va,
> -		&free_vmap_area_root, &free_vmap_area_list);
> +	(void)merge_or_add_vmap_area(va, &free_vmap_area_root,
> +				     &free_vmap_area_list);
>  	spin_unlock(&free_vmap_area_lock);
>  }
>  
..
>  
> @@ -3391,8 +3428,8 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
>  	 * and when pcpu_get_vm_areas() is success.
>  	 */
>  	while (area--) {
> -		merge_or_add_vmap_area(vas[area],
> -			&free_vmap_area_root, &free_vmap_area_list);
> +		(void)merge_or_add_vmap_area(vas[area], &free_vmap_area_root,

I don't think these (void) casts are necessary.

> +					     &free_vmap_area_list);
>  		vas[area] = NULL;
>  	}
>  
> 
