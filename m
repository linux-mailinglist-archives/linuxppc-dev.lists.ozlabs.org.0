Return-Path: <linuxppc-dev+bounces-11436-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5BEB3A773
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 19:15:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCShW3TZSz2xWP;
	Fri, 29 Aug 2025 03:15:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756401323;
	cv=none; b=iMtS5icn7Sr2aLkChcLfqADy4jIKDlI2mKSXwTDHrYupoTtViSFt8wpkhGNqnpMCvP55YYRxS9+Xdrj0mpwzw9r4X2WfhAq2rfHdXTGUpLOOs1457YJVjN2WK5IRjFUqGaLb0JWnBVr6U9UbkbzWyPup8fKjzXc2w5YPNW0OHs4PaR2l4ACYYM+yTMSbucEfyam8M/jnGkCAVMpHhnFLUGtxqq8aaybafHX5neXsXY61VkkyR51+FutjFpUz3ff3+f4jXTFh5W7hugj/wb6gC8bQ0UpqTpzojkrfz4mK0cASB562dWWbw1n659jVjFMt8n11Omw0uD90bktE4QmLvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756401323; c=relaxed/relaxed;
	bh=g/D1R1ws5ojuN4WG3pCUGyU24UMqyGj6lojr+YSYQ0c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=es0I89ml5cGEdtuyG0o3Jj9GBlC171/hqHaoCC2fz4oIbO5PzjOvHgV7NV/XC85axW9F+sbk1d4hK7VrpHgWTFudGf3gm9m4pPoxarj2kWQsHtP0USO8Dj0x5HJDmsf9JNciuL6lLVjgtXtP5cGEmJ0LLuB9AYx4oFMAKsaAIqREM6OzdGMnMerjv+L8hyGz2Qwhm328SXAlPo5sehDS8qJodkMS2d/mc/btRNGThs/FvxjNrTQRmtS+3pLBuEYh4d//Y1JGeybV0yvMmqt3eOd0HaxmV4zkNIXFZ5X68HDqGrMAI5bG976SnqvdKWHFSx3XiXWdsdzBdiUc/FhtDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=B+7pQYTN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3po6waaykdnef1xa6z3bb381.zb985ahkccz-01i85fgf.bm8xyf.be3@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=B+7pQYTN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3po6waaykdnef1xa6z3bb381.zb985ahkccz-01i85fgf.bm8xyf.be3@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCShV0h3bz2xVq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 03:15:21 +1000 (AEST)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3235e45b815so1393692a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 10:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756401319; x=1757006119; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/D1R1ws5ojuN4WG3pCUGyU24UMqyGj6lojr+YSYQ0c=;
        b=B+7pQYTNCd4eUFhjODF3IlVSGBtQZ9PPGsgymssdBKVGlNgpho9ttvWRqwjneNq8nj
         rI6ctwIKh2nnsbeDwC02CTS6KqU+SQI4QDc7BZfjEQEolR603YE4YO8CTu5tuM6gDhRH
         0wQ//GJeDwWnBcrhO/9bgFuP5wL2gikWazg0wYInGPtxRMkr7nZfI2wNuU7O2UdYMcjf
         Aer1DU7bl07vaKYwvZ7g0/ioqFJGOSVNySuNKTJF1Kwqw1tuf6f5pO+zuTbRKLleygv9
         eHzE2FCJm7mPsDHfQ9wm2OyI1MuPEhkqU7bd679fwYI5hWliUAZv92m8t++PjuABdo5e
         s5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756401319; x=1757006119;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g/D1R1ws5ojuN4WG3pCUGyU24UMqyGj6lojr+YSYQ0c=;
        b=o35QcG3eeSPz1cPCy/vcSdf/DPJTxvHvNnVXSN9IMbzJnr62F1n+08XDOIdFR1kKs5
         h/zx5mxDyjG61Go3NaR6JX4sFU/vYE249vPCBD+LiHLFVpznL8k9khZ48Jm0UzgseSru
         xn8OgIMQM24p9fJoq83q+BDxB9JncTypZijjG3gT6EBPpJGCzX7wvaYIa1NPZ00nsiEh
         q8omtdcmAr3FYVy9t92Zf/8kqc4YOjAtPE9pdQvEHlhuiQxV4kh2i2I2Sqezwn3KvKkB
         hmzBLzVPPEw/F3avMhWwwEOkokw6QjIIkzNmIlZcWF8mX5tRxFE4UZEjCwUN7a2iXLTp
         wUwg==
X-Forwarded-Encrypted: i=1; AJvYcCUtCdIwuJKJc5HATaS57GPUgDg9WxAzV+vNX+St1tqUYRh01ZJq52oUc9Um7byuB6E8VNmR5SXxqpl4RJI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxw5T5t/eCGgagxHN1gzwWqlUqF2dsJmb8A0DNQwtRXcQZyqndH
	7Ot96XZwof0rG7Dh+xZzSxA8/Rj+tMHjjNTVmBme96EViylHuBpxz8ER/ZI4XSsDUsx3C84fPIG
	i0DWEPQ==
