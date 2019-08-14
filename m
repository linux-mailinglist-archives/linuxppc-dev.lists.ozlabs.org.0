Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 708A28CD3B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 09:52:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467hd95QskzDqsd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 17:52:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.18; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=gmx.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.b="OuhF3ltU"; 
 dkim-atps=neutral
X-Greylist: delayed 330 seconds by postgrey-1.36 at bilbo;
 Wed, 14 Aug 2019 17:50:48 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467hbD1KjqzDqn4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 17:50:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1565769038;
 bh=WaUwZB8urvVG948whRzXPedtOy9zLbWOaIvo4IOnSXM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=OuhF3ltU8IHI0xPqfQF+ZZCcwFg/C3lnucep5Zl9dEXYO4ABktVSJ3XFqVhN064Ub
 IqdLEfa6cFu79Uh+9aRhBA7Wtp/H23XiXC7aQfpEqRnxJ9CFhFY39V4JreTFkURIch
 GqV7HT0gT6n5yDDgqp76eCdfBfIZBcHOdQ4qfuRU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([109.90.233.87]) by mail.gmx.com (mrgmx003
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0LkOeR-1iYEAy1qeJ-00cOG6; Wed, 14
 Aug 2019 09:44:59 +0200
Date: Wed, 14 Aug 2019 09:44:40 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/32s: fix boot failure with DEBUG_PAGEALLOC
 without KASAN.
Message-ID: <20190814074440.GI1966@latitude>
References: <8c83a4e1237658ed1acfb9a9891048a15f9ca36b.1565760495.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="r5lq+205vWdkqwtk"
Content-Disposition: inline
In-Reply-To: <8c83a4e1237658ed1acfb9a9891048a15f9ca36b.1565760495.git.christophe.leroy@c-s.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:wyxn0Wc5J5kp5Z+GclnMvwK33OhK308I1mfB8ka5lZnfMn/D6zH
 OnscyqIweg5eunew0cYK9tcc4f7dpYIUnqxgeEHzRiPb1esRj0Pdd2stcDywDm99Wt3dCC8
 STyRXCyWwsUiua9/L3bdpnncYy0IBd9ekhjYkpQ565vzvueP23h7/ANK9ZmZueN2LoJkZKQ
 KXhndwDzT5ijM3nNFZB1A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YAlFl0DIR+U=:qpQDwfjxcBcyv4v6e8YUJj
 E81uPi4bbklAF9qwNXPENSwkE86z5Mr8MreMe8l0ynWpcNe85uQbeopflmbqrGyowNtCIjz2l
 xRKatEbQa5iIHOD8E9AObZX+IAojRI3aE8In74yi4v3wei1KeugU9n1ZPCLW1xnV9d1NqzUCM
 uOOxiXkxxvNqtTiHznPb4j7SXwhW/d/qJIHPH0W3/vGw1h1i8RoiIojYBRUQ3L2RsgdteODOn
 TrdYzKj+LX6EvbZEqerN1DiTVm61jXqHB3InpPNksAsGCtcIEtFsl2Ziau3IpIDfvufL8+S+s
 YAesWf9quAQrE/u2eDIxqi9PMMBTxxPgIrCx3foNUo90lc9PiypdDdJZp1iggyWN+IfG3nLd3
 eqSUMV8VVgDrCyYTWEV0kfm/8sD9JXkOr9Z7OO9UpxJkCIq2cz+vtjFbuCw5MWNj69VwGr6PS
 JyPt3OTF2KetFfYc69JtV02S9c0E7VpHf7k+2BwT5Ca7pFK0697Bwfn9X0r+1Oia01hgQJBz8
 evOzKUgatGX1yY017JoDSAYS8kLyEcSraRxGdMpZIUIhVN9JFkfyQ37N4ueNkwzKHlf0IvIzk
 /abCdaIhTYutPmctTEQy8+u/I8T/5JhmyNMr3X9GpVJKVzADmsai4FhweIULEkruP70eQ3ptn
 vdjjJZi7wte9XKy6Bmn9TLlVODzyB4U3HkZdgI+RDnKBQdolTQTLT5x9szpeAaDsZja3OAgeG
 Dk4JWI4L2A5AAZ8Oj38gVUSlp+hTVCi/29CFY3n94GlPHN2g6w3E1tbdtq7WNy6249tO7OU1d
 x44t1B6eme3A4OWgvjuQ0/KMacUC1wzYekNxFY1t03aei/zn/R7Q6dc+M58bsK/TnME8a0vpJ
 B8jFgc4bz/0QGBc4phFyolTKBWavdF3b8GPYhI2T2gEeIJESnLJJsyJyg7a3VMsAhDycLOIqe
 BvBGKeCOCpSTU3ZkXd6aESN5tMv5kqP1X+wGaRggAZQIjrVxfWawnd1mWkwNrV0og+nbTqGQA
 idlNJXfJlSJBVs2YLcCi8Rzyx0qshoSu+NNDqYflVhZbmy36Eq9zE6iYOXUBK+LcKCbmksLd9
 4ZJmhiMFgLeB0UJBZHGRVz4yS3dvFA7GG72Gdwu31/Rk7TVXYAojDyoxCXeNkpyLDVDWeq2N0
 c5YTpD3F/9c6wUmcnOcF/6TeFt3rxnq/8w9NbrN4t1aSjxHw==
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
Cc: j.neuschaefer@gmx.net, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--r5lq+205vWdkqwtk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2019 at 05:28:35AM +0000, Christophe Leroy wrote:
> When KASAN is selected, the definitive hash table has to be
> set up later, but there is already an early temporary one.
>=20
> When KASAN is not selected, there is no early hash table,
> so the setup of the definitive hash table cannot be delayed.
>=20
> Reported-by: Jonathan Neuschafer <j.neuschaefer@gmx.net>
> Fixes: 72f208c6a8f7 ("powerpc/32s: move hash code patching out of MMU_ini=
t_hw()")
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---

Thanks. This does fix the DEBUG_PAGEALLOC-without-KASAN case.

Tested-by: Jonathan Neuschafer <j.neuschaefer@gmx.net>

--r5lq+205vWdkqwtk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl1Tu94ACgkQCDBEmo7z
X9uE2BAAy8A3Rc4+Bt+NtsfU5ntpwFsT7xUp4RlfKnMWZwTDC8GBh2NqaBrPJ5Ob
uMxgdv4pYpCB2JWQKEHerh7IWUUBE0BGyytakjrs5gSG5L1dIUNKO0x8tTv8Ew0Y
+8pY+eizv4V/fUPKLhoINKRVLlwWlZQs3r2A6Nw/uFpsR4l+nWPT5XNjIirrdsJO
afHYg52YyYpO/IhEI37+sGx0l94hY5y73twQs1nUc6MzEwFN+bp70PhbSHM1Bco1
Nwlxd1gCO4ArMQMlzKs0wMxja9paup6ZvZul6CcaxpJiH1L6DFVVejGVTpv3Yhvk
tw3yoAbfe3CywkqfBZFDuTanvkw3OS+ew1DD+3VcnclndyrB/OIwEohIEGC3XohD
Y3cSmE5NFPQ+HKE7M8XaTuvo7jliY85GWbl86WalK9wn9lmDlqKchaELkxYkCOMY
rf3oA3akchxEJgJygnlG30Y6r5FyrAMkePEq7ABmaFQatg0BnB/BKD0l+Bvxrisz
cmt4WoU9PIqohSucLALSiYBFOfATqP90Lw0SRBWTAeWI4ZPH6b9fb7LzBjf4550h
vZUHDq2tkk7LSXSxJZ8SJ300Ww/kFHWIZYzfrURyNIFKadx9HmBcP/Oa8ta95Ic1
cV907yOmw8T4rKHfSC75px4kz0+CJcl+urmHmSHwInZUogRMadY=
=pQtO
-----END PGP SIGNATURE-----

--r5lq+205vWdkqwtk--
