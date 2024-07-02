Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43404924C7B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 01:58:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=qamueW1+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDKbr0SC2z3bbW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 09:58:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=qamueW1+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iki.fi (client-ip=2a0b:5c81:1c1::37; helo=lahtoruutu.iki.fi; envelope-from=jarkko.sakkinen@iki.fi; receiver=lists.ozlabs.org)
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDKb64x5Jz30WC
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 09:57:22 +1000 (AEST)
Received: from localhost (83-245-197-232.elisa-laajakaista.fi [83.245.197.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sakkinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4WDKZz5vNwz49Pxq;
	Wed,  3 Jul 2024 02:57:15 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1719964636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ae2vVQG57Q2h/mntUgu3XIHv6iZuHpnmF7N11wBhPI4=;
	b=qamueW1+pPabdyRKgBxC7qWrdRKjykyDIwMIfbFs913fDpOZsYUTA/42GBC8eO3c+c13oc
	5tBbt0NeNqzccGG6jI0ktw1yvpNlZKNJZQAk6GnTjA3paumehxdYPYcNcnbHSkVmds0Tzd
	eTrFPsGw7dy3Wb85zYtXUySHmEt+PbvkAYp3wArDZ8yv64Z5Lg8naeO801P7N07ltdpmgb
	UCsOu+yD9ZHvKVZ4JThrKy/YK1QBE75sXuvqjHWHJI2wrJCwFRjs9bL6Id6P2iKGrvx+Uf
	XeA+EJPqFqX0pnyYtYMg6C3OQU/Vr160YOMnv3irfZ8C/sqR5/nffBt6zZ63eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1719964636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ae2vVQG57Q2h/mntUgu3XIHv6iZuHpnmF7N11wBhPI4=;
	b=XttoVwwjlGfFZXD2ZlDbbzUeMhKlHN0r1R+zoJ8h30c364lpxi1UIGExZesxoPsLsN2hJf
	2/1FgSx1DuurRSPuTPbpQqdIOhNRjmbu4c3lNE3IC0Tc68QDxf0vNjk4ETS6satC7kc2Ct
	sCK9yY+pOHnTxKKWsci9wHqfaM2gGk7Nggxao/tGNc7POWH1RMtwosCz5qxzpm+NGuZlxb
	orF/RTMk09KWYrwhDKVzy5NnLvNmaquuTSA8P+DfZ8fwP/SVpRIK8OS9Vm0g1NrlnJXhgX
	a6IktxzbZOt1WkrUkXT6kD17UCfxF1J3JDQhBpGVOS0f7s0sFU8N7GnK1pxXtw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sakkinen smtp.mailfrom=jarkko.sakkinen@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1719964636; a=rsa-sha256;
	cv=none;
	b=VTg+xNP14IPNLh13ojFJr1rF45cHQdvj5jiTOYgV5MnHHvovJ45SF7nWY0F1ld9J/MsxaM
	fKNVymTdkQ1RHy9SbQwGzMeQxk+m6EUcWt2Owhm/StEEOdKo46kg5CM0P2jFqV/IdLZef0
	xir+o7algRklWUgVBTwPKqqpOJtHqPihxsAkbWL7516jJlRWY5uNIGbIUD6xID/bI/+L3Z
	NKZsCH8GohGH4ri04BZNLhjC86hn6/RsVZhuzZfdE300Bks1oFbBgF+vDmqqE9b6eZQeuS
	qOztWgPFO60Vg0E/5dKXm8HMvsrWsGQNhiRBLc2/dPXnhHiTBYfvhKlgYQN0xQ==
Message-ID: <85f882ff079554c41a73d8ad4275072c5229f716.camel@iki.fi>
Subject: Re: [PATCH] tpm: ibmvtpm: Call tpm2_sessions_init() to initialize
 session support
From: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
To: Stefan Berger <stefanb@linux.ibm.com>, Linux regressions mailing list
	 <regressions@lists.linux.dev>
Date: Wed, 03 Jul 2024 02:57:14 +0300
In-Reply-To: <b7559dbb323d16fb334f8f8f35b8fda3fb6e481c.camel@iki.fi>
References: <20240617193408.1234365-1-stefanb@linux.ibm.com>
	 <9e167f3e-cd81-45ab-bd34-939f516b05a4@linux.ibm.com>
	 <55e8331d-4682-40df-9a1b-8a08dc5f6409@leemhuis.info>
	 <9f86a167074d9b522311715c567f1c19b88e3ad4.camel@kernel.org>
	 <53d96a8b-26ef-46a3-9b68-3d791613e47c@linux.ibm.com>
	 <D2EFNJTR80JS.1RW91OVY1UH1N@iki.fi>
	 <e7db74a0-cd5c-4394-b87e-c31ea0861ea1@linux.ibm.com>
	 <b7559dbb323d16fb334f8f8f35b8fda3fb6e481c.camel@iki.fi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40) 
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
Cc: naveen.n.rao@linux.ibm.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2024-07-03 at 02:48 +0300, Jarkko Sakkinen wrote:
> On Mon, 2024-07-01 at 15:14 -0400, Stefan Berger wrote:
> > Applying it is probably the better path forward than restricting HMAC t=
o=20
> > x86_64 now and enabling it on a per-architecture basis afterwards ...
>=20
> Why is this here and not in the associated patch?
>=20
> Any, what argue against is already done for v6.10.
>=20
> The actual bug needs to be fixed before anything
> else.
>=20
> I can look at the patch when in August (back from
> holiday) but please response to the correct patch
> next time, thanks.

Next steps forward:

1  Comment out sessions_init().
2. See what happens on x86 in QEMU.
3. All errors were some sort size errors, so look into failing
   sites and fixup the use of hmac shenanigans.

BR, Jarkko
