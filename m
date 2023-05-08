Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD836F9E50
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 05:45:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QF6cZ1xLhz3f7T
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 13:45:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=aTeqAUzJ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=iw2QLMql;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=aTeqAUzJ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=iw2QLMql;
	dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QF6bk0MMJz30hw
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 13:44:17 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id C75ED3200910;
	Sun,  7 May 2023 23:44:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sun, 07 May 2023 23:44:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1683517455; x=1683603855; bh=+2qQqbsI4Vki7+U/is1A3M9LmtqXxoru0Sw
	akHdxMvk=; b=aTeqAUzJWcAsJPBhRAw4n3H+i1M2pnab1Uhk0didJNwbOnKJa9v
	sjKzPx9qbSutyCAoFuKwtO36DmjqOKWaxNsIfmNJEpD58pbh3q5af3/jxtFzLNns
	69j4MaMg7p3eW/ey6cgguD2pVJiForS5CB5O0hI+sppkgB24MGPLyeU0ybKZ1Ixc
	oD3OBpW+Tywq285uwHB4dBn7Q6uEt1DetPDdQfrLxXyJzs74u99fTHSOVkqK5WPX
	N83v0AJvTcm7UwnhoR6aTSZPSHGABE8dQSVg6AL8TnnakxIJ6exQE/SqzYiedlGL
	vcjWMcy15tkeJcBrlqHr/baGMZyqXmx2hMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1683517455; x=1683603855; bh=+2qQqbsI4Vki7+U/is1A3M9LmtqXxoru0Sw
	akHdxMvk=; b=iw2QLMqlNQDVWf8To1B5VVhYI15aBMmN9qhN+WA9DHZO+si3EZi
	4lVgjkO0lFOS7HNcBs+UroQsGZiYgMsk2aXklht7tSUpWjOT3prmvI3gJid6eYkn
	ZFf7KAZST4StwldwROZsgQPvyfujbLaKsGOQtajqAJYojcL/Hv3J2ON3pJpdPYp6
	jXJxGlZG6jZFq9d4/RHlE4utxDVTUMYvp1Yo9402XBaG8xuDG89aSQ28N0BFn4tZ
	0vgmqdGS2Vvg/dw5u8cCgeB65ANw6wS6uOIn8WcAcjg0vZK4imchcPuBzmmntxlZ
	lVGtmJTYrgVwrT+qqVwFQklAdFARgs0OCog==
X-ME-Sender: <xms:D3BYZC1LICFbYG0mnEyTml-02SMMpDpQfiOTlpW0HwB1ihu0up8hGg>
    <xme:D3BYZFGMvLmlAjy7FJoXlIdRUrFY0M1rsfvIJVDBC9H1HDwvKSk7LvBf9DJfurNsc
    wqZFHVcEAXWCSuofg>
X-ME-Received: <xmr:D3BYZK7cZAvlWx6BsJBFyWiRpBGTL9KCNlyZPyRLqkKE_673k9LLKCMYAQbcg7Crs_IXFUuA99SgKwrU5zqQ6Fzr3_zuWbFxCb_7Zxp03aAaGQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefjedgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludehmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredt
    tderjeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruh
    hsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnheptefgieelhfeufeevvdekheeifeej
    gfefgeehtedukeeigfduuddtueekteevleelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:D3BYZD22gRGqwmVHWSE71nVb8PtfYNbu6Den-nxuZufoRxWXDdywSw>
    <xmx:D3BYZFEqdSCGDmYWV3Gt81Z2NFYAEXtrPLlUcKWmkIBGpyUxmV1iBA>
    <xmx:D3BYZM9metdIYsG-qc534kXLRT5OFESj9MlCKR9vLMQFrnWvENcuQw>
    <xmx:D3BYZDNsECfGvBgA8oppzAgBGHAmTY-_65vZs5GlBoy2qWozJf8GTQ>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 7 May 2023 23:44:13 -0400 (EDT)
Message-ID: <38901b21426bb795dd26f081eb4908d86c779f90.camel@russell.cc>
Subject: Re: [PATCH v2 03/12] powerpc/dexcr: Add initial Dynamic Execution
 Control Register (DEXCR) support
From: Russell Currey <ruscur@russell.cc>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 08 May 2023 13:44:11 +1000
In-Reply-To: <20230330055040.434133-4-bgray@linux.ibm.com>
References: <20230330055040.434133-1-bgray@linux.ibm.com>
	 <20230330055040.434133-4-bgray@linux.ibm.com>
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
> ISA 3.1B introduces the Dynamic Execution Control Register (DEXCR).
> It
> is a per-cpu register that allows control over various CPU behaviours
> including branch hint usage, indirect branch speculation, and
> hashst/hashchk support.
>=20
> Add some definitions and basic support for the DEXCR in the kernel.
> Right now it just
>=20
> =C2=A0 * Zero initialises the DEXCR and HASHKEYR when a CPU onlines.
> =C2=A0 * Clears them in reset_sprs().
> =C2=A0 * Detects when the NPHIE aspect is supported (the others don't get
> =C2=A0=C2=A0=C2=A0 looked at in this series, so there's no need to waste =
a CPU_FTR
> =C2=A0=C2=A0=C2=A0 on them).
>=20
> We initialise the HASHKEYR to ensure that all cores have the same
> key,
> so an HV enforced NPHIE + swapping cores doesn't randomly crash a
> process using hash instructions. The stores to HASHKEYR are
> unconditional because the ISA makes no mention of the SPR being
> missing
> if support for doing the hashes isn't present. So all that would
> happen
> is the HASHKEYR value gets ignored. This helps slightly if NPHIE
> detection fails; e.g., we currently only detect it on pseries.
>=20
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
>=20

LGTM.

Reviewed-by: Russell Currey <ruscur@russell.cc>
