Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 424227970BB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 10:25:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=QRQUlIzL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhC4J2c6jz3c5T
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 18:25:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=QRQUlIzL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com; envelope-from=j.granados@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhC3P2QY0z3bkm
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Sep 2023 18:25:02 +1000 (AEST)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20230907082450euoutp0268091ba27c96f23d766e7e9b2b1c7f90~CkFGkfjh00383803838euoutp02D;
	Thu,  7 Sep 2023 08:24:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20230907082450euoutp0268091ba27c96f23d766e7e9b2b1c7f90~CkFGkfjh00383803838euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1694075090;
	bh=K84mrKgpu7Gp7E1wsEfRvrKyh+s/n5grmyvysB575oA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=QRQUlIzLacORSoSMsDwibDDr1BYQ+HS+FZVCFjc/Qbf/tYBTdXwdI0BeuBfcHwnS7
	 dgfJVTShj9tf7mLW9YogkqachsUyS5kITxIW5Jsf2UjiUeTBPWh8c4OL1hAZoj5hTE
	 TME64QTDO5rYgaiDPVClOhPNf+28jEa6gIb0BlEY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20230907082449eucas1p1e9bd7758045a0dff6a5f3886ea3ad042~CkFGUyCEr2852928529eucas1p1_;
	Thu,  7 Sep 2023 08:24:49 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id B7.B6.37758.1D889F46; Thu,  7
	Sep 2023 09:24:49 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20230907082449eucas1p19f0c5e38ee9aff84758df55c1a8f58a4~CkFFvjSM33088230882eucas1p1C;
	Thu,  7 Sep 2023 08:24:49 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20230907082449eusmtrp1855d35a183294fcf6b365f66261d5f30~CkFFuaZY40859808598eusmtrp1C;
	Thu,  7 Sep 2023 08:24:49 +0000 (GMT)
X-AuditID: cbfec7f5-815ff7000002937e-b1-64f988d1d890
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 7F.E1.14344.1D889F46; Thu,  7
	Sep 2023 09:24:49 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20230907082448eusmtip1943ff4b432cd8a78ff577b90ad37c58e~CkFFaVBft1824118241eusmtip1c;
	Thu,  7 Sep 2023 08:24:48 +0000 (GMT)
Received: from localhost (106.210.248.249) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Thu, 7 Sep 2023 09:24:48 +0100
Date: Thu, 7 Sep 2023 10:24:46 +0200
From: Joel Granados <j.granados@samsung.com>
To: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH 3/8] arch/x86: Remove sentinel elem from ctl_table
 arrays
