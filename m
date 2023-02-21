Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4473669E8C4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Feb 2023 21:04:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLqxK1Blsz3cBm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 07:04:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BVclYZjY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BVclYZjY;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLqwM1BjYz2yMX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 07:03:15 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ADE786119A;
	Tue, 21 Feb 2023 20:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED913C433EF;
	Tue, 21 Feb 2023 20:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677009792;
	bh=7bdliaEPfsjCDV6xIpwIyab1GEF5Nz1Z0DW5eYurXc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BVclYZjYaXSHP2PudRTTSDCs3mO4c6NfLarafmitwDiJ5tiJq/Emq+quDKVwo28JF
	 jxc0X4y5O3rUcT7zJ1oElKbehKPpfylrJDTHecmS7Wiy2aA04BQ9C46Fs2iJ9286Hs
	 BymqeLuXh2LjQza15W0o4FzTXH2wQvK1hxfbgmXnSyB7e0vaZFMyOLkGHXSg2vX76H
	 nAdABK5zSfGHjkStpIWRUdPhJANlBql2TU2+qq3LGOq+cPYMaI488g6NAlgrei48Gw
	 SM0TTb5vL4oTrC+/b0RQI2rVIo31/riAYNs1fCEQc+ftNfT0xzHAWJBBp0hOApkW1J
	 qvxp2mPI4yOJw==
Received: by pali.im (Postfix)
	id EB902708; Tue, 21 Feb 2023 21:03:08 +0100 (CET)
Date: Tue, 21 Feb 2023 21:03:08 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 4/4] powerpc: remove orphaned MPC85xx kernel config
 fragments.
Message-ID: <20230221200308.gu3pwrg7layxzkpt@pali>
References: <20230221194637.28436-1-paul.gortmaker@windriver.com>
 <20230221194637.28436-5-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221194637.28436-5-paul.gortmaker@windriver.com>
User-Agent: NeoMutt/20180716
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
Cc: Li Yang <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tuesday 21 February 2023 14:46:37 Paul Gortmaker wrote:
> None of these have a reference anymore anywhere, such as like this:
> 
>   arch/powerpc/Makefile:  $(call merge_into_defconfig,mpc85xx_base.config,\
> 
> As such, we probably should just clean up and remove them.
> 
> Cc: Scott Wood <oss@buserror.net>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>  arch/powerpc/configs/85xx-32bit.config |   5 -
>  arch/powerpc/configs/85xx-hw.config    | 139 -------------------------
>  arch/powerpc/configs/85xx-smp.config   |   2 -
>  3 files changed, 146 deletions(-)
>  delete mode 100644 arch/powerpc/configs/85xx-32bit.config
>  delete mode 100644 arch/powerpc/configs/85xx-hw.config
>  delete mode 100644 arch/powerpc/configs/85xx-smp.config

This change is likely going to break mpc85xx platform because defconfig
files includes all these files which you are going to remove. For
example in arch/powerpc/Makefile is:

PHONY += mpc85xx_smp_defconfig
mpc85xx_smp_defconfig:
	$(call merge_into_defconfig,mpc85xx_base.config,\
		85xx-32bit 85xx-smp 85xx-hw fsl-emb-nonhw)

And for P2020 boards I'm using mpc85xx_smp_defconfig configuration as
this one compiles SMP kernel, ideal for P2020 which is dual-core SoC.
