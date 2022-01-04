Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C96E4845D1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jan 2022 17:10:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JSyJQ0BnFz2yg5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jan 2022 03:10:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=cmarinas@kernel.org; receiver=<UNKNOWN>)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JSyHw5ShGz2x9M
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jan 2022 03:10:04 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AF5966151A;
 Tue,  4 Jan 2022 16:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1017CC36AED;
 Tue,  4 Jan 2022 16:09:57 +0000 (UTC)
Date: Tue, 4 Jan 2022 16:09:54 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v6 03/14] mm: Add len and flags parameters to
 arch_get_mmap_end()
Message-ID: <YdRxUhy/lmfwGKYI@arm.com>
References: <cover.1639736449.git.christophe.leroy@csgroup.eu>
 <f1014efff7d26279d8c687d759af9f709cd50453.1639736449.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1014efff7d26279d8c687d759af9f709cd50453.1639736449.git.christophe.leroy@csgroup.eu>
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
Cc: "alex@ghiti.fr" <alex@ghiti.fr>, Steve Capper <steve.capper@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "will@kernel.org" <will@kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 17, 2021 at 10:27:23AM +0000, Christophe Leroy wrote:
> Powerpc needs flags and len to make decision on arch_get_mmap_end().
> 
> So add them as parameters to arch_get_mmap_end().
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Steve Capper <steve.capper@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/processor.h | 4 ++--
>  mm/mmap.c                          | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
> index 6f41b65f9962..88c696350ace 100644
> --- a/arch/arm64/include/asm/processor.h
> +++ b/arch/arm64/include/asm/processor.h
> @@ -91,8 +91,8 @@
>  #endif /* CONFIG_COMPAT */
>  
>  #ifndef CONFIG_ARM64_FORCE_52BIT
> -#define arch_get_mmap_end(addr) ((addr > DEFAULT_MAP_WINDOW) ? TASK_SIZE :\
> -				DEFAULT_MAP_WINDOW)
> +#define arch_get_mmap_end(addr, len, flags) ((addr > DEFAULT_MAP_WINDOW) ? TASK_SIZE :\
> +									   DEFAULT_MAP_WINDOW)

Nitpick, move the "((addr > ...." on the following line. Either way,

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