X-Google-Smtp-Source: AGHT+IEgfCMAj/kPGbx0Dj2C82B+XByTzBEnlSaJgGQHGzaozLp7T19v0PG28aEIfyLg5E6WkydfWYNcBOM=
X-Received: from pjhk31.prod.google.com ([2002:a17:90a:4ca2:b0:327:9b90:7a79])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1dc3:b0:327:cec7:b8c6
 with SMTP id 98e67ed59e1d1-327cec7cb53mr1738031a91.32.1756401318775; Thu, 28
 Aug 2025 10:15:18 -0700 (PDT)
Date: Thu, 28 Aug 2025 10:15:17 -0700
In-Reply-To: <874d821e-8ea3-40ac-921b-c19bb380a456@kylinos.cn>
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
Mime-Version: 1.0
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-3-zhangzihuan@kylinos.cn> <aK8Sd30K64mbN1Nt@google.com> <874d821e-8ea3-40ac-921b-c19bb380a456@kylinos.cn>
Message-ID: <aLCOpfNkcQN9P-Wa@google.com>
Subject: Re: [PATCH v2 02/18] KVM: x86: Use __free(put_cpufreq_policy) for
 policy reference
From: Sean Christopherson <seanjc@google.com>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Markus Mayer <mmayer@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	zhenglifeng <zhenglifeng1@huawei.com>, "H . Peter Anvin" <hpa@zytor.com>, Zhang Rui <rui.zhang@intel.com>, 
	Len Brown <lenb@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Lukasz Luba <lukasz.luba@arm.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Beata Michalska <beata.michalska@arm.com>, 
	Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>, Sumit Gupta <sumitg@nvidia.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org, x86@kernel.org, 
	kvm@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Aug 28, 2025, Zihuan Zhang wrote:
> > Hmm, this is technically buggy.  __free() won't invoke put_cpufreq_poli=
cy() until
> > policy goes out of scope, and so using __free() means the code is effec=
tively:
> >=20
> > 		if (IS_ENABLED(CONFIG_CPU_FREQ)) {
> > 			struct cpufreq_policy *policy;
> > 			int cpu;
> >=20
> > 			cpu =3D get_cpu();
> > 			policy =3D cpufreq_cpu_get(cpu);
> > 			if (policy && policy->cpuinfo.max_freq)
> > 				max_tsc_khz =3D policy->cpuinfo.max_freq;
> > 			put_cpu();
> >=20
> > 			if (policy)
> > 				cpufreq_cpu_put(policy);
> > 		}

...

> Yes, this will indeed change the execution order.
> Can you accept that?=20

No, because it's buggy.

> Personally, I don=E2=80=99t think it=E2=80=99s ideal either.
>=20
> 		if (IS_ENABLED(CONFIG_CPU_FREQ)) {
>  			int cpu;
> 			cpu =3D get_cpu();
> 			{
> 				struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq_=
cpu_get(cpu);
> 				if (policy && policy->cpuinfo.max_freq)
> 					max_tsc_khz =3D policy->cpuinfo.max_freq;
> 			}
> 			put_cpu();
>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 }
>=20
> Other places may also have the same issue,
>=20
> maybe we should consider introducing a macro to handle this properly,
> so that initialization and cleanup are well defined without changing
> the existing order unexpected.
>=20
> like this:
>=20
> #define WITH_CPUFREQ_POLICY(cpu) {\
>=20
> for(struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D  \
> 			cpufreq_cpu_get(cpu);			\
> 			policy;)
>=20
> Then Use it:
>=20
> 		if (IS_ENABLED(CONFIG_CPU_FREQ)) {
>  			int cpu;
> 			cpu =3D get_cpu();
> 			WITH_CPUFREQ_POLICY(cpu){
> 				if (policy->cpuinfo.max_freq)
> 					max_tsc_khz =3D policy->cpuinfo.max_freq;
> 			}
> 			put_cpu();

This all feels very forced, in the sense that we have a shiny new tool and =
are
trying to use it everywhere without thinking critically about whether or no=
t
doing so is actually an improvement.

At a glance, this is literally the only instance in the entire kernel where=
 the
CPU to use is grabbed immediately before the policy.
=20
  $ git grep -B 20 cpufreq_cpu_get | grep -e get_cpu -e smp_processor_id
  arch/x86/kvm/x86.c-			cpu =3D get_cpu();
  drivers/cpufreq/cppc_cpufreq.c-static int cppc_get_cpu_power(struct devic=
e *cpu_dev,
  drivers/cpufreq/cppc_cpufreq.c-static int cppc_get_cpu_cost(struct device=
 *cpu_dev, unsigned long KHz,
  drivers/cpufreq/mediatek-cpufreq-hw.c-mtk_cpufreq_get_cpu_power(struct de=
vice *cpu_dev, unsigned long *uW,

Probably because KVM's usage is rather bizarre and honestly kind of dumb.  =
But
KVM has had this behavior for 15+ years, so as weird as it is, I'm not incl=
ined
to change it without a really, really strong reason to do so, e.g. to itera=
te
over all CPUs or something.

So given that this is the only intance of the problem patter, I think it ma=
kes
sense to leave KVM as-is, and not spend a bunch of time trying to figure ou=
t how
to make KVM's usage play nice with __free().

