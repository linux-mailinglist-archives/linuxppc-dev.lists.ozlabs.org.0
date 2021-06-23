Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 172933B1BBB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 15:56:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G94Yp5p3Yz3bwB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 23:56:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dBTP92im;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22d;
 helo=mail-lj1-x22d.google.com; envelope-from=vincent.guittot@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dBTP92im; dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G94YL2ZNkz302G
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 23:56:03 +1000 (AEST)
Received: by mail-lj1-x22d.google.com with SMTP id r16so3103968ljk.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 06:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1f+5SV/sKKdVD+KkZH0IXa6QMqcFSI8JGYCiF1TdD4k=;
 b=dBTP92imt0I9HU+05kls9sQhXxMKLcysBBwH+S4miexo3dqJyu+O+rQynNCgaX0qdm
 eNPI+YUE0oApsiGFtxNHOpXVnRmJS5miXMCAGHXVM8wmxqDMV7gj3eBgohN9RLeCGC9P
 49YJ1XlgShyegR64ROQ7iLwhFZ91jWP5BTcJdyWzYgIznVd05+5H5YHy3hUWHRZV/wmL
 IWGvSS0mzQOYseCSV5uVWAtmZFvzYKVVyQDvG3I0lBJkJFiZWTUpMWXkltpwtLOtsy9c
 jESTDl3aZ8tl/nRmvr5gfs+qDttx04H/Kf+Y1+oMB1rBrNw2gofObjYCgkVyr2zimNVm
 5Kaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1f+5SV/sKKdVD+KkZH0IXa6QMqcFSI8JGYCiF1TdD4k=;
 b=kK8JlCLeWbnMNIK3VSgo0DK4nXQ8oDdfcnXC7+3OVWXJhUCdSfQ1qk2N+BRV9TvmPx
 fqhd7u3mxdsC7hSLWQcwZ9cO9T6UFYwcd2b6gVhveRU59uQ0y2FKfcKD1jCYln7QsfFC
 nR9Fm81l06MBVfwgAr7VG2yRknK8BBqkeZhpmX5Rtywy2VC02O3FDgtOzbbBpTIy3YqE
 pu8NE5I+GPeenbi2FkLXoh9cG2I9x7mbTFevtykkdZlFEgHerUmrIkY0uDxBQIw632Na
 t/xLz7TDnuGBf+IFL8Qm1e8aohf/KKht15hw0kV/Ayoe7JX5tvZQI+sc8kFJHokUu0GI
 D8sQ==
X-Gm-Message-State: AOAM5306Rt8HxfNi/4xSsp+Eb1Do1vmPboCh29nG7N21vhGuZd+m09JC
 IqTltQs+uv7wv5sYGnxCwlyGllSd/rvADgYkaZ7Log==
X-Google-Smtp-Source: ABdhPJxlUoNcCWDmNAtxOnwl+M5yGlxw6Qr0+aRWuR5aZ7bwSqa9mI0ZgpmUj6tJ5fQ0P8MVzLExn4R+QzuICDbg4K4=
X-Received: by 2002:a2e:9b07:: with SMTP id u7mr7799901lji.209.1624456559281; 
 Wed, 23 Jun 2021 06:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <2ED1BDF5-BC0C-47CD-8F33-9A46C738F8CF@linux.vnet.ibm.com>
 <CAKfTPtDrHv4OOfPvwOE2DMNoucXQJ=yvvEpTVKrXghSdKEnZcA@mail.gmail.com>
 <20210622143154.GA804@vingu-book>
 <53968DDE-9E93-4CB4-B5E4-526230B6E154@linux.vnet.ibm.com>
 <20210623071935.GA29143@vingu-book>
 <CCB4222F-000A-44E8-8D61-F69893704688@linux.vnet.ibm.com>
 <6C676AB3-5D06-471A-8715-60AABEBBE392@linux.vnet.ibm.com>
 <20210623120835.GB29143@vingu-book>
 <CAFpoUr01xb9ZJF9mb2nmZDpUHXFH3VSbY3AU8-1owV-_7wVTPg@mail.gmail.com>
 <CAKfTPtB++3y4VnbKE_n=bgsqCfqXuF0KUsdB_cFhi9xAnMRubw@mail.gmail.com>
 <CAFpoUr3bHzrwvumw6R=2JVbKa_wmtT9cMf-mdDHxY0Png-N9Jw@mail.gmail.com>
In-Reply-To: <CAFpoUr3bHzrwvumw6R=2JVbKa_wmtT9cMf-mdDHxY0Png-N9Jw@mail.gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 23 Jun 2021 15:55:47 +0200
Message-ID: <CAKfTPtAev0VgCmK3AUyTCoVA38YmskpB98q0kTrbEPK6e=1dTA@mail.gmail.com>
Subject: Re: [powerpc][next-20210621] WARNING at kernel/sched/fair.c:3277
 during boot
To: Odin Ugedal <odin@uged.al>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 23 Jun 2021 at 14:37, Odin Ugedal <odin@uged.al> wrote:
>
> ons. 23. jun. 2021 kl. 14:22 skrev Vincent Guittot <vincent.guittot@linaro.org>:
> >
> > In theory it should not because _sum should be always larger or equal
> > to _avg * divider. Otherwise, it means that we have something wrong
> > somewhere else
>
> Yeah, that might be the case. Still trying to wrap my head around
> this. I might be wrong, but isn't there a possibility
> that avg->period_contrib is increasing in PELTs accumulate_sum,
> without _sum is increasing. This makes the pelt divider increase,
> making the statement "_sum should be always larger or equal to _avg *"
> false? Or am I missing something obvious here?

The pelt value of sched_entity is synced with  cfs and its contrib
before being removed.
Then, we start to remove this load in update_cfs_rq_load_avg() before
calling __update_load_avg_cfs_rq so contrib should not have change and
we should be safe

>
> Still unable to reproduce what Sachin is reporting tho.
>
> Odin
