Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3972E95D2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jan 2021 14:23:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8btP74H4zDqM5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 00:23:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kroah.com (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=greg@kroah.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256
 header.s=fm2 header.b=BstwvCO4; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=CXuNXhgg; 
 dkim-atps=neutral
X-Greylist: delayed 361 seconds by postgrey-1.36 at bilbo;
 Tue, 05 Jan 2021 00:00:59 AEDT
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8bNC3PsnzDqLP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jan 2021 00:00:58 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 63BCF15D8;
 Mon,  4 Jan 2021 07:54:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 04 Jan 2021 07:54:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=KhhpB57NCBwpsFegDp/KnPnpp7y
 0kN/0LqejfDPizYU=; b=BstwvCO45AX5wufflWvrmbBT66O2gIu3of5PillHp+B
 olanTnFeqtBX3bvOPUCHGQvtvj/At1/6yUrKqSCK2gpucasA8FklB5ryawame91E
 Jh72PBICEfwhoZTtbT7HuHZL9lCXqhh3rXkwzxjL3EnJt/7oP9bttVLLTirsFtw/
 4gcwOtslgVHC4DPzkQg765oQR2lU3SRWMmFLPYJc0TeV2JMzLDXT93dq0GsYBtTJ
 wOhJfwvIwf1wmwGuLSyUpdS4z0G/zPvkRDOv0CoTprcvinyT7IJZ5hFmS0hr165Q
 qN3cNKBfX/EMB0Cfqwn/aM6n/yADHB5TXXZv+L5cPLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=KhhpB5
 7NCBwpsFegDp/KnPnpp7y0kN/0LqejfDPizYU=; b=CXuNXhggS1+G2FAMsx5FRf
 4gHh15OrQKgdFn36edFhpWruQtxNiSioWgTifqBzrVPGtlip0xqkmCxPTvPG/WNn
 jpczDrIsaftrAygtsXDf13zDwulrn3QD5sSE4fz8h4wEAK6DNut4ZF0LaK843cdH
 K8Q33ls4PqcZ/+9weNBGZSzfnMU4qG3fe/glwRMGw5yJh2mG2fAi7yNCio2ikMVM
 pi4D8VxVukDA8N/oc8x6rYe0coCmvR587gZ5U9xSzCZfrU5v2wlxsAaqvODb2tBV
 j1O2CYD/Ao7kyqvJ2XdDEhxAMcCoj5KMbcjzaXMyPdcVM0l99K1dQZ2AG4Nxfo+Q
 ==
X-ME-Sender: <xms:GRDzX580XrG7L4y-te7UOtjGkJaliwTBj2cYmDRXCb5_ucPi2ZmZdQ>
 <xme:GRDzX9td7dS8jiCbdZaS3Cq3DAILp2lD49PttWSztc8KBOSO_Vck6SrSjSkn_BA76
 tQPUDWTRaBysg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdeffedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeeuleeltd
 ehkeeltefhleduuddvhfffuedvffduveegheekgeeiffevheegfeetgfenucffohhmrghi
 nhepkhgvrhhnvghlrdhorhhgnecukfhppeekfedrkeeirdejgedrieegnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghh
 rdgtohhm
X-ME-Proxy: <xmx:GRDzX3AQqFJnXnrmC3UjRFjIZUebCpPjHsyxfCVzG8hdg38jzJ4huA>
 <xmx:GRDzX9cLd7y1ywko0vtHERMDOFLTUy1-vqwH6Cu01fEQON-gmpiuSQ>
 <xmx:GRDzX-P4ysuU4f9wvyZecIZa5tJWiashaEH-gBL8PU-5hI4k17JzYA>
 <xmx:GxDzX3YfWQgP05R12ZNthlYzoH27bd8WdxCnhjN2JOAxXv4b-RImRg>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id 786DC24005B;
 Mon,  4 Jan 2021 07:54:49 -0500 (EST)
Date: Mon, 4 Jan 2021 13:56:16 +0100
From: Greg KH <greg@kroah.com>
To: Santosh Sivaraj <santosh@fossix.org>
Subject: Re: [PATCH v3 0/6] Memory corruption may occur due to incorrent tlb
 flush
Message-ID: <X/MQcIep4k15cHe4@kroah.com>
References: <20200312132740.225241-1-santosh@fossix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200312132740.225241-1-santosh@fossix.org>
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
Cc: Sasha Levin <sashal@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 12, 2020 at 06:57:34PM +0530, Santosh Sivaraj wrote:
> The TLB flush optimisation (a46cc7a90f: powerpc/mm/radix: Improve TLB/PWC
> flushes) may result in random memory corruption. Any concurrent page-table walk
> could end up with a Use-after-Free. Even on UP this might give issues, since
> mmu_gather is preemptible these days. An interrupt or preempted task accessing
> user pages might stumble into the free page if the hardware caches page
> directories.
> 
> The series is a backport of the fix sent by Peter [1].
> 
> The first three patches are dependencies for the last patch (avoid potential
> double flush). If the performance impact due to double flush is considered
> trivial then the first three patches and last patch may be dropped.
> 
> This is only for v4.19 stable.
> 
> [1] https://patchwork.kernel.org/cover/11284843/

Sorry for the delay, now queued up, let's see what the test-builders say
about it...

thanks,

greg k-h
