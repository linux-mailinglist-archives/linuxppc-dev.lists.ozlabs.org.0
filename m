Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEEF33D09
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 04:16:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HwXc1ZnXzDqWG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 12:16:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HwWD4wFmzDqPB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 12:15:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.b="JEBKlTZo"; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45HwWD2tmNz9s9y; Tue,  4 Jun 2019 12:15:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1559614536;
 bh=z09flnAUfm9RhIXEmOxG01cmWOy778r4YU6BkCM/Qvo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JEBKlTZodXcJ9Di1OQg0ZI7jgZKNyBqd5zK6kaVMBzirScj+k3u5qgH0mNBuHJJrW
 yf1fycjJa02UUyzjq7KUtNthvwjD1DplYcaGcPoLM0oazQ2KhQSkawZT3jj2/Gx+y6
 gSPnx1CgphWyhSiyvTq1wfGkmDLmY3daqqDB/iUk=
Date: Tue, 4 Jun 2019 10:32:56 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH kernel] prom_init: Fetch flatten device tree from the
 system firmware
Message-ID: <20190604003255.GA9045@umbus.fritz.box>
References: <20190501034221.18437-1-aik@ozlabs.ru>
 <a62a8612-77f5-5c6b-a6a2-15f006051d5e@ozlabs.ru>
 <20190530193736.GC31586@gate.crashing.org>
 <43f037c57eed8ad2175470c940917dced947bb70.camel@kernel.crashing.org>
 <20190602232330.GN31586@gate.crashing.org>
 <7fc6cd5e-ddd6-4028-b4ef-7bdcd6db69d0@ozlabs.ru>
 <32063141651fd502c8ce94be19cb5c5330ce39bd.camel@kernel.crashing.org>
 <20190603234932.GR31586@gate.crashing.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline
In-Reply-To: <20190603234932.GR31586@gate.crashing.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2019 at 06:49:32PM -0500, Segher Boessenkool wrote:
> On Tue, Jun 04, 2019 at 07:18:42AM +1000, Benjamin Herrenschmidt wrote:
> > Yes we could make property fetching faster but mostly by creating a new
> > bulk interface which is quite a bit of work, a new API, and will in
> > practice not be used for anything other than creating the FDT. In that
> > case, nothing will beat in performance having OF create the FDT itself
> > based on its current tree.
>=20
> And that will change the whole boot protocol, the interaction between OF
> and its client, which is a much bigger change, not conceptually trivial
> at all.  Copying all properties at once is, which is why I suggested it.

Much as I wasn't terribly convinced by the original idea, I agree with
Ben and Alexey here.  Your approach has slightly more complexity for
slightly less benefit.  If it's worth doing yours it's better to do
theirs.

> It would take away the opposition to your patch.

Only from you, AFAICT...

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlz1vDUACgkQbDjKyiDZ
s5L/rBAA5iDgysEvs13JBaX9C9BwA1X0tM/3uwsKh6pVfnyRG32ZFYsl61TEgIJB
00P+ewsT01qXaZn+VZZztk76U2l6RY6HMmEU46NHcK7KFgsH85ibUMX+VTeMYh3J
dNuKoI0AZ+cRlZNimomnyH/90WuptpwR6w/Cl9CCK2NzgtZ+EEwenhus7Y0TTLdo
oP2e6DLYO+eGrZEOyK5/OhOTqEqaUffmVLq9Yu3Odor1j+xc0pIl/mGf0D8hfJyG
RTBA9nrISln4wCG4LFxQXs94vI2/At1D6uKOQEcAHIcyFuuANX+FOXf3+94fsZ94
O4qhzQZ5lsHg+1JKNBUF5j+2QidZnmOK7XNtdbeaIYpXP3941MK79sQ8e8gIVZZY
XuhZ+gpA/+eJhhdpwbOyPFnJeG5AcvmY+6qdyrNARDmT4NSzUn+GckcRkvjJLK5v
IXqGCC0g48LZlIfzh97l9Ff1KQbWa87OIbhcn6nF32Q22A9O7Z6Ble9JszZ1Bnj6
IyIfR82hVx1uKHQBBRAxDHUdFE62CMNmtMrekBq7v3c/twx/ogtI8ZsDlQIyuJBu
c+X+kXO0bInf7sqhJGtFy/daNiJ7OJT6D22PbzR9Y3bQs6Jh7c0RTK4Y/PHf0mAV
685IdGdmw9AdU0JX6G+p5yIzM1ljS97hX8nAZlvegImQnqikC7g=
=hy3s
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
