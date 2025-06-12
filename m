Return-Path: <linuxppc-dev+bounces-9327-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D4DAD79E8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jun 2025 20:47:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJBMs0XR7z307q;
	Fri, 13 Jun 2025 04:47:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749754025;
	cv=none; b=OzTn6N+/oIP64kCVcDihPrAasCYgXh86yWETIun6HdPeyIXY2ZjNfaM4u/qA/9R45wKSSUcNL4ylynjdm2HQK+DDQ4uCK+OkW9qket8vmqmgqr5n0MYsbgKRDmIPDuKGo1qo9sqK7yrpl8cbcNI9lg8F+y5c7vYvC8lKlYQe6Iu4Tj4jwTGMQ+OInzcQDaktlmZCy1WBDWFS1XItpM3/SPTti+/IrbbklFAgjw5Ah8QDkBX1vUYibEzGxusrXNNOC7Cy6s/KBrpG/k4Wocz0dU0dL6Z4PTPklZl6GPZCgpkaR3m4y6cVPA1QwMYAmIZ6KxVxHkVILIH0ZcH9M5k74g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749754025; c=relaxed/relaxed;
	bh=1OxhVnQiLqiYvvmVPPEaITQLfhVZNq54bZjTBwFiPVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hPpvclG3UpJiBTiaKFzk7hQSnheeVcY72y1pWoSSN/bOENXb/0j1jdd0iFTmqlXrz2exr+bidCEZRjyhzkPOu1o6syC0obCUAztpSPgdQMPrQT2ixBp23zu+Cg+PqPfmInRFc9LKIBMMc/pwkSHVHe9OpvCTZOjriohAffTk0bZbzNqzDO1VyvsooKG8o34UqLD0VG2lmVpct34mPlFNzZm27vYxUJfh69vkCz4MJggsRzC0qikv7hiGbmaHQvh4bTUraKM19MwrFM8sJpsZOaPo57OoSfFfRiiP5Epwqnr6pCbImNspEGvC+xwTzHTGC9RmHIImDN06i7ra1OMcJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OjiiOam3; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OjiiOam3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJBMq57C3z2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 04:47:03 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 583C8629D2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jun 2025 18:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED403C4CEF3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jun 2025 18:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749754021;
	bh=rae+Xy+GVeClcCuswO7WbVtIsL71ZmU4FtcEUBegmnw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OjiiOam3P0ES7NiE+EZJjuXt7LqkCLNruQnPCNpX06jpVlpRfuT+ibrxnDfCr0Qgc
	 aVmenVGPayEVh2vBYKeO9OxkFdANxN+sF9dpZl1f50vhu/3TPnrU6fxMxryjugHJ0F
	 OKC1MjSo8BZ23PZF3xzP0Pw8eXOEpdfMIwAETx+6iXATUZ93/ovbHZklNkYigseKK1
	 JRcZtE7lzdX62ZT87N0AZ+XGacFN00z4cIWuGiWW2U8AK/gPVPESeseWd5DA9iYXhT
	 6WAamqnLjbDyz5qKvoz8e790Q2osebh0BfhNUmWJDrQD/hrQJK+PMqsG/tGOBfkszj
	 Rjk7GyUDVfOlA==
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-60f22023eddso871369eaf.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jun 2025 11:47:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGGU1wRRjKGglQtejAVzKIzMdhsi0n+fKdB+tTtLv4irYRu3yaueCeB8Qg/JPrH7pmZ8Hoj2HzNhV+rv4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyabaN/7fx/4PWzd5soUeH9qJwAKAh7hV1p/wll2A4IAD0nsr1T
	SbuCuy9Rn4K4apU9Qps+xevW2NCHkszQfIkDC8gREIkPsOcu+JnRu1p71cXW/vaCCHvkIYPGUu+
	79UI6xkFFffZKl3AmwMPGswZkhjvdKcA=
X-Google-Smtp-Source: AGHT+IGVBH3lWI6ocKqXpduli60MAl5yPrTXUSBJUCNvpZ8YMVLXnRTpp4jSJe5p38bu5Vi5w5+ShdNClwr7F6Qn4V8=
X-Received: by 2002:a05:6820:1a09:b0:60f:3be9:187a with SMTP id
 006d021491bc7-61107aa1b27mr172114eaf.8.1749754020209; Thu, 12 Jun 2025
 11:47:00 -0700 (PDT)
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
References: <20250612145310.563358597@goodmis.org>
In-Reply-To: <20250612145310.563358597@goodmis.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 12 Jun 2025 20:46:48 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iTrDBV7wG0gzpg3hzjBFWUdohquyVGta93uOhyoWpiLw@mail.gmail.com>
X-Gm-Features: AX0GCFtmIZhBJxZjxq0ItKlhq1D_VGfvqSHyPe_kp82oXVvS-MbMbDdYCDMbVmA
Message-ID: <CAJZ5v0iTrDBV7wG0gzpg3hzjBFWUdohquyVGta93uOhyoWpiLw@mail.gmail.com>
Subject: Re: [PATCH 0/4] PM: tracing: Don't compile in unused trace events
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jun 12, 2025 at 4:52=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
>
> I have code that makes unsued events trigger a warning. I'm currently cle=
aning
> up the kernel to remove the majority of events that are defined but not u=
sed.
> When an event is defined, it can take up to 5K of text and meta data per
> event. An event should not be created if it is not being used.
>
> The powernv_throttle event is only used by the powernv code so I moved it=
 to
> its own header file and it gets created when the powernv code is compiled=
 in.
>
> For the other power events, I just added #ifdef around them with the conf=
igs
> that enable them.
>
> Steven Rostedt (4):
>       PM: cpufreq: powernv/tracing: Move powernv_throttle trace event
>       PM: tracing: Hide psci_domain_idle events under ARM_PSCI_CPUIDLE
>       PM: tracing: Hide device_pm_callback events under PM_SLEEP
>       PM: tracing: Hide power_domain_target event under ARCH_OMAP2PLUS
>
> ----
>  drivers/cpufreq/Makefile          |  1 +
>  drivers/cpufreq/powernv-cpufreq.c |  4 +++-
>  drivers/cpufreq/powernv-trace.h   | 44 +++++++++++++++++++++++++++++++++=
++++++
>  include/trace/events/power.h      | 28 ++++++-------------------
>  kernel/trace/power-traces.c       |  1 -
>  5 files changed, 54 insertions(+), 24 deletions(-)
>  create mode 100644 drivers/cpufreq/powernv-trace.h

For the series:

Acked-by: Rafael J. Wysocki <rafael@kernel.org>

Thanks!

