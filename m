Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC91B749ABD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 13:35:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=FMSfz4UQ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=JgusLVIE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxZGF5c7kz3bvn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 21:35:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=FMSfz4UQ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=JgusLVIE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxZFG3mV4z30hM
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 21:34:41 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id D2AC55C01E1;
	Thu,  6 Jul 2023 07:34:36 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 06 Jul 2023 07:34:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1688643276; x=1688729676; bh=t3
	/q+Yg2MyaI0HLj5wcLnTMw97EVKZ397JoVjZFMbmI=; b=FMSfz4UQudPJeTt9bj
	WC9eVWhSdkVZVDDe4+xKy3kYSFTgGEykX2Saeokzx5CVACfuq6cFbtKj5pBKp7aq
	F/xJtdQOttoIte0kGTl1wfYUgTPX8hdSnJdItsbruqQwXuHXNwdyBYaseuNoJpAQ
	K09nzc/6amwj+3rXNfoIaRhXcZz9QKq1p5xARst0pgRqMhCcLFHIbdZlpHm7WU9m
	/quk8LhxCJATG9ZATEWRl2z84T15Ok7GtYUDhxt5xyXZ66x1UkJDBBPRQpbH97RG
	3TDvcHzvPcem5tT0fg6bgXxkw65dYVUO+1DFbSUPSad7KniZOWa38t6WWDtCLGaY
	+nGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1688643276; x=1688729676; bh=t3/q+Yg2MyaI0
	HLj5wcLnTMw97EVKZ397JoVjZFMbmI=; b=JgusLVIE1tEWMeIDMDlUKz/L/HNXh
	WXLIYgGG/genxnLVqGgWHfri8GC3338hUWyrRsmaZzEpoSAuawo9wjH+qV1jby1L
	rMYDEhvb36rY1+bXYFweeoK0Bmgn1bsKOuMb3hOeibrHckvbdP0aw6A3qfO4oJwf
	OIkXT8SxOY659OVarF1c7oF3PTZtfypadg/Chxg2pG/J5KdizSQcLMBihbjhLYam
	Kz/Fci301n1SVB1AjhY7Jbs6o204WBTMaJw5Bb0bqnblrqiI2tXzDn62Xg2UR6qp
	RSLAo+1nioogftKm0GIfICM/oTUe26WDgHRmqv5KxXLaukUSlEr/LnIxg==
X-ME-Sender: <xms:zKamZIifhhh3cYphtKnXVUusVqjfk00NZB2K_CNVbkOYM2FBMQUhRw>
    <xme:zKamZBA5_K2Gr9r8TtB-5Ufvukb6BjCDR4KNkk24bEjQRpZCWRQiuS1Q4YHboNyW0
    KCB16KGd12wYkY4mkM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudelgdegudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:zKamZAEEySEYPRJfw1a14xVz8ITg-mjZqe9RFccGbPDIv7eA60XvcA>
    <xmx:zKamZJQG_89fAhk6cYr31JaZ3cLILRBYK104hLs2RTFFToUMqDwUlA>
    <xmx:zKamZFyJMlS-NV6ps_X_UlaEMQ80rlShTub9ZW0Ek9VNEO8IcmGD0g>
    <xmx:zKamZMnuNI4Jd8k_yPJ4lV2CB2z-4QO_Rn2Dg5d55ubI4NHcmwdxyg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1B6EBB60086; Thu,  6 Jul 2023 07:34:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <73b584cb-ceff-4e16-bac2-02de9903b973@app.fastmail.com>
In-Reply-To: <20230705190309.579783-13-jlayton@kernel.org>
References: <20230705185755.579053-1-jlayton@kernel.org>
 <20230705190309.579783-1-jlayton@kernel.org>
 <20230705190309.579783-13-jlayton@kernel.org>
Date: Thu, 06 Jul 2023 13:34:14 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jeff Layton" <jlayton@kernel.org>,
 "Christian Brauner" <brauner@kernel.org>, "Jeremy Kerr" <jk@ozlabs.org>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 15/92] spufs: convert to ctime accessor functions
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
Cc: linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Jan Kara <jack@suse.cz>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 5, 2023, at 21:00, Jeff Layton wrote:
> In later patches, we're going to change how the inode's ctime field is
> used. Switch to using accessor functions instead of raw accesses of
> inode->i_ctime.
>
> Acked-by: Jeremy Kerr <jk@ozlabs.org>
> Reviewed-by: Jan Kara <jack@suse.cz>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>
