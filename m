Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5C9327F6A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 14:26:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dq1Hp0bgzz3cbJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 00:26:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=da8PxaQS;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=g+7ZblKh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kroah.com (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=greg@kroah.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256
 header.s=fm3 header.b=da8PxaQS; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=g+7ZblKh; 
 dkim-atps=neutral
X-Greylist: delayed 655 seconds by postgrey-1.36 at boromir;
 Tue, 02 Mar 2021 00:26:03 AEDT
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dq1HH3WL1z2ydG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 00:26:03 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4C0EC5C00EC;
 Mon,  1 Mar 2021 08:15:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 01 Mar 2021 08:15:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=1
 Pe2IyPmY560XOFrxaPfizQCmaqW+xt4WTzJ89t7Qds=; b=da8PxaQSuz53U+9dT
 pfB3wkj51toBqy8Iy7pGVN5w1qzuT2l9G9/N0e2YbLuVdBpTVrAn0WZw43ggFhCr
 i/zZODE4AbmB4QJ7vqE4+DjVF3tBPdQiuZ9rfF0p6+Wimk9x93QdCNRBpOxAa2qP
 LZO5f7NLks8t7qhtGfEK+WhtVr4fJkBFCBjK8ETiMaGptmNmLV2T9+rmGWM7NGHu
 m+6wkOwPglBn2vmbVASlg0X86blmuP7aTyvCbORl96U1LrmP1tK0md9qtPUiNnhL
 YuxUtJ+TyeIpe8E7ugVhlyqdQqLr9Lj7YN5bfdkaQ8FEFLO228REVhIZWGBro5LE
 kEjKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=1Pe2IyPmY560XOFrxaPfizQCmaqW+xt4WTzJ89t7Q
 ds=; b=g+7ZblKhsNLdaEw6RP9H+oSv7IvfdLtk6BSc8kzgbEMNebAgv1zNtkpEm
 aAk2kbeXr2aie/dyLnIn5Y0DwpPU5jVKucanNiAjW++P0B+xaLupw1W5ktQUStH0
 KNXrfDnCPgWyq+ieWSX6WYZyu0jCflKpxxaLUrYTfz4cByidkdLOfWwmOOXpJW1r
 e2YOnp7V0GbR1xbSTXIN6CaAj6r2DuJZFP+/BPQDOXHdhFlUu08eqOhUtcHXJJRN
 aO/tzpAqZgYRx3wCZ/zJs+ErNERYJtzTx4HlttkYqzvBuVZs7FVGhMm2/qtqgA/v
 qKii73V41EcwTmxIdCgXK9mnJRcfg==
X-ME-Sender: <xms:1eg8YK-rPAf68_0L0-L2w_uE7dBE5wXkJ3imu-0MjlLwVVIbpTY10A>
 <xme:1eg8YKtvXuZqpzhp_kndux_01F01lC0XxE2yMnnkuqtaa3caOoJ8NWS0qJS72kV5U
 W18I2QlcMwaCA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleekgdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpedvfffgue
 eiuefhheevheetgfehvdefgeekfeevueejfeeftdetudetiefhheffvdenucffohhmrghi
 nhepkhgvrhhnvghlrdhorhhgnecukfhppeekfedrkeeirdejgedrieegnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghh
 rdgtohhm
X-ME-Proxy: <xmx:1eg8YACGjSHYzLHc7YjNgwD8ex0s_O6itykxFsnshFWPFNQNQvo-wg>
 <xmx:1eg8YCd6iTzUI-jn2lqY-fsT9z5Mmm4EuAROw0qhLnR_1DPKlnG0Yw>
 <xmx:1eg8YPPQf_SkKxvWAieRtewY6V-NajUN6r2j4DJXBYNhGC_-MX3ylg>
 <xmx:1ug8YIbpKsQ75oFbrIxpWpL7GjM5Xw8S-3jH-54_zd3IuG5fGPemmw>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id 39E52108005C;
 Mon,  1 Mar 2021 08:15:01 -0500 (EST)
Date: Mon, 1 Mar 2021 14:14:59 +0100
From: Greg KH <greg@kroah.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH for 5.10] powerpc/32: Preserve cr1 in exception prolog
 stack check to fix build error
Message-ID: <YDzo01MSvxr4CftS@kroah.com>
References: <f6d16f3321f1dc89b77ada1c7d961fae4089766e.1613120077.git.christophe.leroy@csgroup.eu>
 <YCqFn/4YuT+445xW@kroah.com>
 <d0b1ff43-59e0-29a4-1bd0-47bcfff8effa@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0b1ff43-59e0-29a4-1bd0-47bcfff8effa@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, fedora.dm0@gmail.com, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 23, 2021 at 03:39:20PM +0100, Christophe Leroy wrote:
> 
> 
> Le 15/02/2021 à 15:30, Greg KH a écrit :
> > On Fri, Feb 12, 2021 at 08:57:14AM +0000, Christophe Leroy wrote:
> > > This is backport of 3642eb21256a ("powerpc/32: Preserve cr1 in
> > > exception prolog stack check to fix build error") for kernel 5.10
> > > 
> > > It fixes the build failure on v5.10 reported by kernel test robot
> > > and by David Michael.
> > > 
> > > This fix is not in Linux tree yet, it is in next branch in powerpc tree.
> > 
> > Then there's nothing I can do about it until that happens :(
> > 
> 
> It now is in Linus' tree, see https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3642eb21256a317ac14e9ed560242c6d20cf06d9

Now queued up, thanks.

greg k-h
