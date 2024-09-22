Return-Path: <linuxppc-dev+bounces-1512-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A000397E113
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Sep 2024 13:19:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XBNtv0yw1z2xpv;
	Sun, 22 Sep 2024 21:19:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727003975;
	cv=none; b=R6KaYhO6TEADICJ9oRWb668T3gclmWC5bnOKFv8OKZN4cx3HLiaKiACjjfG2PxAdFkWA74oe8iMwmq+vWRbjgp7wK+wYih5mc9aibCy2ipk5ZSHFdQCVQuK1+7ill/JTlsFO6DV/mh1moRYIW3tpE26ae7Vh9b+EhBdGVVd2jvDb+sfsJa3e4u7a7ilJ/6Oub4KUDZL+CVy4+SWXSRm0FUcANBUQz0+48sQlFb5Y94xfl3HZl/xx9+qOd9KEdJxcijGD5DyEvN8RKbE6bVAEwdu+mA92Mlh8SykUP1ALecfdzltcf6UPW9zwFzyvxhnmPtMBskPaJmdHDCk9sZOnhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727003975; c=relaxed/relaxed;
	bh=0XGOYj44mxYlAIPacdVz2Xqqf2VHJVuoXCavyaxAiLM=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=WXfREKdOz7tR0aIqIh6RFtFwt7oLih90B5SgkSm08DlJhp8ssGjr1IFObIs6lAiAphNdjQdf7Gj4X75pzbarNrNly3G+Zh1tR9kG+xGXQz7soaU7n+KGzb5rkbCvXeeY7lzKWLNyic3RTf1jMR0wq7lO54Ub1Ab8QNZ6vNEj5XrQ7tR/ufiJUJTmnj1M21t7VoHnPtUqmsqYJWW4xKsKjqfxwsPvjcynN9s8Gp3VNAkrbMv3N+YBiF7dZAy9CIHezvqDdDDlU/5hOwAfvbCYnU8cIUXAXsO2P0lZ7XM7DVTVubxnIppMazZGtN7Vlmy3Y5WlRIz2+fGHo3AywjLrqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gyOIt0A7; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gyOIt0A7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XBNtt2PqWz2xfT
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Sep 2024 21:19:32 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-71781f42f75so3323340b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Sep 2024 04:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727003970; x=1727608770; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0XGOYj44mxYlAIPacdVz2Xqqf2VHJVuoXCavyaxAiLM=;
        b=gyOIt0A7wlm2CRc/yq7j94JytfQVAoYxprM4tvp8L7IBmu0ZwNbAQju4/msi1QCRQ2
         qLLJ3vQFUdf1Sfp3MrwVc9tF248bld/XIhmdj7JwYje+npNqouXSwY8RTc9yy25B+IBX
         YJu7ah52m9Z4IOo97baz6O2tqkt0+02CWAHlw3nmYyBfQwoxXwrxxG+53vzM6E8FTRda
         LEe7n00DYatGZKy6RWde1WvWNLKp0QA39HRj4o6QBUrCitoD+5M+lB6cco3ym1mHH5+j
         c2bLiiupu7c3exsEdbBsh84buedqSqODmG8JH1KMwvI6UQqc+syxB73D1lh0+XyZgyDm
         ywAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727003970; x=1727608770;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0XGOYj44mxYlAIPacdVz2Xqqf2VHJVuoXCavyaxAiLM=;
        b=gPfx9g6ihF7PsNLjIjzCRbtyispr3s5E56OIXLsiLZ7KFE9yxun9AloYMPoQqt9m5A
         m0qrKVGXhmfZpmNoKCSsFSsE0j7mczmJEM5Xl7Ceo3qWBvqrGVdhYl/hfBLvONn+Gxjm
         PEecLpBsEWF99zNpdHhWR8oJcI7yJbDfHMIoOETUrWnI62Gv3MtH/F8eWrGEDmAmv0Zc
         ObHKF/bnWyyJy/LZcqHIdDdS3ZvvpsBSUOydRM0mHoPZO4HekD2JhSMxZoL3iN63uKjk
         hIAAGym7Xl9I5/ZV/Aew/bKX/T+2T1Se9quzb28e00S6YguQZHbv5mWCQW3UOPe9DZ9C
         YB2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJQO4jxohbTcBDMPKhsQluMp2FmYUNFSsBMXgcwwDgkIAmdduHtrARQt+Ty0J9AH0C0pw66UwgG6D6Rv0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwO7/8apjKDuPhfq7f7XZf0ZJyXJYxvFRXKhYFQz5HTeOFGWEWg
	Zwrbg27SnK894JiUNqKsRD4N6vX8gfFS9CO6tc9V35qgAJFTTsCd
