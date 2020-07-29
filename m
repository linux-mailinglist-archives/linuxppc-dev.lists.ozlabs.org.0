Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55614231DB0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 13:53:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGsPb2wKLzDqhb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 21:53:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=shorne@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ErgMzYX2; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGs8c42M0zDqtK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 21:42:04 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id t6so14123114pgq.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 04:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FyoxCr0A58f1XavZrIV1VkDI4AyZt3GTW0GxGRW15PU=;
 b=ErgMzYX2rlBnfYHmvHv9Kb0jAk9sTy/cgwUC91LEM8hW88sSiXCtCju4DtSraYOdN6
 Iz7cbIFHeP/OokbCsIndQn1W0/LL6legP5rUG8YuTLcO1oJBa0Q3JVGulGwjco0UElqI
 VvU/wz6i9utUjGjHa4JZVJYJZv72u/uWssFs8dC69IKpZ4vHIedaLdUQ404Jx+JIDGcj
 xtC8Sy1W9N1QM1A5lPVwWKGR7s1VkCc/Z0Han0x8lhUlPGexDzIucGIkbsBs70Eg0SOc
 poCa7kET1lEBIE2/zAVCwyCXmjvm7W2acmjhWVo6kPWsms3mfhSxEZ1uLiCnzlFIY+r2
 7Ntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FyoxCr0A58f1XavZrIV1VkDI4AyZt3GTW0GxGRW15PU=;
 b=uWMJANUKQGU+HJafjvFy2Of7NDgMzetIrL5XvvwODGhySGEE9oNUnWKrAXqWcFukXU
 AMUAlQBo/hiU/6IRPZk3tU7Ok+oXpr7a7ZKa4Icxo5N6TQgUsfmhiHS6g14aXMI6WIs5
 d/Ql9iE7EzK+WwNa5sYwxTzoVTsjz5lW2JjS82w0Nj9OdToGNsqhldogbg1DNNUfjWQY
 hk6+KHKuNUxS3H0omStzduIkFGn7Pzipkv6MpC6vslxMDqDhw8kfKcQtNDvTI3C243KJ
 TU32lWfDxM5Ahp01GTbD/zVIj5O3fBIzDPSyB0SY9A9uW01SOAmAgBmFisO2cDXObVPl
 G9Dw==
X-Gm-Message-State: AOAM533cN+grXQHI6tdHK+3a+gjjen3+J28G/s8KUQmMu/s4Z9DA+dgw
 VJ2w8xNs9IZWT/qSwCv2M54=
X-Google-Smtp-Source: ABdhPJwp4puneP0dTsVKBe6dB1tdiT/38z6QwdAB9b3TkM+HxCNc29Y6zwoL2ht5YGJJkcQZn4i23Q==
X-Received: by 2002:a65:64c7:: with SMTP id t7mr27611626pgv.89.1596022921588; 
 Wed, 29 Jul 2020 04:42:01 -0700 (PDT)
Received: from localhost (g155.222-224-148.ppp.wakwak.ne.jp. [222.224.148.155])
 by smtp.gmail.com with ESMTPSA id y18sm2097780pff.10.2020.07.29.04.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 04:42:00 -0700 (PDT)
Date: Wed, 29 Jul 2020 20:41:57 +0900
From: Stafford Horne <shorne@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 05/15] h8300, nds32, openrisc: simplify detection of
 memory extents
Message-ID: <20200729114157.GF80756@lianli.shorne-pla.net>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-6-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728051153.1590-6-rppt@kernel.org>
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
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Mike Rapoport <rppt@linux.ibm.com>, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 28, 2020 at 08:11:43AM +0300, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Instead of traversing memblock.memory regions to find memory_start and
> memory_end, simply query memblock_{start,end}_of_DRAM().
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/h8300/kernel/setup.c    | 8 +++-----
>  arch/nds32/kernel/setup.c    | 8 ++------
>  arch/openrisc/kernel/setup.c | 9 ++-------
>  3 files changed, 7 insertions(+), 18 deletions(-)

Hi Mike,

For the openrisc part:

Acked-by: Stafford Horne <shorne@gmail.com>

> --- a/arch/openrisc/kernel/setup.c
> +++ b/arch/openrisc/kernel/setup.c
> @@ -48,17 +48,12 @@ static void __init setup_memory(void)
>  	unsigned long ram_start_pfn;
>  	unsigned long ram_end_pfn;
>  	phys_addr_t memory_start, memory_end;
> -	struct memblock_region *region;
>  
>  	memory_end = memory_start = 0;
>  
>  	/* Find main memory where is the kernel, we assume its the only one */
> -	for_each_memblock(memory, region) {
> -		memory_start = region->base;
> -		memory_end = region->base + region->size;
> -		printk(KERN_INFO "%s: Memory: 0x%x-0x%x\n", __func__,
> -		       memory_start, memory_end);
> -	}
> +	memory_start = memblock_start_of_DRAM();
> +	memory_end = memblock_end_of_DRAM();
>  
>  	if (!memory_end) {
>  		panic("No memory!");
> -- 
> 2.26.2
> 
