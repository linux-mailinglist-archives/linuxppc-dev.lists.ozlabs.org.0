Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C71A6585112
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 15:47:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvTNY4CJJz3cdx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 23:47:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oMzRDd38;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oMzRDd38;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvTMs0tCfz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 23:47:04 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C4058B827DD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 13:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B782C433B5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 13:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659102418;
	bh=jlWA67ik7HWpGlimNkeX80+EmNYham+2fsifsCQt0/s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oMzRDd38lTUgCcBBD4wITi6kePxOZpfiMSJFdS4SpN4RJiR9EuFDmNMpYhXTSO5Zy
	 5Wr7hYxjH8OdUZ5qqcHYnZCEM94AY34w+ug6Q0CnNOFtJ0VwYcsw66AvvJD/25oXvr
	 1uP6zuzkd5amDkKEvgU2Wd+kOCpL11nIw2tVbw0LhTJYEkLAai405AHpUVtulWlbeU
	 1Eu5k+IbbDc0pXwQgAYP4t9pMCcqpHFZvtRUXO1a5p5oeZWMgk9extGJuVqWdhQViX
	 Y/JT3FYRv4T6Lp0Gm0x9rs+cvM5ffsyqUZap3kjn0Y+M5N+us1bVn4trw1F+Z/4CDf
	 K2aON3IkC8eEg==
Received: by mail-ua1-f41.google.com with SMTP id y12so1838440uad.10
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 06:46:58 -0700 (PDT)
X-Gm-Message-State: ACgBeo0hKtaNE2sDJvEpkdg8x0jiHpXgJ4AOf74CcjueixSrdVFqqbAR
	VRpdCLrChER5hXmkArAuzF0tkwnIBbtpSXQpWg==
X-Google-Smtp-Source: AA6agR5PmvGCM0mkzmecJwfwZOt2jeEZdF7UUaBABYn/PqpsiaR/083HWz0V12UPm3GkXn9KEqs9ZTFGKBkAOESYjhE=
X-Received: by 2002:ab0:2b06:0:b0:384:c4af:107c with SMTP id
 e6-20020ab02b06000000b00384c4af107cmr1304596uar.77.1659102417535; Fri, 29 Jul
 2022 06:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220504180822.29782-1-pali@kernel.org> <165909977761.253830.2305727219055135050.b4-ty@ellerman.id.au>
In-Reply-To: <165909977761.253830.2305727219055135050.b4-ty@ellerman.id.au>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 29 Jul 2022 07:46:46 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJZ6s4qU+Yt4CCj3q-Fk_MKEddx5aLKu15NLnTbgMyRGA@mail.gmail.com>
Message-ID: <CAL_JsqJZ6s4qU+Yt4CCj3q-Fk_MKEddx5aLKu15NLnTbgMyRGA@mail.gmail.com>
Subject: Re: [PATCH] powerpc/85xx: P2020: Add law_trgt_if property to PCIe DT nodes
To: Michael Ellerman <patch-notifications@ellerman.id.au>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 29, 2022 at 7:17 AM Michael Ellerman
<patch-notifications@ellerman.id.au> wrote:
>
> On Wed, 4 May 2022 20:08:22 +0200, Pali Roh=C3=A1r wrote:
> > DT law_trgt_if property defines Local Access Window Target Interface.
> >
> > Local Access Window Target Interface is used for identifying individual
> > peripheral and mapping its memory to CPU. Interface id is defined by
> > hardware itself.
> >
> > U-Boot uses law_trgt_if DT property in PCIe nodes for configuring memor=
y
> > mapping of individual PCIe controllers.
> >
> > [...]
>
> Applied to powerpc/next.
>
> [1/1] powerpc/85xx: P2020: Add law_trgt_if property to PCIe DT nodes
>       https://git.kernel.org/powerpc/c/1f00b5ab992c122c51bc37662b3b4df596=
3462f3

Why? Minimally, it needs a vendor prefix and s/_/-/ as I commented.

Rob
