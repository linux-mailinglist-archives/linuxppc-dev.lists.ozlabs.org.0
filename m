Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F20224E325C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 22:40:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMp1q6btYz30FQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 08:40:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20210112.gappssmtp.com header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=AJJS8AlL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20210112.gappssmtp.com
 header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=AJJS8AlL; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMp1B2GBwz2xrv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Mar 2022 08:39:35 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id w4so13832277ply.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 14:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hzlxuoVcUtFNyYhd7IaP3vW/n/31iVrjVI0cYpxyVIg=;
 b=AJJS8AlLvE3dh4Iw3f148oDobBs8GBjNK4HQR4fd1ld62s0aCs+22XINlkoJDU3AoS
 8uOi8t84billfQr0/CqrEHKAzh01irX6vV3+g/0cziRJHBRIamVkeOpo/BnaIatO7PZV
 Eh43oCbXlnRIdtB69OTh5c/BRYxUtttvmXan5DnrMyeb/hsvFapXSvlvx+JuWcvRFGHt
 Ntke3y/TTx6l6EOaJqInsPSOd9mVsFU0WbP2/5lR+aO70ZuS7ys8aNRkV3i6D/Lf0evC
 r6BJwCreN/NdOKs2SjJv0+1od6GQSOKpx1d5z0hh7EF2eui/EcuQxfMSPoOkBKCZ7FWC
 /+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hzlxuoVcUtFNyYhd7IaP3vW/n/31iVrjVI0cYpxyVIg=;
 b=TuTZftCO2NDUj8f6lq7dw3NX1M6lv6feD5y8/esVOSy9RjfxBcDLULXg3b2b+c1ah2
 KThZdoA09NYm6J/y2xap3RP/fynGxkFWWsddIR5UPVFajnNSJwGQ/zKu1mzGunHWu4a4
 szwplUp9aVTVUQA8e7VxzFjkpyNEMxwWqqwSezjpFCpFo5OePRqksDsMd9DSfOMIjNQ0
 zQ/jHAUtpn+hK7jc1zjB8BM8pRylq4G/ItLmfYr650CjvmiwIFXN7FT2P3qors5W915j
 rHGxk4RxbL82HTZdodfBesi/5FRHbtILhLl+gHwlzN6dHiXE4ggTlFdT5amsqKBH/hd4
 INKQ==
X-Gm-Message-State: AOAM533/sdVZOtW1F2RRXIklhtqny6fWg28dM9VpULpKVTY6LCF0GUE5
 h+k4VrRQXyKLT+tIg//q7AOFVxsplYwgPbB5oGPU0w==
X-Google-Smtp-Source: ABdhPJyzdofKTKHoiJ4iGCBbHSPi4Xc1wlwYjpgmL6SpWKAD7UioDwd+ubLQF8zj102JpbsH9iOBSWpSmWQXM5a6nHg=
X-Received: by 2002:a17:903:32c7:b0:154:4156:f384 with SMTP id
 i7-20020a17090332c700b001544156f384mr10917932plr.34.1647898771195; Mon, 21
 Mar 2022 14:39:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220318114133.113627-1-kjain@linux.ibm.com>
 <20220318114133.113627-2-kjain@linux.ibm.com>
In-Reply-To: <20220318114133.113627-2-kjain@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 21 Mar 2022 14:39:23 -0700
Message-ID: <CAPcyv4iqpTn89WLOW1XjFXGZEYG_MmPg+VQbcDJ9ygJ4Jaybtw@mail.gmail.com>
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

On Fri, Mar 18, 2022 at 4:42 AM Kajol Jain <kjain@linux.ibm.com> wrote:
>
> The following build failure occures when CONFIG_PERF_EVENTS is not set
> as generic pmu functions are not visible in that scenario.
>
> arch/powerpc/platforms/pseries/papr_scm.c:372:35: error: =E2=80=98struct =
perf_event=E2=80=99 has no member named =E2=80=98attr=E2=80=99
>          p->nvdimm_events_map[event->attr.config],
>                                    ^~
> In file included from ./include/linux/list.h:5,
>                  from ./include/linux/kobject.h:19,
>                  from ./include/linux/of.h:17,
>                  from arch/powerpc/platforms/pseries/papr_scm.c:5:
> arch/powerpc/platforms/pseries/papr_scm.c: In function =E2=80=98papr_scm_=
pmu_event_init=E2=80=99:
> arch/powerpc/platforms/pseries/papr_scm.c:389:49: error: =E2=80=98struct =
perf_event=E2=80=99 has no member named =E2=80=98pmu=E2=80=99
>   struct nvdimm_pmu *nd_pmu =3D to_nvdimm_pmu(event->pmu);
>                                                  ^~
> ./include/linux/container_of.h:18:26: note: in definition of macro =E2=80=
=98container_of=E2=80=99
>   void *__mptr =3D (void *)(ptr);     \
>                           ^~~
> arch/powerpc/platforms/pseries/papr_scm.c:389:30: note: in expansion of m=
acro =E2=80=98to_nvdimm_pmu=E2=80=99
>   struct nvdimm_pmu *nd_pmu =3D to_nvdimm_pmu(event->pmu);
>                               ^~~~~~~~~~~~~
> In file included from ./include/linux/bits.h:22,
>                  from ./include/linux/bitops.h:6,
>                  from ./include/linux/of.h:15,
>                  from arch/powerpc/platforms/pseries/papr_scm.c:5:
>
> Fix the build issue by adding check for CONFIG_PERF_EVENTS config option
> and disabling the papr_scm perf interface support incase this config
> is not set
>
> Fixes: 4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support") (Com=
mit id
> based on linux-next tree)
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/papr_scm.c | 15 +++++++++++++++

This is a bit messier than I would have liked mainly because it dumps
a bunch of ifdefery into a C file contrary to coding style, "Wherever
possible, don't use preprocessor conditionals (#if, #ifdef) in .c
files". I would expect this all to move to an organization like:

arch/powerpc/platforms/pseries/papr_scm/main.c
arch/powerpc/platforms/pseries/papr_scm/perf.c

...and a new config symbol like:

config PAPR_SCM_PERF
       depends on PAPR_SCM && PERF_EVENTS
       def_bool y

...with wrappers in header files to make everything compile away
without any need for main.c to carry an ifdef.

Can you turn a patch like that in the next couple days? Otherwise, I
think if Linus saw me sending a late breaking compile fix that threw
coding style out the window he'd have cause to just drop the pull
request entirely.
