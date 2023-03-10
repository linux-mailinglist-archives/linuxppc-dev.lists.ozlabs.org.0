Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D366C6B367E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 07:21:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXwsq4frWz3f3Y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 17:21:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DKSxHjSM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DKSxHjSM;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXwrs008Bz3c3N;
	Fri, 10 Mar 2023 17:20:12 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32A4sV64010019;
	Fri, 10 Mar 2023 06:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=i8YyuCFFuLy419+lJ2o0mHCKd+UR5lUNWZeIC7mOvaM=;
 b=DKSxHjSM+lo15m3ZiFk/Ty0FMvuxb+mS/LI/pM4Ac3Nfl9L52O257inqG2Zb2S4k1GoR
 HmX+7BovS1SG6L800UaWiLTsOwcgoceOsT5pQdke1OArJwMsZ7yKKk91HzX2uB+tTYHo
 YHC4jhDK9apKHia1Q3PKgfZpRyu9UbPdWJ1QGMrkXbo6bG4Q21+cL5g9oytWF0HuAH0e
 T/oTqCp5MHLU4yEAfdR7ADkDcK7wu/zatMduxi3oCng2+5VpRiloMd+QOUo2M5XOHuY0
 UJv11KG4PBYjLSghbs61Nl3coaeF+S+lIQJLbJbvmIf4xE22nRUwBlrM9jJmdbypGzzZ DA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p7wxe9p59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Mar 2023 06:20:03 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 329DOQ52032275;
	Fri, 10 Mar 2023 06:20:01 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3p6g03aj3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Mar 2023 06:20:01 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32A6JwIf66126140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Mar 2023 06:19:58 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1DA5C20040;
	Fri, 10 Mar 2023 06:19:58 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A62342004B;
	Fri, 10 Mar 2023 06:19:56 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.93.216])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 10 Mar 2023 06:19:56 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH V4 1/3] core/device: Add function to return child node
 using name at substring "@"
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230306033913.80524-1-atrajeev@linux.vnet.ibm.com>
Date: Fri, 10 Mar 2023 11:49:54 +0530
Message-Id: <F346358C-F2BA-4124-9C1A-93EFF3BF5B98@linux.vnet.ibm.com>
References: <20230306033913.80524-1-atrajeev@linux.vnet.ibm.com>
To: skiboot@lists.ozlabs.org, =?utf-8?Q?Dan_Hor=C3=A1k?= <dan@danny.cz>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _bDmY3jWzQhojF7DIL-efxnML9Q2ZIda
X-Proofpoint-ORIG-GUID: _bDmY3jWzQhojF7DIL-efxnML9Q2ZIda
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-10_02,2023-03-09_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303100047
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
Cc: Kajol Jain <kjain@linux.ibm.com>, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 06-Mar-2023, at 9:09 AM, Athira Rajeev <atrajeev@linux.vnet.ibm.com> w=
rote:
>=20
> Add a function dt_find_by_name_substr() that returns the child node if
> it matches till first occurence at "@" of a given name, otherwise NULL.
> This is helpful for cases with node name like: "name@addr". In
> scenarios where nodes are added with "name@addr" format and if the
> value of "addr" is not known, that node can't be matched with node
> name or addr. Hence matching with substring as node name will return
> the expected result. Patch adds dt_find_by_name_substr() function
> and testcase for the same in core/test/run-device.c
>=20
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> ---
> Changelog:
> v3 -> v4:
> - Addressed review comment from Mahesh and added his Reviewed-by.
Hi,

Looking for review comments. Please share feedback.

