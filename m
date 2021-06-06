Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1035C39D1B2
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 23:31:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FyqSv3lfvz3bsH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 07:31:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AHcE9g6b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AHcE9g6b; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FyqST3kRWz2xfT
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 07:31:21 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AEFDA613B6;
 Sun,  6 Jun 2021 21:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623015078;
 bh=ZtDz+Tx3gDJURxeLGuynFGZ8uxab5SNEIC7k5srsrBY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AHcE9g6brTgSAV+4xVNhxekKQlGM0mhAwBWD7XpWpqvtSKGR2QVl9LLO9Fp8mdhc+
 pc81xS+K6zgxjC9BvkiLbrgqfQSTHMEsv0LbOBaFKiII1tEOu5/8nloj4MSsU82HIa
 zrNuIDNh84AL4LuphasPGIwe4LNbg9inob5KFPcyQWr6fCOpQ1hseHxL1zqLaM0xud
 rcUhT1KG4HC3/rPAMCNByPC09q5k03V88CjP/YnrWLRCt6Qt1kUehiQTJUTNwYN4hW
 To0R1RL/ILuw03NT52wJ9AiDWAT36NN77oYd2Bnz8ID2ZeewkpMb92YVMYNyVavhgv
 L/9jySVl4Hzcg==
Date: Mon, 7 Jun 2021 00:31:09 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v2 01/15] mm: add setup_initial_init_mm() helper
Message-ID: <YL0+nZPViz5xzxca@kernel.org>
References: <20210604070633.32363-1-wangkefeng.wang@huawei.com>
 <20210604070633.32363-2-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604070633.32363-2-wangkefeng.wang@huawei.com>
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
 linux-sh@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Kefeng,

On Fri, Jun 04, 2021 at 03:06:19PM +0800, Kefeng Wang wrote:
> Add setup_initial_init_mm() helper to setup kernel text,
> data and brk.
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
> Cc: x86@kernel.org
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  include/linux/mm_types.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 5aacc1c10a45..e1d2429089a4 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -572,6 +572,14 @@ struct mm_struct {
>  };
>  
>  extern struct mm_struct init_mm;
> +static inline void setup_initial_init_mm(void *start_code, void *end_code,
> +					 void *end_data, void *brk)

I think it's not that performance sensitive to make it inline. It can be
placed in mm/init-mm.c with a forward declaration in mm.h

> +{
> +	init_mm.start_code = (unsigned long)start_code;
> +	init_mm.end_code = (unsigned long)end_code;
> +	init_mm.end_data = (unsigned long)end_data;
> +	init_mm.brk = (unsigned long)brk;
> +}
  
>  /* Pointer magic because the dynamic array size confuses some compilers. */
>  static inline void mm_init_cpumask(struct mm_struct *mm)
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
