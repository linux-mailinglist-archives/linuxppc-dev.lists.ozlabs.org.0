Return-Path: <linuxppc-dev+bounces-14301-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DA7C69D88
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 15:12:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9mlY47Fpz2yvH;
	Wed, 19 Nov 2025 01:12:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1031"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763475145;
	cv=none; b=EFKxD4tpwWK89PqSnRvXAfWi4Cw6kaZERgHt0171hVyQhwWdfyaUt6Gh4MY3K/lKgeaalqvIbtCCupLwEaLsZkcYgPP0B4P+kmPmTenBoFyBLEwuFwz86mrzAusl5T1jWYGt1u/lyhQTR7v3Zq9dRAQwGBEPqJ0Nx1HRCvjxhBcxSzuSGsgz06m6X61Vx31UEdYOiR1KSJtcUL3t5t20lm7Eeb3BbbCy38+inrXaWnodheQhyvmCAZX8kYZcSuoky1Pox2qJOiz0cwTXLVNm8NbVMbtR+6njLf6uhbRSlG10A8a+hKzzALCu+Q8x5PGfkCPNMI2CiXFaJ3nvFjvLKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763475145; c=relaxed/relaxed;
	bh=YJCbMXrFxc4lBmLKP9PfJMMIBxBx2LBYdV5jtGktq70=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=Z1gT2ekHTM+OvXDiZj2LUL91sP3mne9aLUrx8uLVFlT1lTHUzoHXOdx5GheWM7nXI7Vq0d1VOaOAy5/Oc15F/FZS3rq3NxwCrPUNGmjjW9V6aws44MYwjbgr5NwDUk1M3MxRgpKsvDToP6mMtDAAitMRcqTvtzQiYenYvLWIP31zepS4WK+PhV2nI7fQp3zefx33XDl9LQXpFdJ2y1ME98a9ew1GVt2gZN+vo4WTvSJhW3Su2b2GlBJ4cjKZP0FgqphwKu48lxMV+HuYVwWf3n/BOov6mTB/kIRoWWL72bEvyt5dQ/KtWoeY2X51pypRbkVWYynbrFWPs4yNkcwLEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KWfEcLk1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KWfEcLk1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9mlX07TCz2yqP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 01:12:23 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3438d4ae152so6742344a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 06:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763475140; x=1764079940; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YJCbMXrFxc4lBmLKP9PfJMMIBxBx2LBYdV5jtGktq70=;
        b=KWfEcLk1mBlaZRm9BhEwCK6qz7KsYyC20gn2F872ydophhPkge+NsiRDr2id4+dY05
         9aN2znZDe3WniYNvyP44mq7BFCSmZeMmBWP/BHrka2C9GVBolAVDWD3Gey0pjCX7iyZ4
         9y7tA6ycDqr4l3ri1982D9DS2kCHbSgr5NNzT1Ve/OfpxlNw0ZLmUR2G05Lq2tScEm/q
         TBiSM/yalVSPWlSJL0EWdo7eKcbzmM1/zy7m6VnTthWA988iZA/XHNVe0WrNtMfZL2Gc
         rwdkt3/oo8aR/phgvI8+wVsvue42+ivw1nxvYnEvS/Ie4T2Z6X7N4rNb2x/wqdJv4J20
         dk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763475140; x=1764079940;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YJCbMXrFxc4lBmLKP9PfJMMIBxBx2LBYdV5jtGktq70=;
        b=S0rP7kQR+W8/ULApXXxL1X6wAThYr0eZ2vTLarR94xzXd6aJb2CqXzg9YWJFvWDmPf
         DmI+e0rUOFS11BfVZVp360S1GPgimzxcrrEzt8zezeX7gjaG5RLtL7vesxfyHjdfmmjX
         dhEEiBZvKE8CQ/adcKAU+BiUigrMj08DsAMMJc3XMk4xSozcHMRAzceP7IJ5nhHRj/SZ
         YpJVqQAWqoOmtEPh1nClRmiLG3rwrshtJuWrVjPWtLs/uqQi+9EhkAwDQP89Prv5n2Yj
         H8bWTIIODmx3RwwuxjDAJraYgEiEw79pVFe8O0mjdgwVZm/f0srTNK6ZxAVDqikgcwUq
         4XGg==
X-Forwarded-Encrypted: i=1; AJvYcCWW8XX9qYyddPxluIe83HsPrWqt6krr9sAXCnvcYHlTnbHayXZKDLfX4LcBUoPR3GYkSIMOr9IkuweKs+c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyV57rNb8VZSalSPyLGrzC7M2lwwzKORex391ysZ8HDiUe8/7y+
	lQd63QH1L5xFJN1pqukoVjsokUoumDe+cvI6jAKCccBS/Bgw+17R1Q2h
X-Gm-Gg: ASbGncv3TMXdoTZXm41Rms5uG13KCMv+v1LMrTnrmj1datbHACic9bHsz3ymZE0Q052
	jdKh1cf0sz1lkJ9Fqgt2E5F5yBzx5XYwRESm5GkqXnJCyhw157yNuSXpl44hEtr1ovw4DMRO4W0
	weE/6w5BFfKrS42W39taDZw+DodyjMPI96Gqn7tEe2VqvWLJ2mQI90FT9VZWsC5VpnffoAkrdIU
	7GlH8exbyyLsu5Mui0M8wkm0aWzlBGVXnDLwuztTBtCpCymzB2OwgXCqtt9Rwfiv9hg9YdxKTy8
	sa62wT6t+QKdV/XfcaxAChfg6kD1X2tLn3voiVaz9f41GxuKPg+iKgn2RGiacyk2XGDUsLzvPxw
	VfwPb6nT5Df8KAmiEH/pw1kw8/WZeSNGFbsuzBGVTBaFpNfk/UgVt707TMKffSYlfh8qZ4p2Hkj
	i7iK+FwQ==
