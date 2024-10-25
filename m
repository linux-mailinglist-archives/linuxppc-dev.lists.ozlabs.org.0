Return-Path: <linuxppc-dev+bounces-2579-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF6B9B0457
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 15:41:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZkTf5zP5z2xjd;
	Sat, 26 Oct 2024 00:41:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.159
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729863702;
	cv=none; b=JhJWMdWrUvM5ONnHjL/A+w4Gw+0vfvLc+/iXk8GjDZ1iDKn3a9QTkoDk+eyupHdzNVwv8bV48g6TUdsHiY6ad8krJffMDnXTI+7BC4tqqDfAiodiQgRIPs3SBmge4bL5Fi1tkpOYnkTdZ7zfDNuWllkl3xLPvjYmzn+aRlOJt/xU5bJxfrP89n4WBtCbMHLK/uJNyK9i2/wzJfa5qp8tSblGhqjJkD5IZIKBOGQ9NgCaIONgIBpzPynjIdaFdAs3s8AFIVjmu6wVQOUVVa1pfD5azdh7jxgdmdR1y2tl0dLQxTTioKRaeIObcOrOHGKeUnbbesybCCYmy8WyF4xFfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729863702; c=relaxed/relaxed;
	bh=mTD/E8mUSNoNp+vtjeW8NYfb5u7ndnKHIytXzDhahwE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=kCqfH4pM5tKveCrwJtDdJLWmKnBXbN1/iWVrd8CxA9sKwuDxIwxWpmTzWhHSOkEU8rYUWzyjKpEFBGTP2WGQrdf/Vepkeq+vj0gi8QSWkk16Sh76rhgyUxCeH+ruuFzrJLuTDtakJOUyvPI7N/JBZuYpKjujCIxfzqOTVN4QpW/QJWCm60bwY6TBJFwOCme0q87tBU1sUhsJ0bvOKBBtC93ewc9jukm1ZS3unTb+nkgotzZVLTnVdz4gng8JAfK7cvq6/gB4fRAa5lHH6R5tcfDuXZQmdPAPkNdU6ARAUSPw2xYYVyILHcslmLopWKt0KoNx60CEcTmVaFzWrYlm5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=nTq77u+Y; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=YYd+CaNQ; dkim-atps=neutral; spf=pass (client-ip=202.12.124.159; helo=fhigh-b8-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=nTq77u+Y;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=YYd+CaNQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.159; helo=fhigh-b8-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 236 seconds by postgrey-1.37 at boromir; Sat, 26 Oct 2024 00:41:37 AEDT
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZkTY5bklz2xYk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2024 00:41:37 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 54D1325400C4;
	Fri, 25 Oct 2024 09:37:37 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 25 Oct 2024 09:37:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1729863457;
	 x=1729949857; bh=mTD/E8mUSNoNp+vtjeW8NYfb5u7ndnKHIytXzDhahwE=; b=
	nTq77u+YbjEK1oOGqWOEMss4pavBeea5xmfNB5v8n1RQ22NxJIlmfp2TzT4IKpOx
	caApVTp1/TP1+2AFsH+6DaC7B1jXPpi59lVd0QmK1g4cyigLCbwCjjCU5UZejO28
	8c3d8AGT1CdV1FpUSe8Ohc2JPaB0EAv7X1aw4eGMMqsDN9QNF4MBCkY7XT7NWXhL
	O/OEAgSYzhCEctYt3/dxus3LsMgxjvtStf4TUCEi3KDe+iRqYuAwvWG/ws/9TCTb
	91Febe33d87M4u4RsAc2PSDoS2l7TEXW3ZHH0N9mqk4H/wIO2sYqmM++nNVpXfOu
	l8mVjbE2Y3ckzB0U2VTGjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729863457; x=
	1729949857; bh=mTD/E8mUSNoNp+vtjeW8NYfb5u7ndnKHIytXzDhahwE=; b=Y
	Yd+CaNQUnHw9YsFM/xsr4EEUnyKUrgtD2vti8QGZood/Hu9648OKjYo4bH7A6Neg
	jnJDKNvwBYkFvlybTuqF2bH/KaZKDCsMPx9nvXzHCWTKjsCUnllyUHCbFyKAeDhX
	YNkya00Lwsz0+acBTk9P7pZOFNJx3BvJUubdQClXQQcfFmAJOHzcSMDEsFGYeUz+
	Jg9HE+6A7ymczxjo7UpkNZEyk9ue5mso6y8MDn4M5ldn8ZNSI/lsZrOwKW2qGN95
	SK1C5a5uk//QbB1mqxfMZZhPvCEMy7uIU9Opdu0mHCbXfdkyJRO6uRsr50PfJcTO
	dO3S1hvvUj92Ys457iJAw==
X-ME-Sender: <xms:IJ8bZxsuj29dJ1vr5lHn5cEFvY6c8AEcCMtZGM1az7Jp64ZRgbF05Q>
    <xme:IJ8bZ6f_PFYR1VPWQ6NunpU9GXYmb8uTFHK2WzhvwLuyhGpOciB1CBT9pvUeu8GH4
    UYBuOr6HJ-I4-vOr1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejvddgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudel
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnh
    gvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplh
    hinhhugidqshhnphhsqdgrrhgtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhr
    tghpthhtoheplhhinhhugidquhhmsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpd
    hrtghpthhtoheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdr
    ohhrghdprhgtphhtthhopehlohhonhhgrghrtghhsehlihhsthhsrdhlihhnuhigrdguvg
    hvpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdr
    ohhrghdprhgtphhtthhopehhtghhsehlshhtrdguvgdprhgtphhtthhopehlihhnuhigqd
    grlhhphhgrsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:IJ8bZ0w8_fyzDu0Dhxg43egcOQd9fPmeL9IF1HbPQzAPODUmdkywqg>
    <xmx:IJ8bZ4Ng8v61LIOz9Z6hcNW7TrkYDvZ9-QsNLZ7fNM7Okgrh7sPTiA>
    <xmx:IJ8bZx-O8B7MlF4JofybzIynmnGJvvLwnq8RLzH_1fknLv9ZsqMu1w>
    <xmx:IJ8bZ4X5lrN7iDkKbGm85k7BOBq5kmsTovQZ6V9cVszatdT146tmOA>
    <xmx:IZ8bZ02QO2wzbQXTtXh5NJPoq2r5QyMwBKYu4QPUoTFRk_k35DiZGUWq>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3B9352220071; Fri, 25 Oct 2024 09:37:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
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
MIME-Version: 1.0
Date: Fri, 25 Oct 2024 13:37:15 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christoph Hellwig" <hch@lst.de>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, Linux-Arch <linux-arch@vger.kernel.org>
Message-Id: <c9f10ee9-697f-4f45-8c82-a6dc61e5a74e@app.fastmail.com>
In-Reply-To: <20241023053644.311692-1-hch@lst.de>
References: <20241023053644.311692-1-hch@lst.de>
Subject: Re: provide generic page_to_phys and phys_to_page implementations v3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	SUSPICIOUS_RECIPS autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 23, 2024, at 05:36, Christoph Hellwig wrote:
> page_to_phys is duplicated by all architectures, and from some strange
> reason placed in <asm/io.h> where it doesn't fit at all.  
>
> phys_to_page is only provided by a few architectures despite having a lot 
> of open coded users.
>
> Provide generic versions in <asm-generic/memory_model.h> to make these
> helpers more easily usable.
>

I've applied this to the asm-generic tree now.

Thanks for the cleanup!

     Arnd

