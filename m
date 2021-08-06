Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E36F3E2797
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 11:43:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gh0sp1CKxz3dBq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 19:43:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=HMYhoaBK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=wout3-smtp.messagingengine.com (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=HMYhoaBK; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gh0sL1l22z3bY0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 19:43:16 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 1200032007F9;
 Fri,  6 Aug 2021 05:43:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 06 Aug 2021 05:43:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=uXSb5z
 vRdpBBpoKWZGGIcly1IPaevPzI84pliwA3HDM=; b=HMYhoaBK3wjMq9iruOPm/t
 Opih3W37xmD0j6F/epTb23FtHwnjXAxA5xJe1Sm2X6TM90Yxie/QdhgcnPThWdPO
 hq379pStG3oKGqJhWeelpUbXXkLgMCQBbAD5NTFIzI8zTuOkmTP8HN9kfUoF7WHj
 fqEj/LulR8xfb9OswmHQQMlgjULIT+lwizxx0PK/fz/DS4g6zfADSKDPTw56IQS9
 +x/NUiSbWZ0osANuMKxu+koXN4hXJX5MW7QaScgz75Z8YJXm/z7Z78YWlPcLkQbh
 JMEki/eSzjRRGU6/Jh9WCJZAZLtigbFffSKquTHA76iARM/fMbSJz+7dcLkSSIrw
 ==
X-ME-Sender: <xms:LgQNYYegRbY7_KYoTnMaydxJeHs4tJ2JpyEWWqXtcoODPkWE9nxLEg>
 <xme:LgQNYaO_SIByPQj8xhZtgq-pKt5jD8pbZf152FkNfahWjZah0un_o5ZjFqDGENDG3
 sBjPIEVKA0Obf_ydNI>
X-ME-Received: <xmr:LgQNYZhiyvbt6DTLxRzXmA5ZNcy7-Ft2C3OKq7wnMqOu99_Y-btaIcySz5w0GPSQ3sT1F9P6ChzzozKDVzRATbc3qyKcgRAnpnU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjedugddujecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
 rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
 gvrhhnpeffjedujeekudejueelvdduhfffgfejieehfeevffduheeuueelkeeltedvieef
 ffenucffohhmrghinhepthigthdrohhnvgenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:LgQNYd_2w-GQ9eyxGCp9qkc1GQrRfEm27Yj_xMUvMuO77URCiudBXg>
 <xmx:LgQNYUs7FGQA852bNblf8lcjkS3B6oy057-y-SwA87cE-gBln2oZpg>
 <xmx:LgQNYUE97f2qjV86Fr_yjFiZABTUQXHek7-s4vw-mjxzX4B-r-AhUg>
 <xmx:LwQNYd5GEVuVJYTYrYU5c0LnKykoh1AsxAq673r8g9F7aEsZUse50w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Aug 2021 05:43:08 -0400 (EDT)
Date: Fri, 6 Aug 2021 19:43:03 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Debian SID kernel doesn't boot on PowerBook 3400c
In-Reply-To: <ca0ded24-9fa0-fae4-89cf-20fc1959f69d@csgroup.eu>
Message-ID: <c031a1e7-fde7-7c39-d9ff-404157cfc0df@linux-m68k.org>
References: <60841a75-ed7c-8789-15db-272bf43055f5.ref@yahoo.com>
 <cd7c931c-a578-a2ff-0632-7767a0e90bb9@yahoo.com>
 <fbd08736-9738-35cf-3b47-b5c9c455c552@csgroup.eu>
 <b84bb7ff-2dfb-0ae6-6eee-dd3c40661982@yahoo.com>
 <fac98e72-14a1-802e-8343-9bed9a6eaedc@csgroup.eu>
 <c535cc2b-3f45-2415-1e81-32ea24b4ec@linux-m68k.org>
 <b8ae2ca4-56e8-e39a-27a0-f0ee2fea1511@csgroup.eu>
 <f6a3746e-80ef-a6b3-925a-69aed01ba98c@linux-m68k.org>
 <b6fe0c8e-8af5-e0e9-629b-fce61750ec2e@yahoo.com>
 <4ac28304-4519-fb8a-a868-e8c79cb5f9e4@yahoo.com>
 <7532219a-4fd0-416-6365-304033fa6abd@linux-m68k.org>
 <9659419d-da9e-5aa6-ffbb-758748e2d6e9@linux-m68k.org>
 <2eb2b452-51d5-c495-3ffe-896c62a1633f@yahoo.com>
 <da9c16b4-70bc-6fe0-ad5c-8b226ca08b23@yahoo.com>
 <cc5a203f-9df5-a0b-a4d7-bcaddde777d5@linux-m68k.org>
 <6ea50cd7-84d3-5180-0430-1211aaf0e308@yahoo.com>
 <2619d78-e8f-334a-20c0-2a60c936a293@linux-m68k.org>
 <ca0ded24-9fa0-fae4-89cf-20fc1959f69d@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: debian-powerpc@lists.debian.org, linuxppc-dev@lists.ozlabs.org,
 Stan Johnson <userm57@yahoo.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 6 Aug 2021, Christophe Leroy wrote:

> > > > > 
> > > > > Can you check if they DO NOT happen at preceding commit c16728835~
> > > > > 
> > > 
> > > $ git checkout c16728835~
> > > Previous HEAD position was c16728835eec powerpc/32: Manage KUAP in C
> > > HEAD is now at 0b45359aa2df powerpc/8xx: Create C version of kuap
> > > save/restore/check helpers
> > > $ git am ../message.mbox
> > > warning: Patch sent with format=flowed; space at the end of lines might be
> > > lost.
> > > Applying: powerpc/32: Dismantle EXC_XFER_STD/LITE/TEMPLATE
> > > $ cp ../dot-config-powermac-5.13 .config
> > > $ make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- -j4 clean
> > > olddefconfig vmlinux
> > > 
> > > Linux version 5.12.0-rc3-pmac-00077-gc9f6e8dd045
> > > 
> > > 3) PB 3400c
> > > Hangs at boot (Mac OS screen)
> > > 
> > > 4) Wallstreet
> > > X fails, errors in console log (different than test 2), see
> > > Wallstreet_console-2.txt.
> > > 
> > 
> > This log shows that the errors "xfce4-session[1775]: bus error (7)" and
> > "kernel BUG at arch/powerpc/kernel/interrupt.c:49!" happen prior to commit
> > c16728835eec ("powerpc/32: Manage KUAP in C").
> 
> As mentionned by Nic, this is due to r11 being cloberred. For the time being
> the only r11 clobber identified is the one I have provided a fix for. I'm
> wondering whether it was applied for all further tests or not.
> 

