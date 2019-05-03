Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C070126F8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 06:50:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wKT85TrszDqW7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 14:50:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wKRh2hwgzDqMp
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 14:49:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.b="cFBI4On3"; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 44wKRg5lYJz9s9y; Fri,  3 May 2019 14:49:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1556858975;
 bh=lXYAFi5HS9VNSfsQRczwFXhO31BOOOPUKAtoP1hnd10=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cFBI4On3Jp2hFf5UDVmMRXF5/9cVXBCe+LatHO76rb0jSTEz36RhzpZWQrUC3mK30
 pLvbMfsyuuTEfIOPMgrKB5s0+3r1c/qhnMKVIQpH4cr+fUBL3mQKLx9GFhhj4S6rDN
 Cuu5xcPeKiwhPqSGyBT9QPP46F9qba9DYHt5Bpro=
Date: Fri, 3 May 2019 12:35:11 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Stewart Smith <stewart@linux.ibm.com>
Subject: Re: [PATCH kernel] prom_init: Fetch flatten device tree from the
 system firmware
Message-ID: <20190503023511.GI13618@umbus.fritz.box>
References: <20190501034221.18437-1-aik@ozlabs.ru>
 <20190502042702.GH13618@umbus.fritz.box>
 <87bm0ktn1q.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tctmm6wHVGT/P6vA"
Content-Disposition: inline
In-Reply-To: <87bm0ktn1q.fsf@linux.vnet.ibm.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
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


--tctmm6wHVGT/P6vA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 03, 2019 at 10:10:57AM +1000, Stewart Smith wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
> > On Wed, May 01, 2019 at 01:42:21PM +1000, Alexey Kardashevskiy wrote:
> >> At the moment, on 256CPU + 256 PCI devices guest, it takes the guest
> >> about 8.5sec to fetch the entire device tree via the client interface
> >> as the DT is traversed twice - for strings blob and for struct blob.
> >> Also, "getprop" is quite slow too as SLOF stores properties in a linked
> >> list.
> >>=20
> >> However, since [1] SLOF builds flattened device tree (FDT) for another
> >> purpose. [2] adds a new "fdt-fetch" client interface for the OS to fet=
ch
> >> the FDT.
> >>=20
> >> This tries the new method; if not supported, this falls back to
> >> the old method.
> >>=20
> >> There is a change in the FDT layout - the old method produced
> >> (reserved map, strings, structs), the new one receives only strings and
> >> structs from the firmware and adds the final reserved map to the end,
> >> so it is (fw reserved map, strings, structs, reserved map).
> >> This still produces the same unflattened device tree.
> >>=20
> >> This merges the reserved map from the firmware into the kernel's reser=
ved
> >> map. At the moment SLOF generates an empty reserved map so this does n=
ot
> >> change the existing behaviour in regard of reservations.
> >>=20
> >> This supports only v17 onward as only that version provides dt_struct_=
size
> >> which works as "fdt-fetch" only produces v17 blobs.
> >>=20
> >> If "fdt-fetch" is not available, the old method of fetching the DT is =
used.
> >>=20
> >> [1] https://git.qemu.org/?p=3DSLOF.git;a=3Dcommitdiff;h=3De6fc84652c9c=
00
> >> [2] https://git.qemu.org/?p=3DSLOF.git;a=3Dcommit;h=3Decda95906930b80
> >>=20
> >> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> >
> > Hrm.  I've gotta say I'm not terribly convinced that it's worth adding
> > a new interface we'll need to maintain to save 8s on a somewhat
> > contrived testcase.
>=20
> 256CPUs aren't that many anymore though. Although I guess that many PCI
> devices is still a little uncommon.

Yeah, it was the PCI devices I was meaning, not the cpus.

> A 4 socket POWER8 or POWER9 can easily be that large, and a small test
> kernel/userspace will boot in ~2.5-4 seconds. So it's possible that
> the device tree fetch could be surprisingly non-trivial percentage of boot
> time at least on some machines.
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tctmm6wHVGT/P6vA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlzLqN0ACgkQbDjKyiDZ
s5LOrRAAgHrSb8wyNCKWroczzgLT880OBXLyUu2sMjzbU7pkaq+x1yxpGfhRVDUW
+VSD/VGl/3T2q3dQRCQn0Ur8/jB0Sd31uSJilslPCwjt+cv9BPHmE6z0HxpKzysJ
BswzxH90eJcsnwiCNHmBcAmQuu2R3MNMUcM9Yr6WAJW2871wY9MVHMnU8TMcfuzh
ZbUhUFwMCYDqAKwG4rTd+/4dw0GzjfjFOYfZr/uiQi7lNEzRUfB0jOGongWiaOut
tEfwVlTQsXN4RPvtnw2EhdNZmjtwVTz/z1jGpCnRPTe1mulQwdRQn5ndtaR4cBWc
p+ulIc64SYuR8qvbZcYsZIcMnHDbKXTGcfl/XM952rV/g1UlCtWMfVL02fnk9IW6
vVCSQDtmUfLtFMK/M2QyjcRhGNx0vUMIQYk1KDqYbH9ExguY9e2QZvZLUjeKEu+T
eRB0dHAcEla4cg2+YTYNPC5j4QUi62MHtK4MaV8CMob3uuRf0fmex3H9JjND7vvv
7SP2d5h0qZj+/oGfLi18HALI2+Hy1aLp6bDBkeo6YiBf8M/y1YttZQr4tpng0DcF
M4SoqzMCnk5Bx4dMiMKPnTW+L4XuN1C2a1AiPJV6xYNJ+hALYET4VbTUt0mQXVif
CjXP5A93hNy6AFpYR+TCK6F1BKtbgk9YgG3bE9dCDLBqYbS9P+s=
=gVtK
-----END PGP SIGNATURE-----

--tctmm6wHVGT/P6vA--
