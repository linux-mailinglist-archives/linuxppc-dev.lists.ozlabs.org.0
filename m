Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA464E554E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 16:33:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNsnP5b90z30GN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 02:33:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20210112.gappssmtp.com header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=zgJDIDgM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20210112.gappssmtp.com
 header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=zgJDIDgM; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNsmh1Wz4z2yXs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 02:32:29 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id
 bx24-20020a17090af49800b001c6872a9e4eso2147612pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Mar 2022 08:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hHqJ7+Kfbku9VkUOFf7SvrePTkZ3BoPFBvyMADfYmzQ=;
 b=zgJDIDgM7k22eDE1hF3S2Zv1opQG3jQse/V2sPGZwKCVmC5uFIaP5Em/1aMpN7mZJv
 8prqaWjo2hhgEn3KRvZVTuiDKX85Kvdt0QyZAGBS1ePh5M3d0WCztFkmeWkdzuo+oPV/
 ikL+TWkouMxPRNTPx7heTU6X/LGopLyqJD2cSEcQBysZvJZEE5/Ms6YQzu8j4X/kMG1J
 gRqPD9AcVYobvcZPS6rV53rKf+awJ5xPfLwYicc69aAZazzU59rwFQnGwzzqfO2NVJ+s
 yRwADavI0h6j5lzwW0lFEZ0Pug1znVqKC10T94W9ar0843Nz8lVTVfMq2MjwsqXpyx9A
 sltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hHqJ7+Kfbku9VkUOFf7SvrePTkZ3BoPFBvyMADfYmzQ=;
 b=K4TlOtEr9pQPVIGUqf3qvC+3S3Q0SR7vyQJt54W52p3mzf7DzVx9WsIa0x2p2MlmLx
 JFdPcFicQYXNsbBF8daMNjiL8BRTzNTx0zcdd58kXPTspIhcsD0sRiGJJMe58zUsH99A
 hEXerTwqlFLp11NVc4IDzJ5sGop7QLIwTM5REMKQ2VIal2+fM2FULnb3hwiBhi5tK+1q
 H51hAW7mlziPnqKA3bku+5DteHyf5qFl3PS14QCwBo6VNqvgG/actDRNZe1DzOXbeL9D
 Dwx47PnoBr44ot8VYqUn/grSjAwPI8Vq47sF39Rldh2NEQyXuTp/tAHmEl3rZ9kZGNPP
 D9uQ==
X-Gm-Message-State: AOAM531GE0JWONrai8WBmh6wKR+H5Q1MoQFCh0fzKBJjroKjPL/MPK4B
 TGBOV98iFEQqYgoVRxkCw+WoUJXFWiOqo01GFqO8PQ==
X-Google-Smtp-Source: ABdhPJxMaAlqh+THUTx3rsqi6rlkbYnuOPwDmDD217V9P03EI6lmk9eVDTgR5pBFMTX0jPvvdR/rN2wDzjG8ZqUozxw=
X-Received: by 2002:a17:90a:990c:b0:1bc:3c9f:2abe with SMTP id
 b12-20020a17090a990c00b001bc3c9f2abemr219010pjp.220.1648049546854; Wed, 23
 Mar 2022 08:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220318114133.113627-1-kjain@linux.ibm.com>
 <20220318114133.113627-2-kjain@linux.ibm.com>
 <CAPcyv4iqpTn89WLOW1XjFXGZEYG_MmPg+VQbcDJ9ygJ4Jaybtw@mail.gmail.com>
 <c198a1b5-cc7e-4e51-533b-a5794f506b17@linux.ibm.com>
 <CAPcyv4j9NQ-Msr6JCp95QWAdDyTfYr65fXCoHHtjipLA=oJeHA@mail.gmail.com>
 <877d8lgf1y.fsf@mpe.ellerman.id.au>
