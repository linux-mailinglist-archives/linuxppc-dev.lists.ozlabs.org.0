Return-Path: <linuxppc-dev+bounces-1448-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF2797C31C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 05:24:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8LV155YPz2yD8;
	Thu, 19 Sep 2024 13:24:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726716265;
	cv=none; b=OGYLnl8MS2MCWc/oztQg+R+gzFc1I01MiOmmw/V8MNZDuKFvQe+BP0HHLGeC0/yu7p+Zk42ajEexxDszsEqK9+bICDrenMVlaOvrRGsQo17Kf1m8+bIZMRXrc6l+gzNbjXybqs7ailyTZhgrBa4jTWXON7y7/OU+Vea2JQ4xy6BF4JE3+5L/tbC9nr4mk3YD59yFn/Ar8zdSpTSeio0egY0+lYc1YavvhQoMcgUy5+kDecq3QKv5duHQn6Hl8ZBGfx7b4qCh63i9lbMJvvdC4vycjg4I9NxdexEpLqwa8ExVDM2cDoLizv2sZDQk5XJ1/rtNrBFMC/cZS3G2aB80zw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726716265; c=relaxed/relaxed;
	bh=fZa83PjDF+loDF68mkxwlic+EMe/zFZXGtZzppvd0EI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DsA/mgXZO7ZP1SgLXqKO7Nq9dU/toudabijkzwtbcCkVsiNSZlOaf21xqLZVq7t3atdVHK4bGNDO4wwXO2GXZkpas2V4FdLnjp9ccxxPzB0zUlNZclUCIWYmO5WrAB2/iM9ViE9DY+aY+YZO4BiXL38K4cRTtAtwdWxHELD/tMdHDlhn2WlfMKxWuHWKTPTjS/FzAvkWGPJbnjpyd76Jk5ZSOjUsCVBwH6EwUtBsW58vRUdwxh61Hj9wt+HUjVYBaGEfbNLgv2DShZtghycrpx95Yab/KIZbILS6XiDz7RBlGu5+YcxIHBgXg81D96dx0c6get7dzylDTXXbLP8pFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kKrfwXQz; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kKrfwXQz;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8LV14qY0z2xs8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 13:24:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726716265;
	bh=fZa83PjDF+loDF68mkxwlic+EMe/zFZXGtZzppvd0EI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kKrfwXQzYOVoLALAu4QL5cpeNLZ3QlBIP45hb3cw/4FvpWKiSfhgBqI9/imj0M0Hf
	 FcOhPgV7nLSzZozANLb+DWAG9iM+k7ioTpcaQK+Z/3dTu81vHqFjyQU4yBDtvMFr2T
	 vgAmi/i58LOQYT3ZCnzPkz+6KQPEwUlJBThCDLC1UDMLdR9fJmJayb6xiZjOp+/kTc
	 uSEJYWpnekmA0Y1inNEkjpEqoQabVADoCxvH3tbI5jTye0aknSrsJMoWCWl3DRbPgw
	 Z/PqCvPn1RU8HxzF+hG9DBu3xMzrAMEhf9/Xa+ut3OyOw8urSdGB6Ave3V6vLKrRLe
	 aveMIY2NWz7Aw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X8LTz0kTlz4xWZ;
	Thu, 19 Sep 2024 13:24:22 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Dave Vasilevsky <dave@vasilevsky.ca>, glaubitz@physik.fu-berlin.de,
 bhe@redhat.com, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 ebiederm@xmission.com
Cc: Dave Vasilevsky <dave@vasilevsky.ca>, Reimar =?utf-8?Q?D=C3=B6ffinger?=
 <Reimar.Doeffinger@gmx.de>
Subject: Re: [PATCH v2] crash, powerpc: Default to CRASH_DUMP=n on
 PPC_BOOK3S_32
In-Reply-To: <20240917163720.1644584-1-dave@vasilevsky.ca>
References: <20240917163720.1644584-1-dave@vasilevsky.ca>
Date: Thu, 19 Sep 2024 13:24:22 +1000
Message-ID: <87ttecpbq1.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Dave Vasilevsky <dave@vasilevsky.ca> writes:
> Fixes boot failures on 6.9 on PPC_BOOK3S_32 machines using
> Open Firmware. On these machines, the kernel refuses to boot
> from non-zero PHYSICAL_START, which occurs when CRASH_DUMP is on.
>
> Since most PPC_BOOK3S_32 machines boot via Open Firmware, it should
> default to off for them. Users booting via some other mechanism
> can still turn it on explicitly.
>
> Does not change the default on any other architectures for the
> time being.
>
> Signed-off-by: Dave Vasilevsky <dave@vasilevsky.ca>
> Reported-by: Reimar D=C3=B6ffinger <Reimar.Doeffinger@gmx.de>
> Closes: https://lists.debian.org/debian-powerpc/2024/07/msg00001.html
> Fixes: 75bc255a7444 ("crash: clean up kdump related config items")
> ---
>  arch/arm/Kconfig       | 3 +++
>  arch/arm64/Kconfig     | 3 +++
>  arch/loongarch/Kconfig | 3 +++
>  arch/mips/Kconfig      | 3 +++
>  arch/powerpc/Kconfig   | 4 ++++
>  arch/riscv/Kconfig     | 3 +++
>  arch/s390/Kconfig      | 3 +++
>  arch/sh/Kconfig        | 3 +++
>  arch/x86/Kconfig       | 3 +++
>  kernel/Kconfig.kexec   | 2 +-
>  10 files changed, 29 insertions(+), 1 deletion(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

