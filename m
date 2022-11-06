Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4E561E321
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Nov 2022 16:49:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N4zLW1kNVz3cMc
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 02:49:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm3 header.b=W0ssXIi7;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=EYUxi4vm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=svenpeter.dev (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm3 header.b=W0ssXIi7;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=EYUxi4vm;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N4zKT47Rjz3bqw
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 02:48:12 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id CE0265C007E;
	Sun,  6 Nov 2022 10:48:07 -0500 (EST)
Received: from imap47 ([10.202.2.97])
  by compute2.internal (MEProxy); Sun, 06 Nov 2022 10:48:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1667749687; x=1667836087; bh=Dq
	D51ZNiiHRbL8EMSbFqH1TZF8golg5Oh2aWT+koTb4=; b=W0ssXIi7rZL9NggqPx
	Fn8j2zuBdrhPj3LfR2MdduqGdrrsm1WwRuRVF8RHLdypR5LFTnZlur0D9FNybjl3
	zwSOGChnDQ/7pvAW0uPeVEJxFmWptxELM8S7jn6oMU0JRBmlv55BVTj4oS3MGe9l
	Sc7aQRClJSayZ+62ZQXsKhyXD6N+53uwLnsXTxWOgc9rw1ReTH68Q1mBGTDrkERR
	2xGmHf6PDj6EVfk39qMyitGxelkwslqReeKK0d0TIgj7ncXxj3+1hc3Npvrvs/oF
	scaYHkwcKLMzEnsSgrjXMYHOqlx2f1Zdgi3g+qZldYsbXY1QNigzU8tM2kwPtkxU
	0FMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1667749687; x=1667836087; bh=DqD51ZNiiHRbL8EMSbFqH1TZF8go
	lg5Oh2aWT+koTb4=; b=EYUxi4vmHt+yoQv+jgGzetAa+wztr68XqFUChrufz8My
	oXy+FNVXFuRnCCIzW8m11qccVKuC+lvnqrNvsPSlnlLnP2nAOYrIAssKFIesotI5
	1aabhaHObdS/njkSMKzTgNo5hi/ZEcDPk1PM2nEpWKvF8Vh+cVoIyIHD8MA8gK6a
	MirofWadqPG1WvCPnFPAqO97njG0Noy+E7gYTdH2zK67El7E2djjkoSV9I5Fo9DN
	+2gi2OD0Pp/brsXtJZgBL2iTgR+1R9ostZ1yt+t37EfNHHZaZ97wKZIEMxYrKsF5
	dyghw4t354PFIv4j234Q2mfVkatFekoUVdAzF2iksQ==
X-ME-Sender: <xms:NtdnY8yEgMKtga3ctHbBASc4daMNLqGnUQh8F4Eh6_Pgv2umtyENsQ>
    <xme:NtdnYwTvDeSZ5MSbs6AE4cOfjRq61Do_7FgK9pzhO-cVHdAG2cP0qOv5xOyrvvrxS
    oIVgw1MMIfpxV2oZts>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdeigdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfuvhgv
    nhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrg
    htthgvrhhnpeelvefggeffheevtdeivefhkeehfeettdejteduveeiheevveeilefghfei
    veeiueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:NtdnY-W0vGVCi_VQkBDbWjSG-iOb6VYkhXDC6AtOSaiG8e0JhRIBfA>
    <xmx:NtdnY6gv3nmvTtFcygmm4GDyjpO5Nbj_HrR17Uyl5Dp5J8RF2uB8cA>
    <xmx:NtdnY-D-jl1YcCL1cA2KPJ92EYz_UvOtR47b8ohmGsLR4PbrU5sInQ>
    <xmx:N9dnY2uK_mLKrt0npg82U7vr1mIYYw78-qt-oIwa3SMHK3U8rUtCoQ>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8EE9EA6007C; Sun,  6 Nov 2022 10:48:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1087-g968661d8e1-fm-20221021.001-g968661d8
Mime-Version: 1.0
Message-Id: <41e0d093-3bd4-444a-935e-01daae537c70@app.fastmail.com>
In-Reply-To:  <MN2PR01MB5358D35DEBAB82A80629EBB59F3A9@MN2PR01MB5358.prod.exchangelabs.com>
References:  <MN2PR01MB5358D35DEBAB82A80629EBB59F3A9@MN2PR01MB5358.prod.exchangelabs.com>
Date: Sun, 06 Nov 2022 16:47:41 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Arminder Singh" <arminders208@outlook.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c/pasemi: PASemi I2C controller IRQ enablement
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
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Hector Martin <marcan@marcan.st>, Paul Mackerras <paulus@samba.org>, linux-i2c@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Sat, Nov 5, 2022, at 12:56, Arminder Singh wrote:
> This patch adds IRQ support to the PASemi I2C controller driver to
> increase the performace of I2C transactions on platforms with PASemi I2C
> controllers. While primarily intended for Apple silicon platforms, this
> patch should also help in enabling IRQ support for older PASemi hardware
> as well should the need arise.
>
> This version of the patch has been tested on an M1 Ultra Mac Studio,
> as well as an M1 MacBook Pro, and userspace launches successfully
> while using the IRQ path for I2C transactions.
>
> Signed-off-by: Arminder Singh <arminders208@outlook.com>

Thanks for following up on this! This looks good to me now.

Reviewed-by: Sven Peter <sven@svenpeter.dev>



Best,


Sven
