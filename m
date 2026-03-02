Return-Path: <linuxppc-dev+bounces-17502-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QN2SE2tNpWmt8AUAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17502-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 09:42:19 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEE91D4C18
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 09:42:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPXVb2V9pz3bW7;
	Mon, 02 Mar 2026 19:42:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.142
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772440935;
	cv=none; b=hR8cv+hC6wUdoJUXB5k8RVbNzedFS6Ngwlt8g09KQzQX8N1WUN1avPvuCdwTrE9aFhIdiPPqrf13WQLJQKGK38MruYftPSlFRj1HYu6ztXH23DHU+VI3LbincSHXaO9iwYikf7sM+HCia1tdhokzjQmzrJe+WA6NNHXkiPkGm7fEF8m892cK7N0haXmumIqRW6GIKKTjVY/pMGiYrC6EYtC+6vN3UW3LCjcK1VYyiNacM6MRyrQzbdMMMoJ1X2Z1MxnUh6QqKAt+017cDv1hXUftQtEgi1MG6pD+es1McS5QGU2okg3WSJaWxNAKoM5kAY4MSfFc3C6N/MxA3Dw2aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772440935; c=relaxed/relaxed;
	bh=f9EDSr4xMvzlf0BcMt7wK4RAMOjexiFU1mqT7NX5ex0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Ze/5NioGZheQHftizjNC4nNx7UYGrb0jn/ruzkbj3p2hGOLZ5HJ1ll2ePkIQOBhGIgUEU1LjwsQrCyxgW7ntVzLjmO3n4Atme39IQX5YhNd07PvmRqkMXP1RvFof4Xt3BzeLnm4cTznrTxA7s1LSDHYTIx9wUqle8yyzAWovAVwwQREJb7hH/ZDRF86qebicAAvTX1gDZaTkTcrabYFPNdLwj/RcoIM6Yvig0VyFk43srz2UEyMEmAszcmmJVWRw18ZrSlsYo+kfIvlVChw4u7/qbpiFWpSMQnntjjpiDSYLBztFn8igg5UACd08+YJPSkwO9EFKwZwKsucw/cu12Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=TUnBqpMH; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=55jw/b5z; dkim-atps=neutral; spf=pass (client-ip=103.168.172.142; helo=flow-a7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=TUnBqpMH;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=55jw/b5z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.142; helo=flow-a7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPXVW4hXcz2xYw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 19:42:11 +1100 (AEDT)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 5CA8213807B3;
	Mon,  2 Mar 2026 03:42:08 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 02 Mar 2026 03:42:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772440928;
	 x=1772448128; bh=f9EDSr4xMvzlf0BcMt7wK4RAMOjexiFU1mqT7NX5ex0=; b=
	TUnBqpMHAoydoEYTrLWDb0aZrPuVB/vK6a/3kn7OiD+pahNYTDfybpqJxDQrmOhZ
	p+CJf/OKxzEnD/PmeU86UBe0NduQ/7EELXM64rnpHJwZ6H+Vgpz3vkhH4VlBdhxy
	ATVpVVig/9BuPuFABtbgeLJVtESdN1E8hiYCed7oNJFkeXEhpKeAOIDdFxKKTNk2
	yQFM+hSdU0OVA+BsbJJxOpNcdkuBKhztB43jle8LCwo+kE9D3vWpu1CH/IzJxAl7
	Ni4aockFVahhKUU/sR1NUGUd4uniIbwyrp+lCJMvoUlefBkzz+zUDoEFtF5snOY3
	Z5QTVHaENFpsbjTfCjhM7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772440928; x=
	1772448128; bh=f9EDSr4xMvzlf0BcMt7wK4RAMOjexiFU1mqT7NX5ex0=; b=5
	5jw/b5zOyZL211O2h7RVYKBeD+C7RgaSFBdTNLBKcutQYI/y66duSBYgZ6e/wzN1
	cli4lT82sotXzrGGhWJcvpp+0oAUUKA/8CI35OVHxsQxZFQwQTgMWTDoILnq+qpa
	dEnTtOH75aAXBD0/QGvly8BH04lqemD7jrEf3y05fWiRaiklQx+CKco4pHXjGgKH
	sVgxTi9znwv5PtVZN0PjdHi9yyrS0QncCbgJKm4wKrcPIUMSrZI65lB/ufhGJyVG
	tLL+ENdz6CuqyzpGEktpbQVIKJr24QMZyZyW9Tk8JeSsYsHLMAK3xVcuB3pibpcg
	h9ptGT7+l8ZZhv08cahjw==
X-ME-Sender: <xms:X02laQcXaTZEiboMhC1dISRQUofQtLKbBCxogIq7AUOFNE0swrmT4w>
    <xme:X02ladDrcb3TxEfgVRktHyM2KDrugM3z8hVQLqW3nKXHw3d1qG732L-B7pmI2e1tz
    -4g43VUnBySEbZamkpdIaCovfcvzFYBCzA6CO1sAm6A-LWLVbrgC9A3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvheejvddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvdehpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopegurghvvghmse
    gurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhi
    ugdrrghupdhrtghpthhtoheprghnughrvggrshesghgrihhslhgvrhdrtghomhdprhgtph
    htthhopegurghvihgurdhlrghighhhthdrlhhinhhugiesghhmrghilhdrtghomhdprhgt
    phhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptghhlhgvrh
    hohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhuthhosehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehtghhlgieskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:X02laQYxIxjZbwaPUiOj36ZKr7OJ1zIa75Ms3G7z40wpqEkU5eo8UA>
    <xmx:X02laUlNQJpJdWuCyZkDw0YqwkMWpP6aa51YA39ENjmufl2s302Pkw>
    <xmx:X02laVFfyv05lQUqgPj5uNwtMrdw7TVuqYvCSGtzmYauVlrb5kKdew>
    <xmx:X02labiunDrF_9AdGrcrpNLIZoadV9R5UWY0ex25SxHYGbPm0jNaDQ>
    <xmx:YE2laZbyTe9V1dRV5V0iEMQkQf0P2dhbuUJzrk2x0qgrVGNp13kA8ujR>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4BCAB700065; Mon,  2 Mar 2026 03:42:07 -0500 (EST)
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
X-ThreadId: ANWqLJ6kN0jc
Date: Mon, 02 Mar 2026 09:41:47 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "David S . Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>, "Andy Lutomirski" <luto@kernel.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <chleroy@kernel.org>
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org,
 "David Laight" <david.laight.linux@gmail.com>, linuxppc-dev@lists.ozlabs.org
Message-Id: <1ad2b22f-c57e-477c-bad6-96b9785e2373@app.fastmail.com>
In-Reply-To: 
 <20260302-vdso-compat-checkflags-v2-4-78e55baa58ba@linutronix.de>
References: <20260302-vdso-compat-checkflags-v2-0-78e55baa58ba@linutronix.de>
 <20260302-vdso-compat-checkflags-v2-4-78e55baa58ba@linutronix.de>
Subject: Re: [PATCH v2 4/5] powerpc/audit: directly include unistd_32.h from
 compat_audit.c
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.70 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm3,messagingengine.com:s=fm1];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:davem@davemloft.net,m:andreas@gaisler.com,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:sparclinux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-s390@vger.kernel.org,m:david.laight.linux@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linutronix.de,davemloft.net,gaisler.com,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,linux.ibm.com,ellerman.id.au,gmail.com];
	FORGED_SENDER(0.00)[arnd@arndb.de,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-17502-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,arndb.de:email,arndb.de:dkim,linutronix.de:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: EDEE91D4C18
X-Rspamd-Action: no action

On Mon, Mar 2, 2026, at 08:58, Thomas Wei=C3=9Fschuh wrote:
> This source file undefines '__powerpc64__' to get the 32-bit system ca=
ll
> numbers from asm/unistd.h. However this symbol is also evaluated by
> other headers, among them is asm/bitsperlong.h. The undefinition leads
> to an inconsistency between __BITS_PER_LONG and the C type 'long'.
> An upcoming consistency check will be tripped by this.
>
> Directly include asm/unistd_32.h to get access to the 32-bit system ca=
ll
> numbers instead.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

