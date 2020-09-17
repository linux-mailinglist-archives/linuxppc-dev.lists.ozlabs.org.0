Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6749C26DC6A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 15:05:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bscdc6V0YzDqHg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 23:05:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=htmYArh4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BscYh6ZFSzDqKW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 23:02:00 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08HCVIoo116507; Thu, 17 Sep 2020 09:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=7izOH/a7i6cuA8oOFTV65aajQNYCNbHTfXt/VVWNKKI=;
 b=htmYArh45bawzyCloAmVNGXMsA8zCbjTX5yvh+pZMClD4jvdHMxCp+hAg5vcXe2K/ydW
 6N8PiM86Wr7oo/kcPqUL3j4+/e18yqquZT926yvyhbovrNOSVtQ8VVcHrsJoOyfRtscy
 +ksYO3QQlay9I28DG8XR8g88MmgNoCUaA4ESGakmkf2YvP9fO+D8ptF+Rx+II9V2vZBQ
 eIkXrE15pEcXYLG8gkQj0AfUZ48b/Ak6ACDKLqLndzQGUjtUsdENgJ8PMoPPK39tIHrZ
 7pxw5n2jDY93Ud91X0PKyJ8iFxqcp7DCuoU+XXfD6h7eGiVqpP0Qh3vTMPrwPLoxGMIw +g== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33m6ydttf5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 09:01:52 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08HClT4o005462;
 Thu, 17 Sep 2020 13:01:51 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 33k9ge9yn7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 13:01:50 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08HD1mrB21758298
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Sep 2020 13:01:48 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B02964203F;
 Thu, 17 Sep 2020 13:01:48 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91DFE42041;
 Thu, 17 Sep 2020 13:01:47 +0000 (GMT)
Received: from [9.85.83.146] (unknown [9.85.83.146])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 17 Sep 2020 13:01:47 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH] powerpc/perf: Exclude pmc5/6 from the irrelevant PMU
 group constraints
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <87wo0sob28.fsf@mpe.ellerman.id.au>
Date: Thu, 17 Sep 2020 18:31:45 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <A98CE746-BB8A-48DF-9F11-7BC42A3897B5@linux.vnet.ibm.com>
References: <1600257900-2043-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <87wo0sob28.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-17_08:2020-09-16,
 2020-09-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 bulkscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009170096
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 17-Sep-2020, at 5:43 PM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>=20
> Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
>> PMU counter support functions enforces event constraints for group of
>> events to check if all events in a group can be monitored. Incase of
>> event codes using PMC5 and PMC6 ( 500fa and 600f4 respectively ),
>> not all constraints are applicable, say the threshold or sample bits.
>> But current code includes pmc5 and pmc6 in some group constraints =
(like
>> IC_DC Qualifier bits) which is actually not applicable and hence =
results
>> in those events not getting counted when scheduled along with group =
of
>> other events. Patch fixes this by excluding PMC5/6 from constraints
>> which are not relevant for it.
>>=20
>> Fixes: 7ffd948 ('powerpc/perf: factor out power8 pmu functions')
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> arch/powerpc/perf/isa207-common.c | 4 ++++
>> 1 file changed, 4 insertions(+)
>>=20
>> diff --git a/arch/powerpc/perf/isa207-common.c =
b/arch/powerpc/perf/isa207-common.c
>> index 964437a..186fad8 100644
>> --- a/arch/powerpc/perf/isa207-common.c
>> +++ b/arch/powerpc/perf/isa207-common.c
>> @@ -288,6 +288,9 @@ int isa207_get_constraint(u64 event, unsigned =
long *maskp, unsigned long *valp)
>>=20
>> 		mask  |=3D CNST_PMC_MASK(pmc);
>> 		value |=3D CNST_PMC_VAL(pmc);
>> +
>> +		if (pmc >=3D 5)
>> +			goto ebb_bhrb;
>=20
> This is fairly subtle. Can you please put a block comment above the if
> explaining in a few lines what's going on.

Hi Michael,

Sure, I will include a comment explaining the change in V2.

Thanks
Athira
>=20
> cheers

