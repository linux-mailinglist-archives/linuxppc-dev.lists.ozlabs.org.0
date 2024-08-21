Return-Path: <linuxppc-dev+bounces-282-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9272695983B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 12:47:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wpjj73pCQz2yfm;
	Wed, 21 Aug 2024 20:47:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::730"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mZzHT7C5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730; helo=mail-qk1-x730.google.com; envelope-from=arnaldo.melo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wphjk2fnQz2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 20:03:21 +1000 (AEST)
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7a1dac7f0b7so485561985a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 03:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724234598; x=1724839398; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ofmeIKXNrrzxVEmPf1KWq6KkWjH0as8kAgvleVtt0G8=;
        b=mZzHT7C5T5tdoTZZxnAXqN20nIz+hQHChznvLbXZSSZ09Y1OExxK0q6fNBPSetR1LU
         5Ouo4g/4wfRiKStEkMxBF+5IpVsy1JX4PBMYZsQ8yg/81wu4B+4aLLAQJQ1vCsLd1gSW
         QTcy5bIbWr5oG28sviGUOz8rh1OEpWSfhdNg1SwbdQmNa5C0mmlzgNsunhd/O+9sGUVA
         n/2xf7EhkKYA4AO6lpw/NltzOuDpLbZrjBqGfav4pZxF9bcmkDQDD42X92uPwW/MXC74
         IwCFrHnREODMiIQW4MiQBQxzmp1F8h0OXKfv+q//96x/N/gM1PFTqexFZ813x/vKqKmt
         BSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724234598; x=1724839398;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ofmeIKXNrrzxVEmPf1KWq6KkWjH0as8kAgvleVtt0G8=;
        b=eOp9SrP4oXQDMXVlN0qTWutLKuTtjSxp8rYPo3sOhhhleBorhElWNvJNlOTn+MNGPf
         CX8HGG5ulVumBz2SSKt1UPWYtSgLAWwEs64WE5+T/hRd95f522K1juMAHb6Yl1oVTxWZ
         PDWJjd+EIvnGM/x8cDb+rc6PQ/hS+Sf/D5oKvdl4+N7Mi/H31tZsL8ZR+rDOEySEMnlk
         vkJBqa3KJImcdLyQ5IiixklV4B9+1yNzlzuU9950rPY3ZNrH6g8Aj+yP2TxWM2ZETtA7
         geH1hLNchIZFVGNQaeHajzuQdiyjfTFpLqumbbNSx24bz2CYek5ZqOtZyJQaV4DXRYI5
         Yu0g==
X-Gm-Message-State: AOJu0YzD+BSjEuvPLLoHLblavFzIpXu+qE2El/41S6xWdwVRpH3wzx/g
	td3XLSWRcRSYplxpCe+IH+uQvbgLUDcqwfoaLFH0qvpsxDnryHQEpjOEZQh79qegPgLYEG8mLYa
	tc0FA66zLeAm+Eao9qfDULBESTDA=
X-Google-Smtp-Source: AGHT+IEr0DtUlLXSRkIMcKDUZRNuiv+f9TCR8rUu/iehyAsskofhehmzNG/oeXRlQ/7peu1WpIJIKhgqyz9i/o284us=
X-Received: by 2002:a05:6214:3110:b0:6bf:7bbd:d2bf with SMTP id
 6a1803df08f44-6c1567b4ec1mr17865106d6.5.1724234598357; Wed, 21 Aug 2024
 03:03:18 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <83384a02-60f9-489b-8e58-a5f3b65992b8@cs-soprasteria.com>