X-Google-Smtp-Source: AGHT+IF1qIVKiE8DwAos/+cPYxxS2D1JpAkt4IZSDQhzjgwOLH+AWMhFOTG9x0eI/Lnzwx1Y2YGH7Q==
X-Received: by 2002:a17:90b:4e8f:b0:32e:3c57:8a9e with SMTP id 98e67ed59e1d1-343fa76c377mr19701586a91.35.1763475139949;
        Tue, 18 Nov 2025 06:12:19 -0800 (PST)
Received: from dw-tp ([49.207.232.208])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92772e713sm16374708b3a.54.2025.11.18.06.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 06:12:19 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David Hildenbrand (Red Hat)" <david@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Sourabh Jain <sourabhjain@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Donet Tom <donettom@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2] mm: fix MAX_FOLIO_ORDER on powerpc configs with hugetlb
In-Reply-To: <20251114214920.2550676-1-david@kernel.org>
Date: Tue, 18 Nov 2025 19:19:01 +0530
Message-ID: <87a50j30z6.ritesh.list@gmail.com>
References: <20251114214920.2550676-1-david@kernel.org>
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

"David Hildenbrand (Red Hat)" <david@kernel.org> writes:

> In the past, CONFIG_ARCH_HAS_GIGANTIC_PAGE indicated that we support
> runtime allocation of gigantic hugetlb folios. In the meantime it evolved
> into a generic way for the architecture to state that it supports
> gigantic hugetlb folios.
>
> In commit fae7d834c43c ("mm: add __dump_folio()") we started using
> CONFIG_ARCH_HAS_GIGANTIC_PAGE to decide MAX_FOLIO_ORDER: whether we could
> have folios larger than what the buddy can handle. In the context of
> that commit, we started using MAX_FOLIO_ORDER to detect page corruptions
> when dumping tail pages of folios. Before that commit, we assumed that
> we cannot have folios larger than the highest buddy order, which was
> obviously wrong.
>
> In commit 7b4f21f5e038 ("mm/hugetlb: check for unreasonable folio sizes
> when registering hstate"), we used MAX_FOLIO_ORDER to detect
> inconsistencies, and in fact, we found some now.
>
> Powerpc allows for configs that can allocate gigantic folio during boot
> (not at runtime), that do not set CONFIG_ARCH_HAS_GIGANTIC_PAGE and can
> exceed PUD_ORDER.
>
> To fix it, let's make powerpc select CONFIG_ARCH_HAS_GIGANTIC_PAGE with
> hugetlb on powerpc, and increase the maximum folio size with hugetlb to 16
> GiB on 64bit (possible on arm64 and powerpc) and 1 GiB on 32 bit (powerpc).
> Note that on some powerpc configurations, whether we actually have gigantic
> pages depends on the setting of CONFIG_ARCH_FORCE_MAX_ORDER, but there is
> nothing really problematic about setting it unconditionally: we just try to
> keep the value small so we can better detect problems in __dump_folio()
> and inconsistencies around the expected largest folio in the system.
>
> Ideally, we'd have a better way to obtain the maximum hugetlb folio size
> and detect ourselves whether we really end up with gigantic folios. Let's
> defer bigger changes and fix the warnings first.
>
> While at it, handle gigantic DAX folios more clearly: DAX can only
> end up creating gigantic folios with HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD.
>
> Add a new Kconfig option HAVE_GIGANTIC_FOLIOS to make both cases
> clearer. In particular, worry about ARCH_HAS_GIGANTIC_PAGE only with
> HUGETLB_PAGE.
>
> Note: with enabling CONFIG_ARCH_HAS_GIGANTIC_PAGE on powerpc, we will now
> also allow for runtime allocations of folios in some more powerpc configs.

So, book3s64 anyways always default to Radix which by default always select
CONFIG_ARCH_HAS_GIGANTIC_PAGE. So even if during runtime Hash mmu gets
selected, we anyways by default had this config enabled on book3s64.

> I don't think this is a problem, but if it is we could handle it through
> __HAVE_ARCH_GIGANTIC_PAGE_RUNTIME_SUPPORTED.

Exactly, I see we already have the above config knob at most places where
this could be needed to prevent runtime gigantic pages.

>
> While __dump_page()/__dump_folio was also problematic (not handling dumping
> of tail pages of such gigantic folios correctly), it doesn't seem
> critical enough to mark it as a fix.
>
> Fixes: 7b4f21f5e038 ("mm/hugetlb: check for unreasonable folio sizes when registering hstate")
> Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Closes: https://lore.kernel.org/r/3e043453-3f27-48ad-b987-cc39f523060a@csgroup.eu/
> Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Closes: https://lore.kernel.org/r/94377f5c-d4f0-4c0f-b0f6-5bf1cd7305b1@linux.ibm.com/
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Donet Tom <donettom@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
> ---
>
> v1 -> v2:

Sorry, this got delayed a bit as I wanted to run mm selftests and then
update.

As I had updated in previous version, this patch also fixes the warning
during boot when RADIX MMU config is kept disabled at build time (that
means only Hash is selected) on book3s64.

No new tests failures were reported on running mm selftests with Hash
mmu on book3s64. Also verified boot tests on few other ppc configs.

So even though I know this patch is already taken in rc6, but still -

Reviewed-and-tested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

Thanks again for providing a quick fix!

-ritesh

