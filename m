Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28648B8909
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 03:59:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZH2Z4S62zF4ky
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 11:59:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=leonardo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZH0V5QSNzF4d8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 11:57:30 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8K1uY3Z074037; Thu, 19 Sep 2019 21:57:16 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v4m531xxu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2019 21:57:16 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8K1vCFt075541;
 Thu, 19 Sep 2019 21:57:15 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v4m531xxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2019 21:57:15 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8K1tJXY011729;
 Fri, 20 Sep 2019 01:57:15 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 2v3vbtt6gr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Sep 2019 01:57:15 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8K1vDuv60031238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Sep 2019 01:57:13 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8C10BE053;
 Fri, 20 Sep 2019 01:57:13 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74FACBE04F;
 Fri, 20 Sep 2019 01:57:09 +0000 (GMT)
Received: from LeoBras (unknown [9.85.172.122])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 20 Sep 2019 01:57:09 +0000 (GMT)
Message-ID: <5aa1d16d90b3fc4a4aa989a4082f0e2fb776998a.camel@linux.ibm.com>
Subject: Re: [PATCH v2 1/1] powerpc/pseries/hotplug-memory.c: Change rc
 variable to bool
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Date: Thu, 19 Sep 2019 22:57:04 -0300
In-Reply-To: <dd417c2c-83f6-b3e0-0a87-25996af76db5@redhat.com>
References: <20190802133914.30413-1-leonardo@linux.ibm.com>
 <dd417c2c-83f6-b3e0-0a87-25996af76db5@redhat.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-ONyhHFL4Nn1SjgHz8m1T"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-19_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909200021
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
Cc: Pavel Tatashin <pavel.tatashin@microsoft.com>,
 David Hildenbrand <david@redhat.com>, YueHaibing <yuehaibing@huawei.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>, Rob Herring <robh@kernel.org>,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-ONyhHFL4Nn1SjgHz8m1T
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Michael,

Any feedback on this patch?

Best regards,


On Fri, 2019-08-02 at 15:45 +0200, David Hildenbrand wrote:
> On 02.08.19 15:39, Leonardo Bras wrote:
> > Changes the return variable to bool (as the return value) and
> > avoids doing a ternary operation before returning.
> >=20
> > Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
> > ---
> > Changes in v2:
> >   - Restore previous and-ing logic on rc.
> >=20
> >  arch/powerpc/platforms/pseries/hotplug-memory.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/pow=
erpc/platforms/pseries/hotplug-memory.c
> > index 8e700390f3d6..c126b94d1943 100644
> > --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> > +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> > @@ -338,7 +338,7 @@ static int pseries_remove_mem_node(struct device_no=
de *np)
> >  static bool lmb_is_removable(struct drmem_lmb *lmb)
> >  {
> >  	int i, scns_per_block;
> > -	int rc =3D 1;
> > +	bool rc =3D true;
> >  	unsigned long pfn, block_sz;
> >  	u64 phys_addr;
> > =20
> > @@ -363,11 +363,11 @@ static bool lmb_is_removable(struct drmem_lmb *lm=
b)
> >  		if (!pfn_present(pfn))
> >  			continue;
> > =20
> > -		rc &=3D is_mem_section_removable(pfn, PAGES_PER_SECTION);
> > +		rc =3D rc && is_mem_section_removable(pfn, PAGES_PER_SECTION);
> >  		phys_addr +=3D MIN_MEMORY_BLOCK_SIZE;
> >  	}
> > =20
> > -	return rc ? true : false;
> > +	return rc;
> >  }
> > =20
> >  static int dlpar_add_lmb(struct drmem_lmb *);
> >=20
>=20
> Yeah, why not
>=20
> Reviewed-by: David Hildenbrand <david@redhat.com>
>=20

--=-ONyhHFL4Nn1SjgHz8m1T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl2EMfAACgkQlQYWtz9S
ttQDvRAAwUnVrutNNTkOUXjvHQgdRmF4pzxk4wHrWFA7lTYBdxd+cLK9+XUQEESk
nevbtmOHkjztygsa7jHuN5GJHz3SMkU5nWnUsQE1pnDrfFW3uuLoTV/o/7FHy3ph
wRUuwahCyAZ9e0viOlYAVZrzaXOStFYL87lFfB4DhUeK2XB/t4BlRazpXJeW++iV
IKu3NZHwde6TJ1HnWxrDfJKGgXI3HFQyhIn4owPPCgX81L86z817nZX99t9E0FvQ
lToxlei5I+gU/pzemowVmlU9gTVH/9rEonvq/PbL4QAsn/L5vfr/2OntEJjR9J0b
wwcH9ezlgC/uJp94YuXvUQMnMuTEsBjg+hQyuUoDowXYbpsPxUgXcS4m5L+VuVM2
ofg8uvhWHfl8g+8Wl1IuChS7Hj2oUBxYzpfICOak1aVsKiShuwv/kq+hmJf9iuom
Lv7INPBCRGJ9AhzKfY6KSaX3PloE3BZs1D5auljymr/3MtrXaRReGFzmLWPDv7np
dybb2e88BpO7h5lZR/bOrFXgw9ni0Pk2r9XfOg5uBBokJZgTiRoQMbBcPpHH+23M
4mVIMswxby2UmcuVBqhcS3SkpdIyY1ywe1PU2QwaQw+IPzAE/ndnpFOp1/JU1ZUE
ezwEQ0vbxym7/kHbfcoQk9X4kgqXIxNcYDKwrqvPabqfta5PPdw=
=85wg
-----END PGP SIGNATURE-----

--=-ONyhHFL4Nn1SjgHz8m1T--

