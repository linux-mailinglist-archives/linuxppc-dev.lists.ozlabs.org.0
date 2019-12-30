Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8814012CFF9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2019 13:31:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47mcGx3MFpzDq9s
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2019 23:31:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.75; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47mcCQ4VKlzDq9R
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2019 23:28:00 +1100 (AEDT)
Received: from mail-qt1-f169.google.com ([209.85.160.169]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1McYP5-1jJZo11zRN-00cwWi for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec
 2019 13:27:56 +0100
Received: by mail-qt1-f169.google.com with SMTP id t3so29508459qtr.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2019 04:27:56 -0800 (PST)
X-Gm-Message-State: APjAAAUCQGtvRxLBqRfP3d7EkcBlJ5F6v2QlOLJWQ1yDkMGOhuP+9d0D
 yXVWsyC6x5F4uEUmP1noshHtFQeacgw0kBA5oc4=
X-Google-Smtp-Source: APXvYqxPg18QcBCheXEg57bO676E88LDtMzW6UpknzYUThTzCz6Q+c1Pcfg/qqj52aosJr397+kYQUCE06+nF/bwaDM=
X-Received: by 2002:ac8:47d3:: with SMTP id d19mr47462525qtr.142.1577708875107; 
 Mon, 30 Dec 2019 04:27:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
 <47701b5fb73cf536db074031db8e6e3fa3695168.1577111365.git.christophe.leroy@c-s.fr>
In-Reply-To: <47701b5fb73cf536db074031db8e6e3fa3695168.1577111365.git.christophe.leroy@c-s.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 30 Dec 2019 13:27:39 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0QGtjygLJUWX_1-s1vfCzE6UoOzrb+OZWwjaBdh=RpVQ@mail.gmail.com>
Message-ID: <CAK8P3a0QGtjygLJUWX_1-s1vfCzE6UoOzrb+OZWwjaBdh=RpVQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/10] lib: vdso: ensure all arches have 32bit
 fallback
To: Christophe Leroy <christophe.leroy@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:O/w8kigMHYK5xyDRJmLZIa6IvTDx2yhPyOTG0KoRISrdHTfwHnq
 +Pg55/BH1AnrNCrldefEyyMyEWZwyjWaa/parwk40U/frO0qvo017LkAbh0ULYr3nxVsbvw
 /XEiuHV44e0luvz6/74Ghvs5k3yeh/sY+XJ1CAp/ymu2QGGEvXK9uclrQtaV5hhlOnU6ssH
 9LEkxdAM98+YdrFa2qCkg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JMWVg5/MiRs=:3GR6JAL04ZxsH/qJ2aMdxg
 vtJCxVM23yqY09pgMbznsK+ZjOfPfAYsjFc4K6hcRXYKB9cGvIn96np8ea6o0DCfsrCvJf4tl
 BWKbK4XociNC6wf0zYG9cymHjxHiROIpCxAwsQrefNq1tSGUDmNnSOyzWybReRSP6jR5S4W6Q
 9nOP06FNEVjR+ZZpUbBwAdufOljA470+xQ593oAhAOm/LqFKLV+ey1h1Rd/Hoi8PgTv/xb+4Y
 3FicG1uqvYucJTNRLsFM7zTy5xtSN4JCvwWQyRNprV1AecpXwmZw9nXlsyljHEliJwueKh5ss
 vThALtCsWOaDLj3YPZwWRd5PMnHY0kRVAnHuhvFH/NNREtKFK31M09drZtyTGkfi1MQkKo5co
 PJRecebYOWOt0k9LwFXmUsUoYc4ahAypHJ/NI6vJiLOhyVRqJ2xD64X+NGi/0KSX6Jw+G/afs
 7tCYOuNMKszcas40/4MhvYNNAkVLiuV6tfsBJzuBMGnuyP3A44pPl/s8jTUyUbSnGKoArEXg+
 TyzFat7buAvTCG5XnYAKeP0XTdGYZNwDZ63Rr4J9M1tuXC+M87yRy07bUajFxASoVEKaloYNL
 SDcKyo52+gT2rrhvE8DiaGfkXIxAR48pVtprPgetCSE2Di3aIajYhgoilCoWKNNvh6QmSPa38
 uodFajexWSBoqGFX62uaHSSZRAoFbzhxlmTtzIzuhPXD+oT89udg6BNuZGbvDhputPgDbODWL
 VAwhApaDW6phMvd94bY6JKv5dK6fhVQXKnSKo3HAnZZCLaCAPM93FJOZ5m2VwOnoaX552vT+D
 42LWMfmCRUXychsaLcUcHNA9Vn9qEQKJYU10rjUzs0HiOKGp05ymYtFEAq1fnuMt4g7LAz1/M
 EwR8/8YlFiC+6LJpAvLw==
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
Cc: the arch/x86 maintainers <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 23, 2019 at 3:31 PM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
> In order to simplify next step which moves fallback call at arch
> level, ensure all arches have a 32bit fallback instead of handling
> the lack of 32bit fallback in the common code based
> on VDSO_HAS_32BIT_FALLBACK
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

I like the idea of removing VDSO_HAS_32BIT_FALLBACK and ensuring
that all 32-bit architectures implement them, but we really should *not*
have any implementation calling the 64-bit syscalls.

