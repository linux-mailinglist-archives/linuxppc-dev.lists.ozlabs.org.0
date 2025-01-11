Return-Path: <linuxppc-dev+bounces-5082-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B163A0A4F4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 18:11:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVlRM4LKmz3c9l;
	Sun, 12 Jan 2025 04:11:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736615471;
	cv=none; b=Yzn4/6eR8YHluEfPwY+TeYP77jgg/7llqvKxADVf92Qf0jexaRlCrD9g+YxNAjxR1SLIVYr3bPSp5tRYSJoR3CJ6fErq8cdscdmeAiFsWmeTDvgg43A0lNsnySo76M2VZf/kKsrksKujx1vIDEDuW1RfJTq/38+WBjgK9O41REMuDMEcO/nEJJbRxCGAKRUhB9hX1XqHWN/nF4V1OYwBJY7/Gnp7cu+qT8JT5EQW+M41RBVkXX9SSxxyKB6blT+xFnhqkgpk/TI1HqwcsIZyfsLEJtk6oTZenOk8FRWCjA4G0GYjqFU8ZtrW+23AnqQtrd2wBAYTr/tpbc72Y/Wq0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736615471; c=relaxed/relaxed;
	bh=oiDIac9UCgslMdyoZCP/7jQnvyDk7prCS5jJXe0SP8M=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=cTw7t6zc1jyl8C5+Pkht/isGj6r23eG+94IshZk1mMhjoctoKDXtjD9B/ODM1mZ+AIJ0Fjqrh2dd3pvugDi8tawDx2teZFisRH/WBu3WI+eBTFPmKboFtG6xFWriIuC/uR4t+1kDHDSE8hWQhZ0nozKCbcOzUIfP6xLZWIEIlzP79neF6NCliDtP2ZsVJxUBNeTvqLzwoaQxLG77QC/QrzSoLGC9OATekRsFd15kA7xquapnECrQW5NYlDXVnQEssodYP5cSueNsNL9xronzXkO3xk70dksdOKCgzDQ76UL7jTEQ+btl05c7EB4tBLjPVRvzP+QfiX5MlNkLD1v+XA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZPzo6BKp; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZPzo6BKp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVlRG1Zgjz3c9g
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jan 2025 04:11:04 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21644aca3a0so65446615ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 09:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736615457; x=1737220257; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oiDIac9UCgslMdyoZCP/7jQnvyDk7prCS5jJXe0SP8M=;
        b=ZPzo6BKpMOUGriRvmN6WNID82MepA32bdzFSz8pVYLboYBeB/w8M0VLIUes1gzAjHL
         7Q5tfOFmwN87njOAGVI0gj58AHaUVfc9XZQHj+9arh5O/2dAqwknjKzXGh3h4xEYfURI
         VUD/tLlxW72MyQiaftWEHtwGXXt4Va6w/JSlQ8FRJc3YQVH3RqpuDPcsjaafigBwzbAg
         BL1UDTpBZVFYXlPhzrSXuMZRwAIPVjnSLezuAU8dQRTsQHJsbkO1ymo+5FHVs4yXG/Sf
         kqxNu9goQYZjxAJpzTVubah0woGZheS61IGWBtWhoyPt3PIKguLWg7vwSBLcP5kxcZrj
         Xtew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736615457; x=1737220257;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oiDIac9UCgslMdyoZCP/7jQnvyDk7prCS5jJXe0SP8M=;
        b=i/PFzTGZRhAZhQ+0WpZOqGfoEtllCV6Gyw7y4HUylTxzMFN+jGjOLawJeboEoXQecS
         QJ6a9HygKRMmXwBetRMNmLS7FJgyW7Zvjt3QiafJzPl71NI6glcvi/u2wG1c2JsMCMKR
         mOEgYZ6NuaV7X2FfjAUqIwzXY/fn65xdLkdVHkBUoZmW+ocgH33NsRHEoQ2Nn/H8LN+X
         sBw9Tw1h/2Qz31OjxzZzpZFI+9WkqbaQANHa8SO2WBsdOaxvPVA6MiFC/6nqej2WT5Ki
         /3ZskVommU3LTd4swVwuh7AP+VA+yBjhmuiHEGqhxzBGR18FYQhb4RTMGF7EymBKgwKG
         iO/w==
X-Forwarded-Encrypted: i=1; AJvYcCXIOx525KYP8y3ztRHh4OzVa8Ll7lA0XO8aUzvQNmVe6fY8rvgCK1IYmGuRVe5urCO1o0fzJySohxExGk8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxbgc7IiycIvwe043k0ju3JxnndwoomiAUx5I5ukosf9qiTIBNY
	V1ZXxEh41uZC7gxZCSqMVDCrlKySxdm/vfVSJmeNybVRRqYxVEPA
