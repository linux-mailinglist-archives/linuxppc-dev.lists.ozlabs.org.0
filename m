Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF7F79A2BC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Sep 2023 07:16:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HDvp5/T/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RkZh34cYxz3bx0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Sep 2023 15:16:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HDvp5/T/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RkZg70Qpxz2yTc;
	Mon, 11 Sep 2023 15:15:46 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38B4mOO8028418;
	Mon, 11 Sep 2023 05:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=yxxC7ClKIcEnzNtK6gkO0HKnU6rZE21U2+mXal8TN0c=;
 b=HDvp5/T/PSheZkl55aK7xGfeZkA1atMH6xtw4TK5++dhtNydOJyVxUQLGBAfKC6H6Nq3
 AZs0yjzROBAD7wryuqZi1yLclmFHwMASQx9MfTuvetrH0ji5TNv9Pbfz8emYnkhuEgAl
 V4/9Fvw3pfwDfTWvpihuOirE8FjfIVibTZHaFcBuh49si3WTC7C+dwX5oisIrCYMmBPg
 gHQ4bMyrbLnxNJH3VSdCFbEsNmpmKi1pyLnEC5vLWItCqIUFMArzOqHX3IHWwbi83nRn
 IygJzL0L88WzfQQZ0oPjbZWgeJQK0FQ20lilpW2/zQ5dt49LW/KDRtoOk5vA3lkADJ+R iA== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t1sweb14v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 05:15:37 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38B4OjuV012069;
	Mon, 11 Sep 2023 05:15:37 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t13dy875u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 05:15:36 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38B5FXFT20578840
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Sep 2023 05:15:33 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A0E292004B;
	Mon, 11 Sep 2023 05:15:33 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08D7D20040;
	Mon, 11 Sep 2023 05:15:32 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.122.71])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 11 Sep 2023 05:15:31 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH V5 1/3] core/device: Add function to return child node
 using name at substring "@"
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <5e399ad8-f928-4992-9236-609b229798cc@arbab-laptop>
Date: Mon, 11 Sep 2023 10:45:20 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <19FA113D-D6FE-4539-80EA-E8B0A99BF418@linux.vnet.ibm.com>
References: <20230717032431.33778-1-atrajeev@linux.vnet.ibm.com>
 <5e399ad8-f928-4992-9236-609b229798cc@arbab-laptop>
To: Reza Arbab <arbab@linux.ibm.com>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8TA3w8g5hyIzac1JeGcGpXYHIQR1jC2A
X-Proofpoint-ORIG-GUID: 8TA3w8g5hyIzac1JeGcGpXYHIQR1jC2A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_02,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 spamscore=0 phishscore=0
 mlxscore=0 adultscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309110046
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
Cc: maddy@linux.ibm.com, =?utf-8?Q?Dan_Hor=C3=A1k?= <dan@danny.cz>, mahesh@linux.ibm.com, kjain@linux.ibm.com, skiboot@lists.ozlabs.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 10-Aug-2023, at 3:21 AM, Reza Arbab <arbab@linux.ibm.com> wrote:
>=20
> Hi Athira,
>=20
> I still have a couple of the same questions I asked in v4.
>=20
> On Mon, Jul 17, 2023 at 08:54:29AM +0530, Athira Rajeev wrote:
>> Add a function dt_find_by_name_before_addr() that returns the child =
node if
>> it matches till first occurrence at "@" of a given name, otherwise =
NULL.
>=20
> Given this summary, I don't userstand the following:
>=20
>> + assert(dt_find_by_name(root, "node@1") =3D=3D addr1);
>> + assert(dt_find_by_name(root, "node0_1@2") =3D=3D addr2);
>=20
> Is this behavior required? I don't think it makes sense to call this =
function with a second argument containing '@', so I wouldn't expect it =
to match anything in these cases. The function seems to specifically =
enable it:

Hi Reza,

Yes makes sense. dt_find_by_name can be removed in this test since its =
intention is to find device by name.
I will remove these two checks.

>=20
>> +struct dt_node *dt_find_by_name_before_addr(struct dt_node *root, =
const char *name)
>> +{
> [snip]
>> + node =3D strdup(name);
>> + if (!node)
>> + return NULL;
>> + node =3D strtok(node, "@");
>=20
> Seems like you could get rid of this and just use name as-is.

Ok Reza
>=20
> I was curious about something else; say we have 'node@1' and 'node@2'. =
 Is there an expectation of which it should match?
>=20
>    addr1 =3D dt_new_addr(root, "node", 0x1);
>    addr2 =3D dt_new_addr(root, "node", 0x2);
>    assert(dt_find_by_name_substr(root, "node") =3D=3D ???????);
>                                                   ^^^^^^^

In this case, dt_find_by_name_before_addr is not the right function to =
use.
We have other functions like dt_find_by_name_addr that can be made use =
of.

I will address other changes in next version

Thanks
Athira
>=20
> --=20
> Reza Arbab

