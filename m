Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDC34E4444
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 17:33:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNH980Lb9z3bSk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 03:33:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20210112.gappssmtp.com header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=iP3chaaF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20210112.gappssmtp.com
 header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=iP3chaaF; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNH8T50dmz2yLJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Mar 2022 03:32:34 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id
 mr5-20020a17090b238500b001c67366ae93so3415219pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Mar 2022 09:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8VW7m+2y1Tmk6nQ2gEGQ8MmmBh8Dx2qsCve3MAkxzOA=;
 b=iP3chaaFb25Z76RNWTQRRmAxgT63t60OG13XsvAYeYEeIOU2ZSnJLLJs72Q2MYrkQe
 phrwr4nVFXhftWilaIaVrFuQLHWBDqhI6XUZnIMuEfkzIJLo7+AVGN5PLBcxxqka5Le7
 d7brDHFCF289t4v1ip9FKpt9yNWwdVT8daQWGOJKJoLjwDWyUswCGfUtI7v4tem4sx/3
 vuDLcYp2TL4ogSyeEC6bJGqqUCEu6VcLdvfbYYurkUBVmyVt3in9BH/ic6tqY5ca8ngU
 9BCsvMrCN1W1QOCT4OzkrwgUoq0hIl1P9TEpIH9nQVn1ktfQbeCTnIARzhZ2jVkntUzk
 AFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8VW7m+2y1Tmk6nQ2gEGQ8MmmBh8Dx2qsCve3MAkxzOA=;
 b=2Bst7keWTp8T/sXm0Bnzc0as2mgpnKhAN1W1tS3mrO+8USRPTCX7IHVIG4QcnUdMDm
 wo1yFGHf30jMcvTFvok52zB9gdGxc2ANs6HI4pOx5RCkPXrDRpK415GsfAJC9RfilDEz
 8iKzwmJxCUyzaYTbh2hLJPeW3FZDslfkNBoNJ8KXVHiic/aMwtQ+tddHnxS8cKScDZ6k
 sTHpqoRe+hsZtwvXhhZu3oY+QvyMc8lbB3xTlTNL7YR7egtAiCUM7cKNwN49wXaA12vB
 4/Q7xWSmIXnB4Bz8QoI4hkr1NGvAUvHNNnCa21RZyD6ZsTSZjse9S/ZNjXsiHGBo/Z7D
 J1nQ==
X-Gm-Message-State: AOAM531VsOhP/Kc6w1KHO8MUPi3O2OpWyDC4k6ZO0ynVpO9tFayl7QXq
 /9BZoC9EvjU5N/2DtG7L/+9EWF4fWIM8rVlJO8bAAQ==
X-Google-Smtp-Source: ABdhPJzwYAYZ1e3ypdIIPaNrrCcfQjyeMu+eJoTkNU8vKXqKPTzyE5ogynPUrk/F9IVMPrRJQHsNliZF1dcMQEc2/zE=
X-Received: by 2002:a17:903:32c7:b0:154:4156:f384 with SMTP id
 i7-20020a17090332c700b001544156f384mr15091046plr.34.1647966750443; Tue, 22
 Mar 2022 09:32:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220318114133.113627-1-kjain@linux.ibm.com>
 <20220318114133.113627-2-kjain@linux.ibm.com>
 <CAPcyv4iqpTn89WLOW1XjFXGZEYG_MmPg+VQbcDJ9ygJ4Jaybtw@mail.gmail.com>
 <c198a1b5-cc7e-4e51-533b-a5794f506b17@linux.ibm.com>
In-Reply-To: <c198a1b5-cc7e-4e51-533b-a5794f506b17@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 22 Mar 2022 09:32:23 -0700
Message-ID: <CAPcyv4j9NQ-Msr6JCp95QWAdDyTfYr65fXCoHHtjipLA=oJeHA@mail.gmail.com>
Subject: Re: [PATCH 2/2] powerpc/papr_scm: Fix build failure when
 CONFIG_PERF_EVENTS is not set
To: kajoljain <kjain@linux.ibm.com>
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
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>, Santosh Sivaraj <santosh@fossix.org>,
 maddy@linux.ibm.com, "Weiny, Ira" <ira.weiny@intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Peter Zijlstra <peterz@infradead.org>,
 rnsastry@linux.ibm.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Vishal L Verma <vishal.l.verma@intel.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, atrajeev@linux.vnet.ibm.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 22, 2022 at 7:30 AM kajoljain <kjain@linux.ibm.com> wrote:
