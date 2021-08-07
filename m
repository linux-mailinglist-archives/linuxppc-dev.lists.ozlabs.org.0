Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7B83E32A9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 04:06:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GhQgG4p9jz3dH3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 12:06:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=HDCMqpUs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=wout3-smtp.messagingengine.com (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=HDCMqpUs; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GhQfp4Q5Pz3079
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Aug 2021 12:05:36 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id E504F3200906;
 Fri,  6 Aug 2021 22:05:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 06 Aug 2021 22:05:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=9OtUkD
 crqroUvmXKY4T5LPXEncAC4ciwZJm4kMvIYe4=; b=HDCMqpUsISzYs7FJ91KSWG
 XI0alkeyJmj4Kldz6FzbPijc+T9HKWzn+4Ghubxk2+FPBZrBbwbBZumNOA3WfZBl
 0z96jJmFLJcY5xE2zRI/2LQ7iNX1PoFfgh7t1uxmn5UNcQF19xDVzG3D98EyCR35
 aGWCTMiHvcor/HqvF8BxRO1DoQ3pZTn45/LnpkJg4Ft7Nh2fO5dvBzeC5xyX9d6J
 o8GicCdit9r3uhV4T+Jr75lClD6teDjnGECsvkRyuo3b4DAdSrhG7kniEMGN5jxQ
 H30AFMyDkMhewfiz83DlKwq+ZzAxmXDc0lnGihRWQxEmsgrkIeRZuBUwCrj5CjrA
 ==
X-ME-Sender: <xms:aeoNYRj3V_kH_SagIi6ryXjo9FfzPxa0TqsZxw1DOrSQ9_p-CwLPBw>
 <xme:aeoNYWDhiRR8dsAref-ErLCwyoTg0qX_PQiUcrHkPFZDOxWosqYsf71C35r3eUv6n
 tO97-LhmfiA6754i-k>
X-ME-Received: <xmr:aeoNYRGOEZte5Uc8batCaptSVHwjmX5NEruCCMScCttAKXrNsZSAjolgJguL99J2Uzc1K8RR815xh5uGAHLM4NX_t1mXRrsFbRM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjedvgdehtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
 rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
 gvrhhnpefgtdegudfgheehhfeugeeffefhvefgjeevffegfeduffdugeekkeffffejjeeh
 tdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdr
 ohhrgh
X-ME-Proxy: <xmx:aeoNYWQvrMboKjYWvOo68xydDmB4fz6x8rQBNnNZwfAOCATuQhbv8Q>
 <xmx:aeoNYezJV-68W_m1qJ4uCMW2j8B0KxW2hIWky1WnpUAtjKjuS-jnow>
 <xmx:aeoNYc6dQakhO6kubKFxtE-75B_woPagrdxPhuwFlyJiSMCMMjEgOg>
 <xmx:auoNYZ-oob9rLhF-ykrzsibmd7oqPyFESJET6g-1wQlTC6jvnW9Xng>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Aug 2021 22:05:27 -0400 (EDT)
Date: Sat, 7 Aug 2021 12:05:19 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Stan Johnson <userm57@yahoo.com>
Subject: Re: Debian SID kernel doesn't boot on PowerBook 3400c
In-Reply-To: <ee724da4-4a5b-65c3-9c1c-d78954fdc7b4@csgroup.eu>
Message-ID: <73921a8e-6d76-7ae9-1ba2-811966df5179@linux-m68k.org>
References: <60841a75-ed7c-8789-15db-272bf43055f5.ref@yahoo.com>
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
 <c031a1e7-fde7-7c39-d9ff-404157cfc0df@linux-m68k.org>
 <ee724da4-4a5b-65c3-9c1c-d78954fdc7b4@csgroup.eu>
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

On Fri, 6 Aug 2021, Christophe Leroy wrote:

> 
> I have cooked a tentative fix for that KUAP stuff.
> Could you try the branch 'bugtest' at https://github.com/chleroy/linux.git
> 

Thanks, Christophe.

Stan, please test the following build.

$ git remote add chleroy-linux https://github.com/chleroy/linux.git -f -t bugtest
...
$ git checkout chleroy-linux/bugtest
HEAD is now at 63e3756d1bdf powerpc/interrupts: Also perform KUAP/KUEP lock and usertime accounting on NMI
$ cp ../dot-config-powermac-5.13 .config
$ scripts/config -e CONFIG_PPC_KUAP -e CONFIG_PPC_KUAP_DEBUG -e CONFIG_VMAP_STACK
$ make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- -j4 clean olddefconfig vmlinux
$ egrep "CONFIG_PPC_KUAP|CONFIG_VMAP_STACK" .config
$ strings vmlinux |grep "Linux version"

If that kernel produces errors, I'd try a second build as well:

$ scripts/config -e CONFIG_PPC_KUAP -e CONFIG_PPC_KUAP_DEBUG -d CONFIG_VMAP_STACK
$ make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- -j4 clean olddefconfig vmlinux
$ egrep "CONFIG_PPC_KUAP|CONFIG_VMAP_STACK" .config
$ strings vmlinux |grep "Linux version"

Please boot using the same kernel parameters as last time and capture the 
serial console logs. In case we're still dealing with intermittent bugs it 
might be necessary to repeat these tests so I suggest you retain the 
vmlinux files.
