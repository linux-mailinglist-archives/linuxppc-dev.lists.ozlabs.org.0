Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 557AA1749C0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Feb 2020 23:34:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48VLnT1KsGzDrL1
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Mar 2020 09:34:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::242;
 helo=mail-oi1-x242.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=MJlh0jh6; dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48VLlv3bMCzDqlf
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Mar 2020 09:33:22 +1100 (AEDT)
Received: by mail-oi1-x242.google.com with SMTP id 5so1039685oiy.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Feb 2020 14:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0+qFmqhcgb7jhEPbeVLEVdCHOr+If3XHxdqQ1tb+5pc=;
 b=MJlh0jh6fKGmlMf8QKHfSMGKxkzGHEeUxIKuMK576jnOzp5ajBbWFd723+Nwz5sX5o
 kd5kFB1Qa4nMK4C2Quz1EtosMFhbFGty2TrTrSeM0926YL1M9TjPuncmtlZef3BqKcKO
 0QMDkTU7/GfTsJIR/w5n5LoqIVS0h8Ha+vMH2bvx31vmcGio+VmcVwwkaawh8iuK3FDK
 B8oJ2LCRKfwY4UJPa+Ufg0yoRxTMpdzcD2JzNOx//OiTA4E21r9KhphDTjUvXXJpa4mN
 qph+2qengVBm0C0Rc0eQp7M69RV9q8SQixDZKId1V2L1G6rpoNj9Qc0++zW1EeGd/ZTO
 X0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0+qFmqhcgb7jhEPbeVLEVdCHOr+If3XHxdqQ1tb+5pc=;
 b=ZOEgWVQAuT/5nnJPzjIEcg/28kq2URcY7RQCVuQnNkYJcRdVHvCo/OLIOg/kwxaa6s
 y0QdvL7+Zz46KJq3iOP0U0UaBIgx0Go3FyN7L75f6PHrSpYQlaLFa0CZGwripw/TYT2i
 JwOQ/shYF8jztsTpleoK9NAOYhPYQDfxY2R7aBsG/BxwClkywt/LaHYnq5WmCRwrF62M
 sGfpVTf1T8VrBaJVwTvkz6v+bTfpWsG80DjsETPwj2cQFDQnpOLgKyWqTbYIqQNJbznU
 PUOKpsR3sDszp4g1j8BOXPhZ9jEwTO1mjWpwP09Nv62lcS15oVyTWyX6mM3Qw+IlkPCx
 7DwQ==
X-Gm-Message-State: APjAAAXrq/vd/+d3Ks3Wk7lOyLHRadINt0/YJOTyd0fwxwvG4IipJyNb
 +BTzmiJm2qLgrEx251bqNkKTg4SDp82EYMAhA2lD1w==
X-Google-Smtp-Source: APXvYqyGoDfozeCQcvGtfIbG5zusEz6FXIH1C19GvJgWOw0G4+LzaZgF0KV8DfFmkR6MhUJ7WBGfGAzVDBqWpHKu+yI=
X-Received: by 2002:a54:4791:: with SMTP id o17mr6946593oic.70.1583015599612; 
 Sat, 29 Feb 2020 14:33:19 -0800 (PST)
MIME-Version: 1.0
References: <20200221182503.28317-1-logang@deltatee.com>
 <20200221182503.28317-5-logang@deltatee.com>
In-Reply-To: <20200221182503.28317-5-logang@deltatee.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Sat, 29 Feb 2020 14:33:08 -0800
Message-ID: <CAPcyv4j=bZ5KBPp6PbViERdDe+HZpV_W6qbSJupTNAzyfiK6xg@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] x86/mm: Introduce _set_memory_prot()
To: Logan Gunthorpe <logang@deltatee.com>
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
Cc: X86 ML <x86@kernel.org>, linux-ia64@vger.kernel.org,
 Linux-sh <linux-sh@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, platform-driver-x86@vger.kernel.org,
 Linux MM <linux-mm@kvack.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 linux-s390 <linux-s390@vger.kernel.org>, David Hildenbrand <david@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Michal Hocko <mhocko@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Eric Badger <ebadger@gigaio.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 21, 2020 at 10:25 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>
> For use in the 32bit arch_add_memory() to set the pgprot type of the
> memory to add.
>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: x86@kernel.org
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> ---
>  arch/x86/include/asm/set_memory.h | 1 +
>  arch/x86/mm/pat/set_memory.c      | 7 +++++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/arch/x86/include/asm/set_memory.h b/arch/x86/include/asm/set_memory.h
> index 64c3dce374e5..0aca959cf9a4 100644
> --- a/arch/x86/include/asm/set_memory.h
> +++ b/arch/x86/include/asm/set_memory.h
> @@ -34,6 +34,7 @@
>   * The caller is required to take care of these.
>   */
>
> +int _set_memory_prot(unsigned long addr, int numpages, pgprot_t prot);

I wonder if this should be separated from the naming convention of the
other routines because this is only an internal helper for code paths
where the prot was established by an upper layer. For example, I
expect that the kernel does not want new usages to make the mistake of
calling:

   _set_memory_prot(..., pgprot_writecombine(pgprot))

...instead of

    _set_memory_wc()

I'm thinking just a double underscore rename (__set_memory_prot) and a
kerneldoc comment for that  pointing people to use the direct
_set_memory_<cachemode> helpers.

With that you can add:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
