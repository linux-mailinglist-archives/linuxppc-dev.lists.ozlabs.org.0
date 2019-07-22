Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F216FBED
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 11:13:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45sbWk29QnzDqWJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 19:13:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernelconcepts.de
 (client-ip=188.40.83.200; helo=mail.kernelconcepts.de;
 envelope-from=maik.nassauer@kernelconcepts.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernelconcepts.de
Received: from mail.kernelconcepts.de (mail.kernelconcepts.de [188.40.83.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45sbV04yHHzDqDJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 19:12:23 +1000 (AEST)
Received: from [217.146.132.69] (helo=dhcp39.kc.loc)
 by mail.kernelconcepts.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <maik.nassauer@kernelconcepts.de>) id 1hpUMj-00044b-Vz
 for linuxppc-dev@lists.ozlabs.org; Mon, 22 Jul 2019 11:12:18 +0200
Message-ID: <bd4b0e25d5c1c5356b2139442360df27a3ea975f.camel@kernelconcepts.de>
Subject: Re: Non deterministic kernel crashes after minimal devicetree changes.
From: Maik Nassauer <maik.nassauer@kernelconcepts.de>
To: linuxppc-dev@lists.ozlabs.org
Date: Mon, 22 Jul 2019 11:14:56 +0200
In-Reply-To: <513a3742d2a3a932b4958dc1b5fd68342aa43e41.camel@kernelconcepts.de>
References: <513a3742d2a3a932b4958dc1b5fd68342aa43e41.camel@kernelconcepts.de>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-P/ql8FEwgLt59C3EMFQD"
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-P/ql8FEwgLt59C3EMFQD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Any ideas how to deal with this problem?=20

Best regards

--=20
kernel concepts GmbH               Maik Nassauer
Hauptstra=C3=9Fe 16                              =20
maik.nassauer@kernelconcepts.de
D-57074 Siegen                             Tel: +49 271-338857-21
http://www.kernelconcepts.de/     =20
HR Siegen, HR B 9613
Gesch=C3=A4ftsf=C3=BChrer: Ole Reinhardt

--=-P/ql8FEwgLt59C3EMFQD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQJUBAABCAA+FiEEYhjqPNy+WS9sZIp4hdx2yUY8q1IFAl01fpAgHG1haWsubmFz
c2F1ZXJAa2VybmVsY29uY2VwdHMuZGUACgkQhdx2yUY8q1KtmxAAk5e/wBrisVQ8
1gAYPb1aa06bIurLx0ihJMv/x9x/wGQGtRCWsJsH5X+7RRaRH+fc/98nACTNctVl
dm0P9f4u+B44iz+oGmfC2Q7zVfEesKrPuzflZRccN1VRBq1o3mBlaIaqO13aZ0e+
Nsh3OBudyj2bGfbWlHr/u9aRXa/V0aUnNt+krKIS5eIYnaGKTs9613yz3BcqADzV
IcRsHYc1JyMhRsjeAgnRcy/gO5ZzMpD+Uh/WzkCC/R/j47Ztv0Yv86Iu+POZ889z
OjqtyzS//bpcAwDjDAcWQiyypGelbBqCx0Wg8fp0nBhnalU0Tnr00Paj+Odu1Ttl
8FkE0Niaeem2nNNTPwu5S250piBpZdD4SpWMCjpB5gHel0vHRBmu6XyrAP00Gb8N
9Or5Lb8jlnXl2VJSz+QCtZVYVcX+NiOHwZu6HkJwMIrKmViV9baq3ippnndgLEq3
jFrdCGfcjeO2xEsltYsoWY0OqZyW33eixgSkrrW+uWOqLulCg92v9HeEg8Rabs6F
VcaTNsY0OC35SBPkNwnrX9jzPwlsnSPimDlWa+Ru5uKxK1N2jr45OSMGp1HUAuaj
LwYhleKW/DnLiGorvUfmIWryFCKPv7Od5CMbVNZlXXy+mzkYLsqsC8dVn3udS1go
HQz4pby7KlXJohNyePKpUrUQxGv9LIQ=
=XLy8
-----END PGP SIGNATURE-----

--=-P/ql8FEwgLt59C3EMFQD--

