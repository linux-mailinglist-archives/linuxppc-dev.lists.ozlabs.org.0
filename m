Return-Path: <linuxppc-dev+bounces-8924-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A390AC2F53
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 May 2025 13:19:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b4KL22FZZz2ySN;
	Sat, 24 May 2025 21:19:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748085562;
	cv=none; b=JOIWX7PmVorohxfh8jqfq5u9fRXKOvFitR4pAPdjaqWWtE3UjWamL7D/rqehy1w+oAubU70YvCvaXevj9r+4IpTY9zSFm4CqhvmhTyLkFWalts8GoJeqk6UffeNPXYcQPAhw7klS8FGd6faCoJjwRYs6PAS09jOFo3V9rFHN18lKR75rQIZFn+4CW0d2MwC6Jjibd3fsdNk3/kUmIRqwV7YkJ4D3JeDxFuV+z8QWaY70vVAahWMefzYNuyikzgELoy6bpbND9SYV2f/BLT5K/OdfdOvF0NymO5l0c+GupTzvqC0CeZGhNMW8UvNWbq0NsGVSGUnOx272sBW6jWg++g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748085562; c=relaxed/relaxed;
	bh=rScpXVbASUqjAgnv8asCUXuGu69m7xK2h2FjiRqoUxs=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=X3uwhS6TE4BtrqmJZFWIKlbhkDLRAXlKXuWC1JpxJBEqsMdDqlWpPHRV12IzY4PT5GsM/iogpgw12hE1w01O7L2EMF77/izz2ftMIRWSXhqv8BLzhVyDvPQ7Z+7SP05JonD0hAy5uO9UP6GnFkXFBps2cYba9/sso+PmXXc6/SrYAE1qCeCuIWMxiY1IM1b1tfgYcnTh63nZwy3xSkCAGzuqerCZls3l12iAL6yYpPNs6Du3ys8yvpLYMr38bqEdohgpzV6SFdx4fPwXwoC0RiVqmE4ygLJRx1AyqmfYZxKFbXDQ6dm9/uB3Okp0nvWLy6dGhjce3j/9dmMHl51Z5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Zs9OmZiu; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Zs9OmZiu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b4KL0479jz2yS6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 May 2025 21:19:19 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7399838db7fso605977b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 May 2025 04:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748085556; x=1748690356; darn=lists.ozlabs.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rScpXVbASUqjAgnv8asCUXuGu69m7xK2h2FjiRqoUxs=;
        b=Zs9OmZiuUbqxD2v6AWgINAL4ccVJJkmgHmFaqdYxdnf7/HB/QEk5YASS30zcI77WUr
         C1xQ0JBCIQRH3rnyViLknubcq0JwVjsqId1KUK/oUvIi1diTgRBJlcCzACSdnSdrwzKU
         YZX3S28PoM560T8JADD0wsgSV7RRAH8LGPnYYzdTTMRviZ7otZR4C8kzEWMRWwo0iYBA
         ivQ0KntTkoTHleeilFIO79/D4Tr0zITW9jaVaAOJAH+hz24TdTQOiTqYpmviRp4G6euW
         snPQg7wnHbnvZg1U/0jA9bQyNrA2Auu7L9xON7ckgV3HtHhzNzFW8JhbsEo8ypRV+x/Y
         M2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748085556; x=1748690356;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rScpXVbASUqjAgnv8asCUXuGu69m7xK2h2FjiRqoUxs=;
        b=EDCyYcwsCNPvpMD3adbBzZYqh2QlK6qHqEt2lA7ojjeIHDAqeaqaD94+1SnJ/DxG0N
         Trzl170qZrlS7c+YYjVzWdt7czp0QVmC73OIJtAFaUhf+mnYhCRqR/lZB4MdP2ljqYOV
         0d4blDGA5eLP0ePdQLbAOEMiDAn7veGo/nZTqtsaAxp3o6loJ++8mGsBLR+6EeqSdxTR
         4LkRIQpGVk/wOF0uzajJaVQtHB6TjLZxb6zdnvxgs10gNlzCOKO828wLpex8pHYJ27xC
         Pvx4s6NhwiwSsG6uLXhwDG5p2UGTYkw/RXYr+ywK24QZM8JzgHawjtbAacnaDdm5hPDV
         GVZA==
