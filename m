Return-Path: <linuxppc-dev+bounces-13955-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8818C42153
	for <lists+linuxppc-dev@lfdr.de>; Sat, 08 Nov 2025 01:00:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d3GKc5405z2yqh;
	Sat,  8 Nov 2025 11:00:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762560052;
	cv=none; b=FPkx5PecK7rvL1ZAlSNGrh6voxHbctwc8YMD0fgvarifEUwu/IBZlAeOajPLZ3nklsAnTVE7Ox1FLx0vrZsY4qzxC4KtIMphc5fk6TDWe9eisj/R4Eo3MqXBJFsH/fMwd3sc++xVMsBa7KdnElXSq4rR96ONs1ix9OZdDxwFFo7qClwy2XNUaESaxEXE24j5w2ZchgMlAhx4wCcGvIMgqsZmuI9LEQGFRvdmFWyLpdbSdppMbT4mNpahWspD282XmXvx1zaxg8yIKY47lJa580lP/GJt7+Ps6o5LqRb1KAvBQTNjW+tckFJsxGoVd13ph0XE6HwdIUMoQColfAswPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762560052; c=relaxed/relaxed;
	bh=9aw3k91pDoBMTIya0ydY2C08rTpxsNiCITG8XwHmzjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G08pbzHQH+/BzEmTKdsqHua8VfrrPVAjvZgdcDqJ2uzeszkLZsIt89SwpMXqPjq8UR6qd4MylwAhs/fl7Ro5IB8COIdK24hSamvX9E7NSN0TyuagewnAwwClRlaAPjXTEb3ZVkky6SZ3wsrLJpZeDHlcc7fvXPN1LwTRfSFQyJGblAd3dgpZo9xIVRLrcepEV2xXgI8sNBRQfAEGk6lc0QKuUGoye3rNwRDtICkt9UOC5MWyCzutaWaFdBKIopb1sxfDEM2t/BvGr50mZMrQaQZudbZ04krWrvanoGAPMrg3Ini1+asD8sfrsaMdwP+ZJp2Tdx9fQwNiid6WS6tK/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=BHbRrzGJ; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=srs0=v4nw=5q=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=BHbRrzGJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=srs0=v4nw=5q=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d3GKb6Fdpz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Nov 2025 11:00:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 926E661943;
	Sat,  8 Nov 2025 00:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E74C113D0;
	Sat,  8 Nov 2025 00:00:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="BHbRrzGJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1762560044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9aw3k91pDoBMTIya0ydY2C08rTpxsNiCITG8XwHmzjw=;
	b=BHbRrzGJePBy8TS0S5VXpw/OFjO5vpbdNASLPsgISoMNLpHlakF/SIAX1rTfU1HEsKdDFf
	eIdEf0TZUWWWGhFbwQZtaagtlMoxYYRnZSpFO/+kThrLew7t8YruZeFh0DwCwEUcu01hwS
	PPP3PgJwBoPMnJKLgkcEexv7TqxvNIw=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4e65cb42 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Sat, 8 Nov 2025 00:00:44 +0000 (UTC)
Date: Sat, 8 Nov 2025 01:00:35 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Nick Alcock <nick.alcock@oracle.com>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Shuah Khan <shuah@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Russell King <linux@armlinux.org.uk>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v5 16/34] random: vDSO: trim vDSO includes
Message-ID: <aQ6II2SiLMzTkAWX@zx2c4.com>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
 <20251106-vdso-sparc64-generic-2-v5-16-97ff2b6542f7@linutronix.de>
 <aQ6FcWxZFD80yWye@zx2c4.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQ6FcWxZFD80yWye@zx2c4.com>
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Nov 08, 2025 at 12:49:05AM +0100, Jason A. Donenfeld wrote:
> On Thu, Nov 06, 2025 at 11:02:09AM +0100, Thomas Weißschuh wrote:
> > These includes are not used, remove them.
> > 
> > Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> > Tested-by: Andreas Larsson <andreas@gaisler.com>
> > Reviewed-by: Andreas Larsson <andreas@gaisler.com>
> > ---
> >  drivers/char/random.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/char/random.c b/drivers/char/random.c
> > index b8b24b6ed3fe436c8102968392278d5cb5544f06..3860ddd9527930780d5c13cd4742fbc3c27acc42 100644
> > --- a/drivers/char/random.c
> > +++ b/drivers/char/random.c
> > @@ -57,9 +57,7 @@
> >  #include <crypto/chacha.h>
> >  #include <crypto/blake2s.h>
> >  #ifdef CONFIG_VDSO_GETRANDOM
> > -#include <vdso/getrandom.h>
> >  #include <vdso/datapage.h>
> > -#include <vdso/vsyscall.h>
> >  #endif
> >  #include <asm/archrandom.h>
> >  #include <asm/processor.h>
> 
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Sorry, it's been a long day. I meant:

Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>

