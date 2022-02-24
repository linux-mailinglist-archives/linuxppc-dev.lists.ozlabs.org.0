Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 195E04C2652
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 09:31:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K45jY215gz3cYr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 19:31:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=evv/LeK1;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=KPV2Akj6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=evv/LeK1; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=KPV2Akj6; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (unknown [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K45hc3TTDz3c9t
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 19:30:55 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 94B3E5C00B3;
 Wed, 23 Feb 2022 19:32:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 23 Feb 2022 19:32:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=nf5v9flhJ1/35f
 JJsCo6upNHW6tvn2iWHZH/A+ZwQBg=; b=evv/LeK16QlL3GjRaqAJEve75MJGTm
 0s1X7DWU0oCwRCmdoWFtYVsnJ4AR1j4x9II/WxMSQSQTYfAxgeo+zjV7xZelFIy5
 JS1NmECDqJz6NRx3I9t6spm2KQoxBRfRJF+Cut7TlNMCPYTQ3KWriSjB8pZsLpis
 pbjtCZ118uKNZuR2+2KXx9yoxicIqoSPq1a7R8R5hqGsAUbzSshyPmCdRIy//Xfo
 1oDHzCLDswQPqampldY3rTDAKgMMAQtTyhRhq29HzjviPVV4bJSCZHwN+4lbxiy7
 HbvtKpZalmmW5Oj+9UTO7ihnNdO410lzel7UBD4HkB5iuHzGAIlro/gA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=nf5v9flhJ1/35fJJsCo6upNHW6tvn2iWHZH/A+ZwQ
 Bg=; b=KPV2Akj6JeP9AMwf5j+RJmb5AdCsVUlDymKb+fjS4Esv11r4HoNEdicsL
 6PJFB9rEgWT+gRnpOOnkj2wGcYkvXBnBsFH8gffx475IpA+tFkc4yEVCp1afZFG3
 e0HpaVOvLV1iaRHPmS54bKpxY5nds5AzMmOjxqWANYpHpYzFNy7cXZJa7czoYR28
 MY7MDbwiSBf92aq0aPJoHqO3ipE7Qn1En9TFAQntkTawfMhyphzZPO/Jj4Pm3EDr
 AloUMQriE2uRDu56kWK23R9jbzsu17t8ULIRxYZM5ZBiOWzNMF5B0NDxtCm4ob50
 e8RgX+ijwxUzt9Ppmvv1jSFXIpJUg==
X-ME-Sender: <xms:HNIWYnKmV0kvcuRBjKLJ7MxCBZOEuR5XAYjCSS2fKAWiKeLE7HcAjA>
 <xme:HNIWYrJm6o5lmGIrXeynVNdqzLQ_UDr0eJ_vGbasKx_MzBhpzhXYHgY3AAUQG9Uw4
 osyg-wjTigm58KXqA>
X-ME-Received: <xmr:HNIWYvv9iXEkfcvgkMjPEJiO0Y4zurKUa9M4DoT8Dak-fhFuuDTessB1vlXAcCmwWGmh9KScolXJTLz3nY7RBJn5mYQ5oTsQzxWOMJp-kUaqpfoo6kIE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledugddvfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdduhedmnecujfgurhepkffuhffvjghftgffgggfgfesthejredttder
 jeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruhhssh
 gvlhhlrdgttgeqnecuggftrfgrthhtvghrnhepfeffgefhlefgtedtleehfeekjeejteej
 jedtvddvgfejveelieevfffgfedufeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:HNIWYgYSOGQaa1nred7y96aqSvYWVkyUncVQDSGDeLlmFXmxXbT0ug>
 <xmx:HNIWYubU3BnY-TGAeax4xLYdBy5KEyfp00d9DReRbqkMiWfG0-XCGg>
 <xmx:HNIWYkDmO6OHUqDIBoN8-V-nR9wHw-uvUa20FikZr3Aqckilysri0A>
 <xmx:HdIWYm4BY1kgY3F_Qz6y-at2XRgkoiLPh37djwu0Og5NwgrEguUuOg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Feb 2022 19:32:26 -0500 (EST)
Message-ID: <b7adc31a454cf89cd04eabe36399bf2b3ce4fb23.camel@russell.cc>
Subject: Re: [PATCH] powerpc/module_64: fix array_size.cocci warning
From: Russell Currey <ruscur@russell.cc>
To: Guo Zhengkui <guozhengkui@vivo.com>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Wedson Almeida Filho <wedsonaf@google.com>, 
 "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20220223075426.20939-1-guozhengkui@vivo.com>
References: <20220223075426.20939-1-guozhengkui@vivo.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 24 Feb 2022 10:32:23 +1000
MIME-Version: 1.0
User-Agent: Evolution 3.42.4 
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
Cc: kernel@vivo.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-02-23 at 15:54 +0800, Guo Zhengkui wrote:
> Fix following coccicheck warning:
> ./arch/powerpc/kernel/module_64.c:432:40-41: WARNING: Use ARRAY_SIZE.
> 
> ARRAY_SIZE(arr) is a macro provided by the kernel. It makes sure that
> arr
> is an array, so it's safer than sizeof(arr) / sizeof(arr[0]) and more
> standard.
> 
> Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>

Reviewed-by: Russell Currey <ruscur@russell.cc>
