Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D06E765E5D0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 08:12:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nnd335FnWz3cC1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 18:12:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=morMxFMp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=morMxFMp;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nnd232l9Xz3bT8;
	Thu,  5 Jan 2023 18:11:54 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30571sHX003620;
	Thu, 5 Jan 2023 07:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=/IXBsygyI30M18p7Vnz4NRsCfLXmjqHYeLFvk9IAVsc=;
 b=morMxFMp/5/R0EzDQ9lJLkZuM1ltVE4VHjjAph9US3ZrPUhFIR7+xZIUbqA0L1pjMXEc
 P1jF8qt2WGuIYsnFdwBdQEujMlWjas1ksffZ68ARKKZhVw9LA+9i2KE7E6V8Ivvotl6f
 Zz52Kv1isJXzSPti0MYqnHoVkQkODt67PuyIjsnUTZkj//E0PfoEgcOom98gqZQNj+vJ
 T16sKQbk542qkTq7HmX2n7JPXAm9yfGocw6JkREvsWQkhyDoGDYquqhdF1cINzhoP6oS
 lkbjA+iwUe6y989qt+nS0I1wqu8VzNRNE0J9ygDSK/L8m0fyTxnUuk15rwKAlj6q9OAs eg== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mwst5g8fd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jan 2023 07:11:45 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 304F1xGu023379;
	Thu, 5 Jan 2023 07:11:43 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3mtcq6cnp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jan 2023 07:11:43 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3057Bd3s45941144
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Jan 2023 07:11:40 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D056B20049;
	Thu,  5 Jan 2023 07:11:39 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0FECD20043;
	Thu,  5 Jan 2023 07:11:38 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.38.189])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  5 Jan 2023 07:11:37 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [Skiboot] [PATCH 1/3] core/device: Add function to return child
 node using name and length
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <246510aa-76f6-f030-d89a-78ac45aef30c@linux.ibm.com>
Date: Thu, 5 Jan 2023 12:41:33 +0530
Message-Id: <90C3BC56-B51A-4FD7-8949-900E24EF34E8@linux.vnet.ibm.com>
References: <20230102151954.aae52c099e02ef3c4f22fd4e@danny.cz>
 <246510aa-76f6-f030-d89a-78ac45aef30c@linux.ibm.com>
To: =?utf-8?Q?Dan_Hor=C3=A1k?= <dan@danny.cz>, skiboot@lists.ozlabs.org
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rH7UPNe4BGNVyy9ddgjBwdnJPMHm5Tht
X-Proofpoint-ORIG-GUID: rH7UPNe4BGNVyy9ddgjBwdnJPMHm5Tht
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_02,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 phishscore=0
 mlxscore=0 clxscore=1011 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050058
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 05-Jan-2023, at 12:35 PM, Madhavan Srinivasan <maddy@linux.ibm.com> wr=
ote:
>=20
>=20
> On Mon,  2 Jan 2023 08:45:22 +0530
> Athira Rajeev <atrajeev@linux.vnet.ibm.com> wrote:
>=20
>> Add a function dt_find_by_name_len() that returns the child node if
>> it matches the first "n" characters of a given name, otherwise NULL.
>> This is helpful for cases with node name like: "name@addr". In
>> scenarios where nodes are added with "name@addr" format and if the
>> value of "addr" is not known, that node can't be matched with node
>> name or addr. Hence matching with substring as node name will return
>> the expected result. Patch adds dt_find_by_name_len() function
>> and testcase for the same in core/test/run-device.c
>=20
> wouldn't it be better to automatically compare the name up to the "@"
> character in the node name when searching for the match instead of
> having to hard-code the lengths? I think it should be good enough for
> the use case described above.
>=20
> something like
> ...
> pos =3D strchr(child->name, '@')
> if (!strncmp(child->name, name, pos - child->name))
>  ...
>=20
>=20
> 		Dan

Hi Dan,

Thanks for checking the patch.

Comparing upto "@" while searching for the match will restrict the string s=
earch only for patterns with "@".
By having dt_find_by_name_len which uses length, will be useful for generic=
 substring search for different patterns.
So prefered to use length instead of hardcoding character.

Please let us know your thoughts.

Thanks
Athira

>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> core/device.c          | 20 ++++++++++++++++++++
>> core/test/run-device.c | 11 +++++++++++
>> include/device.h       |  4 ++++
>> 3 files changed, 35 insertions(+)
>> diff --git a/core/device.c b/core/device.c
>> index 2de37c74..72c54e85 100644
>> --- a/core/device.c
>> +++ b/core/device.c
>> @@ -395,6 +395,26 @@ struct dt_node *dt_find_by_name(struct dt_node *roo=
t, const char *name)
>> }
>>  +struct dt_node *dt_find_by_name_len(struct dt_node *root,
>> +					const char *name, int len)
>> +{
>> +	struct dt_node *child, *match;
>> +
>> +	if (len <=3D 0)
>> +		return NULL;
>> +
>> +	list_for_each(&root->children, child, list) {
>> +		if (!strncmp(child->name, name, len))
>> +			return child;
>> +
>> +		match =3D dt_find_by_name_len(child, name, len);
>> +		if (match)
>> +			return match;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> struct dt_node *dt_new_check(struct dt_node *parent, const char *name)
>> {
>> 	struct dt_node *node =3D dt_find_by_name(parent, name);
>> diff --git a/core/test/run-device.c b/core/test/run-device.c
>> index 4a12382b..8c552103 100644
>> --- a/core/test/run-device.c
>> +++ b/core/test/run-device.c
>> @@ -466,6 +466,17 @@ int main(void)
>> 	new_prop_ph =3D dt_prop_get_u32(ut2, "something");
>> 	assert(!(new_prop_ph =3D=3D ev1_ph));
>> 	dt_free(subtree);
>> +
>> +	/* Test dt_find_by_name_len */
>> +	root =3D dt_new_root("");
>> +	addr1 =3D dt_new_addr(root, "node", 0x1);
>> +	addr2 =3D dt_new_addr(root, "node0_1", 0x2);
>> +	assert(dt_find_by_name(root, "node@1") =3D=3D addr1);
>> +	assert(dt_find_by_name(root, "node0_1@2") =3D=3D addr2);
>> +	assert(dt_find_by_name_len(root, "node@", 5) =3D=3D addr1);
>> +	assert(dt_find_by_name_len(root, "node0_1@", 8) =3D=3D addr2);
>> +	dt_free(root);
>> +
>> 	return 0;
>> }
>> diff --git a/include/device.h b/include/device.h
>> index 93fb90ff..f5e0fb79 100644
>> --- a/include/device.h
>> +++ b/include/device.h
>> @@ -184,6 +184,10 @@ struct dt_node *dt_find_by_path(struct dt_node *roo=
t, const char *path);
>> /* Find a child node by name */
>> struct dt_node *dt_find_by_name(struct dt_node *root, const char *name);
>> +/* Find a child node by name and len */
>> +struct dt_node *dt_find_by_name_len(struct dt_node *root,
>> +                                        const char *name, int len);
>> +
>> /* Find a node by phandle */
>> struct dt_node *dt_find_by_phandle(struct dt_node *root, u32 phandle);
>> --=20
>> 2.27.0
>> _______________________________________________
>> Skiboot mailing list
>> Skiboot@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/skiboot
> _______________________________________________
> Skiboot mailing list
> Skiboot@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/skiboot

