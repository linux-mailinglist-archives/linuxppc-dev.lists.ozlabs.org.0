Return-Path: <linuxppc-dev+bounces-13962-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3189CC4259E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 08 Nov 2025 04:14:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d3LdF6dHTz2ynf;
	Sat,  8 Nov 2025 14:14:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1034"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762571681;
	cv=none; b=EbXEITS4i/gOjGBliVyhcrlZYAWYN8U/EmpE6a1Y35K1gTWnoAkSgUN8uilcLhWlvfQ+rKnt9WXaGL2At3n9wwsAmk3pmIOX64CbLTkwJ7wvWg8UX0zQqmk2D6cwAfO9V4TMQdSy/jL6rcFqwcwjMMghcnhXzem0rg4S1Ecr1G1daZACvTlDmrTNZ2IbS9tpvLhMJG2nQGaPIIwQ5qUQADpywU+7YuseQeGCX6R5ggl+NsBP32XsTc0muuUQRFuNxRFcwunyRJGCzQms6p8ngeQVGQnBsZqdJWk6QQ7phXM0RP8Q2LDP6Bl55hHSHXbq7UQZTt0YYOPnqNVD+89wNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762571681; c=relaxed/relaxed;
	bh=N6C2+7Qd60IlxMiJIyGrsOyGd11fRVYN8pScSxbzQ4U=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=SyyxW7QnR/JjrQzwNMEQ9FUg0KZ7JkU0+ARHTXmuAkYVGWM2fq5ukfOOE3hln035uY9BoJTvTbdOQtRiPKom7fLvymymylVzcfeKcQB1KQXoPMIXbT+s1Q+0w8sZkblhIx2Agsw6N8akg9o5ibMaxKgE61K/ZhVcVS4DS3y/iHcgWj/TiUGcbF66Md+BV9xNB4xZLGBNevu27yOEw1oP4RC6UHZplkv0bMoqTORA2ZNljLDyHWg+4a2f+PtkeNp94TTmebvAIayLrSNJ6WBnhisoYrvXkIoxcnwC4PBIlnvizybtJb3PvCGRyVxjLFrrlP8hgiCXT3KelykgzbY8Dg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cshrlRbV; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cshrlRbV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d3LdF07PHz2yG5
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Nov 2025 14:14:40 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-340564186e0so1186397a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Nov 2025 19:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762571678; x=1763176478; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N6C2+7Qd60IlxMiJIyGrsOyGd11fRVYN8pScSxbzQ4U=;
        b=cshrlRbVD719wgcdh9pkzevJCz6kX1hzclfabis2C7S5sIVcqGFVQfWb9ZQfqMzYIk
         kZgEVlGuwxBra60dlsGnIgDATchUWZQpRFlHIMjJdIFNZrsz+IA/rlW24PVOvaNrva5O
         fCYmocKVhKJjwZ4wHlPf/CCxnuIDil3v7LgDbwnZp/1M2rYOAKQmyaexKlTLqu3BebC0
         NdJ8R3eZ0qoGlyGdpuy4hHU/9cKPU0N4+96u+Crkl8lvsN3YwTVEYCVkqoGSDuVfTHpS
         XmNJbfwevlhBko8NCOOqqxBwixdpaY3X2p2+1M3+dMBALoxW/XnUm7u+P7MnFkGnRXQt
         23Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762571678; x=1763176478;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N6C2+7Qd60IlxMiJIyGrsOyGd11fRVYN8pScSxbzQ4U=;
        b=NFk8Av1iirPTvRO5IQ25hn58T7K9nsh+1z6+OJTdOPSrCPuDQwT9XmnVdn+M8PZXmM
         KM/vO2KZGjElj7eMrVQrgp0wUUOfwqLs4G6ouFC+0yHr7SqUz8IB/tslpZ375zX5d9iR
         RRpRPyvy5Z7GDXHKuqWyl7Kvwc5dTCYdOo5o7dOFaOYu4kPEltdAQazjq/MdnVaHz5ho
         4PkF26FC4YJaRLmna/DoTmFYPdjTy2Wz9scUV89BTeJ+TNcQYdGyWWyjgn7NB3edX49j
         NF3nVpy/LU391FnnEsJRuf16PtSrvC4Ly3koHRYW+HN2lnaSKjTvfnOexefB2fdQVG2O
         QNJw==
X-Forwarded-Encrypted: i=1; AJvYcCXrNRgEpI645Q+K3Qabuyz7uW+DBT0GvZfiUevHw4uiI5I26NnySWKSF4d1E0pvSJc9TrbdDsEtnZnij70=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyP1V+IkcRWXGr37ilgIj+1L5qoS2tsJ9ocaSpRbkMjHH4NjNXR
	uls4ziN6mG9NbTqBqU2ABoE0vrIwkyfR541pY7Utfv12u5T9uqh1vIgT
