Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B847CA2D48
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 05:24:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KPx00FJjzF0WF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 13:24:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=russell.cc
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="CoDhq78H"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Ghxsu9D6"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KPtw5DJLzF0Pv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 13:22:58 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id EFC2421B74;
 Thu, 29 Aug 2019 23:22:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 29 Aug 2019 23:22:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm2; bh=
 s8i/QhPR38U6LZIlXMpuiFvKQllTENh2MCPCjD2IL7Q=; b=CoDhq78HHjid0ZS1
 3uPTuipmGCyFY8U5G+Ao7cRImXPf01QPSTNLoFJbumyl4e/C/WUshfyiDU1dNIqQ
 ZzU1i2LETGghdj6MAZqVzo61sIi4ajJ0WkNp/bnGqd8Ddmi2CytVz1BJanFfpd+y
 FqykdezSVLWM7j/kU3g55IhBXaQZ7kesg1oSowBBEYRsXHtwyMAEclqR+QJhYFxi
 rRBa92NoiXeXmjTIFjdJs9xeCfjaZxwn47b3iKUWvTP0x+lAgbxt/XHLRjTnjJgf
 VkN40/KytJp1YNUNrEasZzdJcBS2Rhxlfwp0tsgV/O5WVZMbZ5hELyoelXE9tCEH
 Zoz8Uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=s8i/QhPR38U6LZIlXMpuiFvKQllTENh2MCPCjD2IL
 7Q=; b=Ghxsu9D6mtowIYe5xNXII1SC80RmI4QreFIHGtRI1n+rEyJowh6gDfIfA
 na/OBa6unCESw92LiOuUa8A/8bh4AzlR62xuEnpJmSoHC4QX9Ekpzk10Dip2GKLR
 mJW+Ko5YchJ1/BZyWmFVPlIze6lHmPDsMWAY5jaxluJp2/TNcN+SMp7bZE8jchAD
 EEyvDnRgeu0ZOOUa6dMOxIMmS0SjJQLlVUbfQoNjx4gmmcMEcU6XyLjTIqnP01sz
 Az+kJ7inCSP3TS63jhhnaMIX9eQl+X2FkBjF3a6JgQP+FKkHh08t9vuUe59z0jtJ
 8LESceRq2Iw3BzsiEL5guaYQ5zTdw==
X-ME-Sender: <xms:jZZoXSbzqvWiz7OZEFgfQpshmamkaNG69TQUBOlCeLSeqiwgfX4h4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeifedgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfedtmdenucfjughrpefkuffhvfffjghftggfggfgsehtjeertddt
 reejnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicuoehruhhstghurhesrhhush
 hsvghllhdrtggtqeenucfkphepuddvvddrleelrdekvddruddtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehruhhstghurhesrhhushhsvghllhdrtggtnecuvehluhhsthgvrhfuih
 iivgeptd
X-ME-Proxy: <xmx:jZZoXRuY8Ax7Kid73dWZIjfs3yyTKiaYVDppJRd3SNTGyffd1FnSPA>
 <xmx:jZZoXfsO_Fz2JzmYe1TCulG5y00EJEqQHJHAtRU5_BA9VPYBHdJz7A>
 <xmx:jZZoXWeCv14vyAeAvSiABAMDAvJnI3IYtieRl1eZszBPPnXmMOQ1yQ>
 <xmx:jZZoXTaSC2Igo86GwP56n2tkTYkLWMt5hYfGpIjYpAKWFX_-VBdYHg>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id DB5EF80059;
 Thu, 29 Aug 2019 23:22:51 -0400 (EDT)
Message-ID: <14925a214dbedf78eda85bb8ccf4ae9ad9fd150d.camel@russell.cc>
Subject: Re: [PATCH v2] powerpc/mm: Implement STRICT_MODULE_RWX
From: Russell Currey <ruscur@russell.cc>
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 30 Aug 2019 13:22:48 +1000
In-Reply-To: <6bf5e5e3-1dfe-05fe-d736-7c846b8ac6f6@c-s.fr>
References: <20190614055013.21014-1-ruscur@russell.cc>
 <6bf5e5e3-1dfe-05fe-d736-7c846b8ac6f6@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: kernel-hardening@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-08-28 at 15:54 +0200, Christophe Leroy wrote:
> Any plan to getting this applied soon ?

Hey Christophe,

I'm still working on it.  Had to rework it for a few reasons, and it
exposed a bug somewhere else.  Hope to have another version out soon.

- Russell

> 
> Christophe

