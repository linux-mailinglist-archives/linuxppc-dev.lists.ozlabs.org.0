Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB3D10FA75
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 10:08:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Rx3q4ghDzDqVS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 20:08:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.195;
 helo=mail-oi1-f195.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Rx1p6wQ3zDqRR
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2019 20:06:52 +1100 (AEDT)
Received: by mail-oi1-f195.google.com with SMTP id v140so2481212oie.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Dec 2019 01:06:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=99SpjBDj/3zwk9C1FEoFJcHmxVqPzeCRBXa6juwGTEo=;
 b=DRJsxjlZ9iDGSjz72sJKad0CavewjSMeEdrKUfNMj1j4Kzz50U8czRCN3v/CvarbuK
 ZQ0N/SMf8H2wWeYlkk35RpHB4ezgve1kcrfp4BmR5ySXb+0enUFEsHkpycfuLiWscGGg
 1+r4ooFN51Ah3zzInR+zwk8Hc292/GjoyIawBY3Zv/VnNkNyIsIVU2CDL99a6P+ER5/a
 8wZ5C6esuTc2cI6XTeEtU8fITMw89Ej56ITDrTMDnMaTCXrY5DhXoA7bqOXeF71Nxc5Q
 ZZn6bb1y9URYv9km9/snE4Myk4cUr/Ggpo0YUAGjC9YnGJTS2AHaQSrna1Gqn+JM+zjQ
 rGLw==
X-Gm-Message-State: APjAAAWRtCaoexmLd69vAkV670Ew310G9N89iu3NGem7Fv1i9dwg9qsB
 7RwGeTz4n5rqhKrtC4iOsZeD4M603xQgz099dgQ=
X-Google-Smtp-Source: APXvYqwjoAhTRQ0xt52tIil49EnXS94YzS6iwjxlAYBuKV4vu5fc6aAklzn5FAd1MfYR6UoPe+55WjaSd8AcyJHVit0=
X-Received: by 2002:aca:4e87:: with SMTP id c129mr511543oib.153.1575364009649; 
 Tue, 03 Dec 2019 01:06:49 -0800 (PST)
MIME-Version: 1.0
References: <71cf82d5-5986-43b7-cf1c-acba429a89d6@c-s.fr>
 <3a95d445-1f5c-7750-f0de-ddc427800b3b@kernel.dk>
In-Reply-To: <3a95d445-1f5c-7750-f0de-ddc427800b3b@kernel.dk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Dec 2019 10:06:37 +0100
Message-ID: <CAMuHMdUzqnPpbSXB1JaY-+BbAvKno3akSYi6c8ZLQfLuOCC7rg@mail.gmail.com>
Subject: Re: Build failure on latest powerpc/merge (311ae9e159d8 io_uring: fix
 dead-hung for non-iter fixed rw)
To: Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Linux-sh list <linux-sh@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Pavel Begunkov <asml.silence@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jens,

On Fri, Nov 29, 2019 at 5:06 PM Jens Axboe <axboe@kernel.dk> wrote:
> On 11/29/19 6:53 AM, Christophe Leroy wrote:
> >     CC      fs/io_uring.o
> > fs/io_uring.c: In function =E2=80=98loop_rw_iter=E2=80=99:
> > fs/io_uring.c:1628:21: error: implicit declaration of function =E2=80=
=98kmap=E2=80=99
> > [-Werror=3Dimplicit-function-declaration]
> >       iovec.iov_base =3D kmap(iter->bvec->bv_page)
> >                        ^
> > fs/io_uring.c:1628:19: warning: assignment makes pointer from integer
> > without a cast [-Wint-conversion]
> >       iovec.iov_base =3D kmap(iter->bvec->bv_page)
> >                      ^
> > fs/io_uring.c:1643:4: error: implicit declaration of function =E2=80=98=
kunmap=E2=80=99
> > [-Werror=3Dimplicit-function-declaration]
> >       kunmap(iter->bvec->bv_page);
> >       ^
> >
> >
> > Reverting commit 311ae9e159d8 ("io_uring: fix dead-hung for non-iter
> > fixed rw") clears the failure.
> >
> > Most likely an #include is missing.
>
> Huh weird how the build bots didn't catch that. Does the below work?

Thanks, this fixes the same issue on SuperH:

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/fs/io_uring.c
> +++ b/fs/io_uring.c
> @@ -69,6 +69,7 @@
>   #include <linux/nospec.h>
>   #include <linux/sizes.h>
>   #include <linux/hugetlb.h>
> +#include <linux/highmem.h>
>
>   #define CREATE_TRACE_POINTS
>   #include <trace/events/io_uring.h>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
