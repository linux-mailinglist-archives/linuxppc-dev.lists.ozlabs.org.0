Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E3A74BFEC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 01:11:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=aC4JvRwH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qz5bs0gHlz3c1n
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 09:11:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=aC4JvRwH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qz5b21yBlz2yJT
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jul 2023 09:10:21 +1000 (AEST)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-c1aad78d5b2so6468033276.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Jul 2023 16:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688857819; x=1691449819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHBmqS8NwC99Z9QtRqyVciJnx9vOvvM1ypQPd7HicZU=;
        b=aC4JvRwH236lHuuVjAmz79NEJVSGu4y/lyV+aIB63wbpLAmWiLZozzV/UUf7clKQdy
         +r3PNew5EFTC1WrC/weTl9Rg4KI9C1loeR7rdfhvftl7bFZBvg+WX5rXFHoUHlwRccHG
         H5roPa9rNRZpaOd/D7jMAJ7mC2TUiS4BVHWIC8SW3iTtVDYqMAaGIgWohMK2lnVNoynB
         hJJZqyMf7CIF+Mjkeh/5GT66mCZKLJeXGdex0kJ7A1CYTZ4IW+10Kb5CuhiMT2XcDU2V
         USI9u190+1iYAZmtXcU8yuRMzj6cmZmjxLxj2oxypX5TZLV/7cn58g+QvYRPWbGj2IG9
         isgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688857819; x=1691449819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bHBmqS8NwC99Z9QtRqyVciJnx9vOvvM1ypQPd7HicZU=;
        b=gRwQl+1oLlRdbFyDMFm0djn2DvGB/HWdoUJBavV7JxiQFU7O4XBGVOTdzl355GHEt9
         oKH0FWYBfYOlMy/c7qZvD+PsJg4h0BdniPKaDaxfYYrFnIckw52aquqkl6v9xRUDCaJr
         kXImuvtwHBMIl/33YMVNXkoBtPSK3JxMP0i0lPeVGMZNNbwPo00suFDNbw/YutRumuym
         HNkIwqNwgqKQn4Ll+RpwWfsu9yfUShnbql6xUDgoF81JN+KZfi0JeVgB1kqCEJ8+yoh8
         5On5Uwpx70o5BkLjmVyJ/TPQZ5CCyxz5TSHWQAjLyBW/izIFSOGnNoCrziOd6zpJ72Pt
         2fOQ==
X-Gm-Message-State: ABy/qLaT/ZdTPtDU6yQtn+K6jhOoKylK7UespS2AsqQYtx0IJ2AkJ63A
	XSSgxnIDuCfrkl1aifmNmrC7/7xs4Te5f6JX+6R3aA==
X-Google-Smtp-Source: APBJJlGlS5xEDkfZpc19JrLy3RDko6OpCb3oW1HWrIZs49KQqhT9ol0NyMJ1vIr071SbtX0uRyAhsa+cCc58DLTyhYY=
X-Received: by 2002:a81:a114:0:b0:56d:2e66:bd55 with SMTP id
 y20-20020a81a114000000b0056d2e66bd55mr6858350ywg.3.1688857818674; Sat, 08 Jul
 2023 16:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <b5a5626-2684-899d-874b-801e7974b17@google.com>
In-Reply-To: <b5a5626-2684-899d-874b-801e7974b17@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 8 Jul 2023 16:10:07 -0700
Message-ID: <CAJuCfpGXC23r11-0jz+an01tO2BUOMpjJ93Dm3pc+EUQM=BXYg@mail.gmail.com>
Subject: Re: [PATCH] mm: lock newly mapped VMA with corrected ordering
To: Hugh Dickins <hughd@google.com>
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
Cc: jacobly.alt@gmail.com, regressions@lists.linux.dev, david@redhat.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org, peterx@redhat.com, regressions@leemhuis.info, liam.howlett@oracle.com, bagasdotme@gmail.com, gregkh@linuxfoundation.org, stable@vger.kernel.org, akpm@linux-foundation.org, ldufour@linux.ibm.com, Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 8, 2023 at 4:04=E2=80=AFPM Hugh Dickins <hughd@google.com> wrot=
e:
>
> Lockdep is certainly right to complain about
> (&vma->vm_lock->lock){++++}-{3:3}, at: vma_start_write+0x2d/0x3f
>                but task is already holding lock:
> (&mapping->i_mmap_rwsem){+.+.}-{3:3}, at: mmap_region+0x4dc/0x6db
> Invert those to the usual ordering.

Doh! Thanks Hugh!
I totally forgot to run this with lockdep enabled :(

>
> Fixes: 33313a747e81 ("mm: lock newly mapped VMA which can be modified aft=
er it becomes visible")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hugh Dickins <hughd@google.com>
> ---
>  mm/mmap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 84c71431a527..3eda23c9ebe7 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -2809,11 +2809,11 @@ unsigned long mmap_region(struct file *file, unsi=
gned long addr,
>         if (vma_iter_prealloc(&vmi))
>                 goto close_and_free_vma;
>
> +       /* Lock the VMA since it is modified after insertion into VMA tre=
e */
> +       vma_start_write(vma);
>         if (vma->vm_file)
>                 i_mmap_lock_write(vma->vm_file->f_mapping);
>
> -       /* Lock the VMA since it is modified after insertion into VMA tre=
e */
> -       vma_start_write(vma);
>         vma_iter_store(&vmi, vma);
>         mm->map_count++;
>         if (vma->vm_file) {
> --
> 2.35.3
