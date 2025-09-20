Return-Path: <linuxppc-dev+bounces-12481-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BDAB8C8D6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 15:25:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTVVZ3zxFz2yyx;
	Sat, 20 Sep 2025 23:25:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758374726;
	cv=none; b=mWdW+1R+qxx5wZW13Gi5cAEe8jnyY7rRxPQ8mFQk2Yl0D5sHsxVuhu72UkN4wEke/L7/5HZGFeIP4z/qrt7VpbZE5YM6hvyfWGlkjscUajWV/AC+W7QeCEHxKtiBGy4FyKozD0RC1G6PAx7p0rnE9pA7HSOSimwcJwbams8/o6ibpmLVbh219gbkvoMNLmyOf7phf98KPy090u+nvsxvxA6HSacklkENCdRM3faEUEV6UEBHVgNTd+C/G8R21wdWT7Kuk+dxfXhX4ZQetyhjpSDWEGzkA0HMFOBtu3GdNjM4SrVjILZOCUHdmVH04hBRh0kTkZrmn6aG+b6RVtqeOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758374726; c=relaxed/relaxed;
	bh=e2U0S+R40JA/8Y/UUs6naRgYG7DrA2GyrAQ3SGnFjZ4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oXRE8/GWuFz3+zuP6DwBO0d10O982nAQP8oijSvu4pfqhXCDlNrZk+Nc5b8cryV95zHhC8uRFs/JZRRl84bA8mFAq2Eu+RyQDIEOOEEo6VvqctOeTgQ/YPRqaawX6WIjDO16xwUni8rxYt0G4pyxpBs9D084FqO0Jgcf1TawnxTwFlB1e3c5KOphNeYjBw6iKPXHPK/9rW/t5oJD4nOXsfXcv0JgFxw+Vt2eE37DJK6ar5rCxx+0Pe6QqHTiNkepEyRFJ9p4zBoTpeKvlBiWuzLKBomVMu/zDDPs8ewhxJ2RdF2xmb+RlZzTrtg5ysSk1QDRYWaRfJqTo3D+yM/H2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=bz7rOVoY; dkim-atps=neutral; spf=pass (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org) smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=bz7rOVoY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTVVW2DPwz2xgX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 23:25:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=e2U0S+R40JA/8Y/UUs6naRgYG7DrA2GyrAQ3SGnFjZ4=; t=1758374723;
	x=1758979523; b=bz7rOVoYViksOZws1ASZnUQpveX2szhMtiEKlr7Pvite/3WuAOYAzYQS2ZvF7
	NoX7YoCFxFDZRvGAD57zGFZVVw2wAEcOu0/zrtJdd8n4DOKrJyiTPd7p6TDPk9sBRRW3S4+JwhsaT
	7PumH8hLgXlQPjPO2uoTkJ4AB+t5l30bEidCgcqu2ZiGlSui7KWkGEra4KTxG7+BD+h0HzWdNGb7H
	KM5eNGwpN/CMM+D0vGtrnffNAdx3GrMTzKlZIxKKbRVOePXVVA8EeCE+Q6RT2WHVyZ3cka/5V+Dp+
	vTh8pS/XQS9pLL3ssiKH+Wb3jRB/UMR4cTZmcueoistmZZzAhw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uzxa9-00000002Tuo-1mKc; Sat, 20 Sep 2025 15:24:53 +0200
Received: from dynamic-077-011-103-224.77.11.pool.telefonica.de ([77.11.103.224] helo=[192.168.178.50])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uzxa9-00000000uE8-0N7C; Sat, 20 Sep 2025 15:24:53 +0200
Message-ID: <9a122c6cf3e2e0e61a62b0512eb97804acebeee9.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v3 00/36] sparc64: vdso: Switch to the generic vDSO
 library
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, 
 Andy Lutomirski	 <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino	 <vincenzo.frascino@arm.com>, Arnd Bergmann
 <arnd@arndb.de>, "David S. Miller"	 <davem@davemloft.net>, Andreas Larsson
 <andreas@gaisler.com>, Nick Alcock	 <nick.alcock@oracle.com>, John Stultz
 <jstultz@google.com>, Stephen Boyd	 <sboyd@kernel.org>, Shuah Khan
 <shuah@kernel.org>, Catalin Marinas	 <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Theodore Ts'o	 <tytso@mit.edu>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>, Russell King	 <linux@armlinux.org.uk>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy	
 <christophe.leroy@csgroup.eu>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui	 <kernel@xen0n.name>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Alexander Gordeev	 <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,  Sven Schnelle
 <svens@linux.ibm.com>, Nagarathnam Muthusamy
 <nagarathnam.muthusamy@oracle.com>, Shannon Nelson	 <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, Arnd Bergmann
	 <arnd@kernel.org>
Date: Sat, 20 Sep 2025 15:24:51 +0200
In-Reply-To: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
References: 
	<20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
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
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 77.11.103.224
X-ZEDAT-Hint: PO
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Thomas,

On Wed, 2025-09-17 at 16:00 +0200, Thomas Wei=C3=9Fschuh wrote:
> The generic vDSO provides a lot common functionality shared between
> different architectures. SPARC is the last architecture not using it,
> preventing some necessary code cleanup.
>=20
> Make use of the generic infrastructure.
>=20
> Follow-up to and replacement for Arnd's SPARC vDSO removal patches:
> https://lore.kernel.org/lkml/20250707144726.4008707-1-arnd@kernel.org/
>=20
> Tested on a Niagara T4 and QEMU.
>=20
> This has a semantic conflict with my series "vdso: Reject absolute
> relocations during build". The last patch of this series expects all user=
s
> of the generic vDSO library to use the vdsocheck tool.
> This is not the case (yet) for SPARC64. I do have the patches for the
> integration, the specifics will depend on which series is applied first.
>=20
> Based on tip/timers/vdso.

Could you share a version of the series based on top of 6.17.0-rcN for
testing purposes? I would like to test the series on a Sun Netra 240
which is based on the UltraSPARC IIIi.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

