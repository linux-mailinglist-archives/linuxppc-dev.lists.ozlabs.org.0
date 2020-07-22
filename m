Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6BE2296A2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 12:51:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBXMh2BdbzDr68
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 20:51:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=ktpV/MHd; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBXKl1dtbzDr2q
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 20:50:03 +1000 (AEST)
Received: from localhost (p54b33083.dip0.t-ipconnect.de [84.179.48.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F1277206F5;
 Wed, 22 Jul 2020 10:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595415000;
 bh=w2CgJwPey3KVWQwleXtivdygRth+bNEvTOILhdD+/AY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ktpV/MHdEMtUX7VhR6Q03U9rnmvRjAn/cCUDCOT90hUt/oZIpp6HGi9jifbCoHlxM
 B3CPB7deqGF5FkbypZhZToKqnJbjQzTMWwl7ewOm6nRUVd9C1xkw+3dynR4Sm63kL0
 a3CqdUq8T0f4r9LBlZ8KNYxZpCPBj0OuG/z7M8TY=
Date: Wed, 22 Jul 2020 12:49:58 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 09/20] Documentation: i2c: eliminate duplicated word
Message-ID: <20200722104958.GM1030@ninjato>
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-10-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="n1iI6MeELQa9IOaF"
Content-Disposition: inline
In-Reply-To: <20200707180414.10467-10-rdunlap@infradead.org>
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, kgdb-bugreport@lists.sourceforge.net,
 linux-fpga@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Paul Cercueil <paul@crapouillou.net>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-i2c@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-leds@vger.kernel.org,
 linux-s390@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 linux-scsi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Wang <james.qian.wang@arm.com>, linux-input@vger.kernel.org,
 Mali DP Maintainers <malidp@foss.arm.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>, linux-mips@vger.kernel.org,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Wu Hao <hao.wu@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Jiri Kosina <jikos@kernel.org>,
 Hannes Reinecke <hare@suse.com>, linux-block@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-mm@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Jens Axboe <axboe@kernel.dk>, Michal Marek <michal.lkml@markovi.net>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Pierre Morel <pmorel@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Jason Wessel <jason.wessel@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>,
 Dan Murphy <dmurphy@ti.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--n1iI6MeELQa9IOaF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 07, 2020 at 11:04:03AM -0700, Randy Dunlap wrote:
> Drop doubled word "new".
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

For the record:

Acked-by: Wolfram Sang <wsa@kernel.org>


--n1iI6MeELQa9IOaF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8YGdYACgkQFA3kzBSg
KbadpA/9EQDFCbpqtn7iQvroXO/jn90XPgO/eYkUVHWLS+Wjvnn5pwwQSX2PDYKm
dx12lepK1qRqXevubBe+L1iqPn3D0E9fN76wFuduXdKo2yMlq8o1fjkw4YAbSEmm
oJK0WrVBfSBaCFfGTy7Uh7pc5Tb766msmLYfCC6VY5Rdlr9F9ETmHgI+7S6Lx8BJ
dXai3pSkOYaYGBajVdqRXRemtrE9x29nMbV8k2vFlELR1sRW8LAu4WOJ3SA9PfcP
jzPlcM8IV6nv2jVUvg5jpR9KQ3SHBRkKkmUgClWt/ZnxpqAjCziyimemRq6GmhNK
WIR0JiLChmgtF4XL+vPLBSiBHLKR4RjcpFwhJaAs3xYUymtdag+uTWvy6VfXliRy
rp1wIFSGP/0XynfajB+xXWjtV2CGKn9nmxwUWzCiz7QAikyI920ciFEGXYfhD/9a
opU6msSpxF+Oh25LZo2dR5QT5GZx9p1wkRxBBYYIeeboxv9LlMyLMXATDoCBGW/T
1jwmnIhDOetaTLzs7P2o54/LP32bVBsOfj6mcvZQ5N4ShIVMgHaiXBOUzqike+L2
EHwIHXjxI7NOeKpR5hXdr4JBNLAfyjtC6P0dCS03r2tNfuEizFlH2y7jDYvAcxKJ
5BqXSC1DnU7frboGfq/9qLfWIBUaeK34RIU46gmN/knsgV8y9zc=
=l+uH
-----END PGP SIGNATURE-----

--n1iI6MeELQa9IOaF--
