Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BEE8FB890
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 18:12:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=bKe1+7t8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vtwc31qRHz3cYs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 02:12:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=bKe1+7t8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=yosryahmed@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtwbH2nzdz3cVW
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2024 02:12:10 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-579fa270e53so6537635a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2024 09:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717517521; x=1718122321; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Fq1N08ityDodrU5UqN/tu7ksF/MqwNuqjUfkSs8E40=;
        b=bKe1+7t84tQ34ghX8qTPvFdx1/TaKW3l6NK7GIlzISSgvcoKYXShwF+uncTyJp9Ldq
         2QKMgA323W1w62k+9J10o+H1TwgOCKsS27bAnz3xa7KPgcVi6lhMmN5WtxCpp0F8SPg+
         gCO/OjFHLgpP/NJnCyRIo0dhO2Bmk70tP63NRDSD+WHu3eppnHhm9p5W9vVam/uKAePj
         +B3nnVukKKqUlpfH9u1jWmKN+pQhlF7zZ7rZuJq1y59zNSbstozMK74Bj0JcSWDp5nPY
         MvOYfKr2QYiZNhDA8Rp7J528AhhmDif7YWYBBNF/SQP/C/uDZWVnJaJheOxFvB3FyOyd
         ceCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717517521; x=1718122321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Fq1N08ityDodrU5UqN/tu7ksF/MqwNuqjUfkSs8E40=;
        b=BYndBGLJSA4UqwhXZvKgbs3rYlJ9dPnvO8RbhGKUrSMqFf6flVEtF8JILqVnbkdC6k
         Lte2lycD+bXOrtdOZhjs64DfTnZirm1ejnXFMJ9WLERXZZ2ScJm3URZB5Ovq8YQQBG6W
         fRbli3FiR1eXpJFO7qW2XbxkTcOMw1blTepIiSE8oZoO3STHzZ6jNFvOViO3IPqKVWz6
         xlNVJPalHB+Fh08763tXxiQe9PCb/Ksa5teuV5Hnkhaq4PzCjZ9Dl+bCjfPqVcKOIqjE
         3/QEVfIDV+6ecnfHJWqFcyJ1ebR5MNC1kpuMt51jfCzQmwnQME9ZPUMSTyGhdMEPlpp3
         OJwA==
X-Forwarded-Encrypted: i=1; AJvYcCV6Wlbs4a6/jJI0ZZBKtH3cbzLpokg2bcil0LI6IdTbquHZRYi1XqLY9DhYhIWfm/zzmZkmwh83LEPJT2M36T4ALj3wc/KbkESixJKk6g==
X-Gm-Message-State: AOJu0YxFOHn5aASQTdnHhURGnXMTAn94UBargu3B+cmSwkWPNU1GbeeZ
	DHEJpwuFle7DREAx92uh/omTl2lbZpJOr2MMUKgZ0g8tpytoqqmDhYHD7tVLOsIXyD40U6iQg7S
	ZJLYjLVNiTAp6SHNlJUrVFjQFJg5AGsLhcD85
X-Google-Smtp-Source: AGHT+IHjToe9HZIMn9NzVD0RPeflJl/bU+DgMt9GMRZwk/Ij7exz/RMTsjf5+KctCPjgAFtdRjBi3oCz1G19/QxZrYg=
X-Received: by 2002:a17:906:35da:b0:a59:d2ac:3856 with SMTP id
 a640c23a62f3a-a699f66643bmr380966b.22.1717517520321; Tue, 04 Jun 2024
 09:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240508202111.768b7a4d@yea> <20240515224524.1c8befbe@yea>
 <CAOUHufZ-9NmzOKjLedvZFp0=N0LvRZn77qC6k1WXK+NHtKr=0w@mail.gmail.com>
 <CAOUHufZ36rQc8AfLtRv2QrEareysdvbprAEO5XkcG-FeDOxFLA@mail.gmail.com>
 <20240602200332.3e531ff1@yea> <20240604001304.5420284f@yea>
 <CAJD7tkbCRLdy0vD2Pd17fNrxHgkzW1VucN4qMkohLFLBLaaeCQ@mail.gmail.com> <20240604134458.3ae4396a@yea>
In-Reply-To: <20240604134458.3ae4396a@yea>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Tue, 4 Jun 2024 09:11:21 -0700
Message-ID: <CAJD7tkYjJJGthQ_8NukGw6Q9EYbLA=8sAH_7=B90KXEL6HWdSw@mail.gmail.com>
Subject: Re: kswapd0: page allocation failure: order:0, mode:0x820(GFP_ATOMIC),
 nodemask=(null),cpuset=/,mems_allowed=0 (Kernel v6.5.9, 32bit ppc)
To: Erhard Furtner <erhard_f@mailbox.org>
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
Cc: Nhat Pham <nphamcs@gmail.com>, Yu Zhao <yuzhao@google.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>, Chengming Zhou <chengming.zhou@linux.dev>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 4, 2024 at 4:45=E2=80=AFAM Erhard Furtner <erhard_f@mailbox.org=
> wrote:
>
> On Mon, 3 Jun 2024 16:24:02 -0700
> Yosry Ahmed <yosryahmed@google.com> wrote:
>
> > Thanks for bisecting. Taking a look at the thread, it seems like you
> > have a very limited area of memory to allocate kernel memory from. One
> > possible reason why that commit can cause an issue is because we will
> > have multiple instances of the zsmalloc slab caches 'zspage' and
> > 'zs_handle', which may contribute to fragmentation in slab memory.
> >
> > Do you have /proc/slabinfo from a good and a bad run by any chance?
> >
> > Also, could you check if the attached patch helps? It makes sure that
> > even when we use multiple zsmalloc zpools, we will use a single slab
> > cache of each type.
>
> Thanks for looking into this! I got you 'cat /proc/slabinfo' from a good =
HEAD, from a bad HEAD and from the bad HEAD + your patch applied.
>
> Good was 6be3601517d90b728095d70c14f3a04b9adcb166, bad was b8cf32dc6e8c75=
b712cbf638e0fd210101c22f17 which I got both from my bisect.log. I got the s=
labinfo shortly after boot and a 2nd time shortly before the OOM or the ksw=
apd0: page allocation failure happens. I terminated the workload (stress-ng=
 --vm 2 --vm-bytes 1930M --verify -v) manually shortly before the 2 GiB RAM=
 exhausted and got the slabinfo then.
>
> The patch applied to git b8cf32dc6e8c75b712cbf638e0fd210101c22f17 unfortu=
nately didn't make a difference, I got the kswapd0: page allocation failure=
 nevertheless.

Thanks for trying this out. The patch reduces the amount of wasted
memory due to the 'zs_handle' and 'zspage' caches by an order of
magnitude, but it was a small number to begin with (~250K).

I cannot think of other reasons why having multiple zsmalloc pools
will end up using more memory in the 0.25GB zone that the kernel
allocations can be made from.

The number of zpools can be made configurable or determined at runtime
by the size of the machine, but I don't want to do this without
understanding the problem here first. Adding other zswap and zsmalloc
folks in case they have any ideas.

>
> Regards,
> Erhard
