Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5015F4E3617
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 02:45:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMvTK0BnXz30hh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 12:45:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20210112.gappssmtp.com header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=c1eIS7vo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20210112.gappssmtp.com
 header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=c1eIS7vo; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMvSd4Zm7z2x9W
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Mar 2022 12:45:20 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id u17so16945939pfk.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 18:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QIf4Hy84dx7L6X4BNNjvqyd7qQS9lH8gSrCqndVgulg=;
 b=c1eIS7vo7uHJkChkDX9E8UuibyJlcPj9ny6akRAfhecft5A4sQAAvRT6NWdrwAyYS1
 dhaWlwDJJ1cJQ9ZRJHl9EjacUiDF5EHf3CHkOAqMuf0zU49JchE3kIj49+xSipYMpZiR
 HImhOI6SXmdIbf5Eor+xzxKwjeQIQjsWyx8OU4AT+mnrMtNSqd3W8TbEmgIo7Y1ycTlD
 rVRjOa0tpXALsViv1QgoVdGtel5P6mOpCoBMe6neh7LZthVINVhnDwPsTLrKPRqvH1Ba
 hTfFX+3SOKUYmcJb74di86aoahq+yHYqmpEMYLfZnR7rPa1oD6FVpe5eB6p5JxtXIWju
 iwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QIf4Hy84dx7L6X4BNNjvqyd7qQS9lH8gSrCqndVgulg=;
 b=26B9z7YWluhwcgvqP9rJhxgnjGSKnquM0tXyJTI14m0yTLURqgxxtnE6zUlY4cvnZn
 WouoY1gggZdNBOnfr9C+vrpQJl+2iEoPGMS7T9zC0gzM+7AHIxx6sGXFkpxwr/BN+rL8
 ELsDgtPhqISK0PLfPXdymAHKO+cXYITxFhDpeI64gZ+Ewpo4WsMT0QUbsYZp7wOOXtsF
 vWu7y06uE6Rpou44wuG3CDZKcZvtQnblbuJZNdPpTMmQWoYlBuVnOj/cwbjWB44sBKp3
 FRpmePAMhCeytJQj5FMjdBnm60Vko8uCEQI7A+qJ3A9GYTpP6fXrsU9JNJVfhmkULrb4
 s18Q==
X-Gm-Message-State: AOAM530zK2AtMwGONgkZkkEnuReXRsQ3KQ5vJ4JYc2icPO3Lz9clNvWG
 gDVxRPGm5U5455BKbwuCInrfQUf23xYH653Ab7zRQg==
X-Google-Smtp-Source: ABdhPJzVR8hSV4LYUKgF5NX85hxfFWmgAFFzJsBeUycAZHnf4kgiNP9olDkABVHU+za3VoOGb088WtmKxpJ0jIdi06E=
X-Received: by 2002:a63:5c53:0:b0:381:309e:e72c with SMTP id
 n19-20020a635c53000000b00381309ee72cmr20646280pgm.40.1647913516040; Mon, 21
 Mar 2022 18:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220318114133.113627-1-kjain@linux.ibm.com>
 <20220318114133.113627-2-kjain@linux.ibm.com>
 <CAPcyv4iqpTn89WLOW1XjFXGZEYG_MmPg+VQbcDJ9ygJ4Jaybtw@mail.gmail.com>
In-Reply-To: <CAPcyv4iqpTn89WLOW1XjFXGZEYG_MmPg+VQbcDJ9ygJ4Jaybtw@mail.gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 21 Mar 2022 18:45:08 -0700
Message-ID: <CAPcyv4iNy-RqKgwc61c+hL9g1zAE_tL5r_mqUQwCiKTzevjoDA@mail.gmail.com>
Subject: Re: [PATCH 2/2] powerpc/papr_scm: Fix build failure when
 CONFIG_PERF_EVENTS is not set
To: Kajol Jain <kjain@linux.ibm.com>
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

On Mon, Mar 21, 2022 at 2:39 PM Dan Williams <dan.j.williams@intel.com> wro=
te:
>
> On Fri, Mar 18, 2022 at 4:42 AM Kajol Jain <kjain@linux.ibm.com> wrote:
> >
> > The following build failure occures when CONFIG_PERF_EVENTS is not set
> > as generic pmu functions are not visible in that scenario.
> >
> > arch/powerpc/platforms/pseries/papr_scm.c:372:35: error: =E2=80=98struc=
t perf_event=E2=80=99 has no member named =E2=80=98attr=E2=80=99
> >          p->nvdimm_events_map[event->attr.config],
> >                                    ^~
> > In file included from ./include/linux/list.h:5,
> >                  from ./include/linux/kobject.h:19,
> >                  from ./include/linux/of.h:17,
> >                  from arch/powerpc/platforms/pseries/papr_scm.c:5:
> > arch/powerpc/platforms/pseries/papr_scm.c: In function =E2=80=98papr_sc=
m_pmu_event_init=E2=80=99:
> > arch/powerpc/platforms/pseries/papr_scm.c:389:49: error: =E2=80=98struc=
t perf_event=E2=80=99 has no member named =E2=80=98pmu=E2=80=99
> >   struct nvdimm_pmu *nd_pmu =3D to_nvdimm_pmu(event->pmu);
> >                                                  ^~
> > ./include/linux/container_of.h:18:26: note: in definition of macro =E2=
=80=98container_of=E2=80=99
> >   void *__mptr =3D (void *)(ptr);     \
> >                           ^~~
> > arch/powerpc/platforms/pseries/papr_scm.c:389:30: note: in expansion of=
 macro =E2=80=98to_nvdimm_pmu=E2=80=99
> >   struct nvdimm_pmu *nd_pmu =3D to_nvdimm_pmu(event->pmu);
> >                               ^~~~~~~~~~~~~
> > In file included from ./include/linux/bits.h:22,
> >                  from ./include/linux/bitops.h:6,
> >                  from ./include/linux/of.h:15,
> >                  from arch/powerpc/platforms/pseries/papr_scm.c:5:
> >
> > Fix the build issue by adding check for CONFIG_PERF_EVENTS config optio=
n
> > and disabling the papr_scm perf interface support incase this config
> > is not set
> >
> > Fixes: 4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support") (C=
ommit id
> > based on linux-next tree)
> > Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> > ---
> >  arch/powerpc/platforms/pseries/papr_scm.c | 15 +++++++++++++++
>
> This is a bit messier than I would have liked mainly because it dumps
> a bunch of ifdefery into a C file contrary to coding style, "Wherever
> possible, don't use preprocessor conditionals (#if, #ifdef) in .c
> files". I would expect this all to move to an organization like:
>
> arch/powerpc/platforms/pseries/papr_scm/main.c
> arch/powerpc/platforms/pseries/papr_scm/perf.c
>
> ...and a new config symbol like:
>
> config PAPR_SCM_PERF
>        depends on PAPR_SCM && PERF_EVENTS
>        def_bool y
>
> ...with wrappers in header files to make everything compile away
> without any need for main.c to carry an ifdef.
>
> Can you turn a patch like that in the next couple days? Otherwise, I
> think if Linus saw me sending a late breaking compile fix that threw
> coding style out the window he'd have cause to just drop the pull
> request entirely.

Also, please base it on the current state of the libnvdimm-for-next
branch as -next includes some of the SMART health changes leading to
at least one conflict.
