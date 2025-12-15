Return-Path: <linuxppc-dev+bounces-14754-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B895FCBC2A7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Dec 2025 01:54:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dV1mN5zhVz2xnl;
	Mon, 15 Dec 2025 11:54:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765760068;
	cv=none; b=bJ5/Cwx5eeOmpFLZCFXH+LmVgzFriyEQ51PpFrTiUP68d8XEKNYcMqsXmoACODk8UAvqBKmvHKiycH599J4aLsjUgQEIPbGTiIOT/beYQencA/wmxIARCHysZETWZerdGnpQZSj+ItOtPiTXojHkqUcGqshHKaSsITvGTE1E2j11gkaRDtuB1yY5bTFHnqLFPgakISdiOPzL7cms0ghtOwqSoTDwMppo2p81czE1CvYIaI/lx+76PIwwobprS4Kd+K1pj39S0SgBxrukHswxnktkdUehqK/7fyEf3IGniaun7diPnlFqqedfIhwWMyfymmmhyOovNvnKRT+ySS6VLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765760068; c=relaxed/relaxed;
	bh=F9g3zA8+/SS364XH9Hr1y/D4AwnbgxagYZf00bypWxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FhuNSgAtWAxApU5oCkkNBCzmhEPZri8cE3NlkoumMoATdgCGQGqqtQjTyIuvXMPFhl0NgjgDo9FSxYFxV59NvVJcO/ITpY9t/gp+Um5S0ZUkK2ZVh+ad2ZoOCCBSBn3bC1NY3JnsKhARgVwJ+Wb4whrbE91bc1QLljSeILL/K7iQXJcUbVyk57k+r0nauNhUnl5uP+u0btO99+BdUoBjqec0GB3vJvSYOojrbUUSsWSAvkWHSZzf4vIKYQ2PuY+q7R49uAlIzDscDA0oS0T/5fzCPfpfjxVyLFJVIDsNJ8aYL+H6X/u5D2a+oEFNCMRNVflRTIE3Zr3I+YaVjIOCLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LodIlE12; dkim-atps=neutral; spf=pass (client-ip=209.85.128.169; helo=mail-yw1-f169.google.com; envelope-from=seakeel@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LodIlE12;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.169; helo=mail-yw1-f169.google.com; envelope-from=seakeel@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dV1mM4pBKz2xRm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Dec 2025 11:54:26 +1100 (AEDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-786a822e73aso26580347b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Dec 2025 16:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765760004; x=1766364804; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F9g3zA8+/SS364XH9Hr1y/D4AwnbgxagYZf00bypWxY=;
        b=LodIlE1292uXeOJhd+1xO/hYn/+TM0ckZsqf2joBV+sQzOvvnhk8GkDHGnIkKVQJbE
         v0aEdgstqOQlKmYGRTyLIdyOpK9+eqvXwmaEMfVnUPhilV1JDKuTgNeHatDVEkszQQyS
         JdXNnksP/OSd0bb/wCXb30Gi5F/IjB3LQnInmSce2DoVpL7DXwY9S+3Vj5ju22cNbo9p
         8ZjjZ4TPC4V7GIjshVKoxKkwXoRAXhC7iQWmIGwVBu1CAOg3tgQn0m6cdTqVy0DgK6OF
         30kq7wERP6+s0E9xVMqHCE7pYpr6GgKZLstSRvarMEFECXhf6+eohnv53vdqAMjtr3vw
         //6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765760004; x=1766364804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F9g3zA8+/SS364XH9Hr1y/D4AwnbgxagYZf00bypWxY=;
        b=qTJCCSyOI2yJIOizwmXyXBP6XxNa+p60DOlPO74xgqXZlysU+oM05Nfrqw5912LO3y
         gTS6if/4psjYM5rzWErxxjNZriluv+jsZYigr44uGlzIJ60nkaUrOPgZvWikNHD2xlcF
         O3JJeLiOi0ACmFszY9GUQYzUmuqhrQs3brPRRKD4WzvKgCyuIsPKSpssP5vxaeGeM/4B
         VUYpJN+92wP453TvN66cx02JyJ416Z5IUxPbZMkjHCqZKgHwJLb2aZnm2349L+BuObrz
         xrSKg3lcgdPkaxo0/1cNxgrtYsWbcDtUENshmHeU5RUOlptFcH1DlfkTUymUQ3CT9sIS
         WAgA==
X-Forwarded-Encrypted: i=1; AJvYcCXmXZXNVF1myd/RUIy4fNzvsS5ofPL2rc085PuRn5EOVIbWUZrWvw+Oz++5hMru+lhgsQTNCTyoe2ZLY30=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw/Nn31EO7vMXWfax8HbV64696OpzyrT5mGZKqJ9GoPewHVRx0H
	8Kaz6rcFpKv478aLPfL24JZDxkOBxr2SqsLmrIaRrLXwywVHp69yhCpF
X-Gm-Gg: AY/fxX4E3EmsCWsz27eTEdbGzGxUW5EaNHJ7m1jIaceIrekBNKeTEEh6r7dP5+L3f1M
	Xzr8MWaLmAjzNWTLeo6kEu/Mx1aAzvpzR9oUSV+urAzXkT9fAXPvtbj+z9Pou2bkpV5P+7QGmxI
	FpHR9bE33i+ZIrNdaDWL70uZxJczf1q/4qiOUTc/VAWwDITghRikPWJmsFnP76Y1LzEFc76nW7w
	gF4FxYqtY6eyqBcnjR258X+sYLvKOuuGpcyMV8mReOLcmp/wKdfOJ8yZC1R2ek9APA0TLl9lMr5
	3mYXi0ORsKfvk9L2FU3SbQxzVw3rtkFNYCC8/LNiJwxT4/GNHG1ssLnfHNGZB36+KCVfonGqgrI
	BWRPzbCo9NpBpO5IEgOpon5aWcaAAqf2Hj3u3bGP3BKQmo6DswzOsbSeI99qi5OstswK8hn7Ynp
	6JRvIjM25+fLAIO4MUlEfKnzLqEROcn8YpCflUEA==
X-Google-Smtp-Source: AGHT+IGymE1URbEHDhw5BX1nzGOTECoWjlfm2zsVFVoPWPkTZrOWD3CnCtM5DT/uUKOVkJdBDZchkQ==
X-Received: by 2002:a05:690e:b8f:b0:641:f5bc:6950 with SMTP id 956f58d0204a3-6455567e9admr7325417d50.84.1765760003993;
        Sun, 14 Dec 2025 16:53:23 -0800 (PST)
Received: from [192.168.2.226] (104.194.78.75.16clouds.com. [104.194.78.75])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64477db6599sm5753649d50.21.2025.12.14.16.53.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Dec 2025 16:53:23 -0800 (PST)
Message-ID: <52e2c1eb-67cf-41ee-9088-760fb6258153@gmail.com>
Date: Mon, 15 Dec 2025 08:53:07 +0800
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
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] mm/pgtable: use ptdesc for pmd_huge_pte
To: alexs@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "David S . Miller"
 <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Thomas Huth <thuth@redhat.com>,
 Will Deacon <will@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Magnus Lindholm <linmag7@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org
References: <20251214065546.156209-1-alexs@kernel.org>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <20251214065546.156209-1-alexs@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 2025/12/14 14:55, alexs@kernel.org wrote:
> From: Alex Shi<alexs@kernel.org>
> 
> 'pmd_huge_pte' are pgtable variables, but used 'pgtable->lru'
> instead of pgtable->pt_list in pgtable_trans_huge_deposit/withdraw
> functions, That's a bit weird.
> 
> So let's convert the pgtable_t to precise 'struct ptdesc *' for
> ptdesc->pmd_huge_pte, and mm->pmd_huge_pte, then convert function
> pgtable_trans_huge_deposit() to use correct ptdesc.
> 
> This convertion works for most of arch, but failed on s390/sparc/powerpc
> since they use 'pte_t *' as pgtable_t. Is there any suggestion for these
> archs? If we could have a solution, we may remove the pgtable_t for other
> archs.

If s390/sparc/powerpc can't align pgtable_t with others, we have to keep 
the pgtable_t to bridge different types. But we could take step to 
change pgtable_t as 'struct ptdesc *' in other archs. That could 
simplify and clarify related code too, isn't it?

