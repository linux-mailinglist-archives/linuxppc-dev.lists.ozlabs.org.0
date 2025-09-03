Return-Path: <linuxppc-dev+bounces-11677-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7C0B42224
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 15:41:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cH3g95dL9z30D3;
	Wed,  3 Sep 2025 23:41:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756906901;
	cv=none; b=dKvT7sqhpJhT1LeyIqTLvFzaR1NX7ZZpiT8i86aiEpDHeclHHXCISi2fJCyllNXCx/7SOKNjaTJIU9PbI1MXeEEmuIAyFAPcQOUWOQiqHi7WT4KehxOC36UnIG7IhTIWu24wILvgZ3GNMlpAsVx6HBZJwsCdNfljG1+0mYEIcEiEo3/iEhqM18Af/Tom+zDXmDv4k4InocQUO8SjxwqsGQWbbqiDE5PGS7eusoJWgb7Dy83JL1OVxfXTSsxqHsyttcXiE9WSKyU86hnJJBRIwQ/lAjOdHRVC0uXDY/KrGPaoVYuE/7CvIpuZOnD9bC5GzfXZmliFP89JgH8A+4gQLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756906901; c=relaxed/relaxed;
	bh=A8mClpVxiqUUuW2AJ7FygEu78/AmPq4S0W+oewFRLjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ouB/jNyLrXDSwHkB37cl/OkeDNVdb+kRNaXf7+6nJSqtA4XT+5Zjh7Uc5YVAjdkbZZU0SarwJ0y+/gDv75m07yVLqcMjE0uqLt3/b18S/twnviqOj4tqAuImz3+qS7AdWQ9aZiQjn0x26Ni5E2IS7ILb4cBaMOqvHwq8+LrgGi8JWZcvq5p8rzlvywbNFy3B64lXIRrSfuNNAldu6gJN1PrlMyWJVSdapfzrl8dvKhfH+nvGjN8oqWCwTycdG/eL8Q+7eqE7G9benIJFUZbjSIozzjtyGh4xe+/KwMdMovB346/kHdRJ3RGe26T2RCf3Elwp7Ta/BHwS/1ZSpuUA7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gREu3S3c; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gREu3S3c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cH3g90S0Mz2xlM
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 23:41:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E271447C4
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 13:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39FBEC4CEFB
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 13:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756906899;
	bh=GdyS+4iaGJbGIJ9ctC+uFtQbJ57ANyqF8rmhb7Dc65Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gREu3S3cIIExxWuJPsc+munhlGaJtSwRMnS15DA4v0a6bQz6CWCrmik3TzYj/QUJj
	 3ZloY/8FCzhwS85PBka4CYNFeEOJbr7uVgfvXPdZeoAikj7Uo0dnGkAxWxGkG+5qsO
	 Ubyh/2IuzT8yKsZ/kPtNv09e6T7qhzcGrsaH6Y8fwLeZyjglfWVXXhr2JNPe5wC7Yw
	 F1Qxtcff4RNjFLRfNMG69ZKoOHxIslevyytvdomIhf8ZQZp2ywnG4IJCrefXprlYQy
	 PWeQU1n7TY41TrGtpOURB7CSxfyFAU/wyFf1li3R+PGyBGvuiJDKyH0k8eoNUsZlzO
	 OT60wNUwudvhQ==
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-74557b7703aso1520682a34.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Sep 2025 06:41:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW2Vnf2simw01I07A6xFG/p6o5AZz4nuOxaO0wI2Gg7+NYCyqG8qWou/0O7uzo1twVdwp6chROK4SPvO5k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyO5gAsTvXndLDlbxXqMAj4kdZREe6aE3ZKJX2n6Ii8RyRDXy9q
	4RpCJr5/DP3wl0rlyE9/IQJaw7BKSwP5oyT6dF0Tj5ndMpaN4c8ezUVN6HTE2Q4knM9D+Hdx/uJ
	gKM7cCcIjc9hCnYCmf45i44oKXB6aasQ=
X-Google-Smtp-Source: AGHT+IE8CKY9R9M90mIkT56C6rGxrcA7dBv19VhPe7gEVCnw2r6FCP2pLXabMt9+rlKIM6nRFLb5/otuT90mPVIOHdY=
X-Received: by 2002:a05:6808:8219:b0:434:97b:5eb9 with SMTP id
 5614622812f47-437f7d74afbmr6249755b6e.28.1756906898553; Wed, 03 Sep 2025
 06:41:38 -0700 (PDT)
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
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
 <20250903131733.57637-11-zhangzihuan@kylinos.cn> <34b5e01e-2f4a-4d57-93ca-ab4549681b17@kernel.org>
In-Reply-To: <34b5e01e-2f4a-4d57-93ca-ab4549681b17@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 3 Sep 2025 15:41:26 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hisM6vfdNXaY7qCGtcMb1FENGxiBb=E=tkqDbRyjs=bA@mail.gmail.com>
X-Gm-Features: Ac12FXyg097RI81OLcVmXs8LtZCLVL9SQzq0jRH5EJZq7nDwUhDORw8eege7vFE
Message-ID: <CAJZ5v0hisM6vfdNXaY7qCGtcMb1FENGxiBb=E=tkqDbRyjs=bA@mail.gmail.com>
Subject: Re: [PATCH v4 10/10] PM: EM: Use scope-based cleanup helper
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Zihuan Zhang <zhangzihuan@kylinos.cn>, "Rafael J . wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, 
	Ben Horgan <ben.horgan@arm.com>, zhenglifeng <zhenglifeng1@huawei.com>, 
	Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Beata Michalska <beata.michalska@arm.com>, 
	Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>, Sumit Gupta <sumitg@nvidia.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Sep 3, 2025 at 3:22=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 03/09/2025 15:17, Zihuan Zhang wrote:
> > Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> > annotation for policy references. This reduces the risk of reference
> > counting mistakes and aligns the code with the latest kernel style.
> >
> > No functional change intended.
> >
> > Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> > ---
> >  kernel/power/energy_model.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
> > index ea7995a25780..99401678e809 100644
> > --- a/kernel/power/energy_model.c
> > +++ b/kernel/power/energy_model.c
> > @@ -451,7 +451,7 @@ static void
> >  em_cpufreq_update_efficiencies(struct device *dev, struct em_perf_stat=
e *table)
> >  {
> >       struct em_perf_domain *pd =3D dev->em_pd;
> > -     struct cpufreq_policy *policy;
> > +     struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D NULL=
;
>
> This is not really correct coding style. Please read how to use
> cleanup.h expressed in that header. You should have here proper
> constructor or this should be moved. Or this should not be __free()...

I gather that this is what you mean (quoted verbatim from cleanup.h)

 * Given that the "__free(...) =3D NULL" pattern for variables defined at
 * the top of the function poses this potential interdependency problem
 * the recommendation is to always define and assign variables in one
 * statement and not group variable definitions at the top of the
 * function when __free() is used.

and thanks for pointing this out!

