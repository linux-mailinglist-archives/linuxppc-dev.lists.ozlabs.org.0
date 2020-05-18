Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5821D7547
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 12:34:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Qb440gLczDqX1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 20:34:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=jikos@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=rScxuk1u; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Qb240PhMzDqFL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 20:32:59 +1000 (AEST)
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A6956207ED;
 Mon, 18 May 2020 10:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589797977;
 bh=FoTk8zGbyQhLWnQF+6rWBcKNCczuvfeAk/nbxrmO/Ag=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=rScxuk1uhjeA7R0gJmBaGzaZdn7rhVquPJ/JiSKJMjHCd5r110YAA7L/YaRRR7ikB
 MXZfmn0V0xzCp1hRp7QzeFoobRXgnV3FsmZw1hTGWnlFw6NUBpU6DJ/Lp7zsG8otb0
 ld2XsF3bHH1bD0pLERZGzeN/FYLSzqqoSN6WWHKc=
Date: Mon, 18 May 2020 12:32:53 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/sysdev: fix compile errors
In-Reply-To: <nycvar.YFH.7.76.2005181228480.25812@cbobk.fhfr.pm>
Message-ID: <nycvar.YFH.7.76.2005181232140.25812@cbobk.fhfr.pm>
References: <20200302053801.26027-1-wenhu.wang@vivo.com>
 <62251ec1-dd42-6522-dcb2-613838cd5504@c-s.fr>
 <nycvar.YFH.7.76.2005181228480.25812@cbobk.fhfr.pm>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 wenhu.pku@gmail.com, Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 WANG Wenhu <wenhu.wang@vivo.com>, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 18 May 2020, Jiri Kosina wrote:

> > > Include linux/io.h into fsl_85xx_cache_sram.c to fix the
> > > implicit-declaration compile errors when building Cache-Sram.
> > > 
> > > arch/powerpc/sysdev/fsl_85xx_cache_sram.c: In function
> > > ‘instantiate_cache_sram’:
> > > arch/powerpc/sysdev/fsl_85xx_cache_sram.c:97:26: error: implicit declaration
> > > of function ‘ioremap_coherent’; did you mean ‘bitmap_complement’?
> > > [-Werror=implicit-function-declaration]
> > >    cache_sram->base_virt = ioremap_coherent(cache_sram->base_phys,
> > >                            ^~~~~~~~~~~~~~~~
> > >                            bitmap_complement
> > > arch/powerpc/sysdev/fsl_85xx_cache_sram.c:97:24: error: assignment makes
> > > pointer from integer without a cast [-Werror=int-conversion]
> > >    cache_sram->base_virt = ioremap_coherent(cache_sram->base_phys,
> > >                          ^
> > > arch/powerpc/sysdev/fsl_85xx_cache_sram.c:123:2: error: implicit declaration
> > > of function ‘iounmap’; did you mean ‘roundup’?
> > > [-Werror=implicit-function-declaration]
> > >    iounmap(cache_sram->base_virt);
> > >    ^~~~~~~
> > >    roundup
> > > cc1: all warnings being treated as errors
> > > 
> > > Fixed: commit 6db92cc9d07d ("powerpc/85xx: add cache-sram support")
> > > Signed-off-by: WANG Wenhu <wenhu.wang@vivo.com>
> > 
> > Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
> 
> As this doesn't seem to have been picked up for linux-next yet, I am 
> picking it up now.

Only now I've noticed that this is actually a dead code o_O as this file 
can't be built by any combination of config options. So I am dropping the 
patch again, but why do we keep it in the tree in the first place?

-- 
Jiri Kosina
SUSE Labs

