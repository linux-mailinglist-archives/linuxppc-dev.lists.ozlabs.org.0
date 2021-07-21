Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 372B63D094A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 08:59:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GV5zP1TLdz2yWs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 16:59:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=t3hopBQT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+75be22767c7c0793244e+6541+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=t3hopBQT; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GV5yy2CQdz2yMT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jul 2021 16:58:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=2Tg6rDmREVX1ceiTKGgiYnKUFpoX6FiU/JNm2fWqBkw=; b=t3hopBQTUruM/ENRFxNyEOoUC+
 5oJEQnciSH7H7I8MBiuNHyNhq7XNi/0H9lWN4pG4JSoChs5UkzgXC23DuhuRBWouYCC04xOkyZ1xV
 rR+ywDmkEKE0nnaaZ5dg8qfF0i8IuE7hW6GwCxdzrrEd18zJIIHurdno+HOqRNXejciU760Nh3WQx
 3AOh2nuu5mW+eF0HaQSNswWOgds534d05ahBQ3vI0rR4UkVwl5iObPL+K+tNrdsch3TtjxYoxhGnS
 hW5Qq+sSJ88nW4YhTG3gLQZhM3cY/AdifCtrpRz3dSoygFIOUXVfb1SJ8YEApxUrgC5VPetggN9c3
 7B06dTQQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1m66BG-008tyJ-Id; Wed, 21 Jul 2021 06:58:13 +0000
Date: Wed, 21 Jul 2021 07:58:10 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Anson Jacob <Anson.Jacob@amd.com>
Subject: Re: [RFC v2 1/2] ppc/fpu: Add generic FPU api similar to x86
Message-ID: <YPfFgkD+kcRaH8Ow@infradead.org>
References: <20210721044801.840501-1-Anson.Jacob@amd.com>
 <20210721044801.840501-2-Anson.Jacob@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721044801.840501-2-Anson.Jacob@amd.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Bhawanpreet.Lakha@amd.com, Harry Wentland <harry.wentland@amd.com>,
 Sunpeng.Li@amd.com, qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, roman.li@amd.com,
 Christoph Hellwig <hch@infradead.org>, Aurabindo.Pillai@amd.com,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 Christian K??nig <christian.koenig@amd.com>, bindu.r@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> +
> +/*
> + * Use kernel_fpu_begin/end() if you intend to use FPU in kernel context. It
> + * disables preemption so be careful if you intend to use it for long periods
> + * of time.
> + * TODO: If you intend to use the FPU in irq/softirq you need to check first with
> + * irq_fpu_usable() if it is possible.

Please avoid the overly lone lines comments.

> +extern bool kernel_fpu_enabled(void);
> +extern void kernel_fpu_begin(void);
> +extern void kernel_fpu_end(void);

No need for the externs.

> +/*
> + * Track whether the kernel is using the FPU state
> + * currently.

This all fits on a single line.

> +static bool fpu_support(void)
> +{
> +	if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
> +		return true;
> +	} else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) {
> +		return true;
> +	} else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) {
> +		return true;
> +	}

No need for the braces, or else after a return.  In fact this could
be simplified down to:

	return cpu_has_feature(CPU_FTR_VSX_COMP) ||
		cpu_has_feature(CPU_FTR_ALTIVEC_COMP) ||
		cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE));

> +	preempt_disable();
> +
> +#ifdef CONFIG_VSX
> +	if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
> +		enable_kernel_vsx();
> +		return;
> +	}
> +#endif
> +
> +#ifdef CONFIG_ALTIVEC
> +	if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) {
> +		enable_kernel_altivec();
> +		return;
> +	}
> +#endif
> +
> +#ifdef CONFIG_PPC_FPU
> +	if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) {
> +		enable_kernel_fp();
> +		return;
> +	}
> +#endif

All the features are defined away if not supported (and we already rely
on that in fpu_support()).  So this could become:

	if (cpu_has_feature(CPU_FTR_VSX_COMP))
		enable_kernel_vsx();
	else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP))
		enable_kernel_altivec();
	else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
		enable_kernel_fp();

Same for the disable path.
