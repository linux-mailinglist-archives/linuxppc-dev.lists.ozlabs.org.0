Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3F92278DA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 08:29:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9pbR1y99zDqCh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 16:29:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=iFlPVsUQ; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9pYb5rMlzDqVT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 16:27:47 +1000 (AEST)
Received: from localhost (p5486cdb1.dip0.t-ipconnect.de [84.134.205.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A90BE20792;
 Tue, 21 Jul 2020 06:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595312865;
 bh=QNZB24Red5nZ7QJEWu/bhYPZ8qCIs0gdeOojRKvwUbc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iFlPVsUQ5jp4HkIuNgchaBlEaPwCJ5rAWpOjvYwu24JowCXbqT4Y4NFvV7lOtGvnD
 WbV7+eWsMRVnQhd1iM3mq6FceyBSaNle0jT2YWxIkDhLXp4JxoUmMo59i4zfAF9Dnc
 uSRYRxvcbeeEkz9MKjlUUted4xv+cdHVYaFylSoY=
Date: Tue, 21 Jul 2020 08:27:43 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 09/20] Documentation: i2c: eliminate duplicated word
Message-ID: <20200721062743.GC1044@kunai>
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-10-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="KN5l+BnMqAQyZLvT"
Content-Disposition: inline
In-Reply-To: <20200707180414.10467-10-rdunlap@infradead.org>
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


--KN5l+BnMqAQyZLvT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 07, 2020 at 11:04:03AM -0700, Randy Dunlap wrote:
> Drop doubled word "new".
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: linux-i2c@vger.kernel.org

Reviewed-by: Wolfram Sang <wsa@kernel.org>


--KN5l+BnMqAQyZLvT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8Wit8ACgkQFA3kzBSg
Kbar3Q//fOHenQW39TRIGhc1tbL6/xYqSxhK0miywg7rYqY4e2HaJMe10FL+wxre
DXculy3u/RjkAyVnyWY2E5LJq4GruTUAgQXmjsdWGyTlovKil7fZiOwPvpvFi1TY
P+aUgZGbCpjf3q3lII5fuj191kVZahsYyJoweFZIXa74x5yf01SkV7WRNejAxx4y
PqSwNhLQJxvvrouZBFOxL+1s30bTScKiXxBis783G/F4hGBDLt3BglTxhC7cYdrc
zSIpUcsq94MD3jazLywZlad84tW3QndeLPhb1m5Cq3rQddGsytbstUOGRpKl8oEL
VU32/ZYGhYGVxUDv0/K4Nc+CJHJ5Y3nH2ty2bGkiPEPufa9P/mqSwCEqHZS9S5+P
sbc71bTA49VuzvbBJQo8vKJTqmtAlLx0Gp3JYQS4x37FiT/x+HqwE6Rr203fedNg
dtOgqTre+CjYwD6xA4NWseNoXHtMoqQ7H+d8YKHnVAelI8+vjtAdL721Y0rUqTIZ
3DnxQeISiGPXtp6lY39hEbLmCewkmxasghnH6yNO2ScldPRyf0cAmcmLYJtAen1B
kzE7QAgV2kNCSr6+fC9AxrReGHmjwmnTqMZZ5VyzkQseAeqyA6DTO4b5XvKG9lzA
AxOaVaRCYWuHyrwQosk94FG41iqHEFzDlWndYY+nEKNYIPGMn2w=
=OoVL
-----END PGP SIGNATURE-----

--KN5l+BnMqAQyZLvT--
