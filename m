Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19689870FF6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 23:16:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CBO/PZrh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpY2T68Nkz3dVj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 09:16:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CBO/PZrh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpY1h1G4Cz2xTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 09:16:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C568DCE12CD;
	Mon,  4 Mar 2024 22:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8818CC433F1;
	Mon,  4 Mar 2024 22:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709590564;
	bh=B+/HnwLCpt/nEMTn4HJHKj5QZDdRYTH3xkzZZRrm/f4=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=CBO/PZrhwSGAEynPUUI7ML6hnhaCbGTiiTHzoHmr+9ec0e5SmimPveLrvY4LQv0me
	 TB2ANRLYFVCnP1MvwrCsp+mQDJo7QhAJrPc4hxwn1sU+PoR7uGdJM4qOf32KyIcpNa
	 GpI9yQrlW0wk4KF7FwpoaQQrgEvr+j+y8l50ThTjH9InyidHtNRu7R5CglByl39ihI
	 Q+YumRMidl3W5wFHOEAE2k0WzHfjhjPGIPnEW1yrIeY+qYTpVM7R2Wrf/motGoaWvj
	 UoYDMRCq/G+kMZ5bjeEEvwaCxFwJSnsmihpqBYVNLd3H/H9+Nwajp4Ly/63l4detSQ
	 ww8WPT8KJ9qXg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Mar 2024 00:15:55 +0200
Message-Id: <CZLB9UXFAHK6.26ET7BAGSFZLB@suppilovahvero>
Subject: Re: [PATCH v5 1/6] crypto: mxs-dcp: Add support for hardware-bound
 keys
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "David Gstir" <david@sigma-star.at>, "Mimi Zohar" <zohar@linux.ibm.com>,
 "James Bottomley" <jejb@linux.ibm.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
X-Mailer: aerc 0.15.2
References: <20231215110639.45522-1-david@sigma-star.at>
 <20231215110639.45522-2-david@sigma-star.at>
In-Reply-To: <20231215110639.45522-2-david@sigma-star.at>
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

On Fri Dec 15, 2023 at 1:06 PM EET, David Gstir wrote:
> DCP is capable of performing AES with two hardware-bound keys:
>
> - The one-time programmable (OTP) key which is burnt via on-chip fuses
> - The unique key (UK) which is derived from the OTP key

This is somewhat cryptic explanation for the commmon and reoccuring
theme of having a fused random seed and a key derivation function.

I'd just write it is all about.

"DCP is able to derive private keys for a fused random seed, which
can be referenced by handle but not accessed by the CPU. These keys
can be used to perform AES encryption."

My explanation neither includes acronyms OTP and UK and still
delivers the message so much better. That actually further makes
it better because less crappy standard consortium terminology is
always better :-)

BR, Jarkko
