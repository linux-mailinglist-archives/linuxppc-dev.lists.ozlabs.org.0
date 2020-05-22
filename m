Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 414DC1DF110
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 23:27:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49TKMk1pCGzDql5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 May 2020 07:27:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.68; helo=mail-io1-f68.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49TKJb60pYzDr0T
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 May 2020 07:25:03 +1000 (AEST)
Received: by mail-io1-f68.google.com with SMTP id f4so12879184iov.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 14:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CTkSYFeyEICq4BQf/4yKxmOZ5ACYCOJzi1wgxve1pBQ=;
 b=ZhFQ2Z01pIqKeRxbDE5YVk3K873buQbofdF+b1/9ho2x7ZLCkSZ7IvG8rriQLkPx9V
 Ag4QZQ+ZsnNDtYJTV0yrIIOA7B1qvd4zi5kq+lGrVm9ZUcEODWHetRBcRXkEwOgmpPJ/
 4wlt24CyAVs6kBsO1N3ZYE6wUkRE5FCtKkaxnwOBwp3iPJxg7U7lfEMGO/YHjGtPKKzE
 6IaeDyhZlfAhL9gwor9bDZ+XtPgn5qW+GBdcJwQFaLi4+tUeoPwg6Foi//cWaOV9E8kG
 VX7z/GtvyaQGW/ZjHKov1xZJ5DA5B9DoNgmH7+2IDa1qQKS5sE29vx4doxc37hSyUKhh
 iZVA==
X-Gm-Message-State: AOAM533kFjSTb9xG4TyvaEQIT+KFClRdt+B0yu7+S2uy+tuqm1P5FLhY
 UmNwxFN/SYRSMf3dBbwdu/D83MmR
X-Google-Smtp-Source: ABdhPJwQzVSCWAjRH7GMSUjZGb5alEparS9g5L8h/a9sETx7y/dnAUXijrX0N8Lj+yeZKH7TihtoIw==
X-Received: by 2002:a6b:90c2:: with SMTP id s185mr4768697iod.35.1590182701070; 
 Fri, 22 May 2020 14:25:01 -0700 (PDT)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com.
 [209.85.166.179])
 by smtp.gmail.com with ESMTPSA id i84sm1508416ioa.34.2020.05.22.14.25.00
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2020 14:25:00 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id j2so12151974ilr.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 14:25:00 -0700 (PDT)
X-Received: by 2002:a05:6e02:54b:: with SMTP id
 i11mr7075081ils.50.1590182700558; 
 Fri, 22 May 2020 14:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200507185301.GA14333@embeddedor>
In-Reply-To: <20200507185301.GA14333@embeddedor>
From: Li Yang <leoyang.li@nxp.com>
Date: Fri, 22 May 2020 16:24:37 -0500
X-Gmail-Original-Message-ID: <CADRPPNQy5PE8vDLCu+XeZpXDab=OnrLcUjWG5F0=uy00QXOQnw@mail.gmail.com>
Message-ID: <CADRPPNQy5PE8vDLCu+XeZpXDab=OnrLcUjWG5F0=uy00QXOQnw@mail.gmail.com>
Subject: Re: [PATCH] treewide: Replace zero-length array with flexible-array
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 7, 2020 at 1:49 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
>
> struct foo {
>         int stuff;
>         struct boo array[];
> };
>
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
>
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
>
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
>
> sizeof(flexible-array-member) triggers a warning because flexible array
> members have incomplete type[1]. There are some instances of code in
> which the sizeof operator is being incorrectly/erroneously applied to
> zero-length arrays and the result is zero. Such instances may be hiding
> some bugs. So, this work (flexible-array member conversions) will also
> help to get completely rid of those sorts of issues.
>
> This issue was found with the help of Coccinelle.
>
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  include/linux/fsl/bestcomm/bestcomm.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied for next.  Thanks.

Regards,
Leo

>
> diff --git a/include/linux/fsl/bestcomm/bestcomm.h b/include/linux/fsl/bestcomm/bestcomm.h
> index a0e2e6b19b57..154e541ce57e 100644
> --- a/include/linux/fsl/bestcomm/bestcomm.h
> +++ b/include/linux/fsl/bestcomm/bestcomm.h
> @@ -27,7 +27,7 @@
>   */
>  struct bcom_bd {
>         u32     status;
> -       u32     data[0];        /* variable payload size */
> +       u32     data[]; /* variable payload size */
>  };
>
>  /* ======================================================================== */
>
