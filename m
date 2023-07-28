Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B734C76715B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 18:02:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=efVlqDVS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RCC7s4clcz3cPN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 02:02:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=efVlqDVS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RCC6w47cvz2yq3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jul 2023 02:01:27 +1000 (AEST)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-40631c5b9e9so298641cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 09:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690560083; x=1691164883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZH6nQn01C8Sr35XvItongnJrzthU2bVlvOmhLP0Vz4=;
        b=efVlqDVSjL6hA7pH00Obl7K/hepyTwEAmwJ9S77NzwRdLZhvsACfpPSV/UEEDWueDO
         WqpN1pZSCukYdKhuENE81FkCJ41Or7iSNohh3brPPiPR/EJcdFWXy3CxD1/Ezu2LfaMJ
         dDIqc7PSfthEwCbT4aH/hWJxzMmziJXj074F6WkoQ0jMqgjGNCTFB8lMxYCoB6mxTa6v
         TFXANH5T2OzmoPWaxtENtjUldT8CS6rV6cyAGsqj4i7z0uhCJVJK++r+84cErubxBpJS
         THtb+DI/cGVHK6IKxTtJHZVYVM+A/wShTe8cBebMKoPDyvb8rij1DmDWRBAMYmW4tR3S
         hVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690560083; x=1691164883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZH6nQn01C8Sr35XvItongnJrzthU2bVlvOmhLP0Vz4=;
        b=J7n2LCdkIo6Yb1mN3lKp9k2l8ct9uXHuKFMA80+xZ6cF10nP37tmcCaOzKP0pMmy8r
         8B+Ur2M0M41qPl2iSRCMUpCiw/QpfYrv/oQMa34xkrqReYHkOd2fsLTv2rt0wg3WbOO9
         FvGpRPTcptby38bHTGKf2Z/ar0G9r3/4I9kj0K2fEpzrw39c7l1BW0jGWIiTGEiLu8iG
         oDfeMPJyCoo/RkUnolIeV2cQpzcqj+c7mVuwl7Z+fkdmWg+FM0COkRgE7sgT+H8k4KpI
         1Y5KHjHLZQOJkQPh7CPS8rr2lohYtYuzRPcrCbf6tlV4UVsiakokEj2sg2Tx1F0U9HZC
         EcpQ==
X-Gm-Message-State: ABy/qLbTtsR8zgyeL/dOaVQ3K7g7AiUsLD+8/Y3BNbTOqwJX0XUr9Jy3
	O4QoaRRlMK4SziPCWYEZSCc2NlffgdJ2S22SJ7ogfg==
X-Google-Smtp-Source: APBJJlGz8xBM5B0JACXOlDeDiPzvNUvs8ZfSUITEkeaXWUnL/b+pJDlsmnUkdUfhBNfddso1uEi2UhmOVMqQozMD6zs=
X-Received: by 2002:a05:622a:15d2:b0:3f5:2006:50f1 with SMTP id
 d18-20020a05622a15d200b003f5200650f1mr318937qty.12.1690560083088; Fri, 28 Jul
 2023 09:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230725061649.34937-1-adityag@linux.ibm.com> <ZMPWk5K63tadmDlU@kernel.org>
In-Reply-To: <ZMPWk5K63tadmDlU@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Fri, 28 Jul 2023 09:01:11 -0700
Message-ID: <CAP-5=fW1zkpJ4zr4ngz=6bZQuE6hOHo4AtXwUsVJK9oiDSc_mg@mail.gmail.com>
Subject: Re: [PATCH 1/1] perf tests task_analyzer: Check perf build options
 for libtraceevent support
To: Arnaldo Carvalho de Melo <acme@kernel.org>
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
Cc: maddy@linux.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, disgoel@linux.vnet.ibm.com, linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com, jolsa@kernel.org, namhyung@kernel.org, Aditya Gupta <adityag@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 28, 2023 at 7:54=E2=80=AFAM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> Em Tue, Jul 25, 2023 at 11:46:49AM +0530, Aditya Gupta escreveu:
> > Currently we depend on output of 'perf record -e "sched:sched_switch"',=
 to
> > check whether perf was built with libtraceevent support.
> >
> > Instead, a more straightforward approach can be to check the build opti=
ons,
> > using 'perf version --build-options', to check for libtraceevent suppor=
t.
> >
> > When perf is compiled WITHOUT libtraceevent ('make NO_LIBTRACEEVENT=3D1=
'),
> > 'perf version --build-options' outputs (output trimmed):
> >
> >        ...
> >          libtraceevent: [ OFF ]  # HAVE_LIBTRACEEVENT
> >        ...
> >
> > While, when perf is compiled WITH libtraceevent,
> >
> > 'perf version --build-options' outputs:
> >
> > ...
> >          libtraceevent: [ on ]  # HAVE_LIBTRACEEVENT
> >        ...
> >
> > Suggested-by: Ian Rogers <irogers@google.com>
> > Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>
> > ---
> >
> >  tools/perf/tests/shell/test_task_analyzer.sh | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/perf/tests/shell/test_task_analyzer.sh b/tools/perf/=
tests/shell/test_task_analyzer.sh
> > index 0095abbe20ca..a28d784987b4 100755
> > --- a/tools/perf/tests/shell/test_task_analyzer.sh
> > +++ b/tools/perf/tests/shell/test_task_analyzer.sh
> > @@ -52,7 +52,7 @@ find_str_or_fail() {
> >
> >  # check if perf is compiled with libtraceevent support
> >  skip_no_probe_record_support() {
> > -     perf record -e "sched:sched_switch" -a -- sleep 1 2>&1 | grep "li=
btraceevent is necessary for tracepoint support" && return 2
> > +     perf version --build-options | grep HAVE_LIBTRACEEVENT | grep -q =
OFF && return 2
> >       return 0
>
> I'll apply this, but please consider adding a:
>
>         perf build --has libtraceevent

That's a nice idea. You mean add a script like perf-archive.sh?
Perhaps this flag should be supported by perf version instead.

Thanks,
Ian

> subcommand to have that query made more compact and to avoid the two
> extra grep.
>
> BTW, I'll change that to:
>
> [acme@quaco perf-tools-next]$ perf version --build-options | grep " on .*=
 HAVE_LIBTRACEEVENT"
>          libtraceevent: [ on  ]  # HAVE_LIBTRACEEVENT
> [acme@quaco perf-tools-next]$
>
> replacing "on" with OFF, so that we have just one grep.
>
> Thanks,
>
> - Arnaldo
>
> >  }
> >
> > --
> > 2.41.0
> >
>
> --
>
> - Arnaldo
