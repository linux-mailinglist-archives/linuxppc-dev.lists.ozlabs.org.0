Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B864174AE39
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 11:55:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=SiHISIGe;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=otU0ea29;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qy80H4tVMz3c2x
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 19:55:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=SiHISIGe;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=otU0ea29;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qy7zJ6cj6z3bf6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 19:54:36 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 15BFF5C00FE;
	Fri,  7 Jul 2023 05:54:31 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 07 Jul 2023 05:54:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1688723671; x=1688810071; bh=6X
	C0Wg3ewP983KQo8iZVYJNXYqhyj/JCtouCPSrRJR8=; b=SiHISIGeprZW8TfAXm
	scuKV2FcQSvigS+oHDr1qrsHA+cZ8xsBUy9NibPZKzcFtbUaQKsHl8D4ACfN4ZK2
	RR5Pf/Q8ixQInXaGU299P/H1ZtITQQzaRJX1pWGvn3y/Uue0sbq7Mmo5bkN7L0aR
	MJQbmVlFPI3Ic02b3ZC+WYpaO1oWSU9Be2mc3JUqIKJCRWf3AtIPufI+G4oe/z1p
	ZAr3ft3JMUK6xobZSTIBfYOohdVJJnyYJu4DkBpPqqLZHvXarQRoYin1HXkbqQ8O
	R+isPyFEQM5np2U+BQBLk5jHLnW7qNZPJyB9kjzyLJHa1Y5h8skufzr7BBoK8D+w
	u4mA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1688723671; x=1688810071; bh=6XC0Wg3ewP983
	KQo8iZVYJNXYqhyj/JCtouCPSrRJR8=; b=otU0ea29ZNcdReu7aQRT+XjJV/YoC
	PQ6SElyG6RSHMrhoITEVG8rrm0ECTIzGl7Ww1VYB4rQGhglPRC5e8hfj5gAbpx2f
	wRsw+DWe437MdwxbA2JmYUXYnve0g4NNgaQx4WSCzOs1vkYPRTVKW7cAYlMEpDqg
	BSUvzrP97YZRwueEltKqEVA9nPQ/uxzovIJmGRR8tp8hGBDWr0ToeyXIY8zDrK59
	VkTYscq6juW+22/pqDYCYSYUznXN2k5U066fFlVKi/f701+Frtdie1fxYMkzw6R4
	Pk7LPjM2yBbxW77AeiVqG7NLjETEe2NvJk/oGKZqu+HOLea9LUXay85vQ==
X-ME-Sender: <xms:1OCnZD70dqB9vQoz6ajAH3tFzzeJWHRbtXSW2yCdwTIvKLdjRUbYPg>
    <xme:1OCnZI7OM2d6eWnYmSJZUiRk_pd_2XPKp0ZLCGIvgygk3PxmKiwXOXQD08beRdRW1
    6grwCMvIu2eKXULZLY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrvddugddvudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:1OCnZKfe6gKQbUt5HJGuarbSCpVB0h47GqtggPjidRh81zzxxLdyIQ>
    <xmx:1OCnZEJD4prfrTYRJMjNAb5XU05ONXaiv7icxC-BNfPZcsYm0_xJAw>
    <xmx:1OCnZHKz37MVzq28papqDe0ATgbaiAMjrgT_Yodb6JI5KAg_5mhzhA>
    <xmx:1-CnZE4gQQBjWOms_HdHq7Ni3Zu17sB5gQd8fxfIgNtRgM8QDVtk5g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5ED25B60089; Fri,  7 Jul 2023 05:54:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <981234cb-5b23-4751-a539-918a686d526b@app.fastmail.com>
In-Reply-To: <20230707095144.1378789-1-arnd@kernel.org>
References: <20230707095144.1378789-1-arnd@kernel.org>
Date: Fri, 07 Jul 2023 11:54:07 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Arnd Bergmann" <arnd@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
Subject: Re: [PATCH 1/3] vgacon: rework screen_info #ifdef checks
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
Cc: linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>, WANG Xuerui <kernel@xen0n.name>, Ard Biesheuvel <ardb@kernel.org>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 7, 2023, at 11:50, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> On non-x86 architectures, the screen_info variable is generally only
> used for the VGA console where supported, and in some cases the EFI
> framebuffer or vga16fb.
>

This should have been patch 2/4, not 1/3, please ignore this one and
look at the new version.

      Arnd