X-Forwarded-Encrypted: i=1; AJvYcCVLE7NsBSk0keYDHR0+o/xTSRHFSfVExFYL+SFKoLn9EIfMiVjA2tn81CLL7K/oARqZHSENyXt2zjF9eLs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzmlQfwpzl5fnch9s1aSPVLl5FPY2i6r2Fw2n6v3li8wP4YEZte
	uauU9dHhrz047UfCE5YgE06zbbJ93Wbk+KfuKjHfR3+4brH3OBy6IIx+
X-Gm-Gg: ASbGncsaF4IJii2GgPoA+hponzDZtHV+Z3RlRygjXl5j5nzsztdGWcrM0RtArnqqG6t
	bWB4GL9kuWwWAH5/YA+3A6dCHzKQQvLVTKw5Kta6EeS6YwAJ1/0aorD06KncAYlQKrniRvmcUAU
	POv2C2qVgYMyl2iDdLQ7yWCH6OHXKNREWXkR3mMjZSh1huwuTRkifRPUghaCnxsGOuuU6HJDWsr
	AYKBkLkNiVyebPfYHLOeVOPlhR57T3c8WlPtQVqhz7tgYIiJ0xqgksEofadZ6whiqgqX8LTbeKy
	xLmd49xE6AmQhIvlCthWg+rfKLvUfpreJ24/OZhY8DzK4Qy4R9fQlUQ=
X-Google-Smtp-Source: AGHT+IHzgyF4RMk4/VcB/ult2huesDrd3BktU05/6T5tjhGyNb1hL3EGlpy4BVyGxnMoNfwEQoYJDQ==
X-Received: by 2002:a05:6a00:1903:b0:73e:2367:c914 with SMTP id d2e1a72fcca58-745fe068d61mr3795551b3a.7.1748085556260;
        Sat, 24 May 2025 04:19:16 -0700 (PDT)
Received: from dw-tp ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96dfacesm14024380b3a.5.2025.05.24.04.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 04:19:15 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <kees@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linuxppc-dev@lists.ozlabs.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 08/14] powerpc: Handle KCOV __init vs inline mismatches
In-Reply-To: <20250523043935.2009972-8-kees@kernel.org>
Date: Sat, 24 May 2025 16:13:02 +0530
Message-ID: <87jz662ssp.fsf@gmail.com>
References: <20250523043251.it.550-kees@kernel.org> <20250523043935.2009972-8-kees@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Kees Cook <kees@kernel.org> writes:

> When KCOV is enabled all functions get instrumented, unless
> the __no_sanitize_coverage attribute is used. To prepare for
> __no_sanitize_coverage being applied to __init functions, we have to
> handle differences in how GCC's inline optimizations get resolved. For
> s390 this requires forcing a couple functions to be inline with
> __always_inline.
>
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Naveen N Rao <naveen@kernel.org>
> Cc: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: <linuxppc-dev@lists.ozlabs.org>
> ---
>  arch/powerpc/mm/book3s64/hash_utils.c    | 2 +-
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index 5158aefe4873..93f1e1eb5ea6 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -409,7 +409,7 @@ static DEFINE_RAW_SPINLOCK(linear_map_kf_hash_lock);
>  
>  static phys_addr_t kfence_pool;
>  
> -static inline void hash_kfence_alloc_pool(void)
> +static __always_inline void hash_kfence_alloc_pool(void)
>  {
>  	if (!kfence_early_init_enabled())
>  		goto err;
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 9f764bc42b8c..3238e9ed46b5 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -363,7 +363,7 @@ static int __meminit create_physical_mapping(unsigned long start,
>  }
>  
>  #ifdef CONFIG_KFENCE
> -static inline phys_addr_t alloc_kfence_pool(void)
> +static __always_inline phys_addr_t alloc_kfence_pool(void)
>  {
>  	phys_addr_t kfence_pool;
>  

I remember seeing a warning msg around .init.text section. Let me dig
that...

... Here it is: https://lore.kernel.org/oe-kbuild-all/202504190552.mnFGs5sj-lkp@intel.com/

I am not sure why it only complains for hash_debug_pagealloc_alloc_slots().
I believe there should me more functions to mark with __init here.
Anyways, here is the patch of what I had in mind.. I am not a compiler expert,
so please let me know your thoughts on this.

-ritesh


From 59d64dc0014ccb4ae13ed08ab596738628ee23b1 Mon Sep 17 00:00:00 2001
Message-Id: <59d64dc0014ccb4ae13ed08ab596738628ee23b1.1748084756.git.ritesh.list@gmail.com>
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Date: Sat, 24 May 2025 16:14:08 +0530
Subject: [RFC] powerpc/mm/book3s64: Move few kfence & debug_pagealloc
 related calls to __init section

Move few kfence and debug_pagealloc related functions in hash_utils.c
and radix_pgtable.c to __init sections since these are only invoked once
by an __init function during system initialization.

i.e.
- hash_debug_pagealloc_alloc_slots()
- hash_kfence_alloc_pool()
- hash_kfence_map_pool()
  The above 3 functions only gets called by __init htab_initialize().

- alloc_kfence_pool()
- map_kfence_pool()
  The above 2 functions only gets called by __init radix_init_pgtable()

This should also help fix warning msgs like:

>> WARNING: modpost: vmlinux: section mismatch in reference:
hash_debug_pagealloc_alloc_slots+0xb0 (section: .text) ->
memblock_alloc_try_nid (section: .init.text)

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504190552.mnFGs5sj-lkp@intel.com/
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c    | 6 +++---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 5158aefe4873..4693c464fc5a 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -343,7 +343,7 @@ static inline bool hash_supports_debug_pagealloc(void)
 static u8 *linear_map_hash_slots;
 static unsigned long linear_map_hash_count;
 static DEFINE_RAW_SPINLOCK(linear_map_hash_lock);
-static void hash_debug_pagealloc_alloc_slots(void)
+static __init void hash_debug_pagealloc_alloc_slots(void)
 {
 	if (!hash_supports_debug_pagealloc())
 		return;
@@ -409,7 +409,7 @@ static DEFINE_RAW_SPINLOCK(linear_map_kf_hash_lock);
 
 static phys_addr_t kfence_pool;
 
-static inline void hash_kfence_alloc_pool(void)
+static __init void hash_kfence_alloc_pool(void)
 {
 	if (!kfence_early_init_enabled())
 		goto err;
@@ -445,7 +445,7 @@ static inline void hash_kfence_alloc_pool(void)
 	disable_kfence();
 }
 
-static inline void hash_kfence_map_pool(void)
+static __init void hash_kfence_map_pool(void)
 {
 	unsigned long kfence_pool_start, kfence_pool_end;
 	unsigned long prot = pgprot_val(PAGE_KERNEL);
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 311e2112d782..ed226ee1569a 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -363,7 +363,7 @@ static int __meminit create_physical_mapping(unsigned long start,
 }
 
 #ifdef CONFIG_KFENCE
-static inline phys_addr_t alloc_kfence_pool(void)
+static __init phys_addr_t alloc_kfence_pool(void)
 {
 	phys_addr_t kfence_pool;
 
@@ -393,7 +393,7 @@ static inline phys_addr_t alloc_kfence_pool(void)
 	return 0;
 }
 
-static inline void map_kfence_pool(phys_addr_t kfence_pool)
+static __init void map_kfence_pool(phys_addr_t kfence_pool)
 {
 	if (!kfence_pool)
 		return;
-- 
2.39.5


