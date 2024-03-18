Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A903887E7EE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 12:02:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZY7ZaWt4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TysPz3B2Lz3d2c
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 22:02:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZY7ZaWt4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TysPD4RRcz30fh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Mar 2024 22:01:52 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42IAB9eL017316;
	Mon, 18 Mar 2024 11:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=/q4alp9/KgiCZswwLWQ+nCGNVBrRtEC7/Ha6kIUNsB0=;
 b=ZY7ZaWt4acIz00bh1c3kZWiWyizxwYCK2uLkKX5S2yyyHxwLLqOyFFuvKZ1DtePnXD9E
 N0K/jjrF/FBtO8+/CmUXESKiGj+G7vS7i9H/2DqHwZEi0V6HwS/xzaIynX8T8dMsavDl
 HDKtJ7iASBXe2vJF9jIM2vPBt3uQtBh7qg4lfyDDh6ANl8uL+H4QR6hhQITjI41OjRjv
 7yKZFogWLnNXZMo8sTG21ictKBkOtcjrVrGHre7MN64iOdBDgRZZaLK4hAKCvTf2JfY+
 BQY3X8KzTFwoaIUkeUuJ6xsK63KzJYj7O+TKIcGt3IJpot+KylryuG9UWAVC4oLibw3t OQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wxjwws132-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 11:01:39 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42IAgkeo024444;
	Mon, 18 Mar 2024 11:01:39 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wxjwws12s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 11:01:39 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42I97PFu022248;
	Mon, 18 Mar 2024 11:01:37 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wwprnrcsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 11:01:37 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42IB1WDg30671512
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 Mar 2024 11:01:34 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 07B8D2004B;
	Mon, 18 Mar 2024 11:01:32 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 00CFF20043;
	Mon, 18 Mar 2024 11:01:30 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.215.91])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 18 Mar 2024 11:01:29 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH 1/3] tools/perf/arch/powerpc: Add load/store in powerpc
 annotate instructions for data type profling
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <821ddf3c-d383-4b79-a7cb-b67034f56f10@csgroup.eu>
Date: Mon, 18 Mar 2024 16:31:18 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <1568ED53-C2F0-4A30-A31B-93FCD2AA07E6@linux.vnet.ibm.com>
References: <20240309072513.9418-1-atrajeev@linux.vnet.ibm.com>
 <20240309072513.9418-2-atrajeev@linux.vnet.ibm.com>
 <821ddf3c-d383-4b79-a7cb-b67034f56f10@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3774.200.91.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KK0QraiwiqsHAHrPOvHGi6UfGRdENEDY
