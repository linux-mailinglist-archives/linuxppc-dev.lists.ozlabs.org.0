Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C07996F9EAE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 06:31:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QF7dw4ltMz3fDn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 14:31:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=JMZC0uAB;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=eWQQOepC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=JMZC0uAB;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=eWQQOepC;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QF7d46kVPz306l
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 14:30:32 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 708D5320027A;
	Mon,  8 May 2023 00:30:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 08 May 2023 00:30:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1683520230; x=1683606630; bh=xxaeWxOSYYxgRarUZ+ZjyNYEo4BWrPSdzLe
	cbE0d+zo=; b=JMZC0uABct8h808nIzoWEcloftg2KWaYzxRpoff0PUW80aLzf2I
	3E+M9uTiXoQe11PL+xGUVG4t2kj/iCUbE9sl48WDuyOR1KiJGvTgkxlI6SLiSBx+
	Zwxyx0Yf/UWBSeeQdxGd/Jl94F2W2ESHITljYc2Si9H/yoo6ynsCXwXsOrbvY8zs
	XBkoff41DxzMjoIcrtfBJgS1PSVjrL6ivH5eSV5WUSGKH7xQ2fcfRqovjf4p/FGn
	rKnFUdnYqEmxTNUge/CSbjlfDUaW0GyFgGFc4cwCF7CbuUnhnWRhRNG0PoYyO4Bq
	9ECNYJL32cCGi5OdkKWlPgLcxKRaI2YTqGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1683520230; x=1683606630; bh=xxaeWxOSYYxgRarUZ+ZjyNYEo4BWrPSdzLe
	cbE0d+zo=; b=eWQQOepC/t2+iOybbWRxeye4b6KDmTMVTUcM/jhrQkUlMOBJNl3
	Lw/Aq/ktKxWzdDkm497MbIy6aEFQyhOg4WD6cYVYPpLrDPf0gKLIidHQNuEhllcU
	j25g0117wDomdKBhGEUNbuunLGUzzCpDkQMIgRk1n7vAIZB1V6g853R0pTroQmMb
	mB/E7uaiB0UYBPtXohzinq2CfNsPIIv1HL77mTfGiGQehql8owaqHfGe9uot3nXb
	Qx/q2kLnValjO8aoFy85EPpFPpzwxYaZT426W8yYfsxS2A1jrDlNdH0VTokR5VWt
	ZyEokFcQP6wValzXzWMni+xLELuCFZwrsFA==
X-ME-Sender: <xms:5XpYZMFmMq3nx3tVkPKYpsnbunnmhyh9R5wWUmBI1_pz9PHhObDnvQ>
    <xme:5XpYZFVCqWYswn6UJdbno81yz3PkP8w4eUG_9GgG0jEO4x-TXpKQdub26jLWEBbC2
    wo5n-5CB_TpSZMH0w>
X-ME-Received: <xmr:5XpYZGL0ZZuEv_beHscMPQS-KlI_dwmxlFSGeD1I8s6QteyAEdS7ZOqFoEQRQqt3UjWFxtg0LxtC0yF7PDnMjOoFNegkKodzsN3dy8K4U4aNzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefjedgkeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludehmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredt
    tderjeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruh
    hsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnheptefgieelhfeufeevvdekheeifeej
    gfefgeehtedukeeigfduuddtueekteevleelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:5XpYZOGFNE9g0_J9gsiUwVuhqcKvHIeWE9HQ6byQl09L8cFewWf5sQ>
    <xmx:5XpYZCXrVK_TusdFQL3urnTdfYrb8-DkYFRnvSJMNw0MAfAlNuErew>
    <xmx:5XpYZBP5bU85-95MnWrzML-M0ugBgQUFTAUOffSK4sC4ayuRffRoFg>
    <xmx:5npYZFcMyAijOpkT9jfjE9voPNwtOlri-kPVbH9WsG_iOYBSa8nbZg>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 May 2023 00:30:28 -0400 (EDT)
Message-ID: <684f746ef3534496d4fb4b8653d9f44d955567a5.camel@russell.cc>
Subject: Re: [PATCH v2 07/12] powerpc/ptrace: Expose DEXCR and HDEXCR
 registers to ptrace
From: Russell Currey <ruscur@russell.cc>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 08 May 2023 14:30:26 +1000
In-Reply-To: <20230330055040.434133-8-bgray@linux.ibm.com>
References: <20230330055040.434133-1-bgray@linux.ibm.com>
	 <20230330055040.434133-8-bgray@linux.ibm.com>
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
> The DEXCR register is of interest when ptracing processes. Currently
> it
> is static, but eventually will be dynamically controllable by a
> process.
> If a process can control its own, then it is useful for it to be
> ptrace-able to (e.g., for checkpoint-restore functionality).
>=20
> It is also relevant to core dumps (the NPHIE aspect in particular),
> which use the ptrace mechanism (or is it the other way around?) to
> decide what to dump. The HDEXCR is useful here too, as the NPHIE
> aspect
> may be set in the HDEXCR without being set in the DEXCR. Although the
> HDEXCR is per-cpu and we don't track it in the task struct (it's
> useless
> in normal operation), it would be difficult to imagine why a
> hypervisor
> would set it to different values within a guest. A hypervisor cannot
> safely set NPHIE differently at least, as that would break programs.
>=20
> Expose a read-only view of the userspace DEXCR and HDEXCR to ptrace.
> The HDEXCR is always readonly, and is useful for diagnosing the core
> dumps (as the HDEXCR may set NPHIE without the DEXCR setting it).
>=20
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
>=20

I don't know much about ptrace but this looks sane.

Reviewed-by: Russell Currey <ruscur@russell.cc>
