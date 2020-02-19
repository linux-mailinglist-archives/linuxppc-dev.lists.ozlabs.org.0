Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB481640DA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 10:54:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MtNX65R6zDqkw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 20:54:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MtLd0qhWzDqXB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 20:52:39 +1100 (AEDT)
Received: from mail-qk1-f181.google.com ([209.85.222.181]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N3bCH-1jVGld0Zox-010aKa for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb
 2020 10:52:34 +0100
Received: by mail-qk1-f181.google.com with SMTP id b7so22401884qkl.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 01:52:33 -0800 (PST)
X-Gm-Message-State: APjAAAX1nnGXDC0ZjWKCDsF8jWry7jmnsUFPJJlazd9GI3A/q949j4Fo
 88pMhFxRXmQhgTaoJt9s4zrZsVd204rBMz1SM2o=
X-Google-Smtp-Source: APXvYqz6sQrDPqUNAmecu/h04WniHkbB4ukHoV+epQJlqXgny5NFbF326v+1laQu3l+m+Fb5JwCdWHZ/0sv+ehZyuPE=
X-Received: by 2002:a05:620a:1530:: with SMTP id
 n16mr22824472qkk.394.1582105952127; 
 Wed, 19 Feb 2020 01:52:32 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
 <bd4557a7-9715-59aa-5d8e-488c5e516a98@c-s.fr>
 <20200109200733.GS3191@gate.crashing.org>
 <77a8bf25-6615-6c0a-56d4-eae7aa8a8f09@c-s.fr>
 <20200111113328.GX3191@gate.crashing.org>
 <CAK8P3a11wX1zJ+TAacDTkYsrzvfdVmNrcB6OC23aFvCxF57opQ@mail.gmail.com>
 <305fcee5-2e1b-ea4d-9a2a-a0e8034d40a8@c-s.fr>
In-Reply-To: <305fcee5-2e1b-ea4d-9a2a-a0e8034d40a8@c-s.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 19 Feb 2020 10:52:16 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0SfCwP04CJPThCuDmngGhwtejN8Px_UQpSwi=s_ww=bw@mail.gmail.com>
Message-ID: <CAK8P3a0SfCwP04CJPThCuDmngGhwtejN8Px_UQpSwi=s_ww=bw@mail.gmail.com>
Subject: Re: Surprising code generated for vdso_read_begin()
To: Christophe Leroy <christophe.leroy@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ISaef1eaC+okp9c8gsmqL+QKYLr4xHEYsI5tbfJHGYu2EhQKJIw
 m8oZtv0Hau+qtnRU9mJ9gQFITYXfj7wQWdOariW974XdaIMqlkA51qzrLYouL5dY/qGQgBl
 9RDC0sPUHoYLojpBkqF/AmWW4/XGIPOZVHpmdSLW2oUSyT97whsG4yLMks84hH6E5H2F1Go
 AId5POXCUUXUz5iDIxs5w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:i4Nyg9VAs8M=:UiGzquA3Pi7fsqkQqEvvas
 f9RytUv6//51t/2jYbm2WUTZVNrhIPncrwQHb0Hf9vug5AmnjhuKxtuMIj3TN7irVJcUbYhH/
 f8pj2RR3HD8pi+uWZfCb28iJJYWb3IWeirI5IN9gEduSsGq7qXAXc8D5bhpseUrtiwJhvpgo1
 4bK1j/WbOxDOr0zNkdyNedF0cyJVCVbOnIkhfAuGVOwaelo2gzQmlppKeRigsE4qaoB6K4Jl0
 VqaPI8HORR101Yc4zquvdnJ7dly63fIHyHBg0k6ntg7SFzFID3rGAFWQ0l1HTs4QkxtQ6sVMZ
 lF/a+RRdwykz51kC5VVu8giS/rOszxkjLoP1XdwvRcmhS0A8ldtEeYQOjKs8NS5JdW2BvCQJr
 CVFn2aSl4FgoZrNWMcMEVujx5zARBistOU4ThGSmisNKN5OLDQl0sfnm5MRA9f5u/DL5yiP4H
 woOPyRs0N3+Czloc5eWcIKExflp0o9ilzwqmuHzuz32UD1U1/M+5gTrt+gLATR4bea28AjEyv
 UZx9gTPfVYol/0XsGcLWzfOdTlkEZnaR2UgHWdgsk+mvmpTYvZRbjJwtucvZUHgloiiEJ1VeE
 DzU7/Fh/Oe1UILia9TZe7WGfuWVCkMoHSkGICXDigjTwlqGdOqkbZZbdCp0TeYEjShBhQFTTP
 c96vrD8T68JhirGonI29wivq7QWjT6l4sdxp4IbAilYanfO/dTz229tuTTuP8mYxwUbYa+VjU
 j6QFYDVYOTDZ4YhfUHwYSDMBnm0908/c9mC732XskCvnF6nWgkebgiqJj768eAzZykzpyUv4g
 MfzoNLhGeM1TPeNbjgqQpn6JyaIa++6Aqkrgz2ZR6AE6RcUXW0=
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

On Wed, Feb 19, 2020 at 9:45 AM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
> Le 16/02/2020 =C3=A0 19:10, Arnd Bergmann a =C3=A9crit :
> > On Sat, Jan 11, 2020 at 12:33 PM Segher Boessenkool
> > <segher@kernel.crashing.org> wrote:
> >>
> >> On Fri, Jan 10, 2020 at 07:45:44AM +0100, Christophe Leroy wrote:
> >>> Le 09/01/2020 =C3=A0 21:07, Segher Boessenkool a =C3=A9crit :
> >>>> It looks like the compiler did loop peeling.  What GCC version is th=
is?
> >>>> Please try current trunk (to become GCC 10), or at least GCC 9?
> >>>
> >>> It is with GCC 5.5
> >>>
> >>> https://mirrors.edge.kernel.org/pub/tools/crosstool/ doesn't have mor=
e
> >>> recent than 8.1
> >>
> >> Arnd, can you update the tools?  We are at 8.3 and 9.2 now :-)  Or is
> >> this hard and/or painful to do?
> >
> > To follow up on this older thread, I have now uploaded 6.5, 7.5, 8.3 an=
d 9.2
> > binaries, as well as a recent 10.0 snapshot.
> >
>
> Thanks Arnd,
>
> I have built the VDSO with 9.2, I get less performant result than with
> 8.2 (same performance as with 5.5).
>
> After a quick look, I see:
> - Irrelevant NOPs to align loops and stuff, allthough -mpcu=3D860 should
> avoid that.
> - A stack frame is set for saving r31 in __c_kernel_clock_gettime. GCC
> 8.1 don't need that, all VDSO functions are frameless with 8.1

If you think it should be fixed in gcc, maybe try to reproduce it in
https://godbolt.org/ and open a gcc bug against that.

Also, please try the gcc-10 snapshot, which has the highest chance
of getting fixes if it shows the same issue (or worse).

     Arnd
