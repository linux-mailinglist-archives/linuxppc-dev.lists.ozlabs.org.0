Return-Path: <linuxppc-dev+bounces-17634-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KK4ERJLp2n2gQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17634-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 21:56:50 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D7D1F707D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 21:56:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQSld5FwBz3bf8;
	Wed, 04 Mar 2026 07:56:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.145
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772571405;
	cv=none; b=M6Rmk2T5rv6KitwZx5rHA++y59XnDPd2Ly8i1RVFCl9bqg42DBJiu/wlp3n1J5U32osmMy+OpJBoOVMpt2n4/0ww2KLFTrmF7JYn1KAz+A0K8IyXq+ytociGnDCQkdViKajH6FsLJOM1dkr+jyeEDPeedXk8N/ogmeCXNqeTF9VD/wkIlxpnhvXWVBrqiOopTzqcR/r3w9qWIahwe79Hv1gQth/VP0YDhzZ4clFd44ApYLr5bhvwYCsZdSeHPJuM+StYU2QjuwxLxkCoLDHM0asUGl7j2Kx+eGvOqdKPJR/aiWPwWLEtTILEQVhVNXgKD6r4gZqMsIyGJtBLQJxYhA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772571405; c=relaxed/relaxed;
	bh=W4+9AyMIj1WDxYgl7TvopUa7BgXQ+cJMbbNJ/Z/1ir4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=CA6EJrYL9Ub/LNPBT7AT7V2ed6yziJ01MZ3oFB0VJwxWgTWmzJ03nEChaEV8tzlG+iM+CZo0JMsdzzrQfTZ47bL1fRu7ltxInsCzUZbmuJctAuVaOA4B3XLJTTdPTpY3ow2f+2IXhiEj39b1/afl5wTgXann4MdB4nm+IMjz5idl2FFuUMTbqrJUjwntRJB93NGHjNicSW+Eq1EJD/Gz5uRaAQ/kbl+OORdtFTxppHxJ9ujOOhyxQsRr8x3Xnfue97FwaqzPkM+hEn3RBTOO57VsJ2rDQZCrmyBppPmINEnXaaY1Wjj2uo348znjB5UMfhLWIO7dvn3MKBlrdZMipQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=pLDSmkoG; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=YTVlBjzR; dkim-atps=neutral; spf=pass (client-ip=202.12.124.145; helo=fout-b2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=pLDSmkoG;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=YTVlBjzR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.145; helo=fout-b2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 331 seconds by postgrey-1.37 at boromir; Wed, 04 Mar 2026 07:56:41 AEDT
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQSlY4mWqz2ySS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 07:56:41 +1100 (AEDT)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 4CC3D1D00091;
	Tue,  3 Mar 2026 15:51:06 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 03 Mar 2026 15:51:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772571066;
	 x=1772657466; bh=W4+9AyMIj1WDxYgl7TvopUa7BgXQ+cJMbbNJ/Z/1ir4=; b=
	pLDSmkoGAjS8lnVtR1khysjif4VTY5cRWo9PIxyDJiT28SEFPnk1yXN58zkVxEMh
	GFW1phu55AtGZbKUNoh3VcX9JTNkCzW7xIACqKccu9Yi2xgImIbaihihSab3Ybcy
	ZvzdJ9KnUtHX1L96Lz7VaETXaw0WUeq2GiwLcE6rz6wfW+eI9zJX585FXdCVD7tl
	X/ZMK3WFoNbmP0JCWCs6+hhgv/UQvUhqfxQhQnXjEDrZ2LaRSAzKVL24K3PzJhIn
	rqjjxOu2ekH2xWndLoEQtcbD8+ZX+k3wfPuxfVMI3M5Nh4HTdK7tar6AT4OhAaVE
	NNHUNEpsd4v5NMVnDGl1cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772571066; x=
	1772657466; bh=W4+9AyMIj1WDxYgl7TvopUa7BgXQ+cJMbbNJ/Z/1ir4=; b=Y
	TVlBjzRPOIJet/lh3awFNLl+wSE9XarGY7dyctHiw5tGwZ6LRJ3BrauySyy4mzo0
	b0+dmt15Vi2YI3e9F9TlBU30QCqEG5DY1aVhkCoxyCw1e9CyBFJ1RYuMAgn+NGDb
	6jVVcHqBihXYHtfSXv2h/C0REEUlC4kpEOGjzIHLx3Pd90Iw46MOeQyLcV/cFl+E
	5dZqAzFlk60ZLRCJhmu+gRhtmD+V3HzFy3GlHl8IKJ69OzkPyaZFRzxeRWMWHXa3
	0ck/5T/lVenCbLgUVMTqHhaKndC/nJbyDoy1H5u/Y2BPqio99jPYioYRMJHI3mjS
	S58LoC5QRY0ZI/dbjZyuQ==
X-ME-Sender: <xms:t0mnaTNMr7HRS--AuI8r-Sjs0TE5jFMLYGjK3yJPu0GcoqGNF90Dww>
    <xme:t0mnaYwXrHoghs8YGSaKStp_jMggeks5AVkqXKoty1d9tlJzn8unKKfyiC4rOp_Hx
    1VCQixKCnYpCwvpJMpvifb4MBADS_tOIRySc2OTiVe2hw8vnsMqbhs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieduiedtucetufdoteggodetrf
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
X-ME-Proxy: <xmx:uEmnaTovlr41bMOoG-myb6wYD6yoZjgMxJaD4C1IsznfOvQliSGM7A>
    <xmx:uEmnaZPe6a9Yagzc6v8dA-19Wn_ba6NmwvRIUy5a__y8EQwCklW78Q>
    <xmx:uEmnaQNzCnwjn_-woKHF5KKnpyufa8dxgdgTmaQq9JlXYt8CehqaaQ>
    <xmx:uEmnab2d3NaeSyTEJISJaVuDlDdHY35r82elxjQMDUg6M0f0aHZDjQ>
    <xmx:ukmnaaN0mkEav7UlHMX3vyXNihfd1xX8twV1ttpCy-ygb33aiA8wnMPB>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E3624700065; Tue,  3 Mar 2026 15:51:03 -0500 (EST)
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
Date: Tue, 03 Mar 2026 21:50:33 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "H. Peter Anvin" <hpa@zytor.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: "Andy Lutomirski" <luto@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Message-Id: <2b1ac7b9-fcc8-4aa3-a0ad-eb37e4bce030@app.fastmail.com>
In-Reply-To: <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
 <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
 <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 48D7D1F707D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.20 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm3,messagingengine.com:s=fm1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-17634-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[arnd@arndb.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:hpa@zytor.com,m:thomas.weissschuh@linutronix.de,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:tsbogend@alpha.franken.de,m:vincenzo.frascino@arm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-mips@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[app.fastmail.com:mid,messagingengine.com:dkim,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026, at 19:11, H. Peter Anvin wrote:
> On 2026-02-27 01:34, Thomas Wei=C3=9Fschuh wrote:
>>>>
>>> The thing about gettimeofday() and time() is that they don't have
>>> a 64-bit version and libc implementations are expected to call
>>> clock_gettime() instead. The result was that there was never a
>>> patch to turn the off either.
>>=20
>> gettimeofday() is currently the only way to get the timezone of the k=
ernel.
>> But I guess this is a legacy thing anyways. If you say we should drop=
 it,
>> let's drop it.
>>=20
>
> The time zone in the kernel has never worked anyway, as it would requi=
re the
> kernel to contain at least the forward portion of the zoneinfo/tzdata =
table in
> order to actually work correctly. The only plausible use of it would b=
e for
> local time-based filesystems like FAT, but I don't think we bother.
>
> A bigger question is whether or not we should omit these from the vDSO
> completely (potentially causing link failures) or replace them with st=
ubs
> returning -ENOSYS.

I see no harm in keeping gettimeofday() in the vdso when
COMPAT_32BIT_TIME is turned on, as existing code will call it
no matter whether it's in the vdso or the syscall.

Equally, I see no point in having either version of
gettimeofday() or settimeofday() when COMPAT_32BIT_TIME is
disabled, as clearly anything calling it would pass incorrect
data for times past 2038.

Neither glibc nor musl support actually returning the kernel
timezone to callers of gettimeofday in modern versions that
support time64 syscalls.

      Arnd

