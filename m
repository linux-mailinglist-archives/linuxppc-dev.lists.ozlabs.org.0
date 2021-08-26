Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AEC3F8AAF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 17:06:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwR4x0my8z3c5n
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 01:06:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QEOwnB73;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=QEOwnB73; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwR4H4rHlz2xKY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 01:05:51 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GwR4G6tkqz9sRN;
 Fri, 27 Aug 2021 01:05:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629990351;
 bh=P1ggop+Wpzp+p41o8DUX9QEAna0imAFZLWPlXGklRsw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=QEOwnB73olOBHQnq/LjP8y5hNffJV5EeYWomV9fF5oGjaYfLwsgZ1c+DgCHrnl8NS
 OeJS2xQP8dix5Si+cDCbO26RiHn59ETQMvSk+GQfnpyUkUOLdNd2zzXIqTc6mPYCcU
 lNKdJBD397QHWtD/cNooKNODw7lJ7WwQixmem+peP1QRHzhHQuKeyCIITxPiE+zE5A
 hg5rGvBTKBsOi20XBG6UKIEqbrNse8ynqSSGVIqG+ZQQNniQKrmorJxY87EEOK29s2
 DLC9A7VjJeQ0Y/nLxpNjCQmuiKx9ZlcvGWO5wh5j33ADCSduoYEEQRj5SPfjRzT+At
 h0bmhfgs2fpGA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [GIT PULL] retire legacy WR sbc8548 and sbc8641 platforms
In-Reply-To: <20210824174209.GB160508@windriver.com>
References: <20210824174209.GB160508@windriver.com>
Date: Fri, 27 Aug 2021 01:05:50 +1000
Message-ID: <87pmu09rg1.fsf@mpe.ellerman.id.au>
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
Cc: Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Paul Gortmaker <paul.gortmaker@windriver.com> writes:
> This is unchanged from the original wr_sbc-delete branch sent in January,
> other than to add the Acks from Scott in July, and update the baseline.
>
> Built with ppc64 defconfig and mpc85xx_cds_defconfig and mpc86xx_defconfig
> just to make sure I didn't fat finger anything in the baseline update.

Thanks for following up on this.

I ended up cherry-picking the patches into my branch. I like to keep my
next based on rc2, and merging this would have pulled in everything up
to rc7 into my branch.

I don't think you were planning to merge this branch anywhere else, so
it shouldn't make any difference, but let me know if it's a problem.

It should appear here soon:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=next


cheers
 

> Original v1 text follows below, from:
>
> https://lore.kernel.org/lkml/20210111082823.99562-1-paul.gortmaker@windriver.com
>
> It would be nice to get this in and off our collective to-do list.
>
> Thanks,
> Paul.
>
>   ---
>
> In v2.6.27 (2008, 917f0af9e5a9) the sbc8260 support was implicitly
> retired by not being carried forward through the ppc --> powerpc
> device tree transition.
>
> Then, in v3.6 (2012, b048b4e17cbb) we retired the support for the
> sbc8560 boards.
>
> Next, in v4.18 (2017, 3bc6cf5a86e5) we retired the support for the
> 2006 vintage sbc834x boards.
>
> The sbc8548 and sbc8641d boards were maybe 1-2 years newer than the
> sbc834x boards, but it is also 3+ years later, so it makes sense to
> now retire them as well - which is what is done here.
>
> These two remaining WR boards were based on the Freescale MPC8548-CDS
> and the MPC8641D-HPCN reference board implementations.  Having had the
> chance to use these and many other Fsl ref boards, I know this:  The
> Freescale reference boards were typically produced in limited quantity
> and primarily available to BSP developers and hardware designers, and
> not likely to have found a 2nd life with hobbyists and/or collectors.
>
> It was good to have that BSP code subjected to mainline review and
> hence also widely available back in the day. But given the above, we
> should probably also be giving serious consideration to retiring
> additional similar age/type reference board platforms as well.
>
> I've always felt it is important for us to be proactive in retiring
> old code, since it has a genuine non-zero carrying cost, as described
> in the 930d52c012b8 merge log.  But for the here and now, we just
> clean up the remaining BSP code that I had added for SBC platforms.
>
> --- 
>
> The following changes since commit e22ce8eb631bdc47a4a4ea7ecf4e4ba499db4f93:
>
>   Linux 5.14-rc7 (2021-08-22 14:24:56 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/paulg/linux.git wr_sbc-delete-v2
>
> for you to fetch changes up to d44e2dc12ea2112e74cdd25090eeda2727ed09cc:
>
>   MAINTAINERS: update for Paul Gortmaker (2021-08-24 08:19:01 -0400)
>
> ----------------------------------------------------------------
> Paul Gortmaker (3):
>       powerpc: retire sbc8548 board support
>       powerpc: retire sbc8641d board support
>       MAINTAINERS: update for Paul Gortmaker
>
>  MAINTAINERS                                 |   1 -
>  arch/powerpc/boot/Makefile                  |   1 -
>  arch/powerpc/boot/dts/fsl/sbc8641d.dts      | 176 -----------------
>  arch/powerpc/boot/dts/sbc8548-altflash.dts  | 111 -----------
>  arch/powerpc/boot/dts/sbc8548-post.dtsi     | 289 ----------------------------
>  arch/powerpc/boot/dts/sbc8548-pre.dtsi      |  48 -----
>  arch/powerpc/boot/dts/sbc8548.dts           | 106 ----------
>  arch/powerpc/boot/wrapper                   |   2 +-
>  arch/powerpc/configs/85xx/sbc8548_defconfig |  50 -----
>  arch/powerpc/configs/mpc85xx_base.config    |   1 -
>  arch/powerpc/configs/mpc86xx_base.config    |   1 -
>  arch/powerpc/configs/ppc6xx_defconfig       |   1 -
>  arch/powerpc/platforms/85xx/Kconfig         |   6 -
>  arch/powerpc/platforms/85xx/Makefile        |   1 -
>  arch/powerpc/platforms/85xx/sbc8548.c       | 134 -------------
>  arch/powerpc/platforms/86xx/Kconfig         |   8 +-
>  arch/powerpc/platforms/86xx/Makefile        |   1 -
>  arch/powerpc/platforms/86xx/sbc8641d.c      |  87 ---------
>  18 files changed, 2 insertions(+), 1022 deletions(-)
>  delete mode 100644 arch/powerpc/boot/dts/fsl/sbc8641d.dts
>  delete mode 100644 arch/powerpc/boot/dts/sbc8548-altflash.dts
>  delete mode 100644 arch/powerpc/boot/dts/sbc8548-post.dtsi
>  delete mode 100644 arch/powerpc/boot/dts/sbc8548-pre.dtsi
>  delete mode 100644 arch/powerpc/boot/dts/sbc8548.dts
>  delete mode 100644 arch/powerpc/configs/85xx/sbc8548_defconfig
>  delete mode 100644 arch/powerpc/platforms/85xx/sbc8548.c
>  delete mode 100644 arch/powerpc/platforms/86xx/sbc8641d.c
