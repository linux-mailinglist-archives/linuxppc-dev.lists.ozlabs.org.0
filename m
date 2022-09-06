Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE6B5AE6BE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 13:39:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMNhM0kSwz3c1Q
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 21:39:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=A30jbMXx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMNgl3wNfz2xGK
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Sep 2022 21:38:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=A30jbMXx;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MMNgj3Sfyz4xG5;
	Tue,  6 Sep 2022 21:38:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1662464321;
	bh=eGkReXR1a8BIHZblqxAKOKT9gBHOrYD8qqzo2aJ7vw8=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=A30jbMXxzlj2weVGE2xG0A01lZcyQmvvM/DZaCQiK6B3vZCyUbNOq+zvRRNVvwkjL
	 H/bsxhnr50h8cIOkeQTTAraWLOCNhkR8nczXGlZKf34yTEZdeVXWu1BkqkWO7zgp1G
	 h4DHtQEeG0Hj09hpz9kYAKI+7/homD4ij/NaBg86AkSjLNLPbY5cYdh/F5t/VresrY
	 bax2fwooxdwvhl5t2Fz8xO9Kk1D+pQIVIPqJ72GoutBzAMM53XoPQqTV/8e3X2gT/K
	 nTA3AxFsIyM601QJH9+5Pl/0snF0EG+JymEs0BYcaBb93Fh5Br3ugEj4KAlewdO5xY
	 ELAzdnbzJdPAQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 devicetree@vger.kernel.org
Subject: Re: [PATCH] powerpc/pasemi: Use of_root in pas_pci_init()
In-Reply-To: <ebe8fdbb-c707-eb18-eef2-c37208642a77@csgroup.eu>
References: <20220906010313.1296714-1-mpe@ellerman.id.au>
 <ebe8fdbb-c707-eb18-eef2-c37208642a77@csgroup.eu>
Date: Tue, 06 Sep 2022 21:38:34 +1000
Message-ID: <878rmwu405.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 06/09/2022 =C3=A0 03:03, Michael Ellerman a =C3=A9crit=C2=A0:
>> Currently in pas_pci_init() a reference to the root node is leaked due
>> to a missing of_node_put(). Instead just use of_root directly.
>>=20
>> Note that converting to of_find_compatible_node(NULL, ...) would
>> not be entirely equivalent, because that would check the compatible
>> property of the root node, whereas using of_root skips checking the root
>> node and start the search at the first child of the root.
>>=20
>
> That seems to simplify code. Should we do the same in all places below ?

I guess so.

There are some places where using of_root complicates things, because it
*doesn't* need refcount handling, eg. the cases in numa.c.

But in most cases it is preferable to use of_root IMHO.

cheers

