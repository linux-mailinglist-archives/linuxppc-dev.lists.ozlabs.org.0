Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 560E9B460D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 05:37:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XTMQ3rYszF3yF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 13:37:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sbobroff@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XTK34P4hzF3hy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 13:35:34 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8H3WaLt136801
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 23:35:30 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v2qeh8dtd-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 23:35:30 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Tue, 17 Sep 2019 04:35:28 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Sep 2019 04:35:26 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8H3ZPlY53674004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 03:35:25 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0DD3752059;
 Tue, 17 Sep 2019 03:35:25 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 640BD5204E;
 Tue, 17 Sep 2019 03:35:24 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (unknown [9.81.192.242])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 19FA4A019A;
 Tue, 17 Sep 2019 13:35:21 +1000 (AEST)
Date: Tue, 17 Sep 2019 13:35:14 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 05/14] powerpc/eeh: Defer printing stack trace
References: <20190903101605.2890-1-oohall@gmail.com>
 <20190903101605.2890-6-oohall@gmail.com>
 <20190917010421.GE21303@tungsten.ozlabs.ibm.com>
 <CAOSf1CERpP0aFKoTiBprLXfr-CwRhix0wGosXBYnMffFtzF+gQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5mZBmBd1ZkdwT1ny"
Content-Disposition: inline
In-Reply-To: <CAOSf1CERpP0aFKoTiBprLXfr-CwRhix0wGosXBYnMffFtzF+gQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19091703-0016-0000-0000-000002ACF049
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091703-0017-0000-0000-0000330D913B
Message-Id: <20190917033513.GK21303@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-17_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170039
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--5mZBmBd1ZkdwT1ny
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2019 at 11:45:14AM +1000, Oliver O'Halloran wrote:
> On Tue, Sep 17, 2019 at 11:04 AM Sam Bobroff <sbobroff@linux.ibm.com> wro=
te:
> >
> > On Tue, Sep 03, 2019 at 08:15:56PM +1000, Oliver O'Halloran wrote:
> > > Currently we print a stack trace in the event handler to help with
> > > debugging EEH issues. In the case of suprise hot-unplug this is unnee=
ded,
> > > so we want to prevent printing the stack trace unless we know it's du=
e to
> > > an actual device error. To accomplish this, we can save a stack trace=
 at
> > > the point of detection and only print it once the EEH recovery handle=
r has
> > > determined the freeze was due to an actual error.
> > >
> > > Since the whole point of this is to prevent spurious EEH output we al=
so
> > > move a few prints out of the detection thread, or mark them as pr_deb=
ug
> > > so anyone interested can get output from the eeh_check_dev_failure()
> > > if they want.
> > >
> > > Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> >
> > I think this is a good change, and even in the normal case it will place
> > the stacktrace closer to the rest of the recovery information.
> >
> > But, I think it would make more sense to put the stacktrace into the
> > struct eeh_event, rather than the struct eeh_pe. Is there some reason
> > we can't do that? (It would save a fair bit of memory!)
>=20
> Two reasons:
>=20
> 1) the eeh_event structures are allocated with GFP_ATOMIC since
> eeh_dev_check_failure() can be called from any context. Minimising the
> number of atomic allocations we do is a good idea as a matter of
> course.

Yes, but I meant directly inside eeh_event so there wouldn't be a second
allocation. It would just be a bit bigger.

> 2) We don't pass the eeh_event structure to the event handler
> function. I guess we could, but... eh
>=20
> I don't see the memory saving as hugely significant either. There's
> always fewer eeh_pe structures than there are PCI devices since some
> will share PEs (e.g. switches, multifunction cards) so you'd be saving
> a dozen KB at most.
>=20
> root@zaius1:~# lspci | wc -l
> 59
> root@zaius1:~# echo $(( $(lspci | wc -l) * 64 * 8))
> 30208
>=20
> I think we'll live...

Sure, I don't have very strong feelings about it either way.

> >
> > Cheers,
> > Sam.

--5mZBmBd1ZkdwT1ny
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl2AVGwACgkQMX8w6AQl
/iLEHAf+Nz4NGHEYegmmLlnb9yDz9wM4Srpa0JETn4IYcKrE8l6gwQP+4kEHjLR6
Ibswgdqir/KxOd6PCqjqUxYw53IjgmsbuNGgNP+C6+T3UD8IDKGDR6VyxoGbbdog
MsH6bC6JuZhPjrwQXsqn24DNtXOMDtk/R/DCVzk6gB6e+vMrQB9UskktMjj297Pw
wWIrJBpqS+Uej5xTWoo3l6OHETOy7N0patedvwLaVkZG9qvVSMMkTJuYUz9PtxVT
JzBwZqrFZQ5VorXl+kTWbYDBYukorWMbfk0VoJpSqb5EjfhgYI2Qx5OYW/UgUHCt
UwmWi3h6o+A5f9lLbuMDZg0Rg6m95g==
=bs3y
-----END PGP SIGNATURE-----

--5mZBmBd1ZkdwT1ny--

