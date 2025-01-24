Return-Path: <linuxppc-dev+bounces-5547-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 417E3A1B464
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2025 12:05:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YfZjs62yqz30Pn;
	Fri, 24 Jan 2025 22:05:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737716753;
	cv=none; b=g2jw2VvgsaA9Co0G6+YTJfwAXs06ITcmxJA2ytJ6BSLvasVTpNy6bGS2X0Bbv1R+QSKYDp2MgQXA6D6a12svXZBbwkQh3U4a/NJomS8bTvF4WSs+o5h4Cj6qnIYkyxdMOUhof5BkdKuTUhLR9RPMXTUcju2T5vMQak/t1i1z3kMYYIbzr2YcDtPNp/vjfPj7fybN5lNdNt6YUfg9/Vwr0EA0BW30RWrHVdyXIFB/kKkBoKx8VXkXojsgKz9wE63oAZq2mLo9Sy+MpcvUlCtQmHmzZZRnrxq2NESb/auNTUcTN4Z1i594O79uu/XlxcCcjAfhknOaiemE/ZUdxO1nwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737716753; c=relaxed/relaxed;
	bh=0dqwYTTHItjIM6ghqeOt0STczPqUYZ5EwZI5o2uzaA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ex/g1c/ipv0fszAsMwgt4z+ezxErou0BSD5BPc1t/OFXiADFOFjY/hUoaqGzMMVNtGpbUk9gf4S5KJrb29rmZUCHs8RJF+tW/vQ0KXNKUEqLOUzbUr7gj2uRIxPCn23xXL4n1J5kLRIana5IiHc4yiGZgX+xzXlEViH/ToFaBLhG7OnZlVk5ZmC7N0+CVo/WkgUzQghsiXyIbU63IipikZJ79U5uJS69iWbYtOCJNHbKIELqfLWymGraqqxtm32sGh8xPjyhcj4/Dt1/ByAQVB+RdnjUUzbmfQVkGljuo7RybTmFLoUPhRMI9XY7np+tvBlthY9DRyTNwkl6mw59RQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e2xss22X; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e2xss22X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YfZjq75D4z30Ns
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 22:05:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 711955C5E7C
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 11:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B132C4CEE9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 11:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737716749;
	bh=CBFb9cadK6CI8XSq0vtxlBS7O6t7I082PLHFx/6xqJg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e2xss22X+GyHcg3L8RAGJnHI3wDEOvPUmDUd72VUO16PECn3RbKh71bUJsCjz4MHd
	 34alIyJ7KAOL1PhHPmxJ8W6ZekOE7ybWqTa8Yi/U5HZVx5iPXhA7OQsPv/iDuqwGdD
	 RIoAyWvWanAC5dkN7+Vej8NoM8kxx4GFamPhoe4GdoZ4pWSeVhC8DVAMStEOXmq/IH
	 b9xNJyKxptQn4ZmyTBB2eKnumhh359jLGlyW5QahtLgPUgFatOjU2FaacQhNvAWxZB
	 Q7fZYMvH/pSF/rbwsu8wZDf4msxdCVQ5/q+XOaDGzvw3VuUt/w/QtKOeNm+aFsPuEO
	 qOqYyDaSZwucA==
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5fa2685c5c0so845380eaf.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 03:05:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVs0vze2QLWBHwP1Mp8YqJv6D/o7eFWqczO9DHKE8xw1MAJRINNl1feFrp1QI+p6rJ9PhoefreSds85hpg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxbS73VSLyyeeW/b4+qVAGi/Z9GavMJhpTckKR+6lWVHJzNsDIC
	dlFwoLW73sZAT9xqg37KqOuc9woY0VZYtPREmzook6+CC2t/VvA0hceXZTd+9VQrrPkoLszLxtA
	a0r7Mg4A0aTsReVFq+/Erq0gZC6Q=
