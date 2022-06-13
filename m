Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32859547D42
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jun 2022 03:16:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LLtvF13F7z3cC1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jun 2022 11:16:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PxWK/9l6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PxWK/9l6;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LLttZ3Sbnz3bm0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jun 2022 11:16:06 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 019D4611FC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jun 2022 01:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CAE0C3411F
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jun 2022 01:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655082960;
	bh=T/oPYXJvfTUUTAn3CsqoozPh9/pXSGnZmlhYNE8gbWs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PxWK/9l6TdsQa77yV2AJPnGPvbYWhjRLP+wFfrNAXLjgtstoiHZXCMoo8B2IqcL7y
	 rJYzFIT+mHg3ZKrHvaheUxROxBUNvqFs2qlykv4MpcQSZOCcE5InVYzVY9gAedqrzl
	 FnuwwSzIfvkZHuyrFJ7SxGf5qezL+KsNEXhVx5VKfPjeumd7apyl49oYKlxtRU1zpg
	 GDBh5Hgh8YUFAxR7RJZPuea54fZ5P93OWebgMT4J8xA0g1zF/FoCx8KzlVZ5id19aY
	 dSaS71/WhW/0o+WHBrRP1zFeukLpZRbthXoRShYwKaOPOzZU843Ve5m0UWJoV8qtRs
	 VsQDIkfPoli1Q==
Received: by mail-ua1-f53.google.com with SMTP id v19so1673584uae.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jun 2022 18:16:00 -0700 (PDT)
X-Gm-Message-State: AOAM533IylUj6m0lKNhJj2G8I37TLnzUcqaHd2ffSuS19zNCMwB5fC2O
	7vzKTSCojLGA0riCVo35dCIqgQJfHmCOP9Jerqw=
X-Google-Smtp-Source: ABdhPJy022BVkvpX4bwvrgAxTSG7Jz6gfQIdan6W4shKCc4lN35Y4ktHFEjUhhT0WI19MsTm4e13W+ximSNeINXMAlQ=
X-Received: by 2002:ab0:3459:0:b0:378:ec81:4a8b with SMTP id
 a25-20020ab03459000000b00378ec814a8bmr14374212uaq.83.1655082959409; Sun, 12
 Jun 2022 18:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220405071314.3225832-1-guoren@kernel.org> <20220405071314.3225832-3-guoren@kernel.org>
 <20220608094108.GA18122@asgard.redhat.com>
In-Reply-To: <20220608094108.GA18122@asgard.redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 13 Jun 2022 09:15:48 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQhFbN3mK0jco=NAKZr4qCgvX4zkw3h6jdffr66Rz7REQ@mail.gmail.com>
Message-ID: <CAJF2gTQhFbN3mK0jco=NAKZr4qCgvX4zkw3h6jdffr66Rz7REQ@mail.gmail.com>
Subject: Re: [PATCH V12 02/20] uapi: always define F_GETLK64/F_SETLK64/F_SETLKW64
 in fcntl.h
To: Eugene Syromiatnikov <esyr@redhat.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Parisc List <linux-parisc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, the arch/x86 maintainers <x86@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, sparclinux <sparclinux@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, ldv@strace.io, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 8, 2022 at 5:41 PM Eugene Syromiatnikov <esyr@redhat.com> wrote=
:
>
> On Tue, Apr 05, 2022 at 03:12:56PM +0800, guoren@kernel.org wrote:
> > From: Christoph Hellwig <hch@lst.de>
> >
> > Note that before this change they were never visible to userspace due
> > to the fact that CONFIG_64BIT is only set for kernel builds.
>
> > -#ifndef CONFIG_64BIT
> > +#if __BITS_PER_LONG =3D=3D 32 || defined(__KERNEL__)
>
> Actually, it's quite the opposite: "ifndef" usage made it vailable at all=
 times
> to the userspace, and this change has actually broken building strace
> with the latest kernel headers[1][2].  There could be some debate
> whether having these F_*64 definitions exposed to the user space 64-bit
> applications, but it seems that were no harm (as they were exposed alread=
y
> for quite some time), and they are useful at least for strace for compat
> application tracing purposes.
>
> [1] https://github.com/strace/strace/runs/6779763146?check_suite_focus=3D=
true#step:4:3222
> [2] https://pipelines.actions.githubusercontent.com/serviceHosts/e5309ebd=
-8a2f-43f4-a212-b52080275b5d/_apis/pipelines/1/runs/1473/signedlogcontent/1=
2?urlExpires=3D2022-06-08T09%3A37%3A13.9248496Z&urlSigningMethod=3DHMACV1&u=
rlSignature=3DfIT7vd0O4NNRwzwKWLXY4UVZBIIF3XiVI9skAsGvV0I%3D
>
Yes, there is no CONFIG_64BIT in userspace, we shouldn't limit it with
(__BITS_PER_LONG =3D=3D 32 || defined(__KERNEL__)) to break the
compatibility. Just export F_*64 definitions permanently.

--=20
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
