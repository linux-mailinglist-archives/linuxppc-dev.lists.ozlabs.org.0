Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 274887F8D9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 15:23:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460SXw3VnjzDqFZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 23:23:44 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 460SRm6GWzzDr4C
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 23:19:15 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x72DCltM135447
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 2 Aug 2019 09:19:11 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2u4naf9t3d-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 09:19:10 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <leonardo@linux.ibm.com>;
 Fri, 2 Aug 2019 14:19:09 +0100
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 2 Aug 2019 14:19:05 +0100
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x72DJ4FD54919644
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 2 Aug 2019 13:19:05 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D14A478064;
 Fri,  2 Aug 2019 13:19:04 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FEF27806E;
 Fri,  2 Aug 2019 13:19:01 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.147])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  2 Aug 2019 13:19:01 +0000 (GMT)
Subject: Re: [PATCH 1/1] pseries/hotplug-memory.c: Replace nested ifs by
 switch-case
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Date: Fri, 02 Aug 2019 10:18:57 -0300
In-Reply-To: <87sgqjkb1z.fsf@concordia.ellerman.id.au>
References: <20190801225251.17864-1-leonardo@linux.ibm.com>
 <87sgqjkb1z.fsf@concordia.ellerman.id.au>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-vwPnc5uZh7PN20LCHdZJ"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19080213-0004-0000-0000-0000153200A1
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011537; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01241021; UDB=6.00654470; IPR=6.01022452; 
 MB=3.00028007; MTD=3.00000008; XFM=3.00000015; UTC=2019-08-02 13:19:08
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19080213-0005-0000-0000-00008CB8077D
Message-Id: <e076cff01d58c8b4031f2dfd4eeb0883d71ff495.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908020136
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 David Hildenbrand <david@redhat.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 YueHaibing <yuehaibing@huawei.com>, Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Rob Herring <robh@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-vwPnc5uZh7PN20LCHdZJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-08-02 at 22:26 +1000, Michael Ellerman wrote:
> Leonardo Bras <leonardo@linux.ibm.com> writes:
> > I noticed these nested ifs can be easily replaced by switch-cases,
> > which can improve readability.
> >=20
> > Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
> > ---
> >  .../platforms/pseries/hotplug-memory.c        | 26 +++++++++++++------
> >  1 file changed, 18 insertions(+), 8 deletions(-)
>=20
> Thanks, this looks sensible.
>=20
> Please use "powerpc/" as the prefix on your patches, eg. in this case:
>=20
> "powerpc/pseries/hotplug-memory.c: Replace nested ifs by switch-case"
>=20
Ok, I will make sure to do that next time.
Thanks!

