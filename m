Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEEB3610B2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 19:03:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLlzp1CWzz3byt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 03:03:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20150623.gappssmtp.com header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=HZB0G/8+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::534;
 helo=mail-ed1-x534.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=HZB0G/8+; dkim-atps=neutral
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLlzM1sKfz2xZH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 03:03:20 +1000 (AEST)
Received: by mail-ed1-x534.google.com with SMTP id g17so28232877edm.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 10:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SWKR5QoCIcgkYDJO1D3/EqsdlJKBzOvIE5uO8N845Ek=;
 b=HZB0G/8+VAIcrWGClRrfQCWPr57el7IDgxgRcXwWOy6oNrd1n+M5Yp75CJ5pDNkLVP
 MANBsbdEixpFE0goI87DwGpstnnho0ucVJzA9JreM9hxPEBG4uj/oKvoCNhJkqeDlkwl
 B2yZSKqxaFd60GFPdGczqSw8MAalifJKU0hZDoa+dYuksPLUv+UCs+JecOLcXeOoNwCJ
 MAjyCo69RQlZwfe9eQSK18o8lBbASE03gkAv5uA9Ew4hPg0f8SqCzzi0mDo/ACfwMIbX
 ErGeyVI2CFTrOrYQr3yrxeyYn/WeOSoFuNaYFQO/RzSIRvvneMA7tpJCo13tbDwD10SM
 GCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SWKR5QoCIcgkYDJO1D3/EqsdlJKBzOvIE5uO8N845Ek=;
 b=eJWw5FVwYSJofUNxQKt5sQkYehIcBI/utrFDtTtPxYDwdA66JGrUquWWyry+H5EE8D
 x7J6mGvC1J5dlRXmWbY/1t9utiN4Fgnf4jhtEos9Op6Lx7p/WjuIoWYXnK89dFT/CgTF
 eKF4XzEjuNpdQ1ZmBtiLDfVTbEwbJ770YkfSnJSJRna+SNKfzdES1f/ITyFBdJBMfCBo
 DFVjTz9sxuN+6OU0WfimCRdV7nKH/E4vva0kGofbuVXbbd+exmCiztPvSbQrTUciSnZD
 5vsUnuj+7HHyrgzVOL9t1gqPVVPYem9oxaLMTf6cPlUJ3fotGmvL1tUYqYpCHDKzFMX2
 Fzlg==
X-Gm-Message-State: AOAM533noUugy+iVSUFq2Me7rFytCQgcou33Qj5jU++zDrJo7mS7cwAw
 jr5PQwv8Ff0Wy954dHseYz+y75GlrhUfWbKQMLGYAg==
X-Google-Smtp-Source: ABdhPJyPU+CaTe3k4CP9B3bfuHwuS9lp7EC/RLUzWOQqM1xC4OnYc59f5uCi8HFc83PLFmyhXo4PcPy4HtSIMIphfbI=
X-Received: by 2002:a05:6402:51d0:: with SMTP id
 r16mr2092696edd.52.1618506193479; 
 Thu, 15 Apr 2021 10:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210414124026.332472-1-vaibhav@linux.ibm.com>
 <CAPcyv4iU3cmjRsDevDJmJc72xo-QffUu3SGCwvRh5bitG-facw@mail.gmail.com>
 <87k0p3lqmq.fsf@vajain21.in.ibm.com>
In-Reply-To: <87k0p3lqmq.fsf@vajain21.in.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 15 Apr 2021 10:03:01 -0700
Message-ID: <CAPcyv4g=YqcOxwS5Q=_Z=fx5WCwU1t0M3me5OFeQodckKSfm9A@mail.gmail.com>
Subject: Re: [PATCH] powerpc/papr_scm: Reduce error severity if nvdimm stats
 inaccessible
To: Vaibhav Jain <vaibhav@linux.ibm.com>
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Santosh Sivaraj <santosh@fossix.org>, Ira Weiny <ira.weiny@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 15, 2021 at 4:44 AM Vaibhav Jain <vaibhav@linux.ibm.com> wrote:
>
> Thanks for looking into this Dan,
>
> Dan Williams <dan.j.williams@intel.com> writes:
>
> > On Wed, Apr 14, 2021 at 5:40 AM Vaibhav Jain <vaibhav@linux.ibm.com> wrote:
> >>
> >> Currently drc_pmem_qeury_stats() generates a dev_err in case
> >> "Enable Performance Information Collection" feature is disabled from
> >> HMC. The error is of the form below:
> >>
> >> papr_scm ibm,persistent-memory:ibm,pmemory@44104001: Failed to query
> >>          performance stats, Err:-10
> >>
> >> This error message confuses users as it implies a possible problem
> >> with the nvdimm even though its due to a disabled feature.
> >>
> >> So we fix this by explicitly handling the H_AUTHORITY error from the
> >> H_SCM_PERFORMANCE_STATS hcall and generating a warning instead of an
> >> error, saying that "Performance stats in-accessible".
> >>
> >> Fixes: 2d02bf835e57('powerpc/papr_scm: Fetch nvdimm performance stats from PHYP')
> >> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> >> ---
> >>  arch/powerpc/platforms/pseries/papr_scm.c | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> >> index 835163f54244..9216424f8be3 100644
> >> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> >> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> >> @@ -277,6 +277,9 @@ static ssize_t drc_pmem_query_stats(struct papr_scm_priv *p,
> >>                 dev_err(&p->pdev->dev,
> >>                         "Unknown performance stats, Err:0x%016lX\n", ret[0]);
> >>                 return -ENOENT;
> >> +       } else if (rc == H_AUTHORITY) {
> >> +               dev_warn(&p->pdev->dev, "Performance stats in-accessible");
> >> +               return -EPERM;
> >
> > So userspace can spam the kernel log? Why is kernel log message needed
> > at all? EPERM told the caller what happened.
> Currently this error message is only reported during probe of the
> nvdimm. So userspace cannot directly spam kernel log.

Oh, ok, I saw things like papr_pdsm_fuel_gauge() in the call stack and
thought this was reachable through an ioctl. Sorry for the noise.
