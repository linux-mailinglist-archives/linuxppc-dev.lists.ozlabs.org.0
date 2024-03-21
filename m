Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF4488595E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 13:48:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Ja8pHUrU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0lcj3dpyz3dWk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 23:48:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Ja8pHUrU;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0lc070ysz3dHV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 23:47:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1711025264;
	bh=VpTgsHsE8Gwfx7YFHfRPL4F/osaBTmZy0HilednQEpY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ja8pHUrUQvzu5RY8zFcgOwKslWfGRly7LXNffj17mBPyISG4D9nO5B4xwkMcsDUCG
	 cIMcvey7zJjBOZwfSMY+LNafAC55wMlzZm8O8hBODwzTCxgJKR9EFnSDH9h5Ot3XJe
	 yd2tvTiJDTeS2MbssbzK1fULqtg4gYUgU8TUy+di12moX1whg+7rKsKrxC2MuyihA0
	 KlWpUQXCmytoN6ZbBCjM0kaQMVsbZVuI4Wd2esQjZXsrNr8wMxKxGATiAiEET8ke5O
	 LPZXVzbUVfooAqrB3DOpHr51RDxmhwkneZ0/02M11IsLVaU/a667pG2wWKeVENYoOC
	 uDuMVGhWqeJDQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4V0lbx3xtpz4wc1;
	Thu, 21 Mar 2024 23:47:41 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Subject: Re: Cannot load wireguard module
In-Reply-To: <20240320160428.GQ20665@kitsune.suse.cz>
References: <20240315122005.GG20665@kitsune.suse.cz>
 <87jzm32h7q.fsf@mail.lhotse> <87r0g7zrl2.fsf@mail.lhotse>
 <20240318170855.GK20665@kitsune.suse.cz>
 <20240319124742.GM20665@kitsune.suse.cz> <87le6dyt1f.fsf@mail.lhotse>
 <20240320160428.GQ20665@kitsune.suse.cz>
Date: Thu, 21 Mar 2024 23:47:41 +1100
Message-ID: <87frwjzr82.fsf@mail.lhotse>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Herbert Xu <herbert@gondor.apana.org.au>, netdev@vger.kernel.org, dtsen@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> On Wed, Mar 20, 2024 at 11:41:32PM +1100, Michael Ellerman wrote:
>> Michal Such=C3=A1nek <msuchanek@suse.de> writes:
>> > On Mon, Mar 18, 2024 at 06:08:55PM +0100, Michal Such=C3=A1nek wrote:
>> >> On Mon, Mar 18, 2024 at 10:50:49PM +1100, Michael Ellerman wrote:
>> >> > Michael Ellerman <mpe@ellerman.id.au> writes:
>> >> > > Michal Such=C3=A1nek <msuchanek@suse.de> writes:
>> >> > >> Hello,
>> >> > >>
>> >> > >> I cannot load the wireguard module.
>> >> > >>
>> >> > >> Loading the module provides no diagnostic other than 'No such de=
vice'.
>> >> > >>
>> >> > >> Please provide maningful diagnostics for loading software-only d=
river,
>> >> > >> clearly there is no particular device needed.
>> >> > >
>> >> > > Presumably it's just bubbling up an -ENODEV from somewhere.
>> >> > >
>> >> > > Can you get a trace of it?
>> >> > >
>> >> > > Something like:
>> >> > >
>> >> > >   # trace-cmd record -p function_graph -F modprobe wireguard
>> >
>> > Attached.
>>=20
>> Sorry :/, you need to also trace children of modprobe, with -c.
>>=20
>> But, I was able to reproduce the same issue here.
>>=20
>> On a P9, a kernel with CONFIG_CRYPTO_CHACHA20_P10=3Dn everything works:
>>=20
>>   $ modprobe -v wireguard
>>   insmod /lib/modules/6.8.0/kernel/net/ipv4/udp_tunnel.ko
>>   insmod /lib/modules/6.8.0/kernel/net/ipv6/ip6_udp_tunnel.ko
>>   insmod /lib/modules/6.8.0/kernel/lib/crypto/libchacha.ko
>>   insmod /lib/modules/6.8.0/kernel/lib/crypto/libchacha20poly1305.ko
>>   insmod /lib/modules/6.8.0/kernel/drivers/net/wireguard/wireguard.ko
>>   [   19.180564][  T692] wireguard: allowedips self-tests: pass
>>   [   19.185080][  T692] wireguard: nonce counter self-tests: pass
>>   [   19.310438][  T692] wireguard: ratelimiter self-tests: pass
>>   [   19.310639][  T692] wireguard: WireGuard 1.0.0 loaded. See www.wire=
guard.com for information.
>>   [   19.310746][  T692] wireguard: Copyright (C) 2015-2019 Jason A. Don=
enfeld <Jason@zx2c4.com>. All Rights Reserved.
>>=20
>>=20
>> If I build CONFIG_CRYPTO_CHACHA20_P10 as a module then it breaks:
>>=20
>>   $ modprobe -v wireguard
>>   insmod /lib/modules/6.8.0/kernel/net/ipv4/udp_tunnel.ko
>>   insmod /lib/modules/6.8.0/kernel/net/ipv6/ip6_udp_tunnel.ko
>>   insmod /lib/modules/6.8.0/kernel/lib/crypto/libchacha.ko
>>   insmod /lib/modules/6.8.0/kernel/arch/powerpc/crypto/chacha-p10-crypto=
.ko
>>   modprobe: ERROR: could not insert 'wireguard': No such device
>>=20
>>=20
>> The ENODEV is coming from module_cpu_feature_match(), which blocks the
>> driver from loading on non-p10.
>>=20
>> Looking at other arches (arm64 at least) it seems like the driver should
>> instead be loading but disabling the p10 path. Which then allows
>> chacha_crypt_arch() to exist, and it has a fallback to use
>> chacha_crypt_generic().
>>=20
>> I don't see how module_cpu_feature_match() can co-exist with the driver
>> also providing a fallback. Hopefully someone who knows crypto better
>> than me can explain it.
>
> Maybe it doesn't. ppc64le is the only platform that needs the fallback,
> on other platforms that have hardware-specific chacha implementation it
> seems to be using pretty common feature so the fallback is rarely if
> ever needed in practice.

Yeah you are probably right.

The arm64 NEON code was changed by Ard to behave like a library in
b3aad5bad26a ("crypto: arm64/chacha - expose arm64 ChaCha routine as
library function").

Which included this change:

@@ -179,14 +207,17 @@ static struct skcipher_alg algs[] =3D {
 static int __init chacha_simd_mod_init(void)
 {
        if (!cpu_have_named_feature(ASIMD))
-               return -ENODEV;
+               return 0;
+
+       static_branch_enable(&have_neon);

        return crypto_register_skciphers(algs, ARRAY_SIZE(algs));
 }

It didn't use module_cpu_feature_match(), but the above is basically the
same pattern.

I don't actually see the point of using module_cpu_feature_match() for
this code.

There's no point loading it unless someone wants to use chacha, and that
should be handled by MODULE_ALIAS_CRYPTO("chacha20") etc.

cheers
