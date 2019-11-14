Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03400FC006
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 07:05:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47D9vN2BcHzF6nB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 17:05:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kroah.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=greg@kroah.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kroah.com header.i=@kroah.com header.b="VgztDA7/"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Z8ISBTB6"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47D9qH6D9jzF3qv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 17:01:56 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 8665321C7D;
 Thu, 14 Nov 2019 01:01:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 14 Nov 2019 01:01:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=P34i8Vk22fZh5W87Zhn2aJDzg9L
 3ER9bQFHPFDXr/e0=; b=VgztDA7/XKCAAQkDgAq4Lv+Jtjy/nfjKoTxhxmdvMQj
 dQ+Xzb2WI9Wq9NXBmFM1TG9HANUpOgqS420E+EFlA85gk2AJkcmLTkOnpYBR2lrG
 fAeU2/7q6hZS1tAP3IcrPjDvA5uH+SgMOups9Z6C0zde90rkkhuchkezdgcr6Kot
 a9ANPu/TRDEj8NoGaZogzodycRnO3CPhGJdqRcDGwBXNZM9TFPTRWzq85QpQAXQC
 n6bXGJR4l5jojaHXZxzByUC0D8cRRpZkHmWR0G0usX+OR8A6/q+Y66UKVjaymFET
 jVyoCl6ifbMxOt8m6s7Ztmd+aKwvOhM4OTWIPR62IWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=P34i8V
 k22fZh5W87Zhn2aJDzg9L3ER9bQFHPFDXr/e0=; b=Z8ISBTB6u8RFjk65DmhH1s
 86rTOS45V6oVlxnAterMJESNp6ZNMA3Qrf+2LtLcMoEihtj9j/0npUtsG9U6Wtbo
 3eEr44MNi4Nn0aLrc2cp+yVGVyqHHC4E+2J+5Mhsw0idZDrrvIhyttK5yFEQtOa5
 WBoiLu66eQb5QkLZIshU4i6k2XrFCJFyn4lLlKRHJC0iDyOKISyI44/OcCw6VKpa
 KqWHtkBQaEky6YS082FZS4ozH8rI6p4lCWk1r2Iz0kBmt2SoZKN95hyxsjEB73Bv
 HlAxBomMXEQEOitrxvwEpqqz37LaqAZec3ZPsVxpHmE0izvbvA1n4C/pyujPWRyQ
 ==
X-ME-Sender: <xms:0O3MXcInk08wZGy0Yhv85fVUU57N0_cSQXIaQCnjkyZw-57TFVXFKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudefvddgledvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecukfhppeduvdegrddvudelrdefud
 drleefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhen
 ucevlhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:0O3MXQK0gBKs1Q2FQ5keR3Fa47iQsewiFHKQA1o5zHwToxZlNZvMRw>
 <xmx:0O3MXbynfy0g4LAdWSPTZfMS1jCp6O9w_wSsJwq3BiKliBY7Ek3kEg>
 <xmx:0O3MXbLJP1SBKL2p0SAaE7BWktbE3uhUivvwMt-8dk4L2fgB_xY6hw>
 <xmx:0e3MXUloFcuC1QOT0kcboo37s_3-CkF0vnKQ84iWBZ_I8T9jsqYyuA>
Received: from localhost (unknown [124.219.31.93])
 by mail.messagingengine.com (Postfix) with ESMTPA id C8B1E8005A;
 Thu, 14 Nov 2019 01:01:51 -0500 (EST)
Date: Thu, 14 Nov 2019 14:01:49 +0800
From: Greg KH <greg@kroah.com>
To: Andrew Donnellan <ajd@linux.ibm.com>
Subject: Re: [4.4] Backport request: powerpc: Fix compiling a BE kernel with
 a powerpc64le toolchain
Message-ID: <20191114060149.GC353293@kroah.com>
References: <1a589ec5-7df2-788a-e354-50386ba84ffa@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a589ec5-7df2-788a-e354-50386ba84ffa@linux.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 12, 2019 at 07:52:24PM +1100, Andrew Donnellan wrote:
> Dear stable team
> 
> Please backport the following patches.
> 
> Commits:
> 
> - 164af597ce945751e2dcd53d0a86e84203a6d117
>   ("powerpc/Makefile: Use cflags-y/aflags-y for setting endian options")
> 
> - 4dc831aa88132f835cefe876aa0206977c4d7710
>   ("powerpc: Fix compiling a BE kernel with a powerpc64le toolchain")
> 
> Stable tree targeted: 4.4 (applies cleanly)
> 
> Justification: This fixes the build when attempting to compile a BE powerpc
> kernel using a bi-endian toolchain that defaults to LE, which is a common
> setup.
> 
> I have tested that these patches apply cleanly and appear to rectify the
> build failure on my machine.

Now queued up, thanks.

greg k-h
