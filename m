Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEF71D0635
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 07:09:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MN543lQBzDqcl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 15:09:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=leonardo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MN2S3DvDzDq7F
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 15:07:12 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04D4VQfY038053; Wed, 13 May 2020 00:31:43 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3101m6v7jc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 May 2020 00:31:42 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04D4Vaj8038405;
 Wed, 13 May 2020 00:31:42 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3101m6v7j0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 May 2020 00:31:42 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04D4UEVU007517;
 Wed, 13 May 2020 04:31:41 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 3100ubmjx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 May 2020 04:31:41 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04D4Vdsq12517636
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 May 2020 04:31:39 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A82F78063;
 Wed, 13 May 2020 04:31:40 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B90F7805C;
 Wed, 13 May 2020 04:31:35 +0000 (GMT)
Received: from LeoBras (unknown [9.85.165.91])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 13 May 2020 04:31:35 +0000 (GMT)
Message-ID: <ba97d52df60ac9c4a4afc2c03121a8c263aa5a15.camel@linux.ibm.com>
Subject: Re: [PATCH 1/1] powerpc/rtas: Implement reentrant rtas call
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Date: Wed, 13 May 2020 01:31:30 -0300
In-Reply-To: <87ftdb87jf.fsf@linux.ibm.com>
References: <20200408223901.760733-1-leonardo@linux.ibm.com>
 <87ftdb87jf.fsf@linux.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-h1B/JIutLyKglRH0NDZG"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-12_08:2020-05-11,
 2020-05-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 cotscore=-2147483648
 priorityscore=1501 clxscore=1011 impostorscore=0 bulkscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005130036
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Nadav Amit <namit@vmware.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-h1B/JIutLyKglRH0NDZG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Nathan, thanks for the feedback!

On Fri, 2020-04-10 at 14:28 -0500, Nathan Lynch wrote:
> Leonardo Bras <leonardo@linux.ibm.com> writes:
> > Implement rtas_call_reentrant() for reentrant rtas-calls:
> > "ibm,int-on", "ibm,int-off",ibm,get-xive" and  "ibm,set-xive".
> >=20
> > On LoPAPR Version 1.1 (March 24, 2016), from 7.3.10.1 to 7.3.10.4,
> > items 2 and 3 say:
> >=20
> > 2 - For the PowerPC External Interrupt option: The * call must be
> > reentrant to the number of processors on the platform.
> > 3 - For the PowerPC External Interrupt option: The * argument call
> > buffer for each simultaneous call must be physically unique.
> >=20
> > So, these rtas-calls can be called in a lockless way, if using
> > a different buffer for each call.
> >=20

> From the language in the spec it's clear that these calls are intended
> to be reentrant with respect to themselves, but it's less clear to me
> that they are safe to call simultaneously with respect to each other or
> arbitrary other RTAS methods.

In my viewpoint, being reentrant to themselves, without being reentrant
to others would be very difficult to do, considering the way the
rtas_call is crafted to work.

I mean, I have no experience in rtas code, it's my viewpoint. In my
thoughts there is something like this:

common_path -> selects function by token -> reentrant function
					|-> non-reentrant function

If there is one function that is reentrant, it means the common_path
and function selection by token would need to be reentrant too.

> > This can be useful to avoid deadlocks in crashing, where rtas-calls are
> > needed, but some other thread crashed holding the rtas.lock.
>=20
> Are these calls commonly used in the crash-handling path? Is this
> addressing a real issue you've seen?
>=20

Yes, I noticed deadlocks during crashes, like this one:
#0 arch_spin_lock
#1  lock_rtas ()=20
#2  rtas_call (token=3D8204, nargs=3D1, nret=3D1, outputs=3D0x0)
#3  ics_rtas_mask_real_irq (hw_irq=3D4100)=20
#4  machine_kexec_mask_interrupts
#5  default_machine_crash_shutdown
#6  machine_crash_shutdown=20
#7  __crash_kexec
#8  crash_kexec
#9  oops_end

On ics_rtas_mask_real_irq() we have both ibm_int_off and ibm_set_xive,
so it makes sense to also add ibm_int_on and ibm_get_xive as reentrant
too.

Full discussion available on this thread:
http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20200401000020.59044=
7-1-leonardo@linux.ibm.com/

>=20
> > +/*
> > + * Used for reentrant rtas calls.
> > + * According to LoPAR documentation, only "ibm,int-on", "ibm,int-off",
> > + * "ibm,get-xive" and "ibm,set-xive" are currently reentrant.
> > + * Reentrant calls need their own rtas_args buffer, so not using rtas.=
args.
> > + */
>=20
> Please use kernel-doc format in new code.

Sure, v2 is going to be fixed.

>=20
>=20
> > +int rtas_call_reentrant(int token, int nargs, int nret, int *outputs, =
...)
> > +{
> > +	va_list list;
> > +	struct rtas_args rtas_args;
> > +
> > +	if (!rtas.entry || token =3D=3D RTAS_UNKNOWN_SERVICE)
> > +		return -1;
> > +
> > +	va_start(list, outputs);
> > +	va_rtas_call_unlocked(&rtas_args, token, nargs, nret, list);
> > +	va_end(list);
>=20
> No, I don't think you can place the RTAS argument buffer on the stack:
>=20
>   7.2.7, Software Implementation Note:
>   | The OS must be aware that the effective address range for RTAS is 4
>   | GB when instantiated in 32-bit mode and the OS should not pass RTAS
>   | addresses or blocks of data which might fall outside of this range.

Agree, moved to PACA.

I will send a v2 soon, it will be a 2-patch patchset.

Best regards,
Leonardo Bras

--=-h1B/JIutLyKglRH0NDZG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl67eCMACgkQlQYWtz9S
ttQSLw/5AdNmiQ0LgG7a7BXJuq1+1ry8fn+YHyXeXN3k8BPdtaa2e3q/BtnAYBhK
eRg3Dkbg9ztSd29F3cbqbJbsLm9PoaHSCkawE4E8fMaCeDgaKXucGPuuVCQOn40d
G5hIf4XL0Ixz/zj0fcd8lh1ZZ+n61tAuoI6e3e5iRnaajyVjZpJwxI94lDPr3J4x
jZWtazF9as1wYdkQRAwt5GiLHkzyyuw9mknJBwNVbPl1KtvCeCyaqIOKH/oIFp0n
DvI5CLqy5Qm99j4V8e6nir6gUalsPChYnrn3RITPIFAdaS3Rk7a1Bk1OfOol1iOQ
Sym3Tpnm70gxaosK2UAJLJxbq5EJmT/VzfWznuodWZ+N/Erp0+a7P4G3xB8mNJ+x
6J/8122/GzeFubaTnvOcMqEgemcaJMseiJd3jQClQQBH/aHITKgIc9IDwzSifr5y
tRUk3KTD8MfwNQtV53Q/JAJHrWTy0SEFl1slR+8Jv2UoyN1a/6sKrJgJkFQmOVEy
ErGQpGtGW9rUXvy/Yt5jXHeTvNWbSuDbKh/XalbXyk6mLTcvx37L+85m8xaqatNf
Xmz5a5DuqcLfD+0D7ExIKCruyG52Z72esbo4C0m1oZd9QLrIGgaZcZmigzpa6Clb
hGqApNUPOUgE308Lnjvll3Eo2HUeyjnCbZav+YseEvVO6KbYyL8=
=NL/i
-----END PGP SIGNATURE-----

--=-h1B/JIutLyKglRH0NDZG--

