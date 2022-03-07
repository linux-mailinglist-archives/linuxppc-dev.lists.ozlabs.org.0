Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7589E4D03D9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 17:17:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KC3WN2CVnz3bcY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 03:17:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t7xUG4Ja;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=t7xUG4Ja; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KC3Vh5JJ5z2xF0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 03:16:28 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6CF4360C58;
 Mon,  7 Mar 2022 16:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE714C36AE5;
 Mon,  7 Mar 2022 16:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646669785;
 bh=8tjddFmERVub+eJeodtYbStmrrQSVt5R8T5mKB/8hxw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t7xUG4JaGuaEIgWxfFOunf5ycNgeq7Zdo4Yvt8CDhYQt91/PFY0sE17x7YrnNnYCN
 /1ZTy7VQREK8Tig2yKhrsLU9aE+NbthGUC0KmrQUVFvpHhKvKG+uHWhyhAqZ2xpkyj
 FKbBIMOePuBO0thU4zG9Fk4BvRWQRrDydLJkqA3ZmvzHlQ+2Wz3SjgF5XcmnLavP53
 CFyAmzGCxwXxasc85l334HJTdkxByQVj3Qc7OlfWXyshcfqKhD2Zoc0b2MZ8InLQ/s
 Ed7TpFuOFBWnPjBqnzHAeEdObsuNTJUL3YIGJjSgcNmFVwoV2r1QhLqlaFgXUOcsG7
 IthLpKFApUKZg==
Date: Mon, 7 Mar 2022 16:16:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Alifer Moraes <alifer.m@variscite.com>
Subject: Re: [PATCH 3/4] ASoC: wm8904: extend device tree support
Message-ID: <YiYv08yef4eIbAXz@sirena.org.uk>
References: <20220307141041.27538-1-alifer.m@variscite.com>
 <20220307141041.27538-3-alifer.m@variscite.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9yotZ5uYT3fHlEJd"
Content-Disposition: inline
In-Reply-To: <20220307141041.27538-3-alifer.m@variscite.com>
X-Cookie: Whatever became of eternal truth?
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
Cc: pierluigi.p@variscite.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@gmail.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, eran.m@variscite.com,
 robh+dt@kernel.org, patches@opensource.cirrus.com, perex@perex.cz,
 festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--9yotZ5uYT3fHlEJd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 07, 2022 at 11:10:40AM -0300, Alifer Moraes wrote:

> +  - num-drc-cfgs: Number of available DRC modes from drc-cfg-regs property
> +
> +  - drc-cfg-regs: Default registers value for R40/41/42/43 (DRC)
> +    The list must be (4 x num-drc-cfgs) entries long.
> +    If absent or incomplete, DRC is disabled.

What is the purpose of having num-drc-cfgs?  We can tell how large
drc-cfg-regs is so it just seems redundant.

> +  - num-retune-mobile-cfgs: Number of retune modes available from
> +    retune-mobile-cfg-regs property

Same here.

--9yotZ5uYT3fHlEJd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmImL9IACgkQJNaLcl1U
h9D0nQf/e94yrWlNJbnJEWkZM5yQ9NWqCSnHkn9vGfNqeP08qmHuPx5rKMPsJlQE
U3iaSMsrPstH1JbpQM4gp9uh+Fg6VvM5/qWyJo1MgSaaMV90p9JUzhnyWGx4JiHq
/i7xUGfwLOBdC3jP7IxCeDnXlTfgdp/4XgTTzjlS1iOnQbnFUCV1LBCFf4KF02/5
F74oQX80r26mdT9BlqXSM9FpuiVJq3E7Ckzo6ilYR1u5C8MCtzZmR0LGnb3mihWs
f46WBAlRgZqIWd56ISFJlOyCuM8oXNikquhN20NGRraagoxbvQQeC7zvBIDAMuZE
YK+1RvyQrlT86QdGrRg9lBdvKY+14w==
=gOHh
-----END PGP SIGNATURE-----

--9yotZ5uYT3fHlEJd--
