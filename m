Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F12E24751BE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 05:36:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDMsB58RHz3bYW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 15:36:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=WQTK8vW9;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=HzCH0ahP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm3 header.b=WQTK8vW9; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=HzCH0ahP; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDMrQ3DGnz304R
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 15:36:05 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6869E5C01FE;
 Tue, 14 Dec 2021 23:36:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 14 Dec 2021 23:36:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:in-reply-to:references
 :content-type:date:mime-version:content-transfer-encoding; s=
 fm3; bh=wiF2JcwxoM8+U2DE8QbAmNOqDLX5bXcTRCnqS868btU=; b=WQTK8vW9
 3pVsezLImHDI7wIyrVsF3i1hsNmhT3XL0VMAtMwIc0hTPUThdpo5vbDZnykmVHvD
 p9zhhnpQowxjfkTcO/XpbfUNfWIEcOGzm95KOpmSXk/jg+9gHgXHKoo4NQZ4taL1
 yk9QrdAWobdbHUre07zO7yjz+dUBHDSDYX679Ed4ZO38A1uJeLKBwdkjgspejyco
 9+7MM+jw00y1Rr36ptSCXTk7q9m9orUL/PW38cxEiSjXylxzGY09MTPkGv1uplCn
 nR7hB6erEEgr2tO5rgYIx3gH5gU7SO5BueYk2SxWLAJTHCR4KUr6rCCNaIJE/BAT
 /fKXHZx3ry3TKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=wiF2JcwxoM8+U2DE8QbAmNOqDLX5bXcTRCnqS868b
 tU=; b=HzCH0ahP/Cw6HonBtY0VK+eJFoQ8J31XRL/0P0Qqqp5RPSmb+jeXoFRoZ
 dRtas/xh6zdVGyZbGsJiLqmYW901PX2JA2afg/TCtNwJqfMsdnh5Hl8HPJwTpnKM
 Y+euXlXtjNXeqlVlsWkQ+GWmbRbxl93yrp26LaqgDCM1KAwHLoFM48wthk+p3nVT
 QQg/0KVcRIQwDo0NIEbvIRfMefXUiKAvaj6l2jJBdYwsJNgJYkQ2IyuZHa1rQeba
 mKXxbx6yIUH0UAMCWe1LPw4HmYb9ef0ErE59PkuEorRTSPwW0fszrJ7BCjWpPa8S
 WMVtSAIvkN7p2t5cxc/INSjbeYweA==
X-ME-Sender: <xms:sXC5YVznTGMj8lTgMvDaaVcNj83wIkDUREwYt8g6PBzg5MTQuGM8VQ>
 <xme:sXC5YVRGYbhjvM31xZ1YI9N51Xoa3_7vQB5O8lHo6YHpb5qdy-hNqLdDIgw2MIC7N
 TErPJIQfoqcImSs6Q>
X-ME-Received: <xmr:sXC5YfXBaotD0ew_MTN1bytUIqQdwT-opH5VkgS5ZoKPPY9NGcTtjPBX7skUAt04doiXr7F__K6w3D6-PdvrO2WEfcv1A1yvKXQXg-g0ARcHwfSCCefN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledugdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdduhedmnecujfgurhepkffuhffvjghftgffgggfgfesthekredttder
 jeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruhhssh
 gvlhhlrdgttgeqnecuggftrfgrthhtvghrnhepffevffeuveelieevvdevueegheeuheeh
 gfethfevhfduiedtudeiffevjeduvedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:sXC5YXgfds8Yd0NAeaAYBYDooZitDbReU1pc84puzU_-EqWgZsAgGw>
 <xmx:sXC5YXD6dMSIjaNjT4zjUMIBlYfujdxwgKYbtOX103Ifg3MAQ-JONg>
 <xmx:sXC5YQLe9T6aVeqwR77Y4XUYgsOO3VAVPfierIddmH7qoEFAlz5iEA>
 <xmx:sXC5Yc6hdEvo3w7smgODGVuhbPWxSrXSQee5erbZTiKfODgTEfN_qQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Dec 2021 23:35:59 -0500 (EST)
Message-ID: <7f39553bd839709f7fdcc1cb136de3aa0241dc0c.camel@russell.cc>
Subject: Re: [PATCH]selftests/powerpc: skip tests for unavailable mitigations.
From: Russell Currey <ruscur@russell.cc>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <163941374362.36967.18016981579099073379.sendpatchset@1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa>
References: <163941374362.36967.18016981579099073379.sendpatchset@1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 15 Dec 2021 14:35:54 +1000
MIME-Version: 1.0
User-Agent: Evolution 3.42.2 
Content-Transfer-Encoding: 8bit
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
Cc: Nageswara R Sastry <rnsastry@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2021-12-13 at 22:12 +0530, Sachin Sant wrote:
> Mitigation patching test iterates over a set of mitigations
> irrespective
> of whether a certain mitigation is supported/available in the kernel.
> This causes following messages on a kernel where some mitigations
> are unavailable:
> 
>   Spawned threads enabling/disabling mitigations ...
>   cat: entry_flush: No such file or directory
>   cat: uaccess_flush: No such file or directory
>   Waiting for timeout ...
>   OK
> 
> This patch adds a check for available mitigations in the kernel.
> 
> Reported-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
> Signed-off-by: Sachin Sant <sachinp@linux.vnet.ibm.com>

Reviewed-by: Russell Currey <ruscur@russell.cc>
