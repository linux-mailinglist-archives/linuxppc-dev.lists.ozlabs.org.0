Return-Path: <linuxppc-dev+bounces-6132-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9E4A32D0C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2025 18:11:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtPxJ5t7nz2yhT;
	Thu, 13 Feb 2025 04:11:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739380308;
	cv=none; b=fF5L+Ls08FwtKW7/iUgW19xMigyw+03JF7zK7kbdu6zrT+O3imYVOHLZ7T14M6+yuXfgUj3MLc/bHtdZB0nEhQzANWj/5h/tPeO8ieov4DKqVFEyW7SoXEGJG2hVfgkE5ijTavtcGx+xTkFymM66wlCRhNDlkawSN5Dp0vpn4SiLFBrkjs0u0R9qGnPZUVNkSdg11ZOxyKmBxV4fX2ehLPueH1JxH59K2yoEJ2FvR5S5mhQydT/fLFwc1tEKiEc2meK8V8gExGa1zb5UEAqRH+rOSxapthywSM6YgbIF1ZWXSu1ykrqGZyroX409Diw03PtQTXCbBDQAg9jM/tKkQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739380308; c=relaxed/relaxed;
	bh=UYT8AXeHwSuOZw0yu7hG8Ej/uv+EEusdL0gi3kC7KOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+xnw1ELb8GgsB5tPKzQgJAyU7iKNs0Zc4ygpMzKKTZuWNn5lkMP3iTxPHrTw0qswNdth3v8f5Y9/yfs1tOD/w35V6sO95fHn0WkZsnnwfesguC9by0cQTbWRkKmsdjXMWt0xmirdvQhGQF2lt0c9yWYgJig4Phm5EFXZcL9G/fiyCribhSYBGa36gLdfdgTI/oKmWhAtH9WhTF8aXgEfctpZQRBbxlZ5hu1VJvOBKsL17kBLHWEZDKUf6WyZDIGWdgnXq4RtcQWZG4jh0AI/x7lr3pEoMt8vbaIBLIX9brV2dqW2e41lGNCwME4B5OGR5EgbdS6wutFrjV/A70xlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YtPxH55BXz2yhD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2025 04:11:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 38FCFA40118;
	Wed, 12 Feb 2025 17:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F24C4CEDF;
	Wed, 12 Feb 2025 17:11:40 +0000 (UTC)
Date: Wed, 12 Feb 2025 17:11:37 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Morse <james.morse@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, wangkefeng.wang@huawei.com,
	Guohanjun <guohanjun@huawei.com>
Subject: Re: [PATCH v13 4/5] arm64: support copy_mc_[user]_highpage()
Message-ID: <Z6zWSXzKctkpyH7-@arm.com>
References: <20241209024257.3618492-1-tongtiangen@huawei.com>
 <20241209024257.3618492-5-tongtiangen@huawei.com>
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
In-Reply-To: <20241209024257.3618492-5-tongtiangen@huawei.com>
X-Spam-Status: No, score=-2.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Dec 09, 2024 at 10:42:56AM +0800, Tong Tiangen wrote:
> Currently, many scenarios that can tolerate memory errors when copying page
> have been supported in the kernel[1~5], all of which are implemented by
> copy_mc_[user]_highpage(). arm64 should also support this mechanism.
> 
> Due to mte, arm64 needs to have its own copy_mc_[user]_highpage()
> architecture implementation, macros __HAVE_ARCH_COPY_MC_HIGHPAGE and
> __HAVE_ARCH_COPY_MC_USER_HIGHPAGE have been added to control it.
> 
> Add new helper copy_mc_page() which provide a page copy implementation with
> hardware memory error safe. The code logic of copy_mc_page() is the same as
> copy_page(), the main difference is that the ldp insn of copy_mc_page()
> contains the fixup type EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR, therefore, the
> main logic is extracted to copy_page_template.S. In addition, the fixup of
> MOPS insn is not considered at present.

Could we not add the exception table entry permanently but ignore the
exception table entry if it's not on the do_sea() path? That would save
some code duplication.

> diff --git a/arch/arm64/lib/copy_mc_page.S b/arch/arm64/lib/copy_mc_page.S
> new file mode 100644
> index 000000000000..51564828c30c
> --- /dev/null
> +++ b/arch/arm64/lib/copy_mc_page.S
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <linux/linkage.h>
> +#include <linux/const.h>
> +#include <asm/assembler.h>
> +#include <asm/page.h>
> +#include <asm/cpufeature.h>
> +#include <asm/alternative.h>
> +#include <asm/asm-extable.h>
> +#include <asm/asm-uaccess.h>
> +
> +/*
> + * Copy a page from src to dest (both are page aligned) with memory error safe
> + *
> + * Parameters:
> + *	x0 - dest
> + *	x1 - src
> + * Returns:
> + * 	x0 - Return 0 if copy success, or -EFAULT if anything goes wrong
> + *	     while copying.
> + */
> +	.macro ldp1 reg1, reg2, ptr, val
> +	KERNEL_MEM_ERR(9998f, ldp \reg1, \reg2, [\ptr, \val])
> +	.endm
> +
> +SYM_FUNC_START(__pi_copy_mc_page)
> +#include "copy_page_template.S"
> +
> +	mov x0, #0
> +	ret
> +
> +9998:	mov x0, #-EFAULT
> +	ret
> +
> +SYM_FUNC_END(__pi_copy_mc_page)
> +SYM_FUNC_ALIAS(copy_mc_page, __pi_copy_mc_page)
> +EXPORT_SYMBOL(copy_mc_page)
[...]
> diff --git a/arch/arm64/lib/copy_page_template.S b/arch/arm64/lib/copy_page_template.S
> new file mode 100644
> index 000000000000..f96c7988c93d
> --- /dev/null
> +++ b/arch/arm64/lib/copy_page_template.S
> @@ -0,0 +1,70 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2012 ARM Ltd.
> + */
> +
> +/*
> + * Copy a page from src to dest (both are page aligned)
> + *
> + * Parameters:
> + *	x0 - dest
> + *	x1 - src
> + */
> +
> +#ifdef CONFIG_AS_HAS_MOPS
> +	.arch_extension mops
> +alternative_if_not ARM64_HAS_MOPS
> +	b	.Lno_mops
> +alternative_else_nop_endif
> +
> +	mov	x2, #PAGE_SIZE
> +	cpypwn	[x0]!, [x1]!, x2!
> +	cpymwn	[x0]!, [x1]!, x2!
> +	cpyewn	[x0]!, [x1]!, x2!
> +	ret
> +.Lno_mops:
> +#endif
[...]

So if we have FEAT_MOPS, the machine check won't work?

Kristina is going to post MOPS support for the uaccess routines soon.
You can see how they are wired up and do something similar here.

But I'd prefer if we had the same code, only the exception table entry
treated differently. Similarly for the MTE tag copying.

-- 
Catalin

