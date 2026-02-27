Return-Path: <linuxppc-dev+bounces-17381-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOUsCBRsoWmxswQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17381-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 11:04:04 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3E21B5B8E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 11:04:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMkSJ170bz3bkL;
	Fri, 27 Feb 2026 21:04:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.149
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772186640;
	cv=none; b=a2GEt1VydsDxTvxTBY9xdeiK2LGn6UJRv8ToXfvJZH59GL7TAjGbr+nr2WoA/KX0Yy9CqTDqcoIolJjpt2IYQV72oYJrBTOBTECO1/9F6tcdW4Fg96TBg9ObeEmAJ4Jc6L/73sHF/BFH25g9gbwEjOmlVYtKeJNCwNFbnRPzJJ1VKLdqJbbLO1syXvUmE6QDp4b8fxex6qt8191M3SsL2TxUvhUTVmAoPCJFCz154p1wu7CrrM6AMp9g2zJOWAbXP8yUKd+YkEByd2Ub/gtB0CN/FY8TnrJdYlwk5qAwbuoNKaGSOmW097nZVTWvQ8fJe1NQTmhaHSdwSxM3STKp7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772186640; c=relaxed/relaxed;
	bh=nEaP1MgVxgQ3e7YsVXAGPgHJKsnww/Vf3QcZ3FbEIXM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=FyMJfJEufcFRnXORtrG+iE1xwe1nse+fXF1dQalZTBcGOaSj3jxRt0BMEdkSb3bFqOumPXVKpmIxxl+KzclZWxZbNs8PAE1cdZceWKY/88PywZFDWkVDTwCKRo/xAdTcHoRp//Nzjd8NMvUFctbl4QE9He2p7llxHDxNwN5VsQanyAtKC8DmLf9GaqsoJTdgUAlJR82DC3H9AdIVPPA/Mvmw/k8eQqZrodJoYHiQXLHtIDQJ/Gc5XAhUmqVu37DXP7iyvaIc1Dv11Uj1EejmE5kY/Yrn/mItCXYyuLqwh+aDGHNbziky+mMoNHbGS2Y7nK0/yrL726eZ6MNKSi6dbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=lrmG/SqQ; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=bMYZLxBp; dkim-atps=neutral; spf=pass (client-ip=202.12.124.149; helo=fout-b6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=lrmG/SqQ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=bMYZLxBp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.149; helo=fout-b6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMkSF1CLxz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 21:03:56 +1100 (AEDT)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 8617C1D00147;
	Fri, 27 Feb 2026 05:03:53 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 27 Feb 2026 05:03:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772186633;
	 x=1772273033; bh=nEaP1MgVxgQ3e7YsVXAGPgHJKsnww/Vf3QcZ3FbEIXM=; b=
	lrmG/SqQnIpRcITU3E0XLKe+Y7T8Fgs99aJSdN94YJY2XfdV9Ymr2Lpp2Fd9A1h1
	93QEoC6K4RhOUU/0CXS8Q3y0jyFpfsgPJidPVp83NV4wvxaaU6ov9GD/HIoAeH58
	R36PuaW/OYXMBSU7gLzkRKjb6Y909d2WWWRce5us9F4DJdQLItv/yC+SQbZ8lx5T
	OcE4BQVUdiB39F4rs9bvLWeGU+2fJDdamENFL1vlG3oHgHF1qIg8qU5lO3lkRWDT
	sPgr1PAZpDU32yF4BxgcFDHOOeW5YhICl5cymsd7NmvQB+nrnONNrIHLIP7JYjrV
	tyLTTigwbetFiaaJW8MpGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1772186633; x=
	1772273033; bh=nEaP1MgVxgQ3e7YsVXAGPgHJKsnww/Vf3QcZ3FbEIXM=; b=b
	MYZLxBpXhZv/mJ8+g59OMglmBI+6sDOkz3q7qSimffuFO990wOlZdH6PE4h7qltJ
	vh2rUBHLfFMP78Tv1hQq8Ht0f/fuzhlIvkAeYzNrf5JGdiRfzFU9iwDjHP1Sej1/
	msktaoVxQWZpiTre12+rZouOQ5QG5ccFJav5JRP+Id72/EMrYjRph9EYpJZkEZ7/
	ObmY2NPFFXPQcZmdaJIMXo/1GstLyM+mhCG5MsZpQAZF9lFaeBZ5Hb1zgLeJu6LF
	VdUDHQ9gOZ5sOhlgqCRvsNVL9HsN/+KW7COOT/NKP8D8yqE5qn00RxBGPxDXysBP
	QKwWyHrOg+XCDuteEf9ZA==