> +static __always_inline
> +long clock_gettime32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
> +{
> +       struct __kernel_timespec ts;
> +       int ret = clock_gettime_fallback(clock, &ts);
> +
> +       if (likely(!ret)) {
> +               _ts->tv_sec = ts.tv_sec;
> +               _ts->tv_nsec = ts.tv_nsec;
> +       }
> +       return ret;
> +}
> +
> +static __always_inline
> +long clock_getres32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
> +{
> +       struct __kernel_timespec ts;
> +       int ret = clock_getres_fallback(clock, &ts);
> +
> +       if (likely(!ret && _ts)) {
> +               _ts->tv_sec = ts.tv_sec;
> +               _ts->tv_nsec = ts.tv_nsec;
> +       }
> +       return ret;
> +}

Please change these to call __NR_clock_gettime and __NR_clock_getres_time
instead of __NR_clock_gettime64/__NR_clock_getres_time64 for multiple reasons.

- When doing migration between containers, the vdso may get copied into
  an application running on a kernel that does not support the time64
  variants, and then the fallback fails.

- When CONFIG_COMPAT_32BIT_TIME is disabled, the time32 syscalls
  return -ENOSYS, and the vdso version should have the exact same behavior
  to avoid surprises. In particular an application that checks clock_gettime()
  to see if the time32 are in part of the kernel would get an incorrect result
  here.

arch/arm64/include/asm/vdso/compat_gettimeofday.h already does this,
I think you can just copy the implementation or find a way to share it.

> diff --git a/arch/arm64/include/asm/vdso/gettimeofday.h b/arch/arm64/include/asm/vdso/gettimeofday.h
> index b08f476b72b4..c41c86a07423 100644
> --- a/arch/arm64/include/asm/vdso/gettimeofday.h
> +++ b/arch/arm64/include/asm/vdso/gettimeofday.h
> @@ -66,6 +66,32 @@ int clock_getres_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
>         return ret;
>  }
>
> +static __always_inline
> +long clock_gettime32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
> +{
> +       struct __kernel_timespec ts;
> +       int ret = clock_gettime_fallback(clock, &ts);
> +
> +       if (likely(!ret)) {
> +               _ts->tv_sec = ts.tv_sec;
> +               _ts->tv_nsec = ts.tv_nsec;
> +       }
> +       return ret;
> +}

As Andy said, this makes no sense at all, nothing should ever call this on a
64-bit architecture.

> diff --git a/arch/mips/include/asm/vdso/gettimeofday.h b/arch/mips/include/asm/vdso/gettimeofday.h
> index b08825531e9f..60608e930a5c 100644
> --- a/arch/mips/include/asm/vdso/gettimeofday.h
> +++ b/arch/mips/include/asm/vdso/gettimeofday.h
> @@ -109,8 +109,6 @@ static __always_inline int clock_getres_fallback(
>
>  #if _MIPS_SIM != _MIPS_SIM_ABI64
>
> -#define VDSO_HAS_32BIT_FALLBACK        1
> -
>  static __always_inline long clock_gettime32_fallback(
>                                         clockid_t _clkid,
>                                         struct old_timespec32 *_ts)
> @@ -150,6 +148,32 @@ static __always_inline int clock_getres32_fallback(
>
>         return error ? -ret : ret;
>  }
> +#else
> +static __always_inline
> +long clock_gettime32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
> +{
> +       struct __kernel_timespec ts;
> +       int ret = clock_gettime_fallback(clock, &ts);
> +
> +       if (likely(!ret)) {
> +               _ts->tv_sec = ts.tv_sec;
> +               _ts->tv_nsec = ts.tv_nsec;
> +       }
> +       return ret;
> +}
> +

Same here.

> --- a/lib/vdso/gettimeofday.c
> +++ b/lib/vdso/gettimeofday.c
> @@ -125,13 +125,8 @@ __cvdso_clock_gettime32(clockid_t clock, struct old_timespec32 *res)
>
>         ret = __cvdso_clock_gettime_common(clock, &ts);
>
> -#ifdef VDSO_HAS_32BIT_FALLBACK
>         if (unlikely(ret))
>                 return clock_gettime32_fallback(clock, res);
> -#else
> -       if (unlikely(ret))
> -               ret = clock_gettime_fallback(clock, &ts);
> -#endif
>
>         if (likely(!ret)) {
>                 res->tv_sec = ts.tv_sec;

Removing the #ifdef and the fallback seems fine. I think this is actually
required for correctness on arm32 as well. Maybe enclose the entire function in

#ifdef VDSO_HAS_CLOCK_GETTIME32

to only define it when it is called?

> @@ -238,13 +233,8 @@ __cvdso_clock_getres_time32(clockid_t clock, struct old_timespec32 *res)
>
>         ret = __cvdso_clock_getres_common(clock, &ts);
>
> -#ifdef VDSO_HAS_32BIT_FALLBACK
>         if (unlikely(ret))
>                 return clock_getres32_fallback(clock, res);
> -#else
> -       if (unlikely(ret))
> -               ret = clock_getres_fallback(clock, &ts);
> -#endif

The same applies to all the getres stuff of course.

      Arnd
