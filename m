Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B03866E0C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 10:18:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HXu9YeOJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tjw5657Wzz3d2W
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 20:18:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HXu9YeOJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tjw4P0sXFz3bNs
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 20:17:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8DB8A60F0E;
	Mon, 26 Feb 2024 09:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB87C433F1;
	Mon, 26 Feb 2024 09:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708939040;
	bh=TDPshTEB2YgsSzMjFOliwieaa4N3m+QIe+o0VAqCL30=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=HXu9YeOJLt1Yvf8NXTZ1efm0443uX2U1V2DLHVLDjanw7eFOgW7x2+1m103AC/PZK
	 WXamFGx2xgSh7mVv/kXFnpgIE9Ch3mU5XP+4HQ02nLndcsNVMiSm9vuUANAHNQbjM7
	 aNRDSIORRFc3AdpzsAw+aQzpxyQzkjg/OuOEe2AicvH/xDk71DkEKXiNOEUtyGgcU2
	 5DpSDGRzkIpDdtqF7BzdhFkBJaizksaEHqsoj4PbPCeYLLJ31diCmfAV27euPJvF4M
	 hqsBUHxgrjvyCxzCRVR+V2KdU3tVlT26TPFhxLyoiAkCsMSOHhPibfQyZ7iWb69/lR
	 T8Taz6GzuK1OQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Feb 2024 11:17:11 +0200
Message-Id: <CZEWBSXM7LHU.15UW6P0T61VBN@suppilovahvero>
Subject: Re: [PATCH v5 0/6] DCP as trusted keys backend
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Richard Weinberger" <richard@sigma-star.at>, "Mimi Zohar"
 <zohar@linux.ibm.com>, "James Bottomley" <jejb@linux.ibm.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 <upstream@sigma-star.at>, "David Howells" <dhowells@redhat.com>
X-Mailer: aerc 0.15.2
References: <20231215110639.45522-1-david@sigma-star.at>
 <7AED262F-9387-446D-B11A-C549C02542F9@sigma-star.at>
 <47439997.XUcTiDjVJD@somecomputer> <1733761.uacIGzncQW@somecomputer>
In-Reply-To: <1733761.uacIGzncQW@somecomputer>
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
Cc: David Gstir <david@sigma-star.at>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Paul Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James Morris <jmorris@namei.org>, NXP Linux
 Team <linux-imx@nxp.com>, "Serge E. Hallyn" <serge@hallyn.com>, "Paul E.
 McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, sigma
 star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt
 \(Google\)" <rostedt@goodmis.org>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>, "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Feb 26, 2024 at 12:20 AM EET, Richard Weinberger wrote:
> Mimi, James, Jarkko, David,
>
> you remained silent for a whole release cycle.
> Is there anything we can do to get this forward?
>
> Thanks,
> //richard

Thanks for reminding.

From my side, I've had pretty busy month as I've adapted to a new work
project: https://sochub.fi/

I exported the thread [1] and will look into it within this or next week
in detail (thus the large'ish time window).

[1] https://lore.kernel.org/linux-integrity/1733761.uacIGzncQW@somecomputer=
/t.mbox.gz

BR, Jarkko
