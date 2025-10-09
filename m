Return-Path: <linuxppc-dev+bounces-12750-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D232BC9470
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 15:23:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cj9Y95Csmz2yr2;
	Fri, 10 Oct 2025 00:23:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760016189;
	cv=none; b=FDlBXP43qRc9+DlXymto2JCk+oMRI/VmoWNUPb8OD29YfrqhSmzgNKt7CoRPHwOpxLd4Uiwyfb4Vzy6S930N50p0/OMDd6NvOsSZVELvzvQAgul8hK/LAR3c0zusgeDitObQIT7tuNibwuqwCaeNRF9/txGxY6iG8d1RTeLyIBnKFDH/mzwBnmspi3i7fWhltFEwmVV4fIf8TlEQn3EG4SFKJ60PdkPTQdr1UUyCT2//d66ouwCZYc1GSQ3JWgNdvquZnKuQFNSb/g5LVgkWr4ipJ/zdsVlls5b/PSFDb6RCOlHhl9DoyPbGBeD9VidYo3Hr2IHvq2O9YAi0JP39Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760016189; c=relaxed/relaxed;
	bh=/MmBd+7zzowhrSWoBWSLCsui3fgz/9aHsIIOvCWsuYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aZJfllYP3TtNcTKFhphSLM1yuRUtnYM/ArxBT0FCKhdekKotgn3vEC172RbXB7217rvJbNYqECpQ6H5J20wIzVGqZ7ln45viQwhJFd9SyyqlAGfGqmrb7uHGXIajdE/sVQR+4rr5KlufbalB9hZfhRsqIwsVNBJtl5NY4utzCmtu3aoPRVdjuvg3eujnSDPhUyzxnTfaw6UeGOpLrc9dfZp5X7Vmx3aYceR/++z3GJNq0rr9lU2xYEKKQRVeunYK/TnwRDFa3djuTpw9CDjJPUbNlRneAJi2k+igDXb6sd/AqoDIzLdHCu6Pqp5gqXhm5dakEvUOEgopt2XPYXRKQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=IECFit8+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=IECFit8+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cj9Y82TN9z2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Oct 2025 00:23:07 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-27d67abd215so250695ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Oct 2025 06:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760016186; x=1760620986; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MmBd+7zzowhrSWoBWSLCsui3fgz/9aHsIIOvCWsuYU=;
        b=IECFit8+g/mQHEj0UlLn27LfJsA5SI9Wf+Q04eQve94IXUjd2wdaaITTuZy5dD1DDS
         zj9STEzAVmRNqkt5We9GGswTGEpInjzooQhxGXX2JeIOHZ34z2ZEAKZ/Jm25+q9xNrVx
         RxtFQgsjGmSwcTipt10tgQTTJHkq+EEn34aha1vu/U/P7ZjQ1e+IY0zGk2YsghhIrPgo
         HnOMtRR5axGdfpdBqbvEhKo3L6nWRp+22cpYcT7veLKQPtag+8zvRA48mTDVm8agN+9m
         opJ8gf/LSvy3HMQZ94tC1fcr4fOme/chZZ8dwhg+arQceK+9a8Il9e5tMxmr7se6QmTO
         ZiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760016186; x=1760620986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MmBd+7zzowhrSWoBWSLCsui3fgz/9aHsIIOvCWsuYU=;
        b=U+K5nV3PDaShu+pkmVGxwXJRhtCkMq/F93qonATgIAG2h0tWVcN5Vmoh0Y3d/Dm3vd
         tpqdbolnQQxSzc9nCCv1nDaFtYYErEvznVjkgtPcm4ZFAmVfS2dqho77aOkIwU+IoZf3
         kLcETKvAYG0DhAHdIGUYuXLjZg4OUVCrylj2kbCFV7wVFxXDhkD1Cvg2mQujtx8VHVwM
         6AByEyCCnxpdZrX5a0uJpj/H0aMVQhK4gSdA1vqIguOOeBdr3LLL/+nUOGEBa2ZKNouA
         Bas/zvHClep4gAMWmtlmO2jg7yj/SqeqbwTZP0lGKiR5XbhnM4L/lQ1UZNr78qcbrC7m
         YEhw==
X-Forwarded-Encrypted: i=1; AJvYcCUnxmtUnv9EEN9SFywbVOnfZNLd1Fz7DeT7P2lmQQgzr8hmCpK1OF6WnbtiLkGBsuK2oJ5teuZ0nN5gPrE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz6iRhUuAp4Hy8vur4ncpK/d5kQWBDEZjFmDEM8Jaig/FggxFeW
	6z9iK8n/CMybwO108MApbLcKl5ij/QJtTVduRrRHZGU6Ay6Z13wX+5ilJD5ha7Ep80Avg96/L8m
	SUZa7DVpfLlRngLcGXUuJeDN3nlhb99NIgJZmfd5t
