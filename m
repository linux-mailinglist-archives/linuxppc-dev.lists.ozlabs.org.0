Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D7C24D962
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 18:07:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BY5yB6lc3zDrFF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Aug 2020 02:07:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TQeLM2ab; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BY5w95FmtzDqmh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Aug 2020 02:05:44 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id x25so1285567pff.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 09:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=wapcx/5Vbh5G639AQDnOiyGrJZXaNQ8MTw86eBzSth4=;
 b=TQeLM2abya+0luxj7HKY8kjrGpvsQOQb7hLsKu7wcSQ53pUVeHHBqDWbwhLpWqyCQo
 2Hcyhj+QSe126y2yZWjYu2bxy+OXc6TG6xZd4dPFlk2d06V05bkGqBXUjQz1zcyJk/DP
 651R54ipy9IstrkDRDpsqxm6PXlTD+1LxtS4CCEqaBQ4XR3ePQUtfIaDtR9UIJr8Do3A
 exbBJDmjDT4lfc5HjXehWx2SApo9psgKlC78TsTh7KBv81soMzOKrKf3ikGKmc6msDAl
 h+gYub/StWGMQSLC4a0Gdg+P6AW3PZrBA9uOaFSLhFSL/QEEZvclEg4V3SZiTawYiy2B
 AC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=wapcx/5Vbh5G639AQDnOiyGrJZXaNQ8MTw86eBzSth4=;
 b=hajOimYhOpG9LdR8gl/I4HZtzLVz+k2FJ9XQQ0mQVtwoyUBQgNEBGImgSYlCFKB+ee
 H7VMfzh6UpInsYGnLj8fsjaryUw5IBOfjeRXYzlhpD3dj5yDjfejj+ERaCuzg5CGKxyT
 2BNhc0sBrPAxuYJ60NOd5wY1JSuzmfU52u3g5O5zkkuPtKkGfdBeaxT8ihd9/t7hA1eP
 B/xqTNYWtZEXi5/jeLb/ceAdzsX+samtnM+njwYpai47cEIbaToddQsBRIXXZxdRjWUz
 omjRk75p5vFQuOMxZ3CdzMsqPWzIzX3NMFFDHFT3HXGG7S0XfYxUUvoEsDIp/mano1hk
 hfXg==
X-Gm-Message-State: AOAM530SP9xJKN+Bu3H0AqOcW3baoCpIaqvV+uBnZ0B/WTCIleptlQ29
 5H1WT7N2fX/r6j1Yd+JzJoDWkIEFvxI=
X-Google-Smtp-Source: ABdhPJx/NdttpYzCAL4MKwJ9Rj5q/al1KK3HvjwJptRJw92UrEyk3IkxiX8LfzHQNcRQgmFKRKonmw==
X-Received: by 2002:a63:5c8:: with SMTP id 191mr2708428pgf.244.1598025942564; 
 Fri, 21 Aug 2020 09:05:42 -0700 (PDT)
Received: from localhost (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id e26sm2920498pfj.197.2020.08.21.09.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 09:05:42 -0700 (PDT)
Date: Sat, 22 Aug 2020 02:05:35 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 11/12] mm/vmalloc: Hugepage vmalloc mappings
To: Andrew Morton <akpm@linux-foundation.org>, Eric Dumazet
 <eric.dumazet@gmail.com>, linux-mm@kvack.org
References: <20200821151216.1005117-1-npiggin@gmail.com>
 <20200821151216.1005117-12-npiggin@gmail.com>
 <1e001c2c-6c47-21a9-e920-caf78933b713@gmail.com>
In-Reply-To: <1e001c2c-6c47-21a9-e920-caf78933b713@gmail.com>
MIME-Version: 1.0
Message-Id: <1598025275.jd6s9py77x.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Excerpts from Eric Dumazet's message of August 22, 2020 1:38 am:
>=20
> On 8/21/20 8:12 AM, Nicholas Piggin wrote:
>> Support huge page vmalloc mappings. Config option HAVE_ARCH_HUGE_VMALLOC
>> enables support on architectures that define HAVE_ARCH_HUGE_VMAP and
>> supports PMD sized vmap mappings.
>>=20
>> vmalloc will attempt to allocate PMD-sized pages if allocating PMD size =
or
>> larger, and fall back to small pages if that was unsuccessful.
>>=20
>> Allocations that do not use PAGE_KERNEL prot are not permitted to use hu=
ge
>> pages, because not all callers expect this (e.g., module allocations vs
>> strict module rwx).
>>=20
>> This reduces TLB misses by nearly 30x on a `git diff` workload on a 2-no=
de
>> POWER9 (59,800 -> 2,100) and reduces CPU cycles by 0.54%.
>>=20
>> This can result in more internal fragmentation and memory overhead for a
>> given allocation, an option nohugevmalloc is added to disable at boot.
>>=20
>>
>=20
> Thanks for working on this stuff, I tried something similar in the past,
> but could not really do more than a hack.
> ( https://lkml.org/lkml/2016/12/21/285 )

Oh nice. It might be possible to do some ideas from your patch
still. Higher order pages smaller than PMD size, or the memory
policy stuff, perhaps.

> Note that __init alloc_large_system_hash() is used at boot time,
> when NUMA policy is spreading allocations over all NUMA nodes.
>=20
> This means that on a dual node system, a hash table should be 50/50 sprea=
d.
>=20
> With your patch, if a hashtable is exactly the size of one huge page,
> the location of this hashtable will be not balanced, this might have some
> unwanted impact.

In that case it shouldn't because it divides by the number of nodes,
but it will in general have a bit larger granularity in balancing than
smaller pages of course.

There's probably a better way to size these important hashes on NUMA. I
suspect most of the time you have a NUMA machine you actually would
prefer to use large pages now, even if it means taking up to 2MB more
memory per node per hash. It's not a great amount and the allocation=20
size is rather arbitrary anyway.

Thanks,
Nick
