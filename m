Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D81784038
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 14:01:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm1 header.b=jD3zGBoH;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=vZazz0SU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVScl3Gtzz3c1L
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 22:01:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm1 header.b=jD3zGBoH;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=vZazz0SU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kroah.com (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=greg@kroah.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 533 seconds by postgrey-1.37 at boromir; Tue, 22 Aug 2023 22:00:53 AEST
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVSbn4X9tz2yhS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 22:00:53 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 9BF963200495;
	Tue, 22 Aug 2023 07:51:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 22 Aug 2023 07:51:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1692705113; x=1692791513; bh=WX
	idqPU1bEX5huuNnsnICqlNlGqjuUA0dGv6wQlW+Nc=; b=jD3zGBoHdWaHl76sqq
	NU/zn/UbZ15Ip8IgsSg3CHpN16uxVxQ3NY+FL2z5fmJBuJiPcJeIzK1ACxkRrqHT
	Y3u8aLyJLpjTglwIi+RXVn/NV/Z62fEhuAXcDiYOQAx5hX75jJBOdLXfCPhYfdBG
	/QuhXLXluSg4DCm1bBQrfdhkWRW7l5FYJRuWM1O2y3HtsakXiGDfF+3Bd1aEPtsK
	b71fCf6pMTqpRWBZMKzGCrxlcSM+Zy/FpzyGU6XBBrwHsJ/A+WGwlYk8dsCIvPUm
	t8m60OprdX6tr3nfa5avChlsE69MQjs006prWqOwq7uxCPy36KGHTIE7Fd1VaUvD
	nWNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1692705113; x=1692791513; bh=WXidqPU1bEX5h
	uuNnsnICqlNlGqjuUA0dGv6wQlW+Nc=; b=vZazz0SU7Wqtq+xBaWOn7smcdWfwY
	/d9Ioa2GRv2lv8SYKKTB9/JMBJ6kHOC0NN4eWW7cFIn7obxLyVQG3/2ApYntf9ge
	R7d2iDKnAQPvXRsIUQFThQIGjrf+pRrCIEkbdpyFDMfiBdLV3XzYtzCEbV/MJHSl
	3MNaRsDKYoMjJl2qTQyqxPe5ITc3jeMx9xogfnNqKfq7+7uC7JYsUlDOhXa8GpOY
	Sllr0Ec70pvcmEYxHXB8iQmHy5PKRtS6iVFGs9gw2T2twrgaYxzhbBGAFHfC4ydJ
	q2lfjMqjjepMnrl6vBtbShjir985kpImAry3h4Z67ybjcL9TZsSLWe9kA==
X-ME-Sender: <xms:WKHkZHpXR2DcKNKP_4TTVkHWFKNoVbfT-_R8nIpJ-Dk8xYEFHUESHA>
    <xme:WKHkZBr3Zc-YtDYiblsWPRoqBWifLItk_2jVXrqaG6YcTwA6eOy3GhT8vqZEg6T2Z
    qgK6ZYvr2JRBQ>
X-ME-Received: <xmr:WKHkZEPqwzl2LuPM3uXeRSJf3OpSWRmR6bEBAtYHWJRjqXIoNl9V9cVTG_YmvRRUJkDRL0SLzoBDXwfMv-Z90l58lnEHtBw_XxPrOQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddvuddggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
    evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:WKHkZK5civFd6y7xxQTKgXbWH__L2ow2h8cSqoRNw-iPhZ_I_zhKkg>
    <xmx:WKHkZG6O2bfIrNBuK7bEgzlsjEr6EahbEyr2vI8c9QeXPjT0-MiXWw>
    <xmx:WKHkZCgV5-_fu-t2DHIabRH7F4lkN-TTGMYecPJos9Db1-N51UhkeQ>
    <xmx:WaHkZDyYmLuXJgccN1SCRXM2urvaDWLcHh1Vq2c_Sds9HCYwDeZ1Vg>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Aug 2023 07:51:52 -0400 (EDT)
Date: Tue, 22 Aug 2023 13:51:50 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the tty tree with the powerpc tree
Message-ID: <2023082218-pecan-chef-e4bc@gregkh>
References: <20230818145826.00c7ead1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230818145826.00c7ead1@canb.auug.org.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 18, 2023 at 02:58:26PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tty tree got a conflict in:
> 
>   arch/powerpc/include/asm/fs_pd.h
> 
> between commits:
> 
>   e6e077cb2aa4 ("powerpc/include: Declare mpc8xx_immr in 8xx_immap.h")
>   fecc436a97af ("powerpc/include: Remove mpc8260.h and m82xx_pci.h")
>   fbbf4280dae4 ("powerpc/8xx: Remove immr_map() and immr_unmap()")
>   7768716d2f19 ("powerpc/cpm2: Remove cpm2_map() and cpm2_unmap()")
> 
> from the powerpc tree and commit:
> 
>   c2d6c1b4f034 ("serial: cpm_uart: Use get_baudrate() instead of uart_baudrate()")
> 
> from the tty tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> Note that after all the above are applied, it looks like this file can
> be removed completely as nothing in the tree includes it any more.

Thanks for the notice, I'll let the ppc developers remove it as it's in
their tree.

thanks,

greg k-h
