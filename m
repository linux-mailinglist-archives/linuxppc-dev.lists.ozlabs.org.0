Return-Path: <linuxppc-dev+bounces-4062-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA429EFE63
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 22:37:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8Qlt0LSMz2yLJ;
	Fri, 13 Dec 2024 08:36:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734039417;
	cv=none; b=GktkkpQjerrokOn/fIe8TjxXMuFx2EoMsb6mBrFVkQrhCgBpq3eFYsCPMF2vkXDyUBr1jBNZ6T7WByTXsDllEgCAIXFsNIYJX+yejj6czFYxREwLlJa7wdfrAypWordfbgkPS3L7Fys2VnSZjnVD3BHKMac1m47jvGSF+ZHbVdaSNxk3bb0UJ/T7n8xoh1kcStgonU0w2/aKEmLq8vqgZo6bkM+H0JgXu1ScXbg+m8YoWFz8+lu6D4ejc9YTFyNcVBFPCmYLBBc/TWTi0gNCEWNBsE8sEo+vp7DpkHugHgi4uWjO99Njyz3H8YsH6/PWSyToI4BkzFS6jG3heJ759g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734039417; c=relaxed/relaxed;
	bh=gY8FI4zcSFBM0guyga7Q8nya1Km07C9q49GtO180Vbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRd+aTHdmEuZcZDCxk56KXAQxyOyhM7GfVR/2BdHPVbEigb7q4IsjXR4gXPO2vkwZfhIsuyxAiEnjRpZ2slyvCJtrzwWn3VHrZDEC9SS9FmN3P6d8DRRs4YSnxFp0ORMXVYvhSmJJJT9L1mbCPNQqaSIvJzAcYgl52Xn3fe6JyrFj3hECYxk5JzAP9FjKietLv1/OzPAIfSfGto4jtZkQgPlS0tgWdcD2hL9Ck/U/WtVp8tES6EprQZ7F/pMQUwtGL4XFAFE8W98c7S6ZdVqAKEI0ATpyQqZRUvXRvJkuK7VNzc+Xu1+t0Sm3vDEx5u59TTDsynqQE6qURK1jLzAqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MH2/FhwS; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MH2/FhwS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8Qls0W9Nz2yLB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 08:36:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 22037A42A91;
	Thu, 12 Dec 2024 21:35:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2649C4CECE;
	Thu, 12 Dec 2024 21:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734039414;
	bh=PHriXmjed1B69c3djyjvkmAXWJdj4dHw/YPneJYuUAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MH2/FhwShqp7EWFFC3jfr4d+2oZCa20/FnZU5iVe0RANd6fKcEAOyDhg0LLQyaNdv
	 pmcO1UA39z9T58KNzm3XqDgKZLt9DANUUG/t5ExAKz614iBk5RIziVkypwNC13qWI/
	 2jgx8/jNKF8KHoU70DoOStCkXzsY2DWe7Gy7xhwaxyfEWC7lCkz0hzy7gfwWy8zmlh
	 sfPlm+mOSKY2gWzBbJ//8l/5F8fh0C+09QXwhbUwyN/4/yF50D7F95w1IcIXPfDq5o
	 Rmn0xSAZwOmoInwAfNONVB8zNVzZ3YOg+2vIxg41k5G5rU83HUMrYl+rOEe76FzOCW
	 MmzPg4mkgbLrQ==
Date: Thu, 12 Dec 2024 13:36:52 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org, Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 00/12] Wire up CRC-T10DIF library functions to
 arch-optimized code
Message-ID: <20241212213652.GA39696@sol.localdomain>
References: <20241202012056.209768-1-ebiggers@kernel.org>
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
In-Reply-To: <20241202012056.209768-1-ebiggers@kernel.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Dec 01, 2024 at 05:20:44PM -0800, Eric Biggers wrote:
> This patchset is also available in git via:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-t10dif-lib-v2
> 
> This patchset updates the kernel's CRC-T10DIF library functions to be
> directly optimized for x86, arm, arm64, and powerpc without taking an
> unnecessary and inefficient detour through the crypto API.  It follows
> the same approach that I'm taking for CRC32 in the patchset
> https://lore.kernel.org/lkml/20241202010844.144356-1-ebiggers@kernel.org/
> 
> This patchset also adds a CRC KUnit test suite that covers multiple CRC
> variants, and deletes some older ad-hoc tests that are obsoleted by it.
> 
> This patchset applies to v6.13-rc1 plus my CRC32 patchset.  It can be
> retrieved from git using above command.  This is targeting 6.14.
> 
> Changed in v2:
>   - Rebased onto v6.13-rc1.
>   - Tweaked crc_t10dif_arch() for arm32 and arm64 to not call
>     crypto_simd_usable() more times than is necessary.
>   - Added patch removing redundant crc16_kunit.c which got added in v6.13-rc1.
>   - Made some small tweaks to crc_kunit.c.
>   - Listed Ard as a reviewer in the MAINTAINERS entry.
>   - Dropped scripts/crc from MAINTAINERS entry, as it hasn't been added yet.
>   - Clarified a commit message.
>   - Added Reviewed-by and Acked-by's.

FYI, this patchset is now in linux-next via the crc-next branch in my repo.
Additional reviews and acks would always be appreciated, of course.

- Eric

