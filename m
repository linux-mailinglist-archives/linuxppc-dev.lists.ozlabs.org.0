Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA2D61790E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 09:49:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2y9n2vRbz3bxp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 19:49:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=G1icxXvf;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=b75eBWyR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=G1icxXvf;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=b75eBWyR;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2y8n48dyz3bb0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 19:48:40 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 16BCC5C01F5;
	Thu,  3 Nov 2022 04:48:36 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Thu, 03 Nov 2022 04:48:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1667465316; x=1667551716; bh=OMwJ4zdkON
	2VHkp9GhF4Sg6iye9VtoxLvzZzycUBTws=; b=G1icxXvfQ7VT23ytrGpjRwYNBx
	TJJ3/kc+JgCMPWWrosNtw0IsBth/HLHcpWmHrgb1Mn9YKnTfR4lPbrSYqhrYb6F1
	lP9AO6P8RdU2J7072F7Hhctm9guplvB1BRsVdbgAyTjTAt1LRKtTxD5ULvZCh/Rb
	OMXG/ZDkAFt4lOa2lma0IaXazK7M4eb0wEr1lpcplibqByksg9f5uYebOIPttJQE
	qgT2JrdM6LBIuYB7/8xOs3mKKl8Q4E7oB2wFxTKeBh+GQ3U+CZyVM1yH27cnLsZ8
	wRBFTtxfZfKo4epaWxWSKJXVBVlAhSUp4W2GVR9gqEBQLo4seiia6TlHyCQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1667465316; x=1667551716; bh=OMwJ4zdkON2VHkp9GhF4Sg6iye9V
	toxLvzZzycUBTws=; b=b75eBWyRMw5DrMMMODYMFmx7ypv+Lzu+iRxzwyWcKP8i
	icbY2I4xxgOxN37HVfcZnZ7/s9QCYQfvL0UmfAIdLLGjOeij08AzyPDLoP5glcEp
	JmYFXDgF2LG+8L9mCQlSjeDc29/0qGhxEdcPibWt0gL4D1PjeZDoUQ5o2LrxulJl
	pi5PQ3NSU7W0n97veRuAbSRSZ49fLIN/qobHK96c+6i86El/gzTt/3RF13U+SgJN
	ZpWf8NIQcs9Obt0poE66TgN6ky+XiPocZiMLczOwlAd/vwPzVxord4qIL+zyvn/c
	tvgUs1rrvkK3X0Zy8+aFfpZbgcmdekMYpJAZQEc8Jg==
X-ME-Sender: <xms:Y4BjY23QX1fRCHHmFM4-okX-hToxnVfY6NKvoy1JTrJUE3u5XTg1Yw>
    <xme:Y4BjY5HIfztMSxfleAX-aE-lwpRl8hwXDdmZA21k_8pGN3EhgvK7qmTZncyuEaN5W
    e_zDYGfsgyptEcF3hQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudekgdduvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:Y4BjY-4Dp75E1tS1JynpjVZQeP3VFkHJ_3F0NeblHR2C8mVuiamt-w>
    <xmx:Y4BjY33s74K1Fnoapn77-N6uHRrkDdYPyrddLKb_uwiOEdHub1XdgA>
    <xmx:Y4BjY5HDH_TAWDsV3FERTeIMlmuzde8L5jV0qjyqhsaGcji88ax7xA>
    <xmx:ZIBjY5C_h8QXppYFz4XuZPkMFOQki-WT3sz0zYyEizOhRGy5BLfgxQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id AEBE7B603ED; Thu,  3 Nov 2022 04:48:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1087-g968661d8e1-fm-20221021.001-g968661d8
Mime-Version: 1.0
Message-Id: <636d8f8d-eb21-4579-aa9f-6e7ea71f0dfe@app.fastmail.com>
In-Reply-To: <e384efef-460e-015b-26c0-53dd31fae45b@csgroup.eu>
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
 <20220921065605.1051927-10-rmclure@linux.ibm.com>
 <871qqoyvni.fsf_-_@igel.home>
 <e384efef-460e-015b-26c0-53dd31fae45b@csgroup.eu>
Date: Thu, 03 Nov 2022 09:48:17 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Andreas Schwab" <schwab@linux-m68k.org>,
 "Rohan McLure" <rmclure@linux.ibm.com>
Subject: Re: [PATCH] asm-generic: compat: fix compat_arg_u64 and compat_arg_u64_dual
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@anrdb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 3, 2022, at 09:20, Christophe Leroy wrote:
>>   
>>   #ifndef compat_arg_u64
>> -#ifdef CONFIG_CPU_BIG_ENDIAN
>> +#ifndef CONFIG_CPU_BIG_ENDIAN
>
> Could be CONFIG_CPU_LITTLE_ENDIAN then ?

I don't think that symbol exists on all architectures, unlike
CONFIG_CPU_BIG_ENDIAN. Checkig "#ifdef __LITTLE_ENDIAN" would
work, that is the traditional way though it is a bit confusing
because it is used differently in userland, which requires
writing "#if __BYTE_ORDER == __LITTLE_ENDIAN".

       Arnd
