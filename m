Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E83C637107
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 04:29:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHk4w6vk3z3f37
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 14:29:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OSkNGXHi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OSkNGXHi;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHk3y4BMWz3bsK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 14:28:45 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AO2dlnO030676
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 03:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=bGIpLgBHLUId1sc2ik3jF3yvi9EjrdTnkp2r+GTndLI=;
 b=OSkNGXHiXa4XdK1ncB97fPQQwY6OFRrljAeNB8S1cJev73taZt4TcFSgEEixNlK2fUPO
 pc9x0/uNK18BOREeb8NAK/6gMYtCAArNTC/AVm+D+0xaxHKNNGvgLGjgwZiFj+UrOihG
 sAjV6qnWST9WnM+DROPG/s6nQQui5saosVQwFdIGvxd0cpF+x8YNIOg81GAYkPgf8AxG
 BJ5DSCpZ8kimuaBr0PXHvIOP0DaO+40nxe2udCH2nXfk48I1pmcu9CeCB3/CKjXgubO4
 jWxKohUFKr12+9PwQctW5n/KQ4Roy0mkHlrZbnGMwhOC6j+ZWQ+gV8CW/oZ2DY3qJQoj Rg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0x81cpds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 03:28:41 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AO3SEEV016958
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 03:28:41 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0x81cpde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Nov 2022 03:28:41 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AO3Jl0J023713;
	Thu, 24 Nov 2022 03:28:39 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03fra.de.ibm.com with ESMTP id 3kxps95eqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Nov 2022 03:28:39 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AO3MLjJ64356738
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Nov 2022 03:22:21 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6646B4C046;
	Thu, 24 Nov 2022 03:28:37 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 120494C044;
	Thu, 24 Nov 2022 03:28:37 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 24 Nov 2022 03:28:37 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 058246032A;
	Thu, 24 Nov 2022 14:28:31 +1100 (AEDT)
Message-ID: <2ba2809a545d0f84b336f78baf2dbe2ff20dc105.camel@linux.ibm.com>
Subject: Re: [PATCH 10/13] powerpc/rtas: improve function information lookups
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Nick Child <nnac123@linux.ibm.com>, Nathan Lynch
 <nathanl@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org
Date: Thu, 24 Nov 2022 14:28:30 +1100
In-Reply-To: <c183a039-2001-eb3a-7028-f8a0813987cf@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
	 <20221118150751.469393-11-nathanl@linux.ibm.com>
	 <5b4c4316bfe88a3f231ffe416ce34192189549db.camel@linux.ibm.com>
	 <c183a039-2001-eb3a-7028-f8a0813987cf@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: F0t4hpzVeDTloYdKh_93YhZDpRmZgLk9
X-Proofpoint-ORIG-GUID: 0VZwgyVqagH5ula5Xd0rKLLNNdnwQLkA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_02,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=638 spamscore=0 phishscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211240022
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
Cc: tyreld@linux.ibm.com, ldufour@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-11-23 at 13:32 -0600, Nick Child wrote:
> On 11/22/22 20:51, Andrew Donnellan wrote:
> > On Fri, 2022-11-18 at 09:07 -0600, Nathan Lynch wrote:
> > > +enum rtas_function_flags {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0RTAS_FN_FLAG_BANNED_FOR_SY=
SCALL_ON_LE =3D (1 << 0),
> > > +};
> >=20
> > This seems to be new, what's the justification?
> >=20
>=20
> Seems to be a run-time replacement of:
> #ifdef CONFIG_CPU_BIG_ENDIAN
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ "ibm,suspend-me", -1, -=
1, -1, -1, -1 },
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ "ibm,update-nodes", -1,=
 0, -1, -1, -1, 4096 },
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ "ibm,update-properties"=
, -1, 0, -1, -1, -1, 4096 },
> #endif
>=20
> It looks to be handled logically:
> + if (IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) &&
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (func->flag=
s & RTAS_FN_FLAG_BANNED_FOR_SYSCALL_ON_LE))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0goto err;
>=20
> Perhaps, also allow the addition of any future special cases
> for rtas functions easier to maintain?

Makes sense, though I'm slightly confused about the original rationale
for the ifdef and why it's not being fixed in userspace.

Slightly clunky name though, something like
RTAS_FN_FLAG_SYSCALL_BE_ONLY might be less clunky?

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
