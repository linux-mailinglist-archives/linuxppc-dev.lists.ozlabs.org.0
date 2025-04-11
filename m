Return-Path: <linuxppc-dev+bounces-7595-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1595A85542
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 09:16:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYnzk357Yz3c5W;
	Fri, 11 Apr 2025 17:16:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744355794;
	cv=none; b=fEbC6hr9fqR0U7WxMjS7bj9ZPSyfCHkUWXqbeGkfTJ+TKadouidaxue6sbl5Pq3z8BVM8H4V793X5jW6Wil9Ojb/7x0nlK7+IQWKm+A9EQ8m7lmMZZ/0tdMICEe7pgLZ7+RCsWwOR7kn7IqlL3Vr6lJkl/p9x1tykVZoUlM0zLXunoiRoygYU3WZ5XZZTtcHOUbIqVqnMjI/IktuzFMC0jDDls/2840t2jhNkPmUpTSyGT2tc/Dj12V3yflbk/nhzMejdTmgFzhroBLyrkx31K5y6OKTvyFlGX3yjiXGubSqyuAkaaJbZsQ4QwZJtnSD8kYOimLJVR8/sVr65j/FyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744355794; c=relaxed/relaxed;
	bh=8AZYV1raCKCE7T+GJKC63E8g42JVSDuGR93rMhn9HOQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=NoMzgalIOx7No+5ME6EgcABNnplpsCiO4KJ8QvJrmOVZarITVdAohzGHkZKxGa9lTK8EeDk12HhSZvyenucz2kuJ6rjZ/QZZfHXOPoGHpXf+f+DAb4Ibu4dtoewMK/vr2SqpxhdQixpRzhed4k84cI0LiBHzqLMHgeOWhFPdvfPoMzzzD8DYgmm+0Ubu6F2xXuUTkmGrqiJ45ZUgAQYhMTjTytk8XJC3kLOu0goMCW/6CLlJ+LS0EJ6T884NifA5UVCVreOAoo4SXe2cMGoS8APGnuL4yorT4Ununp488jERNVcT3vUQe8P+4x7ICC4HqaemZFBhsmX23vaH1+/Qvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hEeXce0i; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hEeXce0i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYnzj4n9sz2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 17:16:33 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-224100e9a5cso18389835ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 00:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744355791; x=1744960591; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8AZYV1raCKCE7T+GJKC63E8g42JVSDuGR93rMhn9HOQ=;
        b=hEeXce0iCGY5STs7Xa9wo7vABlDUrWUkM5QuKVFuo0v/hNyPBDo0p7jKPgUQGfVeD5
         f+YWFmZ+bVjL8C/GcFPoRzvcsLKzIL1lyUI6ONKrOY96N/UnTr11Edu+s5jLtea3JXTF
         YSyVDxO0ZDCTtPIUVeiwu+yiPiWPwal95pHdxe0O2IrUP/g9ejs7CyBtiIDWmAbBYC9K
         X/WNHLTDmIbm0Bf+3m7+lxcfAGbXfHNd2QrLp0BSvGwZs62YLhWMfGYtg8D6PvtkpHw3
         urZ90OME2CM6aMoJjGAP9xxiGmYxcoRSTD9lCkLy2mZmPIt62h9hZIr+Cofj9cPU/nxD
         fgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744355791; x=1744960591;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8AZYV1raCKCE7T+GJKC63E8g42JVSDuGR93rMhn9HOQ=;
        b=ZfQ1RUa9S+uXA7BCWOTvC7B3XiWJujU3xuo0rWMB5l77vOgPZ0ClLjSlS8Bx3KHblK
         vSQvt6B4HUAqlJpEYDl0KGG5QUTAp+AkaRJUrCWJopPSV6N9dZzPx9tMMr4LDBrnsMkT
         ELzafXu0ra7gWu5nyI2uj5jMMFtrVT8+Nnd6bHRbmpZWDOPuKUNaK01Dxm1eA/jd5oiK
         el/HJnHaG8P/va/TN4OCYD/auZr5Iz0Gkl+WCZGQZcOrgHWduJRw/d2xZ7dSH6zfzajV
         Zd3VQVMh2gAZ7fVCoH2kAUyAeIR2nLLkAfyPckCReyL86EbnQD7ZzMyJZMA+977AFBfM
         cT0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlPV7kqDzzpjFdO8yeeJ8Yj/6eGwFFv5jMsM9aZFmgnxlx7Cn7d7kCn61OyK1nO93cbU4k01MfKh6LAgA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwFKXVmWrW3TBtcScONprWYu0Sg0LhWc9jQn+sMGkmDFvnlYW5R
	r/9FlnJG+jeGJhVT6qlfY/QnCIsR4WNYXq2e731RforSWQy5p3Nj
