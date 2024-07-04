Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE1E9275A9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 14:03:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iNCv11qt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WFFdz0lj9z3fVK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 22:03:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iNCv11qt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WFFdD6lQPz3cDd
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 22:02:24 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6BA0FCE343B
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 12:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28391C4AF15
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 12:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720094540;
	bh=Sy6IDYHgPf8XKe3WtHb2MUaaZ8EMExF1AN4pG9iz1S8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iNCv11qt9ePmqAuMW8uUfuzNzF6tsSDb6lAXurGr9AJmo8z8m90621twv6pX8WwUH
	 Ve+1dTdxgRe79dgI2nUWm+esEeb+bXoNgN7s2je7hDrTuMuwhQZ3N+CzuLTcJGoz9J
	 Rnws+IMhP7Sb0PXo/W1nwmwqr6k9L5mb0frp0FfYRfie2uuB1zmITD6g2wMk4gE46e
	 L7W3Y8faWoENSgK3lRPBS+GJNE7NpnJ017UioXGVkgjebrpXm+h92NGOWAAWDIystH
	 Du7G8n0R+6mgfoM6vpHVeWjCzgzrDNr6bZwR+2uH6eHNoPt/RcNi53Yr6dOgHRKD2l
	 DdKIJOC2JLS7w==
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5c22bc0ca4cso12878eaf.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Jul 2024 05:02:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUg6PP0iKx1yZi0Jyf6miEpArW6Y/M6vScu30T8VZ4A/gYaBa4yXsFxNepq+sUG4khi7bBQqwmEW+kzCyCAcehlVb6+5IxsRMJv4TQwSQ==
X-Gm-Message-State: AOJu0Yy2HMJsYUY9rqV1PRv7YOWtEOOoZW6EiblOSmL0a5lBWUAhvcPV
	QIpmbLrcflsZzHkDhOy3yzyW8zJfhg6vcp6ktJ+6dgrS2vv8qjEJPDTYrdtV97sGtybrAoIIH0X
	kuRGREwb92FiN8Gu7A3QJiiU8jXY=
X-Google-Smtp-Source: AGHT+IEfXE0YhC0CadkHrUUKROvpyKyoONSuJxCmj7JBStJTkzTzhM7c6J8p1w9Caa82QdMwYxDdg2XwqcNfaJBeOS0=
X-Received: by 2002:a05:6820:2c07:b0:5c4:5cbf:a255 with SMTP id
 006d021491bc7-5c646a9379emr1242627eaf.0.1720094539244; Thu, 04 Jul 2024
 05:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1720075640.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1720075640.git.viresh.kumar@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 4 Jul 2024 14:02:07 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hvA3WvhXgKB0qAL_vXy1sJxeRJid=yfTcgePYGqX8uyg@mail.gmail.com>
Message-ID: <CAJZ5v0hvA3WvhXgKB0qAL_vXy1sJxeRJid=yfTcgePYGqX8uyg@mail.gmail.com>
Subject: Re: [PATCH 0/4] cpufreq: Make cpufreq_driver->exit() return void
To: Viresh Kumar <viresh.kumar@linaro.org>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, Perry Yuan <perry.yuan@amd.com>, Huang Rui <ray.huang@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Vincent Guittot <vincent.guittot@linaro.org>, Kevin Hilman <khilman@kernel.org>, linux-pm@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Jonathan Hunter <jonathanh@nvidia.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-arm-kernel@lists.infradead.org, Lizhe <sensor1010@163.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Len Brown <lenb@kernel.org>, Sven Peter <sven@svenpeter.dev>, linux-arm-msm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-mediatek@lists.infradead.org, Markus Mayer <mmayer@broadcom.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-omap@vger.kernel.org, Cristian Marussi <cristian.marussi@arm.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, asahi@lists.linux.dev, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Sudeep Holla <sudeep.holla@arm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 4, 2024 at 8:54=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.or=
g> wrote:
>
> Make exit() return void, since it isn't used by the core.
>
> Based on initial patches sent by Lizhe [1].
>
> Rafael, I will take this through my tree for 6.11.

Sure.

Acked-by: Rafael J. Wysocki <rafael@kernel.org>

for the series.

Thanks!

> --
> Viresh
>
> [1] https://lore.kernel.org/all/20240410132132.3526-1-sensor1010@163.com/
>
> Lizhe (1):
>   cpufreq: Make cpufreq_driver->exit() return void
>
> Viresh Kumar (3):
>   cpufreq: nforce2: Remove empty exit() callback
>   cpufreq: loongson2: Remove empty exit() callback
>   cpufreq: pcc: Remove empty exit() callback
>
>  drivers/cpufreq/acpi-cpufreq.c         |  4 +---
>  drivers/cpufreq/amd-pstate.c           |  7 ++-----
>  drivers/cpufreq/apple-soc-cpufreq.c    |  4 +---
>  drivers/cpufreq/bmips-cpufreq.c        |  4 +---
>  drivers/cpufreq/cppc_cpufreq.c         |  3 +--
>  drivers/cpufreq/cpufreq-dt.c           |  3 +--
>  drivers/cpufreq/cpufreq-nforce2.c      |  6 ------
>  drivers/cpufreq/e_powersaver.c         |  3 +--
>  drivers/cpufreq/intel_pstate.c         |  8 +++-----
>  drivers/cpufreq/loongson2_cpufreq.c    |  6 ------
>  drivers/cpufreq/mediatek-cpufreq-hw.c  |  4 +---
>  drivers/cpufreq/mediatek-cpufreq.c     |  4 +---
>  drivers/cpufreq/omap-cpufreq.c         |  3 +--
>  drivers/cpufreq/pasemi-cpufreq.c       |  6 ++----
>  drivers/cpufreq/pcc-cpufreq.c          |  6 ------
>  drivers/cpufreq/powernow-k6.c          |  5 ++---
>  drivers/cpufreq/powernow-k7.c          |  3 +--
>  drivers/cpufreq/powernow-k8.c          |  6 ++----
>  drivers/cpufreq/powernv-cpufreq.c      |  4 +---
>  drivers/cpufreq/ppc_cbe_cpufreq.c      |  3 +--
>  drivers/cpufreq/qcom-cpufreq-hw.c      |  4 +---
>  drivers/cpufreq/qoriq-cpufreq.c        |  4 +---
>  drivers/cpufreq/scmi-cpufreq.c         |  4 +---
>  drivers/cpufreq/scpi-cpufreq.c         |  4 +---
>  drivers/cpufreq/sh-cpufreq.c           |  4 +---
>  drivers/cpufreq/sparc-us2e-cpufreq.c   |  3 +--
>  drivers/cpufreq/sparc-us3-cpufreq.c    |  3 +--
>  drivers/cpufreq/speedstep-centrino.c   | 10 +++-------
>  drivers/cpufreq/tegra194-cpufreq.c     |  4 +---
>  drivers/cpufreq/vexpress-spc-cpufreq.c |  5 ++---
>  include/linux/cpufreq.h                |  2 +-
>  31 files changed, 37 insertions(+), 102 deletions(-)
>
> --
> 2.31.1.272.g89b43f80a514
>
>
