Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F384536DEE7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 20:20:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVn4M72kJz30B2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 04:20:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=VtSyqB3U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=VtSyqB3U; 
 dkim-atps=neutral
X-Greylist: delayed 327 seconds by postgrey-1.36 at boromir;
 Thu, 29 Apr 2021 04:20:11 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVn3v646vz2yQv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 04:20:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1619633997;
 bh=w2je6qGdiE6p/FITjA6Bavp5Ag6Uh9R3nmsWZFFhO28=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=VtSyqB3UuqoDI4rtmG66IoRl5nbRWG0d3UeyG/8OOxjNRZ/XKVZtIIGqHiJkSO/9Y
 5989sg2fMhOG/WdzdhP5OOHOUSGtWHUix8z0mHoc2Y7lAPRXCRXWBkeaSEUZJMHSN0
 m8RIynxpCDFNdiJFMl28pG2+ODm3Ab6xnkuK7tdw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.126]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mqb1c-1lFf9X0BlY-00mXgU; Wed, 28
 Apr 2021 20:14:19 +0200
Date: Wed, 28 Apr 2021 20:14:16 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: PPC32: Boot regression on Nintendo Wii, after create_branch
 rework in 5.8
Message-ID: <YIml+D0kB3t3BMXB@latitude>
References: <YIWNZI4YhFuRZwHg@latitude>
 <CACzsE9qOj2Fp4A9dYopQddw1oc7w--BCe_2_3xJfEo=d9WoC1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="S9LYVYxZq6odM2gc"