X-Gm-Gg: ASbGncugHerrt3M59WmFBZXMnsvaakxJcmws9AkOtOd9NR6XHzta5m3pLwdL9D0pVLn
	DN1cKGZ6jl370HhOoqy14C3taWycQ3v6N/40oT038trMgsI/dBQD4YXEUHmEdE8ZxGh9n4C0nJZ
	WbjEs8MX5e7Ci65GbQ27BOa3RaONLWwc8I832ChzajcCrxArK0XMikX5n6itsAjNT6wlmt9ISJf
	ljX2ErEeulTfLAD9/67k6c4czjLuX2pN/RVVzrbXspP3YYK9g==
X-Google-Smtp-Source: AGHT+IEdrbQJWbBux9pavyDpSQy9ZinCAuiOJMYN+NXoFglR2vnRt6D5+OiKnG1DQ8GqgnIDFnpngIY4dqYtYVE57TE=
X-Received: by 2002:a17:902:f605:b0:25b:fba3:afb5 with SMTP id
 d9443c01a7336-2902768ec14mr10451505ad.11.1760016185180; Thu, 09 Oct 2025
 06:23:05 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <aMpRqlDXXOR5qYFd@mdev> <CAP-5=fV05++2Qvcxs=+tqhTdpGK8L9e5HzVu=y+xHxy9AqLMmg@mail.gmail.com>
 <CAD=FV=VNmjTVxcxgTQqjE7CTkK2NVGbRxFJSwv=yOHU8gj-urQ@mail.gmail.com>
 <CAP-5=fW64xHEW+4dKU_voNv7E67nUOFm27FFBuhtFii52NiQUQ@mail.gmail.com>
 <CAD=FV=U3ic707dLuUc+NfxtWF6-ZyRdE0OY2VA6TgvgWKCHUzg@mail.gmail.com>
 <CAP-5=fVkw6TLjVuR3UCNs+X1cwVmYk7UFABio4oDOwfshqoP_g@mail.gmail.com>
 <CAD=FV=UWkZx8xQD=jBkOO6h2f5tw_KCoqhHciw5hkEOYU=GM8A@mail.gmail.com>
 <CAP-5=fXTFHcCE8pf5qgEf1AVODs2+r+_nDUOiWgdQeEgUBHzfA@mail.gmail.com>
 <CAD=FV=VuDYiu5nL5ZeZcY2b+YXOzZtSu2E4qBBHz9fWTW8gPhg@mail.gmail.com>
 <CAP-5=fX4=fV70N3GCdXgV6o-YoJynnSppxJp0MwdRrtsyDrs0w@mail.gmail.com> <aOdbRI3BaMCbyvtv@mdev>
In-Reply-To: <aOdbRI3BaMCbyvtv@mdev>
From: Ian Rogers <irogers@google.com>
Date: Thu, 9 Oct 2025 06:22:53 -0700
X-Gm-Features: AS18NWASwkyvua1-o-5GApfZryqQldGLDGiPEERJurLRPNNxfov3J3ycLz5Cqx0
Message-ID: <CAP-5=fUAato=+jyNNESCX3SjWMEEJQ697VvWiBFCi5wKs_JQCA@mail.gmail.com>
Subject: Re: [RFC PATCH V1] watchdog: Add boot-time selection for hard lockup detector
To: Jinchao Wang <wangjinchao600@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Namhyung Kim <namhyung@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Will Deacon <will@kernel.org>, Yunhui Cui <cuiyunhui@bytedance.com>, akpm@linux-foundation.org, 
	catalin.marinas@arm.com, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	acme@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, kan.liang@linux.intel.com, 
	kees@kernel.org, masahiroy@kernel.org, aliceryhl@google.com, ojeda@kernel.org, 
	thomas.weissschuh@linutronix.de, xur@google.com, ruanjinjie@huawei.com, 
	gshan@redhat.com, maz@kernel.org, suzuki.poulose@arm.com, 
	zhanjie9@hisilicon.com, yangyicong@hisilicon.com, gautam@linux.ibm.com, 
	arnd@arndb.de, zhao.xichao@vivo.com, rppt@kernel.org, lihuafei1@huawei.com, 
	coxu@redhat.com, jpoimboe@kernel.org, yaozhenguo1@gmail.com, 
	luogengkun@huaweicloud.com, max.kellermann@ionos.com, tj@kernel.org, 
	yury.norov@gmail.com, thorsten.blum@linux.dev, x86@kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 8, 2025 at 11:50=E2=80=AFPM Jinchao Wang <wangjinchao600@gmail.=
