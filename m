Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAC210B759
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 21:21:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NXGp20rnzDqxV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 07:21:22 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NXDL3l0pzDqvp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 07:19:14 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xARKETAQ050538; Wed, 27 Nov 2019 15:19:02 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2whhyg0s9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 15:19:02 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xARKJ2I9060582;
 Wed, 27 Nov 2019 15:19:02 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2whhyg0s9e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 15:19:02 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xARKFHQ9025850;
 Wed, 27 Nov 2019 20:19:05 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01wdc.us.ibm.com with ESMTP id 2wevd6ftqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 20:19:05 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xARKJ0aT39191020
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Nov 2019 20:19:00 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BB4F112067;
 Wed, 27 Nov 2019 20:19:00 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0F34112063;
 Wed, 27 Nov 2019 20:18:58 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.137])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 27 Nov 2019 20:18:58 +0000 (GMT)
Message-ID: <7dd89f27e886fc73e3de4d2a92e27f443978f318.camel@linux.ibm.com>
Subject: Re: [PATCH 1/1] powerpc/kvm/book3s: Fixes possible 'use after
 release' of kvm
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <sean.j.christopherson@intel.com>,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Date: Wed, 27 Nov 2019 17:18:57 -0300
In-Reply-To: <f3750cf8-88fc-cae7-1cfb-cb4b86b44704@redhat.com>
References: <20191126175212.377171-1-leonardo@linux.ibm.com>
 <f3750cf8-88fc-cae7-1cfb-cb4b86b44704@redhat.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-svLp0XGwOGKrM1lqBRkB"
User-Agent: Evolution 3.34.1 (3.34.1-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_04:2019-11-27,2019-11-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 phishscore=0 impostorscore=0 mlxlogscore=934 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911270162
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
Cc: Radim =?UTF-8?Q?Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-svLp0XGwOGKrM1lqBRkB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-11-27 at 17:40 +0100, Paolo Bonzini wrote:
> >  =20
> >        if (ret >=3D 0)
> >                list_add_rcu(&stt->list, &kvm->arch.spapr_tce_tables);
> > -     else
> > -             kvm_put_kvm(kvm);
> >  =20
> >        mutex_unlock(&kvm->lock);
> >  =20
> >        if (ret >=3D 0)
> >                return ret;
> >  =20
> > +     kvm_put_kvm(kvm);
> >        kfree(stt);
> >    fail_acct:
> >        account_locked_vm(current->mm, kvmppc_stt_pages(npages), false);
>=20
> This part is a good change, as it makes the code clearer.  The
> virt/kvm/kvm_main.c bits, however, are not necessary as explained by Sean=
.
>=20

Thanks!
So, like this patch?
https://lkml.org/lkml/2019/11/7/763

Best regards,

Leonardo

--=-svLp0XGwOGKrM1lqBRkB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl3e2jEACgkQlQYWtz9S
ttTWzxAAy+Q8kuOW+58Zujf5Pl1VAPNeOj8APWTSfbtEtYh+qeriS0Fx+MlwfycO
jKea8M8pTxuNFG88V9+rQM+qciE5UpqGYqTPkbhHEsrXYcBRPct/bS6/EmYc5wve
MeTLOTW11fnZYR9WXghKpPhM2AOCvBYPMq3nnQUFqr0DLk7tkOB7OuHk9qASTVbH
dZvU9rXIIMa5cxH4v0/qEZtzY+9/UStvDUM3cghd9p0DqDtGL396wIQwvRMfxT94
KP925KeLoi1wqIAH7VUxgrP8/SkLPfgMwG1QuyIiWO2cqHE9MpozjDU9hOebXoyb
UVJngHT/oRyG7plHLcZ6eedy75M6Z4lKv3oviezjEjIRr8pC7/xT2MZYiV3dox9c
rd9KgDTLihHEBfKmKnocErwvEleu9Dr6vJ6zBU1bWOahROryvuPdZ00SbVGZIa0U
MFyIinaBDLWwn6zhpGZVc1vUqy1lmJnS91116u+og30IgwXMYpb6sHFUWmr9B0Ai
40tdEGnFKthSCeyskqBrLab4ykV49MLJxd9cK4kwnWou1M6Fl1kDY86h1P6afqEG
RAbTtL4HCmOButVZjP5kzTnONkIZWLSmkibqSx4Gxl9Lw2u+jg523Ds9Ye2Pfqrd
NARjPJb+1h6PU2IiDLmoC7r+axcI+Np+xacERZEOFo51lE0wI/c=
=CM/a
-----END PGP SIGNATURE-----

--=-svLp0XGwOGKrM1lqBRkB--

