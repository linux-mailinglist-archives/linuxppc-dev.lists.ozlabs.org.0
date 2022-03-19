Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E434DE65E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Mar 2022 06:58:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KL9CX1tMmz3bTB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Mar 2022 16:58:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=iLHUNTjL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=wout1-smtp.messagingengine.com (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=iLHUNTjL; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KL9Br4cJWz2yP9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Mar 2022 16:57:22 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id CB8C23200C10;
 Sat, 19 Mar 2022 01:57:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 19 Mar 2022 01:57:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=NJi090B/iJwFRyHkW
 21F4iSKRotQmY7UBQ+B5JO82Hg=; b=iLHUNTjLf3gxaY8SDVFZp64lKD9M0vTI+
 aOUR8C1Q3EBTLKNFNLg57LoPU9RvLe7wUrrNRGOUNyo9yZ9oszEK3CcZSBFvBbzI
 of52s8xFXC11S5WkuiNSaPR1/Hu8quxOWaCNyri7JRgSxVcVlkzGAHgGkPKZU/3j
 7BD/9BnMKcHtvGxxocfz+gZ98s6jhZOZNCeug+EiFwYgZXlb6k+KtN8xQM0x8DiE
 T00OIa2rKRNVkXiPyM1AHdKwE2OQqt0qKJPZRhS4IQnoSBQhkI9n3iqQwbjWytsM
 95PnZD1wCwgwbmYJq+/kJZ3v7WonGM5UGnUf67fyeLYkH4zImEXGA==
X-ME-Sender: <xms:vXA1YuEPgbrzKQVI3YdtYMR6Crb6PHmsKMxO01RcjWQRIsXXJajfSw>
 <xme:vXA1YvUEmmZz69BHh0yxXkbbdwGG8hkqSzo9TkXYATeIZe8l8exByk0phRjw3LtvR
 -JKa-qO9fr_tNQuKlo>
X-ME-Received: <xmr:vXA1YoKSRA8Ne2vMiJKv33Ij_jkiRP4Tiv97g4zGAhT5zmTDzW1M_skq-UhL_bOKlbVutlJ7iQKtLGp7iDOaMPsQ8kgCBw7xnqU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudefjedgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepffduhfegfedvieetudfgleeugeehkeekfeevfffhieevteelvdfhtdevffet
 uedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
 hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:vXA1YoGZjiyLinWcH-f-Cmg8bAUvSqvz_1jEj2DZXOZs89odLLDPHg>
 <xmx:vXA1YkUG0bM81Z8Q0RkORW4E8Jk04A8RNLmzA7IpkpjWOrbhKQf0pQ>
 <xmx:vXA1YrNFJHqO-80AJBrum6-jdnjYko71zncTpz6pOjqc4Zg427vwsw>
 <xmx:vnA1YrSOfmuXY6MFm0MSchBT2z74aCxfrUY8jKPW4y0h_XaGVGuy2Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 19 Mar 2022 01:57:16 -0400 (EDT)
Date: Sat, 19 Mar 2022 16:57:23 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] macintosh/via-pmu: Fix build failure when CONFIG_INPUT
 is disabled
In-Reply-To: <f5cebabc-18f9-7e64-ac34-2c7802104aa1@infradead.org>
Message-ID: <25cb7e6c-5239-e84d-e73d-848a66a214f@linux-m68k.org>
References: <cb1828050f8c9ef801b2bdf79eccd6c52afed26b.1647663509.git.fthain@linux-m68k.org>
 <f5cebabc-18f9-7e64-ac34-2c7802104aa1@infradead.org>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 18 Mar 2022, Randy Dunlap wrote:

> 
> Hi Finn,
> It builds without those reported errors, but I do see these warnings
> since the robot-supplied .config file has:
> # CONFIG_PROC_FS is not set
> 
> 
>   CC      drivers/macintosh/via-pmu.o
> ../drivers/macintosh/via-pmu.c:897:12: warning: 'pmu_battery_proc_show' defined but not used [-Wunused-function]
>   897 | static int pmu_battery_proc_show(struct seq_file *m, void *v)
>       |            ^~~~~~~~~~~~~~~~~~~~~
> ../drivers/macintosh/via-pmu.c:871:12: warning: 'pmu_irqstats_proc_show' defined but not used [-Wunused-function]
>   871 | static int pmu_irqstats_proc_show(struct seq_file *m, void *v)
>       |            ^~~~~~~~~~~~~~~~~~~~~~
> ../drivers/macintosh/via-pmu.c:860:12: warning: 'pmu_info_proc_show' defined but not used [-Wunused-function]
>   860 | static int pmu_info_proc_show(struct seq_file *m, void *v)
>       |            ^~~~~~~~~~~~~~~~~~
> 

I see. I'll send a separate patch for this issue.
