Return-Path: <linuxppc-dev+bounces-1123-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C8B96F42E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 14:23:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0b3d67P8z30D3;
	Fri,  6 Sep 2024 22:23:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725625389;
	cv=none; b=ltXOUpznnuzgYVf7HQJdlV3UVXkf1Jq8oC49KlFtNLcT3g/k2vtls53kG9lxhjg2NwioU6rLL2A8luvdxmoaj0scLIjX5BvG18FXRm4QlHXzq+/PB/y4cC8oR5Rk1GpGtW7UbfvvuHh3Py3k2yr4W5UBLb55PZ4W7DnL8gPDhs5TspMNY1al6aP1k4AxNx0G0g8AShohPiRuZJ3dYFEokrzgmXIYwQScB++xKY+FXu1obQEQl7UB55EJ/QHOVLZP+AUHXdHTl0/DFEMMa01/NCkqxjWZu/SYgve14oSTnW32elWYyYazKV9cPDAtsk5s9rYe4Wiw7J1/n5cy6c2q6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725625389; c=relaxed/relaxed;
	bh=Z4xBDj54/zEsffPCiXYIbhd/s4U8lTqDOAsUvroIj1I=;
	h=DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type; b=IUlmOVc6LFLm4P72HrWd1Y4kMohK8xVr+YjuWk0KP/dOusOu5MUFOrXWoKagXGpzvfd0t7e/xLJWEhteA+6lNYCYjXIVwF1fVfEKREDYA4I9QmSfazf5yiZPaZpWwerfkcJfdaMuklgK/79FwrpFCOi1vb7hC+Hl9YHAUyu6RCrq/jbR+l7ZZRWvwpv/Z2VpXAqHfhkkk2aKioDCkXiiOPD5uJPVmXDftKWuN0mIyPLRW2PNnm8UokSdxp2/WDuA9WaB/69dP/JRs+pAjsoMbyNrzNa0ywgZEvBoaYvMrnDdkuw9XEy9K9ofvtcvKQVbY99Pp+Oh/K9mr9zQK3hdTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Sb+7s+S2; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Sb+7s+S2;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0b3d4Zvdz2yhM
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 22:23:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725625389;
	bh=Z4xBDj54/zEsffPCiXYIbhd/s4U8lTqDOAsUvroIj1I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Sb+7s+S2GugNKnapA55T+at8h3IT/oUHP2tS/vyrOkAoIck5w3tiBzsvL1CAVt1Cu
	 GBIVwQCeRess/ZRAB4OdrtAESROxkdyiy+GnePKxyQTlaAUvU10aBdYE/fem2G2Kh/
	 l96I2XtTYTN7jQIyOoXqSz46zlmFy6+DiZj8QeWvyRIb1ywh+8f2QK7FNzXitW/vcx
	 OnLb1oMsdkeuoUTBoC6eD0WFhk4o1VlhrxgndSqa3y/ABLpt4L+6UqoQqVYl3CUOaS
	 1oEudgOTPqBCpZRIWqAxT14g4BNXcDOLDMgftP0SCPkmElj1R3goQpiu27Rmhv5J+C
	 vVola/aR3IyPA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0b3c5RBDz4wyh;
	Fri,  6 Sep 2024 22:23:08 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "Jason A . Donenfeld"
 <Jason@zx2c4.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Nicholas
 Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>, Andrei Vagin <avagin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/vdso: Fix VDSO data access when running in
 a non-root time namespace
In-Reply-To: <700dbf296d02e32376329774be35cfbead08041d.1725611321.git.christophe.leroy@csgroup.eu>
References: <700dbf296d02e32376329774be35cfbead08041d.1725611321.git.christophe.leroy@csgroup.eu>
Date: Fri, 06 Sep 2024 22:23:08 +1000
Message-ID: <87r09x3r9v.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> When running in a non-root time namespace, the global VDSO data page
> is replaced by a dedicated namespace data page and the global data
> page is mapped next to it. Detailed explanations can be found at
> commit 660fd04f9317 ("lib/vdso: Prepare for time namespace support").
>
> When it happens, __kernel_get_syscall_map and __kernel_get_tbfreq
> and __kernel_sync_dicache don't work anymore because they read 0
> instead of the data they need.
>
> To address that, clock_mode has to be read. When it is set to
> VDSO_CLOCKMODE_TIMENS, it means it is a dedicated namespace data page
> and the global data is located on the following page.
>
> Add a macro called get_realdatapage which reads clock_mode and add
> PAGE_SIZE to the pointer provided by get_datapage macro when
> clock_mode is equal to VDSO_CLOCKMODE_TIMENS. Use this new macro
> instead of get_datapage macro except for time functions as they handle
> it internally.
>
> Fixes: 74205b3fc2ef ("powerpc/vdso: Add support for time namespaces")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
 
Oops.

I guess it should also have:

  Cc: stable@vger.kernel.org # v5.13+
  Reported-by: Jason A. Donenfeld <Jason@zx2c4.com>
  Closes: https://lore.kernel.org/all/ZtnYqZI-nrsNslwy@zx2c4.com/

Jason how do you want to handle this?

I can put patch 1 in a topic branch that we both merge? Then you can
apply patch 2 on top of that merge in your tree.

Or we could both apply patch 1 to our trees, it might lead to a conflict
but it wouldn't be anything drastic.

cheers

