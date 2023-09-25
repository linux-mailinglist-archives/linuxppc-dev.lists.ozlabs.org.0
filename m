Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E33FD7ADB46
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 17:23:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Kp0VVt1I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvRTh5RhJz3cHN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 01:23:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Kp0VVt1I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvRSp3fNrz2xrD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 01:22:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7F8476115A;
	Mon, 25 Sep 2023 15:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F12DC433C8;
	Mon, 25 Sep 2023 15:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695655351;
	bh=OGt2FOw6lDFFBJRltNV7eb25Y3RCJfPYVc/8wsDj+lM=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Kp0VVt1IVmvLWEfHcZ2kGDvXU/kqTSlU+zkPCXYtz6OOHZKhyu9V5NSp0G4CcW036
	 DQ9LCiRXD6Q490pl7u8169h7tTEUAz8V7ziRXZiOnxF5dDnpKDrQj68Gjg0adng4T5
	 EC3+inaGcrSbVlkKIJs09PWUwziCRokB4AboyUs2UgQ2pt7Zy2tOwb59ADnu4WpGap
	 yRdxENwoFnqspD1+SNBWaf1kvwgaAh2yycGM8qQMtVXclYdN2nIeGugErrwJvR4YEl
	 H9OHYREey3oOXKbuXZV2mFLTFooU8OLOf/hOR2Asgxbi05opItQVsGdjANQ69Zqjb3
	 L4QCoe2YqHFVQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 Sep 2023 18:22:22 +0300
Message-Id: <CVS3NIJ8OO6Y.2C6GJ9OBR6COC@suppilovahvero>
Subject: Re: [PATCH v3 1/3] crypto: mxs-dcp: Add support for hardware
 provided keys
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "David Gstir" <david@sigma-star.at>, "Mimi Zohar" <zohar@linux.ibm.com>,
 "James Bottomley" <jejb@linux.ibm.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
X-Mailer: aerc 0.14.0
References: <20230918141826.8139-1-david@sigma-star.at>
 <20230918141826.8139-2-david@sigma-star.at>
In-Reply-To: <20230918141826.8139-2-david@sigma-star.at>
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Paul Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James Morris <jmorris@namei.org>, NXP Linux
 Team <linux-imx@nxp.com>, "Serge E.
 Hallyn" <serge@hallyn.com>, "Paul E. McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, sigma
 star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt
 \(Google\)" <rostedt@goodmis.org>, David Oberhollenzer <david.oberhollenzer@sigma-star.at>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Randy
 Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, linux-integrity@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Sep 18, 2023 at 5:18 PM EEST, David Gstir wrote:
> DCP is capable to performing AES with hardware-bound keys.
> These keys are not stored in main memory and are therefore not directly
> accessible by the operating system.
>
> So instead of feeding the key into DCP, we need to place a
> reference to such a key before initiating the crypto operation.
> Keys are referenced by a one byte identifiers.

Not sure what the action of feeding key into DCP even means if such
action does not exists.

What you probably would want to describe here is how keys get created
and how they are referenced by the kernel.

For the "use" part please try to avoid academic paper style long
expression starting with "we" pronomine.

So the above paragraph would normalize into "The keys inside DCP
are referenced by one byte identifier". Here of course would be
for the context nice to know what is this set of DCP keys. E.g.
are total 256 keys or some subset?

When using too much prose there can be surprsingly little digestable
information, thus this nitpicking.

> DCP supports 6 different keys: 4 slots in the secure memory area,
> a one time programmable key which can be burnt via on-chip fuses
> and an unique device key.
>
> Using these keys is restricted to in-kernel users that use them as buildi=
ng
> block for other crypto tools such as trusted keys. Allowing userspace
> (e.g. via AF_ALG) to use these keys to crypt or decrypt data is a securit=
y
> risk, because there is no access control mechanism.

Unless this patch has anything else than trusted keys this should not
be an open-ended sentence. You want to say roughly that DCP hardware
keys are implemented for the sake to implement trusted keys support,
and exactly and only that.

This description also lacks actions taken by the code changes below,
which is really the beef of any commit description.

BR, Jarkko