In-Reply-To: <83384a02-60f9-489b-8e58-a5f3b65992b8@cs-soprasteria.com>
From: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Date: Wed, 21 Aug 2024 07:03:06 -0300
Message-ID: <CA+JHD92KFi5HMBAenm7cv8V2_z0ZnQmg5eenZ48zFs=DoWPoEA@mail.gmail.com>
Subject: Re: perf build failure with v6.11-rc4 (commit 4bbe60029319 ("perf
 daemon: Fix the build on 32-bit architectures"))
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/alternative; boundary="000000000000bea54e06202ea613"

--000000000000bea54e06202ea613
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024, 6:06=E2=80=AFAM LEROY Christophe <
christophe.leroy2@cs-soprasteria.com> wrote:

> Got the following build failure on v6.11-rc4, see
> https://github.com/chleroy/linux/actions/runs/10485680041/job/29042302519
>
>
>
>
> Can you try with
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/co=
mmit/?h=3Dperf-tools-next&id=3D6236ebe07131a7746d870f1d8eb3637a8df13e70

?

- Arnaldo

builtin-daemon.c: In function 'cmd_session_list':
> Error: builtin-daemon.c:692:16: error: format '%llu' expects argument of
> type 'long long unsigned int', but argument 4 has type 'long int'
> [-Werror=3Dformat=3D]
>    692 |   fprintf(out, "%c%" PRIu64,
>        |                ^~~~~
>    693 |    /* session up time */
>    694 |    csv_sep, (curr - daemon->start) / 60);
>        |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>        |                                    |
>        |                                    long int
> In file included from builtin-daemon.c:3:
> /usr/powerpc-linux-gnu/include/inttypes.h:105:34: note: format string is
> defined here
>    105 | # define PRIu64  __PRI64_PREFIX "u"
> Error: builtin-daemon.c:704:17: error: format '%llu' expects argument of
> type 'long long unsigned int', but argument 3 has type 'long int'
> [-Werror=3Dformat=3D]
>    704 |    fprintf(out, "  up:      %" PRIu64 " minutes\n",
>        |                 ^~~~~~~~~~~~~~
>    705 |     (curr - daemon->start) / 60);
>        |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>        |                            |
>        |                            long int
> In file included from builtin-daemon.c:3:
> /usr/powerpc-linux-gnu/include/inttypes.h:105:34: note: format string is
> defined here
>    105 | # define PRIu64  __PRI64_PREFIX "u"
> Error: builtin-daemon.c:731:17: error: format '%llu' expects argument of
> type 'long long unsigned int', but argument 4 has type 'long int'
> [-Werror=3Dformat=3D]
>    731 |    fprintf(out, "%c%" PRIu64,
>        |                 ^~~~~
>    732 |     /* session up time */
>    733 |     csv_sep, (curr - session->start) / 60);
>        |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>        |                                      |
>        |                                      long int
> In file included from builtin-daemon.c:3:
> /usr/powerpc-linux-gnu/include/inttypes.h:105:34: note: format string is
> defined here
>    105 | # define PRIu64  __PRI64_PREFIX "u"
> Error: builtin-daemon.c:749:17: error: format '%llu' expects argument of
> type 'long long unsigned int', but argument 3 has type 'long int'
> [-Werror=3Dformat=3D]
>    749 |    fprintf(out, "  up:      %" PRIu64 " minutes\n",
>        |                 ^~~~~~~~~~~~~~
>    750 |     (curr - session->start) / 60);
>        |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>        |                             |
>        |                             long int
> In file included from builtin-daemon.c:3:
> /usr/powerpc-linux-gnu/include/inttypes.h:105:34: note: format string is
> defined here
>    105 | # define PRIu64  __PRI64_PREFIX "u"
>
>
> Christophe
>

--000000000000bea54e06202ea613
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Aug 21, 2024, 6:06=E2=80=AFAM LEROY Christophe=
 &lt;<a href=3D"mailto:christophe.leroy2@cs-soprasteria.com">christophe.ler=
oy2@cs-soprasteria.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Got the following build failure on v6.11-rc4, see <br=
>
<a href=3D"https://github.com/chleroy/linux/actions/runs/10485680041/job/29=
042302519" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.c=
om/chleroy/linux/actions/runs/10485680041/job/29042302519</a><br>
<br><br><br><br></blockquote></div></div><div dir=3D"auto">Can you try with=
=C2=A0<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-=
tools-next.git/commit/?h=3Dperf-tools-next&amp;id=3D6236ebe07131a7746d870f1=
d8eb3637a8df13e70">https://git.kernel.org/pub/scm/linux/kernel/git/perf/per=
f-tools-next.git/commit/?h=3Dperf-tools-next&amp;id=3D6236ebe07131a7746d870=
f1d8eb3637a8df13e70</a></div><div dir=3D"auto"><br></div><div dir=3D"auto">=
?</div><div dir=3D"auto"><br></div><div dir=3D"auto">- Arnaldo=C2=A0</div><=
div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
builtin-daemon.c: In function &#39;cmd_session_list&#39;:<br>
Error: builtin-daemon.c:692:16: error: format &#39;%llu&#39; expects argume=
nt of <br>
type &#39;long long unsigned int&#39;, but argument 4 has type &#39;long in=
t&#39; <br>
[-Werror=3Dformat=3D]<br>
=C2=A0 =C2=A0692 |=C2=A0 =C2=A0fprintf(out, &quot;%c%&quot; PRIu64,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^~~~~<br>
=C2=A0 =C2=A0693 |=C2=A0 =C2=A0 /* session up time */<br>
=C2=A0 =C2=A0694 |=C2=A0 =C2=A0 csv_sep, (curr - daemon-&gt;start) / 60);<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 long int<br>
In file included from builtin-daemon.c:3:<br>
/usr/powerpc-linux-gnu/include/inttypes.h:105:34: note: format string is <b=
r>
defined here<br>
=C2=A0 =C2=A0105 | # define PRIu64=C2=A0 __PRI64_PREFIX &quot;u&quot;<br>
Error: builtin-daemon.c:704:17: error: format &#39;%llu&#39; expects argume=
nt of <br>
type &#39;long long unsigned int&#39;, but argument 3 has type &#39;long in=
t&#39; <br>
[-Werror=3Dformat=3D]<br>
=C2=A0 =C2=A0704 |=C2=A0 =C2=A0 fprintf(out, &quot;=C2=A0 up:=C2=A0 =C2=A0 =
=C2=A0 %&quot; PRIu64 &quot; minutes\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0705 |=C2=A0 =C2=A0 =C2=A0(curr - daemon-&gt;start) / 60);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0~~~~~~~~~~~~~~~~~~~~~~~~~~~=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 long int<br>
In file included from builtin-daemon.c:3:<br>
/usr/powerpc-linux-gnu/include/inttypes.h:105:34: note: format string is <b=
r>
defined here<br>
=C2=A0 =C2=A0105 | # define PRIu64=C2=A0 __PRI64_PREFIX &quot;u&quot;<br>
Error: builtin-daemon.c:731:17: error: format &#39;%llu&#39; expects argume=
nt of <br>
type &#39;long long unsigned int&#39;, but argument 4 has type &#39;long in=
t&#39; <br>
[-Werror=3Dformat=3D]<br>
=C2=A0 =C2=A0731 |=C2=A0 =C2=A0 fprintf(out, &quot;%c%&quot; PRIu64,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^~~~~<br>
=C2=A0 =C2=A0732 |=C2=A0 =C2=A0 =C2=A0/* session up time */<br>
=C2=A0 =C2=A0733 |=C2=A0 =C2=A0 =C2=A0csv_sep, (curr - session-&gt;start) /=
 60);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 long int<br>
In file included from builtin-daemon.c:3:<br>
/usr/powerpc-linux-gnu/include/inttypes.h:105:34: note: format string is <b=
r>
defined here<br>
=C2=A0 =C2=A0105 | # define PRIu64=C2=A0 __PRI64_PREFIX &quot;u&quot;<br>
Error: builtin-daemon.c:749:17: error: format &#39;%llu&#39; expects argume=
nt of <br>
type &#39;long long unsigned int&#39;, but argument 3 has type &#39;long in=
t&#39; <br>
[-Werror=3Dformat=3D]<br>
=C2=A0 =C2=A0749 |=C2=A0 =C2=A0 fprintf(out, &quot;=C2=A0 up:=C2=A0 =C2=A0 =
=C2=A0 %&quot; PRIu64 &quot; minutes\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~<br>
=C2=A0 =C2=A0750 |=C2=A0 =C2=A0 =C2=A0(curr - session-&gt;start) / 60);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0long int<br>
In file included from builtin-daemon.c:3:<br>
/usr/powerpc-linux-gnu/include/inttypes.h:105:34: note: format string is <b=
r>
defined here<br>
=C2=A0 =C2=A0105 | # define PRIu64=C2=A0 __PRI64_PREFIX &quot;u&quot;<br>
<br>
<br>
Christophe<br>
</blockquote></div></div></div>

--000000000000bea54e06202ea613--

