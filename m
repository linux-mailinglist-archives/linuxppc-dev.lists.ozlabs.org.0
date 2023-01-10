Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DA2663895
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 06:29:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrfWv5QMRz3cf5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 16:29:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RhiQ6rQL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RhiQ6rQL;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrfVw0C5zz3c7S;
	Tue, 10 Jan 2023 16:28:55 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30A36Vgj005579;
	Tue, 10 Jan 2023 05:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=PB0q92dovAtpRqF68vHlBw0MzpbYuOVMwInSnNQRAro=;
 b=RhiQ6rQLS5Bz736xq5UUZ2bwant08FilB4ImDRzGvU18do6EIViwpNM8PtBZumxP90VB
 2l1NSJbv3Jm8cZCdnrlzZogK3YgODwFO+bCbat//x/jLl40ZvmlvjxKPsDoE54jAtyqk
 v+Syjv5pnL9nQefkQoIo4Hmq5LTJyiWMahoSWcICxiopbTgCzkMHxW+HgM0wdeUE1SRJ
 Cclm0TjiBhQHu2H/3TQGDVnGue3nBVpJJemNPhPTWWFYJfKgPGfYL7s7aIkWBy0YkWbE
 f9LAvzcfU8POhz5v6deJIVs0tWNSE4LpwBy0e32hECWhunv006Uq7oY4tTHAahpl2aIx dg== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjgeba7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jan 2023 05:28:47 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 309NU0u5029839;
	Tue, 10 Jan 2023 05:28:45 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3my00fk0uk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jan 2023 05:28:44 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30A5SfSD41026018
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jan 2023 05:28:41 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C22820043;
	Tue, 10 Jan 2023 05:28:41 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9785720040;
	Tue, 10 Jan 2023 05:28:39 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.16.65])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 10 Jan 2023 05:28:39 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [Skiboot] [PATCH 1/3] core/device: Add function to return child
 node using name and length
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230109162930.13958ea565052acf4021feb8@danny.cz>
Date: Tue, 10 Jan 2023 10:58:37 +0530
Message-Id: <59E2C451-B6EE-4C35-9C34-6D06169A0191@linux.vnet.ibm.com>
References: <20230102151954.aae52c099e02ef3c4f22fd4e@danny.cz>
 <246510aa-76f6-f030-d89a-78ac45aef30c@linux.ibm.com>
 <90C3BC56-B51A-4FD7-8949-900E24EF34E8@linux.vnet.ibm.com>
 <20230109162930.13958ea565052acf4021feb8@danny.cz>
To: =?utf-8?Q?Dan_Hor=C3=A1k?= <dan@danny.cz>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: osBuVoPzDt6lf0YC5QWZ-0N6JzzvPPqT
X-Proofpoint-ORIG-GUID: osBuVoPzDt6lf0YC5QWZ-0N6JzzvPPqT
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_01,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301100031
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, skiboot@lists.ozlabs.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 09-Jan-2023, at 8:59 PM, Dan Hor=C3=A1k <dan@danny.cz> wrote:
>=20
> Hi Athira,
>=20
> On Thu, 5 Jan 2023 12:41:33 +0530
> Athira Rajeev <atrajeev@linux.vnet.ibm.com> wrote:
>=20
>>=20
>>=20
>>> On 05-Jan-2023, at 12:35 PM, Madhavan Srinivasan <maddy@linux.ibm.com> =
wrote:
>>>=20
>>>=20
>>> On Mon,  2 Jan 2023 08:45:22 +0530
>>> Athira Rajeev <atrajeev@linux.vnet.ibm.com> wrote:
>>>=20
>>>> Add a function dt_find_by_name_len() that returns the child node if
>>>> it matches the first "n" characters of a given name, otherwise NULL.
>>>> This is helpful for cases with node name like: "name@addr". In
>>>> scenarios where nodes are added with "name@addr" format and if the
>>>> value of "addr" is not known, that node can't be matched with node
>>>> name or addr. Hence matching with substring as node name will return
>>>> the expected result. Patch adds dt_find_by_name_len() function
>>>> and testcase for the same in core/test/run-device.c
>>>=20
>>> wouldn't it be better to automatically compare the name up to the "@"
>>> character in the node name when searching for the match instead of
>>> having to hard-code the lengths? I think it should be good enough for
>>> the use case described above.
>>>=20
>>> something like
>>> ...
>>> pos =3D strchr(child->name, '@')
>>> if (!strncmp(child->name, name, pos - child->name))
>>> ...
>>>=20
>>>=20
>>> 		Dan
>>=20
>> Hi Dan,
>>=20
>> Thanks for checking the patch.
>>=20
>> Comparing upto "@" while searching for the match will restrict the strin=
g search only for patterns with "@".
>> By having dt_find_by_name_len which uses length, will be useful for gene=
ric substring search for different patterns.
>> So prefered to use length instead of hardcoding character.
>>=20
>> Please let us know your thoughts.
>=20
> I understand the presented solution is a pretty generic one, but I think
> the question is whether the added complexity brings the benefits
> compared to the simpler "separator char" solution.
>=20
> And thinking even more about the generic "length" approach, it might
> bring some false positive hits. Imagine nodes abc@1, abcd@2 and you are
> looking for "abc". A search for (abc,3) will match also the "abcd"
> one. And if the search string will always contain the "@" character,
> then specifying the length is not required. And I believe the length
> parameter might be totally redundant, because it can be derived from
> the search string and the new function would be like
> "dt_find_by_name_substr()".
>=20
>=20
> 	With regards,
>=20
> 		Dan


