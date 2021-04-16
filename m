Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 317D4361E49
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 12:54:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMClZ0fpyz3c2p
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 20:54:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iZYVOcCo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=iZYVOcCo; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMCl932WNz2yx9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 20:54:29 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FMCl81mhzz9sPf;
 Fri, 16 Apr 2021 20:54:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618570468;
 bh=w71juXyapLY2HfkoLFGy3st5SAilCYUy4fi+4MSN8g0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=iZYVOcCol2VIJfHXJckS8F8j14xAQvToAZO/wUEtccqzP5pyS1/qpk64L4lNh/Jn8
 g/DdhnFrWRM9PoFR/yZ+fiEP4kJpZT3MsLLrSaK3anAtEubaAqQP7uaRsyU4Til/YT
 W/dgt9Bx44pOEy+G3YVW2wN0DvzOyKv2dlqTqnuAq7xNy/D7KARo3VR5HWA7E88lBV
 DSHpRwWqDFyKbA34lw0tTTJ90yHT5ArR4kuTIzLyQX6MdBMiVTu6pnUIsR3kybsHOe
 aSjAInNRqePkb0iNcDyxJXvU64nGP8G6OQfINpm92iUMm36wPk0OmRGux4WyCyA+x+
 O1N6GMmkb/5+Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: build warning after merge of the powerpc tree
In-Reply-To: <20210415185214.01e1e64f@canb.auug.org.au>
References: <20210415185214.01e1e64f@canb.auug.org.au>
Date: Fri, 16 Apr 2021 20:54:25 +1000
Message-ID: <87o8eeebz2.fsf@mpe.ellerman.id.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Shivaprasad G Bhat <sbhat@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> After merging the powerpc tree, today's linux-next build (powerpc
> allyesconfig) produced this warning:
>
> In file included from include/linux/device.h:15,
>                  from arch/powerpc/include/asm/io.h:27,
>                  from include/linux/io.h:13,
>                  from include/linux/irq.h:20,
>                  from arch/powerpc/include/asm/hardirq.h:6,
>                  from include/linux/hardirq.h:11,
>                  from include/linux/highmem.h:10,
>                  from include/linux/bio.h:8,
>                  from include/linux/libnvdimm.h:14,
>                  from arch/powerpc/platforms/pseries/papr_scm.c:12:
> arch/powerpc/platforms/pseries/papr_scm.c: In function 'papr_scm_pmem_flush':
> arch/powerpc/platforms/pseries/papr_scm.c:144:26: warning: format '%lld' expects argument of type 'long long int', but argument 3 has type 'long int' [-Wformat=]
>   144 |   dev_err(&p->pdev->dev, "flush error: %lld", rc);
>       |                          ^~~~~~~~~~~~~~~~~~~
> include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
>    19 | #define dev_fmt(fmt) fmt
>       |                      ^~~
> arch/powerpc/platforms/pseries/papr_scm.c:144:3: note: in expansion of macro 'dev_err'
>   144 |   dev_err(&p->pdev->dev, "flush error: %lld", rc);
>       |   ^~~~~~~
> arch/powerpc/platforms/pseries/papr_scm.c:144:43: note: format string is defined here
>   144 |   dev_err(&p->pdev->dev, "flush error: %lld", rc);
>       |                                        ~~~^
>       |                                           |
>       |                                           long long int
>       |                                        %ld
>
> Introduced by commit
>
>   75b7c05ebf90 ("powerpc/papr_scm: Implement support for H_SCM_FLUSH hcall")

My bad.

cheers
