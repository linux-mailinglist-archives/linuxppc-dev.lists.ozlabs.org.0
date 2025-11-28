Return-Path: <linuxppc-dev+bounces-14541-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE962C9197D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Nov 2025 11:18:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dHq5H6vlnz2yrg;
	Fri, 28 Nov 2025 21:18:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764325123;
	cv=none; b=obJbuePSoh4TW5yBZNSsAnUeoHNEavjvxQUimmM3/5+09/W3AQxM9ocikHHzeAapCGuosz5yDKolXOlqXcwVZWaCFYpztSbdjoUvaU/0/WbKG+OiU/d6E6qHg+QV4VWLSKKWivI/aH1VfxgYkhy4iBVJmvMRx6SDK2TbZLqzfjayxJd+ENjCzxdzCF0Qjq+B7/d6fblgtbb0hZbgsi7gK38w5qPJftE6/frIXos05PP9AgN/VvmthGXMmSL/oikl7WpCW9ggGVTvg9rdGeZcgzPp9uxleiGlWEAxa7zjQ+k3WBA/W1WmIydwNb8w6pBu0OHfAfARh8VoxyP7Jv1AoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764325123; c=relaxed/relaxed;
	bh=xKbiTeUE4R3+lfUE5lplRGltmZWgZb40ftgeIyEu5hY=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=HHJPx3c4NSzE+1/xXOIxQmw4bLDS5kEatjcFCKXK/5rNrQBvU1Y4UUrp3nO4uWZxugzf9W2wwvSUhPZqW6C3PzyqDtr+1N0MhTtIRC7Qt32RmiFWaabR/yRtV1GgN56RQQ0mZWlxsd3kb1C0Fc1ZqMWJvSKVxHHkyJXCLYl/KfL9MTpwRQqtWHkaymkxJL3AASx34lnRfekHYGiKJZG8dbkPPtIrMXMA6nVIphtAJ/nnUlbUibebqDCDb94WE6sROaMANJhM7bbwrxyW49Yq3eoGJ56//uthJq9gvknCkREnbijcRTHPE/ROxr5dqfQMa7T8J/j1l+34NbC4njVtog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lhrMOylS; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lhrMOylS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dHq5H0Bksz2yFs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Nov 2025 21:18:41 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3436d6bdce8so1578663a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Nov 2025 02:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764325119; x=1764929919; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xKbiTeUE4R3+lfUE5lplRGltmZWgZb40ftgeIyEu5hY=;
        b=lhrMOylSKrzWImYZ87+X9kSqNJRIGajmLqVacoxQHjpknfGPQDuvHjHXl1cZAgKkJ0
         +bVbm7FiZQk+YddFz6Nag9BTuNqu5A0UtV3K/BxSjy4PWNyfOi1c2LGHSK/74r/hSP8M
         KX3hgRmGHtXLfL1X8C08bEfYSg4uJC93LiQh5JvsadPlnDWi+bwy0kpSmcVnaze8Jqev
         GcW9/gNKbyA2vAPBizJyKjbmoD8UzAqk44J6szbIqHpjk9m35PuA9QBNaPRN5NUE2gwS
         Z05/97v9D3E040tZKT+OfzYR3ng+DRTGKsEZYeoxgP/7bd4B6kiojNL9LOSL+7DmyEBz
         CMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764325119; x=1764929919;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xKbiTeUE4R3+lfUE5lplRGltmZWgZb40ftgeIyEu5hY=;
        b=fUhI6x7pFZOEuYrX/U7i2NERTjDwy35VklfsVU660+BkbfElnV5+CW6kh9fa7wtgMr
         K8MGMCbkilRi/CYG+EBy46famAWnXWix3SPQkSAB8/cVC3DAeFsFwdXQHEXPJCKrdJ+2
         aHwd8X6sjRDQcDMUGCoqPoDZPIsWQxj8ZohAml4DsjfP228SfizF6aXOndxBX/maAZcg
         oFanVskmZ5IbDHpzMIiAlRjfPs+MqCjvA/KgNyZ//852CVKS4VOPg7Rc93GvrfOTXUia
         UG4C+/t9aVODfnS7Vbl8HesnIuuGmkj3H7dyWLcFplM0SzMVND2ZXNzOJtNq8zjF8NtU
         H5sg==