X-Google-Smtp-Source: AGHT+IEarJPEGCPBYFymlyfwJIi6kol8+OpmLQWTv1Xlfmdw6aA8QyOeHPPTb+TJxBDxV5NMZGWPRg==
X-Received: by 2002:a05:6a00:4b0c:b0:717:8deb:c195 with SMTP id d2e1a72fcca58-7199ce0c432mr12177581b3a.21.1727003970167;
        Sun, 22 Sep 2024 04:19:30 -0700 (PDT)
Received: from dw-tp ([171.76.87.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944a974dcsm12412341b3a.32.2024.09.22.04.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 04:19:29 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Luming Yu <luming.yu@shingroup.cn>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, jialong.yang@shingroup.cn, luming.yu@gmail.com
Cc: Luming Yu <luming.yu@shingroup.cn>
Subject: Re: [RFC PATCH] powerpc/tlb: enable arch want batched unmap tlb flush
In-Reply-To: <9BC3D1299ECE8428+20240918092515.2121-2-luming.yu@shingroup.cn>
Date: Sun, 22 Sep 2024 16:39:53 +0530
Message-ID: <87frpsymf2.fsf@gmail.com>
References: <9BC3D1299ECE8428+20240918092515.2121-2-luming.yu@shingroup.cn>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

Luming Yu <luming.yu@shingroup.cn> writes:

> From: Yu Luming <luming.yu@gmail.com>
>
> ppc always do its own tracking for batch tlb. By trivially enabling
> the ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH in ppc, ppc arch can re-use
> common code in rmap and reduce overhead and do optimization it could not
> have without a tlb flushing context at low architecture level.

I looked at this patch and other than the compile failure, this patch
still won't optimize anything. The idea of this config is that we want
to batch all the tlb flush operation at the end. By returning false from
should_defer_flush() (in this patch), we are saying we cannot defer
the flush and hence we do tlb flush in the same context of unmap.

Anyway, I took a quick look at ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
and I have a quick PoC for the same. I will soon post it.

-ritesh

>
> Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
> ---
>  arch/powerpc/Kconfig                |  1 +
>  arch/powerpc/include/asm/tlbbatch.h | 30 +++++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
>  create mode 100644 arch/powerpc/include/asm/tlbbatch.h
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index e94e7e4bfd40..e6db84dd014a 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -175,6 +175,7 @@ config PPC
>  	select ARCH_WANT_IPC_PARSE_VERSION
>  	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
>  	select ARCH_WANT_LD_ORPHAN_WARN
> +	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
>  	select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP	if PPC_RADIX_MMU
>  	select ARCH_WANTS_MODULES_DATA_IN_VMALLOC	if PPC_BOOK3S_32 || PPC_8xx
>  	select ARCH_WEAK_RELEASE_ACQUIRE
> diff --git a/arch/powerpc/include/asm/tlbbatch.h b/arch/powerpc/include/asm/tlbbatch.h
> new file mode 100644
> index 000000000000..484628460057
> --- /dev/null
> +++ b/arch/powerpc/include/asm/tlbbatch.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ARCH_PPC_TLBBATCH_H
> +#define _ARCH_PPC_TLBBATCH_H
> +
> +struct arch_tlbflush_unmap_batch {
> +	/*
> +         *
> +	 */
> +};
> +
> +static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
> +{
> +}
> +
> +static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
> +						struct mm_struct *mm,
> +						unsigned long uarddr)
> +{
> +}
> +
> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> +{
> +	/*ppc always do tlb flush in batch*/
> +	return false;
> +}
> +
> +static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
> +{
> +}
> +#endif /* _ARCH_PPC_TLBBATCH_H */
> -- 
> 2.42.0.windows.2