>
>
>
> On 3/22/22 03:09, Dan Williams wrote:
> > On Fri, Mar 18, 2022 at 4:42 AM Kajol Jain <kjain@linux.ibm.com> wrote:
> >>
> >> The following build failure occures when CONFIG_PERF_EVENTS is not set
> >> as generic pmu functions are not visible in that scenario.
> >>
> >> arch/powerpc/platforms/pseries/papr_scm.c:372:35: error: =E2=80=98stru=
ct perf_event=E2=80=99 has no member named =E2=80=98attr=E2=80=99
> >>          p->nvdimm_events_map[event->attr.config],
> >>                                    ^~
> >> In file included from ./include/linux/list.h:5,
> >>                  from ./include/linux/kobject.h:19,
> >>                  from ./include/linux/of.h:17,
> >>                  from arch/powerpc/platforms/pseries/papr_scm.c:5:
> >> arch/powerpc/platforms/pseries/papr_scm.c: In function =E2=80=98papr_s=
cm_pmu_event_init=E2=80=99:
> >> arch/powerpc/platforms/pseries/papr_scm.c:389:49: error: =E2=80=98stru=
ct perf_event=E2=80=99 has no member named =E2=80=98pmu=E2=80=99
> >>   struct nvdimm_pmu *nd_pmu =3D to_nvdimm_pmu(event->pmu);
> >>                                                  ^~
> >> ./include/linux/container_of.h:18:26: note: in definition of macro =E2=
=80=98container_of=E2=80=99
> >>   void *__mptr =3D (void *)(ptr);     \
> >>                           ^~~
> >> arch/powerpc/platforms/pseries/papr_scm.c:389:30: note: in expansion o=
f macro =E2=80=98to_nvdimm_pmu=E2=80=99
> >>   struct nvdimm_pmu *nd_pmu =3D to_nvdimm_pmu(event->pmu);
> >>                               ^~~~~~~~~~~~~
> >> In file included from ./include/linux/bits.h:22,
> >>                  from ./include/linux/bitops.h:6,
> >>                  from ./include/linux/of.h:15,
> >>                  from arch/powerpc/platforms/pseries/papr_scm.c:5:
> >>
> >> Fix the build issue by adding check for CONFIG_PERF_EVENTS config opti=
on
> >> and disabling the papr_scm perf interface support incase this config
> >> is not set
> >>
> >> Fixes: 4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support") (=
Commit id
> >> based on linux-next tree)
> >> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> >> ---
> >>  arch/powerpc/platforms/pseries/papr_scm.c | 15 +++++++++++++++
> >
> > This is a bit messier than I would have liked mainly because it dumps
> > a bunch of ifdefery into a C file contrary to coding style, "Wherever
> > possible, don't use preprocessor conditionals (#if, #ifdef) in .c
> > files". I would expect this all to move to an organization like:
>
> Hi Dan,
>       Thanks for reviewing the patches. Inorder to avoid the multiple
> ifdefs checks, we can also add stub function for papr_scm_pmu_register.
> With that change we will just have one ifdef check for
> CONFIG_PERF_EVENTS config in both papr_scm.c and nd.h file. Hence we can
> avoid adding new files specific for papr_scm perf interface.
>
> Below is the code snippet for that change, let me know if looks fine to
> you. I tested it
> with set/unset PAPR_SCM config value and set/unset PERF_EVENTS config
> value combinations.
>
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c
> b/arch/powerpc/platforms/pseries/papr_scm.c
> index 4dd513d7c029..38fabb44d3c3 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -69,8 +69,6 @@
>  #define PAPR_SCM_PERF_STATS_EYECATCHER __stringify(SCMSTATS)
>  #define PAPR_SCM_PERF_STATS_VERSION 0x1
>
> -#define to_nvdimm_pmu(_pmu)    container_of(_pmu, struct nvdimm_pmu, pmu=
)
> -
>  /* Struct holding a single performance metric */
>  struct papr_scm_perf_stat {
>         u8 stat_id[8];
> @@ -346,6 +344,9 @@ static ssize_t drc_pmem_query_stats(struct
> papr_scm_priv *p,
>         return 0;
>  }
>
> +#ifdef CONFIG_PERF_EVENTS
> +#define to_nvdimm_pmu(_pmu)    container_of(_pmu, struct nvdimm_pmu, pmu=
)
> +
>  static int papr_scm_pmu_get_value(struct perf_event *event, struct
> device *dev, u64 *count)
>  {
>         struct papr_scm_perf_stat *stat;
> @@ -558,6 +559,10 @@ static void papr_scm_pmu_register(struct
> papr_scm_priv *p)
>         dev_info(&p->pdev->dev, "nvdimm pmu didn't register rc=3D%d\n", r=
c);
>  }
>
> +#else
> +static inline void papr_scm_pmu_register(struct papr_scm_priv *p) { }

Since this isn't in a header file, it does not need to be marked
"inline" the compiler will figure it out.

> +#endif

It might be time to create:

arch/powerpc/platforms/pseries/papr_scm.h

...there is quite a bit of header material accrued in papr_scm.c and
once the ifdefs start landing in it then it becomes a nominal coding
style issue. That said, this is certainly more palatable than the
previous version. So if you don't want to create papr_scm.h yet for
this, at least make a note in the changelog that the first portion of
arch/powerpc/platforms/pseries/papr_scm.c is effectively papr_scm.h
content and may move there in the future, or something like that.
