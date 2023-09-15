Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCCF7A2544
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 20:02:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bC+ASHWq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnMTj3Gwqz3cVR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 04:02:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bC+ASHWq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnMSk2xRTz3cHd;
	Sat, 16 Sep 2023 04:01:25 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38FHbkXZ031905;
	Fri, 15 Sep 2023 18:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=wQa6ZMWboZEku+O7/YOBlURGt0Nj+vxj+qoZz9PtOQU=;
 b=bC+ASHWqxaisoYBQOVuZIZ+3wqXIL7QOwONV6PvurBWgdtHqD70sJx57iJzI5HTkcQel
 HFGHkE7VhJFDjVji7QGAsylFEaXc97I8WF6gLqooLj2Zv3UWzi9sGlFWjjw1+NNmBJ1m
 s/2uKoDbs1SCkRIdFsGbel5/PZqiKlRfI9lg6SLwzb3sxnRvLhOfCGSp3INnJao9oenb
 EPo7EZB5rJnoqZn+uJZhDLWmZSuuocFIHbgiMaQSX0tgiJsR8gnk0jSX3M7to/946spO
 0PpZiJjOov++rR59TSN2J8yrIHKqiLFm7jYeb8jnkUjJJZ5mp9qhFZaT2Iaox9axdpCF 9A== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t4tauapm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 18:01:15 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38FGx2mf023152;
	Fri, 15 Sep 2023 18:01:15 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t141pe494-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 18:01:15 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38FI1BCu62521846
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Sep 2023 18:01:12 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D412F2004B;
	Fri, 15 Sep 2023 18:01:11 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 235B420040;
	Fri, 15 Sep 2023 18:01:10 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.40.7])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 15 Sep 2023 18:01:09 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH 1/3] core/device: Add function to return child node using
 name at substring "@"
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <e51b68f9-1fee-4449-8b99-14bea76e9fc4@arbab-laptop>
Date: Fri, 15 Sep 2023 23:30:58 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <9AA708E0-051E-4AEA-AA1B-4FB4EC5D7377@linux.vnet.ibm.com>
References: <20230914163206.97811-1-atrajeev@linux.vnet.ibm.com>
 <e51b68f9-1fee-4449-8b99-14bea76e9fc4@arbab-laptop>
To: Reza Arbab <arbab@linux.ibm.com>
X-Mailer: Apple Mail (2.3731.700.6)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: C3j0vRFjBdcsglxv2AJKx1Ja4OfkRC9m
X-Proofpoint-GUID: C3j0vRFjBdcsglxv2AJKx1Ja4OfkRC9m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_14,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309150157
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, =?utf-8?Q?Dan_Hor=C3=A1k?= <dan@danny.cz>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, skiboot@lists.ozlabs.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 15-Sep-2023, at 8:00 PM, Reza Arbab <arbab@linux.ibm.com> wrote:
>=20
> Hi Athira,
>=20
> On Thu, Sep 14, 2023 at 10:02:04PM +0530, Athira Rajeev wrote:=20
>> +struct dt_node *dt_find_by_name_before_addr(struct dt_node *root, =
const char *name)
>> +{
>> + struct dt_node *child, *match;
>> + char *child_node =3D NULL;
>> +
>> + list_for_each(&root->children, child, list) {
>> + child_node =3D strdup(child->name);
>> + if (!child_node)
>> + goto err;
>> + child_node =3D strtok(child_node, "@");
>> + if (!strcmp(child_node, name)) {
>> + free(child_node);
>> + return child;
>> + }
>> +
>> + match =3D dt_find_by_name_before_addr(child, name);
>> + if (match)
>> + return match;
>=20
> When the function returns on this line, child_node is not freed.
>=20
>> + }
>> +
>> + free(child_node);
>> +err:
>> + return NULL;
>> +}
>=20
> I took at stab at moving free(child_node) inside the loop, and ended =
up with this:
>=20
> struct dt_node *dt_find_by_name_before_addr(struct dt_node *root, =
const char *name)
> {
> struct dt_node *child, *match =3D NULL;
> char *child_name =3D NULL;
>=20
> list_for_each(&root->children, child, list) {
> child_name =3D strdup(child->name);
> if (!child_name)
> return NULL;
>=20
> child_name =3D strtok(child_name, "@");
> if (!strcmp(child_name, name))
> match =3D child;
> else
> match =3D dt_find_by_name_before_addr(child, name);
>=20
> free(child_name);
> if (match)
> return match;
> }
>=20
> return NULL;
> }
>=20
> Does this seem okay to you? If you agree, no need to send another =
revision, I can just fixup during commit. Let me know.

Hi Reza,

Sure, Change looks good. Thanks for the change and fixup.

Thanks
Athira
>=20
>> diff --git a/core/test/run-device.c b/core/test/run-device.c
>> index 4a12382bb..fb7a7d2c0 100644
>> --- a/core/test/run-device.c
>> +++ b/core/test/run-device.c
>> @@ -466,6 +466,20 @@ int main(void)
>> new_prop_ph =3D dt_prop_get_u32(ut2, "something");
>> assert(!(new_prop_ph =3D=3D ev1_ph));
>> dt_free(subtree);
>> +
>> + /* Test dt_find_by_name_before_addr */
>> + root =3D dt_new_root("");
>> + addr1 =3D dt_new_addr(root, "node", 0x1);
>> + addr2 =3D dt_new_addr(root, "node0_1", 0x2);
>> + assert(dt_find_by_name(root, "node@1") =3D=3D addr1);
>> + assert(dt_find_by_name(root, "node0_1@2") =3D=3D addr2);
>> + assert(dt_find_by_name_before_addr(root, "node") =3D=3D addr1);
>> + assert(dt_find_by_name_before_addr(root, "node0_") =3D=3D NULL);
>=20
> This line appears twice. As above, can fix during commit, so no need =
for a new patch.
>=20
>> + assert(dt_find_by_name_before_addr(root, "node0_1") =3D=3D addr2);
>> + assert(dt_find_by_name_before_addr(root, "node0") =3D=3D NULL);
>> + assert(dt_find_by_name_before_addr(root, "node0_") =3D=3D NULL);
>> + dt_free(root);
>> +
>> return 0;
>> }
>>=20
>=20
> --=20
> Reza Arbab