Thanks
Athira
>=20
> v2 -> v3:
> - After review comments from Mahesh, fixed the code
>  to consider string upto "@" for both input node name
>  as well as child node name. V2 version was comparing
>  input node name and child node name upto string length
>  of child name. But this will return wrong node if input
>  name is larger than child name. Because it will match
>  as substring for child name.
>  https://lists.ozlabs.org/pipermail/skiboot/2023-January/018596.html
>=20
> v1 -> v2:
> - Addressed review comment from Dan to update
>  the utility funtion to search and compare
>  upto "@". Renamed it as dt_find_by_name_substr.
>=20
> core/device.c          | 31 +++++++++++++++++++++++++++++++
> core/test/run-device.c | 15 +++++++++++++++
> include/device.h       |  3 +++
> 3 files changed, 49 insertions(+)
>=20
> diff --git a/core/device.c b/core/device.c
> index b102dd97..6b457ec4 100644
> --- a/core/device.c
> +++ b/core/device.c
> @@ -395,6 +395,37 @@ struct dt_node *dt_find_by_name(struct dt_node *root=
, const char *name)
> }
>=20
>=20
> +struct dt_node *dt_find_by_name_substr(struct dt_node *root, const char =
*name)
> +{
> +	struct dt_node *child, *match;
> +	char *node, *child_node =3D NULL;
> +
> +	node =3D strdup(name);
> +	if (!node)
> +		return NULL;
> +	node =3D strtok(node, "@");
> +	list_for_each(&root->children, child, list) {
> +		child_node =3D strdup(child->name);
> +		if (!child_node)
> +			goto err;
> +		child_node =3D strtok(child_node, "@");
> +		if (!strcmp(child_node, node)) {
> +			free(child_node);
> +			free(node);
> +			return child;
> +		}
> +
> +		match =3D dt_find_by_name_substr(child, name);
> +		if (match)
> +			return match;
> +	}
> +
> +	free(child_node);
> +err:
> +	free(node);
> +	return NULL;
> +}
> +
> struct dt_node *dt_new_check(struct dt_node *parent, const char *name)
> {
> 	struct dt_node *node =3D dt_find_by_name(parent, name);
> diff --git a/core/test/run-device.c b/core/test/run-device.c
> index 4a12382b..6997452e 100644
> --- a/core/test/run-device.c
> +++ b/core/test/run-device.c
> @@ -466,6 +466,21 @@ int main(void)
> 	new_prop_ph =3D dt_prop_get_u32(ut2, "something");
> 	assert(!(new_prop_ph =3D=3D ev1_ph));
> 	dt_free(subtree);
> +
> +	/* Test dt_find_by_name_substr */
> +	root =3D dt_new_root("");
> +	addr1 =3D dt_new_addr(root, "node", 0x1);
> +	addr2 =3D dt_new_addr(root, "node0_1", 0x2);
> +	assert(dt_find_by_name(root, "node@1") =3D=3D addr1);
> +	assert(dt_find_by_name(root, "node0_1@2") =3D=3D addr2);
> +	assert(dt_find_by_name_substr(root, "node@1") =3D=3D addr1);
> +	assert(dt_find_by_name_substr(root, "node0_1@2") =3D=3D addr2);
> +	assert(dt_find_by_name_substr(root, "node0_") =3D=3D NULL);
> +	assert(dt_find_by_name_substr(root, "node0_1") =3D=3D addr2);
> +	assert(dt_find_by_name_substr(root, "node0@") =3D=3D NULL);
> +	assert(dt_find_by_name_substr(root, "node0_@") =3D=3D NULL);
> +	dt_free(root);
> +
> 	return 0;
> }
>=20
> diff --git a/include/device.h b/include/device.h
> index 93fb90ff..b6a1a813 100644
> --- a/include/device.h
> +++ b/include/device.h
> @@ -184,6 +184,9 @@ struct dt_node *dt_find_by_path(struct dt_node *root,=
 const char *path);
> /* Find a child node by name */
> struct dt_node *dt_find_by_name(struct dt_node *root, const char *name);
>=20
> +/* Find a child node by name and substring */
> +struct dt_node *dt_find_by_name_substr(struct dt_node *root, const char =
*name);
> +
> /* Find a node by phandle */
> struct dt_node *dt_find_by_phandle(struct dt_node *root, u32 phandle);
>=20
> --=20
> 2.31.1
>=20

