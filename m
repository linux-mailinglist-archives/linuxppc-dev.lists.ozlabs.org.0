Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE1E8811C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 13:42:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pDysZXTz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V07X757xNz3dgN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 23:42:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pDysZXTz;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V07WQ3RC9z3cDk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Mar 2024 23:41:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1710938498;
	bh=aAUO3lBXXGEBX6m0mDWiKt/o6NIO+aW9sgNR3bVCTzM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pDysZXTzTiDSH5YK83UMRNylp4bt3GRo9FqWpe4cSIZaBBNSpjoWU4c8LgsbhE/fO
	 X6odEhE6xCTe/ljsHRjTiypNHXMRrRuLN0Jzr1ijy3wx6sdbjDAAD6ANTVsuiYgGqP
	 KvdJhqtU/7p0prvn4cQit8rb/kknkkiYK+gl00l6bCaMDfld2Dz0EUNFKN6MHmgSHr
	 fpNcLtH5iVCiEo35T2c6jwEPJ3CF5cW8uG2cIgdO2A/Kq43uA9A2L4REaElcaavRkI
	 YYc2ExUMozicvZxsnZ7AMzsh69Li6ZSVxoSj4g4xx/z/0NrXlCrzaOmeJa1qSBOLvi
	 mHIZqaIMWlFng==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4V07WP12Rxz4wcQ;
	Wed, 20 Mar 2024 23:41:36 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Subject: Re: Cannot load wireguard module
In-Reply-To: <20240319124742.GM20665@kitsune.suse.cz>
References: <20240315122005.GG20665@kitsune.suse.cz>
 <87jzm32h7q.fsf@mail.lhotse> <87r0g7zrl2.fsf@mail.lhotse>
 <20240318170855.GK20665@kitsune.suse.cz>
 <20240319124742.GM20665@kitsune.suse.cz>
Date: Wed, 20 Mar 2024 23:41:32 +1100
Message-ID: <87le6dyt1f.fsf@mail.lhotse>
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
> On Mon, Mar 18, 2024 at 06:08:55PM +0100, Michal Such=C3=A1nek wrote:
>> On Mon, Mar 18, 2024 at 10:50:49PM +1100, Michael Ellerman wrote:
>> > Michael Ellerman <mpe@ellerman.id.au> writes:
>> > > Michal Such=C3=A1nek <msuchanek@suse.de> writes:
>> > >> Hello,
>> > >>
>> > >> I cannot load the wireguard module.
>> > >>
>> > >> Loading the module provides no diagnostic other than 'No such devic=
e'.
>> > >>
>> > >> Please provide maningful diagnostics for loading software-only driv=
er,
>> > >> clearly there is no particular device needed.
>> > >
>> > > Presumably it's just bubbling up an -ENODEV from somewhere.
>> > >
>> > > Can you get a trace of it?
>> > >
>> > > Something like:
>> > >
>> > >   # trace-cmd record -p function_graph -F modprobe wireguard
>
> Attached.

Sorry :/, you need to also trace children of modprobe, with -c.

But, I was able to reproduce the same issue here.

On a P9, a kernel with CONFIG_CRYPTO_CHACHA20_P10=3Dn everything works:

  $ modprobe -v wireguard
  insmod /lib/modules/6.8.0/kernel/net/ipv4/udp_tunnel.ko
  insmod /lib/modules/6.8.0/kernel/net/ipv6/ip6_udp_tunnel.ko
  insmod /lib/modules/6.8.0/kernel/lib/crypto/libchacha.ko
  insmod /lib/modules/6.8.0/kernel/lib/crypto/libchacha20poly1305.ko
  insmod /lib/modules/6.8.0/kernel/drivers/net/wireguard/wireguard.ko
  [   19.180564][  T692] wireguard: allowedips self-tests: pass
  [   19.185080][  T692] wireguard: nonce counter self-tests: pass
  [   19.310438][  T692] wireguard: ratelimiter self-tests: pass
  [   19.310639][  T692] wireguard: WireGuard 1.0.0 loaded. See www.wiregua=
