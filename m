Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF86333965
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 11:06:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwSQQ0VTtz3cVC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 21:06:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 314 seconds by postgrey-1.36 at boromir;
 Wed, 10 Mar 2021 21:05:47 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwSQ34Qzwz30Hc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 21:05:46 +1100 (AEDT)
Received: from mail-oi1-f169.google.com ([209.85.167.169]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M593i-1lL26D2MJY-001CoB for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar
 2021 11:00:21 +0100
Received: by mail-oi1-f169.google.com with SMTP id w65so18457337oie.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 02:00:20 -0800 (PST)
X-Gm-Message-State: AOAM532u8J/pxkY7GNiPWUZxELKsAyxCSEbZs9H3FWkvpNcYDomRY4pJ
 38cTicdcOdfyK0G8tV+5elym/AggiM6MsSwRbg8=
X-Google-Smtp-Source: ABdhPJz57LKzxKPOX8uFg4l8cQDX68aMXQSUFxgEEkBEVQzSWLTS5wn+SJ00u096OqMsz2UiKEGrsCkrnzqbLH7kTeM=
X-Received: by 2002:aca:bf44:: with SMTP id p65mr1764631oif.11.1615370419432; 
 Wed, 10 Mar 2021 02:00:19 -0800 (PST)
MIME-Version: 1.0
References: <f08ef2b6f339ba19987cfef4307a4dd26b2faf97.1614933479.git.christophe.leroy@csgroup.eu>
 <CAK8P3a2b+u+8smkKWB-V2Non+nnZmNG4dNi6cGpM8weYuY5j6A@mail.gmail.com>
 <5811950d-ef14-d416-35e6-d694ef920a7d@csgroup.eu>
 <CAK8P3a34cnCk4=Xyxvib57JLN-ck4T0-FUZRAQT_L6MDKjE+-w@mail.gmail.com>
 <13737de5-0eb7-e881-9af0-163b0d29a1a0@csgroup.eu>
In-Reply-To: <13737de5-0eb7-e881-9af0-163b0d29a1a0@csgroup.eu>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 10 Mar 2021 11:00:03 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2W9H7k2S3Bk1323Ro2F=_m48wBy-tENd-MyNe3Z3azyQ@mail.gmail.com>
Message-ID: <CAK8P3a2W9H7k2S3Bk1323Ro2F=_m48wBy-tENd-MyNe3Z3azyQ@mail.gmail.com>
Subject: Re: [PATCH v3] powerpc/32: remove bogus ppc_select syscall
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0EEgx3Qqq6jhXRtRfw8EkLnjrA91cQVRi5H2VBoKCYl/CU7XNmJ
 8weSGHNJT7tF/h1KnCrTlzr5HEuIAAP7Hexi8gTSXINCdq9rKNt3TKW3L+qTGrbHdjlPtLl
 Eqa0kY6hBTNnaaI6WiDa/wqN+hLt6K7vCBnXvJRg5+ebT89UYr8ed9XgX10tNsu4fQRpb/Z
 UG0Kw7EzpnwADS2Ju4JhA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:goVcUrqw8XI=:u1rAoIqTjoVsFFq5B6mHQY
 ulLWltGhLSNEjG6aUOdZ9mzv20PIpoZ8ty7XvAzZxbyGYqiwKXpqietq4goymLHygwH1FHr7l
 dvt9oKMWlwmTxgg43Hjv6C9JnRRCPAkv4xm5rBZ9qgCS2E0FKTOjzxed6nd8/EdyW7vQGzxl3
 zY9hzRZTVF+XpMr3KFiT/ICtUQqWDkoLyJglijwdVy7mlvWQqFyK8muXrk5MWqrWH3TwLFNjs
 rlA9cE99npCGfO16FBxAbVSiCRexFVi99wYlyyQCugNSdktsohyX87vWt5XJ0j6zCZASseloI
 FPNtjk6Whojwxxuu/1+PFHCe1Tv91Aw42gImNDw6NBLkuF2h2LEXmkD2B/unTtnxYA+d5hWQG
 R4ObqRHAfj3K3PudHfhTxCAbVPgc5B8KCTGmgoU4OJj5G3jDWkchkcPL4Ywyv
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 9, 2021 at 4:59 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 05/03/2021 =C3=A0 13:03, Arnd Bergmann a =C3=A9crit :
> > On Fri, Mar 5, 2021 at 11:15 AM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >> Le 05/03/2021 =C3=A0 11:06, Arnd Bergmann a =C3=A9crit :
>
> I had another look. In fact x86, arm and m68k still have the #82 syscall,=
 but they don't have the
> hack we have on powerpc to "guess" that something is calling the old sele=
ct with the arguments of
> the new select.

Makes sense. At least for x86, there are probably still some pre-glibc
binaries around
that would use the old select.

> As part of my series of user accesses cleanup, I'll replace the open code=
d stuff by a call to
> sys_old_select(), see below.

Nice!

> Maybe at the end we should keep the #82 syscall, but do we need to keep t=
he powerpc hack really ?
> Maybe the best is to drop ppc_select() function but mention sys_old_selec=
t() instead of ni_syscall
> for entry #82 in the syscall table ?

I'd say we should either keep the powerpc hack intact (with your cleanup),
or remove the syscall entirely. I have been unable to find any indication o=
f
who might have called the #82 syscall prior to mklinux DR2.1 and linuxppc R=
4,
so there is no way of knowing which of the two ABIs they were using either.

It was definitely ambiguous since the ancient kernels only had sys_select()
semantics at #82, but the existence of the hack tells us that there were at
least some binaries that wanted the sys_oldselect() semantics.

       Arnd