X-Google-Smtp-Source: AGHT+IF9SQa/+bL5eAQooEMEc4F5um8UWTrom9xFFpSH41EcICfOloxWkQjjLH9ovO30qYEM+acRaxA2bbdUNAtBaco=
X-Received: by 2002:a05:6871:6187:b0:29e:4a13:603f with SMTP id
 586e51a60fabf-2b1c09e6ad7mr17574182fac.4.1737716748305; Fri, 24 Jan 2025
 03:05:48 -0800 (PST)
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
References: <cover.1737707712.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1737707712.git.viresh.kumar@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 24 Jan 2025 12:05:36 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jYSZQKkLN-TO_h0AazhHZtHgpavTnnAscLPYLmjX3LaA@mail.gmail.com>
X-Gm-Features: AWEUYZn3vDpFuQgrmPTKrUBYJK1_bLxZl9mOCsSZPYdX_ojBCvjxJpMU7z9GFhg
Message-ID: <CAJZ5v0jYSZQKkLN-TO_h0AazhHZtHgpavTnnAscLPYLmjX3LaA@mail.gmail.com>
Subject: Re: [PATCH 00/15] cpufreq: simplify boost handling
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Cristian Marussi <cristian.marussi@arm.com>, 
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>, Hector Martin <marcan@marcan.st>, 
	Huacai Chen <chenhuacai@kernel.org>, Huang Rui <ray.huang@amd.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Naveen N Rao <naveen@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Perry Yuan <perry.yuan@amd.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Sven Peter <sven@svenpeter.dev>, 
	WANG Xuerui <kernel@xen0n.name>, linux-pm@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>, Lifeng Zheng <zhenglifeng1@huawei.com>, 
	arm-scmi@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 24, 2025 at 9:58=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> Hello,
>
> The boost feature can be controlled at two levels currently, driver
> level (applies to all policies) and per-policy.
>
> Currently most of the drivers enables driver level boost support from the
> per-policy ->init() callback, which isn't really efficient as that gets c=
alled
> for each policy and then there is online/offline path too where this gets=
 done
> unnecessarily.
>
> Also it is possible to have a scenario where not all cpufreq policies sup=
port
> boost frequencies. And letting sysfs (or other parts of the kernel) enabl=
e boost
> feature for that policy isn't correct.
>
> Simplify and cleanup handling of boost to solve these issues.

I guess this depends on the previous series?

> Pushed here:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpufreq/boos=
t
>
> Rebased over few dependencies from PM tree, will push to the arm-cpufreq =
tree
> after merge window is closed.
>
> Viresh Kumar (15):
>   cpufreq: staticize cpufreq_boost_trigger_state()
>   cpufreq: Export cpufreq_boost_set_sw()
>   cpufreq: Introduce policy->boost_supported flag
>   cpufreq: acpi: Set policy->boost_supported
>   cpufreq: amd: Set policy->boost_supported
>   cpufreq: cppc: Set policy->boost_supported
>   cpufreq: Restrict enabling boost on policies with no boost frequencies
>   cpufreq: apple: Set .set_boost directly
>   cpufreq: loongson: Set .set_boost directly
>   cpufreq: powernv: Set .set_boost directly
>   cpufreq: scmi: Set .set_boost directly
>   cpufreq: dt: Set .set_boost directly
>   cpufreq: qcom: Set .set_boost directly
>   cpufreq: staticize policy_has_boost_freq()
>   cpufreq: Remove cpufreq_enable_boost_support()
>
>  drivers/cpufreq/acpi-cpufreq.c      |  3 +++
>  drivers/cpufreq/amd-pstate.c        |  4 ++--
>  drivers/cpufreq/apple-soc-cpufreq.c | 10 +---------
>  drivers/cpufreq/cppc_cpufreq.c      |  9 +--------
>  drivers/cpufreq/cpufreq-dt.c        | 14 +-------------
>  drivers/cpufreq/cpufreq.c           | 30 ++++++++++++-----------------
>  drivers/cpufreq/freq_table.c        |  7 +++++--
>  drivers/cpufreq/loongson3_cpufreq.c | 10 +---------
>  drivers/cpufreq/powernv-cpufreq.c   |  5 +----
>  drivers/cpufreq/qcom-cpufreq-hw.c   |  7 +------
>  drivers/cpufreq/scmi-cpufreq.c      | 11 +----------
>  include/linux/cpufreq.h             | 20 ++++++-------------
>  12 files changed, 35 insertions(+), 95 deletions(-)
>
> --
> 2.31.1.272.g89b43f80a514
>

