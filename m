Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D121E1FFD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 12:43:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WVtN53SSzDqP2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 20:43:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::244;
 helo=mail-lj1-x244.google.com; envelope-from=jrdr.linux@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lOW+HXgz; dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WVqt4KDqzDqMM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 20:41:14 +1000 (AEST)
Received: by mail-lj1-x244.google.com with SMTP id l15so23512334lje.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 03:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Ry+3smoc7mCp1uPcR5k/a7m1osHOU0G7CR8vXULZZQ=;
 b=lOW+HXgzYB42cF/rhFtPrEV1DPp3z0Hcimy87m4EshA1FPzBMHRZg6ifPlxDGpwLaJ
 t7NhZQD7jdSFRRWTIyGXaX4Btb+hsajfJrvgP9QoRe7M5a+jXAIkXcBIOVET15jEprXK
 G94dJhAcGm88QDcosU8LybxInn1bd/YqidEIJR14HDh38uR5ntX/2G4oVZsCuoJI0S+o
 KHsPbh3IgWU23MyKcZFTmovaqJ5PxxaqzbB9nRsPyW5kFTi0b4OtGvpQV+1i8hAjyqeK
 0FyAdNRsuRZddDzsMTJ/Wo8zXD0RGt7SnppeeWspYbVceFkHJrF+89zayNmzIPXEuePH
 +wIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Ry+3smoc7mCp1uPcR5k/a7m1osHOU0G7CR8vXULZZQ=;
 b=p1WIJ5ZE8SGbQZbK0cF5SsbnTq/mS5IWxO8l2DfVyuye5xFrqT4bT+sVLuJ1rw8a/w
 88PtIbdKgoH3HfNzbf1BK2002bMwkKgkCsyRK8/mdeyhtaHSOLqUkfi9b0BRea75ksvQ
 gSgy1OW+QcahrjDV7hb5is4/sfu3SEA9ybh5JS8Q+iSo5p1w3563tbxqPG9sxHZUGgwu
 Ax8ZpFP9z7nB7TWxRgIdz8cPF6SkQzDzK74rDUQRz2sCbnoRzg7Ah63zhrtYtXlgL1ay
 YyZCJtSA23NswD2UfTNpMhHbUzSBtB+3Ce/oZb+kjQz9AGJ0mWHBqjj6Aiz91twKiBZE
 pyhQ==
X-Gm-Message-State: AOAM5308M8HDeKPHJhQzMZEm7KHiKoKagg51YZxh9mR3Yw0gwH5BqzXs
 SXiSKM6i+1lMXuwLHxDKiavKzHaoJ+uLlDsb6J4=
X-Google-Smtp-Source: ABdhPJyV5UNPT5wTZ5V1QRzvrkwK25GB+HGrijYwTV+7vkTwPuUSjO+tP4bYBkO+rleoRruyY3jfSDIh+hlPvjCFCSs=
X-Received: by 2002:a2e:9087:: with SMTP id l7mr318222ljg.430.1590489669805;
 Tue, 26 May 2020 03:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <1590396812-31277-1-git-send-email-jrdr.linux@gmail.com>
 <20200526075904.GE282305@thinks.paulus.ozlabs.org>
In-Reply-To: <20200526075904.GE282305@thinks.paulus.ozlabs.org>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Tue, 26 May 2020 16:10:43 +0530
Message-ID: <CAFqt6zbC4scJypctv-cWZYyq0TJb0OmB0Fq22-L54KVyoTTruw@mail.gmail.com>
Subject: Re: [linux-next PATCH] mm/gup.c: Convert to use
 get_user_{page|pages}_fast_only()
To: Paul Mackerras <paulus@ozlabs.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Linux-MM <linux-mm@kvack.org>,
 jolsa@redhat.com, Stephen Rothwell <sfr@canb.auug.org.au>,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, msuchanek@suse.de,
 John Hubbard <jhubbard@nvidia.com>, kvm-ppc@vger.kernel.org, acme@kernel.org,
 namhyung@kernel.org, linux-kernel@vger.kernel.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, pbonzini@redhat.com,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 26, 2020 at 1:29 PM Paul Mackerras <paulus@ozlabs.org> wrote:
>
> On Mon, May 25, 2020 at 02:23:32PM +0530, Souptick Joarder wrote:
> > API __get_user_pages_fast() renamed to get_user_pages_fast_only()
> > to align with pin_user_pages_fast_only().
> >
> > As part of this we will get rid of write parameter.
> > Instead caller will pass FOLL_WRITE to get_user_pages_fast_only().
> > This will not change any existing functionality of the API.
> >
> > All the callers are changed to pass FOLL_WRITE.
> >
> > Also introduce get_user_page_fast_only(), and use it in a few
> > places that hard-code nr_pages to 1.
> >
> > Updated the documentation of the API.
> >
> > Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
>
> The arch/powerpc/kvm bits look reasonable.
>
> Reviewed-by: Paul Mackerras <paulus@ozlabs.org>

Thanks Paul. This patch is merged through mm-tree.
https://lore.kernel.org/kvm/1590396812-31277-1-git-send-email-jrdr.linux@gmail.com/
