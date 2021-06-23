Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3713B1D98
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 17:26:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G96Y53164z3bvX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 01:26:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m1ekFego;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=vincent.guittot@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=m1ekFego; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G96Xb4Sz1z2xv2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 01:25:32 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id t17so4851276lfq.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 08:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tWN1jNVFh7vMLUtEdkRQtm2LdDMMDH1982Vnm5Q9SIM=;
 b=m1ekFegoNdrGbxt+7TUKRZ/VO3BsPXgL10cMuDLlUJZXZlwxqvY9tta1wja6faHjpO
 G+CQsu7pYz8vJsBsNcAkJfHrPuyQjGpNU2TBzSIk1HJI+7gj/Fieh4F/DHdx4grkDHY2
 kfB3jdFvWKJ5Qa8LlaVuIlB/pdKuslTtXhbRKqzqMdwGEbH/BcvapozB9bUnnoKNbkmN
 xZr+zY74/6TgBt3N/OUIF54UOm2aEg/kHc2SJSAdCYjf0tFL/lx/osWCfCizbWW73zpt
 sOgiwdiQwRLvQug8IYZDX5r53HI8H3DlUQD7b3NOx5njM+K+Ap1PgyfYJ1GFvoUpbq0Y
 jcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tWN1jNVFh7vMLUtEdkRQtm2LdDMMDH1982Vnm5Q9SIM=;
 b=XrHjhAe1AoYHdcFLXXjOodg1B/GvyxlBOHnw+rfduNn9ZlPqk6MD//RrcMQg4dcdDF
 raPkloHM3XDgpYgNJvTlp+4Dcpc2i3XHzariRuOfftf0/GUk4YHrAgT+bH+84jcHY+6k
 23m/NzwyoY0PFDghlYdYy62HZW45P4kdYKyZL/U6zymFBmxpUfsvX8LI8OsZqSThPaVi
 qSpTlhMpXtrjMhvArPlcrmz08ysdRwXGv9gmeU2xtRu5b7pIw7fC9TVWeCpo8aeiRT+u
 6VSqnVWSy8Aj32kFDmsLyNgwCrrGZYk1Z4f1OpHbDUWXd3aaaSNnTlrnUHzT2TrMflMN
 SeKQ==
X-Gm-Message-State: AOAM533SgnyqUEkJ7k0gIGjzpV7Qv4Z7NqfYvi/jSFGTfzflKoeVJxZN
 zwrtYd8pPVll+d3QXb2PzT7HOhodtWBPvE8wYtmaQA==
X-Google-Smtp-Source: ABdhPJyAwIGUgo68OmahnP4EuuvHtTd1UL9j1UkXicbKw75wPKkSOcVk3aLPokn2FK3hKP2mN+WPLGYKcQULj8B7MQE=
X-Received: by 2002:a05:6512:3694:: with SMTP id
 d20mr116319lfs.470.1624461919639; 
 Wed, 23 Jun 2021 08:25:19 -0700 (PDT)
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
 <CAKfTPtAev0VgCmK3AUyTCoVA38YmskpB98q0kTrbEPK6e=1dTA@mail.gmail.com>
 <CAFpoUr3Q+7Tr3y59H-BiFU7BO=dquhQpJ8M9JtmV0_3ySfp-+Q@mail.gmail.com>
In-Reply-To: <CAFpoUr3Q+7Tr3y59H-BiFU7BO=dquhQpJ8M9JtmV0_3ySfp-+Q@mail.gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 23 Jun 2021 17:25:08 +0200
Message-ID: <CAKfTPtAjWpupvUE_m_KK9o4djQ_m5WmXuMqjxxxsMMRbfHqTmQ@mail.gmail.com>
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

On Wed, 23 Jun 2021 at 17:13, Odin Ugedal <odin@uged.al> wrote:
>
> ons. 23. jun. 2021 kl. 15:56 skrev Vincent Guittot <vincent.guittot@linaro.org>:
> >
> >
> > The pelt value of sched_entity is synced with  cfs and its contrib
> > before being removed.
>
>
> Hmm. Not sure what you mean by sched_entity here, since this is only
> taking the "removed" load_avg
> and removing it from cfs_rq, together with (removed.load_avg *
> divider) from load_sum. (Although. ".removed" comes from
> a sched entity)

The sched_entity's load_avg that is put in removed.load, is sync with
the cfs_rq PELT signal, which includes contrib, before being added to
removed.load.

>
> > Then, we start to remove this load in update_cfs_rq_load_avg() before
> > calling __update_load_avg_cfs_rq so contrib should not have change and
> > we should be safe
>
> For what it is worth, I am now able to reproduce it (maybe
> CONFIG_HZ=300/250 is the thing) as reported by Sachin,
> and my patch makes it disappear. Without my patch I see situations
> where _sum is zero while _avg is eg. 1 or 2 or 14 (in that range).

hmm, so there is something wrong in the propagation

> This happens for both load, runnable and util.
>
> Lets see what Sachin reports back.
>
> Thanks
> Odin
