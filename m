Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1660FCE1A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 19:46:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DVmz2KFxzF85q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 05:46:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=leonardo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DVkj6tfvzF811
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 05:44:13 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xAEIhiW5041171; Thu, 14 Nov 2019 13:44:05 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w9bhcaasm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Nov 2019 13:44:05 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAEIejrd014729;
 Thu, 14 Nov 2019 18:44:08 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 2w5n373v2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Nov 2019 18:44:08 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAEIi2jc40173880
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Nov 2019 18:44:03 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF4C6BE05A;
 Thu, 14 Nov 2019 18:44:02 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87F83BE051;
 Thu, 14 Nov 2019 18:44:01 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.137])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 14 Nov 2019 18:44:01 +0000 (GMT)
Message-ID: <c792fdc629d87f452d4348d33ab179df01d42017.camel@linux.ibm.com>
Subject: Re: [PATCH v2 1/4] powerpc/kvm/book3s: Fixes possible 'use after
 release' of kvm
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Thu, 14 Nov 2019 15:43:57 -0300
In-Reply-To: <87mud13d4r.fsf@mpe.ellerman.id.au>
References: <20191107170258.36379-1-leonardo@linux.ibm.com>
 <20191107170258.36379-2-leonardo@linux.ibm.com>
 <87mud13d4r.fsf@mpe.ellerman.id.au>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-zmSym6hLOrd0Lb87qEYc"
User-Agent: Evolution 3.34.1 (3.34.1-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-14_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911140157
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-zmSym6hLOrd0Lb87qEYc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-11-12 at 15:57 +1100, Michael Ellerman wrote:
> Hi Leonardo,

Hello Micheal, thanks for the feedback!

>=20
> Leonardo Bras <leonardo@linux.ibm.com> writes:
> > Fixes a possible 'use after free' of kvm variable in
> > kvm_vm_ioctl_create_spapr_tce, where it does a mutex_unlock(&kvm-
> > >lock)
> > after a kvm_put_kvm(kvm).
>=20
> There is no potential for an actual use after free here AFAICS.
>=20
> > diff --git a/arch/powerpc/kvm/book3s_64_vio.c
> > b/arch/powerpc/kvm/book3s_64_vio.c
> > index 5834db0a54c6..a402ead833b6 100644
> > --- a/arch/powerpc/kvm/book3s_64_vio.c
> > +++ b/arch/powerpc/kvm/book3s_64_vio.c
>=20
> The preceeding context is:
>=20
> 	mutex_lock(&kvm->lock);
>=20
> 	/* Check this LIOBN hasn't been previously allocated */
> 	ret =3D 0;
> 	list_for_each_entry(siter, &kvm->arch.spapr_tce_tables, list) {
> 		if (siter->liobn =3D=3D args->liobn) {
> 			ret =3D -EBUSY;
> 			break;
> 		}
> 	}
>=20
> 	kvm_get_kvm(kvm);
> 	if (!ret)
> 		ret =3D anon_inode_getfd("kvm-spapr-tce",
> &kvm_spapr_tce_fops,
> 				       stt, O_RDWR | O_CLOEXEC);
>=20
> > @@ -316,14 +316,13 @@ long kvm_vm_ioctl_create_spapr_tce(struct kvm
> > *kvm,
> > =20
> >  	if (ret >=3D 0)
> >  		list_add_rcu(&stt->list, &kvm->arch.spapr_tce_tables);
> > -	else
> > -		kvm_put_kvm(kvm);
> > =20
> >  	mutex_unlock(&kvm->lock);
> > =20
> >  	if (ret >=3D 0)
> >  		return ret;
> > =20
> > +	kvm_put_kvm(kvm);
> >  	kfree(stt);
> >   fail_acct:
> >  	account_locked_vm(current->mm, kvmppc_stt_pages(npages),
> > false);
>=20
> If the kvm_put_kvm() you've moved actually caused the last reference
> to
> be dropped that would mean that our caller had passed us a kvm struct
> without holding a reference to it, and that would be a bug in our
> caller.
>=20

So, there is no chance that between this function's kvm_get_kvm() and=20
kvm_put_kvm(), another thread can decrease this reference counter?

> Or put another way, it would mean the mutex_lock() above could
> already
> be operating on a freed kvm struct.
>=20
> The kvm_get_kvm() prior to the anon_inode_getfd() is to account for
> the
> reference that's held by the `stt` struct, and dropped in
> kvm_spapr_tce_release().
>=20
> So although this patch isn't wrong, the explanation is not accurate.
>=20
> cheers

Kind regards

--=-zmSym6hLOrd0Lb87qEYc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl3NoG0ACgkQlQYWtz9S
ttT2MBAAw0s38wOkqRjRWeoZ0TV3qd7Gkqzy4gGKHiDNL82fHh6O6X4JSLTYP11u
co3J9O1jORkIG7AAHQh68iiGJZY6MB5ZUJkUsn3XVH2gMWcQ/547HpcgCCMkrL8k
keCqL7CKz5B7WxKK+8daUvMaTPAY5AaSEOHIHG/In4vEeHuUWJEgBN60tGxvhc1m
7VIEBySrLqKeAgs70rThjBVaqg+66SbLZb7ToVIcoRu3Jc/3O4HHG+f6SnD3tqDM
E3BrLge33ZTBt32TdKyogJ6RMUC+SXQXbXfUeNwjXuQIkH3D/zekc31o1GjcenCU
Sv0z3Bmcgz2av0FxrA36K7Ch8Mgcnt7Yk5oHwF76kzOMSYyZMw9mJgTwrOHUsxnQ
pH73v2e9ol1vDD+bdqkGBpusQae25A3/CDLZPXKvRdSqyaaI3yhwNMJ4deh8Glix
bMpjCaUO+Q1o+VuhujYvmB7+tDYSEjWhOgo7m4yuffBu/MDtbaMkbkuqm66mrqrf
3582+Kxt8nEWePhyVBKuJTC+IBqqZEIFO7VCR/XPnac7dYhIOUug4hj2QuYuMStF
Bgsqa9pPIECX07kZR4LUVaEfV+uKadq5DcbdAhfR6NlFBgrJn+XBiuCSIalD7G3D
bC6v7rRE4tjEoO12FYm165cYeD8I30YqLqkR7/z5OmbB9KkSAj8=
=alk4
-----END PGP SIGNATURE-----

--=-zmSym6hLOrd0Lb87qEYc--

