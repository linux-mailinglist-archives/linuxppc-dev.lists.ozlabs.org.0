Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A716339D1A7
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 23:29:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FyqQg5cB9z307v
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 07:29:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Wu/fyJA4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Wu/fyJA4; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FyqQC1C23z2ypn
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 07:29:23 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 953E4613B6;
 Sun,  6 Jun 2021 21:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623014959;
 bh=4t5DawWhLmQPAFGRKhX1jFE4WEqbArxXgmERWe2C0xQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wu/fyJA4UR/3OsXx5PdnZuKJmqUDl6cQ0I5qOPmOobYB/YwD3loa7CHDMxmjDs7+O
 /+vTonUI3DKMDg+OJCEqqvIqeoGeqCBaFfCM6MGkwmW6KvTZO5CLkleOMNy5KmfR4d
 PteqC/M3+gPE1uiUsTSHvYSMYrpSkJ75a30BXywU3cSKzUfAv/A0+aJ76/IGuUYyhl
 S6LUi9EmnHUL5lEcDnAewWs8EsYomaOBUCef/cImLCqjaabNrEeHJoCWkyMWvCEGV1
 9+bVS1xXN0QGlOiLh2r3UXefQeesEuK/PQnscumw1S0RmHISk2eF6NrfUP8ytWcSpP
 sTzKK7DJdkKEw==
Date: Mon, 7 Jun 2021 00:29:09 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v2 00/15] init_mm: cleanup ARCH's text/data/brk setup code
Message-ID: <YL0+Jargm+y9aqx1@kernel.org>
References: <20210604070633.32363-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604070633.32363-1-wangkefeng.wang@huawei.com>
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
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Kefeng,

On Fri, Jun 04, 2021 at 03:06:18PM +0800, Kefeng Wang wrote:
> Add setup_initial_init_mm() helper, then use it
> to cleanup the text, data and brk setup code.
> 
> v2:
> - change argument from "char *" to "void *" setup_initial_init_mm()
>   suggested by Geert Uytterhoeven
> - use NULL instead of (void *)0 on h8300 and m68k
> - collect ACKs
> 
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-csky@vger.kernel.org
> Cc: uclinux-h8-devel@lists.sourceforge.jp
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: openrisc@lists.librecores.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-sh@vger.kernel.org
> Cc: linux-s390@vger.kernel.org
> Kefeng Wang (15):
>   mm: add setup_initial_init_mm() helper
>   arc: convert to setup_initial_init_mm()
>   arm: convert to setup_initial_init_mm()
>   arm64: convert to setup_initial_init_mm()
>   csky: convert to setup_initial_init_mm()
>   h8300: convert to setup_initial_init_mm()
>   m68k: convert to setup_initial_init_mm()
>   nds32: convert to setup_initial_init_mm()
>   nios2: convert to setup_initial_init_mm()
>   openrisc: convert to setup_initial_init_mm()
>   powerpc: convert to setup_initial_init_mm()
>   riscv: convert to setup_initial_init_mm()
>   s390: convert to setup_initial_init_mm()
>   sh: convert to setup_initial_init_mm()
>   x86: convert to setup_initial_init_mm()

I might be missing something, but AFAIU the init_mm.start_code and other
fields are not used really early so the new setup_initial_init_mm()
function can be called in the generic code outside setup_arch(), e.g in
mm_init().
 
>  arch/arc/mm/init.c                 | 5 +----
>  arch/arm/kernel/setup.c            | 5 +----
>  arch/arm64/kernel/setup.c          | 5 +----
>  arch/csky/kernel/setup.c           | 5 +----
>  arch/h8300/kernel/setup.c          | 5 +----
>  arch/m68k/kernel/setup_mm.c        | 5 +----
>  arch/m68k/kernel/setup_no.c        | 5 +----
>  arch/nds32/kernel/setup.c          | 5 +----
>  arch/nios2/kernel/setup.c          | 5 +----
>  arch/openrisc/kernel/setup.c       | 5 +----
>  arch/powerpc/kernel/setup-common.c | 5 +----
>  arch/riscv/kernel/setup.c          | 5 +----
>  arch/s390/kernel/setup.c           | 5 +----
>  arch/sh/kernel/setup.c             | 5 +----
>  arch/x86/kernel/setup.c            | 5 +----
>  include/linux/mm_types.h           | 8 ++++++++
>  16 files changed, 23 insertions(+), 60 deletions(-)
> 
> -- 
> 2.26.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
Sincerely yours,
Mike.
