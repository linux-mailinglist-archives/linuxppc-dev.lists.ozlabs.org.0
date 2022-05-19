Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 616E552DF63
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 23:37:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L439p1ldkz304F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 07:37:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=s1mlqyw+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::434;
 helo=mail-wr1-x434.google.com; envelope-from=irogers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=s1mlqyw+; dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L43962xsbz301P
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 07:37:13 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id k30so8937868wrd.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 14:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=igFDCAFACzy80cjdPLTvsGkRZ9A3jnJmOnHPpcNw6AQ=;
 b=s1mlqyw+LClysKJmtZpaGc1qPFDsJS9FSwdJSWBvaHLArVo9NI6JlQOjP0YABrycaq
 sg6/8kMOTDxzifc8mPFa1eu53EVYse2GJI5Fju6w2sUldItyEI4eH2VPGqgeM8KKqWRj
 U3TeiOGqh4PjhUyq6bznY7GRkYgGx/kEOSP+k7lEHXUZl08zK3ubY3e1RA8jyX4mMNcX
 c1kRuc5O8ZvKtyXkYu7V6TUIrLYkFBKEgx9Vc8hdsRBnv+GPUZgn1Dw1Am64c4v9w7mM
 aDPlpioBwu0yrimN8byJsbWRvG4GppzJi3ozETdKpoGdEfpHuNpV9ucp9elJ59nsF04v
 Qq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=igFDCAFACzy80cjdPLTvsGkRZ9A3jnJmOnHPpcNw6AQ=;
 b=jBljcho4xOc7i0RSscXUSRpWBZeCvWkNaw4Zuqz2N5UdyhIE7lfi/OWEhjmrjDwCog
 gn8KnVww8AhBW5ZNK4dRobwZk87QzXTgbA75BK28IyJyELq1IQtJBwCud8BD3CwFrNA+
 BmzUiMP+8QsQvJEVEFkXGjbSor0+is4LWjmkj4zG0s+lAUjI+fIjy2JhPn3wRJGhhL8O
 RSxQEf85nSHmmGgeeY298+EtqXIhEatQH0lz7W/6wiYqFfmRJ7WPDIt3fzzUSR52gh5E
 jPpQbcrIzirvAf2dLTq5rZBdTujRgPnNsBxZ32MWa0DQ1r605QW1Sg586dQqDmYABX8O
 lm9Q==
X-Gm-Message-State: AOAM530Rao6g/FZdc7eqiwt5Vmu7Sfzsmv6VTqtqAPs++mShaEzg3MPN
 /xuYiSmnaYYzacViesXTwR5DWeyla7i6Ng78/LTj5w==
X-Google-Smtp-Source: ABdhPJzg+JjwRXfyzA46Pz2YDobsZJTfHllLLU8F9AooZiDCk/r7ROEPbKuFnlvQGUofweecZaN5Go+Adm83c8fzTHg=
X-Received: by 2002:adf:e70e:0:b0:20e:7523:f01d with SMTP id
 c14-20020adfe70e000000b0020e7523f01dmr1457509wrm.300.1652996228782; Thu, 19
 May 2022 14:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220518085502.6914-1-atrajeev@linux.vnet.ibm.com>
 <CAP-5=fWN3Sgyp_hTyYvDrLrnr-7dj6ozERn0tDm5MrU2SEJ2Fg@mail.gmail.com>
 <4D9BD7B3-1FA0-4EFE-A7D9-75BBB84ED308@linux.vnet.ibm.com>
In-Reply-To: <4D9BD7B3-1FA0-4EFE-A7D9-75BBB84ED308@linux.vnet.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 19 May 2022 14:36:56 -0700
Message-ID: <CAP-5=fURkncicNEs87=QisBJhPkujRUZ51Z1S4A63fz+SXV6rg@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] powerpc/perf: Add support for caps under sysfs in
 powerpc
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
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
Cc: maddy@linux.vnet.ibm.com, Nageswara Sastry <rnsastry@linux.ibm.com>,
 Kajol Jain <kjain@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org,
 Jiri Olsa <jolsa@kernel.org>, disgoel@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 19, 2022 at 4:29 AM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> > On 19-May-2022, at 10:12 AM, Ian Rogers <irogers@google.com> wrote:
