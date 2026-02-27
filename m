Return-Path: <linuxppc-dev+bounces-17369-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEgNOshaoWl2sQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17369-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 09:50:16 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1149F1B4AF0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 09:50:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMhq947cQz2xMt;
	Fri, 27 Feb 2026 19:50:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772182213;
	cv=none; b=FpSEdFs8aADzxQCyXqojO5bEEv5qyRHVUtqlrQYSXUtwAPI5qbttlUl+ObEs0/wdjDvy6fkgBaeSXK0+O9Q5hPc4dpt+zUFu2DkrysJ4rZKgobatFX0VqOSqcSOeYtjwdfjLqKF3jSiB01uFp/YSOTSZNA6+EfzPYfMJrmYOhpGaAmmtC4XLcg0X+oiyxSQDwGrus9/wcUmP4p3XeSZjOAPlDPDLioAPx4b3BycG36o4NkzkdqbhKtw3ATVUi+OyfnOilIN5Os0YdHy1/p4dEptJYZ2SuKaDj51ar2LyCBiNwj9tlIgEXAoKYAPFtA5bqjnB0r4Wm0UiMH8Mg5XXSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772182213; c=relaxed/relaxed;
	bh=xwefPv2uVlZj1+2rN1oX1U6/y4L5neteDEWAT3K3DU0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=M5WjWzXYFy4FKdpt3grjKu4jQIDLLFoH4cgZ92WeFPBGmINesSFAnFXd3jQteLov7n0F5uKQhVxgIwTImYvM8Y0OyO9ZzBMesgM4uO3bNG6PVPu2wo00bY3Rp1a2ysGy54r+Gl0VV5+KQ0aOEleRdDX8uCYFKpNtSZpvnUp+DIP6Oh4hj/+ebcMErfN5HCn0WZKNw/jTcuWvx5bAW2sTZcag/0pw7RZDeLwppVPbzuGfresXy1Xa9l1n3oYK5UfeFsDGAf1nn+qhymCl9k8nnhimGu+Hfdnxs0Oyy1hzZ0S4wDiQdTGdvWutJwWs8uV65Aa0Q0vUZM14RsQWGpeVdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=CpQkqgYf; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Ya59htWC; dkim-atps=neutral; spf=pass (client-ip=202.12.124.158; helo=fhigh-b7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=CpQkqgYf;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Ya59htWC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.158; helo=fhigh-b7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMhq86Sk5z2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 19:50:12 +1100 (AEDT)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DDEA77A006C;
	Fri, 27 Feb 2026 03:50:09 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 27 Feb 2026 03:50:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772182209;
	 x=1772268609; bh=xwefPv2uVlZj1+2rN1oX1U6/y4L5neteDEWAT3K3DU0=; b=
	CpQkqgYfKds40olKRxYLSKAiGe5Rmy/9BCh5Z7MPXPxZ5F9LkngTRdlArkVNRjl8
	7ZqGnCIKRmMyrZJeCBiLf4/HN2UwaqtGzYvz33ugvRadhG1Ukrmp9gQIHnpcxj2z
	4tWE0307vhEYdklvnh8Hp2KUVlCY1Kc6fUscg6oVc4PMeNbnjdT+Jw4IKQ5SIwGf
	A0XFJqGIxJV+b9Pw1NfRhTq32a56fOkq43bvOQgPrBhd+4BNZGnpTo63/4pVj+X3
	ziLnwuOGm/2TpCZHvvuD3JP8kb36KC7Oxq5r8aLFdoVFMaA29W4RRCcbbb9lHQNC
	z9UDShjAp+mcTUCLvFglqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1772182209; x=
	1772268609; bh=xwefPv2uVlZj1+2rN1oX1U6/y4L5neteDEWAT3K3DU0=; b=Y
	a59htWC7mo5ur5Ru4AgAGJLqF9zIgIxnBpDFt5UgHdLUD8RPtbpyt3V3Nt80/SK1
	k1hirZHj7G2q9sY4pZHUbqslH90QY8FE6DUnSY2L43FKyo0yHdaX1R+i9qRbdueL
	oL5yGYKXrCmJmqN9TiNymHUKYlqr4aejj6YWngHGjFwY1NTAMsVN2i5jFim4J+HC
	jCNbCrQQqButTpG/aSIHiFGyg7L7CdSE0663rkLBd0WsuSZ5mk9mfHw6i39ZWAyk
	Il+1PcbDoIlUFKKriY3O+5tFM3Eh7mCjfOS6/3ejj2OtGerRvi9WC0OxavVSe0pz
	8M9CQwwTcyQnTocXUICqA==
X-ME-Sender: <xms:wVqhacI1rkOi6xw-07DwQDbocsXu_hDWjrP2hK5KGSJsQn4jHH6Gog>
    <xme:wVqhaW8D4Pu5jKC7Qcu7NwRD1ra8Pw5CMbd0Q6E6L46abVMVGzPr63Yj3dB8PfSR5
    QMVPd3tdG80nQ3287dbrTxU2-um9ej7tIYsHfo_fg3gtluKACfkysiP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeekheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvddupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopehtshgsohhgvg
    hnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtoheptggrthgrlhhinhdr
    mhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehvihhntggvnhiiohdrfhhrrg
    hstghinhhosegrrhhmrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhig
    rdhorhhgrdhukhdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprh
    gtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptghhlhgv
    rhhohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhuthhosehkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:wVqhaaHGvD1Eiphu0UQvGUsq8vY3JJvW3HPTel60R0guHhN6xnR5Rw>
    <xmx:wVqhaW7fUmT6ZYnp_qtntaBRP9PPVqGSyZrlJMiGqJqhTltRN6xefA>
    <xmx:wVqhaUKSaFcKmvsheEHP93T2yCFnay2qeiSgMOXt0_B0uhzNXAAM5w>
    <xmx:wVqhaZCFFj7dMt-LHLYVuTBmp18q048sjfw7koAKvPBMhqTeSHu69A>
    <xmx:wVqhaVIB3264bON7NJGum-trK_DULEFvHVCsrGVbwK02X2Xrf1p4BHQc>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6ED33700065; Fri, 27 Feb 2026 03:50:09 -0500 (EST)
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
Precedence: list
MIME-Version: 1.0
X-ThreadId: AULtxbNmleaw
Date: Fri, 27 Feb 2026 09:49:49 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Andy Lutomirski" <luto@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Message-Id: <0b12efc9-0c3f-4a4a-b6fc-0e5c9a6d2cde@app.fastmail.com>
In-Reply-To: 
 <20260227-vdso-compat_32bit_time-v1-7-3f0286a7bac3@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-7-3f0286a7bac3@linutronix.de>
Subject: Re: [PATCH 7/7] vdso/gettimeofday: Verify COMPAT_32BIT_TIME interactions
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.20 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm3,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:tsbogend@alpha.franken.de,m:vincenzo.frascino@arm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-mips@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linutronix.de,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de];
	FORGED_SENDER(0.00)[arnd@arndb.de,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-17369-lists,linuxppc-dev=lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1149F1B4AF0
X-Rspamd-Action: no action

On Fri, Feb 27, 2026, at 07:57, Thomas Wei=C3=9Fschuh wrote:
> If CONFIG_COMPAT_32BIT_TIME is disabled then the vDSO should not
> provide any 32-bit time related functionality.
>
> Add some build-time validations to make sure the architecture-specific
> glue satisfies this requirement.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Good idea

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

