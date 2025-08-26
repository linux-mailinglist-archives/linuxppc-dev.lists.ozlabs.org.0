Return-Path: <linuxppc-dev+bounces-11338-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D20DB3709A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 18:37:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBCy03LRKz3dVf;
	Wed, 27 Aug 2025 02:37:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756226264;
	cv=none; b=Maw1cZ+QvPQp70i/DtJInl01C8r9BxfPetwiymLHZFgRopoEWs8qTkb4J0E0nKv6mSTSsX085OUwSpPGjBXQ18cSaUWW4nbCxdvIz1hLc5pNIkCnmd5jl0DCaoybzv4oHLIbmRFi8Lev86d+0d+mv6LQbSY/vGsB7xoaNJIasirF70ZrrP/USYxdMDmhNGR/Nihq+nv/ond98EORlqU16jv7oaMVsgKz2rGDc1Hmn1v/jd4o1juGIs1iBxog6kPil9Jv3syJVd/ZB1IGpvt0Rfouy2OYCuQZ4P+P8DUIkslIlxcK3MfJdRLIY6EgPWlBKBJOkAgX7SQn5MTYC8fGoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756226264; c=relaxed/relaxed;
	bh=jyPF/dL+2YqZRv98PVCshXGneATY8Fvhth5O4vhMkWc=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=SpY9sC5k04c7hCV/49x+YX6rC8CyuxMQ00dh5jCl2X1Pkt8j4ztWup/FAirEXdyiNrFpCG/sYJIllw5SZlcWZmxkm/RT1Is18O6GjlgerEbOuRV1fFcAdwA99gJmJCWDh2Mp8lIirHn0BEQPxa56mbSw1GJbHSsqJ/Bijk4Hy1lJ7Dj+se9OiiBs6l8eeyAGymoMO+RhFVRoBmmAkUnOWVbmdqJetoxEjYCciLVxidP6k45d7GtmrVm8eIqX336AvhgAPvboT8mfHIZem/OQ4Mt/NHqbijYCvR1ymNE3mPYo5D/SOArNvlqYcyn8UuitxgLEGkekszZc0JiuJc755w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S2hfD5Mq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S2hfD5Mq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBCxz2vFHz3dSr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Aug 2025 02:37:43 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b47174c8e45so5627451a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 09:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756226261; x=1756831061; darn=lists.ozlabs.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jyPF/dL+2YqZRv98PVCshXGneATY8Fvhth5O4vhMkWc=;
        b=S2hfD5MqYUBbiwa40/E1ZzfRRYWvF8w++gwDMzMcAYMmeWij8FZuTUuwf/6BMc9ymH
         p5rIAhxF6bu7Z5n9sZ/bfb5iMQYHyiP7Zh6k3Hon1Ah4795n0Gtdl1yFokj0JA22d2oK
         /1DaU2spYIzMsPqVdWrrvLPLJ7PPDeDIvZF6k0aIj/WZTKp51jZN+pQ2FVzpOpHHCkSD
         lJ6aOvpPDnOttZO6f8KGqcVAroTvZk0AiUsQ90IXNdbpCBHRgI5av2yNbD8BXtYHNgpc
         oayC+pKYvEVrfslu62s4Fqd4QatgWaIgzIn8m9d0N9O6+xnSBH6Bcz2ckYOz3Eqj49Xm
         hMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756226261; x=1756831061;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jyPF/dL+2YqZRv98PVCshXGneATY8Fvhth5O4vhMkWc=;
        b=s4BR+Z9LJbsGnXgh+Hnrg+rjqNsRfI5zrt2cB9V7NYJ5pV/0q3yWOyIDJ3sCMN5gYW
         C+rkjDAXZ3kx4ohMK1sZ7cKpExkHu9VuFuqKnKdN7jsjhlY7JTv+PuqYqlumPiHKRXWg
         ag2/gA/lgSbf24GtQHKShlKZ2KvhWezxXu9zGvPLT4SgrQOJFAdqmn7nW0v9v/W0vCqH
         Lu1zgNkivdgqyb8C9ravkeKilKt0Z+b7KSVBeig4ZDZGZ8bizSauCJgtrhYeq3dPP9YE
         ief2EwmNtcuDKC7ZwlcTu/p/FQqH+YIlnB424JUPSM+MgROeXXgxe0rEsaGa6TlYeORu
         zxIg==
X-Forwarded-Encrypted: i=1; AJvYcCV8hUNk2mVoyr4swG3CgBd9ZTWU7cjv6kcjtUWuz7kX+V02bVFn+O58aCZcFas2DYGXHQwCMoyqho2gTtA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyPSKhqNV+zAAv+ICuz0wlpF7xQvNEooXlh9jseeVcn9AIbiuhF
	gg9eoeqbM8bfgvEqkOI2GygTh6iOBtFH5RCMEGUhW9RZXkNUBbt2Ts6K
X-Gm-Gg: ASbGnctBAZM1nwsgfHTdg7dk670ckC379Eywps01UXi3Xu9hwBMjMIYFWF5lak0Y+pN
	2F8NCoHv0MSOkmOYOxLIJcZXsSdM8JRW5FTU23gvhtiT+Vz7OQF6AZjXD0NpcvJDWY/B+Trx+GU
	fE91GRN3AdX1Y7YnB9hYrJeWsi44jcwpZxqUPhqYRLCnlLLVZCkT/ESSAnWxeo3PycdwPnyG++r
	deKRc4xeonPOqZuDGcDJco0yitOpNewleNHRKlays6e0YdykwOnXgkDeYdXyp/WvGnmKxVsA1v/
	fmgCm9q/rxlPnmc+A0Ok2M7BZ92UW/4DOj+zK++OvBPaBdY3Rc7zdZbtzH5ooNLlIahZ71d1IMc
	qhP8Br8srrwJwHA==
