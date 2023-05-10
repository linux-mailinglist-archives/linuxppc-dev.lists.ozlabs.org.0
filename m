Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9AF6FDF77
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 16:02:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGcDR0Y08z3fWn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 00:02:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20221208.gappssmtp.com header.i=@dabbelt-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=xm7Lt7K+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=palmer@dabbelt.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20221208.gappssmtp.com header.i=@dabbelt-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=xm7Lt7K+;
	dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGcCX3P9cz3cj8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 00:01:58 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-64115eef620so50339840b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 07:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1683727315; x=1686319315;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8O+Xva6SSKUOzu8cD6VykU+fN8y+E0NtB9pirvzzQ9U=;
        b=xm7Lt7K+fM4a6fbPP7MIva3KYIsdEH2pn6NhTnqMZWDxfwMmfjfuC2iA7TIUgSp9X7
         iapnslzabTi/3hpYysj/Y+Qpo/U+trS4YUbBrAymZCbRPQc2GdzYMvfSXRt75xnkQ7HH
         9YmGcBzN1XGEnBnDnk4hqc6szvJ0vnbRYHR7DYbbDIfxitLJRxJHVDjlkZx/sb2Dalmd
         NMN9fv1UEU3MEvWMv2OyK363gty+uPi7R5tqnoKyXja1AZDDzs7OuMx+xXPfQOPl3EBu
         5ahAyXiN9ZWDD9X3LQrrN5sPj7Sd7WcMwJ/uvJSD2iG4PimTEA2R4mrq6SpEbr7//1lB
         gm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683727315; x=1686319315;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8O+Xva6SSKUOzu8cD6VykU+fN8y+E0NtB9pirvzzQ9U=;
        b=OyGT47y9CHAtX0a2bC1VkDP3at9AFLQNl9pPvTb+Vo8qSARjHOlOTksLcxIu2uFMDk
         tECw3M0omuCBXNeGtO7Oy2DuQhUB7qRNlDQTOU+Wyl1jng+seEKNybZJTrAz8U2ut0oY
         O/ifrIIJtJWXQLfC2aaZLk9EtvpurNi95ZDF8Izm/MLTeBIvr6ZQ1GmWsZhQLwHG4nUS
         3iMWL25QS0pv0xl/x+2fnQOXi7EsbDy7j/+FRn/5gbLj/ERJPTgCWbAZc8F0ER4Q6Cx5
         sTwwUBh6Eiu3CnR91pstUY+lmcaE53bd4ul/mFqPu4WNr5dCaz2Kii+fJ8nvjewOHu0x
         5h2w==
X-Gm-Message-State: AC+VfDySOfM1O3jaZF6jefjekafgiLG4xkLimELrvpyv4GNRPoqn3yHl
	c2ReqVm84rKv/DV2I/vMoKuL3g==
X-Google-Smtp-Source: ACHHUZ5DO6A5G9Iwzn4Bquam+4PsWMq7WswXOCHPFyT+gtbX2VPfleyC7b8WGb0kQumaiIfRAr9lsw==
X-Received: by 2002:a17:902:9a03:b0:1ad:1be7:2a76 with SMTP id v3-20020a1709029a0300b001ad1be72a76mr1572089plp.10.1683727315241;
        Wed, 10 May 2023 07:01:55 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id q6-20020a170902dac600b001ac55a5e5eesm3819212plx.121.2023.05.10.07.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 07:01:54 -0700 (PDT)
Date: Wed, 10 May 2023 07:01:54 -0700 (PDT)
X-Google-Original-Date: Wed, 10 May 2023 07:01:48 PDT (-0700)
Subject: Re: [PATCH 14/23] riscv/hugetlb: pte_alloc_huge() pte_offset_huge()
In-Reply-To: <d1e54510-9ea2-edf-3851-fa7635ce1e5e@google.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: hughd@google.com
Message-ID: <mhng-fa58638c-1b42-4264-8bf1-55d4bc42a5e2@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-ia64@vger.kernel.org, david@redhat.com, Catalin Marinas <catalin.marinas@arm.com>, zhengqi.arch@bytedance.com, linux-kernel@vger.kernel.org, jcmvbkbc@gmail.com, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, imbrenda@linux.ibm.com, Will Deacon <will@kernel.org>, gerg@linux-m68k.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, willy@infradead.org, geert@linux-m68k.org, borntraeger@linux.ibm.com, alexghiti@rivosinc.com, hca@linux.ibm.com, linux-m68k@lists.linux-m68k.org, glaubitz@physik.fu-berlin.de, dave.anglin@bell.net, surenb@google.com, linux-arm-kernel@lists.infradead.org, chris@zankel.net, monstr@monstr.eu, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, kirill.shutemov@linux.intel.com, aneesh.kumar@linux.ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, rppt@kernel.org, mike.kravetz@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 09 May 2023 21:59:57 PDT (-0700), hughd@google.com wrote:
> pte_alloc_map() expects to be followed by pte_unmap(), but hugetlb omits
> that: to keep balance in future, use the recently added pte_alloc_huge()
> instead; with pte_offset_huge() a better name for pte_offset_kernel().
>
> Signed-off-by: Hugh Dickins <hughd@google.com>
> ---
>  arch/riscv/mm/hugetlbpage.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
> index a163a3e0f0d4..80926946759f 100644
> --- a/arch/riscv/mm/hugetlbpage.c
> +++ b/arch/riscv/mm/hugetlbpage.c
> @@ -43,7 +43,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm,
>
>  	for_each_napot_order(order) {
>  		if (napot_cont_size(order) == sz) {
> -			pte = pte_alloc_map(mm, pmd, addr & napot_cont_mask(order));
> +			pte = pte_alloc_huge(mm, pmd, addr & napot_cont_mask(order));
>  			break;
>  		}
>  	}
> @@ -90,7 +90,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
>
>  	for_each_napot_order(order) {
>  		if (napot_cont_size(order) == sz) {
> -			pte = pte_offset_kernel(pmd, addr & napot_cont_mask(order));
> +			pte = pte_offset_huge(pmd, addr & napot_cont_mask(order));
>  			break;
>  		}
>  	}

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
