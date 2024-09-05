Return-Path: <linuxppc-dev+bounces-1045-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B68996D629
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 12:33:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzwg61h0Jz2yst;
	Thu,  5 Sep 2024 20:33:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::72d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725530770;
	cv=none; b=HuXtt5uV5LG8uOEuTbBP/HxSnWfikhoiD9PH29oCBrYhe5clt2jciyAl6YLpbbBdbD4cNUK/Mtyd9dNphMUZMtQ2sdk9QiDONYKKxH03KcDBQwjBYUQLQ9kDZQADiImVkTViMnQg+rXvQXYN64Eyo1eaupmhcUmVACHzGfmCzrJ1pjaLNKyqWUsw22Un0SJjYYuOcRzwpHdXWe604Eld2/t5LE0i1osKggQAw81D3UkcI2CqKP+rNJUMY6Jw+88fClsqq4IVGwFqRFxD55kb8suIRaweeRH9wkdrIAetbRRyH9AWaZR76FfTVxpJ8cs6urDsz2KGBrN+B1Wxev2rgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725530770; c=relaxed/relaxed;
	bh=FssOZMkL4EI9Dg7029SIMlcBVh5AI88igqnT1wzgpi8=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=FfZce0sGVcTMv5AbDE30GwT43LUZDamv30PsLAt4xUq8AzqxUSyBUIcO7ISpSLb4fclGCSE35sVyOCv/71VlDm+AK2WKtytjoZOSxwsIX7eXNPUhPcSvdJG7XNSwhFpbzO5PBvLEo9sOC1IGi9WhmC+3KHnQ3zl/nYxRfZuuxdgqf5S60myVz+SuS/7xeil0zaN5X+t9hSnwKPUeIBegIAD9lixuuvAvlXqiIfFoA6jmsk7IbpXJb/wsMptvFuQdyH5lbHqN2M0586tw557+SDcyFSk/MFP4vEXVNDsQ7D0g2WM6JXJAcfwHyNr3/p47zlYrv2LYHxVw27n0QjWkGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; dkim=pass (2048-bit key; unprotected) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=T5zGJRPA; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::72d; helo=mail-qk1-x72d.google.com; envelope-from=hannes@cmpxchg.org; receiver=lists.ozlabs.org) smtp.mailfrom=cmpxchg.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=T5zGJRPA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cmpxchg.org (client-ip=2607:f8b0:4864:20::72d; helo=mail-qk1-x72d.google.com; envelope-from=hannes@cmpxchg.org; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wzw414X0sz2xYk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 20:06:07 +1000 (AEST)
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7a802deeb9aso40137985a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Sep 2024 03:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1725530764; x=1726135564; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FssOZMkL4EI9Dg7029SIMlcBVh5AI88igqnT1wzgpi8=;
        b=T5zGJRPAG4toUmWI/Lnw7AArB3aTnAqFqYNr+r2loS8KjkX4PI7AWZOc5uLIju/Hja
         u4K4ZoYA8q+zjl+rzGHVauVhVVcL7rEKAWbnQy3/F9Rn5lcKbDnoAGQW1CC3TVqEo6GL
         Xxb0mNDoEHSdzApFRWiFthQ3zKcm6e02cXb42hgvcwH5sjVRi79J7nBDJk13VHKwjOyo
         fRn+Qdrrv5V0FXvYLcVkRZpn0PWlt96PFGNltfUhAknG4/9MGVUhvJI0VGT9lJK/UcTJ
         VNpTD+n2dIRvdyUChrGu1oQSir4KPkg/DCLymY/uzVvPuPX7/fClUtnWLUuZd7PTzeAa
         UPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725530764; x=1726135564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FssOZMkL4EI9Dg7029SIMlcBVh5AI88igqnT1wzgpi8=;
        b=cArYk9Cl1FN1z5gxWE51s0Wo67i7mN0N7CQJ8vY6HnlpX9na3zsBPxR0ZGw0HpQ8Vn
         R9CDdeR45hmusWaBm1atQQHtBR7EuYh+oYrlopbx4maFkfxorfp8RSk1HbynNl4Dzcvf
         nypqQwqEPMs482K1iKWsevAPIPq5FhOAtdyzSOOgXJIV4RelA+8klUL9TxPCmrjvtQb/
         q7VKpXpI9HwNtuNI7D8Uh4TKVYo6WH5ymjuKN7NeiDWrVJw1k5MjdVHWYyFuikCmaOgv
         x8dRi30voBAUZaur7uydCNAepavokaO620JgMBYff+usOppI83movVzxelXaZg9XTkLs
         ZGjw==
X-Forwarded-Encrypted: i=1; AJvYcCVRTiH+l1t/lwkXV4MYaTUqf5jMtrslzFJE69yTkUpGyLDXrIZloiOXGp8o6nF+0YCl0Rx2fpGX4Z+bEIo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwlA03q9gBUsX88awVEQIsqeEzKMZ43PeXgmZ7Gr/ZWPHoR++dl
	Jnwoah4LNCDxGai5fo1Huw/LkiV0ikUV1YHxVfItVGHE+Uiug+5aPxTd4/hPiOM=
X-Google-Smtp-Source: AGHT+IFqlUnb0R4Tnf7fLDfR9u43Xt0rwLhVu8SYQjcg8VJmKtyiXjLAvjhl0Q1+nPJDIOI+VCzqpQ==
X-Received: by 2002:a05:6214:5b09:b0:6c5:1707:7159 with SMTP id 6a1803df08f44-6c517077d53mr70665036d6.33.1725530764171;
        Thu, 05 Sep 2024 03:06:04 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c52019407fsm6350906d6.0.2024.09.05.03.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 03:06:03 -0700 (PDT)
Date: Thu, 5 Sep 2024 06:05:57 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vitaly Wool <vitaly.wool@konsulko.com>,
	Miaohe Lin <linmiaohe@huawei.com>, Nhat Pham <nphamcs@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Chris Down <chris@chrisdown.name>, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: z3fold: deprecate CONFIG_Z3FOLD
Message-ID: <20240905100557.GA2748692@cmpxchg.org>
References: <20240904233343.933462-1-yosryahmed@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904233343.933462-1-yosryahmed@google.com>

On Wed, Sep 04, 2024 at 11:33:43PM +0000, Yosry Ahmed wrote:
> The z3fold compressed pages allocator is rarely used, most users use
> zsmalloc. The only disadvantage of zsmalloc in comparison is the
> dependency on MMU, and zbud is a more common option for !MMU as it was
> the default zswap allocator for a long time.
> 
> Historically, zsmalloc had worse latency than zbud and z3fold but
> offered better memory savings. This is no longer the case as shown by
> a simple recent analysis [1]. That analysis showed that z3fold does not
> have any advantage over zsmalloc or zbud considering both performance
> and memory usage. In a kernel build test on tmpfs in a limited cgroup,
> z3fold took 3% more time and used 1.8% more memory. The latency of
> zswap_load() was 7% higher, and that of zswap_store() was 10% higher.
> Zsmalloc is better in all metrics.
> 
> Moreover, z3fold apparently has latent bugs, which was made noticeable
> by a recent soft lockup bug report with z3fold [2]. Switching to
> zsmalloc not only fixed the problem, but also reduced the swap usage
> from 6~8G to 1~2G. Other users have also reported being bitten by
> mistakenly enabling z3fold.
> 
> Other than hurting users, z3fold is repeatedly causing wasted
> engineering effort. Apart from investigating the above bug, it came up
> in multiple development discussions (e.g. [3]) as something we need to
> handle, when there aren't any legit users (at least not intentionally).
> 
> The natural course of action is to deprecate z3fold, and remove in a few
> cycles if no objections are raised from active users. Next on the list
> should be zbud, as it offers marginal latency gains at the cost of huge
> memory waste when compared to zsmalloc. That one will need to wait until
> zsmalloc does not depend on MMU.
> 
> Rename the user-visible config option from CONFIG_Z3FOLD to
> CONFIG_Z3FOLD_DEPRECATED so that users with CONFIG_Z3FOLD=y get a new
> prompt with explanation during make oldconfig. Also, remove
> CONFIG_Z3FOLD=y from defconfigs.
> 
> [1]https://lore.kernel.org/lkml/CAJD7tkbRF6od-2x_L8-A1QL3=2Ww13sCj4S3i4bNndqF+3+_Vg@mail.gmail.com/
> [2]https://lore.kernel.org/lkml/EF0ABD3E-A239-4111-A8AB-5C442E759CF3@gmail.com/
> [3]https://lore.kernel.org/lkml/CAJD7tkbnmeVugfunffSovJf9FAgy9rhBVt_tx=nxUveLUfqVsA@mail.gmail.com/
> 
> Acked-by: Chris Down <chris@chrisdown.name>
> Acked-by: Nhat Pham <nphamcs@gmail.com>
> Signed-off-by: Yosry Ahmed <yosryahmed@google.com>

zsmalloc's CONFIG_MMU requirement was a concern in the past, but
z3fold appears so bitrotted at this point that it's simply not a
usable option anymore.

> I think it should actually be fine to remove z3fold without deprecating
> it first, but I am doing the due diligence.

Yeah, you never know for sure if users exist. Deprecating it for a few
cycles is the safer option.

Acked-by: Johannes Weiner <hannes@cmpxchg.org>

