Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA37A6527C8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Dec 2022 21:22:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nc7K63y92z3c6h
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Dec 2022 07:22:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G34FYUrt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G34FYUrt;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nc7JD5rRRz2x9d
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Dec 2022 07:21:16 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 72946B8169F;
	Tue, 20 Dec 2022 20:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30C9C433EF;
	Tue, 20 Dec 2022 20:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671567674;
	bh=tHGz5rErrLmMZswKrJCJRdthAcEj2+aPBGfougwOjec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G34FYUrtRYg9MSVFa2eP9SoW49WUoAfMSA93CucR6zljg7QDsS84SO1TNSTUIzVH/
	 IjhHz74cSFBc29V5/aeYy6VOJ5UiraLLtZOmeXgA0cFiAMnWW3wb8U5jL2EldZOLyM
	 r4CZLbRhS/wfbmfXQe3CzlAPoNdvTWkakIloSgLeBPAYw5AHMIEhuD/BiGn5wm/EP1
	 /OPHUgnF8nsLLkyM93hRTz3uTGfjrT8FCmp9yzAafKpnRzKm2Ku2J+mFF/xw9q+wso
	 rKAzUNgg9fv/fky3GLR7872JeJPYKj3BZJqHOLbIzhNgynQQgo/nm2YUiXQyqNFfAy
	 +0RJ9t8vIqfYg==
Received: by pali.im (Postfix)
	id B11D7963; Tue, 20 Dec 2022 21:21:11 +0100 (CET)
Date: Tue, 20 Dec 2022 21:21:11 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 5/5] powerpc/epapr: Don't use wrteei on non booke
Message-ID: <20221220202111.jpxsyviplco6sbsm@pali>
References: <38a8d765ed9149bc6b5484a7142e3bc59ffa3b1a.1671475543.git.christophe.leroy@csgroup.eu>
 <b29c7f1727433b003eae050e44072741c8ac223b.1671475543.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b29c7f1727433b003eae050e44072741c8ac223b.1671475543.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, jbglaw@lug-owl.de, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday 19 December 2022 19:46:00 Christophe Leroy wrote:
> wrteei is only for booke. Use the standard mfmsr/ori/mtmsr
> when non booke.
> 
> Reported-by: Jan-Benedict Glaw <jbglaw@lug-owl.de>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> Not sure this is needed at all, the commit that introduced the code says it is for e500, but there's no such limitation in Kconfig. Maybe we should limit all the file to CONFIG_PPC_E500

This ePAPR code is according to ePAPR v1.1. So it does not have to be
e500 specific. But is there anything else in this category?

> ---
>  arch/powerpc/kernel/epapr_hcalls.S | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/epapr_hcalls.S b/arch/powerpc/kernel/epapr_hcalls.S
> index 69a912550577..033116e465d0 100644
> --- a/arch/powerpc/kernel/epapr_hcalls.S
> +++ b/arch/powerpc/kernel/epapr_hcalls.S
> @@ -21,7 +21,13 @@ _GLOBAL(epapr_ev_idle)
>  	ori	r4, r4,_TLF_NAPPING	/* so when we take an exception */
>  	PPC_STL	r4, TI_LOCAL_FLAGS(r2)	/* it will return to our caller */
>  
> +#ifdef CONFIG_BOOKE_OR_40x
>  	wrteei	1
> +#else
> +	mfmsr	r4
> +	ori	r4, r4, MSR_EE
> +	mtmsr	r4
> +#endif
>  
>  idle_loop:
>  	LOAD_REG_IMMEDIATE(r11, EV_HCALL_TOKEN(EV_IDLE))
> -- 
> 2.38.1
> 