Hi Dan,

Thanks for the response. Makes sense to have the new function as "dt_find_b=
y_name_substr" by comparing upto =E2=80=9C@".
I will rework on the changes and post a V2 for this.

Thanks
Athira

>=20
>> Thanks
>> Athira
>>=20
>>>=20
>>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>>> ---
>>>> core/device.c          | 20 ++++++++++++++++++++
>>>> core/test/run-device.c | 11 +++++++++++
>>>> include/device.h       |  4 ++++
>>>> 3 files changed, 35 insertions(+)
>>>> diff --git a/core/device.c b/core/device.c
>>>> index 2de37c74..72c54e85 100644
>>>> --- a/core/device.c
>>>> +++ b/core/device.c
>>>> @@ -395,6 +395,26 @@ struct dt_node *dt_find_by_name(struct dt_node *r=
oot, const char *name)
>>>> }
>>>> +struct dt_node *dt_find_by_name_len(struct dt_node *root,
>>>> +					const char *name, int len)
>>>> +{
>>>> +	struct dt_node *child, *match;
>>>> +
>>>> +	if (len <=3D 0)
>>>> +		return NULL;
>>>> +
>>>> +	list_for_each(&root->children, child, list) {
>>>> +		if (!strncmp(child->name, name, len))
>>>> +			return child;
>>>> +
>>>> +		match =3D dt_find_by_name_len(child, name, len);
>>>> +		if (match)
>>>> +			return match;
>>>> +	}
>>>> +
>>>> +	return NULL;
>>>> +}
>>>> +
>>>> struct dt_node *dt_new_check(struct dt_node *parent, const char *name)
>>>> {
>>>> 	struct dt_node *node =3D dt_find_by_name(parent, name);
>>>> diff --git a/core/test/run-device.c b/core/test/run-device.c
>>>> index 4a12382b..8c552103 100644
>>>> --- a/core/test/run-device.c
>>>> +++ b/core/test/run-device.c
>>>> @@ -466,6 +466,17 @@ int main(void)
>>>> 	new_prop_ph =3D dt_prop_get_u32(ut2, "something");
>>>> 	assert(!(new_prop_ph =3D=3D ev1_ph));
>>>> 	dt_free(subtree);
>>>> +
>>>> +	/* Test dt_find_by_name_len */
>>>> +	root =3D dt_new_root("");
>>>> +	addr1 =3D dt_new_addr(root, "node", 0x1);
>>>> +	addr2 =3D dt_new_addr(root, "node0_1", 0x2);
>>>> +	assert(dt_find_by_name(root, "node@1") =3D=3D addr1);
>>>> +	assert(dt_find_by_name(root, "node0_1@2") =3D=3D addr2);
>>>> +	assert(dt_find_by_name_len(root, "node@", 5) =3D=3D addr1);
>>>> +	assert(dt_find_by_name_len(root, "node0_1@", 8) =3D=3D addr2);
>>>> +	dt_free(root);
>>>> +
>>>> 	return 0;
>>>> }
>>>> diff --git a/include/device.h b/include/device.h
>>>> index 93fb90ff..f5e0fb79 100644
>>>> --- a/include/device.h
>>>> +++ b/include/device.h
>>>> @@ -184,6 +184,10 @@ struct dt_node *dt_find_by_path(struct dt_node *r=
oot, const char *path);
>>>> /* Find a child node by name */
>>>> struct dt_node *dt_find_by_name(struct dt_node *root, const char *name=
);
>>>> +/* Find a child node by name and len */
>>>> +struct dt_node *dt_find_by_name_len(struct dt_node *root,
>>>> +                                        const char *name, int len);
>>>> +
>>>> /* Find a node by phandle */
>>>> struct dt_node *dt_find_by_phandle(struct dt_node *root, u32 phandle);
>>>> --=20
>>>> 2.27.0
>>>> _______________________________________________
>>>> Skiboot mailing list
>>>> Skiboot@lists.ozlabs.org
>>>> https://lists.ozlabs.org/listinfo/skiboot
>>> _______________________________________________
>>> Skiboot mailing list
>>> Skiboot@lists.ozlabs.org
>>> https://lists.ozlabs.org/listinfo/skiboot

