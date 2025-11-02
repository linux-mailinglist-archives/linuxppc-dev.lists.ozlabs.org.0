Return-Path: <linuxppc-dev+bounces-13667-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEEEC28E0D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 02 Nov 2025 12:20:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4czshY5q3nz30hP;
	Sun,  2 Nov 2025 22:20:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.155
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762082429;
	cv=none; b=nyNIzdvuwKFVhmd5ko3+INNxOP31WaggRtiQpu/LkWZcadIg4cMg+r9HBG/jcYmVpoN7AdsthGtiq5C6NPZjiXW2ehqS3IOe3bSUb8MfWo1/dBAwxEb1459VvxgACc89K8sPz9spQzmjCXORDkqHCyDdvyUy4MvImguvCfuKloIwNuEXmdKJl7qxwLN7HJsGrhLCiTE4l7JF2V+/tsdtxPUknofndZ0X8meFJhgUKuST4VScY5NXtGEgHMbRVNvcuFYJ3pBCwe4SFNQy/BGdnVoRKsxNp7DHYEmgfiYJmIQY+2G6iz7v1LfupvLhSmFS/rpDGuaaQs89jxLfXgPyGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762082429; c=relaxed/relaxed;
	bh=6m3o1ByUcKnQCCidqvOiypzSMNc/FU4EBRXilWZnF/0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XxTh7EDSoVMMAX8+DSYL40DjnQ/WOZqCMWoGfa4A2DuaP2gM8FGcREgd+jCbpspbfuIfkTNSEjNm8yKD3vvu590Zr3tI/petZWh3JZEF3Jfm+oBJibd7drPB0UrXo6yQy8V8+CQUKOXvzT3ofjhTNKyJo8aR6/qe5m7PTSXd60rlBVniZa2zRqyHYrk1rfMgIFYPu2gL8zxMUpxC5n+LPJlwMPgHZgCWmXPUpf0Z/+K/ZpjOC/CR34dqCTQpXqjtGOM9YQEn4Sbs9QheWA7BkDi397ov8e1ZK47XCrUXiMMo0z0zm007OZcYdZXBUUB4REd967o4OFN0HFPWe9T/Hg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=M4mtYi6G; dkim-atps=neutral; spf=pass (client-ip=202.12.124.155; helo=fhigh-b4-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org) smtp.helo=fhigh-b4-smtp.messagingengine.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=M4mtYi6G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=fhigh-b4-smtp.messagingengine.com (client-ip=202.12.124.155; helo=fhigh-b4-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4czshW0SWkz2yql
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Nov 2025 22:20:25 +1100 (AEDT)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 95FBE7A012A;
	Sun,  2 Nov 2025 06:20:20 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sun, 02 Nov 2025 06:20:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1762082420; x=1762168820; bh=6m3o1ByUcKnQCCidqvOiypzSMNc/FU4EBRX
	ilWZnF/0=; b=M4mtYi6GOiUwEVnU1+rp8S1+RWIJN7w9+1BjzGQdMoyziBKJGgD
	2ptYd+fCMVtnc5kj5IVMIkfTzcnpce3FEGPicmp6MdCYamhMEYYAg6QGzqBifnNx
	P2PJ+UT+B9pvCdK4oyZohHB52qbq6hlt3Q3rvWq26Qx/zzVuN15NIvoqDcDqqcYh
	tdcnXZP9nzJf6vTa/KQSfjeQUSJonM9XzNLRJbk+hebpV0duTWj+ytPdPUysh6FY
	xdiZabPXizWF1xdMGYxw+mnCZS4wpmILMf150HZmUWlGpzBylO6RvWIsPu36ZO0E
	s031OQYw0LUezL4HgeJQ0DzO/6G6K0QgVIA==
X-ME-Sender: <xms:cD4Had3xlIZ7JJVEZAgthSzOTzG5aRZwet_IKoQJTTkt0Lh8qux75Q>
    <xme:cD4HaYfCxIQjW-rBRFcvcy4LiXxOhK6P4DVyJsHI4zsFdIfoZuGrKjtXjE8JQDmx-
    eiBvm3HzbioIVc_GjGL8ZQyEXzyR9f7xZD97KPB4a8Q3ijnGfU_Zx2M>
X-ME-Received: <xmr:cD4HabxarueTcmYJSXQp7nVaC2tYA678m8CmEtLIHfi6W26TjUpDKyLzkd4sOXFjBtrps4ojTFw-IwYwAV_3b0flP4Rchox1HHs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeehudduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
    rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
    gvrhhnpeevtddtudfgvddtteeuvdffheegffefhffgjeefueevkeeutdeuleffheevffeh
    ueenucffohhmrghinhepohiilhgrsghsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdr
    ohhrghdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopehushgvrhhmheejseihrghhohhordgtohhmpdhrtghpthhtoheplhhinhhugiesthhr
    vggslhhighdrohhrghdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruh
    dprhgtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptghh
    rhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopehsrg
    hmsehrrghvnhgsohhrghdrohhrghdprhgtphhtthhopegsvghnhheskhgvrhhnvghlrdgt
    rhgrshhhihhnghdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhish
    htshdrohiilhgrsghsrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:cD4HaYwgnD4En5T6PukYGLYuHvhmlS4V4xGeBrg1H-OefOcz2iYG1w>
    <xmx:cD4HaUZ1xoEon8SCoRYTLcm3mYv8kkfOXWTN_VTplSyxSjRUt05uXQ>
    <xmx:cD4HaZ3g_ShkIhJBpRCAUBfIGl9qdN6HefMepaqX3visPr7_BJofXA>
    <xmx:cD4HaWcvDBVMPJGqSlnVhvfU3Sbw-T3YSM0zrT22ITL3TeNGF1lQ3Q>
    <xmx:dD4HadRWn_csD9ONZJatBy_oC7DaG66d3enfO9Lm-3K-4kBm9nbh2o0F>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Nov 2025 06:20:14 -0500 (EST)
Date: Sun, 2 Nov 2025 22:20:22 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Stan Johnson <userm57@yahoo.com>
cc: linux@treblig.org, mpe@ellerman.id.au, npiggin@gmail.com, 
    christophe.leroy@csgroup.eu, sam@ravnborg.org, benh@kernel.crashing.org, 
    linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
    rdunlap@infradead.org, Cedar Maxwell <cedarmaxwell@mac.com>
Subject: Re: [PATCH v4] powerpc: Use shared font data
In-Reply-To: <d81ddca8-c5ee-d583-d579-02b19ed95301@yahoo.com>
Message-ID: <b657eaa6-e027-4ec4-d6c4-e053cdeb1631@linux-m68k.org>
References: <20230825142754.1487900-1-linux@treblig.org> <d81ddca8-c5ee-d583-d579-02b19ed95301@yahoo.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Sat, 1 Nov 2025, Stan Johnson wrote:

> 
> The problem also occurs on a PowerBook 3400c.
> 

Not quite. On the 3400, it's not a regression, because CONFIG_BOOTX_TEXT=y 
never worked, AFAIK, as far back as 2.6.8. So I think that's unrelated to 
the regression at hand.
https://lists.ozlabs.org/pipermail/linuxppc-dev/2008-August/061792.html

