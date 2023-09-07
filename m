Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9B979708F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 09:47:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=CUBouVPc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhBCt2NsCz3c3H
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 17:47:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=CUBouVPc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=j.granados@samsung.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 479 seconds by postgrey-1.37 at boromir; Thu, 07 Sep 2023 17:46:35 AEST
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhBBz2z4yz2y1c
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Sep 2023 17:46:33 +1000 (AEST)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20230907073821euoutp01002074b8606e62b1296829278d0af8f5~Cjchfey8w0992609926euoutp01n;
	Thu,  7 Sep 2023 07:38:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20230907073821euoutp01002074b8606e62b1296829278d0af8f5~Cjchfey8w0992609926euoutp01n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1694072301;
	bh=BXg5O6SPZ8P1tGzXTPI/wb0rr63NnHvgAcD+Vug4myU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=CUBouVPc62jGHERVpVmLNya0vV9VQdPLQBWVNVnHrtfwrdzTJHvq4udyRdm86GlYS
	 Kh7OLqiWje+o7JbiXygKFpsEtup2xm2FJXQkNZ6IPuAEqlyEEQO0CMvhV1rBOdgpUm
	 YnpycD6F/uWg0AqL1Gm2H+2rr/bM6gRuVGAELQug=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20230907073820eucas1p2cea3f66d64ae8ae736c4734b87434645~Cjcg45TxF2457924579eucas1p2m;
	Thu,  7 Sep 2023 07:38:20 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id EA.FA.37758.CED79F46; Thu,  7
	Sep 2023 08:38:20 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20230907073820eucas1p15d62f2cb2f0b6e47279f8840e7d1c468~CjcgYTmvn2390823908eucas1p1Z;
	Thu,  7 Sep 2023 07:38:20 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20230907073820eusmtrp218fd55524709f7729da4cdaf1fb21500~CjcgXEsNT0114801148eusmtrp2x;
	Thu,  7 Sep 2023 07:38:20 +0000 (GMT)
X-AuditID: cbfec7f5-7ffff7000002937e-51-64f97dec075b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id BC.E9.10549.CED79F46; Thu,  7
	Sep 2023 08:38:20 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20230907073820eusmtip1522243b150116f1fd23668e31649b0f5~CjcgImOqA2199121991eusmtip1X;
	Thu,  7 Sep 2023 07:38:20 +0000 (GMT)
Received: from localhost (106.210.248.249) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Thu, 7 Sep 2023 08:38:19 +0100
Date: Thu, 7 Sep 2023 09:38:18 +0200
From: Joel Granados <j.granados@samsung.com>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH 3/8] arch/x86: Remove sentinel elem from ctl_table
 arrays