Your fix was applied to this build with "git am ../message.mbox".

> ...
> > > 
> > > > 
> > > > > Could you test with CONFIG_PPC_KUAP and CONFIG_PPC_KUAP_DEBUG
> > > ...
> > > 
> > > $scripts/config -e CONFIG_PPC_KUAP
> > > $ scripts/config -e CONFIG_PPC_KUAP_DEBUG
> > > $ make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- -j4 clean
> > > olddefconfig vmlinux
> > > $ grep CONFIG_PPC_KUAP .config
> > > CONFIG_PPC_KUAP=y
> > > CONFIG_PPC_KUAP_DEBUG=y
> > > 
> > > Linux version 5.12.0-rc3-pmac-00078-g5cac2bc3752
> > > 
> > > 9) PB 3400c
> > > Hangs at boot (Mac OS screen)
> > > 
> > > 10) Wallstreet
> > > X failed at first login, worked at second login, one error in console
> > > log ("BUG: Unable to handle kernel instruction fetch"), see
> > > Wallstreet_console-5.txt.
> > > 
> > 
> > One might expect to see "Kernel attempted to write user page (b3399774) -
> > exploit attempt?" again here (see c16728835eec build above) but instead
> > this log says "Oops: Kernel access of bad area, sig: 11".
> 
> Maybe the test should be done a second time. As r11 is garbage it may or 
> may not be a user address. If it is a user address the we get "Kernel 
> attempted to write user page". If it is a random kernel address, we 
> likely get "Kernel access of bad area" instead.
> 

Your fix was applied here also.