rd.com for information.
  [   19.310746][  T692] wireguard: Copyright (C) 2015-2019 Jason A. Donenf=
eld <Jason@zx2c4.com>. All Rights Reserved.


If I build CONFIG_CRYPTO_CHACHA20_P10 as a module then it breaks:

  $ modprobe -v wireguard
  insmod /lib/modules/6.8.0/kernel/net/ipv4/udp_tunnel.ko
  insmod /lib/modules/6.8.0/kernel/net/ipv6/ip6_udp_tunnel.ko
  insmod /lib/modules/6.8.0/kernel/lib/crypto/libchacha.ko
  insmod /lib/modules/6.8.0/kernel/arch/powerpc/crypto/chacha-p10-crypto.ko
  modprobe: ERROR: could not insert 'wireguard': No such device


The ENODEV is coming from module_cpu_feature_match(), which blocks the
driver from loading on non-p10.

Looking at other arches (arm64 at least) it seems like the driver should
instead be loading but disabling the p10 path. Which then allows
chacha_crypt_arch() to exist, and it has a fallback to use
chacha_crypt_generic().

I don't see how module_cpu_feature_match() can co-exist with the driver
also providing a fallback. Hopefully someone who knows crypto better
than me can explain it.

This diff fixes it for me:

diff --git a/arch/powerpc/crypto/chacha-p10-glue.c b/arch/powerpc/crypto/ch=
acha-p10-glue.c
index 74fb86b0d209..9d2c30b0904c 100644
--- a/arch/powerpc/crypto/chacha-p10-glue.c
+++ b/arch/powerpc/crypto/chacha-p10-glue.c
@@ -197,6 +197,9 @@ static struct skcipher_alg algs[] =3D {
=20
 static int __init chacha_p10_init(void)
 {
+	if (!cpu_has_feature(PPC_FEATURE2_ARCH_3_1))
+		return 0;
+
 	static_branch_enable(&have_p10);
=20
 	return crypto_register_skciphers(algs, ARRAY_SIZE(algs));
@@ -207,7 +210,7 @@ static void __exit chacha_p10_exit(void)
 	crypto_unregister_skciphers(algs, ARRAY_SIZE(algs));
 }
=20
-module_cpu_feature_match(PPC_MODULE_FEATURE_P10, chacha_p10_init);
+module_init(chacha_p10_init);
 module_exit(chacha_p10_exit);
=20
 MODULE_DESCRIPTION("ChaCha and XChaCha stream ciphers (P10 accelerated)");


Giving me:

  $ modprobe -v wireguard
  insmod /lib/modules/6.8.0-dirty/kernel/net/ipv4/udp_tunnel.ko
  insmod /lib/modules/6.8.0-dirty/kernel/net/ipv6/ip6_udp_tunnel.ko
  insmod /lib/modules/6.8.0-dirty/kernel/lib/crypto/libchacha.ko
  insmod /lib/modules/6.8.0-dirty/kernel/arch/powerpc/crypto/chacha-p10-cry=
pto.ko
  insmod /lib/modules/6.8.0-dirty/kernel/lib/crypto/libchacha20poly1305.ko
  insmod /lib/modules/6.8.0-dirty/kernel/drivers/net/wireguard/wireguard.ko
  [   19.657941][  T718] wireguard: allowedips self-tests: pass
  [   19.662501][  T718] wireguard: nonce counter self-tests: pass
  [   19.782933][  T718] wireguard: ratelimiter self-tests: pass
  [   19.783114][  T718] wireguard: WireGuard 1.0.0 loaded. See www.wiregua=
rd.com for information.
  [   19.783223][  T718] wireguard: Copyright (C) 2015-2019 Jason A. Donenf=
eld <Jason@zx2c4.com>. All Rights Reserved.
=20=20

cheers
