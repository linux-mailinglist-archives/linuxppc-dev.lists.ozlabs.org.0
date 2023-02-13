Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBF8693DE1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 06:28:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFXt9518jz3bh1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 16:28:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cpfQ4hhy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=au1.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=michaele@au1.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cpfQ4hhy;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFXsB6Pv2z3bVD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Feb 2023 16:27:10 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31D5BC3D024330;
	Mon, 13 Feb 2023 05:27:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=2qAHun67YDL1ANmg/gkNMnPX1mBWFtofWsMAq4D/I6A=;
 b=cpfQ4hhyx+JmiCWgWLqSRQbpDeZ/PK0VxgLydhAxeG6cZvY1+SdT7WgdcfeMEfjAuQ+p
 /JyuAZpe20kdYbPTh+okUYBu1C+rudi8eojlmAmO10+7yJcVBBhOMUejJaePSI+Itp+q
 P9cJ6qgk5dt4joV8+jHILATAwdK56PubPCw78ZjHA/iu+3CndVafU/z9zleLNQ7/yxnd
 ksHPN8TYgvbc0E76ztv25hjn/Z0+hqftbCLpscLrTd0tTf6qSdSe89daP43smW2l0OM2
 /0QJDbIpEhbZHLvoIhYsT8LQmziiMni72ZQJut5zcQpPezlwkKpkxAnsv/a7nEN2qzWK Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nq4xps6rn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Feb 2023 05:27:03 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31D5R2nO013565;
	Mon, 13 Feb 2023 05:27:02 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nq4xps6r5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Feb 2023 05:27:02 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31CJ2N3F017578;
	Mon, 13 Feb 2023 05:27:00 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3np2n6j5ma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Feb 2023 05:27:00 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31D5Qvcr50004354
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Feb 2023 05:26:57 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC28420040;
	Mon, 13 Feb 2023 05:26:57 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1911D20043;
	Mon, 13 Feb 2023 05:26:57 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Feb 2023 05:26:57 +0000 (GMT)
Received: from localhost (unknown [9.177.92.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id BA7E3600BA;
	Mon, 13 Feb 2023 16:26:50 +1100 (AEDT)
From: Michael Ellerman <michaele@au1.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>,
        Stefan Berger
 <stefanb@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-integrity@vger.kernel.org
Subject: Re: [PATCH v6 24/26] powerpc/pseries: Implement secvars for dynamic
 secure boot
In-Reply-To: <b928627ce5a2d90b0ad33d89ce48ec19a2655111.camel@linux.ibm.com>
References: <20230210080401.345462-1-ajd@linux.ibm.com>
 <20230210080401.345462-25-ajd@linux.ibm.com>
 <f35e9ba1-5fdb-4cfa-5b41-cc55307dcd45@linux.ibm.com>
 <a63276d5-1be4-b140-6a4a-4ad4efa60eda@linux.ibm.com>
 <b928627ce5a2d90b0ad33d89ce48ec19a2655111.camel@linux.ibm.com>
Date: Mon, 13 Feb 2023 16:26:45 +1100
Message-ID: <87y1p2uodm.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1m_fVLMazNjP5KgcCuuoM2G21Cc_E33d
X-Proofpoint-GUID: xrUCJ2msPrTUMSeGrnBVJOfYyGHXJCOh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_02,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 clxscore=1011 spamscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 mlxlogscore=908 impostorscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302130041
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
Cc: gjoyce@linux.ibm.com, bgray@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, sudhakar@linux.ibm.com, zohar@linux.ibm.com, ruscur@russell.cc, brking@linux.ibm.com, gcwilson@linux.ibm.com, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan <ajd@linux.ibm.com> writes:
> On Fri, 2023-02-10 at 16:28 -0500, Stefan Berger wrote:
>> > > +err:
>> > > +=C2=A0=C2=A0=C2=A0 kfree(var.data);
>> >=20
>> > remove the kfree()
>>=20
>> Actually don't remove it but it should probably be
>>=20
>> if (var.data !=3D &version)
>> =C2=A0=C2=A0=C2=A0=C2=A0 kfree(var.data);
>>=20
>
> Argh, thanks for catching this.
>
> I don't think the condition is needed - we can assume the var.data is
> unmodified.
>
> mpe, are you able to fix this up in merge?

Yeah, can you reply here with the delta you want applied.

cheers
