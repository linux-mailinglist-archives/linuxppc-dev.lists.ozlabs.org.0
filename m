Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9FC3E0C33
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 03:55:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgBWj4X0Hz3ccL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 11:55:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=knqJzrLy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=out4-smtp.messagingengine.com (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=knqJzrLy; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgBWB0Hfmz2yMD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 11:54:43 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8052A5C0066;
 Wed,  4 Aug 2021 21:54:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 04 Aug 2021 21:54:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0m0kND
 DSKnw2s+k1hnku4qEezhE8ScVFX1ntU+XniXg=; b=knqJzrLyBc06hkq/6DEiDY
 E1RzWWvBo64ohEcPw3wY+7SchZgZtjCArjUp7i2SCqyc0Dp71sINPDWPraLECbMK
 VeDTFROZYd3tdV1ruepqgKYAbD7KAr4mirhUOVcAlx+gTCwJw1T6zbgG+h/Vyxfc
 XW64kUy+yEyXdtZ0aoL3SmkDMMdsq4IIhRLcndjdb+X05g/XpE6c7EbjMt/P8bAV
 7GufJq8GB/MJJtH9EvUqW4ulktMPEi/RkbiOEL9l1lGY34rIuvLczw9Nuz9QeBce
 QOGCsUYg2oEJCL1P8nq+nhZxEfrjUyX7kTATqNrpB0AEbyU5lwTYlpe76rcneHfg
 ==
X-ME-Sender: <xms:3kQLYV_beL8Txg50zjCbBr_AdjIHpZtLm5Xd2TRjZK9-Xwt568VBKA>
 <xme:3kQLYZvdFgHaPUhsz7GXa-6-xgNWKt0ni8OsnBz5OSn8plYzwULEaVTmegxyHaRb1
 sgfBH75f5knwlXWu9U>
X-ME-Received: <xmr:3kQLYTD1Ga6uQ7v7aIBRtmfDaVUc6h-RGxj9Wi_EyRPWT-kK4QbUdJbfu3K9k5Of8GvmmjGtxFlzH8j3Nw-T72eco3obXr1Hi80>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieekgdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
 rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
 gvrhhnpeekveevtdekfedtfefhvdfgleelfefhtdefieetjeejvefghfdufeejkeehgfeu
 udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdr
 ohhrgh
X-ME-Proxy: <xmx:3kQLYZfxeWDzsnyThlawJtyMPXI_ipu4Q4ULEcgq3BZXPssaerq8mA>
 <xmx:3kQLYaNLcYhtINzzLodHyUCL6eR2L-dVU3zbE5kHK7cvljlbphGI2A>
 <xmx:3kQLYblCXHfrNMviz0mPN-0Ma81Va7iArdeGoVlKknhxYiD1sfC3fQ>
 <xmx:4EQLYXpdsWTXex6bQgoj8PSXM81N7BFp5zaNNMCFpxz5CMCa3_7Zfg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Aug 2021 21:54:35 -0400 (EDT)
Date: Thu, 5 Aug 2021 11:54:29 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32s: Fix napping restore in data storage interrupt
 (DSI)
In-Reply-To: <b04a90a9-9d62-2192-f896-ea99be911604@csgroup.eu>
Message-ID: <cec92a8a-34a0-6c5c-20e1-7de7d768a596@linux-m68k.org>
References: <731694e0885271f6ee9ffc179eb4bcee78313682.1628003562.git.christophe.leroy@csgroup.eu>
 <ce20d16c-b0b2-94c-3e22-794d95c376b@linux-m68k.org>
 <b04a90a9-9d62-2192-f896-ea99be911604@csgroup.eu>
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
Cc: userm57@yahoo.com, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Wed, 4 Aug 2021, Christophe Leroy wrote:

> 
> This patch is related to the bisect you did that pointed to 4c0104a83fc3 
> ("powerpc/32: Dismantle EXC_XFER_STD/LITE/TEMPLATE")
> 
> I think maybe the starting point should be to (manually) apply the patch 
> on top of that commit in order to check that the bug to leaded to 
> pointing that commit as 'first bad commit' is now gone.
> 

Stan has now confirmed this. He applied this patch on top of 4c0104a83fc3, 
and it did indeed resolve the bug that 'git bisect' isolated [1]. Thanks 
Christophe.

[1]
https://lore.kernel.org/lkml/666e3ab4-372-27c2-4621-7cc3933756dd@linux-m68k.org/
