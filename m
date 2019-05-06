Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E00681456D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 09:39:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yF461lHXzDqL9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 17:39:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=sirena.org.uk
 (client-ip=2a01:7e01::f03c:91ff:fed4:a3b6; helo=heliosphere.sirena.org.uk;
 envelope-from=broonie@sirena.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="NjHcG+e5"; dkim-atps=neutral
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yF2M0NKVzDqBc
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2019 17:37:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tzpXHk7pggK3a6IReCA75UnDglv4kzjtwAX41NwuIs4=; b=NjHcG+e5mciylrLgGpMM5XvoQ
 xOog8IPCBf1UzwcpqaA6fQTHSG8iv9C6CvC2qOUWzWc1Idw1jS0qia5310WtllkAjfaM+7p5dv1QQ
 FniGskOBWOn5W4M7Dick338AZbeW9tlV5ueQYGHR76aN7OvKeA+i2lFdJW9zctVOk0mJ4=;
Received: from kd111239184067.au-net.ne.jp ([111.239.184.67]
 helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hNYBt-0000s1-90; Mon, 06 May 2019 07:37:37 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 7342C441D41; Mon,  6 May 2019 04:53:45 +0100 (BST)
Date: Mon, 6 May 2019 12:53:45 +0900
From: Mark Brown <broonie@kernel.org>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Subject: Re: [PATCH V4] ASoC: fsl_esai: Add pm runtime function
Message-ID: <20190506035345.GJ14916@sirena.org.uk>
References: <VE1PR04MB64794DF2979F3AD350A9EB3DE3370@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7e8BFhNxqpjiNKz7"
Content-Disposition: inline
In-Reply-To: <VE1PR04MB64794DF2979F3AD350A9EB3DE3370@VE1PR04MB6479.eurprd04.prod.outlook.com>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--7e8BFhNxqpjiNKz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 05, 2019 at 03:28:59AM +0000, S.j. Wang wrote:

> We find that maybe it is caused by the Transfer-Encoding format.
> We sent the patch by the  --transfer-encoding=8bit, but in the receiver side
> it shows:
]
> Content-Type: text/plain; charset="utf-8"
> Content-Transfer-Encoding: base64

> It may be caused by our company's mail server. We are checking...

Ah, that looks likely...  not sure I have any great suggestions for how
to resolve it but at least it looks like progress on figuring out the
cause, I haven't been able to see anything wrong locally.

--7e8BFhNxqpjiNKz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzPr8gACgkQJNaLcl1U
h9DVeQf7ByKyqDU+F0dmHJsGDAll4nFkuDLq9wax+i1rjUCghvBhzq+0tNPf51Dk
oJT0+OmCtKJcYIu4Z7OsLBDr75SiQE83YxdWnaAGik49IJUA7ggTXCtXfpLcs2Vy
VtPc2H969t2crPjYI3AkUIJzYHB2GCwgsWvKmDeWS0c6Sb55eN5DptFsS6UuPcrI
CCOhBJvO9P85bBNjkMRAla+SM6GV77Uq5DC4iV7ert68gwp8pRVdMY1sNTx9J7BZ
soqk2U9xLPJtJUeZs89WKZy8mCW1BtFuvQAvt1W/mNJmkWWedc4FkAQgHV3b/pIn
z4slaJ2AqBkaAIC0hq6wGq8dKSVecQ==
=/QHA
-----END PGP SIGNATURE-----

--7e8BFhNxqpjiNKz7--
