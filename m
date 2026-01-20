Return-Path: <linuxppc-dev+bounces-16063-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47725D3C16D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 09:08:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwKhh4TN4z309S;
	Tue, 20 Jan 2026 19:08:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768896516;
	cv=none; b=cT0GbInvUuIpMXYx5adF+X31QZdZ2FSd0TdgPnMS9cjIc2Q7jns8KnOVOdA3R9BiAwe61QZ+1BaDoR/8eDK4DRhfInyPO4MTNuRg3tEYTsv+z0Xwg+RKpuXlvM6F06Ve4H1EfSXpt1RsOel19I5chrZgbSLZT2nkBgkmEpbJvRDD+Zj0W8OKSR3O4GQv8imQi5BvaKmDZoUzlH70dIFZ3DiCzZSEHMGRmcBTo9FKFw92xIFlFfI4n32dJiCEW6wqg5GhR2L/ik57MxVx2tP6t6syVQrIRrdDazpxjdaO/7dgT6QvpTzbFD7sv5RNsHX46s6apcYGng68BzBwU86TEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768896516; c=relaxed/relaxed;
	bh=NA4JTGm5EKA0DtVd/uWEi4uM8RUpAnkAGhWVoxOqPEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cXRybG2X9Kmc53xChJWF6oi1KphN5P4QC7TldiUVJkNAzy5IPKuGfZSRHrPY4/jawYQM/ybd+YFQh13BYnOyV70traJTndi49gk7Kat6XYaaQFh4uxVq/j56M9rSKS7T5fgxIYSkshovUTbWbngvV7I8JeKDkOyb/lRkJJJ4oNSDFqMA1WtwRCrdEuQf96yR2VqgvKdRUgIW4zaHkJQhlPNSGrxWomQgv/qKXy8P1J5Ws14kgQFpVflJ6a6t80On2loAjbalFRZ/MKOfSXM3UKGLx5m3lm8EwSB9tpu48tMqTNA47YGo1dBl8Gh2o84IfgrFE9AEVMARuMNh1cHkgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E8ET/ZWa; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E8ET/ZWa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwKhg56Flz2y7b
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 19:08:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 89E9444313
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 08:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6E5C2BCB7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 08:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768896513;
	bh=NA4JTGm5EKA0DtVd/uWEi4uM8RUpAnkAGhWVoxOqPEA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E8ET/ZWaSEu9/MbotIBXsUekx0xcCP2Z8bYM+aLhxaY3CuxoZ4AvAvUMfE3WM0XmS
	 Jrsh+L+YxD4EVdd5ogjiMCP6QWRXv5diYGJKeccPips8pGytxydfbrUV3WeXaQ4sF4
	 522wXmz4PHiAlSnAt4eLThw90pMZTM29EFCPcSPxLmSI2dpv8SDGTQUXWaoQ4ia4V1
	 bfXw6Z2uyju/m6KIPVMor+RDkuW5DLkO3oXZ3o8fgsXjT1AJXJ8c+lre3mU0oWKDRl
	 BxU1QnmY6QFHDZJGWfsSLGtGTZInZPe4vIXgtFElZ5VrCdi6O1zA9rtslcb3GYIiZw
	 SCf0j35ZnVmfg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59b8466b4a8so4242601e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 00:08:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVkmmwL8vJFs7y2r+4RYTrOWwziSLh+QRpiymXqnbDjewtkV+E7ug6wIabuAhB6/StSgBiFKtvo+xTEFZQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwT8z5Faj6GHTe4uTdW2A+QHBdnOCgjIw1RB+Rlny/18MfJ3OvC
	KyRNIHo18G+jScWJRuMGHmGA//rQwWsuT65969YS+qOvT+NrCpFxGbuTtUfuFHFmKAmrPjIwxqn
	/ScLHGu0cQrT3vd6elvk/mIXwOwGxK2xBjmUasXf6Lw==
X-Received: by 2002:a05:6512:114a:b0:59b:7a1e:d3f with SMTP id
 2adb3069b0e04-59bafdc1eefmr4627613e87.19.1768896511812; Tue, 20 Jan 2026
 00:08:31 -0800 (PST)
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
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-8-32a0fa9a78b4@oss.qualcomm.com> <CAGb2v64uUhbEkB+iFjs5FGYR8E7=2nyNxDi646PmnygBZa6hQA@mail.gmail.com>
In-Reply-To: <CAGb2v64uUhbEkB+iFjs5FGYR8E7=2nyNxDi646PmnygBZa6hQA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 20 Jan 2026 09:08:19 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfFU6xfy=_R3iEreiT2qcTnT4cqx3vbL=40vS-F0HHUJA@mail.gmail.com>
X-Gm-Features: AZwV_QiFAPGyibgg_I9f0WcLSHJHA7hiPV4XToJPEVHONcLHBS618t-hqReMSp4
Message-ID: <CAMRc=MfFU6xfy=_R3iEreiT2qcTnT4cqx3vbL=40vS-F0HHUJA@mail.gmail.com>
Subject: Re: [PATCH 8/8] soc: sunxi: mbus: don't access of_root directly
To: wens@kernel.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jan 20, 2026 at 9:05=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Mon, Jan 19, 2026 at 6:40=E2=80=AFPM Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >
> > Don't access of_root directly as it reduces the build test coverage for
> > this driver with COMPILE_TEST=3Dy and OF=3Dn. Use existing helper funct=
ions
> > to retrieve the relevant information.
>
> I was somewhat expecting a matching change to the Kconfig to add
> COMPILE_TEST to the "depends on" line.
>
> But maybe the case is already hit with ARM=3Dy && USE_OF=3Dn ?
>

Yeah, that would be the next step but there may be more weird
dependencies hidden in here so let's do it separately after this is
addressed or we'll get stuck looking and buildbot reports.

Bart

