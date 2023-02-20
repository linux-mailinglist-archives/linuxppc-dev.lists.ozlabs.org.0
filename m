Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D680569C4AC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 05:10:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKpqF58W7z3cDp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 15:10:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=poqdkkRc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=poqdkkRc;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKppF6H4cz3bZ4;
	Mon, 20 Feb 2023 15:09:25 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31K49GlT010470;
	Mon, 20 Feb 2023 04:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=krasAMtfilaGd+fnubuo12NT+ANR2xdNFjPoWAETVzw=;
 b=poqdkkRcJAkpyJ5G7/2dSAokYpvOTXHgsTH0KbdK/7TQ+ham8UWdPFvjnl90iFhYpi1c
 fyrbUv58Mz2SzN/Y4kqcDdVY+mZCenY/w/5pk402uJiBineloEYdkZNZiVm4tFNeqKx1
 GegW9qjslpGoKTcqXYPwKQeEIEPWzuqrvmtfEUoCK7H6KAMXMrnEDzLH0rAdqF0HiKEF
 W/QK+iPxHJPe9f+6vSNHL+C6o+eiB39e+65snGAB1rwFLAS+FdjNyEJkkRE5ufp+vLSc
 YKR+iGANT/BhbcKs0YHRojPiCpXjyNdTY27ZMmzr22rEm+9JstkakbbNxIteqSdnqFe4 IQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nuyk6a10b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Feb 2023 04:09:16 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31JJmugf006274;
	Mon, 20 Feb 2023 04:09:14 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3ntpa6a4fh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Feb 2023 04:09:14 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31K498il43123182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Feb 2023 04:09:08 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 28BF82005A;
	Mon, 20 Feb 2023 04:09:08 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA6282004E;
	Mon, 20 Feb 2023 04:09:05 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.116.15])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 20 Feb 2023 04:09:05 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [Skiboot] [PATCH V3 1/3] core/device: Add function to return
 child node using name at substring "@"
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230216080859.19161-1-atrajeev@linux.vnet.ibm.com>
Date: Mon, 20 Feb 2023 09:39:02 +0530
Message-Id: <3279A527-C3E8-4978-8BFD-D854EBC0F595@linux.vnet.ibm.com>
References: <20230216080859.19161-1-atrajeev@linux.vnet.ibm.com>
To: skiboot@lists.ozlabs.org, =?utf-8?Q?Dan_Hor=C3=A1k?= <dan@danny.cz>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MVMxUUcJCyyYYf_r3teoIJyV2Pj7OyEd
X-Proofpoint-ORIG-GUID: MVMxUUcJCyyYYf_r3teoIJyV2Pj7OyEd
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_01,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxscore=0 phishscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200037
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
Cc: Kajol Jain <kjain@linux.ibm.com>, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 16-Feb-2023, at 1:38 PM, Athira Rajeev <atrajeev@linux.vnet.ibm.com> w=
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
> ---
> Changelog:
> v2 -> v3:
> - After review comments from Mahesh, fixed the code
>  to consider string upto "@" for both input node name
>  as well as child node name. V2 version was comparing
>  input node name and child node name upto string length
>  of child name. But this will return wrong node if input
>  name is larger than child name. Because it will match
>  as substring for child name.
>  https://lists.ozlabs.org/pipermail/skiboot/2023-January/018596.html

Hi,

Looking for review comments for this V3 patch set. Please share your feedba=
ck.

Thanks
Athira

>=20
> v1 -> v2:
> - Addressed review comment from Dan to update
>  the utility funtion to search and compare
>  upto "@". Renamed it as dt_find_by_name_substr.
>=20
> core/device.c          | 35 +++++++++++++++++++++++++++++++++++
> core/test/run-device.c | 15 +++++++++++++++
> include/device.h       |  3 +++
> 3 files changed, 53 insertions(+)
>=20
> diff --git a/core/device.c b/core/device.c
> index 2de37c74..26562235 100644
> --- a/core/device.c
> +++ b/core/device.c
> @@ -395,6 +395,41 @@ struct dt_node *dt_find_by_name(struct dt_node *root=
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
> +	node =3D malloc(strlen(name) + 1);
> +	if (!node)
> +		return NULL;
> +	memcpy(node, name, strlen(name));
> +	node[strlen(name)] =3D '\0';
> +	node =3D strtok(node, "@");
> +	list_for_each(&root->children, child, list) {
> +		child_node =3D malloc(strlen(child->name) + 1);
> +		if (!child_node)
> +			goto err;
> +		memcpy(child_node, child->name, strlen(child->name));
> +		child_node[strlen(child->name)] =3D '\0';
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
> 2.27.0
>=20
> _______________________________________________
> Skiboot mailing list
> Skiboot@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/skiboot