> >
> > On Wed, May 18, 2022 at 1:55 AM Athira Rajeev
> > <atrajeev@linux.vnet.ibm.com> wrote:
> >>
> >> Add caps support under "/sys/bus/event_source/devices/<pmu>/"
> >> for powerpc. This directory can be used to expose some of the
> >> specific features that powerpc PMU supports to the user.
> >> Example: pmu_name. The name of PMU registered will depend on
> >> platform, say power9 or power10 or it could be Generic Compat
> >> PMU.
> >>
> >> Currently the only way to know which is the registered
> >> PMU is from the dmesg logs. But clearing the dmesg will make it
> >> difficult to know exact PMU backend used. And even extracting
> >> from dmesg will be complicated, as we need  to parse the dmesg
> >> logs and add filters for pmu name. Whereas by exposing it via
> >> caps will make it easy as we just need to directly read it from
> >> the sysfs.
> >
> > For ARM and x86 in the perf tool this is normally done through a cpuid
> > like function, is there a reason to differ on Power?
> >
> > Thanks,
> > Ian
>
> Hi Ian,
>
> Thanks for review. The information from cpuid or cpuinfo will provide
> us the information of the platform/model/machine etc. In case of powerpc,
> we have one case where, though platform points to specific generation of the
> processor, say power9 or power10, the registered PMU could point to
> different one. To be specific, this is named as Generic Compat PMU which
> is a fallback PMU. This gets registered when the distro doesn't have support
> for platform specific PMU. In that case distro will have a Generic
> Compat PMU registered which supports basic features for performance monitoring.
> This information can't be fetched from the cpuid data since that will point
> to current platform.
>
> So the pmu_name exposed via "caps" will be useful to detect the PMU
> registered and also we target to use this information in some of our
> selftests.

Thanks, I've no problem with the change. Do we need to do a similar
discovery in the perf tool on old kernels? Perhaps then this
information could be exposed in the perf list command for self tests.

Thanks,
Ian

