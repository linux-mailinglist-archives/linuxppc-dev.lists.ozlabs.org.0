Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B0F693798
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Feb 2023 14:34:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PF7jw5bRnz3bqw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 00:34:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BQT8tNQH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BQT8tNQH;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PF7hz04Swz2ypb
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Feb 2023 00:33:38 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31CArhrW011314;
	Sun, 12 Feb 2023 13:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=dOicgCe8+QU2ZEzdLzCwvOTevgtQeHSjrevOEYF4M7I=;
 b=BQT8tNQHiQh7495r61xeWGe+eGEnns89WGup7FlFUiAIf7bw7YdYrcCprEmlsnFTrmII
 6jyVtrSDSehXpq4tIZ1fa4DHOv3tHYsLAcNJNDiaUT8fXAgQh3oczkQ3QsrU56tWnN9D
 KL/uLp6PGeZz+AiyGKpjDCbSFm7BoLLBqN4+Tbd5arTcfQOwk+rGIug4AYNMQvHTfPjj
 nyZqvOo2LnJPbYFLpk73mS3IPEvmzHUYLziiGa9ZUNJUhA8CeLA0UJ2p5ItZwXZQZl31
 Genq2RGevgcNPbw5BGNlRYXPhq4liKViIvAApcBv0/pPc/gcXz2q5c/lS59AT7l46VvL LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3npxrvt002-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Feb 2023 13:33:31 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31CDU7Fm026459;
	Sun, 12 Feb 2023 13:33:31 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3npxrvsyyr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Feb 2023 13:33:30 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31BMbRTj031193;
	Sun, 12 Feb 2023 13:33:29 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3np29fhjyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Feb 2023 13:33:29 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31CDXQAU47251824
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 12 Feb 2023 13:33:26 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD2E520043;
	Sun, 12 Feb 2023 13:33:26 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3995E20040;
	Sun, 12 Feb 2023 13:33:26 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 12 Feb 2023 13:33:26 +0000 (GMT)
Received: from [9.43.187.72] (unknown [9.43.187.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id BC30C600BA;
	Mon, 13 Feb 2023 00:33:19 +1100 (AEDT)
Message-ID: <b928627ce5a2d90b0ad33d89ce48ec19a2655111.camel@linux.ibm.com>
Subject: Re: [PATCH v6 24/26] powerpc/pseries: Implement secvars for dynamic
 secure boot
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Stefan Berger <stefanb@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-integrity@vger.kernel.org
Date: Mon, 13 Feb 2023 00:33:17 +1100
In-Reply-To: <a63276d5-1be4-b140-6a4a-4ad4efa60eda@linux.ibm.com>
References: <20230210080401.345462-1-ajd@linux.ibm.com>
	 <20230210080401.345462-25-ajd@linux.ibm.com>
	 <f35e9ba1-5fdb-4cfa-5b41-cc55307dcd45@linux.ibm.com>
	 <a63276d5-1be4-b140-6a4a-4ad4efa60eda@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Hg5HAqHdQ43knZIZDzwbGuGMkbEZx_Lr
X-Proofpoint-GUID: -tzNATl1h47RB1-2K7Zd9Qbc9SLl6_Ai
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-12_02,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=901 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302120115
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

On Fri, 2023-02-10 at 16:28 -0500, Stefan Berger wrote:
> > > +err:
> > > +=C2=A0=C2=A0=C2=A0 kfree(var.data);
> >=20
> > remove the kfree()
>=20
> Actually don't remove it but it should probably be
>=20
> if (var.data !=3D &version)
> =C2=A0=C2=A0=C2=A0=C2=A0 kfree(var.data);
>=20

Argh, thanks for catching this.

I don't think the condition is needed - we can assume the var.data is
unmodified.

mpe, are you able to fix this up in merge?

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
