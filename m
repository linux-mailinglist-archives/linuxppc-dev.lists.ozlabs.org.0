Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC9B10EB5B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 15:10:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RRpc085jzDqNb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 01:10:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.130; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RRgV02kgzDqNR
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2019 01:04:20 +1100 (AEDT)
Received: from mail-qt1-f181.google.com ([209.85.160.181]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M6UqP-1ii4lI3AT3-006xSJ for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Dec
 2019 15:04:13 +0100
Received: by mail-qt1-f181.google.com with SMTP id w47so37372179qtk.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Dec 2019 06:04:11 -0800 (PST)
X-Gm-Message-State: APjAAAWy9dIhAG2ZMhSQIhVivFYzSMb1EgAqg5eN34+F3U3GQmnigYiV
 1ZWirX39zuInMU9agAKbzL76VXpTyqFIpQlQCIg=
X-Google-Smtp-Source: APXvYqzY2KEySxcGaO1R0Ld5UfDskq+N3EoKgH5LDEY9SHFisuuB6M4zP0b90vsGoCLiwhc3LVgsBhBPXEnHoaHQQbs=
X-Received: by 2002:ac8:27ab:: with SMTP id w40mr15859502qtw.18.1575295450496; 
 Mon, 02 Dec 2019 06:04:10 -0800 (PST)
MIME-Version: 1.0
References: <20191108210236.1296047-1-arnd@arndb.de>
 <20191108210824.1534248-7-arnd@arndb.de>
 <4faa78cd0a86cf5d0aea9bb16d03145c5745450b.camel@codethink.co.uk>
 <CAK8P3a1nRq98ngfKnR2Du+7_vOxSRFD9AyjHyUCsAtk_gLR_Uw@mail.gmail.com>
 <20191121172529.Horde.0uDMS4xQ-xexjp4a2mIoXQ5@messagerie.si.c-s.fr>
 <CAK8P3a1UmAYTx=Vv06xP=O-oYD8_HzNqMG0-p7GPP2xgzs+75w@mail.gmail.com>
 <85ba697d-1a09-f1b0-b6b6-a511a2920f93@c-s.fr>
In-Reply-To: <85ba697d-1a09-f1b0-b6b6-a511a2920f93@c-s.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 2 Dec 2019 15:03:53 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3-LCvF_V50k9Mwzc1coUjKc9kqVzYuD6bS6pg71hRJXQ@mail.gmail.com>
Message-ID: <CAK8P3a3-LCvF_V50k9Mwzc1coUjKc9kqVzYuD6bS6pg71hRJXQ@mail.gmail.com>
Subject: Re: [Y2038] [PATCH 07/23] y2038: vdso: powerpc: avoid timespec
 references
To: Christophe Leroy <christophe.leroy@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RxqWQ+A3nA9wkoRKMPapsqGtBEAn/SZwUyFQXujWSBl4MMoTitJ
 lSoKwbG1zsRYr8Eff3Cp1bdbaqIoEm5AqgIIFIFcOnYhLi5SMvRfqVss5o0ce1qlmNQexcl
 Mlmj4L3MEjKQ0vzRluzcJXlsECq48SeFhnku80Np413SjwreDjBlviozkUf4Vu5RfVEaGk2
 6NArRNaU+B4B1Q9h8Y20A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XzJD3ODFwM0=:cvKL0Iptwh5ajLCKZ3dinZ
 Jsfsr5heZU/cSlyLGtIgSnjpG5tIzzJSgiRs2+XJ57/s0lxq1QetCEhkgHonj4ChGRdyTITPE
 J9Umn42seOUA8R3iVQND3piSz5R2mXdQLxcZnxJk0V8Ff2NuU8J2Hox3b1GhQgjAevfzHjaHn
 5ofWZ1XPu8hnPPDjNceAHyMS+fiP24CUTm9zrLoY4znNm7Z7iUpzCgoT4jDEc683SNhoaaX0O
 zEUkKugyYpsKQ0H9UryR+aAkDMLE6K+dKmjgRTfCF1KuIrmaXTi64h5XTkjdnJAUtqytIjEQr
 AHVINfvd2nMC8sPj/eLOz49sGnXVTkYn2aW88tDwQF0jTO0LQNwJKHRxYb1Y3LIxf6bpYNMkt
 2Gy2Scr6SbclDAZ9RUhjc2x2pRM9TMNpkuutNhWJs50yFOzHmH/tUFL8IGZHXc3Kx4VXi7Wdr
 MYiNzL22RwHI2IQRNZT4NX5bDXPxb+VoRvtx+qRLHM08b508DrNJWnzEtMA799tjvA4Afi+Gl
 WSZuteWAT8RtS+fda9zY8xL7pH0l8zxOGeoj6SO4di95+ukI+P3CosCOlzTq7RxqSQSpaqNAS
 g+3NMAQK1GguD7NCb3o4E2/Iz2Ed3ZkLyh8ZNvX+UCQuX7+B1JA2bZgBRIPr6uc7wZiYDJ40E
 NzwuYtwDlk9uzB/or5ZRR5q/5tucZ1h1+MMTRKMfrwdrOJSqC0ZR9w6FZvjp4Z9tso7wsHqx9
 vQ8J/ulLAW2PjMzm7p+iliMdEwnrNJiPdpizi2HLcjbetvh3rSdqUc5fNlqejbxQaCWQk2QWk
 LiFev0dXDC9l3Jbyws+a0UIH2EHSAgUrVN837Hs0fTNQEuRznXO7Oi/OTfhXRiXITrYUszcn8
 nW8GVfTy4KZ2XVVROiyQ==
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
Cc: Ben Hutchings <ben.hutchings@codethink.co.uk>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 2, 2019 at 1:55 PM Christophe Leroy <christophe.leroy@c-s.fr> w=
rote:
> Le 27/11/2019 =C3=A0 12:03, Arnd Bergmann a =C3=A9crit :
> > On Thu, Nov 21, 2019 at 5:25 PM Christophe Leroy
> > <christophe.leroy@c-s.fr> wrote:
> >> Arnd Bergmann <arnd@arndb.de> a =C3=A9crit :
> >>> On Wed, Nov 20, 2019 at 11:43 PM Ben Hutchings
> >>> <ben.hutchings@codethink.co.uk> wrote:
> >>>>
> >>>> On Fri, 2019-11-08 at 22:07 +0100, Arnd Bergmann wrote:
> >>>>> @@ -192,7 +190,7 @@ V_FUNCTION_BEGIN(__kernel_time)
> >>>>>        bl      __get_datapage@local
> >>>>>        mr      r9, r3                  /* datapage ptr in r9 */
> >>>>>
> >>>>> -     lwz     r3,STAMP_XTIME+TSPEC_TV_SEC(r9)
> >>>>> +     lwz     r3,STAMP_XTIME_SEC+LOWPART(r9)
> >>>>
> >>>> "LOWPART" should be "LOPART".
> >>>>
> >>>
> >>> Thanks, fixed both instances in a patch on top now. I considered fold=
ing
> >>> it into the original patch, but as it's close to the merge window I'd
> >>> rather not rebase it, and this way I also give you credit for
> >>> finding the bug.
> >>
> >> Take care, might conflict with
> >> https://github.com/linuxppc/linux/commit/5e381d727fe8834ca5a126f510194=
a7a4ac6dd3a
> >
> > Sorry for my late reply. I see this commit and no other variant of it h=
as
> > made it into linux-next by now, so I assume this is not getting sent fo=
r v5.5
> > and it's not stopping me from sending my own pull request.
> >
> > Please let me know if I missed something and this will cause problems.
> >
> > On a related note: are you still working on the generic lib/vdso suppor=
t for
> > powerpc? Without that, future libc implementations that use 64-bit time=
_t
> > will have to use the slow clock_gettime64 syscall instead of the vdso,
> > which has a significant performance impact.
>
> I have left this generic lib/vdso subject aside for the moment, because
> performance is disappointing and its architecture doesn't real fit with
> powerpc ABI.
>
>  From a performance point of view, it is manipulating 64 bits vars where
> is could use 32 bits vars. Of course I understand that y2038 will anyway
> force the use of 64 bits for seconds, but at the time being powerpc32
> VDSO is using 32 bits vars for both secs and ns, it make the difference.

Do you think we could optimize the common code? This sounds like
it could improve things for other architectures as well.

> Also, the generic VDSO is playing too much with data on stacks and
> associated memory read/write/copies, which kills performance on RISC
> processors like powerpc. Inlining do_hres() for instance significantly
> improves that as it allow handling the 'struct __kernel_timespec ts' on
> registers instead of using stack.

That should be easy enough to change in the common code, as
long as adding 'inline' does not cause harm on x86 and arm.

> Regarding powerpc ABI, the issue is that errors shall be reported by
> setting the SO bit in CR register, and this cannot be done in C.
> This means:
> - The VDSO entry point must be in ASM and the generic VDSO C function
> must be called from there, it cannot be the VDSO entry point.
> - The VDSO fallback (ie the system call) cannot be done from the generic
> VDSO C function, it must be called from the ASM as well.

As far as I can tell, both the VDSO entry point and the fallback are
in architecture specific code on all architectures, so this does not
seem to be a show-stopper.

It also seems that they might be combined as long the current
powerpc code could be changed to use the generic vdso_data
structure definition: the existing code can keep being used for
gettimeofday(), clock_gettime(CLOCK_MONOTONIC, ...) and
clock_gettime(CLOCK_REALTIME), while the generic implementation
can be called for clock_gettime64(), clock_getres() and clock_gettime()
with other time clock IDs.

> Last point/question, what's the point in using 64 bits for nanoseconds
> on 32 bits arches ?

The __kernel_timespec structure is defined with two 64-bit members so
it has the same layout on both 32-bit and 64-bit architectures, which
lets us share the implementation of the compat syscall handlers
even on big-endian architectures, and it avoids accidentally leaking four
bytes of stack data when copying a timespec from kernel to user
space. The high 32 bits of the nanosecond are expected to always
be zero when copying to user space, and to be ignored when copied
into the kernel (see get_timespec64()).

Note that C99 and POSIX require tv_nsec to be 'long', so 64-bit
architectures have to make it 64-bit wide, and 32-bit architectures
end up including padding for it.

In the vdso_data, the "nsec" value is shifted, so it actually needs
more bits. I don't know if this is a strict requirement, or if we could
change it to be 32 bits non-shifted during the update at the cost
of losing 1 nanosecond of accuracy.

      Arnd
