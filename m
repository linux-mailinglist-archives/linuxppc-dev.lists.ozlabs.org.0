Return-Path: <linuxppc-dev+bounces-14851-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A266CCC90EE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Dec 2025 18:30:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWgmx1SMMz30Kg;
	Thu, 18 Dec 2025 04:30:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765992641;
	cv=none; b=bg9L31M9VfMTRP+A/A/hbfS1DMOxKQ6qa0ETtF4Nw4POd1aUvS52kghGTBQoTGawcpVFKnl8ZP7htTfiFu4KzkhRu4aigMW7EEdRKu0SoDnGg6xRlUKIa5mbl2Opk/vVw3w4vyAMYaCtp2MHhsJkzUUAOQgXe4qe7iCrjT5+1RrW9oDexgaiUADKD3d+H4B0RI43mpaUk0TDP2iCsu81SdAMqxzyC4TP1NCobV3zrFpxEOc7iggYnCBSbjkwN8pFveYn4rA/+7K5DGlrX8gUIgG3cN6Z2QxZcnumUGNvRvQuXaWag5lU7EQYWjIpIEUs2xgifikTVLIXu3nh9Vunlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765992641; c=relaxed/relaxed;
	bh=2k7DFOseIPvyFXGWmA8GBbBvtGWKDIFFzcuqZETGrmo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=UG3UrJ1WXwnK2XwQFnm8Q84oN90Q0Y2d8w7LUd0wWS6coD38YZyGbNZbdaNLz0URQXMCcf6Dnq3NIlXvIn7kznoAOcCK7BXr0JFRVuXwL4k1+rRTlHHFGQVWvdoSuWtpu6gHd5hBd8jo3bh3zm1yxi0cMQp0qy5klhe4IwcsOiuEqdKHGK9yHgbwVn/0NqMEzggdRGV32CCCDh0sdt2OY+vQQGyP21ZM/kMdaKpdrbQHHtQ2M5XiPbBAdj/v/ZMvlXtOqQNghuGXiCOE7GAd6HXiMLu7nPXwmEaiWlFABti0vsn/IuLFfGwa635BBQVqP8Al+T/k7Ybc69XmUYBnyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=0045SR3T; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=0045SR3T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWgmw0dcQz304l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Dec 2025 04:30:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CF9B4050A;
	Wed, 17 Dec 2025 17:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50630C4CEF5;
	Wed, 17 Dec 2025 17:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1765992637;
	bh=YlRNNGNVHNq6DOUluWj1hnA+ZZEyhiWGq/CaxMEk610=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=0045SR3TksK3qNPi3s4Txo8Pzjte7WhkqVKUOZJwoc5dZWvT4qDHJLGxPsCTNH5j+
	 jhdk54E4FEzexSvU5618ltLvktkEzjZb2s2foMZXHDV7twyuatgyfxmihhrcTwP9Wp
	 Afu1qYGo0zz4sKF1Npa6Bc3f8rGN7S8Yzelj61HE=
Date: Wed, 17 Dec 2025 09:30:36 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-kernel@vger.kernel.org,
 Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/mm: export symbols for lazy_mmu_mode KUnit
 tests
Message-Id: <20251217093036.3231f9613ac8f9cf3943357f@linux-foundation.org>
In-Reply-To: <878qf1kqg3.ritesh.list@gmail.com>
References: <20251216201403.4647a4f9861d3122ee9e90d7@linux-foundation.org>
	<20251217163812.2633648-1-kevin.brodsky@arm.com>
	<878qf1kqg3.ritesh.list@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 17 Dec 2025 22:15:16 +0530 Ritesh Harjani (IBM) <ritesh.list@gmail.com> wrote:

> ../arch/powerpc/mm/book3s64/hash_tlb.c:158:1: error: type defaults to ‘int’ in declaration of ‘EXPORT_SYMBOL_IF_KUNIT’ [-Werror=implicit-int]
> ../arch/powerpc/mm/book3s64/hash_tlb.c:158:1: error: parameter names (without types) in function declaration [-Werror]
>   AR      init/built-in.a
> cc1: all warnings being treated as errors
> make[6]: *** [../scripts/Makefile.build:287: arch/powerpc/mm/book3s64/hash_tlb.o] Error 1
> make[5]: *** [../scripts/Makefile.build:556: arch/powerpc/mm/book3s64] Error 2
> 
> 
> IMO, we will need the following header in hash_tlb.c
> 
> +#include <kunit/visibility.h>

Yeah, I already added Ritesh's patch which had this include, so I
think we're all good now.