com> wrote:
>
> On Tue, Oct 07, 2025 at 05:11:52PM -0700, Ian Rogers wrote:
> > On Tue, Oct 7, 2025 at 3:58=E2=80=AFPM Doug Anderson <dianders@chromium=
.org> wrote:
> > >
> > > Hi,
> > >
> > > On Tue, Oct 7, 2025 at 3:45=E2=80=AFPM Ian Rogers <irogers@google.com=
> wrote:
> > > >
> > > > On Tue, Oct 7, 2025 at 2:43=E2=80=AFPM Doug Anderson <dianders@chro=
mium.org> wrote:
> > > > ...
> > > > > The buddy watchdog was pretty much following the conventions that=
 were
> > > > > already in the code: that the hardlockup detector (whether backed=
 by
> > > > > perf or not) was essentially called the "nmi watchdog". There wer=
e a
> > > > > number of people that were involved in reviews and I don't believ=
e
> > > > > suggesting creating a whole different mechanism for enabling /
> > > > > disabling the buddy watchdog was never suggested.
> > > >
> > > > I suspect they lacked the context that 1 in the nmi_watchdog is tak=
en
> > > > to mean there's a perf event in use by the kernel with implications=
 on
> > > > how group events behave. This behavior has been user
> > > > visible/advertised for 9 years. I don't doubt that there were good
> > > > intentions by PowerPC's watchdog and in the buddy watchdog patches =
in
> > > > using the file, that use will lead to spurious warnings and behavio=
rs
> > > > by perf.
> > > >
> > > > My points remain:
> > > > 1) using multiple files regresses perf's performance;
> > > > 2) the file name by its meaning is wrong;
> > > > 3) old perf tools on new kernels won't behave as expected wrt warni=
ngs
> > > > and metrics because the meaning of the file has changed.
> > > > Using a separate file for each watchdog resolves this. It seems tha=
t
> > > > there wasn't enough critical mass for getting this right to have
> > > > mattered before, but that doesn't mean we shouldn't get it right no=
w.
> > >
> > > Presumably your next steps then are to find someone to submit a patch
> > > and try to convince others on the list that this is a good idea. The
> > > issue with perf has been known for a while now and I haven't seen any
> > > patches. As I've said, I won't stand in the way if everyone else
> > > agrees, but given that I'm still not convinced I'm not going to autho=
r
> > > any patches for this myself.
> >
> > Writing >1 of:
> > ```
> > static struct ctl_table watchdog_hardlockup_sysctl[] =3D {
> > {
> > .procname       =3D "nmi_watchdog",
> > .data =3D &watchdog_hardlockup_user_enabled,
> > .maxlen =3D sizeof(int),
> > .mode =3D 0444,
> > .proc_handler   =3D proc_nmi_watchdog,
> > .extra1 =3D SYSCTL_ZERO,
> > .extra2 =3D SYSCTL_ONE,
> > },
> > };
> > ```
> > is an exercise of copy-and-paste, if you need me to do the copy and
> > pasting then it is okay.
> Can we get whether a perf event is already in use directly from the
> perf subsystem? There may be (or will be) other kernel users of
> perf_event besides the NMI watchdog. Exposing that state from the perf
> side would avoid coupling unrelated users through nmi_watchdog and
> similar features.

For regular processes there is this unmerged proposal:
https://lore.kernel.org/lkml/20250603181634.1362626-1-ctshao@google.com/
it doesn't say whether the counter is pinned - the NMI watchdog's
counter is pinned to be a higher priority that flexible regular
counters that may be multiplexed. I don't believe there is anything to
say whether the kernel has taken a performance counter. In general
something else taking a performance counter is okay as  the kernel
will multiplex the counter or groups of counters.

The particular issue for the NMI watchdog counter is that groups of
events are tested to see if they fit on a PMU, the perf event open
will fail when a group isn't possible and then the events will be
reprogrammed by the perf tool without a group. When the group is
tested the PMU has always assumed that all counters are available,
which of course with the NMI watchdog they are not. This results with
the NMI watchdog causing a group of events to be created that can
never be scheduled.

Thanks,
Ian

> >
> > Thanks,
> > Ian
> >
> >
> > > -Doug
> > >
>
> --
> Jinchao

