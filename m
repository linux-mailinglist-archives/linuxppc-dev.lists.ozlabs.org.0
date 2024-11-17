Return-Path: <linuxppc-dev+bounces-3377-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7E99D03A4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:27:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xrqj959vgz3bmH;
	Sun, 17 Nov 2024 23:25:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846333;
	cv=none; b=CPiJikol4PrS7yLYIjaTZ2ETlndBXUMiJgRRM1BEmD4UkdLk8O/NZgl43jsKc19q95amw/OkHkl8J4t0TpUbuG08tZyNrVjkb8binMjuClvtoV2mmTVtF66fihqaR3xzOcxydP1TOP/e9d8cqZcqK+MdvovxFMz7g0VaWf4o989rqoQBCKpoeU9tO2Enxmg6m1p4sDbylj/yq3lZabdMMH7a+DFgxgrmJXS3bSDQjJgpwcpug5IJrEIdwmJDykr5ogGem9JjqJxNp6qhCGAh+vJ/DkPrCe6GWJHLHX8O1/j8M1p0rrVQZohYJHLWM8AKxbAk0QzAWmDPi/8AaVAQGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846333; c=relaxed/relaxed;
	bh=aXyR/Ch+acH1z3w4Y7Uh5VcfZXGef7QI5DXt6mlTtSY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=izsvZOmxWd8ZRYcJPMay3OOy89ZAZfJMdhO6kR21eL44KLQkQrbIuQWZ24MXkg+xIJ1FXeeZpmqM+p09SjF8BdWhbf99A3RkuXU+0939b9WXmDTilgxkuOwkizU+qWmKNzev4jjjfvqAGiMuN3JM9yx3ni6tuSOpZXFHD5K1os9Nk9KTBvA4uQga7Tpb/tajkwEdr0hloVvLcPvpSw62bnkgIihEc5+qrqbiIxEX2JPk3fim+ASpbTIXafGqp42wYkLscpJ6oOWgu7ehYzuWNSKOK18tkK8L1vRa91Nc+clV3BcSlfk3+fcc2l+n1G9/DFP5fzkQvVt9MAxF5KSAVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Gqw0Ma7m; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Gqw0Ma7m;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xrqj86tRgz3blR
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846330;
	bh=aXyR/Ch+acH1z3w4Y7Uh5VcfZXGef7QI5DXt6mlTtSY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Gqw0Ma7mCHDIbZ5n+Gzn/n6c5x8qpn5E4FLC97VnksgzCq77cNS4pHniYf/5Dhwc8
	 AyizIgbplsPHV7qyUeqrmeNybZ+eInOmOAFnx7SL2i+ykPARM1xAsiKRwfwWnPwT2/
	 rVR5ztrvmmgV/l8KA/PSrTm4zU6qmrtpZM14bQIL3ywNn19lkrmf2t16rMqNWG5qHe
	 Ic0yx9Nz+Dvx9Du/uwol28NZhfvK9tbebif51iJtvn80iZChLVl5R5sGx7m2PAPvd8
	 b5/RXTgcMqUe6TytQ8Ml7Fs065g4j/vgbc/XkCvUwkSDDUoOoxP1PRrIMWf8VXIeqE
	 3c0TPwuX3IDaw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xrqj56vLQz4xdT;
	Sun, 17 Nov 2024 23:25:29 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Cc: naveen@kernel.org, hbathini@linux.ibm.com
In-Reply-To: <20241107111630.31068-1-mpe@ellerman.id.au>
References: <20241107111630.31068-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/ftrace: Fix ftrace bug with KASAN=y
Message-Id: <173184539746.890800.15351753362406379111.b4-ty@ellerman.id.au>
Date: Sun, 17 Nov 2024 23:09:57 +1100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 07 Nov 2024 22:16:30 +1100, Michael Ellerman wrote:
> Booting a KASAN=y kernel with the recently added ftrace out-of-line
> support causes a warning at boot:
> 
>   ------------[ cut here ]------------
>   Stub index overflow (1729 > 1728)
>   WARNING: CPU: 0 PID: 0 at arch/powerpc/kernel/trace/ftrace.c:209 ftrace_init_nop+0x408/0x444
>   ...
>   NIP ftrace_init_nop+0x408/0x444
>   LR  ftrace_init_nop+0x404/0x444
>   Call Trace:
>     ftrace_init_nop+0x404/0x444 (unreliable)
>     ftrace_process_locs+0x544/0x8a0
>     ftrace_init+0xb4/0x22c
>     start_kernel+0x1dc/0x4d4
>     start_here_common+0x1c/0x20
>   ...
>   ftrace failed to modify
>   [<c0000000030beddc>] _sub_I_65535_1+0x8/0x3c
>    actual:   00:00:00:60
>   Initializing ftrace call sites
>   ftrace record flags: 0
>    (0)
>    expected tramp: c00000000008b418
>   ------------[ cut here ]------------
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/ftrace: Fix ftrace bug with KASAN=y
      https://git.kernel.org/powerpc/c/cfec8463d9a19ec043845525fe5fd675e59a8aab

cheers

