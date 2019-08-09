Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D88883A9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 22:08:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464xBG6Xj2zDrBd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2019 06:08:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464x444TnPzDqXw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Aug 2019 06:02:43 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 464x3z4F4Tz9vBnX;
 Fri,  9 Aug 2019 22:02:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id YXoWW-H0Xvcu; Fri,  9 Aug 2019 22:02:39 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 464x3z37Mgz9vBnS;
 Fri,  9 Aug 2019 22:02:39 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 855AB98C; Fri,  9 Aug 2019 22:03:01 +0200 (CEST)
Received: from mry91-4-88-160-8-182.fbx.proxad.net
 (mry91-4-88-160-8-182.fbx.proxad.net [88.160.8.182]) by messagerie.si.c-s.fr
 (Horde Framework) with HTTP; Fri, 09 Aug 2019 22:03:01 +0200
Date: Fri, 09 Aug 2019 22:03:01 +0200
Message-ID: <20190809220301.Horde.AR6y4Bx4WGIq58V9K0En9g4@messagerie.si.c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] powerpc: fix inline asm constraints for dcbz
References: <87h873zs88.fsf@concordia.ellerman.id.au>
 <20190809182106.62130-1-ndesaulniers@google.com>
 <CAK8P3a3LynWTbpV8=VPm2TqgNM2MnoEyCPJd0PL2D+tcZqJgHg@mail.gmail.com>
In-Reply-To: <CAK8P3a3LynWTbpV8=VPm2TqgNM2MnoEyCPJd0PL2D+tcZqJgHg@mail.gmail.com>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
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

Arnd Bergmann <arnd@arndb.de> a =C3=A9crit=C2=A0:

> On Fri, Aug 9, 2019 at 8:21 PM 'Nick Desaulniers' via Clang Built
> Linux <clang-built-linux@googlegroups.com> wrote:
>
>>  static inline void dcbz(void *addr)
>>  {
>> -       __asm__ __volatile__ ("dcbz %y0" : : "Z"(*(u8 *)addr) : "memory"=
);
>> +       __asm__ __volatile__ ("dcbz %y0" : "=3DZ"(*(u8 *)addr) :: "memor=
y");
>>  }
>>
>>  static inline void dcbi(void *addr)
>>  {
>> -       __asm__ __volatile__ ("dcbi %y0" : : "Z"(*(u8 *)addr) : "memory"=
);
>> +       __asm__ __volatile__ ("dcbi %y0" : "=3DZ"(*(u8 *)addr) :: "memor=
y");
>>  }
>
> I think the result of the discussion was that an output argument only kin=
d-of
> makes sense for dcbz, but for the others it's really an input, and clang =
is
> wrong in the way it handles the "Z" constraint by making a copy, which it
> doesn't do for "m".
>
> I'm not sure whether it's correct to use "m" instead of "Z" here, which
> would be a better workaround if that works. More importantly though,
> clang really needs to be fixed to handle "Z" correctly.

As the benefit is null, I think the best is probably to reverse my=20=20
original=20commit until at least CLang is fixed, as initialy suggested=20=
=20
by=20mpe

Christophe



