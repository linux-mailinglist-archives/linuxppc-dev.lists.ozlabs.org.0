Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3B03E3310
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 06:08:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GhTNq1KsRz3dH1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 14:08:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=SIe7dfEK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=wout1-smtp.messagingengine.com (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=SIe7dfEK; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GhTNL5WZBz308G
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Aug 2021 14:08:16 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id C0AC8320093E;
 Sat,  7 Aug 2021 00:08:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sat, 07 Aug 2021 00:08:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=p5fqgZ
 FW/PCKi3209KBZ+VDyS35Wj51tuUmUgG58EWM=; b=SIe7dfEK7QfFr8q+cskWE0
 wzFjTwm9DVqgQ5TGjQtf3sNcY9MkEkWuiqdYbTdjpTFydG1x1IrjqsHAip88grNq
 rWS1Qeh9EkWofHVXNxh1FKZYTz7Yk6ES8NlPipkBjjSlVq0bP4viViJNNBtlsbLj
 k0sRV7UcZSi1IbxxS6nrzHjUvpXPBWp1HIuWRazD8p3rOX8KWYewL8hxv7a7XuQy
 +MJNM0LY9GHqAjicCMlWSg5CeF2Gt8svYD0HdddYo07BWki296NZrvo0uJhWzLeH
 fsmmlyzpvF7xehigJWUJGSFP4ZfbfPkFSHo8YB6PmsHucN9bBIZFu73Ec7w0m07g
 ==
X-ME-Sender: <xms:LAcOYaTJQ6If8gfSb1_w6j6iXwS8-kHrTKr1Gg1bdx0njTxHkZfJCg>
 <xme:LAcOYfxOLGFtdCOKrROAzSN-jk47GVAgo2Ge_3XpIxVshfbFlTwcGtixnJTMGGooe
 m_Kjl0ZJi3dLjggMIo>
X-ME-Received: <xmr:LAcOYX1hhH5QYnyWC4HWXZDWRFP8S_fgatCs2fmy5sylC5FOO6X84bcz9EydyB-LiUNBvQY9hlWJaZWWEQenV7-_0Qdf8l66A2Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjedvgdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
 rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
 gvrhhnpeffudfhgeefvdeitedugfelueegheekkeefveffhfeiveetledvhfdtveffteeu
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfth
 hhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:LAcOYWA8E1hwR9EkX8jN3lDkE6q9DGbqwsr3VC6mAd60QGVOWLNoHw>
 <xmx:LAcOYTi5Mu2EWv-1YMXqViUa_2n2Sd99uJ5CrNn0A1SBKkXGW5427g>
 <xmx:LAcOYSrJh2Hgn0A3Zw0Luvg2qb8SGDD4QD1MvJqtorgqK4gCjkUECQ>
 <xmx:LQcOYWu1dl6EnMfVvQYfcCyrk4X-pN3IDN5ia2PhJ_1o5zrCy6IkhQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Aug 2021 00:08:09 -0400 (EDT)
Date: Sat, 7 Aug 2021 14:08:06 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Stan Johnson <userm57@yahoo.com>
Subject: Re: Debian SID kernel doesn't boot on PowerBook 3400c
In-Reply-To: <06ddf5ab-b0c9-1c64-92ea-a9cfbfb9f3b0@yahoo.com>
Message-ID: <f23ddb5b-90cb-2ba9-f043-66d475311b7@linux-m68k.org>
References: <60841a75-ed7c-8789-15db-272bf43055f5.ref@yahoo.com>
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
 <c031a1e7-fde7-7c39-d9ff-404157cfc0df@linux-m68k.org>
 <ee724da4-4a5b-65c3-9c1c-d78954fdc7b4@csgroup.eu>
 <73921a8e-6d76-7ae9-1ba2-811966df5179@linux-m68k.org>
 <06ddf5ab-b0c9-1c64-92ea-a9cfbfb9f3b0@yahoo.com>
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
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Fri, 6 Aug 2021, Stan Johnson wrote:

> $ egrep '(CONFIG_PPC_KUAP|CONFIG_VMAP_STACK)' .config
> CONFIG_PPC_KUAP=y
> CONFIG_PPC_KUAP_DEBUG=y
> CONFIG_VMAP_STACK=y
> $ strings vmlinux | fgrep "Linux version"
> Linux version 5.13.0-pmac-00004-g63e3756d1bd ...
> $ cp vmlinux ../vmlinux-5.13.0-pmac-00004-g63e3756d1bd-1
> 
> 1) PB 3400c
> vmlinux-5.13.0-pmac-00004-g63e3756d1bd-1
> Boots, no errors logging in at (text) fb console. Logging in via ssh and
> running "ls -Rail /usr/include" generated errors (and a hung ssh
> session). Once errors started, they repeated for almost every command.
> See pb3400c-63e3756d1bdf-1.txt.
> 
> 2) Wallstreet
> vmlinux-5.13.0-pmac-00004-g63e3756d1bd-1
> X login failed, there were errors ("Oops: Kernel access of bad area",
> "Oops: Exception in kernel mode"). Logging in via SSH, there were no
> additional errors after running "ls -Rail /usr/include" -- the errors
> did not escalate as they did on the PB 3400.
> See Wallstreet-63e3756d1bdf-1.txt.
> 
...
> $ egrep '(CONFIG_PPC_KUAP|CONFIG_VMAP_STACK)' .config
> CONFIG_PPC_KUAP=y
> CONFIG_PPC_KUAP_DEBUG=y
> # CONFIG_VMAP_STACK is not set
> $ strings vmlinux | fgrep "Linux version"
> Linux version 5.13.0-pmac-00004-g63e3756d1bd ...
> $ cp vmlinux ../vmlinux-5.13.0-pmac-00004-g63e3756d1bd-2
> 
> 3) PB 3400c
> vmlinux-5.13.0-pmac-00004-g63e3756d1bd-2
> Filesystem was corrupt from the previous test (probably from all the
> errors during shutdown). After fixing the filesystem:
> Boots, no errors logging in at (text) fb console. Logging in via ssh and
> running "ls -Rail /usr/include" generated a few errors. There didn't
> seem to be as many errors as in the previous test, there were a few
> errors during shutdown but the shutdown was otherwise normal.
> See pb3400c-63e3756d1bdf-2.txt.
> 
> 4) Wallstreet
> vmlinux-5.13.0-pmac-00004-g63e3756d1bd-2
> X login worked, and there were no errors. There were no errors during
> ssh access.
> See Wallstreet-63e3756d1bdf-2.txt.
> 

Thanks for collecting these results, Stan. Do you think that the 
successful result from test 4) could have been just chance?

It appears that the bug affecting the Powerbook 3400 is unaffected by 
CONFIG_VMAP_STACK.

Whereas the bug affecting the Powerbook G3 disappears when 
CONFIG_VMAP_STACK is disabled (assuming the result from 4 is reliable).

Either way, these results reiterate that "Oops: Kernel access of bad area, 
sig: 11" was not entirely resolved by "powerpc/32s: Fix napping restore in 
data storage interrupt (DSI)".
