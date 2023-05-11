Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA9C6FFA29
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 21:34:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHMXJ64H6z3fRJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 05:34:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=AUpPwwIn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com; envelope-from=nphamcs@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=AUpPwwIn;
	dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHMWP3fMMz3fD8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 May 2023 05:33:20 +1000 (AEST)
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-757984bcbe0so189634485a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 12:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683833596; x=1686425596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSA86mvKjfheKvURQS7z/DOXYz4IyLlqu826nykCzL4=;
        b=AUpPwwIngqgmaT+f8mDnb2GaSJ3QJ6vZASOYU30I24wMRxIiRH+jCIbzsuhWabxNZY
         8skj9uzmrikgJBxFo0ROQfhP4Z84uV8Otp9jgjU6uKZOGNnTkYG5Fr4KKHriQpu2/oys
         VbBPiHWMlMO8iI4ALv05ND8RYOYe/tELZ0rZaAizQcwSGoQu03dgPkmWk9/pXWK/V/85
         +ox7dkWdnNCnK0dm2oIH6vHoHiQPMttITqT4ibj13pKvFWjD0VVIDnPFcBm6FTKYlSsD
         xWVJ0Oxe7o6IUC7vyChNq4uvBT241U2CzRE4Atw5O/KLdDNkptWxbI/nZ4f6QHAMrbbY
         QkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683833596; x=1686425596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FSA86mvKjfheKvURQS7z/DOXYz4IyLlqu826nykCzL4=;
        b=fils/81/i5DpKJNWBkPsyYuY2MIZKEQ6kNNk9LXcKeshBmBw/ueer7pme/FuBJivIm
         F+aH53C2D8heaeqzbpTzx6qvKpzgnEd+JadPK8nouoicfMNzO2008Jc9xVvTrzghfQ2C
         vTEzcLRPh0WQoFUW2Ap3CbxDYbgfUDKQYGQ5VbRgc/Sh7bztecg30OSmTEeVUQGlUjVq
         HZu9UXHgBetVM84OvHgxP1GVXmEWpUO8Asx0+UtIroCDS7GCVXdcq/its5zkUJA3GBkp
         esRRaJOZJbZ50TG9BGOd0y0KMap9MSEY8YcKcTyQvFwlwuSXhY8ulihJYAE2+99JNtkF
         c3Zw==
X-Gm-Message-State: AC+VfDwbeFIT6kOlqn5pPbm1Ak0HYzUbJwyRh2RyGc28Bh+0UkGR2Zpb
	/Se1ctWQ3GC0SSSIoTXOU9IhbPP1GC3RywNW408=
X-Google-Smtp-Source: ACHHUZ536w4s+o3K4sVhGJ32SpnObxsxbPReebI2cHtdx2hwXQdKHnKoiQGc6To+IHtoZ3d19ryv8Gu3DSJ7koSibXw=
X-Received: by 2002:a05:6214:c63:b0:5cc:e059:efa3 with SMTP id
 t3-20020a0562140c6300b005cce059efa3mr33601587qvj.23.1683833596286; Thu, 11
 May 2023 12:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230503013608.2431726-1-nphamcs@gmail.com> <20230503013608.2431726-4-nphamcs@gmail.com>
 <877ctfa6yv.fsf@mail.lhotse>
