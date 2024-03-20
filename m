Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4396881530
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 17:05:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ZM1IHRuJ;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=lfgEkScD;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Xi6MSutC;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AoEpC++p;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0D2Q4Wtzz3dW4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 03:05:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ZM1IHRuJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=lfgEkScD;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Xi6MSutC;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=AoEpC++p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0D1f1YCCz2ykn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 03:04:37 +1100 (AEDT)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CC70734774;
	Wed, 20 Mar 2024 16:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710950670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QjX69h01GVJIX3aWH8s2p5XVScnEQmomDafkyDxLNA0=;
	b=ZM1IHRuJywSxvY8A+4nEfPdAHQLhQX9C8iD67BDfskczwGODJvUjL0/NWVXtfcflvsU6Xk
	bmLgY4vKUFvWA4EIoXA6nHan3DOqoUyXiuQOS07XWugAGH8uoYUNgRDENUzJYa7DwWYcBH
	H0ZNex80ESA6hsqs9yN3NYtk+sutzFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710950670;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QjX69h01GVJIX3aWH8s2p5XVScnEQmomDafkyDxLNA0=;
	b=lfgEkScD99ZVyS2EFPayeinSdqUVXY8mobLEvk1s6AB/OwUaRBuJaWXW/xQg8tHni1VA2V
	rZsMybeRo+yFy0DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710950669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QjX69h01GVJIX3aWH8s2p5XVScnEQmomDafkyDxLNA0=;
	b=Xi6MSutCQfz591Wl1UJwUi0ajdVP6Mwbm+63KHXpmMBPmdImS6M3cKMXe2E6y37gAYPDgN
	5ZL8DzPKyXHozyH9xcX9kYWug2AjmGBCjxgEWUfftUP1o90zjgWvCQ9dQKSk2pU873w2dH
	zs4Ct5kATobPicpB3CjFjQXxgIHwM7I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710950669;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QjX69h01GVJIX3aWH8s2p5XVScnEQmomDafkyDxLNA0=;
	b=AoEpC++pSxac76w/vY/ydJS6TK/GV/j2smtUlKSZse5XoRiuNW96Rg32n6ZfQ65hR0e70u
	cvHHS2eDDWI4IDAQ==
Date: Wed, 20 Mar 2024 17:04:28 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Cannot load wireguard module
Message-ID: <20240320160428.GQ20665@kitsune.suse.cz>
References: <20240315122005.GG20665@kitsune.suse.cz>
 <87jzm32h7q.fsf@mail.lhotse>
 <87r0g7zrl2.fsf@mail.lhotse>
 <20240318170855.GK20665@kitsune.suse.cz>
 <20240319124742.GM20665@kitsune.suse.cz>
 <87le6dyt1f.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87le6dyt1f.fsf@mail.lhotse>
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -7.54
X-Spamd-Result: default: False [-7.54 / 50.00];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.15)[-0.760];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,wireguard.com:url,ellerman.id.au:email,zx2c4.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_COUNT_ZERO(0.00)[0];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.71)[subject];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO
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

