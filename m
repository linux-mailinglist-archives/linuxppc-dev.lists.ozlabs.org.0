Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A52E7C4CE2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 10:17:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=IWfpkg5G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S55Gp1S0Nz3cC5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 19:17:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=IWfpkg5G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=j.granados@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S55Fr6km7z30MQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 19:16:30 +1100 (AEDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20231011081618euoutp018f4a286938d66e9bc0f27d521d5d9b2f~M-5XlPlBR3139631396euoutp01e;
	Wed, 11 Oct 2023 08:16:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20231011081618euoutp018f4a286938d66e9bc0f27d521d5d9b2f~M-5XlPlBR3139631396euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1697012178;
	bh=DxDMyG1horuwm9RBQlUMXmckWPKc1aEJHyMa2YGTX5I=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=IWfpkg5GVwsnMiOs4wVqGZkRiJBI9vYxyym4pAtZ467PCFfVBJqUTaQ5Yg2yh++fH
	 AVK3CcjHwDeEd4FcA+W5hkHGp6K+I194JmhqpR9BJpyNaB/VrZv/DkBLomsZR3Q18q
	 ZEeTH0+hlPCGudN2W6Jcs/cAb5f1SDS3Di/pf01c=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20231011081618eucas1p17ea1825ccfd7a0c3a4313b223b6d3952~M-5XTmGcT3249032490eucas1p1P;
	Wed, 11 Oct 2023 08:16:18 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 6B.11.11320.2D956256; Wed, 11
	Oct 2023 09:16:18 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20231011081617eucas1p2c0d8886ed232c4c8889f2c95e8e23686~M-5WqgMmQ0588305883eucas1p2a;
	Wed, 11 Oct 2023 08:16:17 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231011081617eusmtrp27d6ed0765d3cc0875383c83c1c32c5b7~M-5WpPqft0509005090eusmtrp2P;
	Wed, 11 Oct 2023 08:16:17 +0000 (GMT)
X-AuditID: cbfec7f4-97dff70000022c38-db-652659d216b3
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 2E.42.10549.1D956256; Wed, 11
	Oct 2023 09:16:17 +0100 (BST)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20231011081617eusmtip20c2b6a33e72f57128f512390b86a43bd~M-5WavoG72347623476eusmtip2h;
	Wed, 11 Oct 2023 08:16:17 +0000 (GMT)
Received: from localhost (106.210.248.232) by CAMSVWEXC01.scsc.local
	(2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Wed, 11 Oct 2023 09:16:17 +0100
Date: Wed, 11 Oct 2023 10:21:27 +0200
From: Joel Granados <j.granados@samsung.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v3 0/7] sysctl: Remove sentinel elements from arch
Message-ID: <20231011082127.tg4mnqfhjdp3i3se@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="n5pr63cyarb4dzxb"
Content-Disposition: inline
In-Reply-To: <ZSXOqoCRH0PiBiIG@bombadil.infradead.org>
X-Originating-IP: [106.210.248.232]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA2WTbVSTZRjHz73n2fOM4eRxYtyhUgESB4xejtadSceOLz1+MTunk0AlLngE
	AsbahMhzOmfEwGXoWZYaU8awGMTrNnCACe4sBQc0wMWbQS8yi/EiKCDCcLSxmZ3Tt991Xf//
	dV//DzcH4yvJQE6K8AgjFgrSggkubmhd6HruRmwY84J+6Umk67AT6KJDSaKRhyYCzWidBJrS
	FAA0dOpvEo1qjwE0lXsQdSvvs9Focw6OxlUVAJ3RBaBldQbq/DIdjZTsRfqRPjYylMpY6HKz
	GUfT8jtsZL10nkCGGRmBFCW5GDKdbgbIMe9ko65L1WxU2t/DQgOK2wBVOtsBumFUs1C91HXB
	wugAjuzWAgzlK/2QpraaRHX60xiSDW1FjgeulQ+0I2ykadq341l6Pu8kTlepqgBt7evB6HPS
	HpyeG7Sw6Am7Had/ks+S9AW7FKeblMMkrdZn0nXlEfTN8WhaX/EFQd+xWEhaccEIaJX57f1P
	xHG3JzJpKVmM+PnXD3GTVdollkixKnuwpYqUgl7uceDDgdQW2HS2mTwOuBw+VQ7gtX4N4Slm
	Aay1FbA8xQyAuaZy8pGl4888tmdQBuDN5R+If1X2ZQvuKS4CWNjRibktOLUJlrafZLuZoDbD
	romhlb4/FQ5bFCdW3sCoSS4syJtcEa2l9sDCew7gZh71Ciwd1np5DTQX2lwvcFyGbPjz8DYP
	rodlTo5b4UO9DK32qyzPpSGwv3DUy5/B6tbOlaCQavCFasMi4Rnsgnal1ctr4VhbvTfmBrjc
	VMzyGL4G8Ipz2uuuBFCTM+dd+xqU/WLzOt6AermZcF8EqdVwYHKNu4258JThLOZp86A8n+9R
	h8HK3yZwBQhR/ieZ8nEy5eNkypU9m6H6x3vE/9qRUFMyjnk4GtbUTOFqQFaAACZTkp7ESF4S
	Mp9ESQTpkkxhUlRCRroeuL5Mh7NtthGUjd2NMgEWB5hAqMt8S1vZDQJxYYaQCfbn3UoJZfi8
	RMGnRxlxRrw4M42RmMB6Dh4cwNuU+BTDp5IER5hUhhEx4kdTFscnUMpqbNhmxw6zbMmpiaqE
	IiYltrj2fk78YpkI2F99N3khzHa3YW+FH/nx1fN++bvxtrTUrNtLvHDNLtGBSIN+q/Ncen2Q
	rtv4NHH0malGu7/cvFv1TW+03KdwLDTUqOfVvunU7QwTmaPiLA261RPGfsiv/uC7eZz6SBc5
	9JdVcSCmsU7+luV9fsIcvTOieKPP2JztGH/oYFH7V0UNJz78dUdj+ELZBrUs94+4LYFBjs9z
	90G5SFZ3qNO3c931SKamGL8e070/vpod5Et+eyLm+zMxmRGr4qbWvXctXn1ZtzytDok01qt7
	HUSLZmbPorT3YWtc1sbf39kem12UcvhKHz5oDcYlyYIXIzCxRPAPrQCyH60EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA2WTe0yTVxjGc/p9vVDX7BugnMFMpOJUnIUihQMBYsKmn7swXZQFlsEqfgEm
	tKSlzrlbN8pkIE2FyEJnatussCEwKLYTNxyrhI07la2AgAsUIuUiKqhAWVlrWWay/548z/t7
	8ubNOSzM18wIZGWL8imJSJjDZbDxLtdvt/daU16kwlsaeaixy8FAJqeaiex/WxhoscHFQAtV
	5wAaLbvDRNMNZwFaKEhD/epHdDTd8jmOZjU1AFU0BqB1rRh1l+Qiu+4QMtptdGQ2KGjo55YO
	HN0ruktHA9cuMpB5UcFAKl0BhiwXWgByPnbRUd+1OjoyDFppaEg1BdBlVydAN1u1NHRF7t5g
	ZXoIR46Bcxj6Uv0sqvqhjomajBcwpBgVIOeyu3K5wU5HVc1J+3eSjwuVOFmrqQXkgM2Kkd/I
	rTj5cLiXRs45HDh5o2iJSeodcpxsVo8xSa1RRjZ9F0remo0njTVfMci7vb1MUqVvBaSm48jh
	Lam8OIlYlk9tyxJL8+O57/BRBI8fg3gRkTE8/r7od2MjBNywhLgTVE72KUoSlvAeL2vSmp2n
	fOb0H1MCORhgFwMfFiQiYdd4Ib0YsFm+hAHA+cJv6d7gBdi49OeG9oNrtmKGd+g+gBO/KDYI
	E4CT9jWmZwondkBDp/IJwSBegn1zo5hH+xO74HVVKc0DYMQ8G7rso7gn8CMOwMoHTuDRHCIa
	GsYagLfVBuDY3CDdGzwHOyonnwAYcQpeqr3qbmK5dRCsdrE8tg8RBQccbTTvqtvhYOX0hv4E
	zvz1E1ABP/VTTeqnmtT/NXntUDjkcvzf3gOrdLOYV8fD+voFXAuYNcCfkklzM3OlfJ5UmCuV
	iTJ5GeJcI3A/WnP7StNVoJm5z7MAGgtYQIibnGi43A8CcZFYRHH9ORPZIZQv54TwwzOURJwu
	keVQUgsQuM94HgvcnCF2/wBRfjo/KlzAj4yKCRfERO3jBnAO5RUJfYlMYT51kqLyKMm/HI3l
	Eyin6dNS1stv53CMssS4zIJNB6LLzfWvBOvDEt6KWE61aUZWozeXMVa/V8TPtDlH5odXfty7
	fnx3bPvqazvKy1KyrnxhXjOtVvBMacn6o69/cJKmeACVR+XVMHa7tXnnuCnNxfu6Z08Le3hK
	EVugt4StELTQoM4EbGKJe7zHeCzJeCSg7pHj7eDCAzdUp1fPPByRXdzU3UvX+tm2oOva1pKt
	H3FSS3a3vVp/2HRMuTVsV1rpTHDqeIjhUuLkwaV+4uP9zYEvFzhlyVPqoMR7yt8TInuSS58f
	YUf/yrqzeEuZMbbNVP/GWc37kuq1JFf7mwcdfXbdp926tXjdzc9c6XkVNmM3F5dmCfmhmEQq
	/AfmNpywSQQAAA==
X-CMS-MailID: 20231011081617eucas1p2c0d8886ed232c4c8889f2c95e8e23686
X-Msg-Generator: CA
X-RootMTR: 20231010222243eucas1p2f1db3c6852c319ba33fcb54be42a8d54
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231010222243eucas1p2f1db3c6852c319ba33fcb54be42a8d54
References: <20231002-jag-sysctl_remove_empty_elem_arch-v3-0-606da2840a7a@samsung.com>
	<CGME20231010222243eucas1p2f1db3c6852c319ba33fcb54be42a8d54@eucas1p2.samsung.com>
	<ZSXOqoCRH0PiBiIG@bombadil.infradead.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, x86@kernel.org, Russell King <linux@armlinux.org.uk>, willy@infradead.org, Ingo Molnar <mingo@kernel.org>, Ingo Molnar <mingo@redhat.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, josh@joshtriplett.org, Nicholas Piggin <npiggin@gmail.com>, linux-csky@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infrad
 ead.org, Iurii Zaikin <yzaikin@google.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linux-fsdevel@vger.kernel.org, Alexey Gladkov <legion@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--n5pr63cyarb4dzxb
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 03:22:34PM -0700, Luis Chamberlain wrote:
> On Mon, Oct 02, 2023 at 01:30:35PM +0200, Joel Granados via B4 Relay wrot=
e:
> > V3:
> > * Removed the ia64 patch to avoid conflicts with the ia64 removal
> > * Rebased onto v6.6-rc4
> > * Kept/added the trailing comma for the ctl_table arrays. This was a co=
mment
> >   that we received "drivers/*" patch set.
> > * Link to v2: https://lore.kernel.org/r/20230913-jag-sysctl_remove_empt=
y_elem_arch-v2-0-d1bd13a29bae@samsung.com
>=20
> Thanks! I replaced the v2 with this v3 on sysctl-next.
perfect
>=20
>   Luis

--=20

Joel Granados

--n5pr63cyarb4dzxb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmUmWwcACgkQupfNUreW
QU8lHwv7B5Hjds6I5fVxjarsS/ccELeK3aR93x/dMpCR2F5plybiUT+caXjDJ4T3
+aNLIMSOr0VeJEehNxnFm0jZcDiWoWfoDLcQfbuLKgaC5suDueRb7xnOkFY4rfxU
5hCCjCK0UaAbMtGHpdAAhixVQa0ZOjPR/NBBCuP55ksVwHgLQ54nyd6B10HJ0M0J
LvammJhmMj1uL1qz8/CVKbuygICp4GXl0/kLr4BdZpihvhHODa+oo4I13v+Sd8WL
SE0ERE7iC/Y+eY3qZTZyzLhifHdS+7kf/z6tdpGPJLq6qrQJHz8PgCVVqXXqg9h/
sB52jxikWcZ6bI99PwTAETwkfbibQ4ILo13bfM/HETIeLVM2+v0GvVNe32TIULlK
SuH4+hWLwEV67kH1eoK+YHLe//g0E6mhrqUqXzA6g8O2N4o+WYEGu8SRhpEIxpOD
b8Ba8zSKvVGpQPZtm66HnGi/qdPsR3Ep72b4uVozEfLVdU5w10Kfbl/8RZYbAQxy
mXOOeX2E
=4WV6
-----END PGP SIGNATURE-----

--n5pr63cyarb4dzxb--