> Thanks
> Athira
> >
> >> Add a caps directory to /sys/bus/event_source/devices/cpu/
> >> for power8, power9, power10 and generic compat PMU in respective
> >> PMU driver code. Update the pmu_name file under caps folder
> >> in core-book3s using "attr_update".
> >>
> >> The information exposed currently:
> >> - pmu_name : Underlying PMU name from the driver
> >>
> >> Example result with power9 pmu:
> >>
> >> # ls /sys/bus/event_source/devices/cpu/caps
> >> pmu_name
> >>
> >> # cat /sys/bus/event_source/devices/cpu/caps/pmu_name
> >> POWER9
> >>
> >> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> >> ---
> >> Changelog:
> >> v1 -> v2:
> >> Move the show function as generic in core-book3s
> >> and update show function using sysfs_emit and ppmu->name
> >> Added Documention for this ABI in patch 2.
> >> Notes: The caps directory is implemented in PMU for other
> >> architectures already. Reference commit for x86:
> >> commit b00233b53065 ("perf/x86: Export some PMU attributes in caps/ directory")
> >>
> >> arch/powerpc/perf/core-book3s.c        | 31 ++++++++++++++++++++++++++
> >> arch/powerpc/perf/generic-compat-pmu.c | 10 +++++++++
> >> arch/powerpc/perf/power10-pmu.c        | 10 +++++++++
> >> arch/powerpc/perf/power8-pmu.c         | 10 +++++++++
> >> arch/powerpc/perf/power9-pmu.c         | 10 +++++++++
> >> 5 files changed, 71 insertions(+)
> >>
> >> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> >> index b5b42cf0a703..a208f502a80b 100644
> >> --- a/arch/powerpc/perf/core-book3s.c
> >> +++ b/arch/powerpc/perf/core-book3s.c
> >> @@ -2488,6 +2488,33 @@ static int power_pmu_prepare_cpu(unsigned int cpu)
> >>       return 0;
> >> }
> >>
> >> +static ssize_t pmu_name_show(struct device *cdev,
> >> +               struct device_attribute *attr,
> >> +               char *buf)
> >> +{
> >> +       if (ppmu)
> >> +               return sysfs_emit(buf, "%s\n", ppmu->name);
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static DEVICE_ATTR_RO(pmu_name);
> >> +
> >> +static struct attribute *pmu_caps_attrs[] = {
> >> +       &dev_attr_pmu_name.attr,
> >> +       NULL
> >> +};
> >> +
> >> +static const struct attribute_group pmu_caps_group = {
> >> +       .name  = "caps",
> >> +       .attrs = pmu_caps_attrs,
> >> +};
> >> +
> >> +static const struct attribute_group *pmu_caps_groups[] = {
> >> +       &pmu_caps_group,
> >> +       NULL,
> >> +};
> >> +
> >> int __init register_power_pmu(struct power_pmu *pmu)
> >> {
> >>       if (ppmu)
> >> @@ -2498,6 +2525,10 @@ int __init register_power_pmu(struct power_pmu *pmu)
> >>               pmu->name);
> >>
> >>       power_pmu.attr_groups = ppmu->attr_groups;
> >> +
> >> +       if (ppmu->flags & PPMU_ARCH_207S)
> >> +               power_pmu.attr_update = pmu_caps_groups;
> >> +
> >>       power_pmu.capabilities |= (ppmu->capabilities & PERF_PMU_CAP_EXTENDED_REGS);
> >>
> >> #ifdef MSR_HV
> >> diff --git a/arch/powerpc/perf/generic-compat-pmu.c b/arch/powerpc/perf/generic-compat-pmu.c
> >> index f3db88aee4dd..817c69863038 100644
> >> --- a/arch/powerpc/perf/generic-compat-pmu.c
> >> +++ b/arch/powerpc/perf/generic-compat-pmu.c
> >> @@ -151,9 +151,19 @@ static const struct attribute_group generic_compat_pmu_format_group = {
> >>       .attrs = generic_compat_pmu_format_attr,
> >> };
> >>
> >> +static struct attribute *generic_compat_pmu_caps_attrs[] = {
> >> +       NULL
> >> +};
> >> +
> >> +static struct attribute_group generic_compat_pmu_caps_group = {
> >> +       .name  = "caps",
> >> +       .attrs = generic_compat_pmu_caps_attrs,
> >> +};
> >> +
> >> static const struct attribute_group *generic_compat_pmu_attr_groups[] = {
> >>       &generic_compat_pmu_format_group,
> >>       &generic_compat_pmu_events_group,
> >> +       &generic_compat_pmu_caps_group,
> >>       NULL,
> >> };
> >>
> >> diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
> >> index c6d51e7093cf..d1adcd9f52e2 100644
> >> --- a/arch/powerpc/perf/power10-pmu.c
> >> +++ b/arch/powerpc/perf/power10-pmu.c
> >> @@ -258,6 +258,15 @@ static const struct attribute_group power10_pmu_format_group = {
> >>       .attrs = power10_pmu_format_attr,
> >> };
> >>
> >> +static struct attribute *power10_pmu_caps_attrs[] = {
> >> +       NULL
> >> +};
> >> +
> >> +static struct attribute_group power10_pmu_caps_group = {
> >> +       .name  = "caps",
> >> +       .attrs = power10_pmu_caps_attrs,
> >> +};
> >> +
> >> static const struct attribute_group *power10_pmu_attr_groups_dd1[] = {
> >>       &power10_pmu_format_group,
> >>       &power10_pmu_events_group_dd1,
> >> @@ -267,6 +276,7 @@ static const struct attribute_group *power10_pmu_attr_groups_dd1[] = {
> >> static const struct attribute_group *power10_pmu_attr_groups[] = {
> >>       &power10_pmu_format_group,
> >>       &power10_pmu_events_group,
> >> +       &power10_pmu_caps_group,
> >>       NULL,
> >> };
> >>
> >> diff --git a/arch/powerpc/perf/power8-pmu.c b/arch/powerpc/perf/power8-pmu.c
> >> index e37b1e714d2b..2518f5375d4a 100644
> >> --- a/arch/powerpc/perf/power8-pmu.c
> >> +++ b/arch/powerpc/perf/power8-pmu.c
> >> @@ -187,9 +187,19 @@ static const struct attribute_group power8_pmu_events_group = {
> >>       .attrs = power8_events_attr,
> >> };
> >>
> >> +static struct attribute *power8_pmu_caps_attrs[] = {
> >> +       NULL
> >> +};
> >> +
> >> +static struct attribute_group power8_pmu_caps_group = {
> >> +       .name  = "caps",
> >> +       .attrs = power8_pmu_caps_attrs,
> >> +};
> >> +
> >> static const struct attribute_group *power8_pmu_attr_groups[] = {
> >>       &isa207_pmu_format_group,
> >>       &power8_pmu_events_group,
> >> +       &power8_pmu_caps_group,
> >>       NULL,
> >> };
> >>
> >> diff --git a/arch/powerpc/perf/power9-pmu.c b/arch/powerpc/perf/power9-pmu.c
> >> index c393e837648e..5c654ce1a417 100644
> >> --- a/arch/powerpc/perf/power9-pmu.c
> >> +++ b/arch/powerpc/perf/power9-pmu.c
> >> @@ -258,9 +258,19 @@ static const struct attribute_group power9_pmu_format_group = {
> >>       .attrs = power9_pmu_format_attr,
> >> };
> >>
> >> +static struct attribute *power9_pmu_caps_attrs[] = {
> >> +       NULL
> >> +};
> >> +
> >> +static struct attribute_group power9_pmu_caps_group = {
> >> +       .name  = "caps",
> >> +       .attrs = power9_pmu_caps_attrs,
> >> +};
> >> +
> >> static const struct attribute_group *power9_pmu_attr_groups[] = {
> >>       &power9_pmu_format_group,
> >>       &power9_pmu_events_group,
> >> +       &power9_pmu_caps_group,
> >>       NULL,
> >> };
> >>
> >> --
> >> 2.31.1
>
