Return-Path: <linuxppc-dev+bounces-14843-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 278CFCC8DE6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Dec 2025 17:51:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWfvs4rJDz307V;
	Thu, 18 Dec 2025 03:51:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765990297;
	cv=none; b=hex9DY4dT7sBOuQHKSWyD3nN/On+IXuck8Q3FYFNxU0cjb46trDBAQXrpvrfU2Oat7AIVsftjOE4I1sA2HuR0gfkfTm2hxEw25s0eSXOJn0dGxvSwtdTIFb/dX5n6hCGiOwVtejlX7DSgCRV+LBV0Y3nmGbJqxxhxbjyXKTjp2j7ZQUC+qJRsxXuMMm1d+GGN81wTFLO/wCnt9ufW68X0ToYTe0r7UmDoy3PYlnUft8sSk5tkWKy+HmPC4N8fvxPXq1idXbPPrCfZMWWYppOJUDhNB15OxUZhMj1pEmd80yWVnUS/az7+xw1SAQ6vB1N57jx2sQ96IWTeWNIZKAuzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765990297; c=relaxed/relaxed;
	bh=PAsD2vPOWvukoB2byMq+XQ93o9WOXXcOD9dnTih7p44=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=DpmMJ31aiY8sg6b1PkFMxSl2zKBp33UaHb3R4n1ruI1C1zmzR9P7tD/T6VaSiHqL4i8pTKbqKIVL6BOAz7wKiQdChlim6URG0srhbiI6bwXUXOQ/f+ARKr/UB0PJLggT8lyQrhzu42vv2TLdSQhaQKnjbmGUknubTkdYKN6crLFtYrHjOgiIBMZh30qCkKdFKe75bo94toC1c+Y6cHa/fWEsFT63InWhIbilLXhJ0+UaWEkXyrmJHRgThYpYEHgEYI+FeTijAWsiMkehLyKgvDrfFyh+0wa0mV21GiznmYJzxBwGabpOjGMWGb6hTwaRFSx1HTeEZxNMIqqtRhbZFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EvA5HoAW; dkim-atps=neutral; spf=pass (client-ip=209.85.214.182; helo=mail-pl1-f182.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EvA5HoAW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.214.182; helo=mail-pl1-f182.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWfvr11hwz304l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Dec 2025 03:51:35 +1100 (AEDT)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a09d981507so6675915ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 08:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765990233; x=1766595033; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PAsD2vPOWvukoB2byMq+XQ93o9WOXXcOD9dnTih7p44=;
        b=EvA5HoAWoWr6mFK8G7XI5WQkQHO0iq1owSUcU33AgjFzqCLwt5bnJEaeX+vbQUjdp+
         cNYymcX6dDJ5Q8XoLRDQXy/YzB3mUVBx8BTAN46yR86x5ST56ZdLxra2c/baG3UTgTCO
         2L6UNiOfDRf0QzhsLXk2qT1E8AWNEm85L6p7h4TAFjGf1N/3P5WX1ggJhp/FQu8pokIx
         9rJDuDrN/n4CNIqEoEpdW02UyPNDNLtMqKrnFBjEoLKRX+ijDnSmqudDNYN0hjyqEm6O
         fGgMihLG0x6hqjrNTVd2eXTMyhr1TF2/Comg3Bp0eWSdY77h5Bb8GwsUal7P73m7fmeO
         sk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765990233; x=1766595033;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PAsD2vPOWvukoB2byMq+XQ93o9WOXXcOD9dnTih7p44=;
        b=D0wgwHPuSDhA1MrxYc12Rdfm204w8j/RCEtNz3TePXiuV2Sd7ws2lqXmDmzr+S2w8j
         4WWIf62jrPV6KHg9+VFjYdOdmnEgM7bBBBdzis7wS79Bn/GfPc3fb5E9JEsDhPSaXpph
         Zl01J1znNboqDTIF4yJ3dChVJ6M8UffNgx+9LHzFVsWIjPVDBxAExFvCSFkM6N+Fan6A
         reS/UAdHY9w0IibKw9r+PoT0baWJy44efm9q04IRpZc/8EGJ752X8rn9Dt7eEiKW6NHf
         04OqFNm9fodrM1hB0GCWeUVtxXp1Hs6jIL2UM8TA320WhWW6JGeZOz2c3QtBuZgY0X2s
         NlCg==
X-Forwarded-Encrypted: i=1; AJvYcCXiRZZ6Bx7CSSaaK67os/o4IPCUNBZNLF2ixSlRrRKHWBlcOl3pKPMAofKDxKu9t7yWl85Y4tSG1R338N4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz50WiF/AHiqVGHYz01sCkaJw0rAEeH969egSCc2W1+py8USmuS
	z+6+20nZKtFO3RSwVPLhBkcfawzesj8brshC9WJkBR7K/gn97BNtDoZ+ovYawc1a
X-Gm-Gg: AY/fxX5p3nMCiRC3NaubofKkLiUit7EYcw/gt0k77jcsFdVLWuKT0Sx+bEeVSH5p86d
	7t6DFh8lcJz9WIRTE0PZAq5nZuBPL9curbxozv+BgJG3iVjY/ThPw3yPSWqQyraicOFyrf1HcrC
	GayerN6ZSH6/yknZLKq0MknrjezEAj2UvaPwneCKihSaMxWvsHH6+jTr01CcIdd4XG7IN/KXyg5
	JkjNMCbhNGsan28PGqj7uIR7nb8u7NKrtMXagG40PEdvl3ahTzkGPD4+gIplef2xPaWvNBqR4Mq
	f5+Ec+XVYZWZofFoW43oISaNZe4HYkCcIxGuVNygPkStAKbM8xumwN9FPIOl6i7Q0ivk8rF+5b4
	Behmt+M6pejJOivLzT/PtwGDOG8CCPvMQddrSHHy994RmUBd3FYF2UCOvufStfDg5qrSYKwp/US
	gJPp2VBQ==
X-Google-Smtp-Source: AGHT+IEVED3e+KdGXZXVcYIldELMqcKzBvn3EudeqgTtF1rVnKCzdaDs50jLdVQ3ZTdPF69nS2yCCg==
X-Received: by 2002:a17:902:d542:b0:2a0:b467:a7d0 with SMTP id d9443c01a7336-2a2cab16184mr316675ad.16.1765990232877;
        Wed, 17 Dec 2025 08:50:32 -0800 (PST)
Received: from dw-tp ([171.76.225.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29f177ff327sm172094595ad.101.2025.12.17.08.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:50:32 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Kevin Brodsky <kevin.brodsky@arm.com>
Subject: Re: [PATCH] powerpc/mm: export symbols for lazy_mmu_mode KUnit tests
In-Reply-To: <20251217163812.2633648-1-kevin.brodsky@arm.com>
Date: Wed, 17 Dec 2025 22:15:16 +0530
Message-ID: <878qf1kqg3.ritesh.list@gmail.com>
References: <20251216201403.4647a4f9861d3122ee9e90d7@linux-foundation.org> <20251217163812.2633648-1-kevin.brodsky@arm.com>
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
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Kevin Brodsky <kevin.brodsky@arm.com> writes:

> Upcoming KUnit tests will call lazy_mmu_mode_{enable,disable}.
> These tests may be built as a module, and because of inlining this
> means that symbols referenced by arch_{enter,leave}_lazy_mmu_mode
> need to be exported.
>
> Suggested-by: Ryan Roberts <ryan.roberts@arm.com>
> Suggested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---


Hi Kevin, 

I guess, this can give following errors:

../arch/powerpc/mm/book3s64/hash_tlb.c:33:1: error: data definition has no type or storage class [-Werror]
   33 | EXPORT_SYMBOL_IF_KUNIT(ppc64_tlb_batch); /* For lazy_mmu_mode KUnit tests */
      | ^~~~~~~~~~~~~~~~~~~~~~
../arch/powerpc/mm/book3s64/hash_tlb.c:33:1: error: type defaults to ‘int’ in declaration of ‘EXPORT_SYMBOL_IF_KUNIT’ [-Werror=implicit-int]
../arch/powerpc/mm/book3s64/hash_tlb.c:33:1: error: parameter names (without types) in function declaration [-Werror]
../arch/powerpc/mm/book3s64/hash_tlb.c:158:1: error: data definition has no type or storage class [-Werror]
  158 | EXPORT_SYMBOL_IF_KUNIT(__flush_tlb_pending); /* For lazy_mmu_mode KUnit tests */
      | ^~~~~~~~~~~~~~~~~~~~~~
../arch/powerpc/mm/book3s64/hash_tlb.c:158:1: error: type defaults to ‘int’ in declaration of ‘EXPORT_SYMBOL_IF_KUNIT’ [-Werror=implicit-int]
../arch/powerpc/mm/book3s64/hash_tlb.c:158:1: error: parameter names (without types) in function declaration [-Werror]
  AR      init/built-in.a
cc1: all warnings being treated as errors
make[6]: *** [../scripts/Makefile.build:287: arch/powerpc/mm/book3s64/hash_tlb.o] Error 1
make[5]: *** [../scripts/Makefile.build:556: arch/powerpc/mm/book3s64] Error 2


IMO, we will need the following header in hash_tlb.c

+#include <kunit/visibility.h>

-ritesh

>
> Andrew, please add this patch just before the last patch in the series
> ("mm: Add basic tests for lazy_mmu"). Thanks!
> ---
>  arch/powerpc/mm/book3s64/hash_tlb.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/powerpc/mm/book3s64/hash_tlb.c b/arch/powerpc/mm/book3s64/hash_tlb.c
> index fbdeb8981ae7..9e622519a423 100644
> --- a/arch/powerpc/mm/book3s64/hash_tlb.c
> +++ b/arch/powerpc/mm/book3s64/hash_tlb.c
> @@ -30,6 +30,7 @@
>  #include <trace/events/thp.h>
>  
>  DEFINE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
> +EXPORT_SYMBOL_IF_KUNIT(ppc64_tlb_batch); /* For lazy_mmu_mode KUnit tests */
>  
>  /*
>   * A linux PTE was changed and the corresponding hash table entry
> @@ -154,6 +155,7 @@ void __flush_tlb_pending(struct ppc64_tlb_batch *batch)
>  		flush_hash_range(i, local);
>  	batch->index = 0;
>  }
> +EXPORT_SYMBOL_IF_KUNIT(__flush_tlb_pending); /* For lazy_mmu_mode KUnit tests */
>  
>  void hash__tlb_flush(struct mmu_gather *tlb)
>  {
>
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> -- 
> 2.51.2

