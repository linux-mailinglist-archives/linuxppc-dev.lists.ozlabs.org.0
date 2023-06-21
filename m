Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F73738478
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 15:09:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IELwl0a2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmP3Q1KrGz3bsw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 23:09:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IELwl0a2;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmP2W1rXGz30K1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 23:08:35 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QmP2R0Rwzz4wj7;
	Wed, 21 Jun 2023 23:08:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1687352912;
	bh=zMmz8eNhn1LuA/bMCpwWPyDta4A4p5omDG9jWVnrIhA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IELwl0a2CcWKtHQYpyrr7sFEKemIZwDa+P3WaQzNRjWOBtKHns7YRnhc4zJ61CtTe
	 VtiNmWT/MSjxIcsMk0GFLElYIRQShuSOZETFrGgT4P/ghqCTLzPcLsUEq+LB9bTV+G
	 ezXrX5eHiHuzHhgKJjcPGV4IhZoXJpyYiZGALWIB3CtTTFesoWwLyio6BWgifN4m/A
	 Hc70Kn6muoGgmoZg4dh2jIQMqgSmiTjtGgniOT6wnQEbMbSiAeTGQxJDLRveCIyS/p
	 RshmiYJ+tckcsHareuzZsBA7Thn4UtJZrdFKcOpxw0gcOY9CUtwyNJDvio492P5yOT
	 3xClQ4DFwCJvg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton
 <akpm@linux-foundation.org>, Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 6/6] watchdog/hardlockup: Define
 HARDLOCKUP_DETECTOR_ARCH
In-Reply-To: <20230616150618.6073-7-pmladek@suse.com>
References: <20230616150618.6073-1-pmladek@suse.com>
 <20230616150618.6073-7-pmladek@suse.com>
Date: Wed, 21 Jun 2023 23:08:26 +1000
Message-ID: <871qi5otdh.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Petr Mladek <pmladek@suse.com>, kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Petr Mladek <pmladek@suse.com> writes:
> The HAVE_ prefix means that the code could be enabled. Add another
> variable for HAVE_HARDLOCKUP_DETECTOR_ARCH without this prefix.
> It will be set when it should be built. It will make it compatible
> with the other hardlockup detectors.
>
> The change allows to clean up dependencies of PPC_WATCHDOG
> and HAVE_HARDLOCKUP_DETECTOR_PERF definitions for powerpc.
>
> As a result HAVE_HARDLOCKUP_DETECTOR_PERF has the same dependencies
> on arm, x86, powerpc architectures.
>
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>  arch/powerpc/Kconfig | 5 ++---
>  include/linux/nmi.h  | 2 +-
>  lib/Kconfig.debug    | 9 +++++++++
>  3 files changed, 12 insertions(+), 4 deletions(-)

Something in this patch is breaking the powerpc g5_defconfig, I don't
immediately see what though.

../arch/powerpc/kernel/stacktrace.c: In function =E2=80=98handle_backtrace_=
ipi=E2=80=99:
../arch/powerpc/kernel/stacktrace.c:171:9: error: implicit declaration of f=
unction =E2=80=98nmi_cpu_backtrace=E2=80=99 [-Werror=3Dimplicit-function-de=
claration]
  171 |         nmi_cpu_backtrace(regs);
      |         ^~~~~~~~~~~~~~~~~
../arch/powerpc/kernel/stacktrace.c: In function =E2=80=98arch_trigger_cpum=
ask_backtrace=E2=80=99:
../arch/powerpc/kernel/stacktrace.c:226:9: error: implicit declaration of f=
unction =E2=80=98nmi_trigger_cpumask_backtrace=E2=80=99; did you mean =E2=
=80=98arch_trigger_cpumask_backtrace=E2=80=99? [-Werror=3Dimplicit-function=
-declaration]
  226 |         nmi_trigger_cpumask_backtrace(mask, exclude_self, raise_bac=
ktrace_ipi);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |         arch_trigger_cpumask_backtrace
cc1: all warnings being treated as errors


cheers
