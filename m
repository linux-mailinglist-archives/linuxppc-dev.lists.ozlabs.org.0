Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1A28BAFCE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 17:30:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=iCIMBune;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=YGYORuir;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWF9g3YZLz3dTH
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 01:30:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=iCIMBune;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=YGYORuir;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.151; helo=fout8-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWF8q2FJsz3d2B
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 01:29:29 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 7458013800CE;
	Fri,  3 May 2024 11:29:25 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 03 May 2024 11:29:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1714750165; x=1714836565; bh=wY9DfsGGwL
	3WFFF4rDuowcVoD3Ri5Gt9+AThm6ztR9E=; b=iCIMBune9biZ7be+dtUP878Q93
	Sf0/XN8Sm61VPWCl1b9XK9If8cW2NiSS5w8EN0UdqYwtWGC3lSFvxF7sK3ZoUXid
	5GjXllhLlIQJlyGLKwpwZSQhLHi9iGX82dEGqYJebU3idupbr9mH/XwyWj0oduvF
	dUz5eEp9/javg0G5T9NUaSVglGyA9v8/mRLxLArru1L5igJOrYs2YUWreSrOwuHM
	CVWLY8ndAFhGtAYovQyFB2GnGehAOAhxahrl3fHIIa2ZihXc1GT1iqEhIpOlS0Yf
	/v2Y1GOUoLhcGagBCanDzlDDDoSP55O6gaC/niPzveq/W5uG+Jxfvm4WD7XA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714750165; x=1714836565; bh=wY9DfsGGwL3WFFF4rDuowcVoD3Ri
	5Gt9+AThm6ztR9E=; b=YGYORuirzvgEP0dcRoZGmyspLXOo9wube2DJxbfTkMkp
	pSAyVvzV2X8BfeyP036rsP6YbbUa31Z9bl3rkPV8q5/WGPfRk9Cw9/MK8lAums1N
	05B9yIqHGJPstrbSw34nT/W/6Wu3BbSKGp7rS0bN7N6O3eK67ugjij3+HValFMvt
	7SHUIIM2VQOonhAY3JHTRnmmzeu0AP1HnKNyaf55JcNnxDETqCs0oO2LmInbVcdu
	ygz3WG6a8ImuZp8LsKjGOeaNW3edEe95Ak7x44udV75neIGR6ifS7xiaJfklKpGI
	XXLMYaKRieG8lu+pZgEWV+nvBhcqLqJ68z7i1RVGWQ==
X-ME-Sender: <xms:1AI1Zgt-RIf_MVtvc0LxunzLgTpoVcbbLYSEIa1hyWRYUFiD8CIQHQ>
    <xme:1AI1ZteogSVAZzkbj9oTdYREHhPVxjCqEGNlGGfJTwPaihNSEop06Q-q30wvqDJep
    4fCBjLFa0eHCvwjEY0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvtddgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:1AI1ZrxleoU7IxogrTww9AbE64uBICl1mz4_eLBng6a7XhGVW_5e8Q>
    <xmx:1AI1ZjOlt-JjJyw4GOyKHNjqRF3I2A828aNCnba5Xgdx-mcNldY4iw>
    <xmx:1AI1Zg_t5Ed5yE51wnoAw7ipvQj1dt8MiH-w0kjpB-_Qpd81NgpqOw>
    <xmx:1AI1ZrUFL1bIWpD3lQZXqt7G_yN21Kblz2B54NWe1vNc13E_hoY1Sw>
    <xmx:1QI1Zhj1BGPg0_SHCyV2Ty4IxZgKxMv84vxZso-bp7v4cPVRi_L31pPt>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 96CCDB6008D; Fri,  3 May 2024 11:29:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-417-gddc99d37d-fm-hotfix-20240424.001-g2c179674
MIME-Version: 1.0
Message-Id: <2f8cfd1d-a478-4666-a181-040c8d92e8fd@app.fastmail.com>
In-Reply-To: <c281bb8e-0719-4b28-a637-56615ad16913@suse.de>
References: <20240329203450.7824-1-tzimmermann@suse.de>
 <c281bb8e-0719-4b28-a637-56615ad16913@suse.de>
Date: Fri, 03 May 2024 17:29:04 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Sam Ravnborg" <sam@ravnborg.org>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Helge Deller" <deller@gmx.de>, sui.jingfeng@linux.dev
Subject: Re: [PATCH v3 0/3] arch: Remove fbdev dependency from video helpers
Content-Type: text/plain
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 5, 2024, at 11:04, Thomas Zimmermann wrote:
> Hi,
>
> if there are no further comments, can this series be merged through 
> asm-generic?

Sorry for the delay, I've merged these for asm-generic now.

      Arnd
