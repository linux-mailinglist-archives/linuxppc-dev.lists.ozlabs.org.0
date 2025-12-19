Return-Path: <linuxppc-dev+bounces-14890-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E88CCCEDE7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Dec 2025 09:00:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXg1r5Tz5z2yFY;
	Fri, 19 Dec 2025 19:00:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766123020;
	cv=none; b=m2v9CK9iWbZWNk+7gYiOoQx2awXldl9LbgoRGVzT+cRTI8olxI2fQq40C+kepU/OGszCmi+pQsZN4KJiNtyYJatx2ExNmBkFYQIJmPgPUScPwql5K+QhF7KZTjEXlogVzcEWsbwG+7LpGGrvsuOGYv5YuCP6ZEktjoj8fwUID0rqwdyz+1wcqfrdRDs2k2GXTJDyVcJoVxxkMqL2sW+D3xNxNVW+XN0TcBKWo5yvyFNicTfJKu8xBwpJJvw2H9NwaRLZt1v8iiHidmHp7zYBzI1FCOdQYaY2uWX/ufUF/bjH+eEId2wHgTVFaoIsyT/IUc2bN4ScyJX0T51imrPYOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766123020; c=relaxed/relaxed;
	bh=3YZTuXKJS0jJ/FjWVkX1S0/dpihzlaBm67evQ8OxNp4=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=HjnFoFBj4YThmRe+by4J6ziCOAAxqJnxLH52kjvO7Ko4QF5PRUDrIq1yWk8L5vfrRve65ZUjkpkanGaZfTMkaAH5d1hNQ5CVsBEjx0hkJvCtculh95lZ8G4rkKILCg298aZFNED75MCyej8Bc2vyLnTH1acBRDdsjjHOve5qtJ1kOu2pYgssOJqR9Y3TEttOQ4Csp46V1bAYee3SlCUWqtFa7C13Tphx5nQJNrpQeBTEbIQ20dYxAUHVziQW1G7ghdZKMK7LcxOUgPTzY/iyJrULZrH6GfAmJr4RBfqNN9a8njkJSkfn2WM/GQfCTI9aq/D3YiAAhudX5p7EdBPlgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gDokuD6y; dkim-atps=neutral; spf=pass (client-ip=209.85.210.179; helo=mail-pf1-f179.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gDokuD6y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.179; helo=mail-pf1-f179.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXc0C1sN5z2xqG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Dec 2025 16:43:37 +1100 (AEDT)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso1413560b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Dec 2025 21:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766122955; x=1766727755; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3YZTuXKJS0jJ/FjWVkX1S0/dpihzlaBm67evQ8OxNp4=;
        b=gDokuD6y2VyIRX+zCmdHbN6hf8aKfUN8DfeCs/Whx/wWd7ANaNaH5Z7VrePB/rOFTp
         IBED53/1ofun6cTlEMMhhEGfnyvr4fpszXQmHtCPsWB+p6lXpQCAmk1dlbkd6z0Ne4Zh
         cTMVhXx26Z2leNyf+KKKpZbmw8EvX/wWeiD4hFLkShf3SF+cxsocIkE4O6QkXQjGTXZk
         +cvBB+nOV0QmgVSwC0Kq2DRK1jJRtPW12vEoVtdCHvs65dZWZHgIPkxLdm/Z+YS49kbL
         zxgt3Rc7EKPLCIV5jyrnhtc6CGrTXa0XQb0o6Sk2DkKy5RCeYJSyCPSx2QrBLewL2f4G
         uXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766122955; x=1766727755;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3YZTuXKJS0jJ/FjWVkX1S0/dpihzlaBm67evQ8OxNp4=;
        b=XI6pH3vMmbnHyHcfwAc6N5//HYh6vcKS0LNDX7u1vrswZZxY2Tnz/ZDAF3XHyoziWu
         nGL4d1gzSFj/3pYsWfBKCtc2q7NJ8izgB0GKzBkt6+BmA52hhEk0WblD6L3JvvMkHA53
         PmVATPD8svcjotaz1e/nTXEedxL3Mccg98/PXY/FVQnpByfjmD8paSvx9Nl5IcA2zdPH
         wJLFNO9UsekXZelfXvKOGahM0KgfiSSJ1Eedi623EE3XbW0qHC4c3KK17TbZBSCjH87O
         3B0034+7ntOiEKNB3X0i2M2gblpfxMpIrJj1V6+6ROHpdg1c2GdW9VY4HQ4iH94YEyhn
         NNdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOiobwExyPnGAwrVdvVfbLHZPrFfNPefNgbYt1fAb28W0C3ag3zqUnxhbaCH6zUocFQuedF6Wu/xrVObg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz3TdC9kqZQkEOwfz6HG8QfG/2v5HBNS86TzE/kEXFMLlgWjPoS
	wz5HbkuiyatJFbvlrnImxmlB/5VgIR0bV9DX9DvP4AgsGcY7M3/c1GJz
X-Gm-Gg: AY/fxX6yEJrdQYJgoIHGDFc0vs8rQjIBijxPOJmUNKyXAIh4g0pqPp5lRfKRmB2nyD1
	XKSIbnwUX66v2YFxTBBD6qza09iYTiXtdNRx4APQ/IUN6a5JIMA81YF1vVdvoIYUfd65+1wo9c5
	Hr+JJPi5xEX30acBtIFkLQBYywfn347Tz8eQhyXRfLjnkWwq8M1gL7YT8M/sh8s9FAnXTz61q/m
	1a+49tb/DNuKbFxOn8S3Hm6mRu3KZSSynHZtuLf16paFzHBtONvrfM/Ku2VwrmF9XTeHdUk7s03
	XbKTsM+3eztZZKMiIQ17mUbwq+i5YypdTE16E8nDY2F8iqHho/ArIgadxBhz9Qb0Nrq8D9ct7hI
	yQt+00yDNFKA+g9zcVLPuSOlavnkiornipiMOciBTEUDreLr5fRJXpPFv6oqusGDJ9s8K7Rtbc4
	draAIC3w==
X-Google-Smtp-Source: AGHT+IGI8fuFuucCjImuX4l87nELJyNl9OPjlv6P1lULzof6E2V8PchTbygl/w/ZX4miaVw5gIXTMA==
X-Received: by 2002:a05:6a00:414b:b0:7e8:450c:61b6 with SMTP id d2e1a72fcca58-7ff6607cf9emr1880110b3a.38.1766122955457;
        Thu, 18 Dec 2025 21:42:35 -0800 (PST)
Received: from dw-tp ([203.81.243.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e0a19besm1067558b3a.40.2025.12.18.21.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 21:42:34 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linux-kernel@vger.kernel.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@alien8.de>, Christophe Leroy <christophe.leroy@csgroup.eu>, David Hildenbrand <david@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, x86@kernel.org, linux-arm64@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5] mm/hugetlb: ignore hugepage kernel args if hugepages are unsupported
In-Reply-To: <20251218114154.228484-1-sourabhjain@linux.ibm.com>
Date: Fri, 19 Dec 2025 09:45:06 +0530
Message-ID: <875xa3ksz9.ritesh.list@gmail.com>
References: <20251218114154.228484-1-sourabhjain@linux.ibm.com>
X-Spam-Flag: YES
X-Spam-Status: Yes, score=3.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Report: 
	* -0.0 SPF_PASS SPF: sender matches SPF record
	*  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
	* -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
	*      envelope-from domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      [ritesh.list(at)gmail.com]
	*  3.6 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
	*      [203.81.243.211 listed in zen.spamhaus.org]
	*  0.0 RCVD_IN_MSPIKE_H3 RBL: Good reputation (+3)
	*      [209.85.210.179 listed in wl.mailspike.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.210.179 listed in list.dnswl.org]
	*  0.0 RCVD_IN_MSPIKE_WL Mailspike good senders
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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

Sourabh Jain <sourabhjain@linux.ibm.com> writes:

> Skip processing hugepage kernel arguments (hugepagesz, hugepages, and
> default_hugepagesz) when hugepages are not supported by the
> architecture.
>
> Some architectures may need to disable hugepages based on conditions
> discovered during kernel boot. The hugepages_supported() helper allows
> architecture code to advertise whether hugepages are supported.
>
> Currently, normal hugepage allocation is guarded by
> hugepages_supported(), but gigantic hugepages are allocated regardless
> of this check. This causes problems on powerpc for fadump (firmware-
> assisted dump).
>
> In the fadump (firmware-assisted dump) scenario, a production kernel
> crash causes the system to boot into a special kernel whose sole
> purpose is to collect the memory dump and reboot. Features such as
> hugepages are not required in this environment and should be
> disabled.
>
> For example, fadump kernel booting with the kernel arguments
> default_hugepagesz=1GB hugepagesz=1GB hugepages=200 prints the
> following logs:
>
> HugeTLB: allocating 200 of page size 1.00 GiB failed.  Only allocated 58 hugepages.
> HugeTLB support is disabled!
> HugeTLB: huge pages not supported, ignoring associated command-line parameters
> hugetlbfs: disabling because there are no supported hugepage sizes
>
> Even though the logs say that hugetlb support is disabled, gigantic
> hugepages are still getting allocated, which causes the fadump kernel
> to run out of memory during boot.
>
> To fix this, the gigantic hugepage allocation should come under
> hugepages_supported().
>
> To bring gigantic hugepage allocation under hugepages_supported(), two
> approaches were previously proposed:
> [1] Check hugepages_supported() in the generic code before allocating
> gigantic hugepages.
> [2] Make arch_hugetlb_valid_size() return false for all hugetlb sizes.
>
> Approach [2] has two minor issues:
> 1. It prints misleading logs about invalid hugepage sizes
> 2. The kernel still processes hugepage kernel arguments unnecessarily
>

And that every other architecture will have to duplicate this in their
arch_hugetlb_valid_size() whenever they face the same problem.

Instead like at other places, hugepages_supported() should also be
checked in the following cmdlines setup functions.

> To control gigantic hugepage allocation, it is proposed to skip
> processing the hugepage kernel arguments (hugepagesz, hugepages, and
> default_hugepagesz) when hugepages_support() returns false.
>

Right. Thanks for taking care of it. I guess after this patch [1] moves
hugetlbpage_init_defaultsize() to mmu_early_init_devtree(), it's good to
bring back these checks in the respective cmdline setup functions which
was removed as part of commit [2]

[1]:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2354ad252b66695be02f4acd18e37bf6264f0464

[2]: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c2833a5bf75b3657c4dd20b3709c8c702754cb1f

LGTM. Please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