X-Gm-Gg: ASbGncv8+TkKddli8BynP8nB+j7x8qozAeNruyKuf52i3IO4TZKv+Aiit9LQLc4R7B2
	BZup0J5SreKB78pTLUtHORAgwfh8Atjb7sZyLPPzVd6CY7q9cCAuUr3pGsIw4NzXIvN9BdpDWEF
	ulq9cMYYT0d1n2/h5XKsEjzW+MtO70k3u67D5NBKdihsstmIsAgNH6KmTq3E04G2ZlKXxIwFfIO
	oVy0ne3IwTcRCytfoSS7QsAiTTtlaJ2e0vE17+4jC7XSbaY
X-Google-Smtp-Source: AGHT+IHQdKqTwbYiK/nAlWC/6KumIvaC+qTQc/SilPBS3OQGqUFXiS/0kAwbi+fQRJYCJkv76bVryg==
X-Received: by 2002:a05:6a20:72a1:b0:1e0:ae58:2945 with SMTP id adf61e73a8af0-1e88d0afc33mr28533903637.31.1736615456851;
        Sat, 11 Jan 2025 09:10:56 -0800 (PST)
Received: from dw-tp ([171.76.81.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4056bc88sm3302165b3a.67.2025.01.11.09.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 09:10:56 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] powerpc/64s: Rewrite __real_pte() as a static inline
In-Reply-To: <06750dbc7bf961e3ea7ef7a89d5c220972465ea5.1736331264.git.christophe.leroy@csgroup.eu>
Date: Sat, 11 Jan 2025 22:33:04 +0530
Message-ID: <87o70duvuf.fsf@gmail.com>
References: <06750dbc7bf961e3ea7ef7a89d5c220972465ea5.1736331264.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Rewrite __real_pte() as a static inline in order to avoid
> following warning/error when building with 4k page size:
>
> 	  CC      arch/powerpc/mm/book3s64/hash_tlb.o
> 	arch/powerpc/mm/book3s64/hash_tlb.c: In function 'hpte_need_flush':
> 	arch/powerpc/mm/book3s64/hash_tlb.c:49:16: error: variable 'offset' set but not used [-Werror=unused-but-set-variable]
> 	   49 |         int i, offset;
> 	      |                ^~~~~~
> 	cc1: all warnings being treated as errors
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501081741.AYFwybsq-lkp@intel.com/

Great. Why not fix the other warning as well which is reported in above
link, which is...  

--
   arch/powerpc/mm/book3s64/hash_native.c: In function 'native_flush_hash_range':
>> arch/powerpc/mm/book3s64/hash_native.c:786:29: warning: variable 'index' set but not used [-Wunused-but-set-variable]
     786 |         unsigned long hash, index, hidx, shift, slot;
--

...similar to how we fixed this warning by making the macro as static
inline? That means something like this (not tested)?

-#define __rpte_to_hidx(r,index)        (pte_val(__rpte_to_pte(r)) >> H_PAGE_F_GIX_SHIFT)
+static inline unsigned long __rpte_to_hidx(real_pte_t r, unsigned long index)
+{
+       return pte_val(__rpte_to_pte(r)) >> H_PAGE_F_GIX_SHIFT;
+}


-ritesh


> Fixes: ff31e105464d ("powerpc/mm/hash64: Store the slot information at the right offset for hugetlb")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/book3s/64/hash-4k.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/hash-4k.h b/arch/powerpc/include/asm/book3s/64/hash-4k.h
> index c3efacab4b94..a7a68ba9c71b 100644
> --- a/arch/powerpc/include/asm/book3s/64/hash-4k.h
> +++ b/arch/powerpc/include/asm/book3s/64/hash-4k.h
> @@ -77,7 +77,10 @@
>  /*
>   * With 4K page size the real_pte machinery is all nops.
>   */
> -#define __real_pte(e, p, o)		((real_pte_t){(e)})
> +static inline real_pte_t __real_pte(pte_t pte, pte_t *ptep, int offset)
> +{
> +	return (real_pte_t){pte};
> +}
>  #define __rpte_to_pte(r)	((r).pte)
>  #define __rpte_to_hidx(r,index)	(pte_val(__rpte_to_pte(r)) >> H_PAGE_F_GIX_SHIFT)
>  
> -- 
> 2.47.0

