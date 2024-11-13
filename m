Return-Path: <linuxppc-dev+bounces-3131-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3179C66EF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 02:56:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xp5wj5Z9sz2yNc;
	Wed, 13 Nov 2024 12:56:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::231"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731462965;
	cv=none; b=m3ulor0A7dZowzEo3W+RUwuhkWw5DfyTD4oB+orYqqLa89amvzx0yYIm0I+Q15yhAFg5cr4+2Yjx8srGL1C1QRskfYjXztAVDsfTp6mPD3DGjYR2nMbA9tKYEbXnrsYCz2qGDYwXE0M9iFt5J8cYbaykI7EiTtTmuZXy2hrp+VFmjb8ELb+NphLNUdwp0YFysb1Q35FF+iCPn79quFLXrjIroAJgXN4HlR3q7bq8VYv6RBFNEF+BHxqR6KdlnrywXLm6xFRD8Zeya2INXdE7gTKz+49tV5carYAIxFjspddooH3xOxcHUSDw2WTedWSpAxkSe9UdPPN1r4VUT3PXCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731462965; c=relaxed/relaxed;
	bh=11EhO1dZz6gEnF3YkMG0XqMweNwg8PY4ZG+oYYjEKOc=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=Ua4WZuUoE95x9hjcnXlZM1pIngtjxEmecyIuD8dfCaPh0lMlwKa/p2FJltNSIN/a0KaGMMFEC+Uj5ytRbZGPghCuPLBJN9zJ37U57moSMdnkj94l1h+w9dwibD/gUrQq7uTn4dcBua/oVKDdXdPyFH6NHFSb1teL5q9P0l9mv/vdU85YvkTsPqRq9sIy886tbF6ObZBMPDedKjpcl3xa+IgB19iIn/V1bLwVA81dROHcXdHO0zkomY+L5i9L3kwCTCh4U2ZNIenWVXqrfM+sn8prro2efRX7kj3yrvcnWFglorwVo9+gy8txwZ19zFyVzLzPwcHUEPdsG3tSxBvqqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lXzZ7xJM; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::231; helo=mail-oi1-x231.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lXzZ7xJM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::231; helo=mail-oi1-x231.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xp5wb6TKsz2xQC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 12:55:57 +1100 (AEDT)
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3e600add5dcso3087106b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 17:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731462953; x=1732067753; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=11EhO1dZz6gEnF3YkMG0XqMweNwg8PY4ZG+oYYjEKOc=;
        b=lXzZ7xJMtowEC5bPHOu8osv4Pz56LYfC5aM7FKcktkFZUAn+mV4XyRNwzIFSa2xLVc
         qJQk8YfoFMT0rxunWpdd7QL1aMGmiRVk/I4CfMcE1dlO5vpzOJfILbaQUuMfem5fRDt2
         uHzODxZ4Ikeo57DlrSiQn6fHt3LE8Y7kvcMqlx1JpI4av4iSm+0AqRu3fJEcpk4wZroz
         vPCkttjhFYKCq1nuNCDjrOhRL6DbZsOD7UYf+eJrUgiMX7K5n/kX3olxZyeGvV7njNe+
         9B87v03xzsZbCVSmfSt+MFxG8l2v6cCMrvz4bPxgvDDleAs/KGXj0mDIL42U8+wrJfWn
         7NpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731462953; x=1732067753;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=11EhO1dZz6gEnF3YkMG0XqMweNwg8PY4ZG+oYYjEKOc=;
        b=A4if3P+tTTFh0W01yN3aL7ZIfASGkBA8vfG8Z+gT59g/5XK4AuxtgIpD8Tww9k/nof
         o1zjSlvT7joyeyeoElGEzCxdY5mPhHyWhWdsQG+oiDSdjuVE4gzqdz6u1JsUzVTSM7mu
         LtCnkZ/Urt/66+Pc6Hb5PFnfuhW5a28k/R5ibTYK9r8mn2H2LzCJFP1vEbGS0zkOOo8d
         m652EHvzI1LZpFcgV3gg1k4YiJDsMLJX5FmA7OA11eDa6LY9Se/Bng8PXn6T4LzIXZNN
         xMKwJehxHqTQs/N7k54WO2czx+Vsz3gSdeuISwRcqSkxYy0yMJ3HtvTbek5bph88aTF8
         NAmg==
X-Gm-Message-State: AOJu0Yx5CDD3AQF3qG8YSY4Xw79EWBW5WO6wZ1jMhciBVnBzp/KN/U6Y
	ND3q6bZnA7rL1VhUR1tnUUuTIa3j7dsezE2hgtmbnZOhmimBBo8e
X-Google-Smtp-Source: AGHT+IEw04kTyzxcDHeFkrUT0IqyioyF+6yN2dm4ArNEx6RbxWzlwtPmy+r8/kX0HzwsE7aRsIYj0w==
X-Received: by 2002:a05:6808:e8a:b0:3e4:863a:91b3 with SMTP id 5614622812f47-3e79469311dmr18550625b6e.8.1731462952993;
        Tue, 12 Nov 2024 17:55:52 -0800 (PST)
Received: from dw-tp ([171.76.87.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f644db5sm11310584a12.55.2024.11.12.17.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 17:55:52 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: linux-mm@kvack.org
Cc: linuxppc-dev@lists.ozlabs.org, Sourabh Jain <sourabhjain@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Madhavan Srinivasan <maddy@linux.ibm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Donet Tom <donettom@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Sachin P Bappalige <sachinpb@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RFC v3 -next] cma: Enforce non-zero pageblock_order during cma_init_reserved_mem()
In-Reply-To: <054b416302486c2d3fdd5924b624477929100bf6.1728656994.git.ritesh.list@gmail.com>
Date: Wed, 13 Nov 2024 07:23:43 +0530
Message-ID: <87h68bnbko.fsf@gmail.com>
References: <054b416302486c2d3fdd5924b624477929100bf6.1728656994.git.ritesh.list@gmail.com>
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

"Ritesh Harjani (IBM)" <ritesh.list@gmail.com> writes:

> cma_init_reserved_mem() checks base and size alignment with
> CMA_MIN_ALIGNMENT_BYTES. However, some users might call this during
> early boot when pageblock_order is 0. That means if base and size does
> not have pageblock_order alignment, it can cause functional failures
> during cma activate area.
>
> So let's enforce pageblock_order to be non-zero during
> cma_init_reserved_mem().
>
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
> v2 -> v3: Separated the series into 2 as discussed in v2.
> [v2]: https://lore.kernel.org/linuxppc-dev/cover.1728585512.git.ritesh.list@gmail.com/
>
>  mm/cma.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Gentle ping. Is this going into -next?

-ritesh

>
> diff --git a/mm/cma.c b/mm/cma.c
> index 3e9724716bad..36d753e7a0bf 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -182,6 +182,15 @@ int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
>  	if (!size || !memblock_is_region_reserved(base, size))
>  		return -EINVAL;
>
> +	/*
> +	 * CMA uses CMA_MIN_ALIGNMENT_BYTES as alignment requirement which
> +	 * needs pageblock_order to be initialized. Let's enforce it.
> +	 */
> +	if (!pageblock_order) {
> +		pr_err("pageblock_order not yet initialized. Called during early boot?\n");
> +		return -EINVAL;
> +	}
> +
>  	/* ensure minimal alignment required by mm core */
>  	if (!IS_ALIGNED(base | size, CMA_MIN_ALIGNMENT_BYTES))
>  		return -EINVAL;
> --
> 2.46.0

