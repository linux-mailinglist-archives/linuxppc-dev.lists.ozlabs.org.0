Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23844545A86
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 05:34:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LK6531kKSz3btb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 13:33:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kqW41dbI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kqW41dbI;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LK64K42VLz3blQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 13:33:20 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A3ADZb020701;
	Fri, 10 Jun 2022 03:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=bDvK75IE7BxNskFywFSlovQPblDDOqSGlEaEyaxklRY=;
 b=kqW41dbISpnsi28FlmWHOiFRI/JgjrjJOJoEeZt/RbziG9ley5XLs7YiXSl0nQ8H74gn
 J3mGPK1titVIydHooROwgkkGrlkbWDGKBsfP/UjWFxitYtjEY/2ULm56aLXKbg5mZPV3
 K6pwjf1JwEy3PUj0brHq0ImvSZGHOCK7xfzeQs8AvPverQXLOonDEzOS2FV5wvis51dn
 mVeSCQGuTLy9Y/s3LGqaPwZZeyVvXcxjdzHdUu5hmv9NKg5fuVu/cCyAlesBYhkhlunF
 yOU6AYIjhBPm/hahxwPW2PXQsR1ISFDMo8yo/KpiV+yvRt26t2mwk+wEaVoMstgtql2n Cg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gkwjc0fay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 03:33:13 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25A3WJeg006681;
	Fri, 10 Jun 2022 03:33:12 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gkwjc0f9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 03:33:12 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25A36bWe020491;
	Fri, 10 Jun 2022 03:33:10 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma03ams.nl.ibm.com with ESMTP id 3gfy19fndv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 03:33:10 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25A3X8PN19202402
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 03:33:08 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D69242042;
	Fri, 10 Jun 2022 03:33:08 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B7314203F;
	Fri, 10 Jun 2022 03:33:05 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.84.186.134])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Fri, 10 Jun 2022 03:33:04 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: [PATCH 1/6] powerpc: Add ZERO_GPRS macros for register clears
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <20220601160023.GV25951@gate.crashing.org>
Date: Fri, 10 Jun 2022 13:32:58 +1000
Content-Transfer-Encoding: quoted-printable
Message-Id: <88BD925A-D6A8-4983-A573-7D9CEE51CDE7@linux.ibm.com>
References: <20220601054850.250287-1-rmclure@linux.ibm.com>
 <20220601160023.GV25951@gate.crashing.org>
To: Segher Boessenkool <segher@kernel.crashing.org>,
        christophe.leroy@csgroup.eu
X-Mailer: Apple Mail (2.3696.100.31)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5HDQRWbc4wSlnL-z2qWdMH4Gp4E07eRG
X-Proofpoint-GUID: PZmKhFFmS0I6JTz0aLQ5Kz0HttNWKBlD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_01,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100010
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On 2 Jun 2022, at 2:00 am, Segher Boessenkool =
<segher@kernel.crashing.org> wrote:
>=20
> Hi!
>=20
> On Wed, Jun 01, 2022 at 03:48:45PM +1000, Rohan McLure wrote:
>> +.macro BINOP_REGS op, rhs, start, end
>> +	.Lreg=3D\start
>> +	.rept (\end - \start + 1)
>> +	\op .Lreg, \rhs
>> +	.Lreg=3D.Lreg+1
>> +	.endr
>> +.endm
>=20
> This is for unary operations, not binary operations (there is only one
> item on the RHS).  You can in principle put a string "a,b" in the rhs
> parameter, but in practice you need a or b to depend on the loop =
counter
> as well, so even such trickiness won't do.  Make the naming less
> confusing, maybe?  Or don't have an unused extra level of abstraction =
in
> the first place :-)
>=20
>=20
> Segher

Thanks Segher, Christophe for reviewing this.

Yep I see how having a macro to perform rX =3D rX <> Y for arbitrary =
infix <> and operand
is unlikely to find much use outside of ZERO_GPRS. As I resubmit this =
patch series I
will rename it to ZERO_REGS or similar to be more explicitly coupled to =
ZERO_GPRS.

Something like this I was thinking:

.macro ZERO_REGS start, end
	.Lreg=3D\start
	.rept (\end - \start + 1)
	li	.Lreg, 0
	.Lreg=3D.Lreg+1
	.endr
.endm

Thanks,
Rohan=
