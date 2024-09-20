Return-Path: <linuxppc-dev+bounces-1482-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBD097D092
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2024 06:31:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8zwQ1ZGjz2xjY;
	Fri, 20 Sep 2024 14:31:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726806662;
	cv=none; b=m/OLLJ/cbJkoZsMnt+6rPV4gz+TB68ygbHR9pAy+UixtTZeBFq56Aybmozh8OrVZi3ize5PMaS4AIi362TcWtMsqf1I60hKl+lvUoCnxk0l+Pkh0/AP0BqBxZUFSzyzX7YOGWXzDh5HR/KQ2ch/CHVFGQ3gXy8PP2tIKyPiM2WZRfNZWmavL+KLFgger+yzD4pxXPSNkVbJa+9Agw8diGb1Dh8GjLlej5pyY8H8cfz2CQKG+yBbAfQfMkexfnFL4vpl/kk2YiW1w5dFbG9uHK6wl7ux1l64A9gbmj2abd/7R/ZxbDW8+gF5m4LIGsQkln8sE80d8o/o8u+ZL+AAdEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726806662; c=relaxed/relaxed;
	bh=vwZzQGX/XbT68ML+CG1eoReUIKZmt+68bHViuwXsGFM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=koPBvzdCdHs9jObW18pA/2g5vBNAI3VXSFLVJByFEG/AhdXxiaavLyT/qtdAnSftAKt0KNQ9odu5qfnVAigtKXWXVTMAuajy5xFaAtFKZr/9vOfrKKBiG4iRYTZXgD3GQ5vUai+EFNy3Gfuy9d2M4ohE/XYn3S18bwi6VCxkgoBmnHAdgx7j6LFwYDDORDbwaMOG1Ks3bvIPMRoLtLRikBaJOuVVm/JCeEA+e5sKECAfhSXHN/rRhitjw80iE9D0nNj6XaK/494Fa1MFdd6JQPW4+EbA7SJZb3NpTmTZcj1L4G0SC0JaRD7MgtH+7NVgIPP5wha2qXDhxwZ99B1o+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cSMXUfkX; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cSMXUfkX;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8zwP1gd3z2xYl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2024 14:31:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726806661;
	bh=vwZzQGX/XbT68ML+CG1eoReUIKZmt+68bHViuwXsGFM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cSMXUfkXUZUos7/jmTKVyD2QpMpcWHWAaHePHfpTNN5WWg5z6YGK5zbnh51RgKRFy
	 CrVhR691goYtJLWQl0ArNXACn5dvLk1mhCInebpqBCGuJ2qPgUxn+ERlxuJLphj2kx
	 en4qlLC6Anaf5374MfQkYBbr2tpJJSA5PrATZ5O+w+dFOwMBb53K9D1/icLb4aat5Q
	 zZTJsuYGdOfMy7DtM8u3+lESQuPhSuNvx2MntTim8athoDVW6/RK9Eon6TFPYvBi4U
	 mzrLr2OGea7RC44mog6+77sUsp4X5cwQUCWxL0cY1VPI+ZXZlX730iH5EcgXmWDkVh
	 v1/wGFjbi7EQQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X8zwM2xw1z4xR5;
	Fri, 20 Sep 2024 14:30:58 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christian Zigotzky <chzigotzky@xenosoft.de>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Trevor Dickinson
 <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>, Darren Stevens
 <darren@stevens-zone.net>
Subject: Re: [FSL P50x0] [GIT KERNEL] [VDSO] compiling issue
In-Reply-To: <0C6E937D-A322-4B76-96E8-2C239241F049@xenosoft.de>
References: <de2d1e74-52e5-4d74-8228-4aaea61cad51@xenosoft.de>
 <0C6E937D-A322-4B76-96E8-2C239241F049@xenosoft.de>
Date: Fri, 20 Sep 2024 14:30:56 +1000
Message-ID: <874j6bndz3.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Christian Zigotzky <chzigotzky@xenosoft.de> writes:
> Hi All,
>
> The compiling of the latest Git kernel doesn=E2=80=99t work anymore for o=
ur FSL P5020/P5040 boards [1] since the random-6.12-rc1 updates [2].
>
> Error messages:
>
> arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not suppo=
rted
>
> make[2]: *** [arch/powerpc/kernel/vdso/Makefile:75: arch/powerpc/kernel/v=
dso/vdso32.so.dbg]
>
> Reverting of the vdso updates has solved the compiing issue.
>
> Could you please check the random-6.12-rc1 updates? [2]
>
> Thanks,
> Christian
>
> [1] http://wiki.amiga.org/index.php?title=3DX5000
>
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D4a39ac5b7d62679c07a3e3d12b0f6982377d8a7d
>
> + Kernel config
>
> Link: https://raw.githubusercontent.com/chzigotzky/kernels/refs/heads/mai=
n/configs/x5000_defconfig

Your config has:

  # CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
  CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy

But all our defconfigs use CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE. Which
explains why we didn't catch this in build testing. I've added a build
with OPTIMIZE_FOR_SIZE=3Dy so hopefully we'll catch any similar errors in
future.

cheers

