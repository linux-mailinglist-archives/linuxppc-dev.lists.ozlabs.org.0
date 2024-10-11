Return-Path: <linuxppc-dev+bounces-2112-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8193D99A24F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 13:05:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQ3hM1VRFz3bxp;
	Fri, 11 Oct 2024 22:05:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728644755;
	cv=none; b=oEb6b+Ndb3yriJyLRpwIfLonc17vNnFvasv/sWqaZbTZo4QnZj/YUgZiiSWBa0eq5xgPYqjvxIhmbdMxyyzbtrj3xQe3KwfsLO9kUT7/+Y/6a1E5NAigr41l8QCaXYFkrcQ1+h5ORR9YjChO8mebbbaWEbZAfcaMQMW0aSBfbartAoXYvkOo8aIcPS7u0inevRviyOOIZuFZ1UCeHS32vE12yvswahPB8ZCNKPOaFwDuUCUoXH0pjj2+/8ar+AovxDC8Gh4hFhZ9X/eQoESJhcncgTzE5ZiL+Zr9eHaQMw88i0bmWCvI65A2W0RcqR1YTOweqQaP8xAwy5OJ4VpmHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728644755; c=relaxed/relaxed;
	bh=4lP8AzkLPJlBDrSbaT5Bauc0dziSDSxAksJ1QNpxy4E=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=iWzd8fG2DU2u1zdb0VgbWpPso1o23v9v8/Fm0FDdcvjZjnvGDkfN8m3iBuUMYdKh/UXhMFUfk/o4Tiixvv+OiVnuX+tFuaz86kCnmvgSXEiLesh+NyLY8JCT8ut93Zzts/s5j4mnO0c3LFGmPXgcWjRpGrtq4p+V4WdGXjMgKD6ZP7gOZ9yw95JUN4OQ3UOFVJHYcF8gonmFQ7QPq5eWj9gEJJafGWn+KhwjiXuIesdt4OKp7zPQrkiUhJStXcaDu3v5cwVatNqrtVLaKXgFuS+L69OXlN1OkdHQlnIcyRzn6Dcyla7HK1OwJxTYf8Y6rpjaEUWXW6xQ20tJuT+6qQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dI/8BpGw; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dI/8BpGw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ3hK48trz3bxL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 22:05:52 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20c7edf2872so15674305ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 04:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728644749; x=1729249549; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4lP8AzkLPJlBDrSbaT5Bauc0dziSDSxAksJ1QNpxy4E=;
        b=dI/8BpGwRR6m2JsQUHQQPiYlMhB5csvzth9IU57hpLdbOdFhM/2jZJ8UVEYvjtufzB
         jig4eNKAJJwY2nx2YaL6DxsY6qX0mpYjdtjRiGIDHfT8A2ABj/BW/ixxCVdXD38qLnr5
         4Lhv+Ku69l8A9k+sqNQrrDgmHDThEv5VLZv1jCQj7U7Drpi6QUK6nKC9dB9wgfwaRUtO
         /7ppi51nLwtL92cO0F9S9RUmHTDP38kSxQM0fXD0snrMaJkLorIkkQtdivUwb3bxzFhU
         ANzOCRxQV/wy1lHFiTmMZPa2SGOjwKQ46JesNSoRalJJPEVpHhd5qlMd+Za4gFkPACC9
         ebkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728644749; x=1729249549;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4lP8AzkLPJlBDrSbaT5Bauc0dziSDSxAksJ1QNpxy4E=;
        b=P4+MCd3b7FqM1qLhcy6pZP1X6T5DNSQuNXs/Iq8VImwEqc3X5p+VnUkPWfHIxURnVS
         lNgHbLjl9BJf+AUlvpePG7dWJTZqMYXQjUVeDRk54xy+SVMJkUFPQS38aZ+uPw3uPwJ9
         hw9j0JDu1woH3wxnGeZ86Jd0W2+QC3WSZ3bTQI5xvbTUa9YdSzzaWyDI7pOLBwiuvfkX
         wxReGQnmCw221M8Ja9WEvE53Ans0MaQljsGIU9lr9RGxDt1idbq26T7fWN90Npw1Jwvh
         kUUNX+Sj5p9db7dzA9mFyyL5das/EZEtoKim6pmfLfC9fL9OWaBNXqr3qswC3Gad57+V
         7q+g==
