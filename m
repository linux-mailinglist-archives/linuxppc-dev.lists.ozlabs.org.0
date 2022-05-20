Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 988FE52EFD9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 17:59:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4WdQ3Kq1z3bv8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 01:59:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ZfPQ6RMz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42c;
 helo=mail-wr1-x42c.google.com; envelope-from=irogers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=ZfPQ6RMz; dkim-atps=neutral
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4Wcn3Hksz2ywr
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 May 2022 01:59:20 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id t6so12076600wra.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 08:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+PwFAuFgONb+vg0ZLZxC6Xv2WfN46rPNU+1JbG6LHMk=;
 b=ZfPQ6RMzXBoOdMkQC/e3gsjgM43Gs/A6hC2+e8rExFj7C19n6ZFMS5dy88XesH8E0x
 Soy5IhKWEUlL7e0zPU+1ZdhaVQQsGMjf8oDyXq2wtOENSVB0DDFSuxzbK5UYtFgoSCKa
 YI2nBrJiBMrCjh6EEeQ9YVVabOB8yKwLMQVQhPQkThZmoxfED9izWaZDR1t8pdgBf/dF
 k5uVVA/rzoZQezo0C724OfIGoXewBHrhvNZA5z+JagR37COX4IPCPo+hERs5F9L9Vonl
 uMmKcvFnMZ1zzL9ahnYqTU6UaasTdYTewSVO/jOay0Ntg94hk9KWHM3Dd3W8IzRF/oG/
 MkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+PwFAuFgONb+vg0ZLZxC6Xv2WfN46rPNU+1JbG6LHMk=;
 b=Q/6+h4dGdf9h6SzvTaytI+C/ty745lR7Q+25CdBK5ztFkdgFDvyLQEDj6bQBVLEdxd
 P2HM69659TxuXNBspUAkg4YIWt3UAEtaxWsJF4DLx9q727bDhnLAACg3YPIJlyShR9za
 gbZKsUys1EfMPww5BgbotkpgW5UacL04FODOd4YkiqN7l0bsuvDwwz4wXpK+U/SJgalT
 tnXHSFhLcT5R+yJAphC+RoccC9/p/pqT4hxbSOxsQEnnR8cWalATEp99SGtA5EgST99P
 bET+FDhQL3L4sTUmSQhty/MW3LrVH0u7AYB7pAtHq0S09bMCIBIRJ3Ycwz8ULiwEPww2
 kAww==
X-Gm-Message-State: AOAM532+MkvuegyF3zjYIsqYXyg0nc51vijr1xENgNUhogotvk5gL4v3
 2ktUvWtKa8hZb78Jf5mC/P2hpnuI5b/4l5dfpEY7+w==
X-Google-Smtp-Source: ABdhPJz3KxMmXQxeNwT0z3srN5Ei4fSMZ+Vn6Mfq8zTE0XRnBM+G3mMbPmQPJiAvD7LzJ9phdKW0QzCXaz6fmvd5SrM=
X-Received: by 2002:a5d:598f:0:b0:20c:83c9:b05b with SMTP id
 n15-20020a5d598f000000b0020c83c9b05bmr8913185wri.343.1653062354562; Fri, 20
 May 2022 08:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220519154324.12531-1-atrajeev@linux.vnet.ibm.com>
 <CAP-5=fXrtTe=6-z8-OMzG60XZmA92nHEhc94+NyCJK-ZPDekPQ@mail.gmail.com>
 <YoedbRTgfdQs+7H0@kernel.org>
In-Reply-To: <YoedbRTgfdQs+7H0@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 May 2022 08:59:00 -0700
Message-ID: <CAP-5=fUyD=njaTYeGQkCL-KnNxB8M64G9Fe1_2_HS9w1AsKUqw@mail.gmail.com>
Subject: Re: [PATCH V2] tools/perf/test: Fix perf all PMU test to skip
 hv_24x7/hv_gpci tests on powerpc
To: Arnaldo Carvalho de Melo <acme@kernel.org>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, rnsastry@linux.ibm.com,
 linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, jolsa@kernel.org,
 kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 20, 2022 at 6:53 AM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> Em Thu, May 19, 2022 at 11:45:07AM -0700, Ian Rogers escreveu:
> > On Thu, May 19, 2022 at 8:43 AM Athira Rajeev
> > <atrajeev@linux.vnet.ibm.com> wrote:
> > >
> > > "perf all PMU test" picks the input events from
> > > "perf list --raw-dump pmu" list and runs "perf stat -e"
> > > for each of the event in the list. In case of powerpc, the
> > > PowerVM environment supports events from hv_24x7 and hv_gpci
> > > PMU which is of example format like below:
> > > - hv_24x7/CPM_ADJUNCT_INST,domain=?,core=?/
> > > - hv_gpci/event,partition_id=?/
> > >
> > > The value for "?" needs to be filled in depending on
> > > system and respective event. CPM_ADJUNCT_INST needs have
> > > core value and domain value. hv_gpci event needs partition_id.
> > > Similarly, there are other events for hv_24x7 and hv_gpci
> > > having "?" in event format. Hence skip these events on powerpc
> > > platform since values like partition_id, domain is specific
> > > to system and event.
> > >
> > > Fixes: 3d5ac9effcc6 ("perf test: Workload test of all PMUs")
> > > Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> > > ---
> > > Changelog:
> > >  v1 -> v2:
> > >  Instead of checking for platform, used the pmu name
> > >  ie, hv_24x7 and hv_gpci to skip the test since this
> > >  pmu name is specific to powerpc as suggested by
> > >  Michael Ellerman.
> > >
> > >  tools/perf/tests/shell/stat_all_pmu.sh | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/tools/perf/tests/shell/stat_all_pmu.sh b/tools/perf/tests/shell/stat_all_pmu.sh
> > > index b30dba455f36..7d046bb8a7b9 100755
> > > --- a/tools/perf/tests/shell/stat_all_pmu.sh
> > > +++ b/tools/perf/tests/shell/stat_all_pmu.sh
> > > @@ -5,6 +5,16 @@
> > >  set -e
> > >
> > >  for p in $(perf list --raw-dump pmu); do
> > > +  # In powerpc, skip the events for hv_24x7 and hv_gpci.
> > > +  # These events needs input values to be filled in for
> > > +  # core, chip, patition id based on system.
> > nit: s/patition/partition/
> > > +  # Example: hv_24x7/CPM_ADJUNCT_INST,domain=?,core=?/
> >
> > I've no problem with this patch, we may need to do similar for other
>
> Can I take this as an Acked-by?
>
> - Arnaldo


Acked-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> > architectures. For this specific problem I wonder if rather than
> > skipping the event the event can be fixed with domain and core set to
> > 1 ? This would provide a little additional coverage.
> >
> > Thanks,
> > Ian
> >
> > > +  # hv_gpci/event,partition_id=?/
> > > +  # Hence skip these events for ppc.
> > > +  if echo "$p" |grep -Eq 'hv_24x7|hv_gpci' ; then
> > > +    echo "Skipping: Event '$p' in powerpc"
> > > +    continue
> > > +  fi
> > >    echo "Testing $p"
> > >    result=$(perf stat -e "$p" true 2>&1)
> > >    if ! echo "$result" | grep -q "$p" && ! echo "$result" | grep -q "<not supported>" ; then
> > > --
> > > 2.35.1
> > >
>
> --
>
> - Arnaldo
