Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF3F12A167
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 13:44:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hwsQ239YzDqHZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 23:44:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="mbhzlqrF"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hwpN5wxPzDqKs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 23:42:04 +1100 (AEDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 025BF20731
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 12:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577191322;
 bh=xWNWJ8I9fxHntwfPGgiUpJJyIhLQ1SeEPpEpuaGohNs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mbhzlqrFOTd5D0VnwK8uZ6zmm6un9WEQBuC+SsW/vNr4zmirMRl3Ie03Hti+oSKnq
 jWL+FYDrP86b5jRs0x0aSDRUVDijhRUPxNal17nD3tvwFIHL1sEqrGQp833aEf8LTp
 5Sfx49XQkhGKpNMeG65TqgqaLju0XthGjvsfdWd0=
Received: by mail-wr1-f51.google.com with SMTP id c9so19738258wrw.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 04:42:01 -0800 (PST)
X-Gm-Message-State: APjAAAX7OtcvJTnLOvEbjETivVmGG48+aw2z6WIlj8s6Gm4dSewWh4A7
 cnIjTYd8rhnwEX1KTvXYSKhwVt4kaVuJv0h8JOWaVQ==
X-Google-Smtp-Source: APXvYqwdNLgm/8CaMUR6XukS3F5ntUzE/BsJd5vEuNBWA9P9kZsIX/K2aEVbOOWPEOSGyhiF4uqEjDSBVC/HOxryAY4=
X-Received: by 2002:adf:eb09:: with SMTP id s9mr36777598wrn.61.1577191320403; 
 Tue, 24 Dec 2019 04:42:00 -0800 (PST)
MIME-Version: 1.0
References: <de5273aa-69dc-8e37-c917-44708257d2ba@c-s.fr>
 <D2614EC4-5B80-4846-994D-22730ACD44A1@amacapital.net>
In-Reply-To: <D2614EC4-5B80-4846-994D-22730ACD44A1@amacapital.net>
From: Andy Lutomirski <luto@kernel.org>
Date: Tue, 24 Dec 2019 04:41:48 -0800
X-Gmail-Original-Message-ID: <CALCETrUR-NgVMeTPh3TmgNSTsA=2xE03_KBeO9DSk0P-JxD_fQ@mail.gmail.com>
Message-ID: <CALCETrUR-NgVMeTPh3TmgNSTsA=2xE03_KBeO9DSk0P-JxD_fQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 04/10] lib: vdso: get pointer to vdso data from the
 arch
To: christophe leroy <christophe.leroy@c-s.fr>
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
Cc: Arnd Bergmann <arnd@arndb.de>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 24, 2019 at 4:15 AM Andy Lutomirski <luto@amacapital.net> wrote=
:
>
>
>
> > On Dec 24, 2019, at 7:53 PM, christophe leroy <christophe.leroy@c-s.fr>=
 wrote:
> >
> > =EF=BB=BF
> >
> >> Le 24/12/2019 =C3=A0 03:27, Andy Lutomirski a =C3=A9crit :
> >>> On Mon, Dec 23, 2019 at 6:31 AM Christophe Leroy
> >>> <christophe.leroy@c-s.fr> wrote:
> >>>
> >>> On powerpc, __arch_get_vdso_data() clobbers the link register,
> >>> requiring the caller to set a stack frame in order to save it.
> >>>
> >>> As the parent function already has to set a stack frame and save
> >>> the link register to call the C vdso function, retriving the
> >>> vdso data pointer there is lighter.
> >> I'm confused.  Can't you inline __arch_get_vdso_data()?  Or is the
> >> issue that you can't retrieve the program counter on power without
> >> clobbering the link register?
> >
> > Yes it can be inlined (I did it in V1 https://patchwork.ozlabs.org/patc=
h/1180571/), but you can't do it without clobbering the link register, beca=
use the only way to get the program counter is to do to as if you were call=
ing another function but you call to the address which just follows where y=
ou are, so that it sets LR which the simulated return address which corresp=
onds to the address following the branch.
> >
> > static __always_inline
> > const struct vdso_data *__arch_get_vdso_data(void)
> > {
> >    void *ptr;
> >
> >    asm volatile(
> >        "    bcl    20, 31, .+4;\n"
> >        "    mflr    %0;\n"
> >        "    addi    %0, %0, __kernel_datapage_offset - (.-4);\n"
> >        : "=3Db"(ptr) : : "lr");
> >
> >    return ptr + *(unsigned long *)ptr;
> > }
> >
> >> I would imagine that this patch generates worse code on any
> >> architecture with PC-relative addressing modes (which includes at
> >> least x86_64, and I would guess includes most modern architectures).
> >
> > Why ? Powerpc is also using PC-relative addressing for all calls but in=
direct calls.
>
> I mean PC-relative access for data.  The data page is at a constant, know=
n offset from the vDSO text.
>
> I haven=E2=80=99t checked how much x86_64 benefits from this, but at leas=
t the non-array fields ought to be accessible with a PC-relative access.
>
> It should be possible to refactor a little bit so that the compiler can s=
till see what=E2=80=99s going on.  Maybe your patch actually does this. I=
=E2=80=99d want to look at the assembly.  This also might not matter much o=
n x86_64 in particular, since x86_64 can convert a PC-relative address to a=
n absolute address with a single instruction with no clobbers.
>
> Does power have PC-relative data access?  If so, I wonder if the code can=
 be arranged so that even the array accesses don=E2=80=99t require computin=
g an absolute address at any point.

Indeed the x86 code is also suboptimal, but at least the unnecessary
absolute address calculation is cheap on x86_64.  Ideally we'd pass
around offsets into the vdso data instead of passing pointers, and
maybe the compiler will figure it out.  I can try to play with this in
the morning.
