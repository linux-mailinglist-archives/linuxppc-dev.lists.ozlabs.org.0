Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5783FA609
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 15:27:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gxcn70CdFz301F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 23:26:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BU5bZPCo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12a;
 helo=mail-lf1-x12a.google.com; envelope-from=vincent.guittot@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=BU5bZPCo; dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GxcmR0ZBbz2xh1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Aug 2021 23:26:13 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id y34so20627486lfa.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Aug 2021 06:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6uDsCE/I1mz2dgB3p/UOzI+ahRGDoiEn1DEziUtrHT8=;
 b=BU5bZPCoYgUCaamr94UcUImt3GYGfzrPEspvSfdrbVMFjZy7CmnrMWumK0k9MdUCsJ
 t61wahvUqzU5YZSYaX9fV/lfB1eIo4nou26DwjM+5wgluGQVuQmQdpyrvr3IofrvpIL2
 NFm/NcZHHLw+8DdUoVcchQTzfeAWk9sWH0jrVcFsPY9OfrzdYuNlEwiwEaUtfsCmKxHG
 b/cyPtnGzqMy9cZVx9++7PBzMgYM6P7mmrgcX0/ZktTFClCMBsHJFJFlGjHlegwYm7QC
 AMh6YFhSHmV8ch9YrW3F7AyI7HPgGzkfNLgj+YDb9/DiFLT4dOlxaXKypKY45WsjmGxz
 Mrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6uDsCE/I1mz2dgB3p/UOzI+ahRGDoiEn1DEziUtrHT8=;
 b=kWATxJcV9IohfqqHzxqWKudieG4In602Udb579/rLCJYf8gQXxYwYiJQHxH3G4tOHp
 jjD+tI0diB+FOpeB97O8h4gGnyfKU7U8FG6zupn0GqrG893QcOFUu5mMwBucwlVWx7hb
 /N5dfhbR0hykPxGIc0wKP4uXW9LwsXiMh93GqDyxArGIdWEVMPffMelK98qgwsTHshkh
 wYrfR9czRE1KWY0ijm6zx9GaeTHVycTQfKzG0i1EbiKO+7HlNWlkyvBJGbU8rnTUSatz
 E3Nkd5i2pB3C79meRd7+ehcIAkSdcw8r14g8RpD1vg0+6eXKYHH/NJIlVFmy4dyh4j5b
 CQDw==
X-Gm-Message-State: AOAM532ZrZ/65w+Kl3BF4xWpDTY6rYbEhWmtPvGsp1vQvh6+g/uIAUEO
 42PMo86WgKfepJxfvVde7Z+rXqpt4KDdnTiRYEstdw==
X-Google-Smtp-Source: ABdhPJw8SZc3osLOhZt6mPC7SQCpDXLLie8AUFqMpy2Yk/eWnNAswY30dUvGkml3IEACxty3BmpC4uzC4I03PxjMDC4=
X-Received: by 2002:a05:6512:1501:: with SMTP id
 bq1mr10955598lfb.286.1630157167253; 
 Sat, 28 Aug 2021 06:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210810144145.18776-1-ricardo.neri-calderon@linux.intel.com>
 <20210810144145.18776-7-ricardo.neri-calderon@linux.intel.com>
 <CAKfTPtArtmhLG5QYR6TzKevDrEuiQu2HJxm_C3pe549XdGU-1g@mail.gmail.com>
 <20210827194503.GB14720@ranerica-svr.sc.intel.com>
In-Reply-To: <20210827194503.GB14720@ranerica-svr.sc.intel.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Sat, 28 Aug 2021 15:25:56 +0200
Message-ID: <CAKfTPtAKYyy4asSBEcv3=1KWXWvDafrv=A_rh6BR9MgY17WdXA@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] sched/fair: Consider SMT in ASYM_PACKING load
 balance
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Aubrey Li <aubrey.li@linux.intel.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Ricardo Neri <ricardo.neri@intel.com>, Ben Segall <bsegall@google.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Ingo Molnar <mingo@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
 Len Brown <len.brown@intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Aubrey Li <aubrey.li@intel.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Tim Chen <tim.c.chen@linux.intel.com>, Quentin Perret <qperret@google.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 27 Aug 2021 at 21:45, Ricardo Neri
<ricardo.neri-calderon@linux.intel.com> wrote:
>
> On Fri, Aug 27, 2021 at 12:13:42PM +0200, Vincent Guittot wrote:
> > On Tue, 10 Aug 2021 at 16:41, Ricardo Neri
> > <ricardo.neri-calderon@linux.intel.com> wrote:
> > > @@ -9540,6 +9629,12 @@ static struct rq *find_busiest_queue(struct lb_env *env,
> > >                     nr_running == 1)
> > >                         continue;
> > >
> > > +               /* Make sure we only pull tasks from a CPU of lower priority */
> > > +               if ((env->sd->flags & SD_ASYM_PACKING) &&
> > > +                   sched_asym_prefer(i, env->dst_cpu) &&
> > > +                   nr_running == 1)
> > > +                       continue;
> >
> > This really looks similar to the test above for SD_ASYM_CPUCAPACITY.
> > More generally speaking SD_ASYM_PACKING and SD_ASYM_CPUCAPACITY share
> > a lot of common policy and I wonder if at some point we could not
> > merge their behavior in LB
>
> I would like to confirm with you that you are not expecting this merge
> as part of this series, right?

Merging them will probably need more tests on both x86 and Arm so I
suppose that we could keep them separate for now

Regards,
Vincent

>
> Thanks and BR,
> Ricardo