Message-ID: <20230907073818.n5dcc7sqpvzkpeaa@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="vbdr6hobr7rarecx"
Content-Disposition: inline
In-Reply-To: <d0d30ad4-7837-b0c4-39f4-3e317e35a41b@intel.com>
X-Originating-IP: [106.210.248.249]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA2WTe0xTVxzHc+697S1l4LWgPYEFBZlGUETm3DEbsi1u3sRlG4uJ2bIJVe7A
	AC1rZaAZsQ5UYEigPAwFoUAsyGu1hSqPTtZtNDxWxCIwV5kKC5T3QMAGVtfuusxk/31+v+/v
	+3uc5PBwQSHpwzslPs1IxaKEAC6f0HfZ+3fPpNljQh3Te9GNXhsXtawpSTT2l5GLljQOLppX
	5wBkVUyQaNH2EKBJzSWA5tOPozvKFQ6aNJwn0HR5HUDFN4TomUqC+r5NRNqxIQ7SX8vAUIeh
	m0ALmXMcZGkr4yL9UgYX5VWm48hYZABobdXBQf1tjRx0bXgAQyN5fwB0t1OFoWa5c7p9coRA
	NksOji4qNyD1d40k0mmLcJRhfQ2tPXV2e6oZ4yB16wdvbadXL+QSdEN5A6AtQwM4XSofIOjl
	X80YPWOzEfSPmU9IusomJ+hW5QOSVmmTaV1tEF3dYcPo+9PhtLYui0vPmc0knVfVCT4Sfsp/
	M4ZJOPUVI91zMJofl99yD0/q2ZSqNJeRcqAQZAMeD1L7oO52QDZw4wmoWgAVJVuyAd/JTwDs
	0LTgbLAEYOlKIcdV5TLcfPgDhxVqAJwYLeaydmdVYfcBlpsBvP6zyMUEFQhv9U0BF3OpXbB/
	xoq72JvaAXuu15CuRjjVz4dZj6swl+BFfQiXlFn/TPOgXoeNlnGM5Y2wu2SccDFOpcLLleuE
	6wSc8oU1Dp4r7UaFw7sl5YBddBvsumwlWE6DPc33MdcsSOncoW22FGOFQ3BR3oyz7AWnTM0k
	yy/DZ60Vzw0FAN52LJBsUA+g+vzyc/cbMGNwnGQf8m04Vv0Fi55wZHYju6cnVOiv4GzaA2Ze
	FLDG7bB+dIbIA9uUL1ymfOEy5X+XseldUNW+yP1fOhiqK6dxlsNhU9M8oQJkHRAyybLEWEb2
	qphJCZGJEmXJ4tiQk5JELXB+ll6HafkWqJ36M8QIMB4wgkCn+bGm/g7wIcQSMRPg7TG3ZSVG
	4BEjOnOWkUqipMkJjMwIfHlEgNAjOLz7pICKFZ1m4hkmiZH+q2I8Nx85lvRJ/qzQP/NC9Ijv
	98KqWEurJd8vxRSZ+zHZWSA+azGWa+8JUzV57dE5OT6W/V6msLb3tGkVzOZDj7yOhg5G6Op+
	vzrf93Wr/6ajfE5XweGeY9UK8y87uWWRRblb+VrZleKoI5M71BUnwhpklev700fFB5vOBKrj
	Lz3Q7YyXZXvzygwTue96HvPPC3KETgvnPzvnN3bk5nG/NM2qfUXcLqxPt872p1iHwwy76wrn
	flpPSTh8Ljc4cmip3a8yali/uMFu9Xwlrn5N9dI7NVtN9uCIwfc3/9aWs6Atk3QkKdquVun3
	nPjSnfnmc/cIgcS0fsAgjzMX9D4KFuwbWq3wXp+wBBCyONHeIFwqE/0Nr1kOa6cEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA2WSe0xTVxzHPffe3hYSsmuh4wqauYqaMCktUDgQi9sSx2Vzi3N/ba66Dm54
	SFtsKdFtTAwMEIF1TmQt8tyoG/IsrAMmC1SjwwdYqrUuoB0PSymBMd4B6wp1mcn++5zv73w/
	5+TksFB2Ox7ASpFl0AqZJI2Le2O3XDeGQ6ayVhL552wEbL3lwOHPq1omHH1qxOFciwuHM7oi
	AIfO2Znwb4cNwImWfABnco7Au9pFBpzoPo1BZ2U9gBda/eGzajm8fVYK9aMWBjTU5SLwSncf
	Bv8qmGZAc9dFHBrmcnGorslBobG0G8DVJRcDDnQ1MmDdAxMCrepxAAd7qhHYnu0+fWXCikGH
	uQiFedqXoK65kQnb9KUozB0SwtVlt225ZZQBdZ3vvb6LWvqqBKMaKhsAZbaYUKo824RRCw/7
	EWrK4cCoqwXzTKrWkY1RndphJlWtV1FtPwZT319xINQfThGlrz+DU9P9/UxKXdsDDvp/xNur
	kKsy6O3JcmWGiHtYAMN4gmjIC4uI5gnCo8QxYUJuaOzeRDotJZNWhMZ+wkv+WqNF0n/nnCgv
	9M8GanYh8GKRRAT5i62XUQi8WWyiDpCGMR3qGWwlW+fvMzzsS65ZCnHPpllAmr+rQTyLdkAO
	VT/eaGBEENlxexKsM07sIQemhjZyP2I3efOnS8z1Akrc8SafNLZsaH2Jd8n7j54x19mHiCIb
	zWPPrfUIuXCt+flgM9mnGcPWGSUyybIZsztnuTmQvORircdehIgc1FQCz1V3kNeLhzAPZ5Fz
	T58ANfDVvmDSvmDS/mfyxMGk1eVA/he/RupqnKiHRWRT0wxWDZj1wI9WKaVJUqWAp5RIlSpZ
	Ei9BLtUD95c1XF9p6wCVk7M8I0BYwAiC3M2Rlst3QQAmk8torp/P9CuLiWyfRMnJz2iF/KhC
	lUYrjUDofsZv0ABOgtz9/2UZRwWRfKEgIjKaL4yODOf6+8SnF0jYRJIkgz5G0+m04t8ewvIK
	yEZ+jcO7y17uWbLdsCJvBx45n3/Id5+uYPSkxqrZNm4czLnpDIwaOTVQ1iDa+WdRb3EMj1M1
	92XdSI7LlB915ouOsd0LRZc/eMOQFzi+P5U6vj3+LZFCFGfPPCCMqTBYfPfd8f88kBcecqqk
	rzs+Xdxcpz7NepT6cfHx5v49izuLw89eTEy/Wr42Pf1mYwW/lNWZWWET/yAti+VnbbOYUuG8
	Yy3u/Am/UcuOY+/0bmre+lBjs0+Kug47f7OzQ8HB8Qv7N+mFH3IeLD/O4VvzOCoFbt+1Jbnk
	mhgJEd+rLZ89dE8XNGxxVm3p6k1JqCpgpG7+tJczfsDY5EK5drHJ59v3X+ViymSJIBhVKCX/
	ABZq0BhHBAAA
