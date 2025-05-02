Return-Path: <linuxppc-dev+bounces-8240-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0DBAA6B12
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 08:53:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZphTM2d06z2yGf;
	Fri,  2 May 2025 16:53:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746168807;
	cv=none; b=bBpLD0muudF+qabY3ZK6qndxFquYcOIh+BHSNAQMb68xANjvzzy1TXnxnTdMsHeYa08XksBuO7EVBujtBGxvtwADNha0hXddIqs5XatAcTjZ9VK/LZU3WMcL9IWmYjX7bzJhoB7pZ9O/ZaPbH+ZA4iDFKcxsdySAQRWlwhIiGdUU9/z359EWn1/FFX0zcnbzlFor7tc46QrZFC7Xj6aR5EzkK6ZB0UJn1HQbrF8ZnwbAQIgeJq72BANiCjWTTKHH3E64MJ74RrFlTxTgmXLfFMR6Tvt9cIhwccUuXHdTVCoLuArqx1B7kFVCjPyeWG/culquSzgXdbR3Pznhk92LjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746168807; c=relaxed/relaxed;
	bh=vrA/dEmEMZN/XoLggQl5jTVNWP4WWIcPBU5A1dVNqWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cTkIAD9CfJ0gFzT6ojxWKCS/mBQ41N6TvXQPwk4z6jXpuHpWmZpcPaQT5joxupUKLdjOxPEm5lDPS7Tg0iWucUusJAzfdm1iBCs90sboCfVz8uRdmpO4k9xRlAsrBt8yxK1Dxc2RYuGAN30w+RsNFQvo7UW9QLE82JtzioKSqNLZZ5yi0FSjt+/YD2eNNfByKHwo8QJNxW2lJ/qupy5bdSEvIhbJHfwxjboDLH+qWGtgOFBTgSK/6804/shVsUwOIK0VKb7z6ASbvk9nqUXV6enz940Kk+EYWtko/ZPQAJwLBG+4TwC+0zGZjc0ECCtT0DmKajidBkX7amRqxA6SWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=CxKUsKab; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=CxKUsKab;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZphTF507Fz2yGY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 16:53:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1746168790;
	bh=AEdRU+ogQrE6gQAgP/rybtN8TOhshZ7X86ciQDX554g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CxKUsKabvVQtCyoctO8MV2iUdgbSXO1OeNK+W2RsL9m4NVcoUrzpeI7zuNg2eC3IS
	 ZL0Jz4TZ9bVREPe8YN+Ocj0q2Hc+biSc2XfA95gtj8Z+2GrX2G118bp/uIjQ0QmRMk
	 XDnIezQvPUDxsyD5F02EsfUCEVYsV3PK2uLBkSiQ=
Date: Fri, 2 May 2025 08:53:09 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Fabian =?utf-8?Q?Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>, Arnout Engelen <arnout@bzzt.net>, 
	Mattia Rizzolo <mattia@mapreri.org>, kpcyrd <kpcyrd@archlinux.org>, 
	Christian Heusel <christian@heusel.eu>, =?utf-8?B?Q8OianU=?= Mihai-Drosi <mcaju95@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v3 0/9] module: Introduce hash-based integrity checking
Message-ID: <840b0334-71e4-45b1-80b0-e883586ba05c@t-8ch.de>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1dca9daa01d0d2432c12ecabede3fa1389b1d29.camel@HansenPartnership.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi James,

On 2025-04-29 10:05:04-0400, James Bottomley wrote:
> On Tue, 2025-04-29 at 15:04 +0200, Thomas Weißschuh wrote:
> > The current signature-based module integrity checking has some
> > drawbacks in combination with reproducible builds:
> > Either the module signing key is generated at build time, which makes
> > the build unreproducible,
> 
> I don't believe it does: as long as you know what the key was, which
> you can get from the kernel keyring, you can exactly reproduce the core
> build (it's a public key after all and really equivalent to built in
> configuration).  Is the fact that you have to boot the kernel to get
> the key the problem?  In which case we could insist it be shipped in
> the kernel packaging.

See below.

> >  or a static key is used, which precludes rebuilds by third parties
> > and makes the whole build and packaging process much more
> > complicated. 
> 
> No, it's the same as above ... as long as you have the public key you
> can reproduce the core build with the same end to end hash.

While the scheme you propose does allow verification of rebuildability,
it does not satisfy the requirements for a reproducible build as
understood by the general reproducible builds community:

	When is a build reproducible?

	A build is reproducible if given the same source code, build environment
	and build instructions, any party can recreate bit-by-bit identical
	copies of all specified artifacts.

	The relevant attributes of the build environment, the build instructions
	and the source code as well as the expected reproducible artifacts are
	defined by the authors or distributors. The artifacts of a build are the
	parts of the build results that are the desired primary output.

https://reproducible-builds.org/docs/definition/

Specifically the output of a previous build (the public key, module
signatures) is not available during the rebuild or verification.

> However, is there also a corresponding question of how we verify
> reproduceability of kernel builds (and the associated modules ... I
> assume for the modules you do strip the appended signature)?

Currently distros either don't enforce the reproducibility of the
kernel package at all or disable MODULE_SIG.
With the proposed scheme there would be no signatures on builtin modules.

> I assume
> you're going by the secure boot hash (authenticode hash of the efi stub
> and the compressed payload which includes the key).  However, if we had
> the vmlinux.o we could do a much more nuanced hash to verify the build,
> say by placing the keyring data in a section that isn't hashed.

The currently existing tooling does not have any nuance in its
verifications. It just compares bit-by-bit.
I think this is intentional as any bespoke per-package logic would
introduce possible failure modes and stand in the way of implementing
multiple completely independent verification toolsets.
While bespoke tools like diffoscope exist, these are only for
development and debugging. Not not for the reproducibiliy check itself.

How to handle secure-boot with distro keys is not yet clearly defined.
I see two possibilities, which should be possible with the proposed
scheme, both starting with the build of an unsigned kernel package.
Then a signature would be computed on private infrastructure and either
* shipped in a standalone package, to be combined with the kernel when
  that is installed to the ESP/flash etc.
* used as input of a signed kernel package where it is combined with the
  unsigned kernel image.


Thomas