Content-Disposition: inline
In-Reply-To: <CACzsE9qOj2Fp4A9dYopQddw1oc7w--BCe_2_3xJfEo=d9WoC1Q@mail.gmail.com>
X-Provags-ID: V03:K1:jXLOzTihdjdUa50q93pkEJEojv2kp80b9+ceEg47oPKweyj6puf
 2BeUGD0JXVPNcTim4fGKqtZA11UzMuLlaelQ+/oC1fOe8F82lpvSFg0nQtw3LJUGObe32FJ
 DE3uvPZUXIvBfEpAbpCjsM8T2XZYloTHnJJ4JqAwowpDHlh89uRV8J59rlM+E4aNPV53PDy
 ejAqY7EJ6m7s+jJK5mSqQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bl2jeiC3YRM=:UQitqJa5HH5Ei1vXOJx7NU
 lcoXb/tuZlz90FbIYdWPxu+jV42Um1VvRqqCSVjGEmjO3hpN5XtLOG4snpilzKYbqnt5R0RHQ
 YWbeVG9QbWmhqFfLoS2/r4y7i+jnRhz8vdhuOA8XO9cIubyovnpmgrtdeC18jAG/S4kYbePug
 wfz85VVzJVAtJRnWTpDlvStUDO2JnZJhT1pjmeEWq7LEs4sm5ygiIucH+ZafO2xUc4BJoNQWD
 VaqVHeLFHrtrh5sII+cDAwhKUOxviokiObKNNrmkhhfINsgOGsHiOcTJmemj+jzMCZbHeBywn
 YbntYx/iRLPgqAhzbxI8RDjm2vLMiVKV4sknYcYK7lw3owpixQlCfPu/OXG9dVu10pAIsMESP
 99b7DDuZtfVyhZuxTeLSVYOshHOHZ+5a+TEQA6GmlvdK5b+EUGW1XhDCZUY29khAP9AZdWgVp
 flVB6BpuTpWps+v+0rsJHxdTsVggzsh0NyUS5KYTS8d3tbJsZuJWidoMLQyW27M948u6lQ4a6
 2IaifjhCbSJfDmy9A1b9JALH+88uhU+b2oZ0d4yEjk43LRKBqodDMzzqcZpyj1ekmU69r37uf
 mu+Ez6hdZj1VTyXQa1UwvTtPuR+4W0/oJ/Y6OBFxfhJHQRePe8Cb2c5ICtsWYogbvPp6T9zY2
 b3Bsea3WJbjxXWJ4If/xJN2ciId1POZytV2Y0xPpp4IlBhhlGauz5kTqgp72Yg4G8duAARrYQ
 oYfvd2ivB2yFcK6/DrvBMHL2DWBiQObk92CWo59RQ22EsIHYPL11cb5qBFIjdMWZPHSwZETTv
 WoBcZWgzizAwQ2ShThrj3huNq7T18PTelvD51GwzIPS1p1EKbogi0RpS19t6KAn4e8r7/TM0c
 O/YFztrIduCvC+V8O8zMGDpNxl/+secHTGbrU4EulnWdy00nOumHMUp0Ttv5UI5qDFn/nE6Z7
 0tDIKsEK8z4Ms8sSuhHOkKFWMQ/XC5n8l6kUsO0PVXY7xjc0CFUEqJ56Pt1/G0sWhZ4ZYuO91
 JV3i/uBHiPRgfzhoQt7kijUCCtNu+hxXwuEHEaHjhD/qs25p+Uklg11eSPTIij4sCYUaj6uDo
 xpaxIKxZk60SMertXgjNUo4UJPUXKYcHIT/oJaTSye+nPB3zxHqxMODSgc4E/ZGd8fIGrsb+1
 1DdPTC1/Q3tlcOUPKDx22lNBMLQPy88uayFcDb1GGmUOo2B4yylDy1eHWQCpOw5jhYd9ZxBr8
 btJKm8GoQkZjnC4ge
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
Cc: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Alistair Popple <alistair@popple.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--S9LYVYxZq6odM2gc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 28, 2021 at 11:33:24AM +1000, Jordan Niethe wrote:
> On Mon, Apr 26, 2021 at 1:40 AM Jonathan Neusch=C3=A4fer
> <j.neuschaefer@gmx.net> wrote:
> >
> > Hi,
> >
> > I recently booted my Wii again, and I noticed a regression at boot time.
> > Output stops after the "Finalizing device tree... flat tree at 0xXXXXXX"
> > message. I bisected it to this commit in the 5.8 development cycle:
> >
> > commit 7c95d8893fb55869882c9f68f4c94840dc43f18f
> > Author: Jordan Niethe <jniethe5@gmail.com>
> > Date:   Wed May 6 13:40:25 2020 +1000
> >
> >     powerpc: Change calling convention for create_branch() et. al.
[...]
> > Do you have any hints on how to debug and/or fix this issue?
> Thanks for bisecting and reporting.
> The "Finalizing device tree... flat tree at 0xXXXXXX" message comes
> from the bootwrapper so if that is the last output it must be crashing
> pretty early.
> Commit 7c95d8893fb5 ("powerpc: Change calling convention for
> create_branch() et. al.") made a change to machine_init() in
> setup_32.c which seems like it might be a likely culprit for causing
> early crashing.
> The branch that is created and patched is just for optimization, so to
> see if that is in fact the problem it might be worth trying to boot
> with a patch like below
>=20
> diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_3=
2.c
> --- a/arch/powerpc/kernel/setup_32.c
> +++ b/arch/powerpc/kernel/setup_32.c
> @@ -87,9 +87,6 @@ notrace void __init machine_init(u64 dt_ptr)
>=20
>         patch_instruction_site(&patch__memcpy_nocache, ppc_inst(PPC_INST_=
NOP));
>=20
> -       create_cond_branch(&insn, addr, branch_target(addr), 0x820000);
> -       patch_instruction(addr, insn);  /* replace b by bne cr0 */
> -
>         /* Do some early initialization based on the flat device tree */
>         early_init_devtree(__va(dt_ptr));

This brings no improvement, unfortunately. The output is still:

top of MEM2 @ 13F00000

zImage starting: loaded at 0x00b00000 (sp: 0x01145f90)
Allocating 0xae3970 bytes for kernel...
Decompressing (0x00000000 <- 0x00b11000:0x01143576)...
Done! Decompressed 0xa65fdc bytes

Linux/PowerPC load: root=3D/dev/mmcblk0p2 rootwait console=3Dusbgecko1
Finalizing device tree... flat tree at 0x11467a0


I'll probably dig deeper next weekend.



Jonathan

--S9LYVYxZq6odM2gc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmCJpfEACgkQCDBEmo7z
X9vi5RAAssEWMPQ+7+kTUriFMcZtGNdKNBIrH4hQXbdipck1aGFHBrBOckP5C+wA
zUyB2dn8ijxUuKImaUXk/7alkAB10cmwKgb5To2EPLVJOfCSqQIeaYPFD0YhKUON
HXhx5mAAIKWGYo7BoufiU6Kbov0jRNy+ywYqiUJxJq5LbA+nlzRTaxabtW7YJMtk
Y8a8xOSqkY7Q/1g/xH12QNH4eN6ZLRnFlQaWGhGkd/t0nirGPHoiXHySzzfW19Dy
GSwFUk/XOS9dPemCcwkRTwAeWfOZZgED81JIIAnmw0rIAEGRA0CF2/7wxVKFhyu6
IJg1FHnsY/ECKxa6Ua+SZYfFKd8fNxSFTn91AfIf5+3rq638yGoiSE5DWaFB3V8K
e+oAawX7fHb+Fe//7KKEYGilY/KNgSjrjocsSZVZD95pwxtq+jofDoYi9fZW3mGh
KEHMloMuJGP/bDmX3AykBkM6JVMBvwcQco8/ZQa9i5Sc4m5/2VsRhL5UQ8gPBNho
jCGQS4WrTiUvOOwumpRUwJtF765RueA0IirM50V3G5P5SydcTGvRfekZ5Rpl3Tys
poT+wlrdnIHit+rjMIyljYnMl/+N44K/nvtQzFhViFrURNpxDF1ZVcEtLCwvOLZ/
FQNgkeVnZEM15px8Zfzyc5N86MRCepuChtmtMZj+N0lY42Gr1sU=
=g46+
-----END PGP SIGNATURE-----

--S9LYVYxZq6odM2gc--
