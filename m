Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9D6338181
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 00:33:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxQHK5H04z3cX2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 10:33:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ORSyjWPL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=au1.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ellerman@au1.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ORSyjWPL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxQGs6wDrz3cJG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 10:32:52 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12BN3g06165909; Thu, 11 Mar 2021 18:32:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=ASkwtDNtmP5z5UIMCceMUEDwEFC1x4HB+ZfDu0Yro90=;
 b=ORSyjWPLFb9KTtcWjjgS3BsuUcjJTvYyFY9E5WNCYdAl6o36IBLwF0aMbrVl7vf+yryn
 zm424lRW/BeXCBMzd9vhTmvNEpB+Bk7WPKv7vbXrOdjfEvk4cp+M1RZeSuyKnc0/u4D5
 uAsEKl/9ml2b12Kux7bRaPeabWeskekrz3hdF5x8S+IahQG49eCX3NU6A2Js4/Zmmcqk
 g5GRS8JRrg2aYuzDnwcafFQE80H1XfAT9g/AKKrZBYmtp0838l/5wVP9hhCt36UBZUKA
 Td6CXLQBZ/KyNma+1UqF8VqyughA93PAmx21/C8h9yCitsdjQzNCop1D5uCz7DQDI4vu vA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3774m1mb41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 18:32:42 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12BN4o0N169819;
 Thu, 11 Mar 2021 18:32:42 -0500
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3774m1mb3m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 18:32:42 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12BNS3to003074;
 Thu, 11 Mar 2021 23:32:40 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 3768va17r0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 23:32:40 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12BNWcJA8651042
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Mar 2021 23:32:38 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 177A04C040;
 Thu, 11 Mar 2021 23:32:38 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B831B4C046;
 Thu, 11 Mar 2021 23:32:37 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Mar 2021 23:32:37 +0000 (GMT)
Received: from localhost (unknown [9.206.152.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E4929601F6;
 Fri, 12 Mar 2021 10:32:35 +1100 (AEDT)
From: Michael Ellerman <ellerman@au1.ibm.com>
To: Alan Modra <amodra@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: PowerPC64 future proof kernel toc, revised for lld
In-Reply-To: <20210310234135.GC29645@bubble.grove.modra.org>
References: <20210309045638.GI6042@bubble.grove.modra.org>
 <20210310034813.GM6042@bubble.grove.modra.org>
 <3c92968f-7c61-8d36-4001-91f8630de4b1@linux.ibm.com>
 <20210310050722.GN6042@bubble.grove.modra.org>
 <5aa60950-d93c-f700-3b0b-a01f947e8a22@linux.ibm.com>
 <20210310122513.GB29645@bubble.grove.modra.org>
 <df863fb6-2fd6-00d7-b6f3-94a49c2a5405@csgroup.eu>
 <20210310234135.GC29645@bubble.grove.modra.org>
Date: Fri, 12 Mar 2021 10:32:32 +1100
Message-ID: <87mtv9jmgf.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-11_12:2021-03-10,
 2021-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 clxscore=1011 suspectscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103110123
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
Cc: alexey@au1.ibm.com, Alexey Kardashevskiy <aik@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alan Modra <amodra@gmail.com> writes:
> On Wed, Mar 10, 2021 at 01:44:57PM +0100, Christophe Leroy wrote:
>>=20
>> Le 10/03/2021 =C3=A0 13:25, Alan Modra a =C3=A9crit=C2=A0:
>> > On Wed, Mar 10, 2021 at 08:33:37PM +1100, Alexey Kardashevskiy wrote:
>> > > One more question - the older version had a construct "DEFINED (.TOC=
.) ?
>> > > .TOC. : ..." in case .TOC. is not defined (too old ld? too old gcc?)=
 but the
>> > > newer patch seems assuming it is always defined, when was it added? =
I have
>> > > the same check in SLOF, for example, do I still need it?
>> >=20
>> > .TOC. symbol support was first added 2012-11-06, so you need
>> > binutils-2.24 or later to use .TOC. as a symbol.
>> >=20
>>=20
>> As of today, minimum requirement to build kernel is binutils 2.23, see h=
ttps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.kernel.org_doc_ht=
ml_latest_process_changes.html-23current-2Dminimal-2Drequirements&d=3DDwIDA=
w&c=3Djf_iaSHvJObTbx-siA1ZOg&r=3Duzpscot8Q8p-51o1Gp1vnzKV94bfny2qmUdVe821lv=
0&m=3DSYi605mn0I1hf1QoHuvHXtS_Z-R6JJHbzS34cEtV2Tk&s=3D47ckf3yxVcP6RwRb8D9vi=
YOQSWpf6rXrnWj4YM4OTJ0&e=3D=20
>
> Yes, and arch/powerpc/Makefile complains about 2.24.  So for powerpc
> that means you need to go to at least 2.25.=20=20

Not quite. It only complains for little endian builds, and only if you
have stock 2.24, it will allow a 2.24.<something>.

I do most of my builds with 2.34, so I have no issue with newer
binutils. But we try not to increase the minimum version too rapidly to
accommodate folks using older and/or "Enterprise" distros that are stuck
on old toolchains.

I think we are within our rights to increase the minimum requirement for
powerpc builds, if it brings advantages we can identify.

The way to do that would be to add a new check in our arch Makefile that
rejects the older versions.

cheers
