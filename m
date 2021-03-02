Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A714C3296F2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 09:31:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqVhc54Lnz3cZM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 19:31:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kleine-koenig.org (client-ip=94.130.110.236;
 helo=antares.kleine-koenig.org; envelope-from=uwe@kleine-koenig.org;
 receiver=<UNKNOWN>)
Received: from antares.kleine-koenig.org (antares.kleine-koenig.org
 [94.130.110.236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqVhH2bDhz30LK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 19:30:53 +1100 (AEDT)
Received: from antares.kleine-koenig.org (localhost [127.0.0.1])
 by antares.kleine-koenig.org (Postfix) with ESMTP id 62256B1BA39;
 Tue,  2 Mar 2021 09:30:49 +0100 (CET)
Received: from antares.kleine-koenig.org ([94.130.110.236])
 by antares.kleine-koenig.org (antares.kleine-koenig.org [94.130.110.236])
 (amavisd-new, port 10024)
 with ESMTP id eKGK8R-UPJng; Tue,  2 Mar 2021 09:30:48 +0100 (CET)
Received: from taurus.defre.kleine-koenig.org (unknown
 [IPv6:2a02:8071:b5c8:7b00:36f3:9aff:fec2:7e46])
 by antares.kleine-koenig.org (Postfix) with ESMTPSA;
 Tue,  2 Mar 2021 09:30:48 +0100 (CET)
Subject: Re: linux-next: build failure after merge of the powerpc-fixes tree
To: Michael Ellerman <mpe@ellerman.id.au>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
References: <20210302112131.5bb7b08b@canb.auug.org.au>
 <87pn0is3wg.fsf@mpe.ellerman.id.au>
From: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
Message-ID: <6113ab65-7b3c-07f0-2813-76ddaa4c7236@kleine-koenig.org>
Date: Tue, 2 Mar 2021 09:30:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <87pn0is3wg.fsf@mpe.ellerman.id.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="rzZpUA4AhhBZ0hqwZjgvzr69OjxvLCLK7"
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rzZpUA4AhhBZ0hqwZjgvzr69OjxvLCLK7
Content-Type: multipart/mixed; boundary="gQWsuGHVas7owk6hu4v1tveWztpbPdDEK";
 protected-headers="v1"
From: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Message-ID: <6113ab65-7b3c-07f0-2813-76ddaa4c7236@kleine-koenig.org>
Subject: Re: linux-next: build failure after merge of the powerpc-fixes tree
References: <20210302112131.5bb7b08b@canb.auug.org.au>
 <87pn0is3wg.fsf@mpe.ellerman.id.au>
In-Reply-To: <87pn0is3wg.fsf@mpe.ellerman.id.au>

--gQWsuGHVas7owk6hu4v1tveWztpbPdDEK
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello,

On 3/2/21 3:09 AM, Michael Ellerman wrote:
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>> Hi all,
>>
>> After merging the powerpc-fixes tree, today's linux-next build (powerp=
c
>> allyesconfig) failed like this:
>>
>> drivers/net/ethernet/ibm/ibmvnic.c:5399:13: error: conflicting types f=
or 'ibmvnic_remove'
>>   5399 | static void ibmvnic_remove(struct vio_dev *dev)
>>        |             ^~~~~~~~~~~~~~
>> drivers/net/ethernet/ibm/ibmvnic.c:81:12: note: previous declaration o=
f 'ibmvnic_remove' was here
>>     81 | static int ibmvnic_remove(struct vio_dev *);
>>        |            ^~~~~~~~~~~~~~
>>
>> Caused by commit
>>
>>    1bdd1e6f9320 ("vio: make remove callback return void")
>=20
> Gah, is IBMVNIC in any of our defconfigs?! ... no it's not.

Would you accept a patch to add the driver to one of the defconfigs as=20
an excuse for the build breakage I created? Which would be appropriate?=20
ppc64_defconfig?

>> I have applied the following patch for today:
>=20
> Thanks, I'll squash it in.

Also thanks for catching to Stephen and to Michael for the fixup.

Best regards
Uwe


--gQWsuGHVas7owk6hu4v1tveWztpbPdDEK--

--rzZpUA4AhhBZ0hqwZjgvzr69OjxvLCLK7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmA997IACgkQwfwUeK3K
7Alusgf/ZA0f/3fntS+TPuUVpXIPbiu6zO761TKBOhnMsfdAxYGc4rgbvOmbNuWq
Vsi9LKxvxPAasfr25zto/oF3eX9pH6bq4kl4gfYbDolGnI5Uy4Ez4N3pz5b3OVyQ
MMG1fKLHz3hksGRCf8EEg4wAoEPtxILg50jeI68cU82Y+USc4G01RuTg8ZooYYTY
81fNfbcj9nNOG3iGe9fyJoEaCDtIiMK5GZrJ9osOD/bl6VUF1jl+41FbXZohS5Ii
Jx4U4i8gL7V0iIfVsd0RYa5FzKqdRc1vwuUM2tx9dBVsp+ASQ7isKdoAm7EL82Lg
lIJGFbazOpXfLPCSjRIUiJa7DFrvfA==
=W0cN
-----END PGP SIGNATURE-----

--rzZpUA4AhhBZ0hqwZjgvzr69OjxvLCLK7--