> $ git grep -n "of_find_node_by_path(\"/\");" arch/powerpc/
> arch/powerpc/kernel/pci_32.c:139:       dn =3D of_find_node_by_path("/");
> arch/powerpc/kernel/pci_32.c:214:       dn =3D of_find_node_by_path("/");
> arch/powerpc/kernel/setup-common.c:212: root =3D of_find_node_by_path("/"=
);
> arch/powerpc/kernel/setup-common.c:793: np =3D of_find_node_by_path("/");
> arch/powerpc/mm/numa.c:388:             root =3D of_find_node_by_path("/"=
);
> arch/powerpc/mm/numa.c:456:             root =3D of_find_node_by_path("/"=
);
> arch/powerpc/platforms/52xx/efika.c:77: root =3D of_find_node_by_path("/"=
);
> arch/powerpc/platforms/52xx/efika.c:148:        root =3D of_find_node_by_=
path("/");
> arch/powerpc/platforms/85xx/xes_mpc85xx.c:119:  root =3D of_find_node_by_=
path("/");
> arch/powerpc/platforms/cell/setup.c:67: root =3D of_find_node_by_path("/"=
);
> arch/powerpc/platforms/cell/setup.c:154:        struct device_node *root =
> =3D of_find_node_by_path("/");
> arch/powerpc/platforms/chrp/pci.c:191:  struct device_node *root =3D of_f=
ind_node_by_path("/");
> arch/powerpc/platforms/chrp/pci.c:216:  struct device_node *root =3D of_f=
ind_node_by_path("/");
> arch/powerpc/platforms/chrp/setup.c:105:        root =3D of_find_node_by_=
path("/");
> arch/powerpc/platforms/chrp/setup.c:201:        root =3D of_find_node_by_=
path("/");
> arch/powerpc/platforms/chrp/setup.c:268:        node =3D of_find_node_by_=
path("/");
> arch/powerpc/platforms/chrp/setup.c:299:        struct device_node *root =
> =3D of_find_node_by_path("/");
> arch/powerpc/platforms/chrp/setup.c:378:        root =3D of_find_node_by_=
path("/");
> arch/powerpc/platforms/maple/pci.c:601: root =3D of_find_node_by_path("/"=
);
> arch/powerpc/platforms/maple/setup.c:225:       root =3D of_find_node_by_=
path("/");
> arch/powerpc/platforms/pasemi/pci.c:276:        root =3D of_find_node_by_=
path("/");
> arch/powerpc/platforms/pasemi/setup.c:268:      root =3D of_find_node_by_=
path("/");
> arch/powerpc/platforms/powermac/pci.c:910:      root =3D of_find_node_by_=
path("/");
> arch/powerpc/platforms/powermac/setup.c:105:    np =3D of_find_node_by_pa=
th("/");
> arch/powerpc/platforms/powernv/setup.c:255:     root =3D of_find_node_by_=
path("/");
> arch/powerpc/platforms/ps3/os-area.c:676:       node =3D of_find_node_by_=
path("/");
> arch/powerpc/platforms/ps3/os-area.c:774:       node =3D of_find_node_by_=
path("/");
> arch/powerpc/platforms/pseries/hotplug-memory.c:166:    parent =3D of_fin=
d_node_by_path("/");
> arch/powerpc/platforms/pseries/ibmebus.c:187:   root =3D of_find_node_by_=
path("/");
> arch/powerpc/platforms/pseries/lparcfg.c:232:   root =3D of_find_node_by_=
path("/");
> arch/powerpc/platforms/pseries/lparcfg.c:799:   rootdn =3D of_find_node_b=
y_path("/");
> arch/powerpc/platforms/pseries/setup.c:97:      root =3D of_find_node_by_=
path("/");
> arch/powerpc/platforms/pseries/setup.c:486:     struct device_node *root =
> =3D of_find_node_by_path("/");
> arch/powerpc/sysdev/xive/spapr.c:714:   rootdn =3D of_find_node_by_path("=
/");
>
> Christophe
>
>
>> Reported-by: Liang He <windhl@126.com>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>   arch/powerpc/platforms/pasemi/pci.c | 10 ++--------
>>   1 file changed, 2 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/arch/powerpc/platforms/pasemi/pci.c b/arch/powerpc/platform=
s/pasemi/pci.c
>> index 55f0160910bf..f27d31414737 100644
>> --- a/arch/powerpc/platforms/pasemi/pci.c
>> +++ b/arch/powerpc/platforms/pasemi/pci.c
>> @@ -270,18 +270,12 @@ static int __init pas_add_bridge(struct device_nod=
e *dev)
>>=20=20=20
>>   void __init pas_pci_init(void)
>>   {
>> -	struct device_node *np, *root;
>> +	struct device_node *np;
>>   	int res;
>>=20=20=20
>> -	root =3D of_find_node_by_path("/");
>> -	if (!root) {
>> -		pr_crit("pas_pci_init: can't find root of device tree\n");
>> -		return;
>> -	}
>> -
>>   	pci_set_flags(PCI_SCAN_ALL_PCIE_DEVS);
>>=20=20=20
>> -	np =3D of_find_compatible_node(root, NULL, "pasemi,rootbus");
>> +	np =3D of_find_compatible_node(of_root, NULL, "pasemi,rootbus");
>>   	if (np) {
>>   		res =3D pas_add_bridge(np);
>>   		of_node_put(np);
