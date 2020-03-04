Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC1A179B85
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 23:07:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Xp065KnvzDqdx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 09:07:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=leonardo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XnyJ3XzJzDqTG
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 09:06:00 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 024Lwmcl133623; Wed, 4 Mar 2020 17:05:52 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfkncewpc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Mar 2020 17:05:51 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 024Lws2D133806;
 Wed, 4 Mar 2020 17:05:51 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfkncewp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Mar 2020 17:05:51 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 024M0YaH030687;
 Wed, 4 Mar 2020 22:05:50 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 2yffk77xby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Mar 2020 22:05:50 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 024M5n0U13304420
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Mar 2020 22:05:49 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C3C2BE0AC;
 Wed,  4 Mar 2020 22:05:49 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EEB24BE0A3;
 Wed,  4 Mar 2020 22:05:46 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.190])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  4 Mar 2020 22:05:46 +0000 (GMT)
Message-ID: <a93a42c672171ed93557f9f9f3b5d64013980f26.camel@linux.ibm.com>
Subject: Re: [PATCH 1/1] powerpc/kernel: Enables memory hot-remove after
 reboot on pseries guests
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Bharata B Rao <bharata.rao@gmail.com>
Date: Wed, 04 Mar 2020 19:05:43 -0300
In-Reply-To: <621dd76a8e0b449db66ba2c3ad20fb2c743a1f1b.camel@linux.ibm.com>
References: <20200228060439.52749-1-leonardo@linux.ibm.com>
 <CAGZKiBr=8i11YPDn+1y5j6YfGj+tVbbTKakoGje9QQ8TEw9g5g@mail.gmail.com>
 <621dd76a8e0b449db66ba2c3ad20fb2c743a1f1b.camel@linux.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-i+d4i/WWLm20T4rx7xB5"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-04_09:2020-03-04,
 2020-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 mlxlogscore=897 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=2 clxscore=1015 mlxscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003040140
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
Cc: ndfont@gmail.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 arbab@linux.ibm.com, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-i+d4i/WWLm20T4rx7xB5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-03-04 at 04:18 -0300, Leonardo Bras wrote:
> Humm, this makes sense.
> But with mu change, these pieces of memory only get into ZONE_MOVABLE
> if the boot parameter 'movable_node' gets passed to guest kernel.=20

Humm, I think your patch also does that.

> So, even if we are unable to sort out some flag combination that work
> fine for both use-cases, if PowerVM don't pass 'movable_node' as boot
> parameter to kernel, it will behave just as today.

Also, another option would be adding a new 'removable' flag, given it
has a lot of free bytes. It would only be passed by qemu, so we would
be safe with PowerVM.=20

Then we would have=20
+	if(lmb->flags & DRCONF_MEM_REMOVABLE)=09
+		early_init_dt_mark_hotplug_memory_arch(base, size);

Do you know if it's possible?
We would need to update the LOPAPR?=20

Leonardo

--=-i+d4i/WWLm20T4rx7xB5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl5gJjcACgkQlQYWtz9S
ttSHtw/9EmfURu4xc28TKZKOR3RRVUWh04fm24UoyOjEiEQ//E0NsFKdT1sIx+uH
CSL9M3nNE0+DFz9YOtFwRKNwvrleSJUzivvaJyLU0jOsgZu0XmRHw3Sz3faYeIwU
fYke3nVYjqb+qrgJLhlX+EeVlAgpp0Wgr5gYxvMvjUrWhR163JOP8sXWZy2FW7vr
EgGOasvyrNiX/tvAa4H9mGSeL0ivmDx6O9FB/EKaZIRMXPCT9L0+jIR/upFPhNBH
3dmoCd26vpy/D/vs2thMQRU77WoIYQcGVTniM7/zEuJ2X3v0B95GnfblHh/3dQM7
D796j+eXq/Io6DQyBh4EEjMWOyYuDb3KM1G/ZJuHPs/RhTCl31DveMBC6kK7e9Yw
51q+hyU2opLZKDV3DI7EzzUIbUkC/i/wp7SmsswZQHZCpwOfCcf8/K24h9q5yUZn
yjce+OpcLy/VfhlZGhf0E5D8p+IOL0zJHFlpb3bGDAXtUecp1C8J82nLdXHFE0Pz
GitCSImCzjjwfoLEx8VYRV/TjBS9NjNbHOnG1GVVVgAlL1BauySvHYqTTdc0SlMG
f+NKuqE9U0b5hpG4+cu3PQMCnAngv4PzG9tiF4HW+2UQ4ETujvqUwMFilYJa94VT
bgB2swZfVuFydKx99Wy9FuBdsiNbzriiIccjv9Nn7MgXkJFl/+s=
=Sv41
-----END PGP SIGNATURE-----

--=-i+d4i/WWLm20T4rx7xB5--

