Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAEF32E47A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 10:15:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsMWx1xFqz3dDN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 20:15:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=nZ2pVXGc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32d;
 helo=mail-ot1-x32d.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=nZ2pVXGc; dkim-atps=neutral
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsMWR2sdDz3bP5
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 20:14:40 +1100 (AEDT)
Received: by mail-ot1-x32d.google.com with SMTP id 97so1107184otf.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 01:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NPj0KxMXFfRe8+xSa+Go2DD4qn2EGEmIs7ZK90LXWyQ=;
 b=nZ2pVXGclYhYcE8eyYD9uK+g0vVWr50jDEOrQ6w5W7BHmKPAL7XOu/NpdmORq5vOQ+
 zolQsIBdqV4+a9y3q7m35ms/qkzIoC+KenRTzx8P06UwfTP2OxMVlcCADug51B5D5QWz
 kPYFXy03vqWh5KaDirbCAsPqTE4+uuwR2doAzftOg/ubc4GjJ8YcW6jEtESM1U5gLFN4
 HsFHKxUgKXBgQXp+MqU3mthIiZDeH+aRPpWB0jk7BvenhFVjXYSPlSC2rjV8bgvQ8h9B
 X6FQTXWXXob2e3/KIgnQ+f03yfYds0Q0mp4NKeKQaeaxi08dUxi5WVMUvsz2Xq8/ZLxS
 sPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NPj0KxMXFfRe8+xSa+Go2DD4qn2EGEmIs7ZK90LXWyQ=;
 b=h7u6esaYw4wm1BTK25fO8vORvkyw36raAuSRhi5HiC3gmbIcZIsMucLzuEHXiYFheL
 lWHydQST0d01abVYuAxu8dvDzefz53/pnX+H883ACPcFpZbps7AThlNGXitlh4RGWOFV
 oQmIB01TbKhceFpzg2aXyup3zQTp8ZNfDAC34cuhcgFgN6u6Q1U5WuDw3YI2G0BDSsCY
 87OLtJUStNRKxZD4dd/wvcIDEpWL9YugKcCb6RMpjmETLQp/GrWaCgECsRd4j5QHJxUy
 +KjkPw05E/gtqNgJJjFV1l2R6JO/yuOGlvLmWBnPAgzxesFQCB5lA/TSsJ/b1o3Aw+cA
 nRyA==
X-Gm-Message-State: AOAM531fbh3404UPs3TdMNAsFU0aEqPdW6BXMORlt5/aAIhF1j8FHH0f
 v78QEPLuRJ+oauiI5rcGRgmwVrqSsixhhJNiGk6C3g==
X-Google-Smtp-Source: ABdhPJyP45gFULzY3byGgkiMQ/gTlEFmoYywr5bJJ0uN4yvCPosIJGsbuWsd/hT9Z6uErmsyhsk7D5HBW2aZu+iKXL4=
X-Received: by 2002:a9d:7f11:: with SMTP id j17mr7316937otq.251.1614935675615; 
 Fri, 05 Mar 2021 01:14:35 -0800 (PST)
MIME-Version: 1.0
References: <CANpmjNPGj4C2rr2FbSD+FC-GnWUvJrtdLyX5TYpJE_Um8CGu1Q@mail.gmail.com>
 <08a96c5d-4ae7-03b4-208f-956226dee6bb@csgroup.eu>
 <CANpmjNPYEmLtQEu5G=zJLUzOBaGoqNKwLyipDCxvytdKDKb7mg@mail.gmail.com>
 <ad61cb3a-2b4a-3754-5761-832a1dd0c34e@csgroup.eu>
 <CANpmjNOnVzei7frKcMzMHxaDXh5NvTA-Wpa29C2YC1GUxyKfhQ@mail.gmail.com>
 <f036c53d-7e81-763c-47f4-6024c6c5f058@csgroup.eu>
 <CANpmjNMn_CUrgeSqBgiKx4+J8a+XcxkaLPWoDMUvUEXk8+-jxg@mail.gmail.com>
 <7270e1cc-bb6b-99ee-0043-08a027b8d83a@csgroup.eu>
 <YEDXJ5JNkgvDFehc@elver.google.com>
 <874khqry78.fsf@mpe.ellerman.id.au> <YEHiq1ALdPn2crvP@elver.google.com>
 <f6e47f4f-6953-6584-f023-8b9c22d6974e@csgroup.eu>
