Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C475A780BF2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 14:39:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=d+bwoWlh;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ggAWAxVj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RS1fH4xTDz3cT3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 22:39:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=d+bwoWlh;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ggAWAxVj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.17; helo=wnew3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RS1dQ2Crqz2y1c
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 22:38:50 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id 84F162B00192;
	Fri, 18 Aug 2023 08:38:47 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 18 Aug 2023 08:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1692362326; x=1692369526; bh=VR
	Eevf5qPO8COed4/oy026pPJB7NxKFdDGSXwKxHqf0=; b=d+bwoWlht+7ouoS/7J
	AhxzevDyh+g/uq5Kqt7iTZpMVfiisxGrCgzCzQk7UHxbx6IHyoOWiIdbtmWk6iet
	GGrcDZuqAhp7jQX1PIDrldMHvYQdQwpBpvhBvLrfWjARX6m4dq0k0qXijDYxWx+O
	1GaVMw7ieXDsRrGrp+MJsTHK7IXt76Dx8Tn3PcIlgipmqDnPsR2slSZyf6h4XlBd
	A3DkVKM7pdSh+XeE66f7gba1ipuksmri4nYAqq3SdroDyHcMa5dAzQWfYjBhgwr0
	uN2fZjk8N0pmQNOHj8CkCOYShaxvMtkTZZ1wZUnnKLZ3h5g2VhG0I4fItsK8A4v3
	70wQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1692362326; x=1692369526; bh=VREevf5qPO8CO
	ed4/oy026pPJB7NxKFdDGSXwKxHqf0=; b=ggAWAxVjraT1rHERwpEPLrJWBXiX5
	jChRWcMsiX+/E8cuvXyF80WM/CSbxFBRmM/k1Vre9TjA9OaWN1UacrDECX3k4xFS
	ze54UvpfJHraV0ui2P6xykunXtVpF9clvtgn5KNTuIW05pdFbsyZhDt5VWAhA8y4
	72Lud6dLrIXuhK+wfZRlkL8ZO8Fa/mwXPTvD0H5JloeZoDb2BgAY444/mWKabtGC
	UXagx98erOo9EHtgFpvGmp5QAp67BGOb0d7w3v/PVgUjApTMp3QQ2wzR1aTVCu5c
	Jqve3hXeA9JBYQBSRqcjVVW+qDN+Y7KOzvAsLCQXrTmYMIkvzhER9vD6w==
X-ME-Sender: <xms:VmbfZGxZHtWL2hA8NOocNgxaSWw68Ztap9HrKupd_1XWvWJrbhnJGw>
    <xme:VmbfZCQ3yWHNjUpQwVOzK2xFKd7HDCUT3BJd6bDvYWdL1tM9yc90kcxby8baj6SPg
    vOIcMqWFDEr6EFMRkk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddufedgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:VmbfZIUqx27iRLZmO1UnoC5gOcDoLOdq32mkyYaFhYFBYh88bycIlA>
    <xmx:VmbfZMgEgOgqLselMUkYb5bHUttOu_WwUCrxSQkf2l-CKnA4NwCVLA>
    <xmx:VmbfZIB9cRfYyvqRSphs0qQdqPbgVGBYOuVFVOFHrsU3NhJMzGjoHA>
    <xmx:VmbfZK3xxAmtYNh_lxnyRtXHM1aeGSwGHfvwfNrrqidR-EJWHPVyhIh6oGI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2374AB60089; Fri, 18 Aug 2023 08:38:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Mime-Version: 1.0
Message-Id: <156fec7b-1a9f-4660-b1c3-65a8b9cd1405@app.fastmail.com>
In-Reply-To:  <008c4b0a118d37abac6b1ec89b5677b1c6e347ae.1692345210.git.christophe.leroy@csgroup.eu>
References:  <008c4b0a118d37abac6b1ec89b5677b1c6e347ae.1692345210.git.christophe.leroy@csgroup.eu>
Date: Fri, 18 Aug 2023 14:38:23 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>, "Christoph Hellwig" <hch@lst.de>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>,
 "Robin Murphy" <robin.murphy@arm.com>
Subject: Re: [PATCH] dma-mapping, powerpc: Move arch_dma_set_mask() prototype into
 dma-map-ops.h
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
Cc: iommu@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 18, 2023, at 09:55, Christophe Leroy wrote:
> To fix the following error,
>
>   CC      arch/powerpc/kernel/dma-mask.o
> arch/powerpc/kernel/dma-mask.c:7:6: error: no previous prototype for 
> 'arch_dma_set_mask' [-Werror=missing-prototypes]
>     7 | void arch_dma_set_mask(struct device *dev, u64 dma_mask)
>       |      ^~~~~~~~~~~~~~~~~
>
> Move arch_dma_set_mask() definition into dma-map-ops.h and
> include it in arch/powerpc/kernel/dma-mask.c
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Arnd Bergmann <arnd@arndb.de>
> ---

I sent the same patch, and this is already in linux-next as
3d6f126b15d9 ("dma-mapping: move arch_dma_set_mask() declaration
to header")

      Arnd
