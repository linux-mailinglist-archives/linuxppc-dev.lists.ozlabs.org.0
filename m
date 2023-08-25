Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC8F788D96
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 19:08:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXRH019RTz3cK4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 03:08:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.176; helo=mail-vk1-f176.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXRGR58Gpz2ypx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Aug 2023 03:07:42 +1000 (AEST)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-48d0b70097fso449461e0c.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 10:07:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692983259; x=1693588059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1tb0geUFc8vx6LoGbp7WpYKxucMfBPgZmEVnQBECGM=;
        b=U4qYtSSeAtaQ30mXH2+89wW4XKom3tlzUO4P3YQrzXqgKuqwMYea9q2cTd3E6UOWPi
         T+zqfMSm38OaCT5uaZWsNVIGqreV/Bl4gVTY+PEzye1wyNCojKE0MQaAyFzP+JrjM6QS
         a4nJJKLG+qw+rgl9UobYfkx2JWlXLbX80KG8n6QGu6GP5YOrj59D+HVgR86HaBH/xDO9
         vOSEYGLclN/fYjPvPpQ29cQxzPVZv9Oq6S8ITaHm7OoXN12Ee48jGy9ElxiBhKxw6agz
         l4Pgbm5tjVEhhzqidwC8hRm0rgh0BwBw1OjfLvUt6b7FsGk2FCbEXuVeCK4XsF6SSFd7
         8hqw==
X-Gm-Message-State: AOJu0YxT7NfYLioI7fmVGgeA0xBEsoKietRNBsaT10NZZp9l20bpNuNl
	0DAK1ppUU9pKxyx+d2CpP8w0Wq81Urd72Mywwgg=
X-Google-Smtp-Source: AGHT+IHHMQTF6wZqahiLTvUCQVLIE1slzY2m3zzfelSbCQPBO+HE+MRoryx8Bb0jAzcfqavyslqZxq3UpUHf5i3RGEo=
X-Received: by 2002:a1f:ca83:0:b0:48f:af58:b160 with SMTP id
 a125-20020a1fca83000000b0048faf58b160mr7443301vkg.9.1692983259107; Fri, 25
 Aug 2023 10:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230825061125.24312-1-adityag@linux.ibm.com>
In-Reply-To: <20230825061125.24312-1-adityag@linux.ibm.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Fri, 25 Aug 2023 10:07:28 -0700
Message-ID: <CAM9d7cgBJ1WHRuVcZ4FArm=pctbs-npLB2Q8PLZWmdfaK3dCzg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Introduce perf build subcommand
To: Aditya Gupta <adityag@linux.ibm.com>
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
Cc: irogers@google.com, maddy@linux.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, acme@kernel.org, linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com, jolsa@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Thu, Aug 24, 2023 at 11:11=E2=80=AFPM Aditya Gupta <adityag@linux.ibm.co=
m> wrote:
>
> The Problem
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Currently the presence of a feature is checked with a combination of
> perf version --build-options and greps, such as:
>
>     perf version --build-options | grep " on .* HAVE_FEATURE"
>
> Proposed solution
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> As suggested by contributors in:
> https://lore.kernel.org/linux-perf-users/ZMPWk5K63tadmDlU@kernel.org/
>
> Introduce a subcommand "perf build --has", with which
> scripts can test for presence of a feature, such as:
>
>     perf build --has HAVE_FEATURE
>
> The usage of "perf version --build-options | grep" has been replaced in t=
wo
> tests, with "perf build --has" command

I'm not sure 'perf build' is a good name, it sounds like it needs to build
something.  Maybe 'perf check --feature XXX' ?

Then we can extend the perf check command to *check* system
settings like perf_event_paranoid, kptr_restrict, nmi_watchdog
and so on, and possibly provides some advice or even change
the values easily.

What do you think?

Thanks,
Namhyung


>
> Also, to not duplicate the same feature list at multiple places, a new gl=
obal
> 'supported_features' array has been introduced in builtin.h, so both comm=
ands
> 'perf build --has' and 'perf version --build-options' use the same array
>
> 'supported_features' feature is an array of 'struct feature_support', whi=
ch
> also has the name of the feature, macro used to test it's presence, and a
> is_builtin member, which will be 0 if feature not built-in, and 1 if buil=
t-in
>
> Architectures Tested
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * x86_64
> * ppc64le
>
> Git tree
> =3D=3D=3D=3D=3D=3D=3D=3D
>
> Git tree with this patch series applied for testing:
> https://github.com/adi-g15-ibm/linux/tree/perf-build-has
>
> Aditya Gupta (3):
>   perf build: introduce build subcommand
>   perf version: update --build-options to use 'supported_features' array
>   perf tests task_analyzer: check perf build for libtraceevent support
>
> Athira Rajeev (1):
>   tools/perf/tests: Update probe_vfs_getname.sh script to use perf build
>     --has
>
>  tools/perf/Build                              |  1 +
>  tools/perf/builtin-build.c                    | 94 +++++++++++++++++++
>  tools/perf/builtin-version.c                  | 39 ++------
>  tools/perf/builtin.h                          | 47 ++++++++++
>  tools/perf/perf.c                             |  1 +
>  .../perf/tests/shell/lib/probe_vfs_getname.sh |  4 +-
>  .../shell/record+probe_libc_inet_pton.sh      |  5 +-
>  .../shell/record+script_probe_vfs_getname.sh  |  5 +-
>  tools/perf/tests/shell/test_task_analyzer.sh  |  4 +-
>  9 files changed, 163 insertions(+), 37 deletions(-)
>  create mode 100644 tools/perf/builtin-build.c
>
> --
> 2.41.0
>
