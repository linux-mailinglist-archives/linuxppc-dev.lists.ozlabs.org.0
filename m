Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0101A1B05B8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 11:34:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495M313NQXzDqWs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 19:34:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495LwC2QHJzDqtV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 19:28:11 +1000 (AEST)
Received: by mail-ot1-f66.google.com with SMTP id m13so7476417otf.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 02:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XArWxGkJ+VyTPp7Wsn4dbWWlVRq/sh+tie0xFdY8Wzs=;
 b=kTm0kKyKYgk+E/89ApT8cz5JOrHSUHV0hyXaPdcQQrYdEvOzoWAENTLqSypWmG8z+1
 aCNsSmcu428K/pUSDVUXwcG+DwIdsBgsozDn2lobzfneqXg8iKmi3x6lMvdtVb10X+w+
 XPGaDhWSjumoYyoCLc57ej086vaVNa2WkzMOmGVPbcoOwKXCJDMNPeiMKh9bk+YxRKer
 myLAoRD9cZDo78LlTc+nZX3G+2DUSc7idSHjlpEEBiHRQhuuh9W03u0PQZJjYe5JXBc7
 o0IzWZ4XbXgw85GVIia751kFHq8LN14TlSh18qDUARKg+DjwtPVHwVlcBgkm5MoDyJ4Y
 08dg==
X-Gm-Message-State: AGi0PuarsuThoTud8i9YRXOLnsUyN+eVoFrGVSk4ewqEwKKEh5Gj8px/
 C8ahAKqQAa59Mma36mFyDsKJHYpZ1wBA9k4cVjA=
X-Google-Smtp-Source: APiQypKjsC6EXYlE5GmPZ4cHorgIglv7peKg70tltLFRlUNMnXipnoVRB6R66Yu9R4xLAwziPHJaRnQ/4in6/miu0rc=
X-Received: by 2002:a05:6830:3104:: with SMTP id
 b4mr5224618ots.250.1587374887535; 
 Mon, 20 Apr 2020 02:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200414131348.444715-1-hch@lst.de>
 <20200414131348.444715-25-hch@lst.de>
In-Reply-To: <20200414131348.444715-25-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Apr 2020 11:27:56 +0200
Message-ID: <CAMuHMdXktO=2n1tbE5RWRfE1CMd9bP-aHJQifO3J9HYxoQEuXQ@mail.gmail.com>
Subject: Re: [PATCH 24/29] mm: remove __vmalloc_node_flags_caller
To: Christoph Hellwig <hch@lst.de>
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
Cc: linux-hyperv@vger.kernel.org, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 the arch/x86 maintainers <x86@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Laura Abbott <labbott@redhat.com>,
 Nitin Gupta <ngupta@vflare.org>, Daniel Vetter <daniel@ffwll.ch>,
 Haiyang Zhang <haiyangz@microsoft.com>, linaro-mm-sig@lists.linaro.org,
 bpf <bpf@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Minchan Kim <minchan@kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christoph,

On Tue, Apr 14, 2020 at 3:21 PM Christoph Hellwig <hch@lst.de> wrote:
> Just use __vmalloc_node instead which gets and extra argument.  To be
> able to to use __vmalloc_node in all caller make it available outside
> of vmalloc and implement it in nommu.c.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

One more nommu failure below...

> --- a/mm/nommu.c
> +++ b/mm/nommu.c
> @@ -150,8 +150,8 @@ void *__vmalloc(unsigned long size, gfp_t gfp_mask)
>  }
>  EXPORT_SYMBOL(__vmalloc);
>
> -void *__vmalloc_node_flags_caller(unsigned long size, int node, gfp_t flags,
> -               void *caller)
> +void *__vmalloc_node(unsigned long size, unsigned long align, gfp_t gfp_mask,
> +               int node, const void *caller)
>  {
>         return __vmalloc(size, flags);

On Mon, Apr 20, 2020 at 10:39 AM <noreply@ellerman.id.au> wrote:
> FAILED linux-next/m5272c3_defconfig/m68k-gcc8 Mon Apr 20, 18:38
>
> http://kisskb.ellerman.id.au/kisskb/buildresult/14213623/
>
> mm/nommu.c:164:25: error: 'flags' undeclared (first use in this function); did you mean 'class'?

"return __vmalloc(size, gfp_mask);"

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