X-Google-Smtp-Source: AGHT+IHkpBzdMdA7eE7qfwfc1lxqW0m87+LkJnM6/YhAHtUnIYSPMtiSiZLKGMu2nLQJcFkeNv4YGw==
X-Received: by 2002:a17:903:32c8:b0:248:79d4:939b with SMTP id d9443c01a7336-24879d4978cmr26372675ad.54.1756226260428;
        Tue, 26 Aug 2025 09:37:40 -0700 (PDT)
Received: from dw-tp ([171.76.82.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-248681adacdsm21450705ad.10.2025.08.26.09.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 09:37:39 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, xen-devel@lists.xenproject.org, 
	linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, David Hildenbrand <david@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Dan Williams <dan.j.williams@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Hugh Dickins <hughd@google.com>, 
	Oscar Salvador <osalvador@suse.de>, Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v3 06/11] powerpc/ptdump: rename "struct pgtable_level" to "struct ptdump_pglevel"
In-Reply-To: <20250811112631.759341-7-david@redhat.com>
Date: Tue, 26 Aug 2025 21:58:09 +0530
Message-ID: <87a53mqc86.fsf@gmail.com>
References: <20250811112631.759341-1-david@redhat.com> <20250811112631.759341-7-david@redhat.com>
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

David Hildenbrand <david@redhat.com> writes:

> We want to make use of "pgtable_level" for an enum in core-mm. Other
> architectures seem to call "struct pgtable_level" either:
> * "struct pg_level" when not exposed in a header (riscv, arm)
> * "struct ptdump_pg_level" when expose in a header (arm64)
>
> So let's follow what arm64 does.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  arch/powerpc/mm/ptdump/8xx.c      | 2 +-
>  arch/powerpc/mm/ptdump/book3s64.c | 2 +-
>  arch/powerpc/mm/ptdump/ptdump.h   | 4 ++--
>  arch/powerpc/mm/ptdump/shared.c   | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)


As mentioned in commit msg mostly a mechanical change to convert 
"struct pgtable_level" to "struct ptdump_pg_level" for aforementioned purpose.. 

The patch looks ok and compiles fine on my book3s64 and ppc32 platform. 

I think we should fix the subject line.. s/ptdump_pglevel/ptdump_pg_level

Otherwise the changes looks good to me. So please feel free to add - 
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>



>
> diff --git a/arch/powerpc/mm/ptdump/8xx.c b/arch/powerpc/mm/ptdump/8xx.c
> index b5c79b11ea3c2..4ca9cf7a90c9e 100644
> --- a/arch/powerpc/mm/ptdump/8xx.c
> +++ b/arch/powerpc/mm/ptdump/8xx.c
> @@ -69,7 +69,7 @@ static const struct flag_info flag_array[] = {
>  	}
>  };
>  
> -struct pgtable_level pg_level[5] = {
> +struct ptdump_pg_level pg_level[5] = {
>  	{ /* pgd */
>  		.flag	= flag_array,
>  		.num	= ARRAY_SIZE(flag_array),
> diff --git a/arch/powerpc/mm/ptdump/book3s64.c b/arch/powerpc/mm/ptdump/book3s64.c
> index 5ad92d9dc5d10..6b2da9241d4c4 100644
> --- a/arch/powerpc/mm/ptdump/book3s64.c
> +++ b/arch/powerpc/mm/ptdump/book3s64.c
> @@ -102,7 +102,7 @@ static const struct flag_info flag_array[] = {
>  	}
>  };
>  
> -struct pgtable_level pg_level[5] = {
> +struct ptdump_pg_level pg_level[5] = {
>  	{ /* pgd */
>  		.flag	= flag_array,
>  		.num	= ARRAY_SIZE(flag_array),
> diff --git a/arch/powerpc/mm/ptdump/ptdump.h b/arch/powerpc/mm/ptdump/ptdump.h
> index 154efae96ae09..4232aa4b57eae 100644
> --- a/arch/powerpc/mm/ptdump/ptdump.h
> +++ b/arch/powerpc/mm/ptdump/ptdump.h
> @@ -11,12 +11,12 @@ struct flag_info {
>  	int		shift;
>  };
>  
> -struct pgtable_level {
> +struct ptdump_pg_level {
>  	const struct flag_info *flag;
>  	size_t num;
>  	u64 mask;
>  };
>  
> -extern struct pgtable_level pg_level[5];
> +extern struct ptdump_pg_level pg_level[5];
>  
>  void pt_dump_size(struct seq_file *m, unsigned long delta);
> diff --git a/arch/powerpc/mm/ptdump/shared.c b/arch/powerpc/mm/ptdump/shared.c
> index 39c30c62b7ea7..58998960eb9a4 100644
> --- a/arch/powerpc/mm/ptdump/shared.c
> +++ b/arch/powerpc/mm/ptdump/shared.c
> @@ -67,7 +67,7 @@ static const struct flag_info flag_array[] = {
>  	}
>  };
>  
> -struct pgtable_level pg_level[5] = {
> +struct ptdump_pg_level pg_level[5] = {
>  	{ /* pgd */
>  		.flag	= flag_array,
>  		.num	= ARRAY_SIZE(flag_array),
> -- 
> 2.50.1

