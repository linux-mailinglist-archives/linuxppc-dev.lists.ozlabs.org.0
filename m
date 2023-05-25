Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4745711AC3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 01:41:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QS4Mg4L4Kz3cJg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 09:41:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=h2cj+uGn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=h2cj+uGn;
	dkim-atps=neutral
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QS4Ln5yP5z3bgs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 09:41:03 +1000 (AEST)
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-774942ddfe0so22973739f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 May 2023 16:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685058057; x=1687650057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3YzCxsRkWRgjvxa97wKSZh7dXjwpqx38ke3QcUo28Gw=;
        b=h2cj+uGnsZaneX3U/guQy4WRWK8bSGCWCueYbMhG7MphLNIFG+GjpY+tpCTkmE/u9W
         hOD5o2YG80g7tNfCnEyOck168jHQaRXYvGAVxhmXTVMapTCYICCkF6v5kt7vf97qto6U
         gGdAtC4SxqTbE2SzFjQFBeXRPkflAShbXEnAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685058057; x=1687650057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3YzCxsRkWRgjvxa97wKSZh7dXjwpqx38ke3QcUo28Gw=;
        b=dS1vqSZ44C88Bd1R000+W2oFNqvwZpPivZF7Vz69FytquYxgHF+jc291QTfZT166ZK
         dEJ8RUmjRHCCWh1oLtag1TXtrSBIf4yV9B3pIV8eLDEgxg98btevEOg1sFzTYvTTglRO
         mINrVi6vFn356IZz2j2SbhB2lzuY9vIPxDh3X8+HrqvDmBQgJFoEjRCKVcJDNKh5tik7
         Wg9k29ubEsUNLY8ZpGC6qmNuZs2XwdCXjqmccUchk5gMKaJu2nuvkm/hbQMMLoK+R3Ie
         iDDc0Y5p6JbaksoOb2iVRLS3Via/I5IE08+N9SAurCc67Kh4TvASLO5tTW9XYvxS5010
         ZIIg==
X-Gm-Message-State: AC+VfDytF+fT0mVD61pEkLBz6ifsicfecmmUsaRqGfca9O5vEkdgdZ/f
	9Jz0hHRkJWjAQfXJiD54cCh37wVXkAoOrrWhheQ=
X-Google-Smtp-Source: ACHHUZ4YBMlUEZyYbiCPg2b1SPtBQ2zNUSNqIqrCVrbWIVO4gPt/ri1vLcJMJo/YKJIYKfqot/uepw==
X-Received: by 2002:a92:4b0f:0:b0:33a:b647:1bcb with SMTP id m15-20020a924b0f000000b0033ab6471bcbmr29139ilg.20.1685058057628;
        Thu, 25 May 2023 16:40:57 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com. [209.85.166.182])
        by smtp.gmail.com with ESMTPSA id z2-20020a92d182000000b0032957b21c26sm617496ilz.77.2023.05.25.16.40.57
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 16:40:57 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-33828a86ee2so61645ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 May 2023 16:40:57 -0700 (PDT)
X-Received: by 2002:a05:6e02:1c84:b0:331:a582:1c63 with SMTP id
 w4-20020a056e021c8400b00331a5821c63mr3274ill.3.1685057600304; Thu, 25 May
 2023 16:33:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.12.I91f7277bab4bf8c0cb238732ed92e7ce7bbd71a6@changeid> <ZG4TW--j-DdSsUO6@alley>
In-Reply-To: <ZG4TW--j-DdSsUO6@alley>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 25 May 2023 16:33:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vu4BSec-kDxf8oS+DDcb+3W6RS-Z-Ouu-+sRnk2zhSrQ@mail.gmail.com>
Message-ID: <CAD=FV=Vu4BSec-kDxf8oS+DDcb+3W6RS-Z-Ouu-+sRnk2zhSrQ@mail.gmail.com>
Subject: Re: [PATCH v5 12/18] watchdog/hardlockup: Rename some "NMI watchdog" constants/function
To: Petr Mladek <pmladek@suse.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, ito-yuichi@fujitsu.com, Lecopzer Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Marc Zyngier <maz@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozl
 abs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Wed, May 24, 2023 at 6:38=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> On Fri 2023-05-19 10:18:36, Douglas Anderson wrote:
> > Do a search and replace of:
> > - NMI_WATCHDOG_ENABLED =3D> WATCHDOG_HARDLOCKUP_ENABLED
> > - SOFT_WATCHDOG_ENABLED =3D> WATCHDOG_SOFTOCKUP_ENABLED
> > - watchdog_nmi_ =3D> watchdog_hardlockup_
> > - nmi_watchdog_available =3D> watchdog_hardlockup_available
> > - nmi_watchdog_user_enabled =3D> watchdog_hardlockup_user_enabled
> > - soft_watchdog_user_enabled =3D> watchdog_softlockup_user_enabled
> > - NMI_WATCHDOG_DEFAULT =3D> WATCHDOG_HARDLOCKUP_DEFAULT
> >
> > Then update a few comments near where names were changed.
> >
> > This is specifically to make it less confusing when we want to
> > introduce the buddy hardlockup detector, which isn't using NMIs. As
> > part of this, we sanitized a few names for consistency.
> >
> > --- a/kernel/watchdog.c
> > +++ b/kernel/watchdog.c
> > @@ -30,17 +30,17 @@
> >  static DEFINE_MUTEX(watchdog_mutex);
> >
> >  #if defined(CONFIG_HARDLOCKUP_DETECTOR) || defined(CONFIG_HAVE_NMI_WAT=
CHDOG)
> > -# define NMI_WATCHDOG_DEFAULT        1
> > +# define WATCHDOG_HARDLOCKUP_DEFAULT 1
> >  #else
> > -# define NMI_WATCHDOG_DEFAULT        0
> > +# define WATCHDOG_HARDLOCKUP_DEFAULT 0
> >  #endif
> >
> >  unsigned long __read_mostly watchdog_enabled;
> >  int __read_mostly watchdog_user_enabled =3D 1;
> > -int __read_mostly nmi_watchdog_user_enabled =3D NMI_WATCHDOG_DEFAULT;
> > -int __read_mostly soft_watchdog_user_enabled =3D 1;
> > +int __read_mostly watchdog_hardlockup_user_enabled =3D WATCHDOG_HARDLO=
CKUP_DEFAULT;
> > +int __read_mostly watchdog_softlockup_user_enabled =3D 1;
>
> I still see nmi_watchdog_user_enabled and soft_watchdog_user_enabled
> in include/linux/nmi.h. They are declared there and also mentioned
> in a comment.
>
> It seems that they do not actually need to be declared there.
> I guess that it was need for the /proc stuff. But it was
> moved into kernel/watchdog.c by the commit commit dd0693fdf054f2ed37
> ("watchdog: move watchdog sysctl interface to watchdog.c").
>
> >  int __read_mostly watchdog_thresh =3D 10;
> > -static int __read_mostly nmi_watchdog_available;
> > +static int __read_mostly watchdog_hardlockup_available;
> >
> >  struct cpumask watchdog_cpumask __read_mostly;
> >  unsigned long *watchdog_cpumask_bits =3D cpumask_bits(&watchdog_cpumas=
k);
>
> Otherwise, I like the changes.
>
> With the following:
>
> diff --git a/include/linux/nmi.h b/include/linux/nmi.h
> index 83076bf70ce8..d14fe345eae9 100644
> --- a/include/linux/nmi.h
> +++ b/include/linux/nmi.h
> @@ -17,8 +17,6 @@ void lockup_detector_soft_poweroff(void);
>  void lockup_detector_cleanup(void);
>
>  extern int watchdog_user_enabled;
> -extern int nmi_watchdog_user_enabled;
> -extern int soft_watchdog_user_enabled;
>  extern int watchdog_thresh;
>  extern unsigned long watchdog_enabled;
>
> @@ -68,8 +66,8 @@ static inline void reset_hung_task_detector(void) { }
>   * 'watchdog_enabled' variable. Each lockup detector has its dedicated b=
it -
>   * bit 0 for the hard lockup detector and bit 1 for the soft lockup dete=
ctor.
>   *
> - * 'watchdog_user_enabled', 'nmi_watchdog_user_enabled' and
> - * 'soft_watchdog_user_enabled' are variables that are only used as an
> + * 'watchdog_user_enabled', 'watchdog_hardlockup_user_enabled' and
> + * 'watchdog_softlockup_user_enabled' are variables that are only used a=
s an
>   * 'interface' between the parameters in /proc/sys/kernel and the intern=
al
>   * state bits in 'watchdog_enabled'. The 'watchdog_thresh' variable is
>   * handled differently because its value is not boolean, and the lockup
>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
>
> Even better might be to remove the unused declaration in a separate
> patch. I think that more declarations are not needed after moving
> the /proc stuff into kernel/watchdog.c.
>
> But it might also be fixed later.

Breadcrumbs: I squashed your suggestion together with Tom's patch and
posted the result:

https://lore.kernel.org/r/20230525162822.1.I0fb41d138d158c9230573eaa37dc56a=
fa2fb14ee@changeid

-Doug
