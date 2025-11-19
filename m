Return-Path: <linuxppc-dev+bounces-14366-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BED65C6FC30
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 16:49:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBQrN4FTLz3dHc;
	Thu, 20 Nov 2025 02:48:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763567332;
	cv=none; b=e/zpj7MwLWJ20NSvyJAqJ1Cq5+mOrSkJO75h2umFDbf0D7Iqt0Ed2Tn4g25QtEeRsyeX8Kg9W39yuQLit6OvmJlDgo1eMxJ7tG0Pm/L1RV+zDnslywPnNKyvBqEDYRlfXReTfKNcNiMS9rR/k96zgQEwXfB7SHC3WoK9FL9FZ+4AIuPkRWQtsSJqQWOn4P/g4iu6hupiXSzI6hrE4UQBUzR7juFz53tkgLujjIYd1WUC7s5FAn/7kmUJZr3QHKebUemSxPjZ0kXlySx2lZpoaxynEhcVxwL8s7pEJmeEvKMtsxVnFwbZWJElIdX4bsj0cHFnsQXjb4lcx5Gz96r6CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763567332; c=relaxed/relaxed;
	bh=dQnlE2n5aekx+v6zObGqphQStw7ib6XRN1BfScwnLic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PMEo6ZfYPqVnkpDeUTKn1q+F9/Fe298iyBnQVzxqhHjCVOd0VSmdVs1T1JQ+H6/AC45w8O6G2JiwxJTbe6R2h+byamTj7h3vxxZupNuJKx2nZ8f1/0B04qsiGZhIathsd4onl87ejAeDONdquzcP5GotniQ2yInsn91k3fk8rZ5xMWrkGDDAZ42dS5Aaa2LQqrO5wC2cnUwQtJOoU8wOMRGDc32syvtJkJdwynV5qClgPARXTrH6TBR4SVjqAzVnjzMwficqZzl+z61oxUg0TdPBOOs7iaMyfixtt1lmjNSmjRWuDIDIBscm5/0zFgcCA43NTHi+qgdBRYDvY8JRWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=VRh9ulT9; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=XK8cAQQ9; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=VRh9ulT9;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=XK8cAQQ9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBQrL6yCTz3dB7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Nov 2025 02:48:50 +1100 (AEDT)
Date: Wed, 19 Nov 2025 16:48:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763567317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dQnlE2n5aekx+v6zObGqphQStw7ib6XRN1BfScwnLic=;
	b=VRh9ulT9FxvWXw7qMNvg+9uqEbxMCDbNhTdu0TX5v8Jes0ESbXArTw+TvOAvrxRS9JJ2HV
	JXYinsWrLLUTIDhNkVDo8fLhscZVlJtULXtH2F8ss4EgU+hPaS3aGl1MektltakP3CN5AS
	MR+m66XxqYw6tAt0DewTszz+Lq+yBh+ZO9bCCdD5EgizYN/0aHF3aHdNeVAqNlAE1p0xnH
	anshj0nr96xb7MViJ6sK/AT50w5MEHipWVDn3a7naUaCV36XkpcXZRam5SR1Ldaz6/+zlK
	edwu9fTV5jAk4FXDjYH0+qekDRokeOz/zYC1UIQt1SZJHvgDN8NzzGqdt45AMw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763567317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dQnlE2n5aekx+v6zObGqphQStw7ib6XRN1BfScwnLic=;
	b=XK8cAQQ9othT6G++4p2Pn+74xeBwkh0bSY/TQQSgsoPxSMehVrp8KtnZXI7Biuir2r6hnA
	WYH4a8uF8T6ihmBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Fabian =?utf-8?Q?Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>,
	Arnout Engelen <arnout@bzzt.net>,
	Mattia Rizzolo <mattia@mapreri.org>, kpcyrd <kpcyrd@archlinux.org>,
	Christian Heusel <christian@heusel.eu>,
	=?utf-8?B?Q8OianU=?= Mihai-Drosi <mcaju95@gmail.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v3 0/9] module: Introduce hash-based integrity checking
Message-ID: <20251119154834.A-tQsLzh@linutronix.de>
References: <20250429-module-hashes-v3-0-00e9258def9e@weissschuh.net>
 <f1dca9daa01d0d2432c12ecabede3fa1389b1d29.camel@HansenPartnership.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f1dca9daa01d0d2432c12ecabede3fa1389b1d29.camel@HansenPartnership.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-04-29 10:05:04 [-0400], James Bottomley wrote:
> On Tue, 2025-04-29 at 15:04 +0200, Thomas Wei=C3=9Fschuh wrote:
> > The current signature-based module integrity checking has some
> > drawbacks in combination with reproducible builds:
> > Either the module signing key is generated at build time, which makes
> > the build unreproducible,
>=20
> I don't believe it does: as long as you know what the key was, which
> you can get from the kernel keyring, you can exactly reproduce the core
> build (it's a public key after all and really equivalent to built in
> configuration).  Is the fact that you have to boot the kernel to get
> the key the problem?  In which case we could insist it be shipped in
> the kernel packaging.

The kernel itself is signed. This is not a problem because distros have
the "unsigned" package which is used for comparison.
The modules are signed by an ephemeral key which is created at build
time. This is where the problem starts:
- the public key is embedded into the kernel. Extracting it with tooling
  is possible (or it is part of the kernel package). Adding this key
  into the build process while rebuilding the kernel should work.
  This will however alter the build process and is not *the* original
  one, which was used to build the image.

- the private key remains unknown which means the modules can not be
  signed. The rebuilding would need to get past this limitation and the
  logic must not be affected by this "change". Then the modules need to
  be stripped of their signature for the comparison.

Doing all this requires additional handling/ tooling on the "validation"
infrastructure. This infrastructure works currently without special
care.
Adding special care will not build the package exactly like it has been
built originally _and_ the results need to be interpreted (as in we
remove this signature and do this and now it is fine).

Adding hashes of each module into the kernel image looks like a
reasonable thing to do. I don't see any downsides to this. Yes, you are
limited to the modules available at build time but this is also the case
today with the ephemeral key. It is meant for distros not for individual
developers testing their code.

With this change it is possible to build a kernel and its modules and
put the result in an archive such as tar/ deb/ rpm. You can build the
package _again_ following exactly the same steps as you did before and
the result will be the identical archive.
Bit by bit.
No need for interpreting the results, stripping signatures or altering
the build process.

I fully agree with this approach. I don't like the big hash array but I
have an idea how to optimize that part. So I don't see a problem in the
long term.

> Regards,
>=20
> James

Sebastian