Message-ID: <20230907082446.a4o46vka2vtes3h4@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="xetpjh2dyeh26jbv"
Content-Disposition: inline
In-Reply-To: <ZPj2F4retSgg3vAj@gmail.com>
X-Originating-IP: [106.210.248.249]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA2WTa0xTZxzG9/ac9hzqqseW0DdoRlaZTGWoDOe7ANvM2HbkgxI+LG5xkwbO
	kA0KaS3zMpIyOiiChIAMVhnhMlpuOi6lDJRBugEiW6EiDB3gIl4oIBQoSiGUtTu4mezb7//8
	n+fN8//wkpiwmPAm42SnGLlMGi/h8XFjt8P8mkXjiNlXUxSAGvqsPNS8qiXQxJqJhxbrnTw0
	p8sGaDTvEYEWrH8BNFmfAdBc2qdoQPuEiybbU3E0XVID0LcNYrRemoh+y0pAjRPDXGSsVHPQ
	tfZeHNk0s1w02FbMQ8ZFNQ/llqVhyFTQDtDqUycX9bdd5qLKPywcNJL7AKBa5w2AbnaWcpBB
	5argmBzBkXUwG0Pp2i1I9+NlAjU1FmBIPXoArS67nlyun+AiXeuRd/zop9/k4HRdSR2gB4ct
	GH1JZcHppdtmDj1jteL0Lxo7QZdbVTjdqh0j6NJGJd1UtZuuuGbl0HemQ+nGmkwePWs2E3Ru
	eSeIEH/MD4lh4uOSGfnet6L4J7UFQ9ykIs/T800vq8AadR54kJAKgubeFnAe8EkhVQXg1PjK
	xmAHsF+lwdlhEcDyKgP+LDKmuctlF3oAayrrwb+uHkv2xmAAUFfdSrgjOOULH2fmAzfzKH/Y
	PzOKudmTksAK+/w/Hoyy8+GvZVFuFlFH4aI2k+tmAXUQXurMBCxvhb3f3cdZ/2k4dnfGpZMu
	3gb1TtIte1C7YHpzB49tugN2XxjdaJ0CbxjucNzdINWxCTqamrnsIgzm6bs2WASnegwEy9th
	X342zgbyAexw2gh2qHVdlrrEYV3BUH3r/kbiEFzVPMTdjSC1GY483soW3QzzjIUYKwugJl3I
	unfC2vEZPBfs0D53mva507T/ncbK/rD06gLvf/IeqCubxlgOhVeuzOGlgKgBYkapSIhlFK/L
	mC8DFNIEhVIWGxCdmNAIXJ+mz9mz9BOompoPMAEOCUzA1xW+V187ALxxWaKMkXgKZn2exAgF
	MdIzZxl54gm5Mp5RmMA2EpeIBXtCe6OFVKz0FPMFwyQx8mdbDunhreL4vagfTj3s8dXPH74k
	El3AjPvxz0XiziP+ynup2z86sPdhxVB+cuwwv+qHhvUZr1cewNCA40PjKUUyaiCoNk7o/6ft
	mK26a+e79rzIImfqWVufzePNoC5SXXise8HUI79p50+Ei/hCvY8uLXyL9JNRuTw6q66FGoo4
	MZ03NbJur8iRRpWr8TObbG2vXh+/jbdi69VJJd8ftfqah6aXmz+wCgJ77RmV72UN+/WMF7/Q
	IglM0V8UO7wyciQhhwWHdrUlB600hHRd/ex4/xth5xIGCyczvCquRxyMNKyskYHGwJxyZbD6
	/RafiKh9pGXqUeTbGZLlonPhjt/Tm8JuURNfB0twxUnp/t2YXCH9G3HexbOvBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA2WTe0xTVxzHPbe3t4VIdgdlnIACKQwnzkqBwmE8nAljdy449o9ZmMI6enlE
	aEkf6MwW6gQpz6CAC8URwFCQl1CxAsLsmLoBjocMhoTHNuTRoSAPoYxRVmiWmey/z/n9ft9P
	fjk5h82wbSMc2QliOS0VCxO5hDXeY/px/PCAakPkVa3CUVOPgUC3N9UsNLXVSaCVRhOBFjU5
	AI1dmWWhZcNvAM01ZgC0eDEK9avXmGiu4wKO5ktrALra5IC2yyToUXYS0k4NM5GuMg1D7R1d
	OHqhWmCiwbZrBNKtpBEov/wiA3UWdQC0uW5ior62eiaq/HUAQyP50wDVmroBeqwvw1Cz0rzC
	xtwIjgyDOQx0Sf0a0tysZ6Fb2iIGShsToE2jWWlsnGIiTeuJdw9Q6+l5OFVXWgeoweEBBlWi
	HMCpl096MeqZwYBTP6hWWVSFQYlTrepxFlWmVVC3qj2p6+0GjBqdD6a0NZkEtdDby6LyK/Qg
	wiGSFySVKOS0a7xEJg/mfspH3jx+AOJ5+wbw+D7+p9/xFnCPhASJ6MSEFFp6JOQzXryu7xEz
	+SrnnKG9nqkEm2QWsGJD0heOqyaZWcCabUtWApi9/gRYGvtg0+oQ08J28O/hLMIytARg4XA2
	bjk0A5j/+9f4zhROusPnmQW7aYJ8G/Y9G2PsMIfkwuurS6ydAINctYYbxvJdrR0ZDocmtlk7
	bEP6wxJ9JrBYuzCYV/gAtzReh13FT3eZQabArZxZs5VtZidYZWLvlK3Ig/DS7XuEZVU3+DB3
	DLfwV3BlawbkAzv1Kyb1Kyb1fyZL2ROOmAzY/8qHoKZ8nmHhYNjQsIiXAVYN4NAKWVJcksyb
	JxMmyRTiOF6MJEkLzA9X93CjuQXc+HOJ1wkwNugE7ubkH421/cARF0vENJdjs+CyJrK1EQm/
	OE9LJdFSRSIt6wQC8zVeZjjax0jMv0Asj+b7eQn4vn4BXoIAPx+ug80HySqhLRknlNNnaDqZ
	lv6bw9hWjkospsytyic1MHColX9OLsk9GWZYH2o5ce3OjUV3kTKl7qfuQ3lu+m+xj6JPT+yP
	0XTXyY6L1/yj7v11bOWu9fdLR11jjdsZ1cb9Xa7uNg2jrafm9yizNBGJX4ZG9Z8VNPVFckJH
	HxftqTz/SQ5x+MPvQnPfdz77S2B662zae1WzMudNxZ19Lw8Wh/zc0v28D8y0+By/uYUxRbET
	vEL3oM9nnNiXB6Ns0XRthJMwnJid7HFePumSpwun72phqvTUXu43JTGUQ29pU+AEx8P1gX2F
	/v6bZ6bz7Q8cbV4J9/54+Y3i+zq+R2ZC2NMXG6UjF1L1bm/FemSEGQuuTHoei9zr5lKQHsrF
	ZfFCvidDKhP+AyiHiRBNBAAA
