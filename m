Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6AD2CA8D2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 17:55:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClpB95ty2zDqhl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 03:55:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Clp7z6qpKzDqVb
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 03:53:18 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Clp7s63DZz9v400;
 Tue,  1 Dec 2020 17:53:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id wq3KDCIGPUsp; Tue,  1 Dec 2020 17:53:13 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Clp7s52ZQz9v3yy;
 Tue,  1 Dec 2020 17:53:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 161398B7BD;
 Tue,  1 Dec 2020 17:53:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7Dn2a6jQZQ1y; Tue,  1 Dec 2020 17:53:14 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A77558B7B7;
 Tue,  1 Dec 2020 17:53:08 +0100 (CET)
Subject: Re: [PATCH v9 2/6] kasan: allow architectures to provide an outline
 readiness check
To: Daniel Axtens <dja@axtens.net>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 kasan-dev@googlegroups.com, christophe.leroy@c-s.fr,
 aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
References: <20201201161632.1234753-1-dja@axtens.net>
 <20201201161632.1234753-3-dja@axtens.net>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <bc92b30f-f087-ced6-cf00-a62370eae733@csgroup.eu>
Date: Tue, 1 Dec 2020 17:53:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201201161632.1234753-3-dja@axtens.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/12/2020 à 17:16, Daniel Axtens a écrit :
> Allow architectures to define a kasan_arch_is_ready() hook that bails
> out of any function that's about to touch the shadow unless the arch
> says that it is ready for the memory to be accessed. This is fairly
> uninvasive and should have a negligible performance penalty.
> 
> This will only work in outline mode, so an arch must specify
> HAVE_ARCH_NO_KASAN_INLINE if it requires this.
> 
> Cc: Balbir Singh <bsingharora@gmail.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Did I signed that off one day ? I can't remember.

Please update my email address, and maybe change it to a Suggested-by: ? I think the first 
Signed-off-by: has to be the author of the patch.

> Signed-off-by: Daniel Axtens <dja@axtens.net>
> 
> --
> 
> I discuss the justfication for this later in the series. Also,
> both previous RFCs for ppc64 - by 2 different people - have
> needed this trick! See:
>   - https://lore.kernel.org/patchwork/patch/592820/ # ppc64 hash series
>   - https://patchwork.ozlabs.org/patch/795211/      # ppc radix series
> ---
>   include/linux/kasan.h |  4 ++++
>   mm/kasan/common.c     | 10 ++++++++++
>   mm/kasan/generic.c    |  3 +++
>   3 files changed, 17 insertions(+)
> 
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index 30d343b4a40a..3df66fdf6662 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -20,6 +20,10 @@ struct kunit_kasan_expectation {
>   	bool report_found;
>   };
>   
> +#ifndef kasan_arch_is_ready
> +static inline bool kasan_arch_is_ready(void)	{ return true; }
> +#endif
> +
>   extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
>   extern pte_t kasan_early_shadow_pte[PTRS_PER_PTE];
>   extern pmd_t kasan_early_shadow_pmd[PTRS_PER_PMD];
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index 950fd372a07e..ba7744d3e319 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -117,6 +117,9 @@ void kasan_poison_shadow(const void *address, size_t size, u8 value)
>   {
>   	void *shadow_start, *shadow_end;
>   
> +	if (!kasan_arch_is_ready())
> +		return;
> +
>   	/*
>   	 * Perform shadow offset calculation based on untagged address, as
>   	 * some of the callers (e.g. kasan_poison_object_data) pass tagged
> @@ -134,6 +137,9 @@ void kasan_unpoison_shadow(const void *address, size_t size)
>   {
>   	u8 tag = get_tag(address);
>   
> +	if (!kasan_arch_is_ready())
> +		return;
> +
>   	/*
>   	 * Perform shadow offset calculation based on untagged address, as
>   	 * some of the callers (e.g. kasan_unpoison_object_data) pass tagged
> @@ -406,6 +412,10 @@ static bool __kasan_slab_free(struct kmem_cache *cache, void *object,
>   	if (unlikely(cache->flags & SLAB_TYPESAFE_BY_RCU))
>   		return false;
>   
> +	/* We can't read the shadow byte if the arch isn't ready */
> +	if (!kasan_arch_is_ready())
> +		return false;
> +
>   	shadow_byte = READ_ONCE(*(s8 *)kasan_mem_to_shadow(object));
>   	if (shadow_invalid(tag, shadow_byte)) {
>   		kasan_report_invalid_free(tagged_object, ip);
> diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
> index 248264b9cb76..e87404026b2b 100644
> --- a/mm/kasan/generic.c
> +++ b/mm/kasan/generic.c
> @@ -169,6 +169,9 @@ static __always_inline bool check_memory_region_inline(unsigned long addr,
>   						size_t size, bool write,
>   						unsigned long ret_ip)
>   {
> +	if (!kasan_arch_is_ready())
> +		return true;
> +
>   	if (unlikely(size == 0))
>   		return true;
>   
> 
