Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AF26805B9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jan 2023 06:48:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P4y0M1pW5z3cNX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jan 2023 16:48:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F+RZZW1r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F+RZZW1r;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P4xzM3VlTz3bZj;
	Mon, 30 Jan 2023 16:47:42 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30U2WVjW003926;
	Mon, 30 Jan 2023 05:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=tBVAq2qgPCdE9m7XQLrX7Lwz7Vq2ME529CA36Vh5n7s=;
 b=F+RZZW1rnrEEIFNR/irekrP+59vLHxalk1gAGVVvhlFH4udI1qdZabcJ3RF/ScNaBWx8
 l9nCfBKevCF850RPsgkErWztLEVnoZZz9GaEUOwcuckYGI/yUae1YNnZ6JPWJRD0Qur5
 8o0j6e/THUCK0aWSI0nmX/Cb92OVziZDrk+9bEVtyAF0Eq5jTygA//4tPhMkbuYTYtw1
 p4BMy/gIFkrxCWo1dhMJqd4V+LxAtycs9JaL4tLZH8Xd7GdpZBJH8wuSDz45npyIv8/Q
 8dXUJevDQBDzFhAQ/vD2w2YPI16WoR6sZumafFPaqBLkOwjDa99aFna2JkC2tOTwUMTA ug== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nddgsegjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jan 2023 05:47:34 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30U0UTAJ012041;
	Mon, 30 Jan 2023 05:47:32 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3ncvuqs9gt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jan 2023 05:47:32 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30U5lShB52298178
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jan 2023 05:47:28 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D085520115;
	Mon, 30 Jan 2023 05:47:28 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6AC592011B;
	Mon, 30 Jan 2023 05:47:27 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.124.30])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 30 Jan 2023 05:47:27 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [Skiboot] [PATCH V2 1/3] core/device: Add function to return
 child node using name at substring "@"
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230118054452.27242-1-atrajeev@linux.vnet.ibm.com>
Date: Mon, 30 Jan 2023 11:17:13 +0530
Message-Id: <E6D0DCE1-6728-4A03-8017-B767952458DA@linux.vnet.ibm.com>
References: <20230118054452.27242-1-atrajeev@linux.vnet.ibm.com>
To: skiboot@lists.ozlabs.org, =?utf-8?Q?Dan_Hor=C3=A1k?= <dan@danny.cz>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6boLVDeaHb9bVFkdoJgkmEWydehKWVw5
X-Proofpoint-GUID: 6boLVDeaHb9bVFkdoJgkmEWydehKWVw5
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_03,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300052
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
Cc: Kajol Jain <kjain@linux.ibm.com>, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 18-Jan-2023, at 11:14 AM, Athira Rajeev <atrajeev@linux.vnet.ibm.com> =
wrote:
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
> v1 -> v2:
> - Addressed review comment from Dan to update
>  the utility funtion to search and compare
>  upto "@". Renamed it as dt_find_by_name_substr.


Hi Dan,

Looking for review comments for this V2 patch set. Please share your feedba=
ck

Thanks
Athira
>=20
> core/device.c          | 18 ++++++++++++++++++
> core/test/run-device.c | 11 +++++++++++
> include/device.h       |  3 +++
> 3 files changed, 32 insertions(+)
>=20
> diff --git a/core/device.c b/core/device.c
> index 2de37c74..df3a5775 100644
> --- a/core/device.c
> +++ b/core/device.c
> @@ -395,6 +395,24 @@ struct dt_node *dt_find_by_name(struct dt_node *root=
, const char *name)
> }
>=20
>=20
> +struct dt_node *dt_find_by_name_substr(struct dt_node *root, const char =
*name)
> +{
> +	struct dt_node *child, *match;
> +	char *pos;
> +
> +	list_for_each(&root->children, child, list) {
> +		pos =3D strchr(child->name, '@');
> +		if (!strncmp(child->name, name, pos - child->name))
> +			return child;
> +
> +		match =3D dt_find_by_name_substr(child, name);
> +		if (match)
> +			return match;
> +	}
> +
> +	return NULL;
> +}
> +
> struct dt_node *dt_new_check(struct dt_node *parent, const char *name)
> {
> 	struct dt_node *node =3D dt_find_by_name(parent, name);
> diff --git a/core/test/run-device.c b/core/test/run-device.c
> index 4a12382b..0e463e58 100644
> --- a/core/test/run-device.c
> +++ b/core/test/run-device.c
> @@ -466,6 +466,17 @@ int main(void)
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

