Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3700482B5A9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jan 2024 21:01:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JciEjkB2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T9wYB5DQVz3cVj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jan 2024 07:01:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JciEjkB2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T9wXM1MFSz3bqh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jan 2024 07:01:05 +1100 (AEDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40e60e135a7so8232435e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jan 2024 12:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705003262; x=1705608062; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAL60ZiXYTrQWwc6XvTjBF7mU0s/R7MUfIaHS38evWw=;
        b=JciEjkB2c4cHCNfpe5XeHd49UtwmWcu0CBT1lRGc/FlZttUbZ4GyaWnrfQoHRvQBw8
         OUGxBzipWohztfhfocAzN5s8o2XaOSU/k+0pDLbsTbcVYXSFLmBEH/O23gmdKpLS4hZP
         Iino1/o2+/ZtlV5rBDdKxS2zNzkD/C+JbDc2VvdOMvNYzuejfB5OXSfoZF+ThefLkQ85
         HKHVEewVJg9aggnMc2ttYGpqEU2D6+RAv3vnfPWWawhc98NSe3NOM4/vPTZT2sMI6TWZ
         IF7xQDoQ5I+UPaoSb5VLXsEBY8xrjSnTS+5JLoHlk3kMj9smO/w8BN0t8PWZwSMOjgXy
         tnyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705003262; x=1705608062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAL60ZiXYTrQWwc6XvTjBF7mU0s/R7MUfIaHS38evWw=;
        b=pOavoeE8WW5aEFwUw9ejuKJANXvjaAA6kIUCzC5OnMcxRB3Pmk7pIcSxYN+l9hOcpn
         3CrEJbvTfvuS3kgOdDYbuUSaoOIfOIuFOpH053qh7jVlEDv1ddPFYDE3POH0PpfiaXpJ
         cTFmusQMcPbMOna2Ru4eo8uAaKrIUlv852CbWoD+NTwPS7P/CVYckWiCmm7IZxmemBrb
         uwAfJjuINBpSqPiEwQLidm3RxXh0WSGC64Bgus6j+Co9aTOknVRrjBGTAFUpZt/fucQo
         i4gjKmwpkueYGY9vn15CHKhl6Zb6zyTt+lDr6LOHSEGSrLc+oauiOE9tBlTPdKNSy4lP
         jV/A==
X-Gm-Message-State: AOJu0YxvDlVuXCDw2iIFI7xPbYbfNU3Mqc+z7HnvkxtAwwSNaH4uxQ+s
	kGfNUUJ1oFGGfx7RL2pnIWJ3Pxm0PvfdKT1BrHM=
X-Google-Smtp-Source: AGHT+IEuD70YW9odmSJBW0ovp3CIEuHoCB7eupgpN0U69zefCCa6AEpsUHBsIEtkfYtc2dUZae2qy6ZzWQ5YfFTTiDA=
X-Received: by 2002:a05:600c:6548:b0:40e:52a7:ac58 with SMTP id
 dn8-20020a05600c654800b0040e52a7ac58mr243439wmb.65.1705003261872; Thu, 11 Jan
 2024 12:01:01 -0800 (PST)
MIME-Version: 1.0
References: <20240109-update-llvm-links-v1-0-eb09b59db071@kernel.org>
 <20240109-update-llvm-links-v1-1-eb09b59db071@kernel.org> <6a655e9f-9878-4292-9d16-f988c4bdfc73@linux.dev>
 <20240111194001.GA3805856@dev-arch.thelio-3990X>
In-Reply-To: <20240111194001.GA3805856@dev-arch.thelio-3990X>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 11 Jan 2024 12:00:50 -0800
Message-ID: <CAADnVQKFv2DKE=Um=+kcEzSWYCp9USQT_VpTawzNY6eRaUdu5g@mail.gmail.com>
Subject: Re: [PATCH 1/3] selftests/bpf: Update LLVM Phabricator links
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: linux-efi <linux-efi@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kvm@vger.kernel.org, clang-built-linux <llvm@lists.linux.dev>, Alexei Starovoitov <ast@kernel.org>, dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, kasan-dev <kasan-dev@googlegroups.com>, Yonghong Song <yonghong.song@linux.dev>, linux-riscv <linux-riscv@lists.infradead.org>, linux-arch <linux-arch@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Mykola Lysenko <mykolal@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, linux-media@vger.kernel.org, Linux Power Management <linux-pm@vger.kernel.org>, bridge@lists.linux.dev, bpf <bpf@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Network Development <netdev@vger.kernel.org>, patches@lists.linux.dev, LSM List <linux-security-module@vger.kernel.org>, Linux 
 Crypto Mailing List <linux-crypto@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-trace-kernel@vger.kernel.org, ppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 11, 2024 at 11:40=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> Hi Yonghong,
>
> On Wed, Jan 10, 2024 at 08:05:36PM -0800, Yonghong Song wrote:
> >
> > On 1/9/24 2:16 PM, Nathan Chancellor wrote:
> > > reviews.llvm.org was LLVM's Phabricator instances for code review. It
> > > has been abandoned in favor of GitHub pull requests. While the majori=
ty
> > > of links in the kernel sources still work because of the work Fangrui
> > > has done turning the dynamic Phabricator instance into a static archi=
ve,
> > > there are some issues with that work, so preemptively convert all the
> > > links in the kernel sources to point to the commit on GitHub.
> > >
> > > Most of the commits have the corresponding differential review link i=
n
> > > the commit message itself so there should not be any loss of fidelity=
 in
> > > the relevant information.
> > >
> > > Additionally, fix a typo in the xdpwall.c print ("LLMV" -> "LLVM") wh=
ile
> > > in the area.
> > >
> > > Link: https://discourse.llvm.org/t/update-on-github-pull-requests/715=
40/172
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> >
> > Ack with one nit below.
> >
> > Acked-by: Yonghong Song <yonghong.song@linux.dev>
>
> <snip>
>
> > > @@ -304,6 +304,6 @@ from running test_progs will look like:
> > >   .. code-block:: console
> > > -  test_xdpwall:FAIL:Does LLVM have https://reviews.llvm.org/D109073?=
 unexpected error: -4007
> > > +  test_xdpwall:FAIL:Does LLVM have https://github.com/llvm/llvm-proj=
ect/commit/ea72b0319d7b0f0c2fcf41d121afa5d031b319d5? unexpected error: -400=
7
> > > -__ https://reviews.llvm.org/D109073
> > > +__ https://github.com/llvm/llvm-project/commit/ea72b0319d7b0f0c2fcf4=
1d121afa5d031b319d
> >
> > To be consistent with other links, could you add the missing last alnum=
 '5' to the above link?
>
> Thanks a lot for catching this and providing an ack. Andrew, could you
> squash this update into selftests-bpf-update-llvm-phabricator-links.patch=
?

Please send a new patch.
We'd like to take all bpf patches through the bpf tree to avoid conflicts.