X-Proofpoint-GUID: OdfiCZo3WN399UWMPMl6VSUKPxtNq_tz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-18_02,2024-03-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2403140000
 definitions=main-2403180082
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
Cc: "irogers@google.com" <irogers@google.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "kjain@linux.ibm.com" <kjain@linux.ibm.com>, "adrian.hunter@intel.com" <adrian.hunter@intel.com>, "acme@kernel.org" <acme@kernel.org>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "jolsa@kernel.org" <jolsa@kernel.org>, "namhyung@kernel.org" <namhyung@kernel.org>, "disgoel@linux.vnet.ibm.com" <disgoel@linux.vnet.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 09-Mar-2024, at 3:18=E2=80=AFPM, Christophe Leroy =
<christophe.leroy@csgroup.eu> wrote:
>=20
>=20
>=20
> Le 09/03/2024 =C3=A0 08:25, Athira Rajeev a =C3=A9crit :
>> Add powerpc instruction nmemonic table to associate load/store
>> instructions with move_ops. mov_ops is used to identify mem_type
>> to associate instruction with data type and offset. Also initialize
>> and allocate arch specific fields for nr_instructions, instructions =
and
>> nr_instructions_allocate.
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>>  .../perf/arch/powerpc/annotate/instructions.c | 66 =
+++++++++++++++++++
>>  1 file changed, 66 insertions(+)
>>=20
>> diff --git a/tools/perf/arch/powerpc/annotate/instructions.c =
b/tools/perf/arch/powerpc/annotate/instructions.c
>> index a3f423c27cae..07af4442be38 100644
>> --- a/tools/perf/arch/powerpc/annotate/instructions.c
>> +++ b/tools/perf/arch/powerpc/annotate/instructions.c
>> @@ -1,6 +1,65 @@
>>  // SPDX-License-Identifier: GPL-2.0
>>  #include <linux/compiler.h>
>>=20
>> +/*
>> + * powerpc instruction nmemonic table to associate load/store =
instructions with
>> + * move_ops. mov_ops is used to identify mem_type to associate =
instruction with
>> + * data type and offset.
>> + */
>> +static struct ins powerpc__instructions[] =3D {
>> + { .name =3D "lbz", .ops =3D &mov_ops,  },
>> + { .name =3D "lbzx", .ops =3D &mov_ops,  },
>> + { .name =3D "lbzu", .ops =3D &mov_ops,  },
>> + { .name =3D "lbzux", .ops =3D &mov_ops,  },
>> + { .name =3D "lhz", .ops =3D &mov_ops,  },
>> + { .name =3D "lhzx", .ops =3D &mov_ops,  },
>> + { .name =3D "lhzu", .ops =3D &mov_ops,  },
>> + { .name =3D "lhzux", .ops =3D &mov_ops,  },
>> + { .name =3D "lha", .ops =3D &mov_ops,  },
>> + { .name =3D "lhax", .ops =3D &mov_ops,  },
>> + { .name =3D "lhau", .ops =3D &mov_ops,  },
>> + { .name =3D "lhaux", .ops =3D &mov_ops,  },
>> + { .name =3D "lwz", .ops =3D &mov_ops,  },
>> + { .name =3D "lwzx", .ops =3D &mov_ops,  },
>> + { .name =3D "lwzu", .ops =3D &mov_ops,  },
>> + { .name =3D "lwzux", .ops =3D &mov_ops,  },
>> + { .name =3D "lwa", .ops =3D &mov_ops,  },
>> + { .name =3D "lwax", .ops =3D &mov_ops,  },
>> + { .name =3D "lwaux", .ops =3D &mov_ops,  },
>> + { .name =3D "ld", .ops =3D &mov_ops,  },
>> + { .name =3D "ldx", .ops =3D &mov_ops,  },
>> + { .name =3D "ldu", .ops =3D &mov_ops,  },
>> + { .name =3D "ldux", .ops =3D &mov_ops,  },
>> + { .name =3D "stb", .ops =3D &mov_ops,  },
>> + { .name =3D "stbx", .ops =3D &mov_ops,  },
>> + { .name =3D "stbu", .ops =3D &mov_ops,  },
>> + { .name =3D "stbux", .ops =3D &mov_ops,  },
>> + { .name =3D "sth", .ops =3D &mov_ops,  },
>> + { .name =3D "sthx", .ops =3D &mov_ops,  },
>> + { .name =3D "sthu", .ops =3D &mov_ops,  },
>> + { .name =3D "sthux", .ops =3D &mov_ops,  },
>> + { .name =3D "stw", .ops =3D &mov_ops,  },
>> + { .name =3D "stwx", .ops =3D &mov_ops,  },
>> + { .name =3D "stwu", .ops =3D &mov_ops,  },
>> + { .name =3D "stwux", .ops =3D &mov_ops,  },
>> + { .name =3D "std", .ops =3D &mov_ops,  },
>> + { .name =3D "stdx", .ops =3D &mov_ops,  },
>> + { .name =3D "stdu", .ops =3D &mov_ops,  },
>> + { .name =3D "stdux", .ops =3D &mov_ops,  },
>> + { .name =3D "lhbrx", .ops =3D &mov_ops,  },
>> + { .name =3D "sthbrx", .ops =3D &mov_ops,  },
>> + { .name =3D "lwbrx", .ops =3D &mov_ops,  },
>> + { .name =3D "stwbrx", .ops =3D &mov_ops,  },
>> + { .name =3D "ldbrx", .ops =3D &mov_ops,  },
>> + { .name =3D "stdbrx", .ops =3D &mov_ops,  },
>> + { .name =3D "lmw", .ops =3D &mov_ops,  },
>> + { .name =3D "stmw", .ops =3D &mov_ops,  },
>> + { .name =3D "lswi", .ops =3D &mov_ops,  },
>> + { .name =3D "lswx", .ops =3D &mov_ops,  },
>> + { .name =3D "stswi", .ops =3D &mov_ops,  },
>> + { .name =3D "stswx", .ops =3D &mov_ops,  },
>> +};
>=20
> What about lwarx and stwcx ?
Yes, Will add those in next version

>=20
>> +
>>  static struct ins_ops *powerpc__associate_instruction_ops(struct =
arch *arch, const char *name)
>>  {
>>   int i;
>> @@ -52,6 +111,13 @@ static struct ins_ops =
*powerpc__associate_instruction_ops(struct arch *arch, con
>>  static int powerpc__annotate_init(struct arch *arch, char *cpuid =
__maybe_unused)
>>  {
>>   if (!arch->initialized) {
>> + arch->nr_instructions =3D ARRAY_SIZE(powerpc__instructions);
>> + arch->instructions =3D calloc(arch->nr_instructions, sizeof(struct =
ins));
>> + if (arch->instructions =3D=3D NULL)
>=20
> Prefered form is
>=20
> if (!arch->instructions)
Ok , will make this change

>=20
>> + return -ENOMEM;
>> +
>> + memcpy(arch->instructions, (struct ins *)powerpc__instructions, =
sizeof(struct ins) * arch->nr_instructions);
>=20
> No need to cast powerpc__instructions, it is already a pointer.
Yes, I will correct it


Thanks
Athira Rajeev
>=20
>=20
>> + arch->nr_instructions_allocated =3D arch->nr_instructions;
>>   arch->initialized =3D true;
>>   arch->associate_instruction_ops =3D =
powerpc__associate_instruction_ops;
>>   arch->objdump.comment_char      =3D '#';


