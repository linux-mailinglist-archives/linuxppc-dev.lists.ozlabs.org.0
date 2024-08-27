Return-Path: <linuxppc-dev+bounces-571-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CEB9601E3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 08:37:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtHsY4XZBz2yRF;
	Tue, 27 Aug 2024 16:37:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724740657;
	cv=none; b=AddEPkwv2x5IyeyoeE6vRLx/ND9lPmAR8e1YGJEAoAGqvTpWMU/cYLLu83mYZBKfmjsGLOpPv0CoPQXQhgl3rXEk2gdmAVMjoE+2sTyv/3vlcDzLKtMyvENb2fheFCrG9uzXCw837XhQ5tWJ/5GKttJFWtYr4BxW9X/+k7zHJE0jcENehbUyDouGp8s63DJhgdkgbGqFbkYsVMatan6H8l/7kvZg7PN/J1kD4FkqawsqIzQB0J8Da9om5iMhm9eImGkOEFY3XSCteXI3VXriFZG7qh7b2PAEwB2h1akMDa7yC+OFNfJjEqxYWCGCE3uos3tqdkTW2Ba7An/cRu8cXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724740657; c=relaxed/relaxed;
	bh=7hvoZKt8KDniC16/zwNml85JaHiw3Nuh33M3Lqd0yuY=;
	h=DKIM-Signature:Received:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Original-Sender:X-Originating-IP:
	 X-ZEDAT-Hint; b=PApnp7z59H3qVgbe8OAXV8rtbYdtTIFyHsNECiboX6Ix1bEZ2+ajaGhl+wmHqYU22JrX6O4LVgawdyH9Q/wJyxsHp5l5gUaPqb07/9SvNM27VdFjoZdiflwVr8bPPXTvwiu8126l8shno4Qio2VpjbkGtc+eCaZKEQOffxtSYMUo8VF4m7dU7aR7SKtbQ5IjTQ08VXFeMv0d4ybcgy+ybYaddfOjqc+U2ttPnaeZOiIWsByFxUTP7tEomozzfeGzwui+x2+VgbVA6HaPWUFq47JvLRRBh54VF/VIlwNSu1Fmtwv4BAkFo6HDGwRCxOr9EXayoWqGDnHp6CeChxTUZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=ENdtWsVx; dkim-atps=neutral; spf=pass (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org) smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=ENdtWsVx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtHsV4QZkz2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 16:37:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7hvoZKt8KDniC16/zwNml85JaHiw3Nuh33M3Lqd0yuY=; t=1724740654; x=1725345454; 
	b=ENdtWsVxikXYjPjfrBJ9B89b2ac/75LV64llRUHZC3tml/6Z4NK/+EJbDzie2PvF11tIoCsQl+G
	Atwn/0LQ2Kj6W+5sp+0URCazldGJ4ds9FGaNNBFhVNqPHYu0oJ8MkszzlmX93r0w5aTlg0wmFKV7Y
	WPWV+aePXCZa7d+i/y5dNyJ4AUoo2fRM26nmcMFS2/nTfqqvU233UZzPd8QJJOyM4Xm1yz27w+kJm
	BNuCNnAcLIQwCIQEADr6FEPwimR2CPmvhoS+5y6pwIXzjWJ68f0K+nVxnMK8afLwaHoHr2d6sYClk
	lM62fDv+le0OiAOifH+Q8fk18PG3Xhx7/HMA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1sippT-00000001UP4-2QI3; Tue, 27 Aug 2024 08:37:23 +0200
Received: from p5b13a2bf.dip0.t-ipconnect.de ([91.19.162.191] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1sippT-00000003ckf-1VoH; Tue, 27 Aug 2024 08:37:23 +0200
Message-ID: <f355e26eead641f5f281372aadf9dee7de19a4c7.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] crash: Default to CRASH_DUMP=n when support for it is
 unlikely
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Baoquan He <bhe@redhat.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Dave Vasilevsky
 <dave@vasilevsky.ca>, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org,  mpe@ellerman.id.au, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org,  Reimar =?ISO-8859-1?Q?D=F6ffinger?=
 <Reimar.Doeffinger@gmx.de>
Date: Tue, 27 Aug 2024 08:37:22 +0200
In-Reply-To: <Zs1wpHxfTcwKr517@MiWiFi-R3L-srv>
References: <20240823125156.104775-1-dave@vasilevsky.ca>
	 <CAMuHMdVYNhFJ+qBDP3_fi9oeHsgOL0vqPe1YqE18+M8n1onssw@mail.gmail.com>
	 <09c29a3c4879d4ce5d8b97fd60d8ba5e38bed979.camel@physik.fu-berlin.de>
	 <Zs1wpHxfTcwKr517@MiWiFi-R3L-srv>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.162.191
X-ZEDAT-Hint: PO

On Tue, 2024-08-27 at 14:22 +0800, Baoquan He wrote:
> About why it's enabled by default, as Michael has explained in another
> thread, distros usualy needs to enable it by default because vmcore
> dumping is a very important feature on servers, even guest instances.=20
> Even though kdump codes are enabled to built in, not providing
> crashkernel=3D value won't make vmcore dumping take effect, it won't cost
> system resources in that case.

OK, thanks for the explanation. But as we have found out in the mean time,
the assumption was wrong to enable it by default for all architectures as
some architectures cannot boot a crash dump kernel with their default bootl=
oader
but only through kexec.

Can we have a follow-up patch to disable crash dump kernels where they're
not needed? I mean, not every platform supported by Linux is obviously a
x86-based or POWER-based server.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

