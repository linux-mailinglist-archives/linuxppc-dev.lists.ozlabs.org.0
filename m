Return-Path: <linuxppc-dev+bounces-10279-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E3BB084A2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 08:11:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjMxb2C37z2yDk;
	Thu, 17 Jul 2025 16:11:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.155
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752732675;
	cv=none; b=gW8qNsGv+Fj2ZivKpLqz/0zZhhlDJ4/8cv+S7hKraMuOIR4zGe6wvtONzZ80SL4qBWY+0aPLumY+8Qqo3OWupOU3ZoiKrIWoyWtS3Lh7vh9xamGgyDP6y7vH5dtaK+Ue5IFis3Vy35aDZ6sIiwuIiSvYukfUkkblE34fXNsOInXxJ6tLjnAQ/DRcOvT6OzHHGkkn/Lhk/oc5lB2bXXSha1qn4dOhV8u3/02k6muAkjXBWbJ+wpI4om4JrvFDJxF+cYQZGrZw7Tg4OQjuR5NDJ8WJi4ZkmN2VDaFGedShuUBhJVxIs6r3K9U6TC+5dMb95mIpIY7o9UpmCDndDDICIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752732675; c=relaxed/relaxed;
	bh=m6WGDKphqk4B2aRGrC1ritjNx2cJzmGzjAp73J/PTRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CttjMwXa32iA5Z91oev0PuKweKLNCchpbsKWIWPpTlh+M9RcfENmefZbvUbfUdb02HMQsjTECDtZmQ+rqwdR/3jIxfaudqa9L2yNErJXCkzAAhSyPxLBONih9cW975F24l/OgUHTw779CwenypD1OERskGLg65uMccijsxMdjghKXGPttx+DDyLQtmrHyAB7hwI4MugIscVhWsvuHSu0CLiNyCrTaH/OfckDAnQffBLYQZhlXTSCFT1YrIkUFSWbOwXwlIjCJW+God2BXoZJnF09Vq3+YSAggkuz8lZthFMXtIoZB6uncISeJ0J6oeQmMU0uPl25WiGjUaEGAm8eJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kroah.com; dkim=pass (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm2 header.b=u7voJ3zf; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=C/JN0Kx6; dkim-atps=neutral; spf=pass (client-ip=103.168.172.155; helo=fhigh-a4-smtp.messagingengine.com; envelope-from=greg@kroah.com; receiver=lists.ozlabs.org) smtp.mailfrom=kroah.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm2 header.b=u7voJ3zf;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=C/JN0Kx6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kroah.com (client-ip=103.168.172.155; helo=fhigh-a4-smtp.messagingengine.com; envelope-from=greg@kroah.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 555 seconds by postgrey-1.37 at boromir; Thu, 17 Jul 2025 16:11:12 AEST
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjMxX23hcz2xlL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 16:11:12 +1000 (AEST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DD6B914001AD;
	Thu, 17 Jul 2025 02:01:54 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Thu, 17 Jul 2025 02:01:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1752732114; x=1752818514; bh=m6WGDKphqk
	4B2aRGrC1ritjNx2cJzmGzjAp73J/PTRc=; b=u7voJ3zfB/N7Ul6dj5Sk3ErQxy
	D6I6gIoPHzXlxa3fKV8jwOLteXJ8uUtyq2rcK1QS+7udXUVKC6Tp27FJSVK+0BaK
	r1CNaoy7bUUJbIDUgZKhDPCU5MvTby7uugOhVx+vV41zxDGNLc5ZJyMu2smyDVZw
	C3WKkagnL17OG99WfTlVeWokTQpZDDHKNzMqw7d36Nj1/BrA2Nak5vNeBK6Wrg+t
	R8aAl9C+etFpg19qNs+sj/64lLwvIYbFhMEKoJrfhUI2ZrDGzilqu6e86RDf5r5/
	WYoD1965X3wsJPfT1PG/M+Uo6qlI0Z3lzogNps9o0dVACGz8ZpZR/uPNa9IA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1752732114; x=1752818514; bh=m6WGDKphqk4B2aRGrC1ritjNx2cJzmGzjAp
	73J/PTRc=; b=C/JN0Kx6u40M26WbfRask9QZDwXy8xwmndAEJew+zipFIAe3VG+
	xyXt+UiicMVkIueNrORBJKmW8iWgArb2nurRZ2jAAtk4aiEMrjPugcWRhr3MGZC3
	KjKA6gos5KaDDFybezIbKf2+8DDmss2I8wpWMctoVQAl6sW/RqIGnFJr7DlP4q0T
	dHc3xROpe8FYki5Bjhq4/XeB90NyUgYYBGh4LIQydzLf3h+GJhb4TqJhCfIdcvq0
	CoZml+YGdmXrd42zc0GEaKqRjHnnBfQ4MRyDEyngGGeW8g5Z5/oe/TLTbUgpV2/s
	v8igCyV6Q1ugAy6hiHLpO+D7PWx29VkKKLQ==
X-ME-Sender: <xms:0ZF4aDjBtZAhfN4vBCd_BaP6eAKohhZWtsgRRaB-enjFmraj79sc-w>
    <xme:0ZF4aBgxfVvMWBTuGQ3QstjCJu0ob3XVt70EW38Hhsd2nnBeEUwDYilnt0WPMUlwq
    Oq7MFD2o-KDCA>
X-ME-Received: <xmr:0ZF4aAtQL6M0fjVK5fRdc1CoBZY_IM88hJjj30iwJPL1dSci7V70PZk8f355rdYukVyEeuRtjf6nNO7o5oSvJm7EHgb8zCo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehleekvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffj
    uceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvvedvle
    ejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtg
    homhdpnhgspghrtghpthhtohepudegpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopegrrhhnugesrg
    hrnhgusgdruggvpdhrtghpthhtohepmhgrugguhieslhhinhhugidrihgsmhdrtghomhdp
    rhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprhgtphhtthhopehlih
    hnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:0ZF4aHup8l3nc2cmZIbVBZmo1MnzztzCR5vFtE5yqfJgXqJi5EPswQ>
    <xmx:0ZF4aBNHI4lmoQ-IVCADxmLTLkatBAWDH0Bvkf9Ak31_QiahqYph6Q>
    <xmx:0ZF4aJd0A2AXrvb0eeKOU60xcm5TrBK7eBvvmMKm3l3NGsU-kmlydw>
    <xmx:0ZF4aInlhssR8HLVgQ2Hx4ax5QrhXP4gXsG5xrBfws-lcsXN_FH52g>
    <xmx:0pF4aDzSXa6NFfb4aM3P3QEe0lg653xxwQNNf-7UkxTdkRilSMJ6SmQy>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Jul 2025 02:01:53 -0400 (EDT)
Date: Thu, 17 Jul 2025 08:01:51 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	PowerPC <linuxppc-dev@lists.ozlabs.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the char-misc tree
Message-ID: <2025071740-bubbly-blinker-1d90@gregkh>
References: <20250717153733.068c3fc3@canb.auug.org.au>
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
Content-Disposition: inline
In-Reply-To: <20250717153733.068c3fc3@canb.auug.org.au>
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jul 17, 2025 at 03:37:33PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the powerpc tree as a different commit
> (but the same patch):
> 
>   01c6d1df98cb ("misc: ocxl: Replace scnprintf() with sysfs_emit() in sysfs show functions")
> 
> This is commit
> 
>   e82fff08327e ("misc: ocxl: Replace scnprintf() with sysfs_emit() in sysfs show functions")
> 
> in the powerpc tree.

Thanks for the notice, this should be fine.

greg k-h

