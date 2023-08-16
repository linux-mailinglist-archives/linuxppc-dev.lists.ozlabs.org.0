Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB6177ED8B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 01:02:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=jXokpT8H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RR3YS3nmXz3cRD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 09:02:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=jXokpT8H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=8o5j=eb=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RR3Xb0HH7z2yhL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 09:01:18 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 106C56442A
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 23:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08270C433C7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 23:01:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="jXokpT8H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1692226871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fJ+exFyMwxf+Sp/aWFmN/k274aR2STKWbu8odcAPWm8=;
	b=jXokpT8HHm9bHv6hIJ3T3CMHWSwvmBYeqbPj7fjD4Ezxvigmdm/fXPxtKXDXtXiveMyEy2
	K2zo2MO6Jx19/zc76sU6x7FN12g49ex3CRn9eKlZgLZMkYTlRh8PLwi9EYMp443CajZ7FT
	H+k/S7W81nftL8bDVz+/B0+KLWJPGLw=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b56ce43a (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linuxppc-dev@lists.ozlabs.org>;
	Wed, 16 Aug 2023 23:01:10 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-447823dd96fso2104627137.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 16:01:09 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxe29BNgJeKdL505EUBXJDZjz2J5AZpUuxmbcRItesRZMbiLVs9
	8T0RLXV3ocRND41yi0P8UjDs7gKuKmRfEX4mT1g=
X-Google-Smtp-Source: AGHT+IFdKTop/dTzxxplY5bDLsdLZZ0m1tGPXQJd6rkmBy2Wm4exC645Mb9rMUW6TK7Pnh6+pZhH7oflLvX5KYDSdqc=
X-Received: by 2002:a67:e211:0:b0:443:c87f:ebb1 with SMTP id
 g17-20020a67e211000000b00443c87febb1mr2517297vsa.29.1692226866965; Wed, 16
 Aug 2023 16:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230816055010.31534-1-rdunlap@infradead.org>
In-Reply-To: <20230816055010.31534-1-rdunlap@infradead.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 17 Aug 2023 00:58:18 +0200
X-Gmail-Original-Message-ID: <CAHmME9pxC_e6Ftj1MJ4H2skhhKfNubd=7OwcH9xepCxjkDxpkg@mail.gmail.com>
Message-ID: <CAHmME9pxC_e6Ftj1MJ4H2skhhKfNubd=7OwcH9xepCxjkDxpkg@mail.gmail.com>
Subject: Re: [PATCH] treewide: drop CONFIG_EMBEDDED
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-kernel@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Masahiro Yamada <masahiroy@kernel.org>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, Jonas Bonn <jonas@southpole.se>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bo
 gendoerfer <tsbogend@alpha.franken.de>, Max Filippov <jcmvbkbc@gmail.com>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 16, 2023 at 7:50=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> There is only one Kconfig user of CONFIG_EMBEDDED and it can be
> switched to EXPERT or "if !ARCH_MULTIPLATFORM" (suggested by Arnd).
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Jason A. Donenfeld <Jason@zx2c4.com>
> Cc: wireguard@lists.zx2c4.com
> Cc: linux-arch@vger.kernel.org
> Cc: linux-snps-arc@lists.infradead.org
> Cc: Vineet Gupta <vgupta@kernel.org>
> Cc: Brian Cain <bcain@quicinc.com>
> Cc: linux-hexagon@vger.kernel.org
> Cc: Greg Ungerer <gerg@linux-m68k.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Dinh Nguyen <dinguyen@kernel.org>
> Cc: Jonas Bonn <jonas@southpole.se>
> Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
> Cc: Stafford Horne <shorne@gmail.com>
> Cc: linux-openrisc@vger.kernel.org
> Cc: linux-mips@vger.kernel.org
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: linux-sh@vger.kernel.org
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: Josh Triplett <josh@joshtriplett.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> Cc: Andrew Morton <akpm@linux-foundation.org>
> ---
> diff -- a/tools/testing/selftests/wireguard/qemu/kernel.config b/tools/te=
sting/selftests/wireguard/qemu/kernel.config
> --- a/tools/testing/selftests/wireguard/qemu/kernel.config
> +++ b/tools/testing/selftests/wireguard/qemu/kernel.config
> @@ -41,7 +41,6 @@ CONFIG_KALLSYMS=3Dy
>  CONFIG_BUG=3Dy
>  CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
>  CONFIG_JUMP_LABEL=3Dy
> -CONFIG_EMBEDDED=3Dn
>  CONFIG_BASE_FULL=3Dy
>  CONFIG_FUTEX=3Dy
>  CONFIG_SHMEM=3Dy

Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>