In-Reply-To: <877d8lgf1y.fsf@mpe.ellerman.id.au>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 23 Mar 2022 08:32:19 -0700
Message-ID: <CAPcyv4jjC8DAdNvJ5Y7HVG9Ss-hSk=Uae9kWoJ2ctwwe+w3__Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] powerpc/papr_scm: Fix build failure when
 CONFIG_PERF_EVENTS is not set
To: Michael Ellerman <mpe@ellerman.id.au>
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
 kajoljain <kjain@linux.ibm.com>, rnsastry@linux.ibm.com,
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

On Wed, Mar 23, 2022 at 3:05 AM Michael Ellerman <mpe@ellerman.id.au> wrote=
:
>
> Dan Williams <dan.j.williams@intel.com> writes:
> > On Tue, Mar 22, 2022 at 7:30 AM kajoljain <kjain@linux.ibm.com> wrote:
> >> On 3/22/22 03:09, Dan Williams wrote:
> >> > On Fri, Mar 18, 2022 at 4:42 AM Kajol Jain <kjain@linux.ibm.com> wro=
te:
> >> >>
> >> >> The following build failure occures when CONFIG_PERF_EVENTS is not =
set
> >> >> as generic pmu functions are not visible in that scenario.
> >> >>
> >> >> arch/powerpc/platforms/pseries/papr_scm.c:372:35: error: =E2=80=98s=
truct perf_event=E2=80=99 has no member named =E2=80=98attr=E2=80=99
> >> >>          p->nvdimm_events_map[event->attr.config],
> >> >>                                    ^~
> >> >> In file included from ./include/linux/list.h:5,
> >> >>                  from ./include/linux/kobject.h:19,
> >> >>                  from ./include/linux/of.h:17,
> >> >>                  from arch/powerpc/platforms/pseries/papr_scm.c:5:
> >> >> arch/powerpc/platforms/pseries/papr_scm.c: In function =E2=80=98pap=
r_scm_pmu_event_init=E2=80=99:
> >> >> arch/powerpc/platforms/pseries/papr_scm.c:389:49: error: =E2=80=98s=
truct perf_event=E2=80=99 has no member named =E2=80=98pmu=E2=80=99
> >> >>   struct nvdimm_pmu *nd_pmu =3D to_nvdimm_pmu(event->pmu);
> >> >>                                                  ^~
> >> >> ./include/linux/container_of.h:18:26: note: in definition of macro =
=E2=80=98container_of=E2=80=99
> >> >>   void *__mptr =3D (void *)(ptr);     \
> >> >>                           ^~~
> >> >> arch/powerpc/platforms/pseries/papr_scm.c:389:30: note: in expansio=
n of macro =E2=80=98to_nvdimm_pmu=E2=80=99
> >> >>   struct nvdimm_pmu *nd_pmu =3D to_nvdimm_pmu(event->pmu);
> >> >>                               ^~~~~~~~~~~~~
> >> >> In file included from ./include/linux/bits.h:22,
> >> >>                  from ./include/linux/bitops.h:6,
> >> >>                  from ./include/linux/of.h:15,
> >> >>                  from arch/powerpc/platforms/pseries/papr_scm.c:5:
> >> >>
> >> >> Fix the build issue by adding check for CONFIG_PERF_EVENTS config o=
ption
> >> >> and disabling the papr_scm perf interface support incase this confi=
g
> >> >> is not set
> >> >>
> >> >> Fixes: 4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support"=
) (Commit id
> >> >> based on linux-next tree)
> >> >> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> >> >> ---
> >> >>  arch/powerpc/platforms/pseries/papr_scm.c | 15 +++++++++++++++
> >> >
> >> > This is a bit messier than I would have liked mainly because it dump=
s
> >> > a bunch of ifdefery into a C file contrary to coding style, "Whereve=
r
> >> > possible, don't use preprocessor conditionals (#if, #ifdef) in .c
> >> > files". I would expect this all to move to an organization like:
> >>
> >> Hi Dan,
> >>       Thanks for reviewing the patches. Inorder to avoid the multiple
> >> ifdefs checks, we can also add stub function for papr_scm_pmu_register=
.
> >> With that change we will just have one ifdef check for
> >> CONFIG_PERF_EVENTS config in both papr_scm.c and nd.h file. Hence we c=
an
> >> avoid adding new files specific for papr_scm perf interface.
> >>
> >> Below is the code snippet for that change, let me know if looks fine t=
o
> >> you. I tested it
> >> with set/unset PAPR_SCM config value and set/unset PERF_EVENTS config
> >> value combinations.
> >>
> >> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c
> >> b/arch/powerpc/platforms/pseries/papr_scm.c
> >> index 4dd513d7c029..38fabb44d3c3 100644
> >> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> >> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> >> @@ -69,8 +69,6 @@
> >>  #define PAPR_SCM_PERF_STATS_EYECATCHER __stringify(SCMSTATS)
> >>  #define PAPR_SCM_PERF_STATS_VERSION 0x1
> >>
> >> -#define to_nvdimm_pmu(_pmu)    container_of(_pmu, struct nvdimm_pmu, =
pmu)
> >> -
> >>  /* Struct holding a single performance metric */
> >>  struct papr_scm_perf_stat {
> >>         u8 stat_id[8];
> >> @@ -346,6 +344,9 @@ static ssize_t drc_pmem_query_stats(struct
> >> papr_scm_priv *p,
> >>         return 0;
> >>  }
> >>
> >> +#ifdef CONFIG_PERF_EVENTS
> >> +#define to_nvdimm_pmu(_pmu)    container_of(_pmu, struct nvdimm_pmu, =
pmu)
> >> +
> >>  static int papr_scm_pmu_get_value(struct perf_event *event, struct
> >> device *dev, u64 *count)
> >>  {
> >>         struct papr_scm_perf_stat *stat;
> >> @@ -558,6 +559,10 @@ static void papr_scm_pmu_register(struct
> >> papr_scm_priv *p)
> >>         dev_info(&p->pdev->dev, "nvdimm pmu didn't register rc=3D%d\n"=
, rc);
> >>  }
> >>
> >> +#else
> >> +static inline void papr_scm_pmu_register(struct papr_scm_priv *p) { }
> >
> > Since this isn't in a header file, it does not need to be marked
> > "inline" the compiler will figure it out.
> >
> >> +#endif
> >
> > It might be time to create:
> >
> > arch/powerpc/platforms/pseries/papr_scm.h
> >
> > ...there is quite a bit of header material accrued in papr_scm.c and
> > once the ifdefs start landing in it then it becomes a nominal coding
> > style issue. That said, this is certainly more palatable than the
> > previous version. So if you don't want to create papr_scm.h yet for
> > this, at least make a note in the changelog that the first portion of
> > arch/powerpc/platforms/pseries/papr_scm.c is effectively papr_scm.h
> > content and may move there in the future, or something like that.
>
> IMHO the only thing that belongs in a header is content that's needed by
> other C files. As long as those types/declarations are only used in
> papr_scm.c then they should stay in the C file, and there's no need for
> a header.
>
> I know the coding style rule is "avoid ifdefs in .c files", but I'd
> argue that rule should be ignored if you're creating a header file
> purely so that you can use an ifdef :)
>
> Coding style also says:
>
>   Prefer to compile out entire functions, rather than portions of functio=
ns or
>   portions of expressions.  Rather than putting an ifdef in an expression=
, factor
>   out part or all of the expression into a separate helper function and a=
pply the
>   conditional to that function.
>
> Which is what we're doing here with eg. papr_scm_pmu_register().
>
> Certainly for this merge window I think introducing a header is likely
> to cause more problems than it solves, so let's not do that for now. We
> can revisit it for the next merge window.

Fair enough. Kajol, please turn that snippet proposal into a formal patch.
