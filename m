Return-Path: <linuxppc-dev+bounces-6134-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3D6A32D64
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2025 18:25:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtQDf6BMXz30Ts;
	Thu, 13 Feb 2025 04:25:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739381106;
	cv=none; b=dA3NuoJ9fBCdOpAr5cq/5KBEw89yM6MZBm5tAhGcCeLphsx/TSdDpFAUp9PKgbdztX5FEipReP0+1rlZA2yc/hyCKTsGZMBsrXXTvWv/3vV2Ta6ObOQFrHFL0DVNGnzTj1OeU+Ko5T85dUvIfDAvOFNgRTMP6WzoN5BKQ/24orC3UG1sZzaxndFRdKlG+zQgNctzsoJKlgk2ZhqTV6oL1TtH4MKjUmPKytB/pvTrRImakjM+8NQO6yqRwXdhI0yrbsCUGIHFvxrnWhazzZ0xgUY/HImD3PyniqWLkxDrnUcTQevDP6bdAPLSg9Y+IyTjEhd9zlB2g5NQRPZm5+XW6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739381106; c=relaxed/relaxed;
	bh=7RkKsfBvAvrj9eLwmZX9evSj0Ctu7w2pjv9sWxqPMck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=goJrz7DZL0zPRkeuIr5QYe5ki4MA15uYlM20P6EA7F4LCcNx+iHwfrU2wxhIf3TJGOO5UKFJBrdMdVfdODVktiO4gCHd1p9fmRgQ6++SOP6ipYyah1gDkEXnp1V1+0+XLM9xG0R9x9ZFMpFTa7LXsHL5sk06XxAfY2st8FZrhvuWjeLdXuPnjS1Q7EvadqFMVumk5M31iD0qUWvpdqXlix2CmurB/9cNIWnqAJ9XpyPkjTCqj/kIQQMhhJR5jy6CHH7VrTVcK1Ba2IU5qwf2nDUgVbr6E3mMMO5/8zosM37eRZNF1+wTs8iPGEnDyapgRL8cow7B2A2X6lGkUiaUSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YtQDd51qRz30Pn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2025 04:25:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 64B2A5C0556;
	Wed, 12 Feb 2025 17:24:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36236C4CEE2;
	Wed, 12 Feb 2025 17:25:01 +0000 (UTC)
Date: Wed, 12 Feb 2025 17:24:58 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yury Khrustalev <yury.khrustalev@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-arch@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sandipan Das <sandipan@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	x86@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	nd@arm.com
Subject: Re: [RESEND v4 0/3] mm/pkey: Add PKEY_UNRESTRICTED macro
Message-ID: <Z6zZanGRGd15770_@arm.com>
References: <20250113170619.484698-1-yury.khrustalev@arm.com>
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
In-Reply-To: <20250113170619.484698-1-yury.khrustalev@arm.com>
X-Spam-Status: No, score=-2.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 13, 2025 at 05:06:16PM +0000, Yury Khrustalev wrote:
> Add PKEY_UNRESTRICTED macro to mman.h and use it in selftests.
> 
> For context, this change will also allow for more consistent update of the
> Glibc manual which in turn will help with introducing memory protection
> keys on AArch64 targets.
[...]
> Yury Khrustalev (3):
>   mm/pkey: Add PKEY_UNRESTRICTED macro
>   selftests/mm: Use PKEY_UNRESTRICTED macro
>   selftests/powerpc: Use PKEY_UNRESTRICTED macro
> 
>  include/uapi/asm-generic/mman-common.h               | 1 +
>  tools/testing/selftests/mm/mseal_test.c              | 6 +++---
>  tools/testing/selftests/mm/pkey-helpers.h            | 3 ++-
>  tools/testing/selftests/mm/pkey_sighandler_tests.c   | 4 ++--
>  tools/testing/selftests/mm/protection_keys.c         | 2 +-
>  tools/testing/selftests/powerpc/include/pkeys.h      | 2 +-
>  tools/testing/selftests/powerpc/mm/pkey_exec_prot.c  | 2 +-
>  tools/testing/selftests/powerpc/mm/pkey_siginfo.c    | 2 +-
>  tools/testing/selftests/powerpc/ptrace/core-pkey.c   | 6 +++---
>  tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c | 6 +++---
>  10 files changed, 18 insertions(+), 16 deletions(-)

Andrew, Arnd - are you ok if I take these patches through the arm64
tree?

Thanks.

-- 
Catalin