In-Reply-To: <f6e47f4f-6953-6584-f023-8b9c22d6974e@csgroup.eu>
From: Marco Elver <elver@google.com>
Date: Fri, 5 Mar 2021 10:14:23 +0100
Message-ID: <CANpmjNM9o1s4O4v2T9HUohPdCDJzWcaC5KDrt_7BSVdTUQWagw@mail.gmail.com>
Subject: Re: [RFC PATCH v1] powerpc: Enable KFENCE for PPC32
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Alexander Potapenko <glider@google.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 5 Mar 2021 at 09:23, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 05/03/2021 =C3=A0 08:50, Marco Elver a =C3=A9crit :
> > On Fri, Mar 05, 2021 at 04:01PM +1100, Michael Ellerman wrote:
> >> Marco Elver <elver@google.com> writes:
> >>> On Thu, Mar 04, 2021 at 12:48PM +0100, Christophe Leroy wrote:
> >>>> Le 04/03/2021 =C3=A0 12:31, Marco Elver a =C3=A9crit :
> >>>>> On Thu, 4 Mar 2021 at 12:23, Christophe Leroy
> >>>>> <christophe.leroy@csgroup.eu> wrote:
> >>>>>> Le 03/03/2021 =C3=A0 11:56, Marco Elver a =C3=A9crit :
> >>>>>>>
> >>>>>>> Somewhat tangentially, I also note that e.g. show_regs(regs) (whi=
ch
> >>>>>>> was printed along the KFENCE report above) didn't include the top
> >>>>>>> frame in the "Call Trace", so this assumption is definitely not
> >>>>>>> isolated to KFENCE.
> >>>>>>>
> >>>>>>
> >>>>>> Now, I have tested PPC64 (with the patch I sent yesterday to modif=
y save_stack_trace_regs()
> >>>>>> applied), and I get many failures. Any idea ?
> >>>>>>
> >>>>>> [   17.653751][   T58] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> >>>>>> [   17.654379][   T58] BUG: KFENCE: invalid free in .kfence_guarde=
d_free+0x2e4/0x530
> >>>>>> [   17.654379][   T58]
> >>>>>> [   17.654831][   T58] Invalid free of 0xc00000003c9c0000 (in kfen=
ce-#77):
> >>>>>> [   17.655358][   T58]  .kfence_guarded_free+0x2e4/0x530
> >>>>>> [   17.655775][   T58]  .__slab_free+0x320/0x5a0
> >>>>>> [   17.656039][   T58]  .test_double_free+0xe0/0x198
> >>>>>> [   17.656308][   T58]  .kunit_try_run_case+0x80/0x110
> >>>>>> [   17.656523][   T58]  .kunit_generic_run_threadfn_adapter+0x38/0=
x50
> >>>>>> [   17.657161][   T58]  .kthread+0x18c/0x1a0
> >>>>>> [   17.659148][   T58]  .ret_from_kernel_thread+0x58/0x70
> >>>>>> [   17.659869][   T58]
> >>> [...]
> >>>>>
> >>>>> Looks like something is prepending '.' to function names. We expect
> >>>>> the function name to appear as-is, e.g. "kfence_guarded_free",
> >>>>> "test_double_free", etc.
> >>>>>
> >>>>> Is there something special on ppc64, where the '.' is some conventi=
on?
> >>>>>
> >>>>
> >>>> I think so, see https://refspecs.linuxfoundation.org/ELF/ppc64/PPC-e=
lf64abi.html#FUNC-DES
> >>>>
> >>>> Also see commit https://github.com/linuxppc/linux/commit/02424d896
> >>>
> >>> Thanks -- could you try the below patch? You'll need to define
> >>> ARCH_FUNC_PREFIX accordingly.
> >>>
> >>> We think, since there are only very few architectures that add a pref=
ix,
> >>> requiring <asm/kfence.h> to define something like ARCH_FUNC_PREFIX is
> >>> the simplest option. Let me know if this works for you.
> >>>
> >>> There an alternative option, which is to dynamically figure out the
> >>> prefix, but if this simpler option is fine with you, we'd prefer it.
> >>
> >> We have rediscovered this problem in basically every tracing / debuggi=
ng
> >> feature added in the last 20 years :)
> >>
> >> I think the simplest solution is the one tools/perf/util/symbol.c uses=
,
> >> which is to just skip a leading '.'.
> >>
> >> Does that work?
> >>
> >> diff --git a/mm/kfence/report.c b/mm/kfence/report.c
> >> index ab83d5a59bb1..67b49dc54b38 100644
> >> --- a/mm/kfence/report.c
> >> +++ b/mm/kfence/report.c
> >> @@ -67,6 +67,9 @@ static int get_stack_skipnr(const unsigned long stac=
k_entries[], int num_entries
> >>      for (skipnr =3D 0; skipnr < num_entries; skipnr++) {
> >>              int len =3D scnprintf(buf, sizeof(buf), "%ps", (void *)st=
ack_entries[skipnr]);
> >>
> >> +            if (buf[0] =3D=3D '.')
> >> +                    buf++;
> >> +
> >
> > Unfortunately this does not work, since buf is an array. We'd need an
> > offset, and it should be determined outside the loop. I had a solution
> > like this, but it turned out quite complex (see below). And since most
> > architectures do not require this, decided that the safest option is to
> > use the macro approach with ARCH_FUNC_PREFIX, for which Christophe
> > already prepared a patch and tested:
> > https://lore.kernel.org/linux-mm/20210304144000.1148590-1-elver@google.=
com/
> > https://lkml.kernel.org/r/afaec81a551ef15345cb7d7563b3fac3d7041c3a.1614=
868445.git.christophe.leroy@csgroup.eu
> >
> > Since KFENCE requires <asm/kfence.h> anyway, we'd prefer this approach
> > (vs.  dynamically detecting).
> >
> > Thanks,
> > -- Marco
> >
>
> What about

Sure something like that would work. But I explicitly did *not* want
to hard-code the '.' in non-arch code.

The choice is between:

1. ARCH_FUNC_PREFIX (as a matter of fact, the ARCH_FUNC_PREFIX patch
is already in -mm). Perhaps we could optimize it further, by checking
ARCH_FUNC_PREFIX in buf, and advancing buf like you propose, but I'm
not sure it's worth worrying about.

2. The dynamic solution that I proposed that does not use a hard-coded
'.' (or some variation thereof).

Please tell me which solution you prefer, 1 or 2 -- I'd like to stop
bikeshedding here. If there's a compelling argument for hard-coding
the '.' in non-arch code, please clarify, but otherwise I'd like to
keep arch-specific things out of generic code.

Thanks.

> diff --git a/mm/kfence/report.c b/mm/kfence/report.c
> index 519f037720f5..5e196625fb34 100644
> --- a/mm/kfence/report.c
> +++ b/mm/kfence/report.c
> @@ -43,7 +43,7 @@ static void seq_con_printf(struct seq_file *seq, const =
char *fmt, ...)
>   static int get_stack_skipnr(const unsigned long stack_entries[], int nu=
m_entries,
>                             const enum kfence_error_type *type)
>   {
> -       char buf[64];
> +       char _buf[64];
>         int skipnr, fallback =3D 0;
>
>         if (type) {
> @@ -65,7 +65,11 @@ static int get_stack_skipnr(const unsigned long stack_=
entries[], int num_entries
>         }
>
>         for (skipnr =3D 0; skipnr < num_entries; skipnr++) {
> -               int len =3D scnprintf(buf, sizeof(buf), "%ps", (void *)st=
ack_entries[skipnr]);
> +               char *buf =3D _buf;
> +               int len =3D scnprintf(_buf, sizeof(_buf), "%ps", (void *)=
stack_entries[skipnr]);
> +
> +               if (_buf[0] =3D=3D '.')
> +                       buf++, len--;
>
>                 if (str_has_prefix(buf, "kfence_") || str_has_prefix(buf,=
 "__kfence_") ||
>                     !strncmp(buf, "__slab_free", len)) {
> ---
>
> Christophe
