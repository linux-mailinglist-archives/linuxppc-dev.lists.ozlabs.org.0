Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E2F62FBA0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 18:29:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDP16630Fz3dv5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 04:29:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H+DPfDKz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H+DPfDKz;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDP080RKPz3cGc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 04:28:56 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6A06D626A1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 17:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CCE5C4347C
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 17:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668792531;
	bh=BrBTx/whLYhdfKUZp4rrFLy6TDJGr7P0NBlDdxZEro8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=H+DPfDKz2SzQBQW7xTP5n0TMXhy/6PFa+FBO5+OB/qSexTM3/lM/KHlgrLn356ZPd
	 wQ1r7MsDlqvlzRlFmTk3e4K5ExyUx8orPv4DwiWS1u3t+eDl+97iJTT680UBKr/M6U
	 K22dSXUyFx1tXXo/fM4XD1bwIPbTxbM4sYf+QHG9p7BkUAGCx/F0Igptp6y6pcIR+t
	 D2u2g6/OMVbnaxqbUcRr1ZDFO3PpiD1n7eNlla+6Kwn/NNprEjQNs5qFSEFbUhimDA
	 j4fdLsj7ypiasj4r5hr5fucl468Bngnmeo5n6aV/rGcoLLCdXelEn7/k82w27ttxpA
	 X0qSPkXC52jig==
Received: by mail-ed1-f54.google.com with SMTP id z20so6601706edc.13
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 09:28:51 -0800 (PST)
X-Gm-Message-State: ANoB5pmw6vqKqNE/KUJH6rhKkECPeRnF0w5cpTUBYKQPsscl85w2GeyS
	HPnIMf+gJTwDIhHGcNTWABoEYcONaMWRqPX3t+8=
X-Google-Smtp-Source: AA0mqf4p8aOWIJBSxnm3XmiHGutE2xDSzafmxTzDS/eoIMQmy9xd6H4fPeP3uPf8kDMIjQSMq1P98/9PnldgQZvMj64=
X-Received: by 2002:a05:6402:538a:b0:458:fbd9:e3b1 with SMTP id
 ew10-20020a056402538a00b00458fbd9e3b1mr6994924edb.6.1668792529510; Fri, 18
 Nov 2022 09:28:49 -0800 (PST)
MIME-Version: 1.0
References: <20221110184303.393179-1-hbathini@linux.ibm.com>
 <00efe9b1-d9fd-441c-9eb4-cbf25d82baf2@csgroup.eu> <5b59b7df-d2ec-1664-f0fb-764c9b93417c@linux.ibm.com>
 <bf0af91e-861c-1608-7150-d31578be9b02@csgroup.eu> <e0266414-843f-db48-a56d-1d8a8944726a@csgroup.eu>
 <6151f5c6-2e64-5f2d-01b1-6f517f4301c0@linux.ibm.com> <02496f7a-51d8-4fc0-161d-b29d5e657089@csgroup.eu>
 <9d5c390a-31db-4f93-203d-281b0831d37f@linux.ibm.com> <c651bd44-d0ca-e3cf-0639-6b42b33f4666@csgroup.eu>
 <548de735-52d7-f5bb-5c85-370a1c233a08@linux.ibm.com> <b2a8589d-3272-4c82-8481-9fcb6d8f9bfc@csgroup.eu>
In-Reply-To: <b2a8589d-3272-4c82-8481-9fcb6d8f9bfc@csgroup.eu>
From: Song Liu <song@kernel.org>
Date: Fri, 18 Nov 2022 09:28:37 -0800
X-Gmail-Original-Message-ID: <CAPhsuW7uytWgsrv+y5qjqbxri-AgvrP9-EMnWyR48z6GhfHgfQ@mail.gmail.com>
Message-ID: <CAPhsuW7uytWgsrv+y5qjqbxri-AgvrP9-EMnWyR48z6GhfHgfQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] enable bpf_prog_pack allocator for powerpc
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 18, 2022 at 3:47 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 18/11/2022 =C3=A0 10:39, Hari Bathini a =C3=A9crit :
> >
> >
> > On 18/11/22 2:21 pm, Christophe Leroy wrote: >>>>>
> >>>>> I had the same config but hit this problem:
> >>>>>
> >>>>>        # echo 1 > /proc/sys/net/core/bpf_jit_enable; modprobe test_=
bpf
> >>>>>        test_bpf: #0 TAX
> >>>>>        ------------[ cut here ]------------
> >>>>>        WARNING: CPU: 0 PID: 96 at arch/powerpc/net/bpf_jit_comp.c:3=
67
> >>>>> bpf_int_jit_compile+0x8a0/0x9f8
> >>>>
> >>>> I get no such problem, on QEMU, and I checked the .config has:
> >>>
> >>>> CONFIG_STRICT_KERNEL_RWX=3Dy
> >>>> CONFIG_STRICT_MODULE_RWX=3Dy
> >>>
> >>> Yeah. That did the trick.
> >>
> >> Interesting. I guess we have to find out why it fails when those confi=
g
> >> are missing.
> >>
> >> Maybe module code plays with RO and NX flags even if
> >> CONFIG_STRICT_MODULE_RWX is not selected ?
> >
> > Need to look at the code closely but fwiw, observing same failure on
> > 64-bit as well with !STRICT_RWX...
>
> The problem is in bpf_prog_pack_alloc() and in alloc_new_pack() : They
> do set_memory_ro() and set_memory_x() without taking into account
> CONFIG_STRICT_MODULE_RWX.
>
> When CONFIG_STRICT_MODULE_RWX is selected, powerpc module_alloc()
> allocates PAGE_KERNEL memory, that is RW memory, and expects the user to
> call do set_memory_ro() and set_memory_x().
>
> But when CONFIG_STRICT_MODULE_RWX is not selected, powerpc
> module_alloc() allocates PAGE_KERNEL_TEXT memory, that is RWX memory,
> and expects to be able to always write into it.

Ah, I see. x86_64 requires CONFIG_STRICT_MODULE_RWX, so this hasn't
been a problem yet.

Thanks,
Song
