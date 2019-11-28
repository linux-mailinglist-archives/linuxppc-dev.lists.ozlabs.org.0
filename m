Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFE810CDB3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 18:21:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47P4DQ4hQFzDqD2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 04:21:10 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47P2zH2C77zDqg7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 03:24:43 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xASGGZWH019825; Thu, 28 Nov 2019 11:24:31 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wjf1v5y8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Nov 2019 11:24:31 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xASGGuJw021288;
 Thu, 28 Nov 2019 11:24:31 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wjf1v5y86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Nov 2019 11:24:31 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xASGMjB2032468;
 Thu, 28 Nov 2019 16:24:30 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 2wevd7ame2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Nov 2019 16:24:30 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xASGOT6B30081516
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Nov 2019 16:24:29 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5722D7805E;
 Thu, 28 Nov 2019 16:24:29 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C5437805F;
 Thu, 28 Nov 2019 16:24:27 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.137])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 28 Nov 2019 16:24:27 +0000 (GMT)
Message-ID: <5789f26ca5568f05b9554053a1c6c3309d5c36e8.camel@linux.ibm.com>
Subject: Re: [PATCH 1/1] powerpc/kvm/book3s: Fixes possible 'use after
 release' of kvm
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Paul Mackerras <paulus@ozlabs.org>
Date: Thu, 28 Nov 2019 13:24:22 -0300
In-Reply-To: <20191127225747.GA2317@blackberry>
References: <20191126175212.377171-1-leonardo@linux.ibm.com>
 <20191127225747.GA2317@blackberry>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-PNohgKkP6BiPP+29h/le"
User-Agent: Evolution 3.34.1 (3.34.1-1.fc31) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-28_05:2019-11-28,2019-11-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 impostorscore=0 phishscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=2 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911280136
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
Cc: kvm@vger.kernel.org,
 Radim =?UTF-8?Q?Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-PNohgKkP6BiPP+29h/le
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-11-28 at 09:57 +1100, Paul Mackerras wrote:
> There isn't a potential use-after-free here.  We are relying on the
> property that the release function (kvm_vm_release) cannot be called
> in parallel with this function.  The reason is that this function
> (kvm_vm_ioctl_create_spapr_tce) is handling an ioctl on a kvm VM file
> descriptor.  That means that a userspace process has the file
> descriptor still open.  The code that implements the close() system
> call makes sure that no thread is still executing inside any system
> call that is using the same file descriptor before calling the file
> descriptor's release function (in this case, kvm_vm_release).  That
> means that this kvm_put_kvm() call here cannot make the reference
> count go to zero.

That was very informative. A lot of things are clear to me now.
Thanks for explaining this Paul.=20

Best regards,
Leonardo

--=-PNohgKkP6BiPP+29h/le
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl3f9LYACgkQlQYWtz9S
ttTuFRAAzklmvK/yrMAbKL0SscgkU2u5KsQ6td7bys4CpwCyjrFvMpPEhTscVF6l
oJ/MuPcpEikVISnJTdqpbnyRp3fyZE105GBKP1LN5aXp+1HxT4DZHggSwuQg0THh
9dce2RIjBaa+dUtLlFselG4xWBkJoUzVM1yNpvxhNLJGc52+mCmDmUeA3icT/NoY
uKVtuOBfE7/UK94AhuBUkvVoUNGMPmLof+czvZPIuVc8Vprga3cXIpjLT2lw8Stk
nKriyJO0/MVDTEU6mcqUYRfHUW2c2SAeae3AGz0HiXfPX3ar0Xl+wCd8vX+yO07S
QmkWlKnvyBQi7WSHwg54xtbPDQBxig0PwOrG2OTDlZDuWT3PfGvYy9q2C5FOABcH
xgxe4fas0u1dw/MY/JKo/DnJBq7L+aIu2faQDCRV6E/BI6s7t84nkEqALxQAmDvK
uGPEtt2L/5Y/V9h78kJG501Xfz0TESuSfa9dTlOkUTvgKz0MCogTJFVI5wgPGYS+
PK9aGMCRNzggyNprKsy+V76fvWy5LyR4L1ZfvToSVpTkd3kXV6prD2oRH2hYuVTX
+MGhuqMf56WNUug++Yc82DAHTNJAwMpAs9nOwK7xoOwIs+4t5di4PdjK1KjwFhlO
SIDljErVyer2WdJSIvW+CaUczw8qlrx4qqus8ffqI/Jnf64fZPQ=
=hQv1
-----END PGP SIGNATURE-----

--=-PNohgKkP6BiPP+29h/le--

