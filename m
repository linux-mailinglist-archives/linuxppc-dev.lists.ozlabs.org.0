Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF0813B027
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 17:59:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xxWs2VYnzDqRh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 03:59:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=sirena.org.uk
 (client-ip=172.104.155.198; helo=heliosphere.sirena.org.uk;
 envelope-from=broonie@sirena.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.a=rsa-sha256 header.s=20170815-heliosphere header.b=kWHKHJJ6; 
 dkim-atps=neutral
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xxTq74XbzDqLY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2020 03:57:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I7zCUFSxCilOiygfJOrKMG+d9QBWeV+zMVpsSsqTMqc=; b=kWHKHJJ6ilFEWZ2bNlW/Xb26V
 zGRDUEUZTnDadH1LnqM1ADZMn4ilWGec89HluanPHUxhNrpUyJ3xZqFAI5s2Q4E86vFSN9IF7T4Nf
 gKE/KbbvYrjzJ3hSOsZPEkWNhP/YMZAWYoawaW2j8vSPiJajqf9hZ0l7gGfmHbxfE3+PY=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1irPVc-0001hW-7R; Tue, 14 Jan 2020 16:57:40 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id ACA3ED01965; Tue, 14 Jan 2020 16:57:39 +0000 (GMT)
Date: Tue, 14 Jan 2020 16:57:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Subject: Re: [PATCH v3] spi: fsl: simplify error path in of_fsl_spi_probe()
Message-ID: <20200114165739.GC3897@sirena.org.uk>
References: <2a4a7e11b37cfa0558d68f0d35e90d6da858b059.1579017697.git.christophe.leroy@c-s.fr>
 <b6d01fa02e659db911df63a79d825080f03dfcb8.camel@infinera.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="avNtfD0ffNO6L/9g"
Content-Disposition: inline
In-Reply-To: <b6d01fa02e659db911df63a79d825080f03dfcb8.camel@infinera.com>
X-Cookie: Programming is an unnatural act.
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "lkp@intel.com" <lkp@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--avNtfD0ffNO6L/9g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2020 at 04:26:18PM +0000, Joakim Tjernlund wrote:

> Don't you need to "undo" ioremap, irq etc. in case of later errors?

Better, convert to devm_=20

--avNtfD0ffNO6L/9g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4d8wIACgkQJNaLcl1U
h9DBpgf/ZMWk7TuStHKbaJC0YfEaWwp2D/yVzYAISxxSeNvL25vQlQlFJe6YGYR0
2KK5vLMxNaH1Vf6vhet00ClpsdinZt7Jx91tzaplblsKxlPbraf4tSs6USCdy5Iq
kSgUDnJvxiQSMnoTjJOkMh/ee/2LJQtVnYB+XirIqI9YWfqAZLrgm/PfqUnNq5vG
+g9nCJ3/RKsLQGb9VmbmXwMy5gVCj3u41aMoX9XDDgoayy1IZPWRIsBTIzUmmCLZ
A5OhXxnxucHDkAMXjiHE+jmgPEC1LUV+JIBydgN7Z+ryBNvTeLXDTFbnavabBb3Q
RaQCF+kEphOgL9A5QfgIkwmkUwtCtg==
=SVwD
-----END PGP SIGNATURE-----

--avNtfD0ffNO6L/9g--