X-Forwarded-Encrypted: i=1; AJvYcCUH8g48uzlAiaZd8dEM7nOteDjNtruqazbAWvH8k9jmUFZpAjOaFYBhFjdNtFF+Lthk5AC9rIxLn8gFLNM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzUd4AOW2hMPC78WeWUpA5IsHBhsCbr1qgMqkmkGYn6GCeCZ/t6
	TbSIrjTfmpxYUw3UcetYtIDvYIDnF3WhyKGzpUKfi2DHzh8yn1bW1v/9
X-Gm-Gg: ASbGncuZjgvoi2A2b6eQVYVl4k+26tQyiTi+51p2sXQAEVEh4k2a3EnQGFqrzBa9pvo
	kfpX55o/njisEJnU5c8LNWvZ0kxDkM1qvuf88Tw1wo2weGbFnZn17GYGmdXqPiGngpdpvDawZYr
	iOonrv80lzXTuYq8GTFKoHrF75K3Kyv6pNo1FwTEw8N4srTwHNj3L+C+M9HJf5fP4yUemWoU3hE
	Uk6gf69/9O44WVXmqICS7RH9VH1yF+0tqOYj5bGB4vNuIEkzTwf1diAaAro5ylG2fjVoxr+WRZg
	rxQK+q1MEDv7ORu7BtZLtKwhDDzetvZvro/ubZU/zVfS6f9Me9r/e/2Fo79VSbQhmRcirZCD/IS
	m7NX6flh5cZ8KkcsFqlYHXX2JrXd9XqH3OGxCReJrlG3lwKcdBiLOp/RMOaxqjFs/0nmE6NiRDF
	YL7jAfJQ==
X-Google-Smtp-Source: AGHT+IGge2gq0mku+sItZjWCM+QW1VZVA+myW1HYnwoNnxALy8Q8T5+kveNTTgNppIT8jE40jNKyHg==
X-Received: by 2002:a17:90b:3e87:b0:343:f509:aa4a with SMTP id 98e67ed59e1d1-34733f50568mr23997342a91.36.1764325119491;
        Fri, 28 Nov 2025 02:18:39 -0800 (PST)
Received: from dw-tp ([49.207.234.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a7c2ce5sm7999198a91.14.2025.11.28.02.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 02:18:38 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, David Hildenbrand <david@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, stable@vger.kernel.org
Subject: Re: [PATCH v1 2/2] powerpc/pseries/cmm: adjust BALLOON_MIGRATE when migrating pages
In-Reply-To: <20251021100606.148294-3-david@redhat.com>
Date: Fri, 28 Nov 2025 15:42:00 +0530
Message-ID: <87v7iumpov.ritesh.list@gmail.com>
References: <20251021100606.148294-1-david@redhat.com> <20251021100606.148294-3-david@redhat.com>
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

David Hildenbrand <david@redhat.com> writes:

> Let's properly adjust BALLOON_MIGRATE like the other drivers.
>
> Note that the INFLATE/DEFLATE events are triggered from the core when
> enqueueing/dequeueing pages.
>
> Not completely sure whether really is stable material, but the fix is
> trivial so let's just CC stable.
>
> This was found by code inspection.
>
> Fixes: fe030c9b85e6 ("powerpc/pseries/cmm: Implement balloon compaction")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  arch/powerpc/platforms/pseries/cmm.c | 1 +
>  1 file changed, 1 insertion(+)

Make sense to add vmstat counter for BALLOON_MIGRATE as well.
The changes looks good to me. Please feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

