Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ECC6D91D2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 10:39:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsZgN5b1Pz3fT3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 18:39:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FcEFN1D0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e; helo=mail-qk1-x72e.google.com; envelope-from=ubizjak@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FcEFN1D0;
	dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsZfX4N89z3f7K
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 18:38:59 +1000 (AEST)
Received: by mail-qk1-x72e.google.com with SMTP id u15so12773247qkk.4
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Apr 2023 01:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680770335; x=1683362335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NlaEdqHEUWRBg+c+TC3rtvHvp43Ws6SzpzXrskt0NuQ=;
        b=FcEFN1D0ri75uBu6r0ZHhcejyvqKNx6oJ/kCWbsPjgbRTXUK+5sFyIyJ41szjzh2vz
         xVhDHcBOXBBaBl2763I8yyGNI4Y1fwMQfazSTTslgohL9KsMOTUPXNHmYVexNch0+1d0
         Uq60kWvODRXwWd5fupV+fGBAPS0e5NQtrRQ18m1KgxMA+htmCUOAemJHSj13GyKNBBwP
         LnTUsXPtIhkrA3+iVp9wttq9oZ6eterHG0fTb3sDXzAZV2onLK9uY4a0ZVJ4Q0/1Ldd7
         h/usCfUZRrxzV7W5BNMQNSXEN2Am7bp6nL8tc/66t7LSwmSuBBvt43oRFVcj6mjWFab7
         P2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680770335; x=1683362335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NlaEdqHEUWRBg+c+TC3rtvHvp43Ws6SzpzXrskt0NuQ=;
        b=vzgezeKnyAHeUXfAPmChA88YhR/e/j3mf4E9Omvs2BfTHdgmJemvGMSMESZkx8NTPB
         oRtwvEsdUYKKIGKYotOiCfgMjh2kAt7KSx3zHTH3SAptP5wxJftFOWlOK/MvfbA3KrFT
         ncKDEOyVSsUxyy3Uq81S8GBv9O+ebCfeMUBt8DZ0g+wCOEcdr2V+Ii+qFSC3QhoggYc+
         1G5OVuow8Xajkdylri9by6LfMJnhoC+LwMmEW2gO9bZkRpykPEHeZZ9P0t/lErnA13oM
         iokz2YToP4Wd9Br9mVslaWJYusjJKaNXWLy7elW8GH1T16pbSf4uRw49ilvhJUnYcvKN
         UZ+g==
X-Gm-Message-State: AAQBX9eO4eyDIKX/lO2PzKbztSbxz6QPBKZ8h3IIyq+pknGQIav/97No
	1K37XDn2YvLLPTlWR1YTGgJAXm+/66gXsKa5+a8=
X-Google-Smtp-Source: AKy350YwsvugLcxPSe8VSwbY+2C98qYCdXwWk5K70J+qErUm4ut29wpYfoU3MlskEoJeNSNDzBP/SXVDE5xtKbu7RqE=
X-Received: by 2002:a05:620a:1a28:b0:742:71e6:b8d4 with SMTP id
 bk40-20020a05620a1a2800b0074271e6b8d4mr2043793qkb.6.1680770334780; Thu, 06
 Apr 2023 01:38:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230405141710.3551-1-ubizjak@gmail.com> <7360ffd2-a5aa-1373-8309-93e71ff36cbb@intel.com>
 <5c10520ac747430cb421badcb293c706@AcuMS.aculab.com>
In-Reply-To: <5c10520ac747430cb421badcb293c706@AcuMS.aculab.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 6 Apr 2023 10:38:43 +0200
Message-ID: <CAFULd4YPM18B6Nv=-rNd=D0TmCbn64oLvgbDJ3CWc9DsdJG8gg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] locking: Introduce local{,64}_try_cmpxchg
To: David Laight <David.Laight@aculab.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, "x86@kernel.org" <x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dave Hansen <dave.hansen@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, Jun Yi <yijun@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Arnaldo Carvalho de Melo <acme@kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Namhyung Kim <namhyung@ke
 rnel.org>, Thomas Gleixner <tglx@linutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 6, 2023 at 10:26=E2=80=AFAM David Laight <David.Laight@aculab.c=
om> wrote:
>
> From: Dave Hansen
> > Sent: 05 April 2023 17:37
> >
> > On 4/5/23 07:17, Uros Bizjak wrote:
> > > Add generic and target specific support for local{,64}_try_cmpxchg
> > > and wire up support for all targets that use local_t infrastructure.
> >
> > I feel like I'm missing some context.
> >
> > What are the actual end user visible effects of this series?  Is there =
a
> > measurable decrease in perf overhead?  Why go to all this trouble for
> > perf?  Who else will use local_try_cmpxchg()?
>
> I'm assuming the local_xxx operations only have to be save wrt interrupts=
?
> On x86 it is possible that an alternate instruction sequence
> that doesn't use a locked instruction may actually be faster!

Please note that "local" functions do not use lock prefix. Only atomic
properties of cmpxchg instruction are exploited since it only needs to
be safe wrt interrupts.

Uros.

> Although, maybe, any kind of locked cmpxchg just needs to ensure
> the cache line isn't 'stolen', so apart from possible slight
> delays on another cpu that gets a cache miss for the line in
> all makes little difference.
> The cache line miss costs a lot anyway, line bouncing more
> and is best avoided.
> So is there actually much of a benefit at all?
>
> Clearly the try_cmpxchg help - but that is a different issue.
>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1=
 1PT, UK
> Registration No: 1397386 (Wales)
