Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E962C1B1ECA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 08:29:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495tvY0Rt8zDr7K
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 16:29:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=FehI3aUz; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=14zY5tL4; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495tsQ069PzDqRW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 16:27:37 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9B6865C023D;
 Tue, 21 Apr 2020 02:27:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 21 Apr 2020 02:27:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
 U0K6gEg8l7zD5AG7WoscIKlJqzrFi+C5JrBoVJqFVKo=; b=FehI3aUzViD01nar
 63PxBUTzFCbC6gwPrchdfJ1EpzmuTUflPWEgH3dqFuPXoUn2yHcGuDrY1wdNCqoT
 5aQx/jycl7ovrpTSf4DX5Zk7C1Qts+LfIhiTmHztSOLFp1OuogAiuHbXJMzteTQT
 eiJGeVTZn8FqqZfW/oeIuvWWC8lSlbm+uRp18YIlQLigic3flwycWaIAJAzQIPm7
 1jJk9gDGjTwHYDj5Aen2OqOLM4uL+lWWCWxcxtMAwy/4mg8+jR4YgWbsPkqGQ6YZ
 ueSi96TDk5lmYhFSoIPnhAfC0/IpN7JHA7R1EA1lI6qc6sROf0DENX29WLUopeHM
 La2rjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=U0K6gEg8l7zD5AG7WoscIKlJqzrFi+C5JrBoVJqFV
 Ko=; b=14zY5tL4VRN+lvW3BW/4eC13+8OQbLnPjM1OGT82qAV7ee7StN/X8vIwm
 ua5cMuYS/gyRuS0jo1hh+mfVVFK/Az15tC5KcbgrWc5ds9j27mBMOQ5oBQcpLPXG
 WIvH1uQwQ3PmZd8BGULSyv8tEa++0LGrS1MDnKAvJNAO00AoDduIuncyTW5PyLfF
 0CPh/+F5NxtbYQ5EsnDZOmPD1uhPpOp1g9aHGfluvhES8qFaOLHSvQJVQnJx9Gal
 JpLlhjHYvWxjPtBSsEEIY3ty4tNwepBX9qYS9PZOB6W2OnVLCde/Otb9CSZWvjBB
 GEpDscvgNKEioKIAePpbRNfY/YE9g==
X-ME-Sender: <xms:VZKeXtkWmNzTehNkZv6VuimcC3xkswifya3XoZJMSg0NYCz5DfpENw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgeeggddutdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdludehmdenucfjughrpefkuffhvfffjghftggfggfgsehtkeertddt
 reejnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicuoehruhhstghurhesrhhush
 hsvghllhdrtggtqeenucfkphepuddvuddrgeehrddvuddvrddvfeelnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhssh
 gvlhhlrdgttg
X-ME-Proxy: <xmx:VZKeXpgXTP5vb6TBfDuHnHQJesaFHBv5cuT7aei8m0dPIts2rJHPFA>
 <xmx:VZKeXoJtiZbVcuh_Nz_rhrEm1-QWCo1RhcM3ZkUCdeuQ8kSsZAUOpQ>
 <xmx:VZKeXuH1EFNcn5-g18kAjXWJkyxLoDnItHam881aMXqtm6YmkxsFaQ>
 <xmx:VpKeXnbW7uKNV1i-EizZshUuRGpBFvZH3Y-5a5h47h118fwzOS-wrg>
Received: from crackle.ozlabs.ibm.com
 (ppp121-45-212-239.bras1.cbr2.internode.on.net [121.45.212.239])
 by mail.messagingengine.com (Postfix) with ESMTPA id 291DF3065C5A;
 Tue, 21 Apr 2020 02:27:31 -0400 (EDT)
Message-ID: <09bca39c000c8280d97738c497a2ff8859ad6868.camel@russell.cc>
Subject: Re: [PATCH v7 7/7] [NOT TO BE MERGED] Export sysrq_mask
From: Russell Currey <ruscur@russell.cc>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Michael Ellerman
 <mpe@ellerman.id.au>
Date: Tue, 21 Apr 2020 16:27:29 +1000
In-Reply-To: <e0921561-f73f-8bc4-ac9c-2ec31d485568@c-s.fr>
References: <cover.1587401492.git.christophe.leroy@c-s.fr>
 <f6397e32f9ac69cc8ddd1d566cc385165ced21c8.1587401492.git.christophe.leroy@c-s.fr>
 <e0921561-f73f-8bc4-ac9c-2ec31d485568@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-04-21 at 08:10 +0200, Christophe Leroy wrote:
> Le 20/04/2020 à 18:56, Christophe Leroy a écrit :
> > Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> > ---
> >   drivers/tty/sysrq.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
> > index 5e0d0813da55..a0760bcd7a97 100644
> > --- a/drivers/tty/sysrq.c
> > +++ b/drivers/tty/sysrq.c
> > @@ -74,6 +74,7 @@ int sysrq_mask(void)
> >   		return 1;
> >   	return sysrq_enabled;
> >   }
> > +EXPORT_SYMBOL_GPL(sysrq_mask);
> 
> I don't understand, why does snowpatch still reports it can't test
> the 
> patch once whereas this patch fixes the upstream build ?

We don't bother building the patch if the base build fails.  The
majority of the time this is extra unnecessary work, and from what I've
seen most build upstream build breaks aren't fixed from within the
powerpc tree.

We might change this in future because you're right, it should show
that this patch fixes the build.

> 
> Christophe
> 
> 
> 
> >   
> >   /*
> >    * A value of 1 means 'all', other nonzero values are an op mask:
> > 