X-CMS-MailID: 20230907073820eucas1p15d62f2cb2f0b6e47279f8840e7d1c468
X-Msg-Generator: CA
X-RootMTR: 20230906144515eucas1p286690ee141d507d7d3a72cd8afa28408
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230906144515eucas1p286690ee141d507d7d3a72cd8afa28408
References: <20230906-jag-sysctl_remove_empty_elem_arch-v1-0-3935d4854248@samsung.com>
	<20230906-jag-sysctl_remove_empty_elem_arch-v1-3-3935d4854248@samsung.com>
	<CGME20230906144515eucas1p286690ee141d507d7d3a72cd8afa28408@eucas1p2.samsung.com>
	<d0d30ad4-7837-b0c4-39f4-3e317e35a41b@intel.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, x86@kernel.org, Russell King <linux@armlinux.org.uk>, willy@infradead.org, Ingo Molnar <mingo@redhat.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, josh@joshtriplett.org, Nicholas Piggin <npiggin@gmail.com>, linux-csky@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Iurii Zaikin <yzaikin@g
 oogle.com>, linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--vbdr6hobr7rarecx
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 06, 2023 at 07:45:09AM -0700, Dave Hansen wrote:
> On 9/6/23 03:03, Joel Granados via B4 Relay wrote:
> > This commit comes at the tail end of a greater effort to remove the
> > empty elements at the end of the ctl_table arrays (sentinels) which
> > will reduce the overall build time size of the kernel and run time
> > memory bloat by ~64 bytes per sentinel (further information Link :
> > https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
> >=20
> > Remove sentinel element from sld_sysctl and itmt_kern_table.
>=20
> There's a *LOT* of content to read for a reviewer to figure out what's
> going on here between all the links.  I would have appreciated one more
> sentence here, maybe:
>=20
> 	This is now safe because the sysctl registration code
> 	(register_sysctl()) implicitly uses ARRAY_SIZE() in addition
> 	to checking for a sentinel.
Thx for the feedback. This is a great sentence to add at the end of the
first paragraph instead of the link. I'll add it with a few changes as
there are more than just one register function and the use of ARRAY_SIZE
is implicit most of the time.

  This is now safe because the sysctl registration code
  (register_sysctl() and friends) use the array size in addition to
  checking for a sentinel.

I have changed my cover letter in case I send a V2 and for the other
batches that are coming after the architecture one.

>=20
> That needs to be more prominent _somewhere_.  Maybe here, or maybe in
> the cover letter, but _somewhere_.
This is also a good point. I think having it in both the cover letter
and each of the commits is an added value.

>=20
> That said, feel free to add this to the two x86 patches:
>=20
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com> # for x86

Best

--=20

Joel Granados

--vbdr6hobr7rarecx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmT5fecACgkQupfNUreW
QU9Bhgv8DyTYJvCgE8sg+/Ap/JjJPKvGWZBDXfBIHFzHCpKXizcVg8yYUJfBl62v
KxZtrKUrKnByfeqeUsYLmdzZVgYNpru/Ds1piqa9nr2dEYtnxCeV2Vl+GduB0J/O
+XHzHnLZMldSfYdwmJ9hIsT0YoyiPZAQYKTvHfk2XhDx7oXaN83xqZwiQ/4KevGG
hFHCDjYjn2NaD6+DtaZj7g3l+GUApVap07K6jTaWNLScoQsQ3ew89jYA/qvUuXJ8
uiCeTLZhu1bCSSr0wAwrb9+PTwhgIABI/dP7UXnXXF/CNfsAacPnLTVYXwSFI18e
cGsApL10swjpqwPITulSjYS0kVIcX7OYWTknodCBRpIebCshB0JftTXxnrTY007M
FEKIDMwER++/mXSU3R7Oj18AWp4/IBNYcNIw9ajYmdbK9MdhVyLu2g83dVTDaWFA
zwKLH+vJXrgAk+uQBlFo8mCvuGPBk9fHv2kmG/kjufz8X560KHQVxkPGPj8V0k9E
387iV6oU
=1yPf
-----END PGP SIGNATURE-----

--vbdr6hobr7rarecx--
