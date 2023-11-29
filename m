Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6EF7FD868
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 14:41:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=LaxlsOTq;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=YFeGu2Mv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgL8P38zgz3dBW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 00:41:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=LaxlsOTq;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=YFeGu2Mv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgL7Y1wGHz3cZt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 00:40:57 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 5038B5C0151;
	Wed, 29 Nov 2023 08:40:55 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 29 Nov 2023 08:40:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1701265255; x=1701351655; bh=ik6/mzSWM37bBDY1sCNfwTS7PwkseBBlOIy
	CoxDTEO8=; b=LaxlsOTqfW0MlyK5nlyqdRSBCcx9UHIvnyKammKs/4qOqTUiNmA
	y7rGxHU4dMFsY1+jj3y8d+vno9tH3Vx+nOHJ/eMw7XKcRY3S24S41Bfqf9hQDMMT
	qix01Hx3GRVPTQm/gaHCoyF1FVZidMc8EWRWwsJHFkIFKSIVYuIYAuRmjcEjnbuE
	mEXYTFn/k3oErKPX2McIiRB7Wnob9bf/aoiulemH8yzFHVZTfukGQy/f1VmAqjjy
	rArjhQWg/Ymwu7tTiw/fvCoP9kkIIRKizsJm+nuk/OKHl4Bmp59VZ9Rd9bMf+VR1
	+iSI5mv38AOSRIy9MQ/5CXPwTeOhZOhPyhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1701265255; x=
	1701351655; bh=ik6/mzSWM37bBDY1sCNfwTS7PwkseBBlOIyCoxDTEO8=; b=Y
	FeGu2Mva6jOdCFeaKZcDYcAaDkCS5JkSV3q5paHcHtumXgPeidcG4QUPKs3ptfll
	k83HSu6UEkhuuj0fB0VRe4Rk0byGc3qwGpdTieFqLFQrUQd6bahTde4Pn/V6XcUR
	ed9hdFzLHvgQvceR2cS4JKChcI7/zHp+AlxqqSD3gcDptlb9ha6a+/iVstEAQMEG
	K8zPu5DFIny3fZGTsvAJT7ENdt5ZQEVzWw2GA92SrpaaZx/usTaNLyZu1ldAnBI7
	4iKxe3Ee6h7VmP5+VfIWMmlyTDlUTgwrDsjLJaZ3eh79Vl/J0vKTKaLQ1aXDpnnU
	TmCi+4eAHl6nR1xhKBEFQ==
X-ME-Sender: <xms:Zz9nZWVvTAmTGKtHj6eUSQHfQ_B4V7I9sTqAMbM_g9HFQU1VkLs5gQ>
    <xme:Zz9nZSlIsjB2UQP79qg0HIFjtgu3KESjnnvb9a7AcMU4P-C-vARiw70fgkkxnctCR
    8RKQdNcemYSdk8Z7NQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeihedghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtgfesth
    hqredtreerjeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnuges
    rghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpeejgefhuedtjeejheduveegheevud
    ffjeekhfevfefgtedtheegieeludefuedvhfenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:Zz9nZabn6fPYiHT8CPSw3HnNSYgRtep5q40x5pOfMFiq5rJvYUcz5g>
    <xmx:Zz9nZdUxosZm9BmsZ2ZW55xf7x1KSg8oB0OUlsJrzPlA9G2mPZ1lUQ>
    <xmx:Zz9nZQladC51KFICDRMvRfEGBil63UFQlF-LUILfgyG6Ac5HckrqWQ>
    <xmx:Zz9nZST3fVYbCSeupOwpNRoIetPG6wUXaX17g2HRtZgPyC51KkSVog>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 11D5BB60089; Wed, 29 Nov 2023 08:40:55 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1234-gac66594aae-fm-20231122.001-gac66594a
MIME-Version: 1.0
Message-Id: <2dc8d55c-b5c6-4081-8aa2-037c3ab7785c@app.fastmail.com>
In-Reply-To: <20231129131919.2528517-1-mpe@ellerman.id.au>
References: <20231129131919.2528517-1-mpe@ellerman.id.au>
Date: Wed, 29 Nov 2023 14:40:32 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Michael Ellerman" <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/5] powerpc/suspend: Add prototype for do_after_copyback()
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 29, 2023, at 14:19, Michael Ellerman wrote:
> With HIBERNATION=3Dy the build breaks with:
>
>   arch/powerpc/kernel/swsusp_64.c:14:6: error: no previous prototype=20
> for =E2=80=98do_after_copyback=E2=80=99 [-Werror=3Dmissing-prototypes]
>   14 | void do_after_copyback(void)
>      |      ^~~~~~~~~~~~~~~~~
>
> do_after_copyback() is only called from asm, so there is no prototype,
> nor any header where it makes sense to place one. Just add a prototype
> in the C file to fix the build error.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Thanks for helping out with the rest. For the series (aside from the
very minor comment):

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
