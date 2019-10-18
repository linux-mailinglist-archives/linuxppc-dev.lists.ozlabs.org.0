Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1169DBC00
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 06:52:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vYYR2YwLzDrLb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 15:52:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="Lziqmfp5"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vYWV0Q7qzDq5f
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2019 15:50:45 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id h195so3065142pfe.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2019 21:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4JOjG0QUc189P6/WaRSOoK29dlyby423TPDBlUfjjUI=;
 b=Lziqmfp58ruDPDlAnaXX9i3ImvrJ8f7RhL0uRY6ovTLudo2mORUTvpbSWzM8/XTFPO
 dFk8WHRs3OF1tEwWHvb5wuKYHlZxMfAclM17/kR0QbxAuHs7cADgAJjT9R1tHPgjrTnM
 xjiO0KIFnQ7x6SlBm+hzBJRqmoyBnMOnImt+wR3FFhuS3wSEn1dLHiMzmktM4NPZVdRN
 WbHdFR3JDDRHZdjoaQCCVz0Dk1C3wyUMSqNmcQKVoe8DL4xYTP5PfAInbys6MErXbD63
 XO4rlKOJ4DA9Rc1pmJIHasULYT7aZfsuszsQdsQl1QMr6HTEFVABmCyYEKW7g+GaCzgO
 pYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4JOjG0QUc189P6/WaRSOoK29dlyby423TPDBlUfjjUI=;
 b=E2+Dc4vp3TA4MPK99SUSlme1ymmV+hsAtC65qJ97qOL6N5NZXlyMSOVs0TYW21Nl6v
 5fudL39PzXtY1XMG6udAttvs7s5HLJNhBQAiR1WLcF7r3KXI0JhtKOnUWi7iDbL3om+m
 WMvK/VsS1IfE0HdWCD8lS/17sqluQmrGRS0XDX7c6Tw6Qju0xB/QfKvPnwmJ5/y6h6I5
 WqE0b9owgIHCJQFtxcaeIDBbL+o/SRfmE0mnFdte2DbE9i8t5K4ePRucIHUk9FBBvjDb
 nrEYH7V8MsIGjDfI64114B6HPCKKVkbeQ3LbE7Im6SnRySJzKWtXa1sqAKwl41jooVb/
 xw1A==
X-Gm-Message-State: APjAAAWBdlXOpC4shpoWrOVAFkMyI2Lux9NZO5wyGSKy+WS7vdgDGBBA
 /JzqFT61g/eY+hUcs/09mx+sug==
X-Google-Smtp-Source: APXvYqyuPtcqnmg+CxjS4b/CVJ38AAAsq1UNlBTr0YiXF/SJVY0vvLvaK1ceDkGa1t8Y8jOOs66R6w==
X-Received: by 2002:a63:3d41:: with SMTP id k62mr7844596pga.129.1571374241418; 
 Thu, 17 Oct 2019 21:50:41 -0700 (PDT)
Received: from localhost ([122.172.151.112])
 by smtp.gmail.com with ESMTPSA id q2sm8125639pfg.144.2019.10.17.21.50.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Oct 2019 21:50:40 -0700 (PDT)
Date: Fri, 18 Oct 2019 10:20:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH] cpufreq: powernv: fix stack bloat and NR_CPUS limitation
Message-ID: <20191018045038.cytb46msqzmu4age@vireshk-i7>
References: <20191018000431.1675281-1-jhubbard@nvidia.com>
 <20191018042715.f76bawmoyk66isap@vireshk-i7>
 <c3f16019-5724-a181-8068-8dda60fb67fa@nvidia.com>
 <20191018043856.srvgft6jhqw62bx3@vireshk-i7>
 <a4a1467f-2c92-34f2-a8bf-718feaa17da7@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4a1467f-2c92-34f2-a8bf-718feaa17da7@nvidia.com>
User-Agent: NeoMutt/20180716-391-311a52
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
Cc: linuxppc-dev@lists.ozlabs.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 LKML <linux-kernel@vger.kernel.org>,
 Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 17-10-19, 21:41, John Hubbard wrote:
> On 10/17/19 9:38 PM, Viresh Kumar wrote:
> > On 17-10-19, 21:34, John Hubbard wrote:
> >> On 10/17/19 9:27 PM, Viresh Kumar wrote:
> >>> On 17-10-19, 17:04, John Hubbard wrote:
> >>>> The following build warning occurred on powerpc 64-bit builds:
> >>>>
> >>>> drivers/cpufreq/powernv-cpufreq.c: In function 'init_chip_info':
> >>>> drivers/cpufreq/powernv-cpufreq.c:1070:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> >>>
> >>> How come we are catching this warning after 4 years ?
> >>>
> >>
> >> Newer compilers. And btw, I don't spend a lot of time in powerpc
> >> code, so I just recently ran this, and I guess everyone has been on less
> >> new compilers so far, it seems.
> >>
> >> I used a gcc 8.1 cross compiler in this case:
> > 
> > Hmm, okay.
> > 
> > I hope you haven't missed my actual review comments on your patch,
> > just wanted to make sure we don't end up waiting for each other
> > indefinitely here :)
> > 
> 
> Ha, I did overlook those. It's late around here, I guess. :)

Good that I reminded you then :)

-- 
viresh
