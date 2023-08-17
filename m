Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D4277EFDD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 06:39:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XBb7K0DG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRC2K6xMQz3cNH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 14:39:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XBb7K0DG;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRC1S0YxSz2yWD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 14:38:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692247099;
	bh=TTioG2ECpny8c1gUsV9lSzzBSbOyxoHgJmKmcWGJJb4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XBb7K0DGSY/aWma20FuWJJsaYj/I7WnxTgc1QHrKacwxzHabn8IDVtxnh+u1kir6R
	 0/dCSv6v4j6K+H0n0qfcFvbzDwuMx48my6HmK54JUowGxZTDeBv/LzC/fGdkjM0jbL
	 uhrythOSDp6fSsw5OTIIfIEFFsUSHSrvxpvNZyVXzcV91YnrQwqGxwE4iXdMVpv7PD
	 KJDmjPNi29obujTq193LiorByY4yu6Webks9bDdTMqdbgikcZ6YUA9A+9yqAiDvppy
	 K31/Jqh8vTUknZvmhTxSZipw5CVFpctxK0wQ1Ogxo+krqzabVOtQDHKwv50O+7cmGR
	 NxwruEUcx/hdw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RRC1B2MJWz4wZn;
	Thu, 17 Aug 2023 14:38:06 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] treewide: drop CONFIG_EMBEDDED
In-Reply-To: <20230816055010.31534-1-rdunlap@infradead.org>
References: <20230816055010.31534-1-rdunlap@infradead.org>
Date: Thu, 17 Aug 2023 14:38:05 +1000
Message-ID: <875y5e707m.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, Jonas Bonn <jonas@southpole.se>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, 
 Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Max Filippov <jcmvbkbc@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Randy Dunlap <rdunlap@infradead.org> writes:
> There is only one Kconfig user of CONFIG_EMBEDDED and it can be
> switched to EXPERT or "if !ARCH_MULTIPLATFORM" (suggested by Arnd).
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
...
>  arch/powerpc/configs/40x/klondike_defconfig          |    2 +-
>  arch/powerpc/configs/44x/fsp2_defconfig              |    2 +-
>  arch/powerpc/configs/52xx/tqm5200_defconfig          |    2 +-
>  arch/powerpc/configs/mgcoge_defconfig                |    2 +-
>  arch/powerpc/configs/microwatt_defconfig             |    2 +-
>  arch/powerpc/configs/ps3_defconfig                   |    2 +-
  
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

...

> diff -- a/init/Kconfig b/init/Kconfig
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1790,14 +1790,6 @@ config DEBUG_RSEQ
>  
>  	  If unsure, say N.
>  
> -config EMBEDDED
> -	bool "Embedded system"
> -	select EXPERT

This is a crucial detail that could be mentioned in the change log. ie.
that all defconfigs that currently have EMBEDDED=y are currently
selecting EXPERT already.

cheers
