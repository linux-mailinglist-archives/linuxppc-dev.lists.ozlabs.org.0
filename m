Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6FF112C7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 07:52:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vktw0PjyzDqV9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 15:52:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=russell.cc
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="NSlRPYIQ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="XTknv/fy"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vksS4v2WzDqNt
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 15:51:23 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id B71BC665;
 Thu,  2 May 2019 01:51:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 02 May 2019 01:51:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
 z3feKxzzz6GlsK4M3kbZV3st+zoBxa0Qgkb2ifjb1q0=; b=NSlRPYIQaF1OraSR
 xcacuU09eS01nt4VLBKmY4fDGFqxEyfWy0WTw5pcfQ15xfiMTCqNszOzlb2sw4mE
 x3gW7siJFzlEBG0HSXwYGB2m5oO4HIMWGd/Sa2yqlkzz3+hEYO7ik7JN6kae/H7k
 7jbU9RI1j2c5ZP9+rFcXN2b0HDm3Nu1m+S23WcHFUY0hflxq28ia8qg3ouwiWGig
 DiyQr1qStyrCYhmlQWtjQj1v08WWVGFVMnJ+QCdvmod3W8d6X1PVMA4nkOsj5TXf
 D+InKhPMSGJ7WjLQ6TdWrBZrMTmEHj4Xa7tqeXWp9wGvXHT4ULqe7qLdRZXt7CbK
 GNa0Rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=z3feKxzzz6GlsK4M3kbZV3st+zoBxa0Qgkb2ifjb1
 q0=; b=XTknv/fy84XvsvbwGTCleNXYwRgF7XX8xVxCm1SrGz7nMwdVnwJGgMySD
 GsVl75RHHAnyQkdHp1bMIsmJk6WDBHDZLRbjF7ZD6Gt3qq0xxc7WG/f57Y8e5/DK
 RyFW1GByar7A6KZtEJX1LCxUBdbJikUQAR8ZCBBwVCCD4z5hLaL5PVrRSyi6w1ma
 amWt2fu8zvJbI1vbY5ZZPjjHD3dxDJUdeq/QdaCXNFUdCPuRRl53168hnUWLOA6U
 XBG+Hlu4xte3bC15uNK1qq0T9LNPsL7rkUsJTZCxDOnMVEnLSnir7WdrM12ZJ3cU
 CGO/C7WeIUOJKblGIGRKUrSys6w/w==
X-ME-Sender: <xms:WIXKXLUqgcsSyvO__HmzAIVKlCgzf7Fh9A3Wx0Xmi30BmlUvKlfexw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieekgdeludcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdeftddmnecujfgurhepkffuhffvffgjfhgtfggggfesthejredttder
 jeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruhhssh
 gvlhhlrdgttgeqnecukfhppeduvddvrdelledrkedvrddutdenucfrrghrrghmpehmrghi
 lhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttgenucevlhhushhtvghrufhiii
 gvpedt
X-ME-Proxy: <xmx:WIXKXKUd_Ym7OZMyxtq6_EQCIKqxjiR5Gwk9AiEuYnTX1eNKW8baYg>
 <xmx:WIXKXJK9N8Zu7IgFwKEaqZBKrbL3s251cIZfeOBGcciJGnuFap6Bdg>
 <xmx:WIXKXCC4wl_EwqwYNfP6fJOPBwBvkMMbJQTIBdZFQvznW5DmUz32jQ>
 <xmx:WYXKXJz-RdvpWAv_N5beimdUx01IqkgTYYOrtgS7TsBIS9-b3mXJuw>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 608DAE448F;
 Thu,  2 May 2019 01:51:18 -0400 (EDT)
Message-ID: <6f3c93698669da36cb6bb354394a1f63c93a58cc.camel@russell.cc>
Subject: Re: [PATCH 2/2] powerpc/mm: Warn if W+X pages found on boot
From: Russell Currey <ruscur@russell.cc>
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 02 May 2019 15:51:15 +1000
In-Reply-To: <673532fb-cd09-748f-e936-14c0cab854b1@c-s.fr>
References: <20190424063958.24559-1-ruscur@russell.cc>
 <20190424063958.24559-2-ruscur@russell.cc>
 <8e659a8f-af3f-e889-3f7a-560178c1f7b1@c-s.fr>
 <ca5e1db5fca5c12ca69d7810d575a437ae39ec87.camel@russell.cc>
 <673532fb-cd09-748f-e936-14c0cab854b1@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.1 
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
Cc: Julia.Lawall@lip6.fr, rashmica.g@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> > > > +	if (radix_enabled())
> > > > +		st.start_address = PAGE_OFFSET;
> > > > +	else
> > > +		st.start_address = KERN_VIRT_START;
> > > 
> > > KERN_VIRT_START doesn't exist on PPC32.
> > > 
> > > Christophe
> > > 
> > Thanks a lot for the review!  Applied all your suggestions.  What
> > should I use on PPC32 instead?
> 
> Indeed it looks like KERN_VIRT_START is defined as 0 for PPC32 at
> the 
> top of ptdump.c, which look strange to me.
> 
> I guess PAGE_OFFSET should be the good value for KERN_VIRT_START on
> PPC32.
> 
> Christophe

git blame says you put it there :) I'll set it to PAGE_OFFSET instead
of zero.  Cheers

- Russell