X-Forwarded-Encrypted: i=1; AJvYcCUqkFaEAFEjRHOGu7Po9FZYrLNp9LDhW3JXFANSQVxUcl76o2bOeo/kpoXy9PVehFxgiXt2b588q4Grtks=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw5v4t/Ekt7vcuKMXEgFE4gBsvSFBnQiO4vTUlb7azztjSAksOZ
	uULWAQRzZl4m2wtIHEoBq8m9FA3r2sBrPvGznLjzDF4kq8N4i/rw
X-Google-Smtp-Source: AGHT+IGxXL/GkLsEq8K5RCKB5q8Ci7ka8sCfDOJo9Ybqw500oUx4Vul/sdxip4R7mV6DPgcAMTFT4g==
X-Received: by 2002:a17:903:41cc:b0:20b:a409:329 with SMTP id d9443c01a7336-20c80442c36mr107526735ad.5.1728644748610;
        Fri, 11 Oct 2024 04:05:48 -0700 (PDT)
Received: from dw-tp ([171.76.85.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c3510bfsm21757195ad.294.2024.10.11.04.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 04:05:47 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org, Sourabh Jain <sourabhjain@linux.ibm.com>, Hari
 Bathini <hbathini@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, David
 Hildenbrand <david@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, "Aneesh
 Kumar K . V" <aneesh.kumar@kernel.org>, Donet Tom <donettom@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Sachin
 P Bappalige <sachinpb@linux.ibm.com>
Subject: Re: [RFC v2 0/4] cma: powerpc fadump fixes
In-Reply-To: <87zfnb54fe.fsf@mail.lhotse>
Date: Fri, 11 Oct 2024 16:30:31 +0530
Message-ID: <87bjzq3nw0.fsf@gmail.com>
References: <cover.1728585512.git.ritesh.list@gmail.com> <87zfnb54fe.fsf@mail.lhotse>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> "Ritesh Harjani (IBM)" <ritesh.list@gmail.com> writes:
>> Please find the v2 of cma related powerpc fadump fixes.
>>
>> Patch-1 is a change in mm/cma.c to make sure we return an error if someone uses
>> cma_init_reserved_mem() before the pageblock_order is initalized.
>>
>> I guess, it's best if Patch-1 goes via mm tree and since rest of the changes
>> are powerpc fadump fixes hence those should go via powerpc tree. Right?
>
> Yes I think that will work.
>
> Because there's no actual dependency on patch 1, correct?

There is no dependency, yes.

>
> Let's see if the mm folks are happy with the approach, and if so you
> should send patch 1 on its own, and patches 2-4 as a separate series.
>
> Then I can take the series (2-4) as fixes, and patch 1 can go via the mm
> tree (probably in next, not as a fix).
>

Sure. Since David has acked patch-1, let me split this into 2 series
as you mentioned above and re-send both seperately, so that it can be
picked up in their respective trees.

Will just do it in sometime. Thanks!

-ritesh


> cheers
>
>> v1 -> v2:
>> =========
>> 1. Review comments from David to call fadump_cma_init() after the
>>    pageblock_order is initialized. Also to catch usages if someone tries
>>    to call cma_init_reserved_mem() before pageblock_order is initialized.
>>
>> [v1]: https://lore.kernel.org/linuxppc-dev/c1e66d3e69c8d90988c02b84c79db5d9dd93f053.1728386179.git.ritesh.list@gmail.com/
>>
>> Ritesh Harjani (IBM) (4):
>>   cma: Enforce non-zero pageblock_order during cma_init_reserved_mem()
>>   fadump: Refactor and prepare fadump_cma_init for late init
>>   fadump: Reserve page-aligned boot_memory_size during fadump_reserve_mem
>>   fadump: Move fadump_cma_init to setup_arch() after initmem_init()
>>
>>  arch/powerpc/include/asm/fadump.h  |  7 ++++
>>  arch/powerpc/kernel/fadump.c       | 55 +++++++++++++++---------------
>>  arch/powerpc/kernel/setup-common.c |  6 ++--
>>  mm/cma.c                           |  9 +++++
>>  4 files changed, 48 insertions(+), 29 deletions(-)
>>
>> --
>> 2.46.0

