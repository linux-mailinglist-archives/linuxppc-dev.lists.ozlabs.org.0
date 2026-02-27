Return-Path: <linuxppc-dev+bounces-17373-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DK/GthcoWmDsQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17373-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 09:59:04 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DD41B4CEC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 09:59:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMj1H2bTcz2yFQ;
	Fri, 27 Feb 2026 19:58:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.148
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772182739;
	cv=none; b=nK0fs7mtzFQmNHp+BlAGydhGkzcRXQKoeMOWicL++2VZDFatQue0T2f95JY+/wy2EsP4W/4aLQo0SOmgXDWEIknGe8qyWTrdZICY7kccMPAmFfQKelS4hrHL4eWwo7w44CQoEgJ5UGDOk5wroVjqQYp+4KhGfrkg7/I8g5jaw4G3bajjND/kpEaDyBB9n/6FNgNOP/iRMkgc7dRc4dXx9XAizTF9SBUbrWiwYyTFdr2FanqSxqfkmhIFOPJJ4XE0jKcNJrBJfuKt8lay7rQl5dnzkrW7f/OjdxF3ZQXli1fNDZ4Z4/qQ4jiKMxB1T2trfQVUJabPQQ+VYUs1oP37ig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772182739; c=relaxed/relaxed;
	bh=nVR0/jHCHCTybsnFppLJhwJIYngbvSaKTgEl/9JqNSo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DoDG5ohjd0GMMMs63vEAGOvUiVVQmVrP2zONiVUZrVUvKds62xA8N4SWrkddMgNL1g1H/8ELqeP09Tp9KPcMxE2FJcnZbWitSlffnebX5bYMNj5veXCknSTqq/aAHneMzN25+vwXMBaEOx29Sul8i1S+KCoOeLyrI1l9RA6M41SuqKRHBP3ukoRlMvoQkWbHq6szERXHUlvBpTk2aPv8tUo0wE19w97CnfwLtvhB0BHe+PlfY1qZRPaSIEYqp0lJxuMLN+b+frFkKFg1gIsx9kblfHQg2UWEgmMRE44m9FoXgxq2E/7BcMzSnNJJpCMT2gDh8LsWIw73Hclx5kItig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=B7eMZx4h; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WJzCKqPG; dkim-atps=neutral; spf=pass (client-ip=202.12.124.148; helo=fout-b5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=B7eMZx4h;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WJzCKqPG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.148; helo=fout-b5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMj1G5TXWz2xLv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 19:58:58 +1100 (AEDT)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id AAFD61D00127;
	Fri, 27 Feb 2026 03:58:56 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 27 Feb 2026 03:58:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772182736;
	 x=1772269136; bh=nVR0/jHCHCTybsnFppLJhwJIYngbvSaKTgEl/9JqNSo=; b=
	B7eMZx4hKVMLP4/fUiBh5TwyL0/COXRDHA3c32Ydsu5eXpS7xYjIi80vE2HFdW3u
	dytOj2XUHXBdqdO7IwWHRAZmOzKKfdUqltsNHWshkKpVc5IhR0mXW7TXMuAz3CP3
	iz0rm/K+wZmyU3dNxo/SCg8l5pskcKRR2B58cinrX8AI6OE5KInXOancwZjGpjDW
	b5vxVDZs9Gv04y6d4/Dl7KYbPv1Q42h0OYKJqQxBlvc1syWIsd/fad3vyr2HNCob
	Sw63Ja2x4rfLahhkp8QVi7W6JaDgm2u8n2DJVn0zhjCOaiUjmD7PReXWSLUgS743
	Etjjz/VSUL8uTZ430bDGPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1772182736; x=
	1772269136; bh=nVR0/jHCHCTybsnFppLJhwJIYngbvSaKTgEl/9JqNSo=; b=W
	JzCKqPGj+ok5fdimIrdSvoG0b2rhDbFbxg+Z4oV6TBEWwTbmv7GJpVuaJ10WAqhb
	a3orhxuqeIogyQbj+bR/3KK1iPsv0AlMfWsuo54nZnM8fNcXNLFAwa4b969gaqU+
	EI7GCT6TXi3Frms37bg7jozgJCHJOkDaajfuoUbLMW9+qJSybjnv+qlYXW3dAbgs
	SBLBMj9/QVwsTv0Xws/GSeZi0XB50dN8V67LhpCQ5bgSE7GnVKCzgJ1K8UUxOH/J
	23SCTtoUuKenXzJOTIjZ4ZCYrEhH+SRCWXn3BEfNecm2SSvMH9D95xKdd7Dm0rx0
	Sja6fef77et3Z2hHGr42Q==
X-ME-Sender: <xms:0FyhaQrK2tHArSP0tjf6QtNa4PmQw11xpvTel2O84eAuXPW41C7Tgw>
    <xme:0FyhaRfWc7T5yfllWxtssXaS-uATvEDw1YPopV76YXZBxmpw_oh0Pjg5cgfMppFGR
    jr--RmHJ-gCaZ_64RHyEukfkNFYJvYI1kfdQ86lzN--SxpWxLIULTAs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeekheejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:0FyhaQr1uk4-oN-CjkdyXVpeCTOgFy2L34CbK9ea3nr5SOtFxcj3hA>
    <xmx:0FyhabhEShFKEkqU8z1w5P_Qk6OAfURF76oXBGYYX4nEu5yxa8I_YQ>
    <xmx:0FyhaSyjKFiFOn0MP6LM4SXCmeLmyfnKiew9Y5uoziXjb-xyU5UX8A>
    <xmx:0FyhaZ_RGa3TuNh5CDrfbBzUxxwVNHibdt9uXrhzeqhL9toSU289Pg>
    <xmx:0FyhaR098kJ6FLglrpM-x-UirrOo6DBbRUiUGfGAseQHx1zY4r1LSwgC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1E039700065; Fri, 27 Feb 2026 03:58:56 -0500 (EST)
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
X-ThreadId: ARwL1vy566MZ
Date: Fri, 27 Feb 2026 09:58:35 +0100
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
Message-Id: <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
In-Reply-To: <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm3,messagingengine.com:s=fm3];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:tsbogend@alpha.franken.de,m:vincenzo.frascino@arm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-mips@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[arnd@arndb.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[linutronix.de,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17373-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,arndb.de:dkim,app.fastmail.com:mid,linutronix.de:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,messagingengine.com:dkim]
X-Rspamd-Queue-Id: 57DD41B4CEC
X-Rspamd-Action: no action

On Fri, Feb 27, 2026, at 09:51, Arnd Bergmann wrote:
> On Fri, Feb 27, 2026, at 07:57, Thomas Wei=C3=9Fschuh wrote:
>> If CONFIG_COMPAT_32BIT_TIME is disabled then the vDSO should not
>> provide any 32-bit time related functionality. This is the intended
>> effect of the kconfig option and also the fallback system calls would
>> also not be implemented.
>>
>> Currently the kconfig option does not affect the gettimeofday() sysca=
ll,
>> so also keep that in the vDSO.
>>
>> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Actually, I need to revise that. I think gettimeofday() should be
guarded by CONFIG_COMPAT_32BIT_TIME for both the syscall and the
vdso. Looking back at the history, I see that we added the #ifdef
for each syscall we modified to have both time32 and time64 version.

The thing about gettimeofday() and time() is that they don't have
a 64-bit version and libc implementations are expected to call
clock_gettime() instead. The result was that there was never a
patch to turn the off either.

     Arnd

