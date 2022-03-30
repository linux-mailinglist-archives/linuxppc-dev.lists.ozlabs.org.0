Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 789BD4EC2F2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 14:04:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KT4qX2QBHz3c01
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 23:04:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JHfAUJIK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JHfAUJIK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KT4ps4xqkz2x9X
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 23:04:04 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22UAt893013724; 
 Wed, 30 Mar 2022 12:03:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=OkCoqZ6BIPyk/xzxxQzyg2jHI21gR0kdqBRPxmWZPyQ=;
 b=JHfAUJIK2Rx2Sa/sSrUe/2V9ARR8p2St656/ndOsBdjRKW0lg/h8ZH0t6YsvDbHzy8Pr
 ORrPZ5OGtyEE+AEFf7EB/La/SnB3NjFnZ0ESP8jMJikIgJAzQNgzNO9rdpHTg1kofrbT
 8i5fbKIhG9/ZNHCeF/aXjfzrf9MVseNLpZiDugAqA6S0TvmcSrpOdv627x//KBdAII3e
 3IVP1IOGGwfSlXAezkIs6kgYtyLGAhLcq9UJEARN+PiKBDwiy590wHYu9n88VB71bkn0
 B7V24dJquyrIMWVDghNr589e0tvKvLUsFrs3P63R1fTUUut8S8Gax/cHUATXl6xWH4Oh WA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f4nv91d4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:03:53 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22UBeQvR004189;
 Wed, 30 Mar 2022 12:03:53 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f4nv91d3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:03:53 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22UBxNHB002550;
 Wed, 30 Mar 2022 12:03:51 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3f3rs3kgau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:03:51 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22UC3mS331523080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 12:03:49 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA12A52063;
 Wed, 30 Mar 2022 12:03:48 +0000 (GMT)
Received: from localhost (unknown [9.43.30.177])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 6444B52057;
 Wed, 30 Mar 2022 12:03:48 +0000 (GMT)
Date: Wed, 30 Mar 2022 17:33:46 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] powerpc: Reject probes on instructions that can't be
 single stepped
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Murilo Opsfelder =?iso-8859-1?q?Ara=FAjo?= <mopsfelder@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
References: <cover.1648030681.git.naveen.n.rao@linux.vnet.ibm.com>
 <e81779aa105d67799742c3e3f59075dce9f05cfb.1648030681.git.naveen.n.rao@linux.vnet.ibm.com>
 <9b5ec756-a074-390a-0955-6d973eacac28@gmail.com>
 <8735j7gdpi.fsf@mpe.ellerman.id.au>
 <1648487815.ub2owcvzpb.naveen@linux.ibm.com>
 <0ce827d8-cd2b-b113-d645-a469d687d615@csgroup.eu>
In-Reply-To: <0ce827d8-cd2b-b113-d645-a469d687d615@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1648641741.ou8oiwfxd2.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: akAAe9zoe6YTTaqZkQD6gHsPSwe5Qd5F
X-Proofpoint-ORIG-GUID: SfddWhxEZuIyQ8U4DjPm-fC0iAyCGUEU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_04,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=862 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203300062
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 28/03/2022 =C3=A0 19:20, Naveen N. Rao a =C3=A9crit=C2=A0:
>> Michael Ellerman wrote:
>>> Murilo Opsfelder Ara=C3=BAjo <mopsfelder@gmail.com> writes:
>>>> On 3/23/22 08:51, Naveen N. Rao wrote:
>>>>> +static inline bool can_single_step(u32 inst)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 switch (inst >> 26) {
>>>>
>>>> Can't ppc_inst_primary_opcode() be used instead?
>>=20
>> I didn't want to add a dependency on inst.h. But I guess I can very well=
=20
>> move this out of the header into some .c file. I will see if I can make=20
>> that work.
>=20
> Maybe use get_op() from asm/disassemble.h ?
>=20
>>=20
>>>>> +=C2=A0=C2=A0=C2=A0 case 31:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch ((inst >> 1) & 0x3=
ff) {
>=20
> For that one you have get_xop() in asm/disassemble.h

Nice! I will use those.

>=20
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 4:=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /* tw */
>=20
> OP_31_XOP_TRAP
>=20
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn false;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 68:=C2=A0=C2=A0=C2=
=A0 /* td */
>=20
> OP_31_XOP_TRAP_64
>=20
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn false;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 146:=C2=A0=C2=A0=C2=
=A0 /* mtmsr */
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn false;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 178:=C2=A0=C2=A0=C2=
=A0 /* mtmsrd */
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn false;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>> +=C2=A0=C2=A0=C2=A0 return true;
>>>>> +}
>>>>> +
>>>>
>>>> Can't OP_* definitions from ppc-opcode.h be used for all of these=20
>>>> switch-case statements?
>>>
>>> Yes please. And add any that are missing.
>>=20
>> We only have OP_31 from the above list now. I'll add the rest.
>=20
> Isn't there also OP_TRAP and OP_TRAP_64 ?

Ah, the list clearly isn't sorted, and there are some duplicates=20
there :)


Thanks,
Naveen

