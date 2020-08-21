Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D6124D91D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 17:54:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BY5fy62CwzDrFH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Aug 2020 01:54:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=eric.dumazet@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Mqf3QLSj; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BY5Jy6QCnzDqKh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Aug 2020 01:38:35 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id z23so1033824plo.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 08:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kco/6vI1blM/NwfzBHIDs3oyI1qAQDpBfmbjozxRSNk=;
 b=Mqf3QLSjkioKMk0zBDuIglw6zdeZUKHZ1HQUwduW7GDONUqZycokbVPPLpKEOpQl4b
 PDAb2rY3stSYZvKhK1ciDdXI9QFuSd5868ZADYj2vkdJQuduZNKyrfw/bl/VOhAJoTHE
 5SQ3KeiX1D57s96SJHQo5n9Kx3TDPfJxYN6T73LU2hqZcH37Y2pQK8ncVnOIHTCw+dH9
 JH5LBDlhrptca3/0S5Ff7Fwp+Av93sdvs2f7yyKFqjraHST6wJ+2aZBaDb4HvmRbJ8cZ
 Ev10EsauM4bU6+fZB47gY9myTYHuYjfP5cXd8jqrKQ0astUglqR98D7equtA387ONVto
 1OLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kco/6vI1blM/NwfzBHIDs3oyI1qAQDpBfmbjozxRSNk=;
 b=jaiB2HM1LASFDaBOfnk7D6+bzBtp+RWSLuGjFKeBv37jtErT7v+bvqrd7hEbOi+W3v
 0lRdKZQ4C/Yw641l9ITKBGp7ETsJG4uG6VPaxEffCzB606+JrOOl+tA3ewVfj1fn1nZg
 5Yhi3739NF9IgvdEh1cgFflMQtonFdv9nLXuABfWhTVEtD/X94KfXBtYNILfpEM4ju5i
 IV/5hMiIDrmhUUlD1d+eISv799x3UtnLYMbFNp41QoGLnpKuP5NPuK2kKVMJhVuK2MIv
 Yz2mCzALaw1xzAgPHrMwbsSsdL0m3nfgnque0U274RYQaTN0+QUzJnscDzhWQQ/7GzsT
 8ETw==
X-Gm-Message-State: AOAM531Ni/oUOO5Yf5rvsOIfJxr2e+vN/MuFRvKqn774jctbFlGPzkIU
 A499+orlhimkU4O5ZCJ7rTighJjxEOA=
X-Google-Smtp-Source: ABdhPJwru3LiGVN0/RGun5gHVd79iZu23NuOL+aXtjWUQONE0O/idm7t/GaI88fUhyFkLtAmK/d3Rw==
X-Received: by 2002:a17:90a:ba05:: with SMTP id
 s5mr1612246pjr.114.1598024313966; 
 Fri, 21 Aug 2020 08:38:33 -0700 (PDT)
Received: from [10.1.10.11] (c-73-241-150-58.hsd1.ca.comcast.net.
 [73.241.150.58])
 by smtp.gmail.com with ESMTPSA id q207sm2581667pgq.71.2020.08.21.08.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2020 08:38:33 -0700 (PDT)
Subject: Re: [PATCH v6 11/12] mm/vmalloc: Hugepage vmalloc mappings
To: Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
References: <20200821151216.1005117-1-npiggin@gmail.com>
 <20200821151216.1005117-12-npiggin@gmail.com>
From: Eric Dumazet <eric.dumazet@gmail.com>
Message-ID: <1e001c2c-6c47-21a9-e920-caf78933b713@gmail.com>
Date: Fri, 21 Aug 2020 08:38:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200821151216.1005117-12-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Zefan Li <lizefan@huawei.com>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 8/21/20 8:12 AM, Nicholas Piggin wrote:
> Support huge page vmalloc mappings. Config option HAVE_ARCH_HUGE_VMALLOC
> enables support on architectures that define HAVE_ARCH_HUGE_VMAP and
> supports PMD sized vmap mappings.
> 
> vmalloc will attempt to allocate PMD-sized pages if allocating PMD size or
> larger, and fall back to small pages if that was unsuccessful.
> 
> Allocations that do not use PAGE_KERNEL prot are not permitted to use huge
> pages, because not all callers expect this (e.g., module allocations vs
> strict module rwx).
> 
> This reduces TLB misses by nearly 30x on a `git diff` workload on a 2-node
> POWER9 (59,800 -> 2,100) and reduces CPU cycles by 0.54%.
> 
> This can result in more internal fragmentation and memory overhead for a
> given allocation, an option nohugevmalloc is added to disable at boot.
> 
>

Thanks for working on this stuff, I tried something similar in the past,
but could not really do more than a hack.
( https://lkml.org/lkml/2016/12/21/285 )

Note that __init alloc_large_system_hash() is used at boot time,
when NUMA policy is spreading allocations over all NUMA nodes.

This means that on a dual node system, a hash table should be 50/50 spread.

With your patch, if a hashtable is exactly the size of one huge page,
the location of this hashtable will be not balanced, this might have some
unwanted impact.

Thanks !

