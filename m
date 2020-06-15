Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 590011F9BEF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 17:25:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lwBC635jzDqVF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 01:25:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=boo.tc
 (client-ip=64.147.123.18; helo=wnew4-smtp.messagingengine.com;
 envelope-from=bootc@boo.tc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=boo.tc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=boo.tc header.i=@boo.tc header.a=rsa-sha256 header.s=fm3
 header.b=BccoYPbI; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=aeJz+Rkj; 
 dkim-atps=neutral
X-Greylist: delayed 627 seconds by postgrey-1.36 at bilbo;
 Tue, 16 Jun 2020 01:11:32 AEST
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lvtX3HvKzDqcQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 01:11:31 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id EA22277B;
 Mon, 15 Jun 2020 11:00:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 15 Jun 2020 11:00:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boo.tc; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=P
 ccZvu+Gt7OCthnxR+MZrD1Iw39LpCBjZ9xKOCERDys=; b=BccoYPbIUFqxIiqbn
 U6kOyvvZHcSanh6EBVQxQa0xfYn0yfGuXAkTyvl7niajQUK6Xs38RUBkA88uSiqw
 bN/eke+lohfGYAd/BYHzHN6hOnRIT4ChmYyIBzhcRpebIgRTq9X7lx5AwNDCweDQ
 STxNLUQSGEMvKvyNicDdGWC+vzlSfW1e+qDm4DjIT7e3TKp2I072gQiBw/IwNbv5
 hz4V/5GX6n+vpEI612YUJ3DcAIHBqRaYLVr6WG3C+vbk8C0VZkDV59uLAupLWmbr
 twtMh4ZYoexr1WHsPWnAA0GvgMx749qceqoRNreaoncvRMY4k2Yxbiwj+2Kz9tgn
 i5Haw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=PccZvu+Gt7OCthnxR+MZrD1Iw39LpCBjZ9xKOCERD
 ys=; b=aeJz+RkjjyHuJy8EejdX6MrGFalmgytdtKKF3a3rjnbq+Pwh7SBQbtYXv
 uSBhspvmF5nqOXUHozvyyrc3L4elr9uBrYzVtrxGXM14/b+jB0jJMWHNW4hRt6Bn
 hD3vt+ry96kTBee8qMqWPWUFWX1iUHa24D33jTkrQKEP5fgNVzU/xNP2egRlE9J6
 Bi+8NgRMRubCRd9YlSo3ofQjD4uyUtbuwsXvbr3xJInxRz/cso6ujLA8IFFDCgcD
 WDcHwh7CdnOlMhAXKwLSuPMC/Xlc1DCN4mePaNUt4Xh/5Mmm6Mug+38U7WxrVqNv
 0eW1fz1Mgi7l2gMINkDQDhKB3NQNw==
X-ME-Sender: <xms:Jo3nXi5UEfuvoJ_5sSs4WMg_TjuFzh1DyFcPxK3C-FVaLYt3tYUhzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudeikedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdehmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddt
 feejnecuhfhrohhmpeevhhhrihhsuceuohhothcuoegsohhothgtsegsohhordhttgeqne
 cuggftrfgrthhtvghrnhepffejieduveekhfduueejvedvvdfhueetjeeukeduvefhhfdt
 ieejjedtjeehkeeknecukfhppeekuddrudekjedrheehrdekkeenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhothgtsegsohhordhttg
X-ME-Proxy: <xmx:J43nXr5HYD5etWF65vYEKO2b6sjwsXobmnTG9Md19ouWdQwhllq_hg>
 <xmx:J43nXheY--2Dh-5daFo3fgw3McdZR7ZuwoeZWzOTLNftmsZG4NyZcA>
 <xmx:J43nXvLX28r3QKJVtwzVIZyr6_F6HXul8-TC7xwtTcjdDtdSk2JnpQ>
 <xmx:J43nXno9g0u0YMJkbvShqSDgA-BNKludOxIsTia-npdeQZ7sEJBy9mGpz34>
Received: from [81.187.55.88] (ripley.boo.tc [81.187.55.88])
 by mail.messagingengine.com (Postfix) with ESMTPA id C7F5D3280069;
 Mon, 15 Jun 2020 11:00:53 -0400 (EDT)
Subject: Re: [PATCH] scsi: target/sbp: remove firewire SBP target driver
To: Finn Thain <fthain@telegraphics.com.au>
References: <01020172acd3d10f-3964f076-a820-43fc-9494-3f3946e9b7b5-000000@eu-west-1.amazonses.com>
 <alpine.LNX.2.22.394.2006140934520.15@nippy.intranet>
 <7ad14946-5c25-fc49-1e48-72d37a607832@boo.tc>
 <alpine.LNX.2.22.394.2006150919110.8@nippy.intranet>
From: Chris Boot <bootc@boo.tc>
Autocrypt: addr=bootc@boo.tc; prefer-encrypt=mutual; keydata=
 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
 1QBDj3S+cCP/8Pe5l3n1B7V4SkVPBQs/H/ClB6o=
Message-ID: <8da0c285-d707-a3d2-063e-472af5cc560f@boo.tc>
Date: Mon, 15 Jun 2020 16:00:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.LNX.2.22.394.2006150919110.8@nippy.intranet>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 Nicholas Bellinger <nab@linux-iscsi.org>, target-devel@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux1394-devel@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org,
 Stefan Richter <stefanr@s5r6.in-berlin.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15/06/2020 00:28, Finn Thain wrote:
> On Sun, 14 Jun 2020, Chris Boot wrote:
> 
>> I expect that if someone finds this useful it can stick around (but 
>> that's not my call).
> 
> Who's call is that? If the patch had said "From: Martin K. Petersen" and 
> "This driver is being removed because it has the following defects..." 
> that would be some indication of a good-faith willingness to accept users 
> as developers in the spirit of the GPL, which is what you seem to be 
> alluding to (?).

If you're asking me, I'd say it was martin's call:

> SCSI TARGET SUBSYSTEM                                                          
> M:      "Martin K. Petersen" <martin.petersen@oracle.com>                      
[...]
> F:      drivers/target/                                                        
> F:      include/target/                                                        

>> I just don't have the time or inclination or hardware to be able to 
>> maintain it anymore, so someone else would have to pick it up.
>>
> 
> Which is why most drivers get orphaned, right?

Sure, but that's not what Martin asked me to do, hence this patch.

-- 
Chris Boot
bootc@boo.tc
