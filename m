Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3804125BFC4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 12:59:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhyVy0CmBzDr6Z
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 20:59:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=q1yCvbZ8; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhyT43bn6zDqdW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Sep 2020 20:58:00 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id k15so2006863pfc.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Sep 2020 03:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XvxPmxtC0Bk31a11OwZrMge+dU3uUM43arNhidKdfeY=;
 b=q1yCvbZ8w01P8xuPxnIcZnEF3Hr07ImVQMcXxZgqnSncr+zba54pN3npDYYOjJXhbm
 XIqjp77VnYo3sJUa9nsc/OkcPZ2a5Y90boSJn50VaZ74haoOIwzEqzuApddDmuRsWA4t
 5LlNWMh47eFOI/t/pn9hyEBoN/9bMzFwyvwPxAFUkJ5XUIrhRgszLM/M8If1a/RC8WmZ
 6qZ5sWP8uitmybmf3cwkB0qwBCXj3OoX/HrhU+S1S1dHFyplWZAkXiQoi27iG3iQmbnm
 EQGK1zrcCUMrp+7WqPhSebA3XqqW6nM8d6/yeJZq7qMNXZRfKdpHSJtV5y0ESKKzTh/Z
 pJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XvxPmxtC0Bk31a11OwZrMge+dU3uUM43arNhidKdfeY=;
 b=qLILdHWwrUBQqUuwfWWqxgbm/BcDBynQDz5Rwv8MRXwEwLyW5JPrVrcCjDVDVDqFQX
 Vg+7gfoY43e1I+Dtxf0ZpQu6IWACBM1zyCqawlnPeuTaTq/o6lg/pAf3J03NR5iowPvg
 C2yrlZNimYTI8fHmaz723qBer/pnnKA6Jm4MXdFLt4BwPsjp3QjJ7h88xA0uSP0APO5B
 hsGlXJ6aaQU7pXFHoP81C742jIq/WwOJpPDf7OVlfvvFkDghzAsINGkuJycv9ECHowp1
 BARjMAKY+1Z0Cz91ZOPdkD6iKSC0xGT4EsWTDAJa0FNh8FKJXYUbjiu8+IsuxapFaWzT
 Hdjg==
X-Gm-Message-State: AOAM5308C3oBMnVKBVnHivCDJIHdqKCHHrnO0co4dmu7Y1DzTJuSDO1o
 VIsyVh24jHK6qox8fmEk/D3zoDQPRgVVUqofGQI=
X-Google-Smtp-Source: ABdhPJzWVo7SnArbq5BTD4S1cYWUGvNIOFTqyxYbAJGJHhEbl/k7IWPLuudMRiwWjgcOrgrKPL+6Qt7HKDzE/CcnN7Y=
X-Received: by 2002:a62:6083:0:b029:13c:1611:66c4 with SMTP id
 u125-20020a6260830000b029013c161166c4mr1648433pfb.15.1599130676695; Thu, 03
 Sep 2020 03:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200901221646.26491-1-nicoleotsuka@gmail.com>
 <20200901221646.26491-2-nicoleotsuka@gmail.com>
In-Reply-To: <20200901221646.26491-2-nicoleotsuka@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 3 Sep 2020 13:57:39 +0300
Message-ID: <CAHp75VcVJBSnPQ6NfdF8FdEDfM+oQ=Sr+cH5VGX4SrAqrgpf-g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dma-mapping: introduce dma_get_seg_boundary_nr_pages()
To: Nicolin Chen <nicoleotsuka@gmail.com>
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
Cc: linux-ia64@vger.kernel.org,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Matt Turner <mattst88@gmail.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, schnelle@linux.ibm.com, hca@linux.ibm.com,
 ink@jurassic.park.msu.ru, Thomas Gleixner <tglx@linutronix.de>,
 gerald.schaefer@linux.ibm.com, rth@twiddle.net,
 Tony Luck <tony.luck@intel.com>, linux-parisc@vger.kernel.org,
 linux-s390@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 2, 2020 at 1:20 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> We found that callers of dma_get_seg_boundary mostly do an ALIGN
> with page mask and then do a page shift to get number of pages:
>     ALIGN(boundary + 1, 1 << shift) >> shift
>
> However, the boundary might be as large as ULONG_MAX, which means
> that a device has no specific boundary limit. So either "+ 1" or
> passing it to ALIGN() would potentially overflow.
>
> According to kernel defines:
>     #define ALIGN_MASK(x, mask) (((x) + (mask)) & ~(mask))
>     #define ALIGN(x, a) ALIGN_MASK(x, (typeof(x))(a) - 1)
>
> We can simplify the logic here into a helper function doing:
>   ALIGN(boundary + 1, 1 << shift) >> shift
> = ALIGN_MASK(b + 1, (1 << s) - 1) >> s
> = {[b + 1 + (1 << s) - 1] & ~[(1 << s) - 1]} >> s
> = [b + 1 + (1 << s) - 1] >> s
> = [b + (1 << s)] >> s
> = (b >> s) + 1
>
> This patch introduces and applies dma_get_seg_boundary_nr_pages()
> as an overflow-free helper for the dma_get_seg_boundary() callers
> to get numbers of pages. It also takes care of the NULL dev case
> for non-DMA API callers.

...

> +static inline unsigned long dma_get_seg_boundary_nr_pages(struct device *dev,
> +               unsigned int page_shift)
> +{
> +       if (!dev)
> +               return (U32_MAX >> page_shift) + 1;
> +       return (dma_get_seg_boundary(dev) >> page_shift) + 1;

Can it be better to do something like
  unsigned long boundary = dev ? dma_get_seg_boundary(dev) : U32_MAX;

  return (boundary >> page_shift) + 1;

?

> +}

-- 
With Best Regards,
Andy Shevchenko
