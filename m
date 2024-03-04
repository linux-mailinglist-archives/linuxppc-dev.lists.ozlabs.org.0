Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2B3871027
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 23:35:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PryTUwzP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpYSY3kVZz3dVK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 09:35:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PryTUwzP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpYRm5ZxXz301T
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 09:35:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 403F760C3D;
	Mon,  4 Mar 2024 22:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5720C433F1;
	Mon,  4 Mar 2024 22:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709591713;
	bh=amBz0SHnxG7TZY8ssNJpH1w1CYnBUB36OiHoZWaexS8=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=PryTUwzPWwwXCdvBgfF8SYstPp6+99/peVymjH51J3D8e3mXbJEOU4GmawLaXnlMD
	 zbV2440gyrfx/e/OZqROOWiQned9w3KttppjGwM1qqRAcAmRCbgylkuD3kJPoP96y2
	 kC2kMClL2jSsXwTnK7pL25JI94uAQ/Lchim31o/E9QcvOE5sVxRZUJ3IJtmdqQM18m
	 HKWFF1MYu1gvajPolinuxfn7/3QS2mf8kSqDnRoiz+raX2MinBRKggWmC0EvQXPlq/
	 VfoZtm27SPjSMOTUxkPqZs76X6NTybfi4wtyoxCs5vMOSUidQ0ZRhVZ/l93QRm9gTb
	 M+n6XzriuJLDA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Mar 2024 00:35:05 +0200
Message-Id: <CZLBOJEYP2M1.I4A9D5M5MR01@suppilovahvero>
Subject: Re: [PATCH v5 2/6] KEYS: trusted: improve scalability of trust
 source config
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "David Gstir" <david@sigma-star.at>, "Mimi Zohar" <zohar@linux.ibm.com>,
 "James Bottomley" <jejb@linux.ibm.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
X-Mailer: aerc 0.15.2
References: <20231215110639.45522-1-david@sigma-star.at>
 <20231215110639.45522-3-david@sigma-star.at>
In-Reply-To: <20231215110639.45522-3-david@sigma-star.at>
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Paul Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James Morris <jmorris@namei.org>, NXP Linux
 Team <linux-imx@nxp.com>, "Serge E.
 Hallyn" <serge@hallyn.com>, "Paul E. McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, sigma
 star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt
 \(Google\)" <rostedt@goodmis.org>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Randy
 Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, linux-integrity@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Dec 15, 2023 at 1:06 PM EET, David Gstir wrote:
> Checking if at least one valid trust source is selected does not scale
> and becomes hard to read. This improves this in preparation for the DCP
> trust source.

This commit needs a complete rewrite and I do not have time and
energy to propose one but here's what it should contain:

1. Add HAVE_TRUSTED_KEYS to th trusted-keys/Kconfig.
2. The use and purpose of HAVE_TRUSTED_KEYS.

If you read your commit message, do you see anything at all concerning
the code change? It only tells a story about something that is not
properly being defined to be "hard to read", which is no rationale to
change anything at all in the kernel.

If you put factors more focus on being as straight and easy to get
in the commit messages, it will also improve the round-trip time
between sending the patch set and getting reviewed, because people
with limited time at their hands tend to pick the low-hanging fruit
first.

BR, Jarkko
