Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 940477BD400
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 09:04:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=K7gal1MY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3qlx3kqYz3cbL
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 18:04:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=K7gal1MY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=j.granados@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3qkz2jjcz2y1j
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 18:03:51 +1100 (AEDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20231009070340euoutp015b9ade788582b3cbabeb19404f335276~MXnXkVszm0480204802euoutp01I;
	Mon,  9 Oct 2023 07:03:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20231009070340euoutp015b9ade788582b3cbabeb19404f335276~MXnXkVszm0480204802euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1696835020;
	bh=qL27lSW5ZMGTGSedh/Md9xLL53dYCemDlHl0E8oR2zs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=K7gal1MYB1bygvVVFwpLIjW3/pK2UrXhKTbgD/ZY0H3x6irPprWSMIyJ9WMsoyMV7
	 4N4zzGrpPpqL06YkUiEA8RT8ZbWuT7FrEMcG28ZhC89ZoAI987UqjKx0fyg9eGtyoW
	 z0y24vZus0JcYfaBiTGDfpA6N9hTnORzAsZKd0qY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20231009070339eucas1p2309116a7bf69e3440452f3c9c8dffa58~MXnXb3i9r1629816298eucas1p2r;
	Mon,  9 Oct 2023 07:03:39 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 3A.E2.42423.BC5A3256; Mon,  9
	Oct 2023 08:03:39 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20231009070339eucas1p1fe3b98e93490d89e1c9fe8fb9df87c7a~MXnXHSLhP2545325453eucas1p18;
	Mon,  9 Oct 2023 07:03:39 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231009070339eusmtrp2e2cb45c024e5001dbb0825ad4ee4cde4~MXnXGkEk52593025930eusmtrp2p;
	Mon,  9 Oct 2023 07:03:39 +0000 (GMT)
X-AuditID: cbfec7f2-a51ff7000002a5b7-29-6523a5cb5d3a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id A4.B2.10549.BC5A3256; Mon,  9
	Oct 2023 08:03:39 +0100 (BST)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20231009070339eusmtip2359ce2aa5f147ed85f553e0885118c98~MXnW6Klug0727307273eusmtip21;
	Mon,  9 Oct 2023 07:03:39 +0000 (GMT)
Received: from localhost (106.110.32.133) by CAMSVWEXC01.scsc.local
	(2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Mon, 9 Oct 2023 08:03:38 +0100
Date: Mon, 9 Oct 2023 09:08:16 +0200
From: Joel Granados <j.granados@samsung.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 00/15] sysctl: Remove sentinel elements from drivers
Message-ID: <20231009070816.2bxodfj3vufx7qkb@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="npotpdju3zhmyfwo"
Content-Disposition: inline
In-Reply-To: <87il7irrtb.fsf@mail.lhotse>
X-Originating-IP: [106.110.32.133]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDKsWRmVeSWpSXmKPExsWy7djPc7qnlyqnGmz5aWTxZskxZos7k56z
	W/z+/o/VYkvDITYHFo+vN88xeSx62cDiMWHRAUaP8zMWMgawRHHZpKTmZJalFunbJXBlHLq9
	gL3gglRFz7yfjA2M08S6GDk5JARMJI40/2frYuTiEBJYwSjRcGw3O4TzhVHixLw+JgjnM6PE
	w5Wb2GFadq29BNWynFHiac8RVriqy93/GCGczYwSTw5/AGthEVCReDWpjxXEZhPQkTj/5g4z
	iC0ioClxdfcysDizQA+jxNk5giC2sIC3xPVFq8B6eQXMJSbdP8kMYQtKnJz5hAWivkLif88H
	oDgHkC0tsfwfB0iYE2jk5A6Q60AuVZL4+qaXFcKulVh77AzYbxICXzgkHvVcY4FIuEj0v3zA
	DGELS7w6vgXqTRmJ/zvnM0E0TGaU2P/vA1T3akaJZY1fmSCqrCVarjyB6nCUeNVwiBHkIgkB
	PokbbwUhDuWTmLRtOjNEmFeio00IolpNYvW9NywTGJVnIXltFpLXZiG8BhHWk7gxdQobhrC2
	xLKFr5khbFuJdevesyxgZF/FKJ5aWpybnlpsmJdarlecmFtcmpeul5yfu4kRmKhO/zv+aQfj
	3Fcf9Q4xMnEwHmJUAWp+tGH1BUYplrz8vFQlEV7dUoVUId6UxMqq1KL8+KLSnNTiQ4zSHCxK
	4ryqKfKpQgLpiSWp2ampBalFMFkmDk6pBiZ2w2fPHFcs3uffnG22ktXuwzM1HRb/1KVRUsyb
	bxcVP+aINfxzz+vN0uizXa+Z7iwxnjK5bGPT71NVfNkLr6p5MNjqWvGkzNdL3RG0ZkLmRdmD
	9w74mF997s0274/zp+QbydV3pZ+yzr0s8uBWmuk9/x2zPq1ouMRkevdDdY2IQUhOzKfHLW28
	J4s9fgmmqR3xEJ3iJHds0jHPtGc/RJ8dcb0xf6q7W5fO/x2maxsTbqVOyhHKeV7yyeU9o8Af
	bcef14JS3tvs3FeVIcueoFFhlJcybY2uqG7aJvlFO986X+u4ERqTMvPA09nSBw+z25vcCNmQ
	uWdXLO+spGdL/VdWzHZZy83mHJN/k9XAe44SS3FGoqEWc1FxIgC5y4C+zwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRmVeSWpSXmKPExsVy+t/xe7qnlyqnGjTulLZ4s+QYs8WdSc/Z
	LX5//8dqsaXhEJsDi8fXm+eYPBa9bGDxmLDoAKPH+RkLGQNYovRsivJLS1IVMvKLS2yVog0t
	jPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyHv99wl5wTqri8vYjrA2MU8S6GDk5
	JARMJHatvcTWxcjFISSwlFGi5c52RoiEjMTGL1dZIWxhiT/XuqCKPjJKvDryAMrZzChxYctJ
	NpAqFgEViVeT+sA62AR0JM6/ucMMYosIaEpc3b0MLM4s0MMocXaOIIgtLOAtcX3RKnYQm1fA
	XGLS/ZPMEEPXMUmcm3CYGSIhKHFy5hMWiOYyidfvpwEN4gCypSWW/+MACXMCzZ/ccYkN4lIl
	ia9veqGurpV4dX834wRG4VlIJs1CMmkWwiSIsI7Ezq132DCEtSWWLXzNDGHbSqxb955lASP7
	KkaR1NLi3PTcYkO94sTc4tK8dL3k/NxNjMBo3Xbs5+YdjPNefdQ7xMjEwXiIUQWo89GG1RcY
	pVjy8vNSlUR4dUsVUoV4UxIrq1KL8uOLSnNSiw8xmgJDcSKzlGhyPjCN5JXEG5oZmBqamFka
	mFqaGSuJ83oWdCQKCaQnlqRmp6YWpBbB9DFxcEo1MIlxn3e0vneMSevfSW+FjVFRRZvzE3XK
	2KMfrWivi3OQm/p4gn45a0b2hTUPPdXZJ9wMPGbB+qkv/EWVu8LiBeIWOV2XhJYKzXrzeqLU
	gjU3nzV03quSaEvg1dSW9f0tF1Ct+zqh7nmumGWo92/xsgMZ0x74fd/taBHbzsQZq6ss9fDW
	vpe65i8KXvw/W6B47a2ImhfzDJ2NRbOCL4p8FOqYXV8164eepj9X3xRXU2/uCd8VNb/Ua92e
	F7zaTMf/I1+7ZdTy+TsylKduqzgg/UF2yqxLpf3zK/hfvGf5JSh8YaV9zawTYvN2RStsuDXL
	j9/U9bjj73yjaslFz5+/Tw2OFtvXE5CrM+vHRe3dSizFGYmGWsxFxYkA28Z012sDAAA=
X-CMS-MailID: 20231009070339eucas1p1fe3b98e93490d89e1c9fe8fb9df87c7a
X-Msg-Generator: CA
X-RootMTR: 20231002122730eucas1p17643da82bb9aa655b35c3562446ad395
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231002122730eucas1p17643da82bb9aa655b35c3562446ad395
References: <20231002-jag-sysctl_remove_empty_elem_drivers-v2-0-02dd0d46f71e@samsung.com>
	<CGME20231002122730eucas1p17643da82bb9aa655b35c3562446ad395@eucas1p1.samsung.com>
	<64fd22df-616e-9f5a-26fb-44c4b3423b0c@csgroup.eu>
	<20231003084749.4xxi4z64hgq5a5lw@localhost> <87il7irrtb.fsf@mail.lhotse>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--npotpdju3zhmyfwo
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 08, 2023 at 09:28:00AM +1100, Michael Ellerman wrote:
> Joel Granados <j.granados@samsung.com> writes:
> > On Mon, Oct 02, 2023 at 12:27:18PM +0000, Christophe Leroy wrote:
> >> Le 02/10/2023 =E0 10:55, Joel Granados via B4 Relay a =E9crit=A0:
> >> > From: Joel Granados <j.granados@samsung.com>
> >> >=20
> > <--- snip --->
> >> >          - The "yesall" config saves 2432 bytes [4]
> >> >          - The "tiny" config saves 64 bytes [5]
> >> >      * memory usage:
> >> >          In this case there were no bytes saved because I do not hav=
e any
> >> >          of the drivers in the patch. To measure it comment the prin=
tk in
> >> >          `new_dir` and uncomment the if conditional in `new_links` [=
3].
> >> >=20
> >> > ---
> >> > Changes in v2:
> >> > - Left the dangling comma in the ctl_table arrays.
> >> > - Link to v1: https://lore.kernel.org/r/20230928-jag-sysctl_remove_e=
mpty_elem_drivers-v1-0-e59120fca9f9@samsung.com
> >> >=20
> >> > Comments/feedback greatly appreciated
> >>=20
> >> Same problem on powerpc CI tests, all boot target failed, most of them=
=20
> >> with similar OOPS, see=20
> >> https://protect2.fireeye.com/v1/url?k=3D9496ce12-f51ddb24-9497455d-000=
babff9b5d-d6b001302bd0fd0d&q=3D1&e=3D044c4c09-2b44-4ded-a682-a5afe9b8beec&u=
=3Dhttps%3A%2F%2Fpatchwork.ozlabs.org%2Fproject%2Flinuxppc-dev%2Fpatch%2F20=
231002-jag-sysctl_remove_empty_elem_drivers-v2-15-02dd0d46f71e%40samsung.co=
m%2F
> > I found the culprit!. Here you are rebasing on top of v6.5.0-rc6 "INFO:
> > Looking for kernel version: 6.5.0-rc6-gbf2ac4d7d596". The error makes
> > sense becuase in that version we have not introduced the stopping
> > criteria based on the ctl_table array size, so the loop continues
> > looking for an empty sentinel past valid memory (and does not find it).
> > The ctl_table check catches it but then fails to do a proper error
> > because we have already tried to access invalid memory. The solution
> > here is to make sure to rebase in on top of the latest rc in v6.6.
>=20
> Thanks for tracking it down.
>=20
> This is my fault, previously Russell would update the branch that the CI
> uses as its base. Now that he has left I need to do that myself, but had
> forgotten.
>=20
> Sorry for the noise.
no worries. It was very helpfull to have two runs to compare with. That
was actually the thing that helped me find the issue.

Best
>=20
> cheers

--=20

Joel Granados

--npotpdju3zhmyfwo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmUjpssACgkQupfNUreW
QU9rgQv7BKXUyCTNks2f8B1XsdHqaGvmr8qAzQ52lxcALzfvbL9U/ONTXbXgYsJi
86Z3HrGoqafW6TmkO5oIK7ctLNifJ0mZBFah4Jq4Xs6eOZ1TgkNV1qwDuj7CXhmh
R5us9KTjFWj7kN0qRSV1F6vYvC9XkTDWtzUOoAMzmFU7DSokR4Z8woCfP7olJH18
Vs+jEXBpdvtnOyTj7ElqEoJIECER+vrMUewHTctylTazx88SlRAmWCXhWOnOSODS
aYo+Y+Lpj3yHrZpDkoulhjgvhe5eg9G2FvNMDENbyJMSX1XzGIfVxkO0K1g2Yc+P
HISvDvOcgm1r1GQyhbVC3zaMyJJotEGkPNVNJcgmTZWkFtqxxsMDHg45dSdGGNDA
xd8Lf7ZZZHr0D1BX4Zq9HV3izlRuXe1zZcoqm20RrzhfEjkR0trrr2V7LOomirDu
QG2YqC53D3w6khOEJbi/Jn5jtAAM/21+knFaTskZqEsbO+71iSUztwH6MfXVO4BG
srDtCwi4
=8UK7
-----END PGP SIGNATURE-----

--npotpdju3zhmyfwo--
