Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA59F526645
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 May 2022 17:37:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0CTC4HwWz3c7P
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 May 2022 01:37:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4L0CSq3QmXz3bqY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 May 2022 01:37:29 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A06B113E;
 Fri, 13 May 2022 08:36:58 -0700 (PDT)
Received: from lakrids (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE3C83F73D;
 Fri, 13 May 2022 08:36:55 -0700 (PDT)
Date: Fri, 13 May 2022 16:36:53 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH -next v4 5/7] arm64: mte: Clean up user tag accessors
Message-ID: <Yn57FT9k2XoU3MT+@lakrids>
References: <20220420030418.3189040-1-tongtiangen@huawei.com>
 <20220420030418.3189040-6-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420030418.3189040-6-tongtiangen@huawei.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-arm-kernel@lists.infradead.org,
 Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org,
 Xie XiuQi <xiexiuqi@huawei.com>, Will Deacon <will@kernel.org>,
 Guohanjun <guohanjun@huawei.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, James Morse <james.morse@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 20, 2022 at 03:04:16AM +0000, Tong Tiangen wrote:
> From: Robin Murphy <robin.murphy@arm.com>
> 
> Invoking user_ldst to explicitly add a post-increment of 0 is silly.
> Just use a normal USER() annotation and save the redundant instruction.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> Reviewed-by: Tong Tiangen <tongtiangen@huawei.com>

When posting someone else's patch, you need to add your own
Signed-off-by tag. Please see:

  https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

That said, the patch itself looks sane, and matches its original posting
at:

  https://lore.kernel.org/linux-arm-kernel/38c6d4b5-a3db-5c3e-02e7-39875edb3476@arm.com/

So:

  Acked-by: Mark Rutland <mark.rutland@arm.com>

Catalin, are you happy to pick up this patch as a cleanup?

Thanks,
Mark.

> ---
>  arch/arm64/lib/mte.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/lib/mte.S b/arch/arm64/lib/mte.S
> index 8590af3c98c0..eeb9e45bcce8 100644
> --- a/arch/arm64/lib/mte.S
> +++ b/arch/arm64/lib/mte.S
> @@ -93,7 +93,7 @@ SYM_FUNC_START(mte_copy_tags_from_user)
>  	mov	x3, x1
>  	cbz	x2, 2f
>  1:
> -	user_ldst 2f, ldtrb, w4, x1, 0
> +USER(2f, ldtrb	w4, [x1])
>  	lsl	x4, x4, #MTE_TAG_SHIFT
>  	stg	x4, [x0], #MTE_GRANULE_SIZE
>  	add	x1, x1, #1
> @@ -120,7 +120,7 @@ SYM_FUNC_START(mte_copy_tags_to_user)
>  1:
>  	ldg	x4, [x1]
>  	ubfx	x4, x4, #MTE_TAG_SHIFT, #MTE_TAG_SIZE
> -	user_ldst 2f, sttrb, w4, x0, 0
> +USER(2f, sttrb	w4, [x0])
>  	add	x0, x0, #1
>  	add	x1, x1, #MTE_GRANULE_SIZE
>  	subs	x2, x2, #1
> -- 
> 2.25.1
> 
