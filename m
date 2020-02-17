Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8D31614B6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 15:30:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LmcH6zmhzDqjc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 01:30:39 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LmLk6StJzDqH4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 01:18:54 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01HEFRZ4129144; Mon, 17 Feb 2020 09:18:44 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y6buma3py-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Feb 2020 09:18:43 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01HEA8Qm017355;
 Mon, 17 Feb 2020 14:18:42 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 2y6896a7c3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Feb 2020 14:18:42 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01HEIguj34603366
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Feb 2020 14:18:42 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBF74112063;
 Mon, 17 Feb 2020 14:18:41 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 909A7112061;
 Mon, 17 Feb 2020 14:18:40 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.152])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 17 Feb 2020 14:18:40 +0000 (GMT)
Message-ID: <fb103b75cd10397f5325560051164df0d454c80a.camel@linux.ibm.com>
Subject: Re: [PATCH 1/1] powerpc/cputable: Remove unnecessary copy of
 cpu_spec->oprofile_type
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, desnesn@linux.ibm.com
Date: Mon, 17 Feb 2020 11:18:39 -0300
In-Reply-To: <0d33a8b2-a7e5-c3e0-b28a-fd39f1231d97@c-s.fr>
References: <20200215053637.280880-1-leonardo@linux.ibm.com>
 <0d33a8b2-a7e5-c3e0-b28a-fd39f1231d97@c-s.fr>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-/Ntzj7jDLjC/0Tcm/bJ5"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-17_08:2020-02-17,
 2020-02-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 adultscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002170118
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-/Ntzj7jDLjC/0Tcm/bJ5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Christophe, thank you for the feedback.

On Mon, 2020-02-17 at 07:31 +0100, Christophe Leroy wrote:
> >   		if (old.oprofile_cpu_type !=3D NULL) {
> >   			t->oprofile_cpu_type =3D old.oprofile_cpu_type;
> > -			t->oprofile_type =3D old.oprofile_type;
> >   		}
>=20
> The action being reduced to a single line, the { } should be removed.
>=20
> Christophe

I intentionally let it this way because I just reviewed a patch that
will add more itens here, and should be merged before this one.

This will avoid conflicts.

Best regards,
Leonardo Bras


--=-/Ntzj7jDLjC/0Tcm/bJ5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl5KoL8ACgkQlQYWtz9S
ttRywRAAmWKe+qH1dKQwhG8AZclARH6pVkfKzIS4a133HRlV9CQs8S3+yNi1yzDd
cVeWEN9cRIBm4sxsAxPxdJrY86j4pwH0ZeB6G37cl6YKC2s7WXReaV3oM4vxOXEN
+7mwwRVcLCq/SoS3Mk02NFxwmI13bb5x9mDgPO80TzeDsOWQmcWPhSindHFVgBgG
wQvKCMVss+XbNe1WGsfupOsMApiie2kdNQwMc1F9YNlO6BL5rj7534qagIbNJ7X0
2aM0PNifNLVog6+mr9o1erf7X8zJmKAweJlmP8KJiiIS7Rj1bTVDP7hj/oVnKr5w
v/sG7kfr895tabv7dCIW+JAOkT41XwktXaQxHDpNDE2opDXN0zu8/37zGbZeLcGL
yga+4o4rSZAstdswqkenFy3VH0ffFS1GQt7l68XveTKMZ1+COM8JHlCxPLDW4TL0
F0lp/pky0roQKcMt8ocMKA+8mpiK2q1ie9gbni5lX6vgWVzA8fG42Po0rqgJo1ud
d7KdTDR5d6/jX7ljkmNjRvnGacW7UczK7GrhgcQpInYqRrYoRG/Hf/cSsjM1RGeV
jw9ad+357ZHeOrMLUNv+7iQDXUWEfOvPml5H1Q05fZuhlh6rZEnIqdzqUYNJe6Wn
FcHV3WlDhwo5tS+nst7h0XaJjdKB1iyuooZ3zEDscyq/qsZ8RLU=
=4JiM
-----END PGP SIGNATURE-----

--=-/Ntzj7jDLjC/0Tcm/bJ5--

