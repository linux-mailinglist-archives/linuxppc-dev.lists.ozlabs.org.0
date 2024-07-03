Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 420D0924CCF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 02:35:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=Hwzk1ORC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDLQX0kclz3by2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 10:35:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=Hwzk1ORC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iki.fi (client-ip=2a0b:5c81:1c1::37; helo=lahtoruutu.iki.fi; envelope-from=jarkko.sakkinen@iki.fi; receiver=lists.ozlabs.org)
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDLPr64YWz30V7
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 10:34:24 +1000 (AEST)
Received: from localhost (83-245-197-232.elisa-laajakaista.fi [83.245.197.232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sakkinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4WDLPn43c7z49PwY;
	Wed,  3 Jul 2024 03:34:21 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1719966861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GaV4tuk1WbugWdGR34mCTzuCrF1HR/X8Zy5U2pP20mY=;
	b=Hwzk1ORCDLDo+ZiLXJZ9VZDcBs7xVnOnpn2RghTPQxZfI25659jdF6jLTsfX00r63/BfUK
	4LJpl2qkg+FsZzTi6qEj7aJZ+qm+T3Q8QG08lI9lpRhGYIid5OcV9mk9dhF5fKgG5cAb+r
	fOJEmy8yHRDQ23Vo27z6NynYLgwq3IUaJkTe7bAw4ek5Qe/33BCx2b2pveBwT/BVLlChT+
	SRxjiCB9EixM2pioAv2iotHdA1II0Mt9DbC4uGjOW/vyoPOM2mUUykK7UJIhSr7WzrAqF4
	vIvoYYMuxgqWZ/0OmKOUJElMv3Hc1HTYrq3uBKU1m+Qj0+zfJSR+r5JjUG1Fww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1719966861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GaV4tuk1WbugWdGR34mCTzuCrF1HR/X8Zy5U2pP20mY=;
	b=r0a24xe0CGr61iBcz2UuPxJCeXSNlnpKlc2FHYz2NFz2gAk1FYG+s7W0I+0Vyyo4Y9gDBX
	sE/pwlTG1yW3ijfHKJI6XsbchMT68iiEDm1djjK4WI2XX2EWsztLDnsqKgCnxd0oed7BOU
	FMH2F9TXYvdseY0vdsxthj5JIXYUhOUr3PkgACLFE80nMRaXnGzwmu8fNeGUZPdd+1fm41
	six+W33Kc1zTdF76mrSrF4ErWJHJ1pd0C4nqzmwmNeEgBXnQYeOTUOskUFN3LeTuZQxQMI
	PKTkAcTtfQuHdyAMiDbtuiAha0SUQQs0lMrgUWfHFAW5/hn3Q+D1/xx7/2bQlQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sakkinen smtp.mailfrom=jarkko.sakkinen@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1719966861; a=rsa-sha256;
	cv=none;
	b=Vu1Tcl6h9Orp81BbUjw627PbKr6gMUDh/2r3b4xEIAn2hDle019jRr3F6WBTIPEv3lah3I
	6/0AdEeDW2sxRnvNFbE6UP90xd21TXSR4dPWn0HN3fU8ejGP826iWNmDmsei6oxby5Y058
	kLk/cSbUN2JukeWIZHt5qZiZFRHd8WqMG04T2WD7KvlMaEKBRixgP2RZYav3GztbSwg8L8
	2vOY25jM8l5yC90/mvjOYiojzXDbi4Qy5gnko3qORWiEc/HuBk7T591AvyE00GoUGANF4D
	yfD+D3zH1zV3mHH2JEOW19bV3R1I8s7BXPooVyDvdzuBWY++Kl8DY9EuSLWKUw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jul 2024 03:34:21 +0300
Message-Id: <D2FHD82R8YAC.YBL9FAIVMBWL@iki.fi>
Subject: Re: [PATCH] tpm: ibmvtpm: Call tpm2_sessions_init() to initialize
 session support
From: "Jarkko Sakkinen" <jarkko.sakkinen@iki.fi>
To: "Jarkko Sakkinen" <jarkko.sakkinen@iki.fi>, "Stefan Berger"
 <stefanb@linux.ibm.com>, "Linux regressions mailing list"
 <regressions@lists.linux.dev>
X-Mailer: aerc 0.17.0
References: <20240617193408.1234365-1-stefanb@linux.ibm.com>
 <9e167f3e-cd81-45ab-bd34-939f516b05a4@linux.ibm.com>
 <55e8331d-4682-40df-9a1b-8a08dc5f6409@leemhuis.info>
 <9f86a167074d9b522311715c567f1c19b88e3ad4.camel@kernel.org>
 <53d96a8b-26ef-46a3-9b68-3d791613e47c@linux.ibm.com>
 <D2EFNJTR80JS.1RW91OVY1UH1N@iki.fi>
 <e7db74a0-cd5c-4394-b87e-c31ea0861ea1@linux.ibm.com>
 <b7559dbb323d16fb334f8f8f35b8fda3fb6e481c.camel@iki.fi>
 <85f882ff079554c41a73d8ad4275072c5229f716.camel@iki.fi>
In-Reply-To: <85f882ff079554c41a73d8ad4275072c5229f716.camel@iki.fi>
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
Cc: naveen.n.rao@linux.ibm.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Jul 3, 2024 at 2:57 AM EEST, Jarkko Sakkinen wrote:
> On Wed, 2024-07-03 at 02:48 +0300, Jarkko Sakkinen wrote:
> > On Mon, 2024-07-01 at 15:14 -0400, Stefan Berger wrote:
> > > Applying it is probably the better path forward than restricting HMAC=
 to=20
> > > x86_64 now and enabling it on a per-architecture basis afterwards ...
> >=20
> > Why is this here and not in the associated patch?
> >=20
> > Any, what argue against is already done for v6.10.
> >=20
> > The actual bug needs to be fixed before anything
> > else.
> >=20
> > I can look at the patch when in August (back from
> > holiday) but please response to the correct patch
> > next time, thanks.
>
> Next steps forward:
>
> 1  Comment out sessions_init().
> 2. See what happens on x86 in QEMU.
> 3. All errors were some sort size errors, so look into failing
>    sites and fixup the use of hmac shenanigans.

For anything "fast" or "quick" I think this really the only
possible sane thing to do right now:

https://lore.kernel.org/linux-integrity/20240703003033.19057-1-jarkko@kerne=
l.org/T/#u

There's also bunch of other drivers than tpm_ibmvtpm so better
to limit it to known good drivers.

I can take at the actual issue in August and will review any
possible patches then. This one I'll send after my current PR
for TPM has been merged.

BR, Jarkko
