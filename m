Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FC97FC46B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 20:48:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Y4GaSksO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SftLB5Qzdz3cbt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 06:48:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Y4GaSksO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SftKH32lmz2xdp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 06:47:46 +1100 (AEDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50ba8177c9fso492e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Nov 2023 11:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701200858; x=1701805658; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWZzgqk1GpEhjiNVn/Cj9VpwbrgeTzX4mCQ5GC4cr1M=;
        b=Y4GaSksOYGLjedM8fooomTeJfTlTI4DIEEafIGd32Uu7g8tcEscXufr14IyY1ewJ+F
         Tp9sXLRf6gvWYWTj9AaF99WeABrRtL2FJODihojdEynvu845FLcdKQNIb8noa6VtkKKx
         l3e4Ju+RdovsRbTmEJDdBrQ69NFSA/uOpgKtu3dFGZ/CBmYLRJcYZnKG3EhOccl5wGel
         p7WhK9mFbJ2Hq4pleORxkEwMOAM1nodrCrHb9tHcc3KJ0oCHSUWvQK0s61dgyuAoUmEd
         ZIM7Zi11Bq/6+gvba9k24WzAMgZbUi4GyfvieSZxDeB/P3jVESGw3N8T8fhi72b1/KdH
         93mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701200858; x=1701805658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWZzgqk1GpEhjiNVn/Cj9VpwbrgeTzX4mCQ5GC4cr1M=;
        b=fBbIhRzWHue+QDXmTmdmBVY7eA+Pa9lNHiJ6U/7Qs/YuNZemXej26hyNJoddQafS3B
         XRQR1HuEnrQhh5wWU6gP3O3x0ludef5ft5qw9K/GtJhYXP7ecsGTxuHhh4VTTo3QO+DB
         2YKsnAo1Nej8X6WnknPzdM1FWJ1g/nYcH4jb3Io2wmAM2o5fUPpjtuq/QZoTlKKJAcC5
         DCZdAV2ESVYc7gW0zggqa2v/ZDhcKWKlMzsTjTUE+lcD5tqcRZtuuZNNEOY/82B7CzxA
         0y6FkwG2VTXwGYFOaCNTpwtqvvUc4lPwtTiHIABJVLZaMNLAqZpXNvUQV5YA2FHvKzLl
         8Q2w==
X-Gm-Message-State: AOJu0Yz6ehfc9bJwnGM4J27hLsJZN/AGc6tsi9GoWtHraH0HuPSruGta
	B4I36c1MIYpqUH7GvNgxEi6YkF+GgOBlzfFlXCdrOQ==
X-Google-Smtp-Source: AGHT+IEWNTfoKdDHE4Wzmk0DfPiA3Enq/fuaBctGXNLS9IquYLLYngmnLPqn5DJCij/tYZc8F8k74StaRV9UeKVsLow=
X-Received: by 2002:a05:6512:130b:b0:50a:a7e5:eb93 with SMTP id
 x11-20020a056512130b00b0050aa7e5eb93mr500594lfu.2.1701200858370; Tue, 28 Nov
 2023 11:47:38 -0800 (PST)
MIME-Version: 1.0
References: <20231126070914.175332-1-likhitha@linux.ibm.com> <3cb4af55-dd0d-4491-9a29-8440aa2c191e@linux.ibm.com>
In-Reply-To: <3cb4af55-dd0d-4491-9a29-8440aa2c191e@linux.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 28 Nov 2023 11:47:26 -0800
Message-ID: <CAP-5=fXiuCYaGhpGvC1PsUzu8OyUGvoUmOs3hHy3OQhzR3fXSA@mail.gmail.com>
Subject: Re: [PATCH] perf test record+probe_libc_inet_pton: Fix call chain
 match on powerpc
To: Disha Goel <disgoel@linux.ibm.com>
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
Cc: maddy@linux.ibm.com, kjain@linux.ibm.com, Likhitha Korrapati <likhitha@linux.ibm.com>, adrian.hunter@intel.com, acme@kernel.org, linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com, james.clark@arm.com, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 28, 2023 at 1:57=E2=80=AFAM Disha Goel <disgoel@linux.ibm.com> =
wrote:
>
> On 26/11/23 12:39 pm, Likhitha Korrapati wrote:
>
> > The perf test "probe libc's inet_pton & backtrace it with ping" fails o=
n
> > powerpc as below:
> >
> > root@xxx perf]# perf test -v "probe libc's inet_pton & backtrace it wit=
h
> > ping"
> >   85: probe libc's inet_pton & backtrace it with ping                 :
> > --- start ---
> > test child forked, pid 96028
> > ping 96056 [002] 127271.101961: probe_libc:inet_pton: (7fffa1779a60)
> > 7fffa1779a60 __GI___inet_pton+0x0
> > (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
> > 7fffa172a73c getaddrinfo+0x121c
> > (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
> > FAIL: expected backtrace entry
> > "gaih_inet.*\+0x[[:xdigit:]]+[[:space:]]\(/usr/lib64/glibc-hwcaps/power=
10/libc.so.6\)$"
> > got "7fffa172a73c getaddrinfo+0x121c
> > (/usr/lib64/glibc-hwcaps/power10/libc.so.6)"
> > test child finished with -1
> > ---- end ----
> > probe libc's inet_pton & backtrace it with ping: FAILED!
> >
> > This test installs a probe on libc's inet_pton function, which will use
> > uprobes and then uses perf trace on a ping to localhost. It gets 3
> > levels deep backtrace and checks whether it is what we expected or not.
> >
> > The test started failing from RHEL 9.4 where as it works in previous
> > distro version (RHEL 9.2). Test expects gaih_inet function to be part o=
f
> > backtrace. But in the glibc version (2.34-86) which is part of distro
> > where it fails, this function is missing and hence the test is failing.
> >
> >  From nm and ping command output we can confirm that gaih_inet function
> > is not present in the expected backtrace for glibc version glibc-2.34-8=
6
> >
> > [root@xxx perf]# nm /usr/lib64/glibc-hwcaps/power10/libc.so.6 | grep ga=
ih_inet
> > 00000000001273e0 t gaih_inet_serv
> > 00000000001cd8d8 r gaih_inet_typeproto
> >
> > [root@xxx perf]# perf script -i /tmp/perf.data.6E8
> > ping  104048 [000] 128582.508976: probe_libc:inet_pton: (7fff83779a60)
> >              7fff83779a60 __GI___inet_pton+0x0
> > (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
> >              7fff8372a73c getaddrinfo+0x121c
> > (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
> >                 11dc73534 [unknown] (/usr/bin/ping)
> >              7fff8362a8c4 __libc_start_call_main+0x84
> > (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
> >
> > FAIL: expected backtrace entry
> > "gaih_inet.*\+0x[[:xdigit:]]+[[:space:]]\(/usr/lib64/glibc-hwcaps/power=
10/libc.so.6\)$"
> > got "7fff9d52a73c getaddrinfo+0x121c
> > (/usr/lib64/glibc-hwcaps/power10/libc.so.6)"
> >
> > With version glibc-2.34-60 gaih_inet function is present as part of the
> > expected backtrace. So we cannot just remove the gaih_inet function fro=
m
> > the backtrace.
> >
> > [root@xxx perf]# nm /usr/lib64/glibc-hwcaps/power10/libc.so.6 | grep ga=
ih_inet
> > 0000000000130490 t gaih_inet.constprop.0
> > 000000000012e830 t gaih_inet_serv
> > 00000000001d45e4 r gaih_inet_typeproto
> >
> > [root@xxx perf]# ./perf script -i /tmp/perf.data.b6S
> > ping   67906 [000] 22699.591699: probe_libc:inet_pton_3: (7fffbdd80820)
> >              7fffbdd80820 __GI___inet_pton+0x0
> > (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
> >              7fffbdd31160 gaih_inet.constprop.0+0xcd0
> > (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
> >              7fffbdd31c7c getaddrinfo+0x14c
> > (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
> >                 1140d3558 [unknown] (/usr/bin/ping)
> >
> > This patch solves this issue by doing a conditional skip. If there is a
> > gaih_inet function present in the libc then it will be added to the
> > expected backtrace else the function will be skipped from being added
> > to the expected backtrace.
> >
> > Output with the patch
> >
> > [root@xxx perf]# ./perf test -v "probe libc's inet_pton & backtrace it
> > with ping"
> >   83: probe libc's inet_pton & backtrace it with ping                 :
> > --- start ---
> > test child forked, pid 102662
> > ping 102692 [000] 127935.549973: probe_libc:inet_pton: (7fff93379a60)
> > 7fff93379a60 __GI___inet_pton+0x0
> > (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
> > 7fff9332a73c getaddrinfo+0x121c
> > (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
> > 11ef03534 [unknown] (/usr/bin/ping)
> > test child finished with 0
> > ---- end ----
> > probe libc's inet_pton & backtrace it with ping: Ok
> >
> > Signed-off-by: Likhitha Korrapati <likhitha@linux.ibm.com>
> > Reported-by: Disha Goel <disgoel@linux.ibm.com>
>
> Thanks for the fix patch.
> I have tested on a Power10 machine, "probe libc's inet_pton & backtrace i=
t with ping"
> perf test passes with the patch applied.
>
> Output where gaih_inet function is not present
>
>         # perf test -v "probe libc's inet_pton & backtrace it with ping"
>          85: probe libc's inet_pton & backtrace it with ping             =
    :
>         --- start ---
>         test child forked, pid 4622
>         ping 4652 [011] 58.987631: probe_libc:inet_pton: (7fff91b79a60)
>         7fff91b79a60 __GI___inet_pton+0x0 (/usr/lib64/glibc-hwcaps/power1=
0/libc.so.6)
>         7fff91b2a73c getaddrinfo+0x121c (/usr/lib64/glibc-hwcaps/power10/=
libc.so.6)
>         119e53534 [unknown] (/usr/bin/ping)
>         test child finished with 0
>         ---- end ----
>         probe libc's inet_pton & backtrace it with ping: Ok
>
> Output where gaih_inet function is present
>
>         # ./perf test -v "probe libc's inet_pton & backtrace it with ping=
"
>          83: probe libc's inet_pton & backtrace it with ping             =
    :
>         --- start ---
>         test child forked, pid 84831
>         ping 84861 [000] 79056.019971: probe_libc:inet_pton: (7fff957631e=
8)
>         7fff957631e8 __GI___inet_pton+0x8 (/usr/lib64/glibc-hwcaps/power9=
/libc-2.28.so)
>         7fff95718760 gaih_inet.constprop.6+0xa90 (/usr/lib64/glibc-hwcaps=
/power9/libc-2.28.so)
>         7fff95719974 getaddrinfo+0x164 (/usr/lib64/glibc-hwcaps/power9/li=
bc-2.28.so)
>         122e732a4 [unknown] (/usr/bin/ping)
>         test child finished with 0
>         ---- end ----
>         probe libc's inet_pton & backtrace it with ping: Ok
>
> Tested-by: Disha Goel <disgoel@linux.ibm.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

>
> > ---
> >   tools/perf/tests/shell/record+probe_libc_inet_pton.sh | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh b/to=
ols/perf/tests/shell/record+probe_libc_inet_pton.sh
> > index eebeea6bdc76..72c65570db37 100755
> > --- a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
> > +++ b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
> > @@ -45,7 +45,10 @@ trace_libc_inet_pton_backtrace() {
> >               ;;
> >       ppc64|ppc64le)
> >               eventattr=3D'max-stack=3D4'
> > -             echo "gaih_inet.*\+0x[[:xdigit:]]+[[:space:]]\($libc\)$" =
>> $expected
> > +             # Add gaih_inet to expected backtrace only if it is part =
of libc.
> > +             if nm $libc | grep -F -q gaih_inet.; then
> > +                     echo "gaih_inet.*\+0x[[:xdigit:]]+[[:space:]]\($l=
ibc\)$" >> $expected
> > +             fi
> >               echo "getaddrinfo\+0x[[:xdigit:]]+[[:space:]]\($libc\)$" =
>> $expected
> >               echo ".*(\+0x[[:xdigit:]]+|\[unknown\])[[:space:]]\(.*/bi=
n/ping.*\)$" >> $expected
> >               ;;
