Return-Path: <linuxppc-dev+bounces-7744-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6372A91D8D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 15:16:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zddh56GCLz3byj;
	Thu, 17 Apr 2025 23:16:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744895781;
	cv=none; b=TVWA4G6pf02vD3t3S8YcoHxvaIncUhceIUA3DjOfiIn1NsyTc8Rd0Os42JNHxKuYNExIsqYNTfcbcXZL0ZLI8KX9d7TSbacHuzp/P0WMN14CX6iD5uNMVfKW0bp7pFKVjFGZQDKhblunggdoy6xH6Q6E6TTmTU8eX2g5XJZZxAcnxLkD3ABcqXn5hJ5T7iPJvxoffimFZoA2pM7Z68tptbccn8364OH67/GleN0V8t7mO1ghOd7e8rE9iR4M7UtwNY80BEu0Gbstvm5h0JIYq2+ZN2MIFwirZ8YD37bC8+0x8smII5kR7zCe4IVT+hGCGpZ/acgVGxEVeUJLn1ymFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744895781; c=relaxed/relaxed;
	bh=NqfmpbjW7riguud7DMBTVyGF+ZF1AdVA9f8c2C7hnLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JV5vCg+Vu+Qtj+ANZn91IMa/4X0mbSLKdkA8Y61y0DB2nZWpv1IhpXVdu68K8xxWUJkzsCHItQybkLE5aLmMikOYsZIcemcyIGgDnandY1hyLv7LZ4ZeGMTDkdyVT3kzgX94XseALqvFmu48d/UZwzSwVAXLmN1ywJ0R9GGkRoLWAn2ZGlfN9sBjnRUNt6xP7aLP4IyBjuLpWdL7t5mT4SAx+YzD7TuCHeT6SLdc8k5tExcNmPJl6JOURypOA5xs3SLtJv/FFmfr9GQbLkeSS8uh+2IEUq5SU5sd+Co2YynYSVdSUrN+7OajgT4Uv93N2nxtijdmRNqrqonmBzZQcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t6ThyFqA; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t6ThyFqA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zddh45srBz3byh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 23:16:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E7021A4B394;
	Thu, 17 Apr 2025 13:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B78C4CEE4;
	Thu, 17 Apr 2025 13:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744895777;
	bh=JOB3Kk/EM3/vcVbO0LHbslX6iAjbGgIXo4UEDu68gq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t6ThyFqA8noKENc0TRm+jM7qkIhPqeNxxbNYDgUD1uF9by0kXywDqsDo5p/U9cuUE
	 YMMXm+EIDwh/MlXQbHRpZ9VAGvonfTIZLAeUM17+YAoAeFQkD0daIYSj0c5M23Y7ac
	 +gDbFX3ebm+od/yhd3ry9t3/q7ZjF0g+wWbfK8kmuIuE/+F9xPKuBJxd4pCCdSB/IH
	 Jep+YB1r1DIuhn2zqURutMz2MEm9klog/jRzeE+UjsmL16RwrkJal5yz131LSvZFiM
	 v+o2Pkyd3L8UbSkMr/tVN2Ctnkunw2kkSI//U6DYbmnbUXcetX6NZJxstjwNAtsdoV
	 knXwfFuq+hi5A==
Date: Thu, 17 Apr 2025 15:16:14 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 0/6] Apple/PASemi i2c error recovery fixes
Message-ID: <kw3iierscam5stq7igwxpj2std6hwc36y2xbbqliheorbaouxn@zspp5ltjxrus>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Sven,

> Hector Martin (3):
>       i2c: pasemi: Improve error recovery
>       i2c: pasemi: Enable the unjam machine
>       i2c: pasemi: Log bus reset causes
> 
> Sven Peter (3):
>       i2c: pasemi: Use correct bits.h include
>       i2c: pasemi: Sort includes alphabetically

I applied in i2c/i2c-host the two patches above, so that you can
start from patch 3 as there were a few little notes.

I didn't see necessary the Fixes tag in the bits.h patch so that
I removed it.

Thanks,
Andi

