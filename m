Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 647AB7B1157
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 05:54:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rx0411qqyz3cCg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 13:54:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.46; helo=mail-io1-f46.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rx03T0zvtz307h
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 13:54:27 +1000 (AEST)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-79fa2dbd793so373072539f.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 20:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695873264; x=1696478064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ffh5AuBADYvsfT7a3KQemhZt061Q+/YJzr1xF3hsJY=;
        b=kzFB9a0nnBqfuiBj/jelWqGsvxnlhCXv0wEripiPB90dDA6+JFnrZ/srE0afdixsg9
         bClB/uLG0u865reffUp1QBUU2hBuEWkWn1I4oVyfiSSPl+GVG5+3eibzEmVo1VrsoqXh
         O+AX9b9pfhawFYzluaHuoXjiQHL5xxXUs74VkEShHbB1DtW+nQ0dfFgng+n9a2ijzKdS
         CWbb2d9gSdadaE21YtlDVqhM8e+w33tN/dX31kPHJ3kZpBY/T8sFZwDUOLTEXl5aURG/
         +F7d//dsCu8sTHjhY7Jv9S+sRsPBGHWx8I7Ror4aON5qHF9EOGt4zNjr0CY7U2c4wR6v
         ftcw==
X-Gm-Message-State: AOJu0Yyry5CmByXExjyeqdM18vQCEcjKbahKvTZI24GgKq9zaeMeQbdM
	eyPcR90bIw6WjRMoA3syaWCZVlW77NzPU9asy84=
X-Google-Smtp-Source: AGHT+IHejStbeE558odE76K+o5Iv15QNsvtUJIfzQ0Z7pMMjVunz5I/JAr4eiOxxtAhfmjJ1B52foGpUDGi3P1LgrkU=
X-Received: by 2002:a5e:8804:0:b0:791:1e87:b47e with SMTP id
 l4-20020a5e8804000000b007911e87b47emr49195ioj.15.1695873263829; Wed, 27 Sep
 2023 20:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230907171540.36736-1-atrajeev@linux.vnet.ibm.com>
 <e5e806c3-da4a-8672-9c8e-6c341c6bd27d@linux.ibm.com> <11B32809-962E-4632-95FD-EAF07EE04D1D@linux.vnet.ibm.com>
In-Reply-To: <11B32809-962E-4632-95FD-EAF07EE04D1D@linux.vnet.ibm.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Wed, 27 Sep 2023 20:54:12 -0700
Message-ID: <CAM9d7cgtBCHZWt1h8jZj1k1VuJUvGXjmXuXBmE-4sZXW_inzPA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fix for shellcheck issues with version "0.6"
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, kajoljain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, root <root@ltcden13-lp4.aus.stglabs.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 26, 2023 at 9:29=E2=80=AFPM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
>
>
> > On 25-Sep-2023, at 1:34 PM, kajoljain <kjain@linux.ibm.com> wrote:
> >
> >
> >
> > On 9/7/23 22:45, Athira Rajeev wrote:
> >> From: root <root@ltcden13-lp4.aus.stglabs.ibm.com>
> >>
> >> shellcheck was run on perf tool shell scripts s a pre-requisite
> >> to include a build option for shellcheck discussed here:
> >> https://www.spinics.net/lists/linux-perf-users/msg25553.html
> >>
> >> And fixes were added for the coding/formatting issues in
> >> two patchsets:
> >> https://lore.kernel.org/linux-perf-users/20230613164145.50488-1-atraje=
ev@linux.vnet.ibm.com/
> >> https://lore.kernel.org/linux-perf-users/20230709182800.53002-1-atraje=
ev@linux.vnet.ibm.com/
> >>
> >> Three additional issues are observed with shellcheck "0.6" and
> >> this patchset covers those. With this patchset,
> >>
> >> # for F in $(find tests/shell/ -perm -o=3Dx -name '*.sh'); do shellche=
ck -S warning $F; done
> >> # echo $?
> >> 0
> >>
> >
> > Patchset looks good to me.
> >
> > Reviewed-by: Kajol Jain <kjain@linux.ibm.com>
> >
> > Thanks,
> > Kajol Jain
> >
>
> Hi Namhyunbg,
>
> Can you please check for this patchset also

Sure, it's applied to perf-tools-next, thanks!