On Wed, Mar 20, 2024 at 11:41:32PM +1100, Michael Ellerman wrote:
> Michal Suchánek <msuchanek@suse.de> writes:
> > On Mon, Mar 18, 2024 at 06:08:55PM +0100, Michal Suchánek wrote:
> >> On Mon, Mar 18, 2024 at 10:50:49PM +1100, Michael Ellerman wrote:
> >> > Michael Ellerman <mpe@ellerman.id.au> writes:
> >> > > Michal Suchánek <msuchanek@suse.de> writes:
> >> > >> Hello,
> >> > >>
> >> > >> I cannot load the wireguard module.
> >> > >>
> >> > >> Loading the module provides no diagnostic other than 'No such device'.
> >> > >>
> >> > >> Please provide maningful diagnostics for loading software-only driver,
> >> > >> clearly there is no particular device needed.
> >> > >
> >> > > Presumably it's just bubbling up an -ENODEV from somewhere.
> >> > >
> >> > > Can you get a trace of it?
> >> > >
> >> > > Something like:
> >> > >
> >> > >   # trace-cmd record -p function_graph -F modprobe wireguard
> >
> > Attached.
> 
> Sorry :/, you need to also trace children of modprobe, with -c.
> 
> But, I was able to reproduce the same issue here.
> 
> On a P9, a kernel with CONFIG_CRYPTO_CHACHA20_P10=n everything works:
> 
>   $ modprobe -v wireguard
>   insmod /lib/modules/6.8.0/kernel/net/ipv4/udp_tunnel.ko
>   insmod /lib/modules/6.8.0/kernel/net/ipv6/ip6_udp_tunnel.ko
>   insmod /lib/modules/6.8.0/kernel/lib/crypto/libchacha.ko
>   insmod /lib/modules/6.8.0/kernel/lib/crypto/libchacha20poly1305.ko
>   insmod /lib/modules/6.8.0/kernel/drivers/net/wireguard/wireguard.ko
>   [   19.180564][  T692] wireguard: allowedips self-tests: pass
>   [   19.185080][  T692] wireguard: nonce counter self-tests: pass
>   [   19.310438][  T692] wireguard: ratelimiter self-tests: pass
>   [   19.310639][  T692] wireguard: WireGuard 1.0.0 loaded. See www.wireguard.com for information.
>   [   19.310746][  T692] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
> 
> 
> If I build CONFIG_CRYPTO_CHACHA20_P10 as a module then it breaks:
> 
>   $ modprobe -v wireguard
>   insmod /lib/modules/6.8.0/kernel/net/ipv4/udp_tunnel.ko
>   insmod /lib/modules/6.8.0/kernel/net/ipv6/ip6_udp_tunnel.ko
>   insmod /lib/modules/6.8.0/kernel/lib/crypto/libchacha.ko
>   insmod /lib/modules/6.8.0/kernel/arch/powerpc/crypto/chacha-p10-crypto.ko
>   modprobe: ERROR: could not insert 'wireguard': No such device
> 
> 
> The ENODEV is coming from module_cpu_feature_match(), which blocks the
> driver from loading on non-p10.
> 
> Looking at other arches (arm64 at least) it seems like the driver should
> instead be loading but disabling the p10 path. Which then allows
> chacha_crypt_arch() to exist, and it has a fallback to use
> chacha_crypt_generic().
> 
> I don't see how module_cpu_feature_match() can co-exist with the driver
> also providing a fallback. Hopefully someone who knows crypto better
> than me can explain it.

Maybe it doesn't. ppc64le is the only platform that needs the fallback,
on other platforms that have hardware-specific chacha implementation it
seems to be using pretty common feature so the fallback is rarely if
ever needed in practice.

Thanks

Michal

> 
> This diff fixes it for me:
> 
> diff --git a/arch/powerpc/crypto/chacha-p10-glue.c b/arch/powerpc/crypto/chacha-p10-glue.c
> index 74fb86b0d209..9d2c30b0904c 100644
> --- a/arch/powerpc/crypto/chacha-p10-glue.c
> +++ b/arch/powerpc/crypto/chacha-p10-glue.c
> @@ -197,6 +197,9 @@ static struct skcipher_alg algs[] = {
>  
>  static int __init chacha_p10_init(void)
>  {
> +	if (!cpu_has_feature(PPC_FEATURE2_ARCH_3_1))
> +		return 0;
> +
>  	static_branch_enable(&have_p10);
>  
>  	return crypto_register_skciphers(algs, ARRAY_SIZE(algs));
> @@ -207,7 +210,7 @@ static void __exit chacha_p10_exit(void)
>  	crypto_unregister_skciphers(algs, ARRAY_SIZE(algs));
>  }
>  
> -module_cpu_feature_match(PPC_MODULE_FEATURE_P10, chacha_p10_init);
> +module_init(chacha_p10_init);
>  module_exit(chacha_p10_exit);
>  
>  MODULE_DESCRIPTION("ChaCha and XChaCha stream ciphers (P10 accelerated)");
> 
> 
> Giving me:
> 
>   $ modprobe -v wireguard
>   insmod /lib/modules/6.8.0-dirty/kernel/net/ipv4/udp_tunnel.ko
>   insmod /lib/modules/6.8.0-dirty/kernel/net/ipv6/ip6_udp_tunnel.ko
>   insmod /lib/modules/6.8.0-dirty/kernel/lib/crypto/libchacha.ko
>   insmod /lib/modules/6.8.0-dirty/kernel/arch/powerpc/crypto/chacha-p10-crypto.ko
>   insmod /lib/modules/6.8.0-dirty/kernel/lib/crypto/libchacha20poly1305.ko
>   insmod /lib/modules/6.8.0-dirty/kernel/drivers/net/wireguard/wireguard.ko
>   [   19.657941][  T718] wireguard: allowedips self-tests: pass
>   [   19.662501][  T718] wireguard: nonce counter self-tests: pass
>   [   19.782933][  T718] wireguard: ratelimiter self-tests: pass
>   [   19.783114][  T718] wireguard: WireGuard 1.0.0 loaded. See www.wireguard.com for information.
>   [   19.783223][  T718] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
>   
> 
> cheers
