Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F24A81A28C8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 20:44:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yCq571jBzDq6y
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 04:44:01 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yCn311fXzDql8
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 04:42:14 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 038IXGYQ136453; Wed, 8 Apr 2020 14:42:02 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30920axatm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 14:42:02 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 038IXJlW136815;
 Wed, 8 Apr 2020 14:42:02 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30920axata-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 14:42:01 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 038IelQ0011663;
 Wed, 8 Apr 2020 18:42:00 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04wdc.us.ibm.com with ESMTP id 3091mdy6vd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 18:42:00 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 038IfxJx50659744
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Apr 2020 18:41:59 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B9467805C;
 Wed,  8 Apr 2020 18:41:59 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 463CF78066;
 Wed,  8 Apr 2020 18:41:49 +0000 (GMT)
Received: from LeoBras (unknown [9.85.164.111])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  8 Apr 2020 18:41:48 +0000 (GMT)
Message-ID: <1452b1d770bd6c516606e4855f348773d1fa6e59.camel@linux.ibm.com>
Subject: Re: [PATCH 1/1] powerpc/crash: Use NMI context for printk after
 crashing other CPUs
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Enrico Weigelt
 <info@metux.net>, Thomas Gleixner <tglx@linutronix.de>, Allison Randal
 <allison@lohutok.net>, Christophe Leroy <christophe.leroy@c-s.fr>, Nicholas
 Piggin <npiggin@gmail.com>
Date: Wed, 08 Apr 2020 15:41:37 -0300
In-Reply-To: <87y2r6jhuc.fsf@mpe.ellerman.id.au>
References: <20200406174058.686436-1-leonardo@linux.ibm.com>
 <87y2r6jhuc.fsf@mpe.ellerman.id.au>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-lPjFWmObu0CMRxkrP/CR"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_10:2020-04-07,
 2020-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004080134
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


--=-lPjFWmObu0CMRxkrP/CR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-04-08 at 22:13 +1000, Michael Ellerman wrote:
[...]
> Added context:
>=20
> 	printk(KERN_EMERG "Sending IPI to other CPUs\n");
>=20
> 	if (crash_wake_offline)
> 		ncpus =3D num_present_cpus() - 1;
>=20
> > =20
> >  	crash_send_ipi(crash_ipi_callback);
> >  	smp_wmb();
> > +	printk_nmi_enter();
>  =20
> Why did you decide to put it there, rather than at the start of
> default_machine_crash_shutdown() like I did?
>=20
> The printk() above could have already deadlocked if another CPU is stuck
> with the logbuf lock held.

Oh, I thought the CPUs would start crashing after crash_send_ipi(), so
only printk() after that would possibly deadlock.

I was not able to see how the printk() above would deadlock, but I see
no problem adding that at the start of the function.

Best regards,
Leonardo Bras

--=-lPjFWmObu0CMRxkrP/CR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl6OGuIACgkQlQYWtz9S
ttRQRg/+PovdIjJ5SBFZ1ufMi08FG6Ve7IN2VW3eVtItUXeHSe9o28GwLxTnUXJy
TRUc1gVx8kUUEhnnKSvrrXyRTPJ/Z7LDEzvvo7o1M0s6buIHvbw8MZQUGSq5l2Sq
wXNYeApRc7eSvF0mkBs4TZyPu4E5a22RI7SBHMouXqIxpOe4VXwDaEIZ7BOmc8lm
s6+7EBZt1tI6n6ktHMxqN0GaYr18xWoz0hEscyULb++nGyQPMww8JQBJo9kToV7Q
ziUpy1IJahKLUrIIxt1CZf3qBaAxO9GbVNEyfDtBEs1nThSJ1eweWk0bwAUJF8ll
SRfAWcmBfvq3YFgGcWtcf9P1SOVbRJC6fFuaNbV9KP0gzJ8I4JyrA1sIhgIYkKqh
UzlS15B2JHZBAFuT6J1oAofaP0+hooRipiloeoVhqBH0483jc/EjQS8u96bjgiBS
AZyr5QjTfEINdvXar23uddbWymLPjh+IPNZAjK+goi0NdIjyHsyHgtz78XaR6q2M
06YOhmfFi2P9p30jaAqN6+7b4R50M61R+L1fTtzEWgb+xUe1HyKM7j/ff594f6M/
AZj16bSZtBMtQSp0q4DK/m0d8XXvwy2Hb0ABJiRhCSLxXvCfMEPHVtK9Xqn+JhEj
XXH4XsARkrl9EQ94RhbUZQ55Y4Yga2F0+PI7dQvcc37KNlTgKo0=
=pJkd
-----END PGP SIGNATURE-----

--=-lPjFWmObu0CMRxkrP/CR--

