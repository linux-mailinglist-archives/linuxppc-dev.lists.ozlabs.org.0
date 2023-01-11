Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E41F466528E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 04:58:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsDS85xb9z3cdL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 14:58:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=adJ2g5KX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=adJ2g5KX;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsDR86ZQjz3bWT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 14:57:39 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30B1io9h010091;
	Wed, 11 Jan 2023 03:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=idbF1CtURypA8wpbO/rYe2ZrEBUBsALsIfTFTeVbM2U=;
 b=adJ2g5KXsFFhQo3/i/HS68oEWDYNlgoaM+7y/ZipWoTOyPgjGpcVsNlOTRM6krWXYI95
 P35sBiwDs5mw2OpXk6yVKFIsEuRzgs/MwNczZnK35XTlCRUkBbybNHAxjg/xXGMqyeWM
 2VsnYrm8hJDAG/8WRUnUmGvm8oTqbVy4OZDMR0tt5kYNQZ5L3jOhbAwAEtAgX+rKmxiB
 +/IB3HYaDJp/YWCIm4vV/p2nK8yl0QTiWJuVjZrAZf8+CNOSBDhAZ7g2nC4P/tlg0kjI
 uhcQT/o4skFXB5qmv/Q/U4FSsc+Ta8JlPE3wh/d4hCi9MPUMfPbACC084cT5iiVvZODe ZQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1kqma1yr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jan 2023 03:57:32 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30B1RMfX030858;
	Wed, 11 Jan 2023 03:57:29 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3n1kf7g54n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jan 2023 03:57:29 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30B3vR8T47055232
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Jan 2023 03:57:27 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D19220049;
	Wed, 11 Jan 2023 03:57:27 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A1E7E20040;
	Wed, 11 Jan 2023 03:57:26 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 11 Jan 2023 03:57:26 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 06FF0600D2;
	Wed, 11 Jan 2023 14:57:23 +1100 (AEDT)
Message-ID: <d7b4942dcb62056703eff0e07e23acbd152a10f6.camel@linux.ibm.com>
Subject: Re: [PATCH v2 7/7] powerpc/pseries: Implement secvars for dynamic
 secure boot
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Russell Currey
 <ruscur@russell.cc>,
        linuxppc-dev@lists.ozlabs.org
Date: Wed, 11 Jan 2023 14:57:22 +1100
In-Reply-To: <87zgawgcpa.fsf@mpe.ellerman.id.au>
References: <20221230042014.154483-1-ruscur@russell.cc>
	 <20221230042014.154483-8-ruscur@russell.cc>
	 <87zgawgcpa.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: my4_Recuo3xIFCqlqFviuBT4xa2dVIcE
X-Proofpoint-GUID: my4_Recuo3xIFCqlqFviuBT4xa2dVIcE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_10,2023-01-10_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=534 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301110025
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
Cc: nayna@linux.ibm.com, gregkh@linuxfoundation.org, gcwilson@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2023-01-06 at 21:49 +1100, Michael Ellerman wrote:
>=20
> > diff --git a/arch/powerpc/platforms/pseries/Kconfig
> > b/arch/powerpc/platforms/pseries/Kconfig
> > index a3b4d99567cb..94e08c405d50 100644
> > --- a/arch/powerpc/platforms/pseries/Kconfig
> > +++ b/arch/powerpc/platforms/pseries/Kconfig
> > @@ -162,6 +162,19 @@ config PSERIES_PLPKS
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If unsure, selec=
t N.
> > =C2=A0
> > +config PSERIES_PLPKS_SECVAR
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on PSERIES_PLPKS
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on PPC_SECURE_BOOT
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool "Support for the PLPKS =
secvar interface"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0help
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PowerVM can support d=
ynamic secure boot with user-defined
> > keys
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 through the PLPKS. Ke=
ystore objects used in dynamic
> > secure boot
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 can be exposed to the=
 kernel and userspace through the
> > powerpc
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 secvar infrastructure=
. Select this to enable the PLPKS
> > backend
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for secvars for use i=
n pseries dynamic secure boot.
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If unsure, select N.
>=20
> I don't think we need that config option at all, or if we do it
> should
> not be user selectable and just enabled automatically by
> PSERIES_PLPKS.

I actually think we should get rid of both PSERIES_PLPKS_SECVAR and
PSERIES_PLPKS, and just use PPC_SECURE_BOOT / PPC_SECVAR_SYSFS.

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
