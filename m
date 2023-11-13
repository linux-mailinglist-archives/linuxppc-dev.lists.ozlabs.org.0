Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1867E9A3A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 11:24:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g9HV72w5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STQXY4b9tz3cfQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 21:24:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g9HV72w5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STQWg0XdFz2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 21:23:58 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ADAB5hh032232;
	Mon, 13 Nov 2023 10:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=/el89RpK6GrxgAKwGeByCgZyLiPnTQGmfwfIpJgaHWY=;
 b=g9HV72w5RXc64MycrsYLPx1V6W2vFyjNTgj4PmcLMgv6iVj9el6CYh3G30YQHPtKd/Em
 12WOIk76Qc1mWp+u8uODnT5bwuwhn3i8ZzKgsjib8SgOKI2qCtEvjw4zwHyyZmwgdG0f
 mNEPt8jVjO+Mh2HXNe9p+4yeR5C3rMqTNvHWEmsuBiMgJQe3tC2EngB7m43ZtUtY/h//
 Rlp5zQ0TIXsyQ6bO2DHY0tqP9Wg4P4ZWZXQ9yEbGaWw/WqujswOvizQ7q/MXA9ggp3tn
 9OfAGqVeXC0Z4EhAwpNSoBOqPH8OH2Btu2xkk0PX4biHidxrsb8wyIjJpmnFvQndNFs7 og== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ubh9ss3da-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 10:23:48 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AD9ZoRQ007992;
	Mon, 13 Nov 2023 10:23:48 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ubh9ss3d3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 10:23:48 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3ADA450h017593;
	Mon, 13 Nov 2023 10:23:47 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uap5jqx3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 10:23:47 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3ADANlth26804686
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Nov 2023 10:23:47 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E28C25804B;
	Mon, 13 Nov 2023 10:23:46 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD6BC58055;
	Mon, 13 Nov 2023 10:23:44 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.109.212.144])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Nov 2023 10:23:44 +0000 (GMT)
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 29/37] powerpc/nohash: Replace pte_user() by pte_read()
In-Reply-To: <a67c0d93-f4e9-d5c5-a5ee-3347c80f0a64@csgroup.eu>
References: <cover.1695659959.git.christophe.leroy@csgroup.eu>
 <72cbb5be595e9ef884140def73815ed0b0b37010.1695659959.git.christophe.leroy@csgroup.eu>
 <877cn39jyp.fsf@linux.ibm.com>
 <02c4b724-f503-31ea-eb77-4b3cd6776fd8@csgroup.eu>
 <87zfzpznz5.fsf@linux.ibm.com>
 <a67c0d93-f4e9-d5c5-a5ee-3347c80f0a64@csgroup.eu>
Date: Mon, 13 Nov 2023 15:53:42 +0530
Message-ID: <8734xa9ck1.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kWezu1NemtlRDHHLlJnFHG4bBIl3asNs
X-Proofpoint-GUID: MbyKnkWoq-ElKU3Q_-zL1ZakD3MiMXty
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-12_24,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 mlxlogscore=570 impostorscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311130084
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 07/11/2023 =C3=A0 14:34, Aneesh Kumar K.V a =C3=A9crit=C2=A0:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>=20
>>> Le 31/10/2023 =C3=A0 11:15, Aneesh Kumar K.V a =C3=A9crit=C2=A0:
>>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:

....

>>
>>=20
>> We are adding the pte flags check not the map addr check there. Somethin=
g like this?
>
> Well, ok, but then why do we want to do that check for ioremap() and not=
=20
> for everything else ? vmap() for instance will not perform any such=20
> check. All it does is to clear the EXEC bit.
>
> As far as I can see, no other architecture does such a check, so why is=20
> it needed on powerpc at all ?
>
> Regardless, comments below.
>

Looking at ioremap_prot() I am not clear whether we can really use the
flag value argument as is. For ex: x86 does=20

pgprot2cachemode(__pgprot(prot_val))

I see that we use ioremap_prot() for generic_access_phys() and with
/dev/mem and __access_remote_vm() we can get called with a user pte
mapping prot flags?=20

If such an prot value can be observed then the original change to clear
EXEC and mark it privileged is required?

	/* we don't want to let _PAGE_USER and _PAGE_EXEC leak out */
	pte =3D pte_exprotect(pte);
	pte =3D pte_mkprivileged(pte);


We already handle exec in pgprot_nx() and we need add back
pte_mkprivileged()?=20


-aneesh
