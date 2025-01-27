Return-Path: <linuxppc-dev+bounces-5576-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF37A1CFCB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 04:32:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhDWc38vpz300V;
	Mon, 27 Jan 2025 14:32:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737948764;
	cv=none; b=WNICFysuZG2TSYlefaLA+9ZT2+jYJEOfSWg/rJXQUHyBuW14w1W2iI6z9AXfvhS4PcxEYZrwZJZHtKbBuEAt5xHBY+/zYzmt47vnQhmZixO740YOOacAR2hJp3auQacOpGVvan5ulb58P3edY8UtCPi2NPDjp/oSK60blUlyPQlkIvL9G+kR8bCntuoQOTKMOcxPIJleVEgGPIxGg8ZicAZ6ACZGb66XCijVZmG8yG0rqaf+YfzIaCl/pzXN54GPrq5bndlp/5yonGRGlmJhNo0tZcyyfMUQhJ00N06Dvyg67BLPo9yDvrejVRRZH/wrQSomVAaHR4kzsAlQ7VFl6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737948764; c=relaxed/relaxed;
	bh=HSKBdkcHUpmfLPk161Kn0rx+ur3BhotIfl5VOt/amok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KdTnCJnti2HTyJNfaRHXV1iWKaVXE+pQx+qvY2tQntEQMejdu4wj27qsKs2OXkt8/QGIoMZ2fgbVKU994ji4wrJQCzVIJBhXJFN4w0JN2wZYW3mNuLK4dKSaKveE5UT/L9JSFYalHEwGVkQhgvqyIze5fME/k82+weRUCnag6JCE6B/ti/J0LBNuc7YzarUbYromn7w07goyqXV7nupV145c0atptdOnYRiH20NESnuaR8dG47d8Nt9kmXAoo6rTbk4slYL3SOFRpQuVwMus+rSDR72SnnwwGJDFosR1KyeTp+EeEeT3rjzp+NDaqVFwQCiILacX8lFjck5sEZbhsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Txjd7V/W; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Txjd7V/W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhDWb20Dhz2yyJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 14:32:42 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21636268e43so85269435ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jan 2025 19:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737948759; x=1738553559; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HSKBdkcHUpmfLPk161Kn0rx+ur3BhotIfl5VOt/amok=;
        b=Txjd7V/Wyysy0ELgl/7yR4xFLdU+RWvHZnXPKX+6G8yzCwNhwI/n0xsAqhjboPtl+O
         JEodMpeHLzieI9Mm/VBh1JQJ7QUmEEOmqwrTHa37AYVXhzEBxwNRJc/G8fmXROslnOFo
         qSdal80ikOBPIPbjnDhW7YpGeLAbLVEG/Y7umfboRs2j+KR56rfkSBkL6RG+y0KD/1Tt
         ixhLdSmEM9txfy3CzPdoBGJ8bteVhGbA/CIwlnRrKtg/Yop+1SCOALQJH3va34OxnP+o
         jLFdBq0msqDrz8CuTBgjRroDANmdma6I9a55Jjub9wCdWpGB1LW26gII30sk2tYjQI45
         5fVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737948759; x=1738553559;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HSKBdkcHUpmfLPk161Kn0rx+ur3BhotIfl5VOt/amok=;
        b=Bvc4mOviqLswnZIrHy1OG95QKy8QzyC7bafEEsdmnwXUgOW9sIMTz/ze5AHXYACjNt
         zYWJ0E2dl9JiW8UU9nBiktNKoa3sgpkex/8bjZJb6GIcmD3U9QE1xhm32BfOfBLVvKh5
         13fWurEQElKIF1YPkr3iys+WFOHFuR8gjJA1Ta1ENJrMIyai/nlKUoQ7Ixz0u218Kdrb
         7XmIvVCO8hfHz5NhjNJuV7QH4tEnvr257FVBzWxDMhCUt7gBJhRsknr1+BeyXkoKhgeE
         wL7uUtbYCmA62eg0vf3iDhddXxGevMT8GuwYFZ6RgVRzPh2Efg3ej7paYKJJ9ShMknMZ
         v4EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGR/+cT9pkXp9dc5LFbma6R2PWI/LTyfAkyUDirrYFmb/wO5uM7P61k6I/g3KgmNJdVnOyxFQMpGBEAh8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyWIv1kcurfa4iOBao7CCNbXuVZsr/VP/cF22hpmF4DHOzxle1A
	ZDqXPNbZIpz/E71pbqHzIlNuwWBau8y4cGYPKiapB+xDsu5SSX58PsiLsxURlXQ=
X-Gm-Gg: ASbGnctYNfGPcVBkkvdUw/cAl5Om35p7smhud6vZAca65CCE7h83zW/iKXrSSdyttEp
	kV0SakLywhVPuFw+bph6yrvO7Yo2FVcv9Pwj6nxGafdOS92ZxPhr+VzSLfbAgJwDin3QeZpv82u
	bqc3D9pz6qY9Xm98+7ZKM2GHuWNPxy18YpBSnCkbl0zNaQ7bNx0oXdU4BfZEyt+5VxU8L39tMSv
	yVhqxSHPo65RJvuO+nk1siRjZjZ37vUTftim3Qjd5OzvgA1omCoATuufZNT6Lx0o6JKODrQMm9v
	GFbCc2g=
X-Google-Smtp-Source: AGHT+IHvgBNK3NhwKI9n5fMBriq7FLdQFhDFQyHQaZNGZxzhpW+eaG60WMmG2z8DBaIbsP1G1cn9Zg==
X-Received: by 2002:a05:6a20:728d:b0:1db:eead:c588 with SMTP id adf61e73a8af0-1eb215ec4b9mr65731325637.29.1737948759394;
        Sun, 26 Jan 2025 19:32:39 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac496bbd01esm5342591a12.71.2025.01.26.19.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 19:32:38 -0800 (PST)
Date: Mon, 27 Jan 2025 09:02:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Hector Martin <marcan@marcan.st>,
	Huacai Chen <chenhuacai@kernel.org>, Huang Rui <ray.huang@amd.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Perry Yuan <perry.yuan@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sven Peter <sven@svenpeter.dev>, WANG Xuerui <kernel@xen0n.name>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>, arm-scmi@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 00/15] cpufreq: simplify boost handling
Message-ID: <20250127033228.abeqhrxoprqw5b4e@vireshk-i7>
References: <cover.1737707712.git.viresh.kumar@linaro.org>
 <CAJZ5v0jYSZQKkLN-TO_h0AazhHZtHgpavTnnAscLPYLmjX3LaA@mail.gmail.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0jYSZQKkLN-TO_h0AazhHZtHgpavTnnAscLPYLmjX3LaA@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 24-01-25, 12:05, Rafael J. Wysocki wrote:
> On Fri, Jan 24, 2025 at 9:58 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Hello,
> >
> > The boost feature can be controlled at two levels currently, driver
> > level (applies to all policies) and per-policy.
> >
> > Currently most of the drivers enables driver level boost support from the
> > per-policy ->init() callback, which isn't really efficient as that gets called
> > for each policy and then there is online/offline path too where this gets done
> > unnecessarily.
> >
> > Also it is possible to have a scenario where not all cpufreq policies support
> > boost frequencies. And letting sysfs (or other parts of the kernel) enable boost
> > feature for that policy isn't correct.
> >
> > Simplify and cleanup handling of boost to solve these issues.
> 
> I guess this depends on the previous series?

Yes my series and the boost related patches in your tree.

-- 
viresh

