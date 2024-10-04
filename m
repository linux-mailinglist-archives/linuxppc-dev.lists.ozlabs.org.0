Return-Path: <linuxppc-dev+bounces-1759-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA99499019C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2024 12:52:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XKlkS0FKbz2ypW;
	Fri,  4 Oct 2024 20:52:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728039167;
	cv=none; b=iJ58GJ3gwv8TyTZnL8fn8fPlkFKI9J/qYbZrRRNkJUvFXuLaYxHAqPcyV50TdEAGhMZ1sTd1OpYP/YyIQK0cXs/Cd8TZ+f82KB6APP+En5WuknbaTqvjJ3zA3emgLsXquOULNhdubbBHVl8Fm1Z4wihrDYoGL+kd5Qqv1sTxSLMan1uBnE/lNKHlA5cCuSG2/U2sJTI6AvQXl182tqDoP9uh3ASP7F1P0P4qOYGF66ln6Rn548OtTNiqmcliW1l4UQj1PfUACNp/+pWLJKpd0zqEaW2U2OBc2QsYfp9C/tIAHf2dNyLAtfBmsejRCzllqFcr2KTD7oEAOHiPH2FqHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728039167; c=relaxed/relaxed;
	bh=Xf20ckW3L//pyjfHS85q5T2s7VAw5Rlb01ssQESduZo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=cRXGd1eSfaqApBGeWAxFV6wru98T24tLkNGaIKeIpSJhf76U+JvsjEXZtxwWoXPaLekxXOQIJs0m4qfDF9JeNfUShPPjBKfu2dsdkAW2Q0Z39uL4P5fi+ud6AgSC/eGTPhWm7OoF9YBCEmL7sa/uCP8U2QwGKQNNoApTJpmjYT/h27tIZFJYmYkiFRdnOIF4id8QI0KaZLLjtKC4XSLYRctFPw3aIGdWWJ1LWjqetc4KD6V33yeo0yz3QA/EcbHhLSVdTjb4MYDMgj/iRvtIaZb2R8m6fWcuiLOqmv9EH3rIWYkRK2V5zVjGciTEgXjkK6yWcLM938cptlKIatG/aA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QC3TjD+f; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QC3TjD+f;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XKlkP2f6xz3bbH
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2024 20:52:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1728039164;
	bh=Xf20ckW3L//pyjfHS85q5T2s7VAw5Rlb01ssQESduZo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=QC3TjD+f9O6zr60Zj10G3ShVWkAWLJdr/2ZVjhoTin78RkDOc8+9o7hPYBJXKrobv
	 HMpfguaKPC6GxS/iBntGcCLnLzubBmU4rICqVU4l+ltG75hzK3JBqo3mH8U7SCRa8h
	 jLwPesVHMaJXczNYHlA1KX8B1rRpmDqbNTs+DkJtpOgHREftBYq+ulPVh+5TNMr4t0
	 koOaSo1hCCPFjKL1xxrzvFtZxll5HPnY9KcZxfsuYNz+SbBVdgpabp+yiG+LQ84vXF
	 dbSMjFXhqXDow6v8j3RlnbHctV7tIwZde3DpEm+NZJZHYqMaSKOLLnMfQ7rwZqVTcX
	 gkjcTFz63QKbw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XKlkN1H4dz4x7D;
	Fri,  4 Oct 2024 20:52:43 +1000 (AEST)
Date: Fri, 04 Oct 2024 20:52:40 +1000
From: Michael Ellerman <michael@ellerman.id.au>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, mpe@ellerman.id.au
CC: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/2] powerpc/vdso: Implement __arch_get_vdso_rng_data()
User-Agent: K-9 Mail for Android
In-Reply-To: <Zv7HcuhVH1uM9BNI@zx2c4.com>
References: <0557d3ec898c1d0ea2fc59fa8757618e524c5d94.1727858295.git.christophe.leroy@csgroup.eu> <a1a9bd0df508f1b5c04684b7366940577dfc6262.1727858295.git.christophe.leroy@csgroup.eu> <Zv7HcuhVH1uM9BNI@zx2c4.com>
Message-ID: <EF78F2DB-7219-407B-9017-990462128B13@ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On October 4, 2024 2:33:54 AM GMT+10:00, "Jason A=2E Donenfeld" <Jason@zx2=
c4=2Ecom> wrote:
>Hey Christophe, Michael,
>
>This series actually looks pretty okay to me=2E I realize ThomasW is
>working on more generic cleanups that might obliterate the need for
>this, and that may or may not wind up in 6=2E13=2E But, I was thinking, t=
his
>seems like a good correct thing to do, and to do it now for 6=2E12, maybe
>as a fix through the powerpc tree=2E Then ThomasW can base his work atop
>this, which might wind up including the nice lr optimizations you've
>made=2E And then also if ThomasW's work doesn't land or gets reverted or
>whatever, at least we'll have this in tree for 6=2E12=2E
>
>Michael - what do you think of that? Worth taking these two patches into
>your fixes?

I agree the series looks good=2E But they're not fixes by my reading, so I=
'd be inclined to put them in next for v6=2E13?

cheers
--=20
Sent from my Android phone with K-9 Mail=2E Please excuse my brevity=2E

