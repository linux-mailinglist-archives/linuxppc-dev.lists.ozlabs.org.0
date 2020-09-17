Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0175826DC77
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 15:08:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bschv1GNRzDq98
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 23:08:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=mi3s2YQg; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bscdf3q5bzDqK3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 23:05:26 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 52B782083B;
 Thu, 17 Sep 2020 13:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600347923;
 bh=VWZZoKhUjroNLpll2eU5vjUqNxtnR3wkR+uu5Ss0zr8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mi3s2YQgpeZZBpneKJuKUPowYJRNqmmOg9EnsuaQ6g7HwF8jYnhjAbFZq+G1I7ATn
 qMvrjkVDAonhONz4GUA8SHPmq0sMe7Jov1R5tPypU7ue+bWqQFozkiUnzir8+uMs9H
 dLNQL6u2z+vGlf08u1vwiMKYG0Z94iXzUizJeZpM=
Date: Thu, 17 Sep 2020 14:04:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Xu Wang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] fsl: imx-audmix : Replace seq_printf with seq_puts
Message-ID: <20200917130434.GD4755@sirena.org.uk>
References: <20200916061420.10403-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MAH+hnPXVZWQ5cD/"
Content-Disposition: inline
In-Reply-To: <20200916061420.10403-1-vulab@iscas.ac.cn>
X-Cookie: If you fail to plan, plan to fail.
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 festevam@gmail.com, s.hauer@pengutronix.de, tiwai@suse.com,
 lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com, linux-imx@nxp.com,
 kernel@pengutronix.de, shawnguo@kernel.org, shengjiu.wang@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--MAH+hnPXVZWQ5cD/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 16, 2020 at 06:14:20AM +0000, Xu Wang wrote:

> A multiplication for the size determination of a memory allocation
> indicated that an array data structure should be processed.
> Thus use the corresponding function "devm_kcalloc".

This looks fine but the subject says it's about seq_puts() not
kcalloc().

--MAH+hnPXVZWQ5cD/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9jXuEACgkQJNaLcl1U
h9B3BQf/VarUuMPYus5VLpA+zmE+7JqUAcO3omQ6LMqaF7VBOQhDHlE45z4cWL+z
puS/DV1XmM5bSGn+ZwcwBh6GvfamDg5oyGSTs8OkwMeWxCanjvexEE81RTAvzCgT
qkAdheP90NZtRKHJImUV6KfmiTJXB2nokridUP+vC2L98aZjAYbVFuJ5CMkEuKOk
jOzrE81vM69mIfnFnvcHRv7wH+WZszcgxc/WDTFDfYSQB5mMgBvVDT9mUPRJtjkj
NdND/4RmGRSXcQ5l7iHszGwtUBSAGVVycv45pBPcm1z1Z/XXh0R4M9SbrICmDbZM
g6zIaexA3gXNIUwR2p0czzGdbUD3ww==
=AGo/
-----END PGP SIGNATURE-----

--MAH+hnPXVZWQ5cD/--
