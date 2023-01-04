Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EC665CDC4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 08:43:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nn1mp4xxzz3c7p
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 18:43:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mRQeXxsJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mRQeXxsJ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nn1lt2sTsz2x9T
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jan 2023 18:42:34 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3044qP97008630;
	Wed, 4 Jan 2023 07:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=tPEpsFjNrFyl5VV+cLlgmEKAYakgmvUl1Gdr9wqHL/o=;
 b=mRQeXxsJGfpjZhKCwNxIJ0oS6tfdS12jM1diWKgUFXMLz8FGQH7DSGvF/y9Co9LXP8lK
 kbIg2SSpTU3CMWAQxKV6bUIWHul+jDNAI+XqqLzOKyl2tSVsMwOGp4l+j7e4VHUS2+hM
 9/ECY+iToSwIpQnnSRGKngnWdLWUCXDCz26J9fzoaIwHUBAaxvWcZNBQSMQtM0AaiN6h
 rWu9IGOPpOiqigVixVeYwSdlV3/IsGNh8AiBE+al3rljVvNa8AU+r5pkzKF3C3d5Y11M
 2ufxO6to8FQGcqxEy9ODx5JjIYg7rthmRnXcsFt7Alr6Bjku77H47HMkBKQ3ALTT8SE+ yQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mvmb868dh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jan 2023 07:42:31 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 303LgZUn021071;
	Wed, 4 Jan 2023 07:42:29 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3mtcq6cx23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jan 2023 07:42:29 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3047gQgL41025926
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Jan 2023 07:42:26 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD39B2004D;
	Wed,  4 Jan 2023 07:42:26 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 36ACE2004B;
	Wed,  4 Jan 2023 07:42:26 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  4 Jan 2023 07:42:26 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7727560431;
	Wed,  4 Jan 2023 18:42:24 +1100 (AEDT)
Message-ID: <6bbf610b9c4bf12639b9ad78e89965c174aca275.camel@linux.ibm.com>
Subject: Re: [PATCH 3/4] powerpc/pseries: Expose PLPKS config values,
 support additional fields
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 04 Jan 2023 18:42:24 +1100
In-Reply-To: <98d6eb9c3b01c5ed67ff2e8ff812c3f18840a2f7.camel@russell.cc>
References: <20221220071626.1426786-1-ajd@linux.ibm.com>
	 <20221220071626.1426786-4-ajd@linux.ibm.com>
	 <98d6eb9c3b01c5ed67ff2e8ff812c3f18840a2f7.camel@russell.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DJTA91_BI2fqMb4UYHB6D6rgyZiPlv3x
X-Proofpoint-GUID: DJTA91_BI2fqMb4UYHB6D6rgyZiPlv3x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_04,2023-01-03_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 mlxlogscore=905 malwarescore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301040063
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
Cc: nayna@linux.ibm.com, gjoyce@linux.ibm.com, bgray@linux.ibm.com, brking@linux.ibm.com, gcwilson@linux.ibm.com, stefanb@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2023-01-04 at 14:57 +1100, Russell Currey wrote:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0maxobjlabelsize =3D be16_to_=
cpu(config->maxobjlabelsize) -
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 MAX_LABEL_ATTR_SIZE;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0maxobjlabelsize =3D maxobjla=
belsize < 0 ? 0 :
> > maxobjlabelsize;
>=20
> Isn't a bit of precision lost here?=C2=A0 There has to be a better way to
> handle this.=C2=A0 We get a be16 from the hypervisor, turn it into a u16,
> and assign that to an s16 in order to handle underflow.=C2=A0 Can we just
> check if the size we're given is large enough?=C2=A0 The hypervisor
> documentation also says this value must be at least 255, if we sanity
> check that we don't have to worry about underflow.

Agreed, and it makes more sense for the value that we return to the
user to be the same as the number we actually get from the hypervisor.
I'll fix it in the next spin.

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
