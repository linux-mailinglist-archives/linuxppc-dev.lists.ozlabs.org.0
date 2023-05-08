Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A596F9EAF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 06:33:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QF7hQ0z9Pz3fKq
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 14:33:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=I03FL3X3;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=NSzIMn1C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=I03FL3X3;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=NSzIMn1C;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QF7gZ4vpdz306l
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 14:32:42 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 7E98632007E8;
	Mon,  8 May 2023 00:32:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 08 May 2023 00:32:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1683520360; x=1683606760; bh=rjREs6nAALf9hWeNcfkBf/IGI9wFDxPxZ/4
	iS2hO5Fw=; b=I03FL3X3WPPSzLQUOGwIPFpdJoQ7tfniSfWpbRyHBzi3/70kOLy
	n9ia4Kbkv6nmCjxXQUAJ4m8tCKWt+DMPm3gFEx3AWxYstjurZbgfwEHokT1JNAWc
	TrN5PixUivE1nd4bRFrQeANr8KIRZ46CWZyVL79JmcGyVJVRq//LlAM1nS717VvL
	u4Vpm7Amc8tVfOM9SyqlqDCD8C8amb1tNvXzXfcQLtxQAScD1iJluPk87quw1n6p
	IZ1X4hJJlQIRRtCSPI9JJYVMjMvlfT0QF9xlfAKv7v7/A66fDdkPbGcYoX/4BGfC
	dtVd7PCPsO77bmwW2UI0R9jlhHdoA1hC6NQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1683520360; x=1683606760; bh=rjREs6nAALf9hWeNcfkBf/IGI9wFDxPxZ/4
	iS2hO5Fw=; b=NSzIMn1CbmrEO6yG+J1gOd3zfLuHfobSva6cCnONTws077KrnwW
	XsDP70A9WBd837lhPMTupNRRv058cdDYu8aSgPuytaACJIK9x2jB2kHUEA9VT4WH
	qu8zrUVzVxp7seaRrH/v30ARLUPSZRdw1tVKRhr27jKR5164TlRUAyw0CUkxV+yt
	V3YEML9x/WKEJcIA4DCJjb4CVVL9TLlL7O/spDOo3UCdlngBbaltxoNzAo34O8sR
	W0P20GX+IVIu8hUO3lOxYOtIsCbd2wvyTR2P36DkOG0j+em6NMY9Ha2KIDgHh6H1
	hXnZ4Ky8c/uwI7Nu5sfwoD3OtLb+KLxJfaA==
X-ME-Sender: <xms:Z3tYZAtHRXV2iLoCAH_wVPSBigc7NRTMag3fCCR0ptmK0z5Rh_dw7w>
    <xme:Z3tYZNc9bXwh_XaTgYnPNJzvKMhh1485mIF0zCmpB9GBzMlIWIHMz0Ryl6pFQ0xPj
    CgPK9_aLi95oJhcIg>
X-ME-Received: <xmr:Z3tYZLzWpotw0eruI7PuL078kWtjwo5l_5KKpCIOzbU3_JbPiXBHpJwH8Go5urj48rMtCuEDUPxcSS7y22f2j0hA7YIIg1HN_DOMobagLvBlFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefjedgkeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludehmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredt
    tderjeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruh
    hsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnheptefgieelhfeufeevvdekheeifeej
    gfefgeehtedukeeigfduuddtueekteevleelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:aHtYZDPCKZ0kAyJlN72L2UtUfVB5O8qz8Dle5_p4MCtf3PrxZc-4yg>
    <xmx:aHtYZA9GieyaLlrbhbwXrCe29IQcJ9RvnD6n8NX0kFb2srbbKgNHVw>
    <xmx:aHtYZLXqHiTTWor-wqFlG_sqbLbyeRK4v8DW2H9Iddn5lGqLBBowFA>
    <xmx:aHtYZOnAtQv3vRh16F62Zg5WjhLgNY-MMLS_r7LXS71YUhQQ4Up79g>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 May 2023 00:32:38 -0400 (EDT)
Message-ID: <9aec74cceccb016effceecc01f3ce2bd1744e2cb.camel@russell.cc>
Subject: Re: [PATCH v2 08/12] powerpc/ptrace: Expose HASHKEYR register to
 ptrace
From: Russell Currey <ruscur@russell.cc>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 08 May 2023 14:32:36 +1000
In-Reply-To: <20230330055040.434133-9-bgray@linux.ibm.com>
References: <20230330055040.434133-1-bgray@linux.ibm.com>
	 <20230330055040.434133-9-bgray@linux.ibm.com>
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
> The HASHKEYR register contains a secret per-process key to enable
> unique
> hashes per process. In general it should not be exposed to userspace
> at all and a regular process has no need to know its key.
>=20
> However, checkpoint restore in userspace (CRIU) functionality
> requires
> that a process be able to set the HASHKEYR of another process,
> otherwise
> existing hashes on the stack would be invalidated by a new random
> key.
>=20
> Exposing HASHKEYR in this way also makes it appear in core dumps,
> which
> is a security concern. Multiple threads may share a key, for example
> just after a fork() call, where the kernel cannot know if the child
> is
> going to return back along the parent's stack. If such a thread is
> coerced into making a core dump, then the HASHKEYR value will be
> readable and able to be used against all other threads sharing that
> key,
> effectively undoing any protection offered by hashst/hashchk.
>=20
> Therefore we expose HASHKEYR to ptrace when CONFIG_CHECKPOINT_RESTORE
> is
> enabled, providing a choice of increased security or migratable ROP
> protected processes. This is similar to how ARM exposes its PAC keys.
>=20
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

Seems sensible

Reviewed-by: Russell Currey <ruscur@russell.cc>
