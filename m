Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB25B3DF8F8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 02:35:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfXnZ5kGtz2yy3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 10:34:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LxVdFcPG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=out5-smtp.messagingengine.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=LxVdFcPG; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfXn81RgNz2yLJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 10:34:35 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1816D5C0130;
 Tue,  3 Aug 2021 20:34:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 03 Aug 2021 20:34:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=JeUqSg
 WX6vaL9uqlA0f6QajQ3fp/nnr4lDxVoh3HZ4g=; b=LxVdFcPG/JV4Ip7P5aBeDi
 CzGLK4ROwIlnQJo41YyN/5FFvCcx4uAe711LCStZmoXyimIHhXjZmvSWqLGL7k1l
 ujWlYi96OQPsU/TbMBwatSO0VqwFY+ED5t5museI2bsqe7t38mHZbpmLAQrGwCXO
 EmkOtNPQWlkmUKxGjArcmDf2/b61XU4z6CWKspLb4A3DwxZg1VdCz8DXdFDb2Fi3
 cD8p29wvYUnCOPqtKM82QxbTqSmCvqTeqc9XhkoZH7c/FuBPBDmAciKA825bdfgP
 4fssFV1S/IRVmE+PuzRjR+gpEX27eyu7jYD47R4FEt0dj0wMasx4vpLM0F1gqYCQ
 ==
X-ME-Sender: <xms:l-AJYes9NVpK3G1FiC4Mw52meQKrc-dEGXumayqJ5lRV81cIX1VP-g>
 <xme:l-AJYTeb5mQkm3YQeHI1QvS73cjeyC45oVGFtKAgjP4V6BlyBt-Oy1AcI3kS27NgI
 aZPxFw3PgyaoGuJMJo>
X-ME-Received: <xmr:l-AJYZzYt-W7UAfmIQGu3yHQAngL10DkvyPaQKDSoWDRlzKko6emzphvxBiplFXTbvZV42qAboS12DL2LzEbmYookGC7B4YfHSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieehgdeffecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
 rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
 gvrhhnpefgtdegudfgheehhfeugeeffefhvefgjeevffegfeduffdugeekkeffffejjeeh
 tdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdr
 ohhrgh
X-ME-Proxy: <xmx:l-AJYZPOljgxUPMo887LdblvD4DPYwPe-G6V-6LJQIMvRbuzYhAboA>
 <xmx:l-AJYe_KlbsHZ0MCcSCXbuhDzsN8DCOw3vr90zBvmIUM_Fj518--kg>
 <xmx:l-AJYRW-VEp2pFlSfu9Ewj8DIBtQXpikQdk2rfnV6MMVsW3VBvDyXQ>
 <xmx:meAJYUn5UzlaHwGA2YC0mmB3k14cEoNrII9eYuhxDYZ90MBskKa0sg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Aug 2021 20:34:29 -0400 (EDT)
Date: Wed, 4 Aug 2021 10:34:25 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Debian SID kernel doesn't boot on PowerBook 3400c
In-Reply-To: <fac98e72-14a1-802e-8343-9bed9a6eaedc@csgroup.eu>
Message-ID: <c535cc2b-3f45-2415-1e81-32ea24b4ec@linux-m68k.org>
References: <60841a75-ed7c-8789-15db-272bf43055f5.ref@yahoo.com>
 <60841a75-ed7c-8789-15db-272bf43055f5@yahoo.com>
 <20210731175842.Horde.UunWM8rZMP0dRCaeWUo-og1@messagerie.c-s.fr>
 <cd7c931c-a578-a2ff-0632-7767a0e90bb9@yahoo.com>
 <fbd08736-9738-35cf-3b47-b5c9c455c552@csgroup.eu>
 <b84bb7ff-2dfb-0ae6-6eee-dd3c40661982@yahoo.com>
 <fac98e72-14a1-802e-8343-9bed9a6eaedc@csgroup.eu>
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
Cc: Debian PowerPC <debian-powerpc@lists.debian.org>,
 linuxppc-dev@lists.ozlabs.org, Stan Johnson <userm57@yahoo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Tue, 3 Aug 2021, Christophe Leroy wrote:

> 
> Looks like the memory errors are linked to KUAP (Kernel Userspace Access 
> Protection). Based on the places the problems happen, I don't think 
> there are any invalid access, so there must be something wrong in the 
> KUAP logic, probably linked to some interrupts happenning in kernel mode 
> while the KUAP window is opened. And because is not selected by default 
> on book3s/32 until 5.14, probably nobody ever tested it in a real 
> environment before you.
> 
> I think the issue may be linked to commit 
> https://github.com/linuxppc/linux/commit/c16728835 which happened 
> between 5.12 and 5.13.

The messages, "Kernel attempted to write user page (c6207c) - exploit 
attempt? (uid: 0)", appear in the console logs generated by v5.13. Those 
logs come from the Powerbook G3 discussion in the other thread. Could that 
be the same bug?
