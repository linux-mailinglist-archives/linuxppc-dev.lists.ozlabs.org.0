Return-Path: <linuxppc-dev+bounces-6516-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FA1A46B6E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 20:53:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z34sJ3kyfz3bpL;
	Thu, 27 Feb 2025 06:53:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04::f03c:95ff:fe5e:7468"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740599604;
	cv=none; b=SMMBa+9awCP5GFUs06JgSXBVxVEopzJY2Gk0HAm+n4dSRxiv6jGeTL6nTMPjPQz+AJhPv2TAFC3RhgfMqgrm3GPdQGMTiaO64UEOtitdwxmC4Cy7IGXlaL7+O1To1h0D9CVPjGRFsvgE4ypZ5QkGPhNqfXV740pMSCq8nnpa466S+bpfy3rcUHX8BHDzEyBJ6jjZUISmV3RGlCwioCQu5Rahlp/RMIGiG3s/WBSpSwiiGT2F7zLzSOxQJq+F0y1iZekWlx8tX+o3Lh9Q0+j12e4z8QJr0clvCx42BYKtSjvWz1f25d6aRx51DMIMkORI5dbq7ibSQOgdxeo82E5hfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740599604; c=relaxed/relaxed;
	bh=fbRXJvyiNGHNXBtM/hN/gX4zQBAPErfK0AysQSoWyaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QygHaALaV/0FnBWDPrvOkFrevDTCUiROzfQaTw8FDEXDe869hPPGHMEDZFwYkCLZBSbHfSvyV8Ry8P5dkn+2byDa9W2LytnrcGywI20kGp6E+tn7KcPGEVPDIKwo+wSa8HDYInNFlgpFoIDqhaxyhujc67vEVkaNfRd9DxifI0/GrwiJblw2/l7Im7rxLyvpm++q4czksQ9wWOZSLdOycuWEmJ4yeETnjGSkL48DZispzFXHGFaWYRNMSWbzxcezhQziHv4L5jA1EZ1C4R3CvgTBZ7/zIbnMa5xqYJxJ/gA+GhwVHTmnRz6XFOTD2XpFXumS+OodgK1OvktGtYwm7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=pass (client-ip=2600:3c04::f03c:95ff:fe5e:7468; helo=tor.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04::f03c:95ff:fe5e:7468; helo=tor.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04::f03c:95ff:fe5e:7468])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z34sH5Wn5z3bnx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2025 06:53:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71699611F1;
	Wed, 26 Feb 2025 19:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52EDBC4CED6;
	Wed, 26 Feb 2025 19:53:17 +0000 (UTC)
Date: Wed, 26 Feb 2025 19:53:15 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>
Subject: Re: [PATCH V3 5/5] mm: Rename GENERIC_PTDUMP and PTDUMP_CORE
Message-ID: <Z79xK3xJWm0vH5jH@arm.com>
References: <20250226122404.1927473-1-anshuman.khandual@arm.com>
 <20250226122404.1927473-6-anshuman.khandual@arm.com>
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
In-Reply-To: <20250226122404.1927473-6-anshuman.khandual@arm.com>
X-Spam-Status: No, score=0.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Feb 26, 2025 at 05:54:04PM +0530, Anshuman Khandual wrote:
> diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
> index 6cf4aae05219..b2931d1ae0fb 100644
> --- a/arch/arm64/include/asm/ptdump.h
> +++ b/arch/arm64/include/asm/ptdump.h
> @@ -7,7 +7,7 @@
>  
>  #include <linux/ptdump.h>
>  
> -#ifdef CONFIG_PTDUMP_CORE
> +#ifdef CONFIG_PTDUMP

Do we need this #ifdef at all? I haven't tried but usually, if the
feature is not enabled, the header file on its own should be harmless.

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

