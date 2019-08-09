Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 810228858F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2019 00:05:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464znj2sjpzDr5Z
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2019 08:05:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="F2iKZ4lO"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464zlj6msLzDr4D
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Aug 2019 08:03:45 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id d1so13673018pgp.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Aug 2019 15:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4YE5LFpbQmY5CUf9HiiZAitomsRy44hXFJVcN3+uc3g=;
 b=F2iKZ4lOk3Ih5R8vAeqlbdrBc0o0/2oPVqnxRiWVqXjqSSkS0hpJwY8/YpKGOaysmn
 S7RZmGdJWCcjYz5bky70ydz7Ay2uw/D5UfOz58OF/e09ambmcuAy/7caWD6Gu/8MZQDD
 kVqtz0SfTVti/fNY1P+4wOxv9CyVCfKZW/JhCEIdShv7eyoDF0003q3Qz5cDaNO/oV+8
 ocxCDTmnNj6lX9aKWMtmKBid2xr8N7AmyTYIAQSf2rpqUIxrXM6haG3j8DFCDjmQTg9z
 YMtbBY7z9XoMpxQTQAeQanKoqciXuUF8/jLaNvyJvHQlxiHfytWc3UIpLanxf2sUkmtH
 mUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4YE5LFpbQmY5CUf9HiiZAitomsRy44hXFJVcN3+uc3g=;
 b=oR9bqZpAjaBt8kUMtOiYXYT08MKPXwP2QeaUQbSw2eu6/qIfhJnLO1QNVZ25UDKwyJ
 b8IrAKpi5y/YtnS6XKwBD06h87nadK+qh9qYKD76mn8MG9E22IIeOhoTPSxJya9FHvoN
 gQ5lBOxo9dnetjf6+yogatN9C6XYV5rflZCaXfacqriXRz7DwYUsSPx28k6CpXq+uftp
 DtfTIUQJpn/2F3sYPNJC98EhM081jbE8Eeoe3J+kQZivawcubIZT4V92hgZTS0HdnKR/
 NAUcYju7WZUPxeD8E4vX6zt74qpNCAGBtD5kKSuZVmerNriE6ZYyroP3TTEFRfuTMd7I
 QdLg==
X-Gm-Message-State: APjAAAXKaiB1dQd7vvSkTJY/5jTgaT0odg6sQAnZr04PhsccWOXmvvMw
 BGWrjqgr5oo+BbjYivaUkXD35Y24g1fWaj281KuTwg==
X-Google-Smtp-Source: APXvYqzoA3qP5cLMx/N6kQkj8ONKAvUo3SkoeRrc9oKrOALvTgOH+HjnoEMS8kqTYGRPlpr+JSvGRCE1qbTPLaobk8c=
X-Received: by 2002:a63:61cd:: with SMTP id
 v196mr19675034pgb.263.1565388221708; 
 Fri, 09 Aug 2019 15:03:41 -0700 (PDT)
MIME-Version: 1.0
References: <87h873zs88.fsf@concordia.ellerman.id.au>
 <20190809182106.62130-1-ndesaulniers@google.com>
 <CAK8P3a3LynWTbpV8=VPm2TqgNM2MnoEyCPJd0PL2D+tcZqJgHg@mail.gmail.com>
 <20190809220301.Horde.AR6y4Bx4WGIq58V9K0En9g4@messagerie.si.c-s.fr>
 <CAK8P3a1AwmAe+PpHTRmN153fhG4ZkF_pb+240rj1ZAg-S6SKeg@mail.gmail.com>
In-Reply-To: <CAK8P3a1AwmAe+PpHTRmN153fhG4ZkF_pb+240rj1ZAg-S6SKeg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 9 Aug 2019 15:03:30 -0700
Message-ID: <CAKwvOdmhUPTUPa3=_AQ04zEDTsScduqOM29TfK656riAb_t=rQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc: fix inline asm constraints for dcbz
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: kbuild test robot <lkp@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 9, 2019 at 1:13 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Aug 9, 2019 at 10:02 PM Christophe Leroy
> <christophe.leroy@c-s.fr> wrote:
> >
> > Arnd Bergmann <arnd@arndb.de> a =C3=A9crit :
> > > On Fri, Aug 9, 2019 at 8:21 PM 'Nick Desaulniers' via Clang Built
> > > Linux <clang-built-linux@googlegroups.com> wrote:
> > >
> > >>  static inline void dcbz(void *addr)
> > >>  {
> > >> -       __asm__ __volatile__ ("dcbz %y0" : : "Z"(*(u8 *)addr) : "mem=
ory");
> > >> +       __asm__ __volatile__ ("dcbz %y0" : "=3DZ"(*(u8 *)addr) :: "m=
emory");
> > >>  }
> > >>
> > >>  static inline void dcbi(void *addr)
> > >>  {
> > >> -       __asm__ __volatile__ ("dcbi %y0" : : "Z"(*(u8 *)addr) : "mem=
ory");
> > >> +       __asm__ __volatile__ ("dcbi %y0" : "=3DZ"(*(u8 *)addr) :: "m=
emory");
> > >>  }
> > >
> > > I think the result of the discussion was that an output argument only=
 kind-of
> > > makes sense for dcbz, but for the others it's really an input, and cl=
ang is
> > > wrong in the way it handles the "Z" constraint by making a copy, whic=
h it
> > > doesn't do for "m".
> > >
> > > I'm not sure whether it's correct to use "m" instead of "Z" here, whi=
ch
> > > would be a better workaround if that works. More importantly though,
> > > clang really needs to be fixed to handle "Z" correctly.
> >
> > As the benefit is null, I think the best is probably to reverse my
> > original commit until at least CLang is fixed, as initialy suggested
> > by mpe
>
> Yes, makes sense.
>
> There is one other use of the "Z" constraint, so on top of the revert, I
> think it might be helpful if Nick could check if the patch below makes
> any difference with clang and, if it does, whether the current version
> is broken.
>
>        Arnd
>
> diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.=
h
> index 23e5d5d16c7e..28b467779328 100644
> --- a/arch/powerpc/include/asm/io.h
> +++ b/arch/powerpc/include/asm/io.h
> @@ -106,7 +106,7 @@ static inline u##size name(const volatile u##size
> __iomem *addr)    \
>  {                                                                      \
>         u##size ret;                                                    \
>         __asm__ __volatile__("sync;"#insn" %0,%y1;twi 0,%0,0;isync"     \
> -               : "=3Dr" (ret) : "Z" (*addr) : "memory");                =
 \
> +               : "=3Dr" (ret) : "m" (*addr) : "memory");                =
 \
>         return ret;                                                     \
>  }
>
> @@ -114,7 +114,7 @@ static inline u##size name(const volatile u##size
> __iomem *addr)    \
>  static inline void name(volatile u##size __iomem *addr, u##size val)   \
>  {                                                                      \
>         __asm__ __volatile__("sync;"#insn" %1,%y0"                      \
> -               : "=3DZ" (*addr) : "r" (val) : "memory");                =
 \
> +               : "=3Dm" (*addr) : "r" (val) : "memory");                =
 \
>         mmiowb_set_pending();                                           \
>  }

Does not work:
https://travis-ci.com/ClangBuiltLinux/continuous-integration/builds/1226548=
99
https://github.com/ClangBuiltLinux/continuous-integration/pull/197/files#di=
ff-40bd16e3188587e4d648c30e0c2d6d37

--=20
Thanks,
~Nick Desaulniers