X-Gm-Gg: ASbGncvw3f0/2K2BrqZNygYQjNMsaHP0jpvXmi76tTxRvF2dEq/nPPFfObUqEz1hLSR
	Zy+8g3r61BoczbfT7ReT33zwdNUE8tVjOD4b10XqlyMZcVNGyZYZIiEBADF61hnIqo2jM9S0E2G
	5dh8/uf9G9HCe2V7X9+ZOEeVnwLScsyO4j7GvF6J0PYBsJ28P1waQuPQTdwiNVyG2LsTfa1G9ep
	nPplZ86Xr4RfMgBONWWSCpQWoBFkuQnB6v/1awUX8VKnEB3TvW6Jac1NxuP/LxBPncmBpUhA/Jt
	4I0/aR7q3XcEOVi1Tukgixx99R+xHCD1nhWAO5RDDvSEdYAWlc/rvAgZmKWwY5bNeo7NLSwwdt/
	GWFxo0AGI/LebqQugzWaAQPRV8mn+bvCi8xq+14Qy+uFrL1f56agw7GxrVx8kiVoPo+f8Ag==
X-Google-Smtp-Source: AGHT+IG9vhxF6McYx23s0+35XeyzF1JXNaUkhqmH82aBI1lNnROQAEm8GsscnfsHXOTjHEvjsYsCUg==
X-Received: by 2002:a17:90b:4a8f:b0:343:653d:31c with SMTP id 98e67ed59e1d1-3436cb0d08amr1498550a91.5.1762571678338;
        Fri, 07 Nov 2025 19:14:38 -0800 (PST)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f9ed1e73sm6842743a12.12.2025.11.07.19.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 19:14:37 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Baoquan he <bhe@redhat.com>, Jiri Bohac <jbohac@suse.cz>, Hari Bathini <hbathini@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Shivang Upadhyay <shivangu@linux.ibm.com>, kexec@lists.infradead.org
Subject: Re: [PATCH v7] powerpc/kdump: Add support for crashkernel CMA reservation
In-Reply-To: <20251107080334.708028-1-sourabhjain@linux.ibm.com>
Date: Sat, 08 Nov 2025 08:14:51 +0530
Message-ID: <87a50x450c.ritesh.list@gmail.com>
References: <20251107080334.708028-1-sourabhjain@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
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

> Commit 35c18f2933c5 ("Add a new optional ",cma" suffix to the
> crashkernel= command line option") and commit ab475510e042 ("kdump:
> implement reserve_crashkernel_cma") added CMA support for kdump
> crashkernel reservation.
>
> Extend crashkernel CMA reservation support to powerpc.
>

Yup, would be nice to see this support landing in powerpc!

> The following changes are made to enable CMA reservation on powerpc:
>
> - Parse and obtain the CMA reservation size along with other crashkernel
>   parameters
> - Call reserve_crashkernel_cma() to allocate the CMA region for kdump
> - Include the CMA-reserved ranges in the usable memory ranges for the
>   kdump kernel to use.
> - Exclude the CMA-reserved ranges from the crash kernel memory to
>   prevent them from being exported through /proc/vmcore.
>
> With the introduction of the CMA crashkernel regions,
> crash_exclude_mem_range() needs to be called multiple times to exclude
> both crashk_res and crashk_cma_ranges from the crash memory ranges. To
> avoid repetitive logic for validating mem_ranges size and handling
> reallocation when required, this functionality is moved to a new wrapper
> function crash_exclude_mem_range_guarded().
>
> To ensure proper CMA reservation, reserve_crashkernel_cma() is called
> after pageblock_order is initialized.
>
> Update kernel-parameters.txt to document CMA support for crashkernel on
> powerpc architecture.
>
> Cc: Baoquan he <bhe@redhat.com>
> Cc: Jiri Bohac <jbohac@suse.cz>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
> Cc: kexec@lists.infradead.org
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
> Changelog:
>
> v6 -> v7
> https://lore.kernel.org/all/20251104132818.1724562-1-sourabhjain@linux.ibm.com/
>  - declare crashk_cma_size static
>
> ---
>  .../admin-guide/kernel-parameters.txt         |  2 +-
>  arch/powerpc/include/asm/kexec.h              |  2 +
>  arch/powerpc/kernel/setup-common.c            |  4 +-
>  arch/powerpc/kexec/core.c                     | 10 ++++-
>  arch/powerpc/kexec/ranges.c                   | 43 ++++++++++++++-----
>  5 files changed, 47 insertions(+), 14 deletions(-)

Although my reviewed by may not count much here since I am not deeply
familiar with arch/powerpc/kexec/** part.. 

But FWIW, the patch overall looks logical to me. 
Keeping cma reservation in setup_arch() is the right thing to do to
avoid issues like these in past [1]. The error handling logic and the
loop logic for handling CMA ranges also looks correct to me. 

So feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

[1]: https://lore.kernel.org/linuxppc-dev/3ae208e48c0d9cefe53d2dc4f593388067405b7d.1729146153.git.ritesh.list@gmail.com/

