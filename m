Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A56883C0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 22:17:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464xPZ4TkvzDrJs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2019 06:17:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.160.196; helo=mail-qt1-f196.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464xJD3m6TzDrC9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Aug 2019 06:13:16 +1000 (AEST)
Received: by mail-qt1-f196.google.com with SMTP id j15so3447863qtl.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Aug 2019 13:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GbPWtVLcWUFZEanEykp/OCGxgAAWNiMhq/BzUwSZwpc=;
 b=bOkZXVubzssogEnXSPF8hxw1oaioYIdqdOcBgPlCJU+d1ftUgV5jLgEdz7ETwlG83Q
 Pn8TlS9+1683W4BNpkiMdPNwNMWjcMN+gnRLafEuLuHoxn/18zPVEpEnHWQCvrWu7Dq2
 3h309Dx//CI7mp/NuqeyDnzV3Ah1OQnr67meKbtrBk0IEwuAsuNby1lqukkFKgGxu61t
 BtcDjmyb7qeEqmlDlWLoU04HUewSbNGC4n1wHrxnM8oAYcoJCT2zEtwVIJ+9Wq26PqnP
 M7t4OuZFfUokV8cwBqfPAwiwv23uIgVTuRBZQ8fzh8NdLcJqYiU2s8+8nFONcA0vKV5t
 555w==
X-Gm-Message-State: APjAAAUuMe3HmCOXHyw9nbul522MUDkwpppS7c68vIC87DHwnA1GxCFw
 N2OjfXBnkNzI9dhYkn1nkgAm0/EEfuM9lMXh9hI=
X-Google-Smtp-Source: APXvYqyk3q8MhchB1R6AFYNT+9FpyBYbsPgBvN9+GrgESLIDnDfEbrh9okrGG2cC4n/YagmVVq76vmcA8yBUqOX0j7Y=
X-Received: by 2002:a0c:ba2c:: with SMTP id w44mr19391116qvf.62.1565381592182; 
 Fri, 09 Aug 2019 13:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <87h873zs88.fsf@concordia.ellerman.id.au>
 <20190809182106.62130-1-ndesaulniers@google.com>
 <CAK8P3a3LynWTbpV8=VPm2TqgNM2MnoEyCPJd0PL2D+tcZqJgHg@mail.gmail.com>
 <20190809220301.Horde.AR6y4Bx4WGIq58V9K0En9g4@messagerie.si.c-s.fr>
In-Reply-To: <20190809220301.Horde.AR6y4Bx4WGIq58V9K0En9g4@messagerie.si.c-s.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 9 Aug 2019 22:12:56 +0200
Message-ID: <CAK8P3a1AwmAe+PpHTRmN153fhG4ZkF_pb+240rj1ZAg-S6SKeg@mail.gmail.com>
Subject: Re: [PATCH] powerpc: fix inline asm constraints for dcbz
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 9, 2019 at 10:02 PM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
> Arnd Bergmann <arnd@arndb.de> a =C3=A9crit :
> > On Fri, Aug 9, 2019 at 8:21 PM 'Nick Desaulniers' via Clang Built
> > Linux <clang-built-linux@googlegroups.com> wrote:
> >
> >>  static inline void dcbz(void *addr)
> >>  {
> >> -       __asm__ __volatile__ ("dcbz %y0" : : "Z"(*(u8 *)addr) : "memor=
y");
> >> +       __asm__ __volatile__ ("dcbz %y0" : "=3DZ"(*(u8 *)addr) :: "mem=
ory");
> >>  }
> >>
> >>  static inline void dcbi(void *addr)
> >>  {
> >> -       __asm__ __volatile__ ("dcbi %y0" : : "Z"(*(u8 *)addr) : "memor=
y");
> >> +       __asm__ __volatile__ ("dcbi %y0" : "=3DZ"(*(u8 *)addr) :: "mem=
ory");
> >>  }
> >
> > I think the result of the discussion was that an output argument only k=
ind-of
> > makes sense for dcbz, but for the others it's really an input, and clan=
g is
> > wrong in the way it handles the "Z" constraint by making a copy, which =
it
> > doesn't do for "m".
> >
> > I'm not sure whether it's correct to use "m" instead of "Z" here, which
> > would be a better workaround if that works. More importantly though,
> > clang really needs to be fixed to handle "Z" correctly.
>
> As the benefit is null, I think the best is probably to reverse my
> original commit until at least CLang is fixed, as initialy suggested
> by mpe

Yes, makes sense.

There is one other use of the "Z" constraint, so on top of the revert, I
think it might be helpful if Nick could check if the patch below makes
any difference with clang and, if it does, whether the current version
is broken.

       Arnd

diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index 23e5d5d16c7e..28b467779328 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -106,7 +106,7 @@ static inline u##size name(const volatile u##size
__iomem *addr)    \
 {                                                                      \
        u##size ret;                                                    \
        __asm__ __volatile__("sync;"#insn" %0,%y1;twi 0,%0,0;isync"     \
-               : "=3Dr" (ret) : "Z" (*addr) : "memory");                 \
+               : "=3Dr" (ret) : "m" (*addr) : "memory");                 \
        return ret;                                                     \
 }

@@ -114,7 +114,7 @@ static inline u##size name(const volatile u##size
__iomem *addr)    \
 static inline void name(volatile u##size __iomem *addr, u##size val)   \
 {                                                                      \
        __asm__ __volatile__("sync;"#insn" %1,%y0"                      \
-               : "=3DZ" (*addr) : "r" (val) : "memory");                 \
+               : "=3Dm" (*addr) : "r" (val) : "memory");                 \
        mmiowb_set_pending();                                           \
 }
