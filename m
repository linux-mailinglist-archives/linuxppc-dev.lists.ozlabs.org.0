Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6BE6958D4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 07:09:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PG9l262PGz3c73
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 17:09:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aMYwXJ2h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aMYwXJ2h;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PG9k15G17z3c2g
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 17:08:09 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31E5xEIR017237;
	Tue, 14 Feb 2023 06:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=6SCyKGjYHAPFiy7oK23EUWs9LnY20lJVbIIm3ukI8go=;
 b=aMYwXJ2hSkPqflVynquksRzBlPLSll0gpp8rNcA88DJmr9p/RIJT0TtEyEgjGjv3Gog0
 ObW0az0Nt7IOTGVU07tzEagVlehifz8pyUp7GGnylO5Yx6nEnjwJAgeIlUIpdveGJJE2
 ZxQp+7yssvlSo6SSjr7M+JRzeqBDC11NOZNqvJxghPpj/BxJygVqM3DN2slH36QAPpxW
 vgy9nDdnFE1Jx9PBCSsWDvWAqHSSgYf3gO9IrqFc0/4shmzOVQGQhZ49A8GfsBwyYcQ6
 LRHtRELFTYUIsc8jIqZEIYwUeNB6Fccz0LR/14s4r+Ku5icJZhbHY4usoiaCpAcQtpDH vg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nr4mh0964-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Feb 2023 06:08:03 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31E62wF9002336;
	Tue, 14 Feb 2023 06:08:02 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nr4mh0954-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Feb 2023 06:08:02 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31E56QPP029819;
	Tue, 14 Feb 2023 06:08:00 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3np29fkk0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Feb 2023 06:08:00 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31E67v0m41615864
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Feb 2023 06:07:57 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B57842004E;
	Tue, 14 Feb 2023 06:07:57 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 322412004B;
	Tue, 14 Feb 2023 06:07:57 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Feb 2023 06:07:57 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6BBF0602EB;
	Tue, 14 Feb 2023 17:07:55 +1100 (AEDT)
Message-ID: <22172b58cd5353324d14b733aeac51e365597070.camel@linux.ibm.com>
Subject: Re: [PATCH v6 24/26] powerpc/pseries: Implement secvars for dynamic
 secure boot
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Michael Ellerman <michaele@au1.ibm.com>,
        Stefan Berger
	 <stefanb@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-integrity@vger.kernel.org
Date: Tue, 14 Feb 2023 17:07:55 +1100
In-Reply-To: <87pmadvm0n.fsf@mpe.ellerman.id.au>
References: <20230210080401.345462-1-ajd@linux.ibm.com>
	 <20230210080401.345462-25-ajd@linux.ibm.com>
	 <f35e9ba1-5fdb-4cfa-5b41-cc55307dcd45@linux.ibm.com>
	 <87pmadvm0n.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: --4HkeaaELw4PB37A_mdWeY5D6Os0T_E
X-Proofpoint-ORIG-GUID: Y4otBLPpiJSn1lsJDWansBSjC_blWAXc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_03,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 adultscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302140048
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
Cc: sudhakar@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, gjoyce@linux.ibm.com, ruscur@russell.cc, joel@jms.id.au, bgray@linux.ibm.com, brking@linux.ibm.com, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2023-02-13 at 22:32 +1100, Michael Ellerman wrote:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0memcpy(&flags, data, sizeo=
f(flags));
> >=20
> > conversion from bytestream to integer: I think in this case it
> > would be better to use
> >=20
> > flags =3D cpu_to_be64p((__u64*)data);
> >=20
> > so that the flags always in hypervisor/big endian format
>=20
> I don't think it's correct to byte swap the flags here. They must be
> in
> big endian format, but that's up to the caller.

That was what I initially thought, until I went and tested it properly
and found it was indeed broken (at least in our qemu environment, this
is slightly tricky for me to test right now on real hardware with real
PowerVM) depending on kernel endianness.

- Userspace writes the flags into the buffer in BE order

- The first 8 bytes of the buffer are memcpy()ed, in BE order, into
flags (a u64)

- plpar_hcall9() is called with flags as an argument, loaded into r9

- r9 is moved to r8 before jumping into the hypervisor

On a BE system, this works fine. On an LE system, this results in the
bytes in the flags variable being loaded into the register in LE order,
so the conversion is necessary.

> The powernv secvar backend doesn't byte swap the flags, if the
> pseries
> one did then the final content of the variable, written either by
> phyp
> or OPAL, would differ depending on which backend is active.
>=20
> Or am I missing something?

The powernv secvar backend doesn't have a notion of flags at all. (The
flags interface for pseries is a little ugly, but it gets the job done
- userspace can read the format attribute to discover what it needs to
do.)

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
