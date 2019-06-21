Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 794C14DEBD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 03:42:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VLz23wqPzDrLw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 11:42:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bZmwoFfL"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VLx24pHszDrL5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 11:40:36 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id s7so641288iob.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 18:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NZnurSBLJdIfkJgx/5dwcZZFf4ycxK72Auy3OJll/TE=;
 b=bZmwoFfLSb6kDiM4V+mKT/zgbkVVryUT3VZqZx3z8LCa30gAcwILhqnVzvCeC1axv2
 2VtrpAu1HntKfcuKnqIcXSlnA95ZJlIaoKqsrHOpUOhk/YcBOmPIT4SEuEXJsNHUGn1r
 ftjM+Ss/P0F6eEsNC5BxEWvXblnx95W7yWgMu+HfjYpeBlxg7zseR5IxmGLOC56SRfDK
 bWfiQZo296uPVmLZAEu8LNERSBpfJYSuUHDLK0wPZPUW7RH5mEf8/B0aSROBH4vD2iGW
 F8pL++I/ISEh1EO8XqmHFxjKc2akJGXrBBgGbAK5moVj+u1hKZm7L1NO5KCpaduBsr8N
 AAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NZnurSBLJdIfkJgx/5dwcZZFf4ycxK72Auy3OJll/TE=;
 b=d+HBVm/EKaf5wEpxGRtEimG/pt+8bVRtODylE4ZeIigsOvYiqfymZfk58uwyCWvN0L
 G2TOKFijKeCVXzl8vjT0w8HX4Vnek4/ZEeT9+CBu7V/4OM5oUKIG+980MDVn6Q/Lf7ZN
 mK/gBo9AEI2LXBvPZnoSAQmfdnQO561hFuCM5fBYObq2M0zEKxjWlQ68dIjw/PolzeGk
 tLg6Ihv40PkI2+zlTPj91RbIivbS7y+HnywbutxrC7xer67+YvvHmYzvbc4QvRZiJPNj
 erAzJKXXTUukWWcCtp+855QsqOrZoshqcWZy0q5QwkZfJPgzBgNdYMvTiBlQp8Lh/4i0
 Pw8w==
X-Gm-Message-State: APjAAAXbOuYB2BobAAd/QSHrD4HeIfB0urLgJr2rSSz9nSRL4+plpE5v
 A28Rec0uKF97E+XqpuRJC74WWN9jYbpHspjuPIA=
X-Google-Smtp-Source: APXvYqxBNFP14Ny1HpEdhqKlp2lSGyXI+MY93zfhyerR6bNQY9PKTsQuKJnzEgpVU9R+988hLPhXLG2Ed/sLtRjwRW0=
X-Received: by 2002:a5e:c70c:: with SMTP id f12mr22982280iop.293.1561081234147; 
 Thu, 20 Jun 2019 18:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190523074924.19659-1-hch@lst.de>
 <20190523074924.19659-5-hch@lst.de>
In-Reply-To: <20190523074924.19659-5-hch@lst.de>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 21 Jun 2019 11:40:23 +1000
Message-ID: <CAOSf1CE2UgF7-BtQj2SfQSUUsctg2boS_kSL-Cs-ugZe4=6N7Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] powerpc/powernv: remove the unused vas_win_paste_addr
 and vas_win_id functions
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, sukadev@linux.ibm.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 23, 2019 at 5:56 PM Christoph Hellwig <hch@lst.de> wrote:
>
> These two function have never been used since they were added to the
> kernel.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/powerpc/include/asm/vas.h              | 10 ----------
>  arch/powerpc/platforms/powernv/vas-window.c | 19 -------------------
>  arch/powerpc/platforms/powernv/vas.h        | 20 --------------------
>  3 files changed, 49 deletions(-)

Sukadev (+cc), what's the reason this is not being used?

IIRC the VAS hardware on P9 had some issues, but I don't know any of
the details.

> diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/vas.h
> index 771456227496..9b5b7261df7b 100644
> --- a/arch/powerpc/include/asm/vas.h
> +++ b/arch/powerpc/include/asm/vas.h
> @@ -167,14 +167,4 @@ int vas_copy_crb(void *crb, int offset);
>   */
>  int vas_paste_crb(struct vas_window *win, int offset, bool re);
>
> -/*
> - * Return a system-wide unique id for the VAS window @win.
> - */
> -extern u32 vas_win_id(struct vas_window *win);
> -
> -/*
> - * Return the power bus paste address associated with @win so the caller
> - * can map that address into their address space.
> - */
> -extern u64 vas_win_paste_addr(struct vas_window *win);
>  #endif /* __ASM_POWERPC_VAS_H */
> diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
> index e59e0e60e5b5..e48c44cb3a16 100644
> --- a/arch/powerpc/platforms/powernv/vas-window.c
> +++ b/arch/powerpc/platforms/powernv/vas-window.c
> @@ -44,16 +44,6 @@ static void compute_paste_address(struct vas_window *window, u64 *addr, int *len
>         pr_debug("Txwin #%d: Paste addr 0x%llx\n", winid, *addr);
>  }
>
> -u64 vas_win_paste_addr(struct vas_window *win)
> -{
> -       u64 addr;
> -
> -       compute_paste_address(win, &addr, NULL);
> -
> -       return addr;
> -}
> -EXPORT_SYMBOL(vas_win_paste_addr);
> -
>  static inline void get_hvwc_mmio_bar(struct vas_window *window,
>                         u64 *start, int *len)
>  {
> @@ -1268,12 +1258,3 @@ int vas_win_close(struct vas_window *window)
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(vas_win_close);
> -
> -/*
> - * Return a system-wide unique window id for the window @win.
> - */
> -u32 vas_win_id(struct vas_window *win)
> -{
> -       return encode_pswid(win->vinst->vas_id, win->winid);
> -}
> -EXPORT_SYMBOL_GPL(vas_win_id);
> diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
> index f5493dbdd7ff..551affaddd59 100644
> --- a/arch/powerpc/platforms/powernv/vas.h
> +++ b/arch/powerpc/platforms/powernv/vas.h
> @@ -448,26 +448,6 @@ static inline u64 read_hvwc_reg(struct vas_window *win,
>         return in_be64(win->hvwc_map+reg);
>  }
>
> -/*
> - * Encode/decode the Partition Send Window ID (PSWID) for a window in
> - * a way that we can uniquely identify any window in the system. i.e.
> - * we should be able to locate the 'struct vas_window' given the PSWID.
> - *
> - *     Bits    Usage
> - *     0:7     VAS id (8 bits)
> - *     8:15    Unused, 0 (3 bits)
> - *     16:31   Window id (16 bits)
> - */
> -static inline u32 encode_pswid(int vasid, int winid)
> -{
> -       u32 pswid = 0;
> -
> -       pswid |= vasid << (31 - 7);
> -       pswid |= winid;
> -
> -       return pswid;
> -}
> -
>  static inline void decode_pswid(u32 pswid, int *vasid, int *winid)
>  {
>         if (vasid)
> --
> 2.20.1
>
