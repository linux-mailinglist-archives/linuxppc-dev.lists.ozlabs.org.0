Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DB01CD334
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 09:47:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LChn2GNjzDqjZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 17:47:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.196;
 helo=mail-oi1-f196.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LCgD0GdpzDq5f
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 17:46:31 +1000 (AEST)
Received: by mail-oi1-f196.google.com with SMTP id 19so14314810oiy.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 00:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2yJ6ElOmiCSyE9da4JBaYJBkgTCIAd7AfbCRMY3E6sk=;
 b=LgtCIfjpeV6efqtIU8T0RDPQdCinbEWIHmoe/olL5rdH5NDIjevolRA+/NJFavFM2F
 HK8nz99wihRK3tuSEgDMht5aJQDonNNCHhJvkUtw1hhlj1+RtejAUQpiUEHbCfXzQ9UP
 dy8x9SvtwDJqZbkVP2pKMWOZvt5mZ9ZukM+WFrtat9nAMrZXtmYtiIdy2fLMvEQaP1co
 M9sgIaa2dU580ieqpr5TM8ScJHgcig99WDGcKjgHk7k8SpCD0Dy+zZpNGrFE6ahJjNQn
 +yn6rF9d+thZqwtgZeosmntUIU2PdfjlFOpBl+WF68li5JvPp0Akd5g0e/5Xr+WMdX6R
 AbEg==
X-Gm-Message-State: AGi0PuamvtqZYCOREqo3sqKOqduLzM3xiXEUzvVHyoVv+Le+imu2de/q
 4pbGUjIWRhZCQImEgnJS7IoY7LUZ51UpveoXXfU=
X-Google-Smtp-Source: APiQypIoFxa7a3EUthZ/8xx0aZ//Vc0pDLpqFY6DB0zkXv6WP4wkoKn8ne3ghzK30RcpwYDHtmi30TMFV3MiIELEMLg=
X-Received: by 2002:aca:895:: with SMTP id 143mr18042949oii.153.1589183188927; 
 Mon, 11 May 2020 00:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200510075510.987823-1-hch@lst.de>
In-Reply-To: <20200510075510.987823-1-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 May 2020 09:46:17 +0200
Message-ID: <CAMuHMdXazsBw0mjJd0uFHQud7qbb5-Uw-PTDB3+-M=huRWOfgQ@mail.gmail.com>
Subject: Re: sort out the flush_icache_range mess
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-c6x-dev@linux-c6x.org,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Jessica Yu <jeyu@kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christoph,

On Sun, May 10, 2020 at 9:55 AM Christoph Hellwig <hch@lst.de> wrote:
> none of which really are used by a typical MMU enabled kernel, as a.out can
> only be build for alpha and m68k to start with.

Quoting myself:
"I think it's safe to assume no one still runs a.out binaries on m68k."
http://lore.kernel.org/r/CAMuHMdW+m0Q+j3rsQdMXnrEPm+XB5Y2AQrxW5sD1mZAKgmEqoA@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
