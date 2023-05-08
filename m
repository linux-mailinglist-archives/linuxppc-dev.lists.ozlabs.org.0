Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4126F9EBB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 06:41:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QF7sD4bkbz3cfh
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 14:41:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=cRW+vK/H;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=f+kGW6nL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=cRW+vK/H;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=f+kGW6nL;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QF7rH1Dvvz306l
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 14:40:14 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 5B3823200911;
	Mon,  8 May 2023 00:40:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 08 May 2023 00:40:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1683520810; x=1683607210; bh=oyg9naAwIBEToLlOwyVpLlxblG8aD1owKXC
	Wac/pXAM=; b=cRW+vK/H/+F2PdsNBHiRBcK+FuCEwHgAfWPAoeB9yRSH1AOy0qA
	iqm2Fl9FhxlYsMtOf9lXmCHMYsMKb30nmZYwJ5R4Fvgo4JwBlorFui1ABXdTa2iM
	BGuCSqZuA+ZYWcugUn5bQ/LppFYEAkjc6JVMKUeDzW1eCUgXpwLZo/ZEw/PmjKCV
	/vdVac9nicl9TIWBb1wXYVT4cC82IOrzUCSiq1vxS4pSEGXWdNgNEGFazsUrx8e+
	zSrjMDz5a9v/EcjfdPL6z5PzkARExDSXAdi3k0i+/tDAAKzJrYqii4QlhEHDAjyB
	RTh6k6x2wklSi0vQ+NlBzP/Jxr1fZG+RNWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1683520810; x=1683607210; bh=oyg9naAwIBEToLlOwyVpLlxblG8aD1owKXC
	Wac/pXAM=; b=f+kGW6nLTMm7LrYdzcncV+PDttKwLfq6xTWhf+7JJYxztvQm3d4
	4EGiQGFgmEHgNF7pFDby/WRgl0HISOzpIZlvWNv7yUIWnBh3VCSKXtTcoATMAGl/
	9Xm+ZJKzFl2CLwlVSy6Jp2uyXCjsP+UzU11s9pRBWL/NNAmFDdVadGH/Kcl/Eg4A
	gztHTogK4G0tSRZPrQzBHVxbebWaMNYjjdV9V1UxStckXlgmzR5o++kSeTNTUfAb
	/VFZair8ESkxF9yrBHqf4gCeZtr+7GtOPxcKol1EJwin6NWj6/SooeZ/D1kYTWtS
	ibhoPzZlDwRI47Z/Em1i6JU3322TTMxm/iA==
X-ME-Sender: <xms:Kn1YZNeb--tur9xqfnBqyCzpYMVGXf26mrzmNhdAYMnibPXA0R3dNQ>
    <xme:Kn1YZLOgTuwlw_soZvl4Nl4qMhVKYR4fFOqHq1wY7XQ0pJ4JJSCl3Vi6xP2redSGZ
    iDSPprRMTEWFTT8Dw>
X-ME-Received: <xmr:Kn1YZGiWP5hO7BiYd5O-653dWPBcKUerscI8z-e4QuQbMOY9qgfwpfsUr_mf8hZ9XtqLO4YgKRrjFdpara5nCc2emc_TfygbnjsXkPgdYDmw7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefjedgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludehmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredt
    tderjeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruh
    hsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnheptefgieelhfeufeevvdekheeifeej
    gfefgeehtedukeeigfduuddtueekteevleelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:Kn1YZG_m9xBTvwRr83dSt6C5FBXfqCsvkh83f6c9BLPOfYoR6n8Qgg>
    <xmx:Kn1YZJubLN9TjRTjVSlkZqfWyc6P8gcCgMsirC5MogwvPgQjJfhJ0g>
    <xmx:Kn1YZFEflnflk7JlIOAk54hTx7Xlh9zJfcpOeE3WihAnsZZuDiQrwg>
    <xmx:Kn1YZKWwdYKmt9_r3HlZ2vzmNGu6UKUKXOpayV2PweBMRgo6ce69lQ>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 May 2023 00:40:09 -0400 (EDT)
Message-ID: <34efe87ede1b6d25cfc43abeb016bf084696cbad.camel@russell.cc>
Subject: Re: [PATCH v2 09/12] Documentation: Document PowerPC kernel DEXCR
 interface
From: Russell Currey <ruscur@russell.cc>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 08 May 2023 14:40:07 +1000
In-Reply-To: <20230330055040.434133-10-bgray@linux.ibm.com>
References: <20230330055040.434133-1-bgray@linux.ibm.com>
	 <20230330055040.434133-10-bgray@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2023-03-30 at 16:50 +1100, Benjamin Gray wrote:
> Describe the DEXCR and document how to configure it.
>=20
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
>=20
> ---
> v2:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Document coredump & ptrace support
> v1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Remove the dynamic control docs, descr=
ibe the static config
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 option
>=20
> This documentation is a little bare for now, but will be expanded on
> when dynamic DEXCR control is added.

Reviewed-by: Russell Currey <ruscur@russell.cc>
