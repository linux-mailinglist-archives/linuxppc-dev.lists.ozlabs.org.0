Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B24639737
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 17:26:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKHDm3Dk7z3f66
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 03:26:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OvRffICA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OvRffICA;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKHCm2hR2z3f85
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 03:25:56 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E19D8B81B50;
	Sat, 26 Nov 2022 16:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D6DC433D6;
	Sat, 26 Nov 2022 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669479952;
	bh=mE9FFLOOig/5PFiEBuQVk0ubKR5cL+zh40Pb80IT9JQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OvRffICAcwcyAjRtwbO/v4dHjbFTfGUxJNG5TUu4ZxkgZ3aQtSLzkNaDAeRcwNUD9
	 zDp9+L85ut+iaUEIb08kYdRVYefZm6T8yo6Djzbuxzaux3fDhjXvmHCstHzHQIW5qv
	 m3D//k3nmUh2bqYc7XVv8/wLO1hcwySZCllorD3pgVtD39GQ9p/340Arq2OR8Ric5P
	 zl2fhpKRVbkaq0fIW/be67iS+tN2yqaqU9msDFVPYlLh2z9W8Iv8eeCCDcl+yQQIoX
	 pMfRloVCkrZaVT5v3IXs8+4Uhh5o3si90Uw8TxeqeCV+gssU60paDQlH7UOroeN4FX
	 kkA8lxvmtxd5w==
Received: by pali.im (Postfix)
	id 1D0FF7B2; Sat, 26 Nov 2022 17:25:50 +0100 (CET)
Date: Sat, 26 Nov 2022 17:25:50 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 2/7] powerpc/85xx: Mark mpc85xx_ds_pic_init() as static
Message-ID: <20221126162550.r4rhg5ud2e5vxzot@pali>
References: <20220819191557.28116-1-pali@kernel.org>
 <20220819191557.28116-3-pali@kernel.org>
 <fd9c174e-2c89-7e11-9e68-d6044b7eab21@csgroup.eu>
 <20220926094706.km22rqzuuulvfssq@pali>
 <20221016110529.76bcgq2v2h4pg2of@pali>
 <3111f16b-2e6d-c46f-67e9-6cb5fada4cc7@csgroup.eu>
 <20221101232503.qymzj7dypsehafvj@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221101232503.qymzj7dypsehafvj@pali>
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
Cc: Sinan Akman <sinan@writeme.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wednesday 02 November 2022 00:25:03 Pali Rohár wrote:
> On Sunday 16 October 2022 16:59:53 Christophe Leroy wrote:
> > Hello,
> > 
> > Le 16/10/2022 à 13:05, Pali Rohár a écrit :
> > > Hello Christophe! Do you have any other comments for this patch series?
> > 
> > I'm AFK for two weeks, but as far as I remember I don't have any more 
> > comments.
> 
> Hello! When you are back, could you look at my feedback to your comments?

PING?

> > > 
> > > On Monday 26 September 2022 11:47:06 Pali Rohár wrote:
> > >> On Monday 26 September 2022 09:43:55 Christophe Leroy wrote:
> > >>> Le 19/08/2022 à 21:15, Pali Rohár a écrit :
> > >>>> Function mpc85xx_ds_pic_init() is not used out of the mpc85xx_ds.c file.
> > >>>>
> > >>>> Signed-off-by: Pali Rohár <pali@kernel.org>
> > >>>
> > >>> This patch should be squashed into patch 1.
> > >>
> > >> No problem. Just to explain that I split those changes into different
> > >> patches because they touch different files and different board code.
> > >> And I thought that different things should be in different patches.
> > >>
> > >>>> ---
> > >>>>    arch/powerpc/platforms/85xx/mpc85xx_ds.c | 2 +-
> > >>>>    1 file changed, 1 insertion(+), 1 deletion(-)
> > >>>>
> > >>>> diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ds.c b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
> > >>>> index f8d2c97f39bd..9a6d637ef54a 100644
> > >>>> --- a/arch/powerpc/platforms/85xx/mpc85xx_ds.c
> > >>>> +++ b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
> > >>>> @@ -54,7 +54,7 @@ static void mpc85xx_8259_cascade(struct irq_desc *desc)
> > >>>>    }
> > >>>>    #endif	/* CONFIG_PPC_I8259 */
> > >>>>    
> > >>>> -void __init mpc85xx_ds_pic_init(void)
> > >>>> +static void __init mpc85xx_ds_pic_init(void)
> > >>>>    {
> > >>>>    	struct mpic *mpic;
> > >>>>    #ifdef CONFIG_PPC_I8259
