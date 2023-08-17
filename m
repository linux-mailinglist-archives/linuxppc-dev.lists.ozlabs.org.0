Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 670D577FDCA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 20:24:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Q8brOLBr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRYM51w1Bz3cRh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 04:24:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Q8brOLBr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRYLC0bT7z3bP2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 04:24:01 +1000 (AEST)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4036bd4fff1so42131cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 11:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692296639; x=1692901439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyPgd/mzy3e9AG/uD1k9mjt/CrZGm/9DduF9N/8ao4w=;
        b=Q8brOLBrJJWa/g/bdHF1HXSxhnyx8ivWe+WrueBRo525CL4OxvWvUCeARiuqITd2Qh
         s0dY0IXWZDvDUG4UZy/1FlpEbwGaZxOtSuXCp7HQhILW4HEhiS7mFOwNuNC/fVUL/8Yf
         bpEeTBo85BvE4dj0/ABx6Sp2hefVHWeHbvf+yBb1iF8iZHAGl8UzRtbmwXZt9lH0o7KO
         /P3ongCQIPf9XO0lisGEVhU3TGuX7a9l5/xsgmsCh8CqSLjKyPNorzKbFlovpDpjH4B4
         BnB8dnfGxyj2HzEtqHcFqoYx432dXUs4C+irq+NtgsOXPCVAGt02ItbQMj7EZ5n0WR7M
         CC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692296639; x=1692901439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hyPgd/mzy3e9AG/uD1k9mjt/CrZGm/9DduF9N/8ao4w=;
        b=aMz+YNjOxqTr0eE1MuZK0qpCp2f//53D2RwEC19n0impYn2rPdKy89/h0Bgnd8sJJy
         NTStAraFjnsCB4+ZGv1+JQbScC+VOay/8NwGTH3U43affnxJhUsGKjK1XyXNn6LbG4Tc
         O++xwf6cqQqOYHCXhiHRMaxnDC5Z/GaT4HHsTcmW2X2kNoHZ+q0T2vGr92GACiHGosGY
         HBE4SqUYC/p7+ZgrXnHwMhK9qxzzNpT7VbONHCUqPZ7z3VKayA/d/l40sNZJFXJzqN9Q
         PXktkBKwtQtPGmGmYpp5r1mXXD6Op6w+XQ6YcM1ftNzHDfwM/deHx/7jPLn8ML+qk563
         rt6A==
X-Gm-Message-State: AOJu0YxJSsgaAZzvULLFqxcQE+aIp+C3N/MY5noovIi14EzxKwNoJ9R7
	scunftrTtNKgSnh0qLjSuml8RrOxnuG7Emijohyo2g==
X-Google-Smtp-Source: AGHT+IHcCkcUGlW/F6JQLj7bIzN/U4StDR3E110WtBlPdvUWDgCSWkRmV//R9AtuaCI805amlTviMc9ENAz9XsUXgMw=
X-Received: by 2002:ac8:5844:0:b0:40f:b556:b392 with SMTP id
 h4-20020ac85844000000b0040fb556b392mr41872qth.12.1692296638791; Thu, 17 Aug
 2023 11:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230807045223.23452-1-atrajeev@linux.vnet.ibm.com>
 <D01070A8-D55B-4A9D-B81E-A9946920BBF8@linux.ibm.com> <A9D8B3C5-B663-4D27-B6CF-BE4873BB39B9@linux.vnet.ibm.com>
In-Reply-To: <A9D8B3C5-B663-4D27-B6CF-BE4873BB39B9@linux.vnet.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 17 Aug 2023 11:23:44 -0700
Message-ID: <CAP-5=fU9y=ZAmC3TB2vmL2gw_g8V3WyXQ-9c7ZXFCdJ-+e2DEw@mail.gmail.com>
Subject: Re: [PATCH] tools/perf: Fix bpf__probe to set bpf_prog_type type only
 if differs from the desired one
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Sachin Sant <sachinp@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 17, 2023 at 10:35=E2=80=AFAM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
>
>
> > On 07-Aug-2023, at 11:07 AM, Sachin Sant <sachinp@linux.ibm.com> wrote:
> >
> >
> >
> >> On 07-Aug-2023, at 10:22 AM, Athira Rajeev <atrajeev@linux.vnet.ibm.co=
m> wrote:
> >>
> >> The test "BPF prologue generation" fails as below:
> >>
> >>  Writing event: p:perf_bpf_probe/func _text+10423200 f_mode=3D+20(%gpr=
3):x32 offset=3D%gpr4:s64 orig=3D%gpr5:s32
> >>  In map_prologue, ntevs=3D1
> >>  mapping[0]=3D0
> >>  libbpf: prog 'bpf_func__null_lseek': BPF program load failed: Permiss=
ion denied
> >>  libbpf: prog 'bpf_func__null_lseek': -- BEGIN PROG LOAD LOG --
> >>  btf_vmlinux is malformed
> >>  reg type unsupported for arg#0 function bpf_func__null_lseek#5
> >>  0: R1=3Dctx(off=3D0,imm=3D0) R10=3Dfp0
> >>  ;
> >>  0: (57) r3 &=3D 2
> >>  R3 !read_ok
> >>  processed 1 insns (limit 1000000) max_states_per_insn 0 total_states =
0 peak_states 0 mark_read 0
> >>  -- END PROG LOAD LOG --
> >>  libbpf: prog 'bpf_func__null_lseek': failed to load: -13
> >>  libbpf: failed to load object '[bpf_prologue_test]'
> >>  bpf: load objects failed: err=3D-13: (Permission denied)
> >>  Failed to add events selected by BPF
> >>
> >> This fails occurs after this commit:
> >> commit d6e6286a12e7 ("libbpf: disassociate section handler
> >> on explicit bpf_program__set_type() call")'
> >>
> >> With this change, SEC_DEF handler libbpf which is determined
> >> initially based on program's SEC() is set to NULL. The change
> >> is made because sec_def is not valid when user sets the program
> >> type with bpf_program__set_type function. This commit also fixed
> >> bpf_prog_test_load() helper in selftests/bpf to force-set program
> >> type only if it differs from the desired one.
> >>
> >> The "bpf__probe" function in util/bpf-loader.c, also calls
> >> bpf_program__set_type to set bpf_prog_type. Add similar fix in
> >> here as well to avoid setting sec_def to NULL.
> >>
> >> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> >> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> >> ---
> >
> > Thanks Athira for the fix.
> > With this patch applied perf BPF prologue sub test works correctly.
> >
> > 42: BPF filter                                                     :
> > 42.1: Basic BPF filtering                                    : Ok
> > 42.2: BPF pinning                                              : Ok
> > 42.3: BPF prologue generation                          : Ok
> >
> > Tested-by: Sachin Sant <sachinp@linux.ibm.com>
> >
> > Can you please use the above mentioned id(without vnet) in the reported=
-by ?
> >
> > - Sachin
>
> Hi All,
>
> Looking for review comments on this patch
>
> Athira

Hi,

the patch set:
https://lore.kernel.org/lkml/20230810184853.2860737-1-irogers@google.com/
removes the affected code/test.

Thanks,
Ian
