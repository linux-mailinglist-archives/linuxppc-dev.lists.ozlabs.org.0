Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5FC688520
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 18:12:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P75283CzDz3f5t
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 04:12:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Pa8sq1MY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Pa8sq1MY;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P75191z7tz3cBj;
	Fri,  3 Feb 2023 04:11:40 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 312GgZ1H016134;
	Thu, 2 Feb 2023 17:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=VuKb/XOhVJUCamjLqsg0USuCjacV1hc41l+pThyprB0=;
 b=Pa8sq1MY+rZSK0ORGrXmd276+Qw3P31j/HXv+JAUAjbuQ1hImyZ7ilcrAJ54AjLqkZRX
 Ysw8bNBseUTdNTcvqx8uNblVtkp7FWtMdbPoB3O8Z5oWNMgPGC1ndMpcQsW+lEirZth2
 plgHh9VJZ1ZKZKdb966qqoiebrdFbJoxaqzSDlZIvWgBhB9T6bwvca25FQU78WOOj6q4
 zXjpAa21whFmVOHiFiO/Obtjq2wpBwYyUt9+tlB/GTumVOBGJsepCJBzBeoeo1po9MbF
 Mw0Ggvh636KEtEAL7FT1Yb/SAXoOzN82YUcD2yk44n07lDn0qJwpeS5jyWLwg1tFNy6f oQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ngesvvdsd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 17:11:32 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 312Dgr0s014953;
	Thu, 2 Feb 2023 17:06:31 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3ncvttxefv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 17:06:31 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 312H6RsL39256348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Feb 2023 17:06:27 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 828DD2004B;
	Thu,  2 Feb 2023 17:06:27 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EEE4820043;
	Thu,  2 Feb 2023 17:06:24 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.31.29])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  2 Feb 2023 17:06:24 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH V2 1/3] core/device: Add function to return child node
 using name at substring "@"
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230130094414.gh4m7yp22k2tuhyh@in.ibm.com>
Date: Thu, 2 Feb 2023 22:36:22 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <1BD49F0E-FDA7-4F96-B1CE-C525E5B7B8B8@linux.vnet.ibm.com>
References: <20230118054452.27242-1-atrajeev@linux.vnet.ibm.com>
 <20230130094414.gh4m7yp22k2tuhyh@in.ibm.com>
To: mahesh@linux.ibm.com
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AG9HOGwPLy-PUYPP-NyAv64M07JKNM2a
X-Proofpoint-ORIG-GUID: AG9HOGwPLy-PUYPP-NyAv64M07JKNM2a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_10,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302020148
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, =?utf-8?Q?Dan_Hor=C3=A1k?= <dan@danny.cz>, Kajol Jain <kjain@linux.ibm.com>, skiboot@lists.ozlabs.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 30-Jan-2023, at 3:14 PM, Mahesh J Salgaonkar <mahesh@linux.ibm.com> =
wrote:
>=20
> On 2023-01-18 11:14:50 Wed, Athira Rajeev wrote:
>> Add a function dt_find_by_name_substr() that returns the child node =
if
>> it matches till first occurence at "@" of a given name, otherwise =
NULL.
>> This is helpful for cases with node name like: "name@addr". In
>> scenarios where nodes are added with "name@addr" format and if the
>> value of "addr" is not known, that node can't be matched with node
>> name or addr. Hence matching with substring as node name will return
>> the expected result. Patch adds dt_find_by_name_substr() function
>> and testcase for the same in core/test/run-device.c
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> Changelog:
>> v1 -> v2:
>> - Addressed review comment from Dan to update
>>  the utility funtion to search and compare
>>  upto "@". Renamed it as dt_find_by_name_substr.
>>=20
>> core/device.c          | 18 ++++++++++++++++++
>> core/test/run-device.c | 11 +++++++++++
>> include/device.h       |  3 +++
>> 3 files changed, 32 insertions(+)
>>=20
>> diff --git a/core/device.c b/core/device.c
>> index 2de37c74..df3a5775 100644
>> --- a/core/device.c
>> +++ b/core/device.c
>> @@ -395,6 +395,24 @@ struct dt_node *dt_find_by_name(struct dt_node =
*root, const char *name)
>> }
>>=20
>>=20
>> +struct dt_node *dt_find_by_name_substr(struct dt_node *root, const =
char *name)
>> +{
>> +	struct dt_node *child, *match;
>> +	char *pos;
>> +
>> +	list_for_each(&root->children, child, list) {
>> +		pos =3D strchr(child->name, '@');
>> +		if (!strncmp(child->name, name, pos - child->name))
>=20
> Shouldn't we care about string length of substring to be checked =
before
> comparision ? The code assumes that it is always within the limit of
> position of '@' in node name string. Hence, it returns a wrong node
> whose name partially matches with substring passed.
>=20
> e.g.
> With following two nodes in deviec tree (as per your test):
> /node@1
> /node0_1@2
>=20
> the substring 'node0', 'node0@' and 'node0_@' all matches with =
'node@1' device
> tree node.
> Is this expected ?

Hi Mahesh,

Thanks for reviewing and pointing out.
As you pointed, currently it also returns if name partially matches with =
substring which is not expected.
I willer-work on changes and post a V3

>=20
> Also, what do you expect dt_find_by_name_substr() to return for string
> like 'node0' and 'node0_' ? NULL or node '/node0_1@2' ?
>=20
>> +			return child;
>> +
>> +		match =3D dt_find_by_name_substr(child, name);
>> +		if (match)
>> +			return match;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> struct dt_node *dt_new_check(struct dt_node *parent, const char =
*name)
>> {
>> 	struct dt_node *node =3D dt_find_by_name(parent, name);
>> diff --git a/core/test/run-device.c b/core/test/run-device.c
>> index 4a12382b..0e463e58 100644
>> --- a/core/test/run-device.c
>> +++ b/core/test/run-device.c
>> @@ -466,6 +466,17 @@ int main(void)
>> 	new_prop_ph =3D dt_prop_get_u32(ut2, "something");
>> 	assert(!(new_prop_ph =3D=3D ev1_ph));
>> 	dt_free(subtree);
>> +
>> +	/* Test dt_find_by_name_substr */
>> +	root =3D dt_new_root("");
>> +	addr1 =3D dt_new_addr(root, "node", 0x1);
>> +	addr2 =3D dt_new_addr(root, "node0_1", 0x2);
>> +	assert(dt_find_by_name(root, "node@1") =3D=3D addr1);
>> +	assert(dt_find_by_name(root, "node0_1@2") =3D=3D addr2);
>> +	assert(dt_find_by_name_substr(root, "node@1") =3D=3D addr1);
>> +	assert(dt_find_by_name_substr(root, "node0_1@2") =3D=3D addr2);
>=20
> Below additional tests are failing:
>=20
> 	assert(dt_find_by_name_substr(root, "node0@") =3D=3D NULL);
> 	assert(dt_find_by_name_substr(root, "node0_@") =3D=3D NULL);
>=20
> Maybe we should add few more test checks for "node0" and "node0_" as =
well.

Sure, I will fix this in V3

Thanks
Athira=20
>=20
> Thanks,
> -Mahesh.

