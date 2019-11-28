Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1824E10CDB9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 18:23:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47P4Gy2h7mzDqNN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 04:23:22 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47P46p0DC1zDqFv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 04:16:17 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xASHCG5O189865; Thu, 28 Nov 2019 12:16:08 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wjah6rh8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Nov 2019 12:16:08 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xASHCGQe189854;
 Thu, 28 Nov 2019 12:16:07 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wjah6rh7u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Nov 2019 12:16:07 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xASHFa3l000649;
 Thu, 28 Nov 2019 17:16:06 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 2wevd7b1j5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Nov 2019 17:16:06 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xASHG5og32833932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Nov 2019 17:16:05 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4ECD7BE053;
 Thu, 28 Nov 2019 17:16:05 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 626A6BE04F;
 Thu, 28 Nov 2019 17:16:03 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.137])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 28 Nov 2019 17:16:03 +0000 (GMT)
Message-ID: <263e73be1047014ad3b6c0ae28d57db4b9dea970.camel@linux.ibm.com>
Subject: Re: [PATCH 1/1] powerpc/kvm/book3s: Fixes possible 'use after
 release' of kvm
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <sean.j.christopherson@intel.com>,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Date: Thu, 28 Nov 2019 14:15:59 -0300
In-Reply-To: <f3750cf8-88fc-cae7-1cfb-cb4b86b44704@redhat.com>
References: <20191126175212.377171-1-leonardo@linux.ibm.com>
 <f3750cf8-88fc-cae7-1cfb-cb4b86b44704@redhat.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-l7jjVAuSfdlX1zRYI3pK"
User-Agent: Evolution 3.34.1 (3.34.1-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-28_05:2019-11-28,2019-11-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911280146
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


--=-l7jjVAuSfdlX1zRYI3pK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-11-27 at 17:40 +0100, Paolo Bonzini wrote:
> > diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s=
_64_vio.c
> > index 5834db0a54c6..a402ead833b6 100644
> > --- a/arch/powerpc/kvm/book3s_64_vio.c
> > +++ b/arch/powerpc/kvm/book3s_64_vio.c
> > @@ -316,14 +316,13 @@ long kvm_vm_ioctl_create_spapr_tce(struct kvm *kv=
m,
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

Paul, do you think this change is still valid as it 'makes the code
clearer', as said by Paolo before? I would write a new commit message
to match the change.

Best regards,
Leonardo

--=-l7jjVAuSfdlX1zRYI3pK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl3gAM8ACgkQlQYWtz9S
ttTDJg//eBwp87AJa/nFXJRNohYve3mIdddUz+1Er3k4cXhuW3HWbrickBI+w+GM
5s3kXIywUHeAEPFuaqhCxDvM3YHf9cXbKUSO+vYipwnukAAx6xlrQA8squ0CuKKm
Njbz4qBf9crM7lkH9S8vEFTvC46dUrClfPcdvQTPw0jPCknIPzpW9RdwjbJUC7q/
Woc0XfHhmvgwMHKI3Q1e7FEDIxYKZHDbvGhI2RN/+ROIvnsLcx/kdzrNE0LyhKfj
hCfCfQ0i5LZwmUMh7bdGVb8qxuItuEMifrWZWjq0tly/KE0/1IrvRzWLG6uW4sTF
gLRskMN2TQ3pAKHgTzqanYYkkBqh2VUTcPh6beVQP4qnSMzuEMR+AxA08NO1m2HQ
s7l1GSiAVI+ae72YMUA8jcjoxnrcxKB+R5S39ZEXpoxoIsfYrx3QAiaBo2CyOrZL
vD77YCthDMQ8Js4dINh4MMRgf0m95Pn4pD2BX5nD1L0NHHtD2paEayTapmBStaPR
pBU9oTtajHcV7Fpo4Hq29Vj1Zl+Nbj101CnJknCoLy/7xT3Z5MnVHw3lYBAoN+hK
sDG/XCfkWQ9+YkGda3LTjW2CxaTXHvpi2Y2BO2iHyULEZUZ+t8zyutd1v0pc6BiV
lxjBZ9fbmQTQVOqWdueea85C7HVz/p7dohqQnwVLmCuMzCwB+cQ=
=Kgb4
-----END PGP SIGNATURE-----

--=-l7jjVAuSfdlX1zRYI3pK--