X-CMS-MailID: 20230907082449eucas1p19f0c5e38ee9aff84758df55c1a8f58a4
X-Msg-Generator: CA
X-RootMTR: 20230906215901eucas1p27ce4a12bd251bde56d50568ac3ed1cf9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230906215901eucas1p27ce4a12bd251bde56d50568ac3ed1cf9
References: <20230906-jag-sysctl_remove_empty_elem_arch-v1-0-3935d4854248@samsung.com>
	<20230906-jag-sysctl_remove_empty_elem_arch-v1-3-3935d4854248@samsung.com>
	<d0d30ad4-7837-b0c4-39f4-3e317e35a41b@intel.com>
	<CGME20230906215901eucas1p27ce4a12bd251bde56d50568ac3ed1cf9@eucas1p2.samsung.com>
	<ZPj2F4retSgg3vAj@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Dave Hansen <dave.hansen@intel.com>, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, x86@kernel.org, Russell King <linux@armlinux.org.uk>, willy@infradead.org, Ingo Molnar <mingo@redhat.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, josh@joshtriplett.org, Nicholas Piggin <npiggin@gmail.com>, linux-csky@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.i
 nfradead.org, Iurii Zaikin <yzaikin@google.com>, linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--xetpjh2dyeh26jbv
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 06, 2023 at 11:58:47PM +0200, Ingo Molnar wrote:
>=20
> * Dave Hansen <dave.hansen@intel.com> wrote:
>=20
> > On 9/6/23 03:03, Joel Granados via B4 Relay wrote:
> > > This commit comes at the tail end of a greater effort to remove the
> > > empty elements at the end of the ctl_table arrays (sentinels) which
> > > will reduce the overall build time size of the kernel and run time
> > > memory bloat by ~64 bytes per sentinel (further information Link :
> > > https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org=
/)
> > >=20
> > > Remove sentinel element from sld_sysctl and itmt_kern_table.
> >=20
> > There's a *LOT* of content to read for a reviewer to figure out what's
> > going on here between all the links.  I would have appreciated one more
> > sentence here, maybe:
> >=20
> > 	This is now safe because the sysctl registration code
> > 	(register_sysctl()) implicitly uses ARRAY_SIZE() in addition
> > 	to checking for a sentinel.
> >=20
> > That needs to be more prominent _somewhere_.  Maybe here, or maybe in
> > the cover letter, but _somewhere_.
> >=20
> > That said, feel free to add this to the two x86 patches:
> >=20
> > Acked-by: Dave Hansen <dave.hansen@linux.intel.com> # for x86
>=20
> Absolutely needs to be in the title as well, something like:
>=20
>    arch/x86: Remove now superfluous sentinel elem from ctl_table arrays
Done. Will wait to see if other ppl have more comments to send out V2

Thx.
>=20
> With that propagated into the whole series:
>=20
>    Reviewed-by: Ingo Molnar <mingo@kernel.org>
>=20
> Thanks,
>=20
> 	Ingo

--=20

Joel Granados

--xetpjh2dyeh26jbv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmT5iM0ACgkQupfNUreW
QU8bUwv/fHvrxw5jNdVywGXfBd7e+5oIULa8H+WaPDRFBqcXRCiP5e+Lm2mdytxR
6Qy5bFl4klUIDRa6aQR6Rz02E0hmsNe+VsgDTRi0PWWF3407VH4E1wjmOj5aT2VG
PLGzd4HXCHLQbzQeC11Io/4nlEYU75Dd4gnkaRucqUKcXPrOlkb9hy0xySwAw7D8
5uzagt62DQOKNRhztEgNmWIIqaDojwCT6XT9JLtXXuCMuiTQF7S2nTKPKGzUqWVg
S8uigDN5928T19ra+u4tLjCEP8/Cdmqp5jSZdV2RDpPp/iANEtWK+S4iSMq+P86D
kZDrtJfMxSPx9I+TPaNrf0/FJwrU9fvVvuyx/SnF4Hl2K+10RRgMiBQxV9zMStAt
vyVqngOs646y+02tKZ/Z3xfJeZ5W/DiHoOk1kBI0/EYBXuHbM5W2OUfz4rNWHw/a
b43A8zoLfRKBzp9mKJixlprQk0sHv9jm8Y7RIbM2R6OkLgUJTDvwGX08WPDBA/ao
HEVK/mlZ
=aiqw
-----END PGP SIGNATURE-----

--xetpjh2dyeh26jbv--