X-ME-Sender: <xms:B2yhaT5qOXD_21o2B_pfBMxe2xbsAZauhwJEgUFGmoKSTKyH8jRXGA>
    <xme:B2yhaTvEnO5qed2AJCMka9Koh9uWNJeDy2su-OqclA5-NSGJR-0ZjRWptBWiY6vog
    htKhgw4vdL4ESZbk6_dxc3dQHhhKX7xARjRDEvnbj3qTsHpLuNBTg4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeekjeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvddupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopehtshgsohhgvg
    hnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtoheptggrthgrlhhinhdr
    mhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehvihhntggvnhiiohdrfhhrrg
    hstghinhhosegrrhhmrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhig
    rdhorhhgrdhukhdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprh
    gtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptghhlhgv
    rhhohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhuthhosehkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:B2yhaX0MMhK2hJ8xKYmKGjEeUCgFwabdV8J3J-4bQCQ7W_KL3E17DA>
    <xmx:B2yhaRpG1WW1_Y1W3dyhN1BiKGzxBLlmlIQe873sQvra-br8Y9qaug>
    <xmx:B2yhaX7RvPLc-eiFM8dDqfJc91ZhnTYp74OuIq3CHOn6f9Ki4qaI7w>
    <xmx:B2yhaRxaFWUSMm8gLpWuJeIN_bWR_6nGSVh1CEfd8Tag38ai0Sjs_w>
    <xmx:CWyhaU663-xqNWC5VjCK0RwTSsUG_79PFncgIvGG1hfcm2Zdv24MqNHX>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AC08A700065; Fri, 27 Feb 2026 05:03:51 -0500 (EST)
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
X-ThreadId: AC9z6Mxcl7jk
Date: Fri, 27 Feb 2026 11:03:30 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: "Andy Lutomirski" <luto@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Message-Id: <a1533e92-5d95-4c11-959a-a73d90eaf030@app.fastmail.com>
In-Reply-To: 
 <20260227100849-fb0bfec5-4d67-409c-8dc4-dad10c84fe98@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-5-3f0286a7bac3@linutronix.de>
 <7fb5b531-2d78-409f-8f65-e12757f9296e@app.fastmail.com>
 <20260227100849-fb0bfec5-4d67-409c-8dc4-dad10c84fe98@linutronix.de>
Subject: Re: [PATCH 5/7] MIPS: VDSO: Drop kconfig MIPS_CLOCK_VSYSCALL
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.20 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm3,messagingengine.com:s=fm3];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-17381-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[arnd@arndb.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:tsbogend@alpha.franken.de,m:vincenzo.frascino@arm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-mips@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[app.fastmail.com:mid,messagingengine.com:dkim,arndb.de:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 2C3E21B5B8E
X-Rspamd-Action: no action

On Fri, Feb 27, 2026, at 10:31, Thomas Wei=C3=9Fschuh wrote:
> On Fri, Feb 27, 2026 at 09:46:23AM +0100, Arnd Bergmann wrote:
>> On Fri, Feb 27, 2026, at 07:57, Thomas Wei=C3=9Fschuh wrote:
>>=20
>> The #ifdef was originally been added in commit 7d2aa4bb90f5 ("mips:
>> Fix gettimeofday() in the vdso library") as a bug fix. This may not
>> have been the correct fix because I don't see how it addressed the
>> case of a kernel with MIPS_CLOCK_VSYSCALL enabled running on a
>> CPU without the timer registers, but I think we should try to make
>> sure that there is no regression from reverting it now.
>
> I can't make sense out of this commit. The generic vDSO automatically =
falls
> back to the syscall if it can not handle the current clocksource.
> There is no explanation *why* this should be broken on MIPS.
> It works correctly on my x86 machines.

Agreed, the explanation is incomplete at best. Maybe Vincenzo remembers
more details as he did the original patch.

Maybe the fallback logic didn't exist at the time of that fix?

> Also vdso_clock_gettime() uses the same codepaths as vdso_gettimeofday=
()
> and apparently that is not broken.

Not sure, maybe nobody noticed the bug yet, or maybe both=20
vdso_gettimeofday() and vdso_clock_gettime() now work correctly
after another bugfix.

The condition is fairly rare, as almost all MIPS systems have
a working clocksource, the few exceptions I see in Kconfig are

- R3000 based DECstation
- Sibyte
- Ingenic Xburst
- Octeon

There are not many users left on R3000 and Sibyte platforms, but
Xburst and Octeon were reasonably common in the past, so it should
have come up at some point.

>>  config MIPS_DISABLE_VDSO
>> -	def_bool CPU_MICROMIPS
>> +	def_bool CPU_MICROMIPS || !(CSRC_R4K || CLKSRC_MIPS_GIC)
>
> That is an an independent optimization IMO.

The idea here was that doing this would save you the trouble
of figuring out exactly how it was broken in the past and
whether the #ifdef is still needed.

     Arnd

