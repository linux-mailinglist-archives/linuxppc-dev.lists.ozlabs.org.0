Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DDC5AFB42
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 06:25:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMq1T49Mvz3c1S
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 14:25:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lC8kGHu1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lC8kGHu1;
	dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMq0t32nNz2xB1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 14:25:00 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id f124so4173196pgc.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Sep 2022 21:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=+MAqg8VyJ0vLKC3+leAMBB6rOKmHrOd3zNB3xXO/Tv8=;
        b=lC8kGHu14B5Lv2kbgux/5pi5ShVCC4wnBQSOjfWMokOrrwgBvGpl0HyvmsbwAYRZyn
         PrhSM5zroycyglZMphxSHuFrKwG7e0czRAObQ4BVXazxMoXbtOmZLAGqH3uK2CwhHBQV
         Vy9avMNhJPiKuwgpNyxRJ8fqZL+lvrLLezAr2ZCt/qLkd1DaA5YXMiqnFuoyhm6Fvkpt
         5Wr81ZJ1eOryvfq9pOB4h6iYx+chmgl7qqtTBFM2xehotf0y2zAyaX6CPRhObpNm79mQ
         Li24fLuvY5bTrYXPr8HiMgjKKStKbVU74nzr9Vc3kNbHMKv2vzVQry6jFYrn2/glh/Qj
         KDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=+MAqg8VyJ0vLKC3+leAMBB6rOKmHrOd3zNB3xXO/Tv8=;
        b=MmlNBToQyo3y13OCDd4/fwgcIURBECUgltkjqZKxeRQDs/fB8Sj+de9YtQvxwm2R1o
         CQ2oxcDvPmxokTSdpGHF9BFjDXvKrhtUy9EwdOHv/9RC9Fv4pewtutYbA4gRoi4nAuzc
         1G+IVMJeo/PQkhAjUnAQpHwATeCD+H8qCDw5b4V5smIzh96q7TQbkY1/RfhyiMbHlcd/
         6vLOzDSfvmiB/Bhb2weFrsio23SScqMu9obvgibROiL2Zn9+VHgkXkCMYEQU6YPsHe4y
         OEgpmyHUrAH/Npl+mjUfKLTZGiDDNQVeNbSPx3MmgfgLfK0nVQX8lP9smB4c1UOGIvU5
         wQcg==
X-Gm-Message-State: ACgBeo2vnyrqKUmqX95qy9V6Yyl70HmKCriGmOHlxd6xXC6clu0+oiEm
	qjVxK1We7ypa7n/hWFI24YBUlA6dqWg=
X-Google-Smtp-Source: AA6agR6jnGk3BARxzbos+X+DnwjTeLi/kg4LN26rm7F+8+4ymECjATDtMU0u7pYs4ymdJBeGp7TDhQ==
X-Received: by 2002:a05:6a00:1d1f:b0:53a:be2f:df38 with SMTP id a31-20020a056a001d1f00b0053abe2fdf38mr1853457pfx.20.1662524697277;
        Tue, 06 Sep 2022 21:24:57 -0700 (PDT)
Received: from localhost ([124.170.18.239])
        by smtp.gmail.com with ESMTPSA id p5-20020aa79e85000000b0053826eaa1c7sm11202875pfq.22.2022.09.06.21.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 21:24:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Sep 2022 14:24:52 +1000
Message-Id: <CMPVTG85ZRO2.V3C614SRD0RS@bobo>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH] powerpc: ideas to improve page table frag allocator
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.11.0
References: <20220905085055.2990058-1-npiggin@gmail.com>
 <9598b359-733e-bcef-0a13-8cd01c8f3e2f@csgroup.eu>
In-Reply-To: <9598b359-733e-bcef-0a13-8cd01c8f3e2f@csgroup.eu>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Sep 6, 2022 at 4:36 AM AEST, Christophe Leroy wrote:
>
>
> Le 05/09/2022 =C3=A0 10:50, Nicholas Piggin a =C3=A9crit=C2=A0:
> > The page table fragment allocator is a simple per-mm slab allocator.
> > It can be quite wasteful of space for small processes, as well as being
> > expensive to initialise.  It does not do well at NUMA awareness.
> >=20
> > This is a quick hack at addressing some of those problems, but it's not
> > complete. It doesn't support THP because it doesn't deal with the page
> > table deposit. It has has certain cases where cross-CPU locking could b=
e
> > increased (but also a reduction in other cases including reduction on
> > ptl). NUMA still has some corner case issues, but it is improved. So
> > it's not mergeable yet or necessarily the best way to solve the
> > problems. Just a quick hack for some testing.
> >=20
> > It save 1-2MB on a simple distro boot on a small (4 CPU) system. The
> > powerpc fork selftests benchmark with --fork performance is improved by
> > 15% on a POWER9 (14.5k/s -> 17k/s). This is just about a worst-case
> > microbenchmark, but would still be good to fix it.
> >=20
> > What would really be nice is if we could avoid writing our own allocato=
r
> > and use the slab allocator. The problem being we need a page table lock
> > spinlock associated with the page table, and that must be able to be
> > derived from the page table pointer, and I don't think slab has anythin=
g
> > that fits the bill.
>
> I have not looked at it in details yet, but I have the feeling that the=
=20
> handling of single-fragment architectures have disappeared.

Yes that's gone from my hack, it should be special-cased of course
to reduce or avoid unnecessary overhead.

Thanks,
Nick

>
> That's commit 2a146533bf96 ("powerpc/mm: Avoid useless lock with single=
=20
> page fragments").
>
> Thanks to that optimisation, all platforms were converted to page=20
> fragments with:
> - commit 32ea4c149990 ("powerpc/mm: Extend pte_fragment functionality to=
=20
> PPC32")
> - commit 737b434d3d55 ("powerpc/mm: convert Book3E 64 to pte_fragment")
>
>
> But if the optimisation is removed then I guess the cost will likely be=
=20
> higher than before.
>
> Christophe