In-Reply-To: <877ctfa6yv.fsf@mail.lhotse>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 11 May 2023 12:33:05 -0700
Message-ID: <CAKEwX=MX+2Y-Qt5xSS_DF66X6aqrkOAUVi2vSt68K4y1_s4Lqw@mail.gmail.com>
Subject: Re: [PATCH v13 3/3] selftests: Add selftests for cachestat
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linux-api@vger.kernel.org, bfoster@redhat.com, kernel-team@meta.com, linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org, hannes@cmpxchg.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 10, 2023 at 8:21=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
>
> Nhat Pham <nphamcs@gmail.com> writes:
> > Test cachestat on a newly created file, /dev/ files, and /proc/ files.
> > Also test on a shmem file (which can also be tested with huge pages
> > since tmpfs supports huge pages).
> >
> > Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> ...
> > diff --git a/tools/testing/selftests/cachestat/test_cachestat.c b/tools=
/testing/selftests/cachestat/test_cachestat.c
> > new file mode 100644
> > index 000000000000..c3823b809c25
> > --- /dev/null
> > +++ b/tools/testing/selftests/cachestat/test_cachestat.c
> > @@ -0,0 +1,258 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +#define _GNU_SOURCE
> > +
> > +#include <stdio.h>
> > +#include <stdbool.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mman.h>
> > +#include <sys/mman.h>
> > +#include <sys/shm.h>
> > +#include <sys/syscall.h>
> > +#include <unistd.h>
> > +#include <string.h>
> > +#include <fcntl.h>
> > +#include <errno.h>
> > +
> > +#include "../kselftest.h"
> > +
> > +static const char * const dev_files[] =3D {
> > +     "/dev/zero", "/dev/null", "/dev/urandom",
> > +     "/proc/version", "/proc"
> > +};
> > +static const int cachestat_nr =3D 451;
> > +
> > +void print_cachestat(struct cachestat *cs)
> > +{
> > +     ksft_print_msg(
> > +     "Using cachestat: Cached: %lu, Dirty: %lu, Writeback: %lu, Evicte=
d: %lu, Recently Evicted: %lu\n",
> > +     cs->nr_cache, cs->nr_dirty, cs->nr_writeback,
> > +     cs->nr_evicted, cs->nr_recently_evicted);
> > +}
> > +
> > +bool write_exactly(int fd, size_t filesize)
> > +{
> > +     char data[filesize];
>
> On kernels with 64K pages (powerpc at least), this tries to allocate
> 64MB on the stack which segfaults.
>
> Allocating data with malloc avoids the problem and allows the test to
> pass.
>
> Looks like this commit is still in mm-unstable, so maybe Andrew can
> squash the incremental diff below in, if it looks OK to you. The diff is
> a bit big because I unindented the body of the function.
>
> cheers
>
>
> diff --git a/tools/testing/selftests/cachestat/test_cachestat.c b/tools/t=
esting/selftests/cachestat/test_cachestat.c
> index 9be2262e5c17..54d09b820ed4 100644
> --- a/tools/testing/selftests/cachestat/test_cachestat.c
> +++ b/tools/testing/selftests/cachestat/test_cachestat.c
> @@ -31,48 +31,59 @@ void print_cachestat(struct cachestat *cs)
>
>  bool write_exactly(int fd, size_t filesize)
>  {
> -       char data[filesize];
> -       bool ret =3D true;
>         int random_fd =3D open("/dev/urandom", O_RDONLY);
> +       char *cursor, *data;
> +       int remained;
> +       bool ret;
>
>         if (random_fd < 0) {
>                 ksft_print_msg("Unable to access urandom.\n");
>                 ret =3D false;
>                 goto out;
> -       } else {
> -               int remained =3D filesize;
> -               char *cursor =3D data;
> +       }
>
> -               while (remained) {
> -                       ssize_t read_len =3D read(random_fd, cursor, rema=
ined);
> +       data =3D malloc(filesize);
> +       if (!data) {
> +               ksft_print_msg("Unable to allocate data.\n");
> +               ret =3D false;
> +               goto close_random_fd;
> +       }
>
> -                       if (read_len <=3D 0) {
> -                               ksft_print_msg("Unable to read from urand=
om.\n");
> -                               ret =3D false;
> -                               goto close_random_fd;
> -                       }
> +       remained =3D filesize;
> +       cursor =3D data;
>
> -                       remained -=3D read_len;
> -                       cursor +=3D read_len;
> +       while (remained) {
> +               ssize_t read_len =3D read(random_fd, cursor, remained);
> +
> +               if (read_len <=3D 0) {
> +                       ksft_print_msg("Unable to read from urandom.\n");
> +                       ret =3D false;
> +                       goto out_free_data;
>                 }
>
> -               /* write random data to fd */
> -               remained =3D filesize;
> -               cursor =3D data;
> -               while (remained) {
> -                       ssize_t write_len =3D write(fd, cursor, remained)=
;
> +               remained -=3D read_len;
> +               cursor +=3D read_len;
> +       }
>
> -                       if (write_len <=3D 0) {
> -                               ksft_print_msg("Unable write random data =
to file.\n");
> -                               ret =3D false;
> -                               goto close_random_fd;
> -                       }
> +       /* write random data to fd */
> +       remained =3D filesize;
> +       cursor =3D data;
> +       while (remained) {
> +               ssize_t write_len =3D write(fd, cursor, remained);
>
> -                       remained -=3D write_len;
> -                       cursor +=3D write_len;
> +               if (write_len <=3D 0) {
> +                       ksft_print_msg("Unable write random data to file.=
\n");
> +                       ret =3D false;
> +                       goto out_free_data;
>                 }
> +
> +               remained -=3D write_len;
> +               cursor +=3D write_len;
>         }
>
> +       ret =3D true;
> +out_free_data:
> +       free(data);
>  close_random_fd:
>         close(random_fd);
>  out:
>

Oh this is nice! I had to make a similar fix in another test
of mine, but forgot about it in this context.

LGTM. For verification, I have applied the diff and test on
my own local setup. Things still pass.

Acked-by: Nhat Pham <nphamcs@gmail.com>
