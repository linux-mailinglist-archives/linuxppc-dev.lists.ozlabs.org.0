Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F7839F9A6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 16:54:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FztYS6sbWz3bwM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 00:54:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=rU2pKJ75;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e35;
 helo=mail-vs1-xe35.google.com; envelope-from=jrdr.linux@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rU2pKJ75; dkim-atps=neutral
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FztXz1mXtz2yyj
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 00:53:54 +1000 (AEST)
Received: by mail-vs1-xe35.google.com with SMTP id z15so10995643vsn.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 07:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2AJ2s6Swi7DKePDYPTjpM9W7XfKGuXx2NmxnXLQgYSU=;
 b=rU2pKJ75Y3/QHhh8al8WEHFkA1xcRM5SZMWEuWTFwhfJJj/V+31x/44DQ1/ocvOPg+
 HHLB+cX2JzVE7e8VyhwDv4Qz2FVNR+zh+m0OixPYjyc4fzjuukhztIpMy0r4QCqs9ENM
 rx2wn2LyftAjOv4hRMViR3COc1TqDPy9Jwcq9YGNqCboxfBQc5R+uHuQkEmoWcUMg/uD
 GgTRTBH9LOsD2SMP7YGpIDk7kjlQlU6IpzX1idxEjiKF6VTF7R6q/SsI4HkaBei2kO/c
 foGKHLzxbvnAfZr24OLQ0mXOUtMYfCqu0p3aPHXa31jtaApPg9eDz4MFF332lbCsxpOF
 vhTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2AJ2s6Swi7DKePDYPTjpM9W7XfKGuXx2NmxnXLQgYSU=;
 b=DSPl1M4E1RjW9NgLULgENqtiPdAIuYMXH/aFtjulfjZeQyHW0rwHB7CVlyc5DDmUxr
 xWwNpCYfcX/WcwwqKrW/0xX5p/3v2SSdZbQj+Sg+E5PaLyiBliIgCBn5rFBsZ0bFY9HI
 OSsMU5e0edXAVvByN2B8TRAfLeDg3G8ZOt+WW4xKke+dmVmoM8Pyq38vcsRs7wS3FBWV
 m9UQ/pmmQY6HH6+M5UF2kAC9Dgap9Dy3Kr1uSvSqQsvYYG7k4aKHKkqGTFLMC5U5gvPb
 lkfEjv6J3tXsFrF3vakQsAwlb8W6fphToT7bijqyyXy1f3EBoJwCNdsDsx3GZdUAq1ka
 dcXw==
X-Gm-Message-State: AOAM5338szCsFqNF1z4qWqgdsdKNrt2lshTAyMAx2M+g2HOke/w2D6Jk
 0ZYJpWRTWrxru2UHu8bd+7i5WrdWEvSus1YyoJM=
X-Google-Smtp-Source: ABdhPJyRLWrfWEbRY82WKzbAaqxe+Tz0Rq9l4OoSLSgaPe9ZQ71sH6V/8n9uYyj4peJXY7ySMuwi8lVHUHfIxXWhTlU=
X-Received: by 2002:a67:ed5a:: with SMTP id m26mr149235vsp.59.1623164030307;
 Tue, 08 Jun 2021 07:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210608083418.137226-1-wangkefeng.wang@huawei.com>
 <20210608083418.137226-2-wangkefeng.wang@huawei.com>
In-Reply-To: <20210608083418.137226-2-wangkefeng.wang@huawei.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Tue, 8 Jun 2021 20:23:38 +0530
Message-ID: <CAFqt6zYmCQ=wxEjnOJ6fgJWYQyFajBuxWD=UT_D-WjWUS_4pcw@mail.gmail.com>
Subject: Re: [PATCH v3 resend 01/15] mm: add setup_initial_init_mm() helper
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
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
 linux-sh@vger.kernel.org, X86 ML <x86@kernel.org>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 Linux-MM <linux-mm@kvack.org>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 8, 2021 at 1:56 PM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
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
>  include/linux/mm.h | 3 +++
>  mm/init-mm.c       | 9 +++++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index c274f75efcf9..02aa057540b7 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -244,6 +244,9 @@ int __add_to_page_cache_locked(struct page *page, struct address_space *mapping,
>
>  #define lru_to_page(head) (list_entry((head)->prev, struct page, lru))
>
> +void setup_initial_init_mm(void *start_code, void *end_code,
> +                          void *end_data, void *brk);
> +

Gentle query -> is there any limitation to add inline functions in
setup_arch() functions ?

>  /*
>   * Linux kernel virtual memory manager primitives.
>   * The idea being to have a "virtual" mm in the same way
> diff --git a/mm/init-mm.c b/mm/init-mm.c
> index 153162669f80..b4a6f38fb51d 100644
> --- a/mm/init-mm.c
> +++ b/mm/init-mm.c
> @@ -40,3 +40,12 @@ struct mm_struct init_mm = {
>         .cpu_bitmap     = CPU_BITS_NONE,
>         INIT_MM_CONTEXT(init_mm)
>  };
> +
> +void setup_initial_init_mm(void *start_code, void *end_code,
> +                          void *end_data, void *brk)
> +{
> +       init_mm.start_code = (unsigned long)start_code;
> +       init_mm.end_code = (unsigned long)end_code;
> +       init_mm.end_data = (unsigned long)end_data;
> +       init_mm.brk = (unsigned long)brk;
> +}
> --
> 2.26.2
>
>