> I'll fix it up this time when I apply.
>=20
> cheers
>=20
> > diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/pow=
erpc/platforms/pseries/hotplug-memory.c
> > index 46d0d35b9ca4..8e700390f3d6 100644
> > --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> > +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> > @@ -880,34 +880,44 @@ int dlpar_memory(struct pseries_hp_errorlog *hp_e=
log)
> > =20
> >  	switch (hp_elog->action) {
> >  	case PSERIES_HP_ELOG_ACTION_ADD:
> > -		if (hp_elog->id_type =3D=3D PSERIES_HP_ELOG_ID_DRC_COUNT) {
> > +		switch (hp_elog->id_type) {
> > +		case PSERIES_HP_ELOG_ID_DRC_COUNT:
> >  			count =3D hp_elog->_drc_u.drc_count;
> >  			rc =3D dlpar_memory_add_by_count(count);
> > -		} else if (hp_elog->id_type =3D=3D PSERIES_HP_ELOG_ID_DRC_INDEX) {
> > +			break;
> > +		case PSERIES_HP_ELOG_ID_DRC_INDEX:
> >  			drc_index =3D hp_elog->_drc_u.drc_index;
> >  			rc =3D dlpar_memory_add_by_index(drc_index);
> > -		} else if (hp_elog->id_type =3D=3D PSERIES_HP_ELOG_ID_DRC_IC) {
> > +			break;
> > +		case PSERIES_HP_ELOG_ID_DRC_IC:
> >  			count =3D hp_elog->_drc_u.ic.count;
> >  			drc_index =3D hp_elog->_drc_u.ic.index;
> >  			rc =3D dlpar_memory_add_by_ic(count, drc_index);
> > -		} else {
> > +			break;
> > +		default:
> >  			rc =3D -EINVAL;
> > +			break;
> >  		}
> > =20
> >  		break;
> >  	case PSERIES_HP_ELOG_ACTION_REMOVE:
> > -		if (hp_elog->id_type =3D=3D PSERIES_HP_ELOG_ID_DRC_COUNT) {
> > +		switch (hp_elog->id_type) {
> > +		case PSERIES_HP_ELOG_ID_DRC_COUNT:
> >  			count =3D hp_elog->_drc_u.drc_count;
> >  			rc =3D dlpar_memory_remove_by_count(count);
> > -		} else if (hp_elog->id_type =3D=3D PSERIES_HP_ELOG_ID_DRC_INDEX) {
> > +			break;
> > +		case PSERIES_HP_ELOG_ID_DRC_INDEX:
> >  			drc_index =3D hp_elog->_drc_u.drc_index;
> >  			rc =3D dlpar_memory_remove_by_index(drc_index);
> > -		} else if (hp_elog->id_type =3D=3D PSERIES_HP_ELOG_ID_DRC_IC) {
> > +			break;
> > +		case PSERIES_HP_ELOG_ID_DRC_IC:
> >  			count =3D hp_elog->_drc_u.ic.count;
> >  			drc_index =3D hp_elog->_drc_u.ic.index;
> >  			rc =3D dlpar_memory_remove_by_ic(count, drc_index);
> > -		} else {
> > +			break;
> > +		default:
> >  			rc =3D -EINVAL;
> > +			break;
> >  		}
> > =20
> >  		break;
> > --=20
> > 2.20.1

--=-vwPnc5uZh7PN20LCHdZJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl1EOEEACgkQlQYWtz9S
ttTIKg/+JCnJgwlUWHjkDC27RbrkjW0/tUdtQFNZomWZkyZ7C28vj7wOJzREpQ9O
04+Opsnw0/cpuwdrq86Lpb4KulHMhCXA0vODqiCsBsxpaG5qBqzuqckX5KCk+3RS
GqlDu93XjqZhUIeLLNot9ibMOw4QZAeYBxiimpBz75KprEjjuk8cjXZdzIG+L8uz
3XCa+vSuNfE7gdk1mpS9HoGRwbh/JfRhL1w4kn69CEmPHYirZqd5rC89dJ91hcMo
bh2DYQRqWBJcmpFJJ7UNfTdLtwqF0Xs8w0VheLtuC45WnIaYobIp/EaMFDiVWI/+
bDi+BzI7jUdiGckP3IDFrXH4X2WWoP7lccHyDnORdlmDxLMnsm3KWlIFniHzGg7d
nhUKBuPXuO6M+ETxYOnVEUufuZPel9rZUCEtPQI2ml0Oz4rPPxm7f5uk1WbtA8DS
HhgzStxJZQURS8WJ+6wkPYmXHeQbdq0ZIaRdOyyUo8hHA3JUtiuryH9Ns7reOFrZ
RhToWUU1DuRcFJFSaygPU34Ku1Iq5tR/76dgIMCgBfxBvV3LZ/HDpwPfM6jDTQiv
jK/DD0aD1to5TN3GhLNv3dUMuT1xli2B7m8YHlIhl6Bl4lBiqjyy6aHdQnBgJYSR
telNhvd4x+4M009L5J2/7BVJaYIIaRFw0cmcfId9ZwHRfrDj8G8=
=oLlr
-----END PGP SIGNATURE-----

--=-vwPnc5uZh7PN20LCHdZJ--

