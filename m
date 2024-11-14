Return-Path: <linuxppc-dev+bounces-3235-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 269D29C8E7C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 16:42:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq4D40nh5z3054;
	Fri, 15 Nov 2024 02:42:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.150
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731598964;
	cv=none; b=dhMbGn8KQxUR10AS/OMFC6/E5aeIkZ+zmEBXsgWOqr6rvZ9G8DSYejY9EGnLpQ8klyZP1amA3kqex/W/BUS67vVvO1zcjj2BcxcgW56pkn7UMk/X20mjYqeoRnaSoM2+NghlYQ3xeCAy+byoiSrLdY9tmnxr24f/j53u8Vp3NdgB3lIYH3Goc2hOOJ3kq/lIFlJrfPCci71IDuG5QgjAOCLidkc9xRHYJBGjbHvWqtH2EYbLmD+6A0eI5h615cQgqSPsYPCHyMj+kd/w3gtxsFVpp9SwZQ9KckvnIDx9RNoQVy9Wo4dFKRtTnrww6GOQGa1KEOFcmNWuTRY3+EbL6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731598964; c=relaxed/relaxed;
	bh=AbcZDy48H7U/Pt6qnMvR1gC8GiMBry3sfz5Sp6m/oeY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=WO7agDAQh0BDDb0Ek9DfJ689EMUKkQakkNf1JUbL27/KNhJOvcW9/sX/nrnaDaXvNBKJkWFH+8qITuhWBnb6knXrT1VL3pCeyS7nbxvNICrB2EnH/lnduCn7lvl6FcRyWe6uFrVEe+lxhbk8Oa6Y+R2D/eGtpdU0nXIjcgIvAv1Ff5I4443gxbCos7vcyyT/cxWJLyBa6gHDAZVdwu06ECFUGZAWDvCJW4piNJh0uAHb2IgMK49y+4KBZ46QZePxNdxCfJ7FTG3SFyDwQHre0+yMf73umoeqtjqQkF8ZujoEPtuZPw849wQgYJILewLkZHY9pvrattV0gnHVIZu7wQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=YQETem0K; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=GjaPlz4Z; dkim-atps=neutral; spf=pass (client-ip=103.168.172.150; helo=fout-a7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=YQETem0K;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=GjaPlz4Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.150; helo=fout-a7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq4Cz5KJBz303d
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 02:42:39 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 5D9E2138026B;
	Thu, 14 Nov 2024 10:42:36 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 14 Nov 2024 10:42:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1731598956;
	 x=1731685356; bh=AbcZDy48H7U/Pt6qnMvR1gC8GiMBry3sfz5Sp6m/oeY=; b=
	YQETem0KYVVXgGMNpr9rjjv4q+HpRSneAByExeTrKrhrJa9/8QPGkZCVwaDeXqWr
	7LL2u7rIt9S+u7juI1aXq25sU3dgiyXb43mf4sQ3mwgRM5tFtbCGtsh8Nam/nK/1
	dHD4Pd2v3csSTI316imswRaP0aoxzr4clrP15GaiAAFH476gDMYaDCpm5MofrSW4
	6S54UBA+N10WGBy/HcFI6tcyHM1yroPtbh4pRn9SZO3HIhsDSNsg2s+OnfZtA9fC
	9aDk3qz5KdiKljLCDTHSABdXyBsHb0RSY9O2RNLOdnxBsdFmmNTETWP/LsDHA+RQ
	afAAX9uFZqLr63FiU/xlFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1731598956; x=
	1731685356; bh=AbcZDy48H7U/Pt6qnMvR1gC8GiMBry3sfz5Sp6m/oeY=; b=G
	jaPlz4ZY5d2ywyPSduy+xZR9YbzSYQp5wJlKAVpp+ph/nEylVZI9lNm1RzG2CRMy
	S2Ie1qqz6sxRrf8esjHaPfeb7UQlfJSZQcey0Hhd7gwFtA7rOUz3oj64s3rOiV4B
	sFn6KyAHxvBCP+JXUeCEH4AOkDi1VMw2lk1Ij+Kl/TvLmjTj5XUnvGrbfiAjQb76
	ARZPHXt/05Q7Y8GzpSMIffW4HebT+8z0bnFiLbWrmQoHNSllpcOefV81bGL3RLpX
	1JyLb5Bjav0trKl+ECVqgvrIpytdD4BcaI/EmcPYCDPNoW21izsH/wz8++ffC7ls
	gy+PclURJ5TdmJMCWIMtg==
X-ME-Sender: <xms:axo2Z0DRIqKtIAPOyOs8U-TUbCrYzH2-doyA-d_9wuy3sU9lCNhRyA>
    <xme:axo2Z2i0yP-gJP-IC-euBFn-yyQGk3VnmWh8UF69SVxoo7zDDP9z5x249ELC4S4_U
    enX4y-HHjHo2m0ZbV0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrvddvgdejlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpeeiffetvedutdeufeetkedtieffhffftdfgkeetudet
    teetvdfgfeefjeehffduueenucffohhmrghinhephihouhhtuhgsvgdrtghomhenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghr
    nhgusgdruggvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprhgtphhtthhopehgvggvrhht
    sehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvh
    eslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
    vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:axo2Z3mYyrFdkTit_pHCoxS9H0leduW8mQj944RXPaD4zORmHd5SQg>
    <xmx:axo2Z6wNr3qxy8KnoPCD5XubldZzLdnZqoCTZ_Xb4DiAnDbhhPeBOg>
    <xmx:axo2Z5QepYFmFcfZGEAWgfrZ13KZmShfNLtt5fX62-1xpCKDIF8oFQ>
    <xmx:axo2Z1aZHZZvk0Fv36neu1STufAamh9q5lwZ_tdhngRaHrhS7xVTxg>
    <xmx:bBo2Z7eTIzXILtaHEBCIZNLtPsbhF-o4P3arZu_GspVv2bAqOHH1mjsA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 784512220071; Thu, 14 Nov 2024 10:42:35 -0500 (EST)
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
Date: Thu, 14 Nov 2024 16:42:15 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Michael Ellerman" <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, "Geert Uytterhoeven" <geert@linux-m68k.org>
Message-Id: <ecb9d449-85dd-4ca5-a58b-43244b7c0765@app.fastmail.com>
In-Reply-To: <20241114131114.602234-8-mpe@ellerman.id.au>
References: <20241114131114.602234-1-mpe@ellerman.id.au>
 <20241114131114.602234-8-mpe@ellerman.id.au>
Subject: Re: [RFC PATCH 08/10] macintosh: Remove ADB_MACIO
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 14, 2024, at 14:11, Michael Ellerman wrote:
> 
> -config ADB_MACIO
> -	bool "Include MacIO (CHRP) ADB driver"
> -	depends on ADB && PPC_CHRP && !PPC_PMAC64

The dependency looked weird to me, so I had to look up
what that thing is. Apparently this originally had a PPC_PMAC
dependency instead of PPC_CHRP, which explains the !PPC_PMAC64
part.

I also found the promotional video from 1996 at
https://www.youtube.com/watch?v=NrvrIEPeSNA .

     Arnd

