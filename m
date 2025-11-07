Return-Path: <linuxppc-dev+bounces-13953-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CD4C420A8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 08 Nov 2025 00:49:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d3G4L43LFz30Qk;
	Sat,  8 Nov 2025 10:49:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762559362;
	cv=none; b=U9d3JYDo6SLsDrAep8+bbyhQBPQGLsfT6tB84tQjIk5DtWDTB6vHyBIRYvyn1ojZeup+IyapgrU98kTexcSdE/WoOLPNrXZPkA35mycyyLGJ6hcNQOBa+ydfKIjfzMNG4FDumNlSSUDd8/b2EsyRGZ6aKMRrmugjxRxMwzX2U0QJsnAnlF6/EbRfRqNof16Kb0SRvvRu7gn81Zb/jzWUTjf8fptj/Rzpq3XxA2aqMH8eZTzELJBBmKABvnRqKKY+G2hhhKU3Xu2CRBJuiLwjd/iH/7Nic9qMQEi5zK3ZjzTe/vH4CkN8Oz7xroj9Gk/IcR80dgK6IvH8nYzyWHxNcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762559362; c=relaxed/relaxed;
	bh=EgCN+CIqo23Evapy9nPfZZAXleUVC2Dk/cc/M1oETCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUI8yeEtwYBfWc9LhhylcXCGm6MWPH3swibsDnwhfR9NcBtUyKf+dMiLiJDqzM98GJPDw0Wr4KfJ5VUJk4FsSsy1RTL3U+P50Xk05TeUxAwdpBvp1k8lftF/+a1x6CpcYHIQg+VNuDMZeSXq4yGeItaJjW4lKq4dCnL9uCZ28Os8OKqNPZLYaqtBAyqgYf9iIvyM/LzhYP3Crw8OZE1CmwAHyGPLlp6T5ZZ4NAfDzdYRd8gg0ta2D38dv1IRDXX0IYUR0AzLIaOPzG2nHrmUgTBjRoj0kqhZlNmAthroAyQtUO18bGgNhTFxQ7NScNMwMJrDHiJ28lfxRdyU1iKHiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=VFMr7YXz; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=srs0=+xqp=5p=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=VFMr7YXz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=srs0=+xqp=5p=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d3G4K4fzMz2ynf
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Nov 2025 10:49:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B70543B54;
	Fri,  7 Nov 2025 23:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE43BC116C6;
	Fri,  7 Nov 2025 23:49:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="VFMr7YXz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1762559354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EgCN+CIqo23Evapy9nPfZZAXleUVC2Dk/cc/M1oETCk=;
	b=VFMr7YXz0YdOy9h3LlvjYqU3KbmnbcSRSqpN6T7MqLnCqro2SnYVPoIVICgpBVh+87YyRg
	9dzJJ3MDUWfqUtuNl1dgiRShMNyq3Fwmqzg34nGR2E2IuEGq24p7hNAIzT7xV3f5QTI89R
	cYqHVoWaUgWjL/cIGfTUBwt8XdwXpLk=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6e251a1e (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 7 Nov 2025 23:49:13 +0000 (UTC)
Date: Sat, 8 Nov 2025 00:49:05 +0100
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
Message-ID: <aQ6FcWxZFD80yWye@zx2c4.com>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
 <20251106-vdso-sparc64-generic-2-v5-16-97ff2b6542f7@linutronix.de>
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
In-Reply-To: <20251106-vdso-sparc64-generic-2-v5-16-97ff2b6542f7@linutronix.de>
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 06, 2025 at 11:02:09AM +0100, Thomas Weißschuh wrote:
> These includes are not used, remove them.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> Tested-by: Andreas Larsson <andreas@gaisler.com>
> Reviewed-by: Andreas Larsson <andreas@gaisler.com>
> ---
>  drivers/char/random.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/char/random.c b/drivers/char/random.c
> index b8b24b6ed3fe436c8102968392278d5cb5544f06..3860ddd9527930780d5c13cd4742fbc3c27acc42 100644
> --- a/drivers/char/random.c
> +++ b/drivers/char/random.c
> @@ -57,9 +57,7 @@
>  #include <crypto/chacha.h>
>  #include <crypto/blake2s.h>
>  #ifdef CONFIG_VDSO_GETRANDOM
> -#include <vdso/getrandom.h>
>  #include <vdso/datapage.h>
> -#include <vdso/vsyscall.h>
>  #endif
>  #include <asm/archrandom.h>
>  #include <asm/processor.h>

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

