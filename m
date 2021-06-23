Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A700C3B19D2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 14:23:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G92Tw2hTXz3bvG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 22:23:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PqWSqBB5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22d;
 helo=mail-lj1-x22d.google.com; envelope-from=vincent.guittot@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PqWSqBB5; dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G92TR6C3yz2xtk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 22:22:35 +1000 (AEST)
Received: by mail-lj1-x22d.google.com with SMTP id k8so2716332lja.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 05:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K1M8efwheuUHkGZYU3icVERiMojYbNdJd5fKUwXRZZM=;
 b=PqWSqBB5OILmf2SkzmT/83btBuqlUDrfdW0JVaEvkWsBEwZrXgtzrqkG5Y59t4gC+L
 1MWQdFS2G6czzHAeq8rheCjGmBWK4wgOIf9feB7XSPbPYq043gM4yN6bAurum7o65wOy
 QRVT7ZPPrUzTjEt78fxI/bzYLbsnux5gf9K80cS0N7kEn1Qb48B5Qu/KDk7k3BVNZLI8
 NBrpRP1Z4o+h5bECZiw2JVXKf7/0sh8BqiARZvqzv8jaTu7/iFfcRXn/QRqio2CwU1kI
 j4JqqO8rfFyoR3p4Y8CedFElWkPcqNzM3QQ3n5fS+baaeJB+/SbdcTVHwKHUczpy8FRS
 v61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K1M8efwheuUHkGZYU3icVERiMojYbNdJd5fKUwXRZZM=;
 b=Vpe6ByJ+lxhKidohKIBNFFNDdluKK0OLqGqQl/HyNKVSEk6aBHxBp30oOZF1b28RgP
 hnV3p1hdCnDgHdt1kR5lSX6xFIeUEeq+kS2t2mw9Jr35OhywKY7ofCUhQpKiITyVzV1y
 C4NyyvFekf2AnZoliLpz//WVo7Yug93UzjV1vVKUReSBheZBWof8lODQ6I8GW7hb3Ujb
 Tzf2gzmeziUIY7Hb2FstySug6ay5cI/un+bxNO2pNiBcTGComSvSBH/7HsoJL/dSCKLX
 a3UwfsNzTvOXZj3tVVr8iuX5Jy0wqxCQUIWMFMcwiFhd5sRb4K/vNgzyTulPcdluPvK/
 YG+w==
X-Gm-Message-State: AOAM530SX1sIpzHfmZerIJrkqM1OPTblV7ONoyDG+++Ld7HGuTH7t3Kg
 im6u+CVU629Fuq4ONkybrNrMNZka9iOSgipxqybMAg==
X-Google-Smtp-Source: ABdhPJys7dUDWpg23GwyoqW1L85DcIlBG3yos1lJ32xXK/Xr6ViKTW93rMdD7TS5GB03m2YLXKEaJjFMP4jOp8CLzGI=
X-Received: by 2002:a2e:9b07:: with SMTP id u7mr7469454lji.209.1624450949701; 
 Wed, 23 Jun 2021 05:22:29 -0700 (PDT)
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
In-Reply-To: <CAFpoUr01xb9ZJF9mb2nmZDpUHXFH3VSbY3AU8-1owV-_7wVTPg@mail.gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 23 Jun 2021 14:22:18 +0200
Message-ID: <CAKfTPtB++3y4VnbKE_n=bgsqCfqXuF0KUsdB_cFhi9xAnMRubw@mail.gmail.com>
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

On Wed, 23 Jun 2021 at 14:18, Odin Ugedal <odin@uged.al> wrote:
>
> Hi,
>
> Wouldn't the attached diff below also help when load is removed,
> Vincent? Isn't there a theoretical chance that x_sum ends up at zero
> while x_load ends up as a positive value (without this patch)? Can
> post as a separate patch if it works for Sachin.

In theory it should not because _sum should be always larger or equal
to _avg * divider. Otherwise, it means that we have something wrong
somewhere else

>
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index bfaa6e1f6067..def48bc2e90b 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -3688,15 +3688,15 @@ update_cfs_rq_load_avg(u64 now, struct cfs_rq *cfs_rq)
>
>                 r = removed_load;
>                 sub_positive(&sa->load_avg, r);
> -               sub_positive(&sa->load_sum, r * divider);
> +               sa->load_sum = sa->load_avg * divider;
>
>                 r = removed_util;
>                 sub_positive(&sa->util_avg, r);
> -               sub_positive(&sa->util_sum, r * divider);
> +               sa->util_sum = sa->util_avg * divider;
>
>                 r = removed_runnable;
>                 sub_positive(&sa->runnable_avg, r);
> -               sub_positive(&sa->runnable_sum, r * divider);
> +               sa->runnable_sum = sa->runnable_avg * divider;
>
>                 /*
>                  * removed_runnable is the unweighted version of
> removed_load so we
