Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB873639D7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:02:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNtSn1rxnz3bVM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:02:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=iMAQleUA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=iMAQleUA; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNtSM17Khz2yRJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:02:26 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FNtSL0cNhz9tl3; Mon, 19 Apr 2021 14:02:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618804946;
 bh=h1lD9ZfJ6513fw43PlQ/e69VG6+6TuSyTkZm/RCseuA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iMAQleUAxRTO2XlP2sEjsoj8VI3JBc11G/xOv3yQpDcxWtHYDWyimY/nqV2eozHTM
 yUTK2n+lAiYttIU+BuFOeMGOvppcr75tYUbjAeM8tAOM2Gt1HW4mOyxCouSNW5hF1Y
 qWcg+Hsqfcu5cuj5mDV7BQ9jU290gEI7iVj06EoE=
Date: Mon, 19 Apr 2021 13:59:03 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 0/2] pseries: UNISOLATE DRCs to signal device removal error
Message-ID: <YH0ABwVgA/+iA+Fd@yekko.fritz.box>
References: <20210416210216.380291-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5WlJd1S45a6toUEh"
Content-Disposition: inline
In-Reply-To: <20210416210216.380291-1-danielhb413@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--5WlJd1S45a6toUEh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 16, 2021 at 06:02:14PM -0300, Daniel Henrique Barboza wrote:
> At this moment, PAPR [1] does not have a way to report errors during a de=
vice
> removal operation. This puts a strain in the hypervisor, which needs extra
> mechanisms to try to fallback and recover from an error that might have
> happened during the removal. The QEMU community has dealt with it during =
these
> years by either trying to preempt the error before sending the HP event o=
r, in
> case of a guest side failure, reboot the guest to complete the removal pr=
ocess.
>=20
> This started to change with QEMU commit fe1831eff8a4 ("spapr_drc.c: use D=
RC
> reconfiguration to cleanup DIMM unplug state"), where a way to fallback f=
rom a
> memory removal error was introduced. In this case, when QEMU detects that=
 the
> kernel is reconfiguring LMBs DRCs that were marked as pending removal, the
> entire process is reverted from the QEMU side as well. Around the same ti=
me,
> other discussions in the QEMU mailing discussed an alternative for other =
device
> as well.
>=20
> In [2] the idea of using RTAS set-indicator for this role was first intro=
duced.
> The RTAS set-indicator call, when attempting to UNISOLATE a DRC that is a=
lready
> UNISOLATED or CONFIGURED, returns RTAS_OK and does nothing else for both =
QEMU
> and phyp. This gives us an opportunity to use this behavior to signal the
> hypervisor layer when a device removal happens, allowing it to do a
> proper

Nit: it's not when a device removal happens, but when it *fails* to happen.

> error handling knowing for sure that the removal failed in the kernel. Us=
ing
> set-indicator to report HP errors isn't strange to PAPR, as per R1-13.5.3=
=2E4-4.
> of table 13.7 of [1]:

> "For all DR options: If this is a DR operation that involves the user ins=
ert-
> ing a DR entity, then if the firmware can determine that the inserted ent=
ity
> would cause a system disturbance, then the set-indicator RTAS call must n=
ot
> unisolate the entity and must return an error status which is unique to t=
he
> particular error."
>=20
> PAPR does not make any restrictions or considerations about setting an al=
ready
> Unisolated/Configured DRC to 'unisolate', meaning we have a chance to use=
 it
> for this purpose - signal an OS side error when attempting to remove a DR
> entity.  To validate the design, this is being implemented only for CPUs.
>=20
> QEMU will use this mechanism to rollback the device removal (hotunplug) s=
tate,
> allowing for a better error handling mechanism. A implementation of how Q=
EMU
> can do it is in [3]. When using a kernel with this series applied, togeth=
er
> with this QEMU build, this is what happens in a common CPU removal/hotunp=
lug
> error scenario (trying to remove the last online CPU):
>=20
> ( QEMU command line: qemu-system-ppc64 -machine pseries,accel=3Dkvm,usb=
=3Doff
> -smp 1,maxcpus=3D2,threads=3D1,cores=3D2,sockets=3D1 ... )
>=20
> [root@localhost ~]# QEMU 5.2.92 monitor - type 'help' for more information
> (qemu) device_add host-spapr-cpu-core,core-id=3D1,id=3Dcore1
> (qemu)=20
>=20
> [root@localhost ~]# echo 0 > /sys/devices/system/cpu/cpu0/online
> [   77.548442][   T13] IRQ 19: no longer affine to CPU0
> [   77.548452][   T13] IRQ 20: no longer affine to CPU0
> [   77.548458][   T13] IRQ 256: no longer affine to CPU0
> [   77.548465][   T13] IRQ 258: no longer affine to CPU0
> [   77.548472][   T13] IRQ 259: no longer affine to CPU0
> [   77.548479][   T13] IRQ 260: no longer affine to CPU0
> [   77.548485][   T13] IRQ 261: no longer affine to CPU0
> [   77.548590][    T0] cpu 0 (hwid 0) Ready to die...
> [root@localhost ~]# (qemu)=20
> (qemu) device_del core1
> (qemu) [   83.214073][  T100] pseries-hotplug-cpu: Failed to offline CPU =
PowerPC,POWER9, rc: -16
> qemu-system-ppc64: Device hotunplug rejected by the guest for device core1
>=20
> (qemu)=20
>=20
> As soon as the CPU removal fails in dlpar_cpu(), QEMU becames aware of
> it and is able to do error recovery.
>=20
> If this solution is well received, I'll push for an architecture change
> request internally at IBM to make this mechanism PAPR official.
>=20
>=20
> [1] https://openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-2020=
0611.pdf
> [2] https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg06395.html
> [3] https://github.com/danielhb/qemu/tree/unisolate_drc_callback_v1
>=20
> Daniel Henrique Barboza (2):
>   dlpar.c: introduce dlpar_unisolate_drc()
>   hotplug-cpu.c: set UNISOLATE on dlpar_cpu_remove() failure
>=20
>  arch/powerpc/platforms/pseries/dlpar.c       | 14 ++++++++++++++
>  arch/powerpc/platforms/pseries/hotplug-cpu.c |  9 ++++++++-
>  arch/powerpc/platforms/pseries/pseries.h     |  1 +
>  3 files changed, 23 insertions(+), 1 deletion(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5WlJd1S45a6toUEh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB9AAUACgkQbDjKyiDZ
s5Kgpw//SGX28rhZsxXWWJl8U3o0WsOgXApzExnjG8XWjP7ZIoZhWKoQOPKFfMPM
iFHMdUM96C5cvCDr/FcwcGvE7rjMoDqEtGGTMQiFezzqb9uaZpbay5EVydJA5a0C
qblKlnVX6j5clCSbfKI3C9AjnFPZOba4gagNKgKxQOE3qqXmekZFrdf2aDXhndu2
O/VsN+BmWIafZExaeW3KVyQp5Bo1Nx233G6rcJ0zJ750axleQbIjyQjBS1yLK4Z5
Z5doV5SjAB9P6jthMztdxm6wsx9FCpsz9Enzg8dOhHZ1PVq6peyCC9DdnZ6sLVZ0
mkIeQ7RzVF+xOT3uOkgd2W6njpTkIQ6Ca1O83hlmUGT3DkkVhlQ7sBcsxKFrGJST
yB7sNNEIHFV3pTj3dQE2DHKoHsGcV2c9vsDqW4tMZgeECduA6C4QO8NBGB50CwHQ
dAARwTf/AR3BU5QDxTgws2+nr5EJFx5e8YK8SA0O+BQxK40BTwhd8Nf4gXP5n04G
cbW6T/miExl2Wmu3VCvwITlNjzUMiAMgEPJ7Wpqu9IFz8+iJ4jrJSDvJFUiLeyF7
ZkC62Bf0TB8k7jZDcng8qzbUksrZA/NFwwIwPl7C54MTmQ7nMjOW5O5q//f3+x62
VVZFKYIpixD7ACpID98eZU5xnY5eobajbZ4pJUmSKxpNfBeOk0M=
=KULJ
-----END PGP SIGNATURE-----

--5WlJd1S45a6toUEh--
