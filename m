Return-Path: <linuxppc-dev+bounces-13954-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54783C42146
	for <lists+linuxppc-dev@lfdr.de>; Sat, 08 Nov 2025 01:00:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d3GJt0m2tz2yqh;
	Sat,  8 Nov 2025 11:00:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762560013;
	cv=none; b=oakiQa7ared/tSfEyqVHREINaPzB/IiO2dOXpjYTSN7LoJ41oVfStRhPXHWvYPx7yJ3Ty1iBhxwcKOrgsJ1U8EPAQhvaRpTe4H3OIxNkTXPVZ3FP2qfPRNinWi9qK0OMSAy/ZHTHataWtRQ/ATJtq+2BrQExqUiv437sfd2jE969sr0XNltZ5QRKJAcYGOCRnFLNffakDkxW+kMR5pwOnxswc8HGlFRuSIUOTDES1JEJMJ8qOGEHFiORr881kZZU1H3a65g5O0mN5C70d/KaKiXo8AGhva+AjDP5Zchm5zavhwJ1H6ccqKYUbROclarM6gLy85cYpa5u69qOiaFK+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762560013; c=relaxed/relaxed;
	bh=WAt2mksIHtC2i3o7CYlpSBU3PXZGrY2JGGi82ePiq/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZn3gcYxq1XeQgRt6PFA6Mu2iqpI6GyhKZiFyGEjlnVV7xZzHE4l5yqU16l0M3ZkNtr2hICDMV8cJeUA+ASpiGa96zVurmfE54lyy9rVrokJP+KjUHDxYSUyLbMeD7d+iavt32w2PNoztBxxWe8fqxRtAuzLLW1uWe59MBLhRsjJPM5xg6V3XeBFgQvcpcpfScOvDPWbioDLZuZd1Cp1xxutTgz1E+0uHdSwZbcMSL7iUFVqFOLco0moKdfyCCEequOmqCjVoNkxgpkORoDZxSEK4cTDQrZ+AkqvbmEZoB1bp89TvAoG5HRcxEcBTpPaVNCtQkPdf6JJhcKMnSkDpg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=H96zqhXk; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=srs0=v4nw=5q=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=H96zqhXk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=srs0=v4nw=5q=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d3GJr4VLFz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Nov 2025 11:00:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E3A24363E;
	Sat,  8 Nov 2025 00:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46376C116C6;
	Sat,  8 Nov 2025 00:00:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="H96zqhXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1762560005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WAt2mksIHtC2i3o7CYlpSBU3PXZGrY2JGGi82ePiq/o=;
	b=H96zqhXkDo4gtPRqIDbomfHlsEt58bmjDC9hORkl3+Uf3rlIqKHoWZF7k8bawyuKSfjc4F
	6SdNQzMkcOaNm0QO7ERowScfGbY4T+jBI/abIAjlG4SZsbzeyLCDScM+Bl4teQMOzApifz
	J0y3YrBXb5TY4FRstgnJygjeq5VD3zI=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ad6f9df5 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Sat, 8 Nov 2025 00:00:05 +0000 (UTC)
Date: Sat, 8 Nov 2025 00:59:56 +0100
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
Subject: Re: [PATCH v5 11/34] random: vDSO: Add explicit includes
Message-ID: <aQ6H_GJynrCLCJwY@zx2c4.com>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
 <20251106-vdso-sparc64-generic-2-v5-11-97ff2b6542f7@linutronix.de>
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
In-Reply-To: <20251106-vdso-sparc64-generic-2-v5-11-97ff2b6542f7@linutronix.de>
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 06, 2025 at 11:02:04AM +0100, Thomas Weißschuh wrote:
> Various used symbols are only visible through transitive includes.
> These transitive includes are about to go away.
> 
> Explicitly include the necessary headers.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> Tested-by: Andreas Larsson <andreas@gaisler.com>
> Reviewed-by: Andreas Larsson <andreas@gaisler.com>
> ---
>  lib/vdso/getrandom.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
> index 440f8a6203a69a6462aafee4ad8d5670cef6a353..7e29005aa208b498b68f16d3df80b048dce8ee21 100644
> --- a/lib/vdso/getrandom.c
> +++ b/lib/vdso/getrandom.c
> @@ -7,8 +7,11 @@
>  #include <linux/minmax.h>
>  #include <vdso/datapage.h>
>  #include <vdso/getrandom.h>
> +#include <vdso/limits.h>
>  #include <vdso/unaligned.h>
> +#include <asm/barrier.h>
>  #include <asm/vdso/getrandom.h>
> +#include <uapi/linux/errno.h>
>  #include <uapi/linux/mman.h>
>  #include <uapi/linux/random.h>

Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>

