Return-Path: <linuxppc-dev+bounces-6388-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE08A4064F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Feb 2025 09:21:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z0KhN2v4tz2ynL;
	Sat, 22 Feb 2025 19:21:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=89.208.246.23
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740212468;
	cv=none; b=YIOA1BqZjaeDEn6UZbOftKWH4UiobqZrIa3iWfOnBUKWZEYfOrPWD4SRHGwdwo5DeaDlrAea+W7kv/WT6z65HGR3E7s+W8HjHfmEE4vxQttwSps2ql+rcPMFtVv4eSC3x8UGZHDfrKgrmULIW1HKe2u3YB/YLIhM3R3bKUtORMbMyGkXvhwib9ZvrZJSlqUec1wFzqfLJ7E9D9vIde+r+RB3MWDhv16Imo7MopBs9OgO/AFS1wYq4JEhlxewjNFU1NZIrJIOT4o5SOV6zCshWnoJd9rAFBya5X6dk3qhvo4FrrMqly/wBsPkIcvwhfkcsxbuqK6XEz7uqp9sNQBZAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740212468; c=relaxed/relaxed;
	bh=1q+MziLP+LRP2VrK2FzjijCA1tPSm0Mct61S8QV7OY4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OA3rkw0YHNXS9AZu5gZodLiMwel/qV7fxRmPxZgW4mDjSzyDsKobY5aDrI8V/dSmJs/Y6WwpeuP9Gvic9N66oRJe1XnkgHUBdAtcM7qZi5o9GYj+t5tfh6mJV44nxrd+8WeumfwrWqEexJjetUWLCT3wTu04OUxZ+ZHBWyXeaM/frLp6RUjIVFp3iUNx/s55H92dA0EDnUCdoBiaRFZDNouguzlgGUnLmUA9HRniZPFgVp3ABrK5TANk1gv2SCH3f5iIKJ8/l8ZcV0XB5oDHhfENvszq5dHPbqBbJBbKVW0U9tTKnyGm3yplYeMeMHCr9+kQ/gBAe3e8nFElXPLJTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; dkim=pass (1024-bit key; unprotected) header.d=xry111.site header.i=@xry111.site header.a=rsa-sha256 header.s=default header.b=ndlk6Xh1; dkim-atps=neutral; spf=pass (client-ip=89.208.246.23; helo=xry111.site; envelope-from=xry111@xry111.site; receiver=lists.ozlabs.org) smtp.mailfrom=xry111.site
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=xry111.site header.i=@xry111.site header.a=rsa-sha256 header.s=default header.b=ndlk6Xh1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=xry111.site (client-ip=89.208.246.23; helo=xry111.site; envelope-from=xry111@xry111.site; receiver=lists.ozlabs.org)
X-Greylist: delayed 209 seconds by postgrey-1.37 at boromir; Sat, 22 Feb 2025 19:21:04 AEDT
Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z0KhJ199Sz2y8W
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Feb 2025 19:21:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1740212460;
	bh=1q+MziLP+LRP2VrK2FzjijCA1tPSm0Mct61S8QV7OY4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ndlk6Xh1LDQ4IVzyCwXm+//RroUMYlrg93bkaGOnu/PB6zPDKJjYVM1f8u1zbnorm
	 6Wj9dxVkDjMZ8iYBCSeLLJkBb4sDAbSbTyaqhai1+lbpRWyuiyTuixexNlOL6xLK8h
	 Mbghzm1Uih9WOBd+JPF+dxhjdCJtmTB+W3bP4HQ8=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1))
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id BF6C9676E3;
	Sat, 22 Feb 2025 03:20:52 -0500 (EST)
Message-ID: <afc16fdc2417c3a761b880950c6c03998366e92f.camel@xry111.site>
Subject: Re: [PATCH v3 10/18] LoongArch: vDSO: Switch to generic storage
 implementation
From: Xi Ruoyao <xry111@xry111.site>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge
 Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>,  Thomas Gleixner
 <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Anna-Maria Behnsen	 <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>,  Andrew Morton <akpm@linux-foundation.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon	 <will@kernel.org>, Theodore
 Ts'o <tytso@mit.edu>, "Jason A. Donenfeld"	 <Jason@zx2c4.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt	 <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen	 <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Russell King	 <linux@armlinux.org.uk>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik	 <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Bogendoerfer	 <tsbogend@alpha.franken.de>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Naveen N Rao	 <naveen@kernel.org>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Ingo Molnar	 <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen	 <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,  Arnd Bergmann	
 <arnd@arndb.de>, Guo Ren <guoren@kernel.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
	linux-csky@vger.kernel.org
Date: Sat, 22 Feb 2025 16:20:51 +0800
In-Reply-To: <20250204-vdso-store-rng-v3-10-13a4669dfc8c@linutronix.de>
References: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
	 <20250204-vdso-store-rng-v3-10-13a4669dfc8c@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 2025-02-04 at 13:05 +0100, Thomas Wei=C3=9Fschuh wrote:
> The generic storage implementation provides the same features as the
> custom one. However it can be shared between architectures, making
> maintenance easier.
>=20
> Co-developed-by: Nam Cao <namcao@linutronix.de>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Tested-by: Xi Ruoyao <xry111@xry111.site>

/* snip */

> diff --git a/arch/loongarch/include/asm/vdso/getrandom.h b/arch/loongarch=
/include/asm/vdso/getrandom.h
> index e80f3c4ac7481ba7f9f5d9210fefa78c3293243b..48c43f55b039b42168698614d=
0479b7a872d20f3 100644
> --- a/arch/loongarch/include/asm/vdso/getrandom.h
> +++ b/arch/loongarch/include/asm/vdso/getrandom.h

You can drop "#include <vdso/vdso.h>" in this file.

> @@ -28,11 +28,6 @@ static __always_inline ssize_t getrandom_syscall(void =
*_buffer, size_t _len, uns
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> -static __always_inline const struct vdso_rng_data *__arch_get_vdso_rng_d=
ata(void)
> -{
> -	return &_loongarch_data.rng_data;
> -}
> -
> =C2=A0#endif /* !__ASSEMBLY__ */
> =C2=A0
> =C2=A0#endif /* __ASM_VDSO_GETRANDOM_H */

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University