X-Gm-Gg: ASbGncusiLqTa10c4B6gjVaICoGtp+O7tJFyS2SvhOhVY15rHfAtsQrEj8IcyNfuyAH
	t99X22jNuZjRvKuNOldtTjQhZfdngbtmzGXS/jA94RFtWHla/KHoV9fHVmjJDN4ssmeujKq/HuH
	vvbtE3ZgQ88O2OmoogdFWUmXrNdStO0dVIz01mula2qAgEOCqXcBee2NgOK7xKZ6z/ZIMjirjvF
	6FLMKr0xAhx8k3ZsS+CsiUsIon+Gv+vaTYFekn63G6SZrPlVuLDL6fmaASyn6Ol10P2hr8JqOJL
	33JEZ+hhVpVNgbkpWc/dfQOJQGMU/VV8lQ==
X-Google-Smtp-Source: AGHT+IHEcvyi3TC9JEHNBrBd62VdoZ1tkH8a7fjLbKQXjCafKk3/popDo8PXG6WTmR/MWpJCm32MMg==
X-Received: by 2002:a17:903:1447:b0:223:5c33:56a2 with SMTP id d9443c01a7336-22bea4bd57fmr30624525ad.28.1744355791439;
        Fri, 11 Apr 2025 00:16:31 -0700 (PDT)
Received: from localhost ([220.253.99.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb5047sm42114385ad.170.2025.04.11.00.16.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 00:16:31 -0700 (PDT)
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
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Apr 2025 17:16:24 +1000
Message-Id: <D93MIOI9YLAD.1WDMNT59MMEM2@gmail.com>
Cc: "Hugh Dickins" <hughd@google.com>, "Guenter Roeck" <linux@roeck-us.net>,
 "Juergen Gross" <jgross@suse.com>, "Jeremy Fitzhardinge" <jeremy@goop.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <kasan-dev@googlegroups.com>, <sparclinux@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-s390@vger.kernel.org>
Subject: Re: [PATCH v1 4/4] mm: Allow detection of wrong
 arch_enter_lazy_mmu_mode() context
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Alexander Gordeev" <agordeev@linux.ibm.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Andrey Ryabinin" <ryabinin.a.a@gmail.com>
X-Mailer: aerc 0.19.0
References: <cover.1744037648.git.agordeev@linux.ibm.com>
 <5204eaec309f454efcb5a799c9e0ed9da1dff971.1744037648.git.agordeev@linux.ibm.com>
In-Reply-To: <5204eaec309f454efcb5a799c9e0ed9da1dff971.1744037648.git.agordeev@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue Apr 8, 2025 at 1:11 AM AEST, Alexander Gordeev wrote:
> The lazy MMU batching may be only be entered and left under the
> protection of the page table locks for all page tables which may
> be modified. Yet, there were cases arch_enter_lazy_mmu_mode()
> was called without the locks taken, e.g. commit b9ef323ea168
> ("powerpc/64s: Disable preemption in hash lazy mmu mode").
>
> Make default arch_enter|leave|flush_lazy_mmu_mode() callbacks
> complain at least in case the preemption is enabled to detect
> wrong contexts.
>
> Most platforms do not implement the callbacks, so to aovid a
> performance impact allow the complaint when CONFIG_DEBUG_VM
> option is enabled only.
>
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>

This is a good debugging feature independent of how the fix
is done. I would just warn once, since it's not a bug for
the arch and could fire frequently if it fires at all.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  include/linux/pgtable.h | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index e2b705c14945..959590bb66da 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -232,9 +232,18 @@ static inline int pmd_dirty(pmd_t pmd)
>   * and the mode cannot be used in interrupt context.
>   */
>  #ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
> -#define arch_enter_lazy_mmu_mode()	do {} while (0)
> -#define arch_leave_lazy_mmu_mode()	do {} while (0)
> -#define arch_flush_lazy_mmu_mode()	do {} while (0)
> +static inline void arch_enter_lazy_mmu_mode(void)
> +{
> +	VM_WARN_ON(preemptible());
> +}
> +static inline void arch_leave_lazy_mmu_mode(void)
> +{
> +	VM_WARN_ON(preemptible());
> +}
> +static inline void arch_flush_lazy_mmu_mode(void)
> +{
> +	VM_WARN_ON(preemptible());
> +}
>  #endif
> =20
>  #ifndef pte_batch_hint


