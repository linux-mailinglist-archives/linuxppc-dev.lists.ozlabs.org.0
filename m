Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 486C87443BD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 23:03:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bKdUOjRC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qt7891f8Lz3btk
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jul 2023 07:03:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bKdUOjRC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qt77D31V8z3bkM
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jul 2023 07:02:32 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DC3EB6181B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 21:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40411C433CD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 21:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688158948;
	bh=VcUOHJR+47uuktJ5ytIptdWQ67g+qS6C8InKoEpNYPI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bKdUOjRCwCirUT9q7WtJCF4J3SZ4MFRFD8zaccxrUCFa9mbQEs4fZgvNSunaFSwHS
	 11ybRccrlNFDydC4LidgSdsGFXA7rSGVX9439m9ZFKuiJyw/WNoOyg+GKmnSr3ULyi
	 wHhqaTJsHXAOUOCB0CP88rjXunxKGHZQNCJkujwp9IlyYNecbajAR7n5nXCcv+pBd0
	 xscq2RUpHgoTZpW4VfBOQaINmjy/m8iOmKsAxgavZPUEy+5Qxp+J0WV2yqYc1p3A/T
	 B4lnfUMei8c8YgAy1s72TdRRzKQF1QxEjVJiQBSjzJ8Bn08y+Qvs1GD3YMgvhh8+Wh
	 4BILoquM3xp7A==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b69923a715so36937481fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 14:02:28 -0700 (PDT)
X-Gm-Message-State: ABy/qLbv2H9cF3TJj3KXYMFJx5WNA4+vaLtF6DZUT/7b+QT5T7af6o8I
	vKZKvioC0Hy0cUmu7jI6pK46nUckGM2ZM0MADw==
X-Google-Smtp-Source: APBJJlFXPs+PM/Yq4ExfSZtrMaxYg8sRjO2RE/Hx0FHDxKM+5ocBDwFMqtPHbTzm605Nqffb+L2iwr7y6OT1M6EjMHQ=
X-Received: by 2002:a2e:3a10:0:b0:2b5:8102:1843 with SMTP id
 h16-20020a2e3a10000000b002b581021843mr3406860lja.18.1688158946181; Fri, 30
 Jun 2023 14:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230609183111.1765507-1-robh@kernel.org>
In-Reply-To: <20230609183111.1765507-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 30 Jun 2023 15:02:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJOAK4EzED1fbKiyyv8zzS4A0ZVzHu9Us9RhmFRnPYJpQ@mail.gmail.com>
Message-ID: <CAL_JsqJOAK4EzED1fbKiyyv8zzS4A0ZVzHu9Us9RhmFRnPYJpQ@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: pmac32: Use of_property_read_reg() to parse "reg"
To: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 9, 2023 at 12:31=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> Use the recently added of_property_read_reg() helper to get the
> untranslated "reg" address value.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/cpufreq/pmac32-cpufreq.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Ping!

>
> diff --git a/drivers/cpufreq/pmac32-cpufreq.c b/drivers/cpufreq/pmac32-cp=
ufreq.c
> index ec75e79659ac..f53635ba16c1 100644
> --- a/drivers/cpufreq/pmac32-cpufreq.c
> +++ b/drivers/cpufreq/pmac32-cpufreq.c
> @@ -378,10 +378,9 @@ static int pmac_cpufreq_cpu_init(struct cpufreq_poli=
cy *policy)
>
>  static u32 read_gpio(struct device_node *np)
>  {
> -       const u32 *reg =3D of_get_property(np, "reg", NULL);
> -       u32 offset;
> +       u64 offset;
>
> -       if (reg =3D=3D NULL)
> +       if (of_property_read_reg(np, 0, &offset, NULL) < 0)
>                 return 0;
>         /* That works for all keylargos but shall be fixed properly
>          * some day... The problem is that it seems we can't rely
> --
> 2.39.2
>
