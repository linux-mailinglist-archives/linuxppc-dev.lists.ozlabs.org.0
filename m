Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 075A76988B8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 00:20:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHDZz5whZz3f4C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 10:20:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GWXmQL/R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GWXmQL/R;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHDTJ1sn0z3f8k
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 10:15:48 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C8BA5B82427;
	Wed, 15 Feb 2023 23:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E0F3C433EF;
	Wed, 15 Feb 2023 23:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676502943;
	bh=OPn98kKcj/M/4ixhfckcLtxaNT3VAVS3WKPh941pI2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GWXmQL/Ri20fzECOS3eoj/3kijVPi/KP0RDkT+7vpNlJR7wtM0OHtBiXpHGWc8HEE
	 IXINgLOWt1jtqUtw46S5EG6PartrVJpLuu1uR/iUEv1mSM+Bsct0DnifWv1dwgLpld
	 RVoOIOC4IKt5oIu75DucglNRc7B8VbonoFFu+w11dJY8uPLweXzpI7vG8Gih2fCx5M
	 +nDPciXvFovGIaQ/0ZR5Br95y4fQSX9xJUICgXq8i6yuyVzAt8xhwqejVmG4x69xH1
	 5eVY9v7w37Edpd71hyGW6vHlQ7PAe/WlHJl3YSgmY9w93qvxLCCbRkWd96y6G1pBcs
	 kGZhCAelyJd+w==
Received: by pali.im (Postfix)
	id 2AF1CB98; Thu, 16 Feb 2023 00:15:40 +0100 (CET)
Date: Thu, 16 Feb 2023 00:15:40 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Scott Wood <oss@buserror.net>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 5/5] powerpc/epapr: Don't use wrteei on non booke
Message-ID: <20230215231540.vmskpw33l2ctyp4c@pali>
References: <38a8d765ed9149bc6b5484a7142e3bc59ffa3b1a.1671475543.git.christophe.leroy@csgroup.eu>
 <b29c7f1727433b003eae050e44072741c8ac223b.1671475543.git.christophe.leroy@csgroup.eu>
 <20221220202111.jpxsyviplco6sbsm@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221220202111.jpxsyviplco6sbsm@pali>
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

On Tuesday 20 December 2022 21:21:11 Pali Rohár wrote:
> On Monday 19 December 2022 19:46:00 Christophe Leroy wrote:
> > wrteei is only for booke. Use the standard mfmsr/ori/mtmsr
> > when non booke.
> > 
> > Reported-by: Jan-Benedict Glaw <jbglaw@lug-owl.de>
> > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > ---
> > Not sure this is needed at all, the commit that introduced the code says it is for e500, but there's no such limitation in Kconfig. Maybe we should limit all the file to CONFIG_PPC_E500
> 
> This ePAPR code is according to ePAPR v1.1. So it does not have to be
> e500 specific. But is there anything else in this category?

Scott Wood: Do you know any details about it?

> > ---
> >  arch/powerpc/kernel/epapr_hcalls.S | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/arch/powerpc/kernel/epapr_hcalls.S b/arch/powerpc/kernel/epapr_hcalls.S
> > index 69a912550577..033116e465d0 100644
> > --- a/arch/powerpc/kernel/epapr_hcalls.S
> > +++ b/arch/powerpc/kernel/epapr_hcalls.S
> > @@ -21,7 +21,13 @@ _GLOBAL(epapr_ev_idle)
> >  	ori	r4, r4,_TLF_NAPPING	/* so when we take an exception */
> >  	PPC_STL	r4, TI_LOCAL_FLAGS(r2)	/* it will return to our caller */
> >  
> > +#ifdef CONFIG_BOOKE_OR_40x
> >  	wrteei	1
> > +#else
> > +	mfmsr	r4
> > +	ori	r4, r4, MSR_EE
> > +	mtmsr	r4
> > +#endif
> >  
> >  idle_loop:
> >  	LOAD_REG_IMMEDIATE(r11, EV_HCALL_TOKEN(EV_IDLE))
> > -- 
> > 2.38.1
> > 
