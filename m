Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB9EFD69B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 07:56:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DpzN1RGJzF3Cn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 17:56:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kroah.com (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=greg@kroah.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kroah.com header.i=@kroah.com header.b="XTu40iHZ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="rwebm+p/"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Dp7J4rvkzF6MT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 17:18:03 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 4D0BB21EA0;
 Fri, 15 Nov 2019 01:17:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 15 Nov 2019 01:17:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm2; bh=N
 bqOVsrNoCerzzM8tP/k+vGmEotVgTY0Dod/wynSVuc=; b=XTu40iHZ1sFAZD6sc
 HXyb1Zlxm2zRqjXi1iEJOplRFNxkVkHla1ziwbUQ7whTChnP9Du3/MnuZClqWyGo
 BH+YKkPajCn9lD2sLxA39HH4dCyAoCFkSIzispMcByHxtrtesoCtvCqoEuH749K0
 IlsiVDlXm9n6TZWzuMHG85XzU7srQDi52GYxBNVGQIJftu6FJCAXEiYWqL3O2dqr
 Cbb3HMb50jCvTiu+vZh/zl3G2BlyeDiNmrXUxHySW/JvJgJMUfV75k2PHg8aNxvN
 L4sISqplN7GwfQf/EEOAlxKCvEsVFKDoYYPEu8cLdxTRjk5bzz8E5cPH9Aa9bOIR
 fP8vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=NbqOVsrNoCerzzM8tP/k+vGmEotVgTY0Dod/wynSV
 uc=; b=rwebm+p/DBLgIDMXbLSZ7hAq0wOC6O3LLvthDLCDI1PLGfD1FkrJCqs3O
 MxrdBiLjogxEDwslQumHhggldeE5eBXjpGaQ3xW2IdnqhYAdv8D50ae6CJDijb9k
 oB9ci6A7WX+QRw6h32j8w3WRI9vlgQQZMwAQW7nOlkP9Xt8vDlrjvdMw3PuzW1tj
 Txk5LZnyPmXdMYHq/g8trcVxo3b4fiX26T9gPWWAkuT/7KgrLcV7J6xSBP4XeOlx
 p6TmVChpfgyzyFgH6kgFuxeZqEGC0psdiPIzvHkUywmFObGrzpLVn4a1QJODntEu
 C9iY2MZp6YMtPkEGgV7LJ+Z7DMXmQ==
X-ME-Sender: <xms:F0POXT3S1-IsNOT0GohRIHuLR7jZNJWxIf-h4NKwn6YVkPlLKzrnNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudefgedgleefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjggfsehtkeertddtredunecuhfhrohhmpefirhgv
 ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepuddtgedrudefvddrud
 ehtddrleelnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtgho
 mhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:F0POXXnojXlcBrJ6OoY4IsubO2of7ARmzURTRbzk7EZ9JKy1rxJBOw>
 <xmx:F0POXS-D06gtGqGI88ziUF1Ud3ByaCEdqe8NY2cuze-r-dsrGHkNTQ>
 <xmx:F0POXdIi2GT2omUd6U7v32J-3wDRUR3wNG3wzxBWllW_mUjML7SYtw>
 <xmx:F0POXWLZncozDwTTUUcWU-HEcHHCtInZDrmvfidppTAt3nuCuz1Dsw>
Received: from localhost (unknown [104.132.150.99])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9D8CB3060062;
 Fri, 15 Nov 2019 01:17:58 -0500 (EST)
Date: Fri, 15 Nov 2019 14:17:54 +0800
From: Greg KH <greg@kroah.com>
To: Andrew Donnellan <ajd@linux.ibm.com>
Subject: Re: [4.14] Backport request: powerpc/perf: Fix IMC_MAX_PMU macro
Message-ID: <20191115061754.GA1046179@kroah.com>
References: <607891ba-9a95-fe0c-6185-2cb2406870f3@linux.ibm.com>
 <024b2b46-d802-5d1c-2f52-0fe12d93f6c5@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <024b2b46-d802-5d1c-2f52-0fe12d93f6c5@linux.ibm.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 15, 2019 at 04:43:05PM +1100, Andrew Donnellan wrote:
> On 15/11/19 4:37 pm, Andrew Donnellan wrote:
> > Dear stable team
> > 
> > Please backport the following patch.
> > 
> > Commit: 7029d1eb0c2c7ee093dc625c679fc277c8eb623b
> >      ("powerpc/perf: Fix IMC_MAX_PMU macro")
> 
> Whoops, this was a local SHA - I meant
> 73ce9aec65b17433e18163d07eb5cb6bf114bd6c.
> 
> There's also 110df8bd3e418b3476cae80babe8add48a8ea523 which is an additional
> fix.

Both now queued up, thanks.

greg k-h
