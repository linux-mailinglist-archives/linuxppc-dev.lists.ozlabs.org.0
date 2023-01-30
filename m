Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3DC6809D8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jan 2023 10:45:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P53Fj0LtGz3cMy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jan 2023 20:45:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PacjiWhY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PacjiWhY;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P53Dj61ncz3c41;
	Mon, 30 Jan 2023 20:44:37 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30U8CnAp027876;
	Mon, 30 Jan 2023 09:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=L8toFNlVKhroDEFVNr/lN31Tt+uZ3UnZRQAPuZPhFt8=;
 b=PacjiWhY5TLWwK7SPRTLg93Vw+3pojTw/0fYpPxFr6P9hfQbXfI5LjqOvzzJuPJaWAK7
 zh1ciG6wEOKStKo8W+cbbq/P93hUNuqAsj7vxDJd8aYXS6WSLx/PCRVX58IGC41qVbOx
 MFmLXJGsVJ2Z1lR3NWB+jjBR3pVo7AtyoCPJ/yEO1q/s13n5+OE0TrJfPq3Iq7antqwU
 pDloO+8wD7WoOu8437KpaJIaPzjr/ZrruhB64H2dgZOc1QTPPiKw12KsCYiv0ZrIzM5P
 2d56SRegb2qqU7VBLnpdcS+PIjppB9WxpdWx15YxissuIhdO015JOtgKq7sYLyCWmolB 1Q== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nea66a32m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jan 2023 09:44:29 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30U1mOfI001953;
	Mon, 30 Jan 2023 09:44:26 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3ncvt7hexy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jan 2023 09:44:26 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30U9iMqm43385118
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jan 2023 09:44:22 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CC03F20049;
	Mon, 30 Jan 2023 09:44:22 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 549F020043;
	Mon, 30 Jan 2023 09:44:21 +0000 (GMT)
Received: from in.ibm.com (unknown [9.109.248.226])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 30 Jan 2023 09:44:21 +0000 (GMT)
Date: Mon, 30 Jan 2023 15:14:14 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V2 1/3] core/device: Add function to return child node
 using name at substring "@"
Message-ID: <20230130094414.gh4m7yp22k2tuhyh@in.ibm.com>
References: <20230118054452.27242-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118054452.27242-1-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jiaY7DDeQGDGM4xI0Im89P3k6WvLqQ2O
X-Proofpoint-GUID: jiaY7DDeQGDGM4xI0Im89P3k6WvLqQ2O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_07,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 clxscore=1011 phishscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300091
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
Reply-To: mahesh@linux.ibm.com
Cc: maddy@linux.ibm.com, dan@danny.cz, kjain@linux.ibm.com, skiboot@lists.ozlabs.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-01-18 11:14:50 Wed, Athira Rajeev wrote:
> Add a function dt_find_by_name_substr() that returns the child node if
> it matches till first occurence at "@" of a given name, otherwise NULL.
> This is helpful for cases with node name like: "name@addr". In
> scenarios where nodes are added with "name@addr" format and if the
> value of "addr" is not known, that node can't be matched with node
> name or addr. Hence matching with substring as node name will return
> the expected result. Patch adds dt_find_by_name_substr() function
> and testcase for the same in core/test/run-device.c
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
> Changelog:
> v1 -> v2:
> - Addressed review comment from Dan to update
>   the utility funtion to search and compare
>   upto "@". Renamed it as dt_find_by_name_substr.
>   
>  core/device.c          | 18 ++++++++++++++++++
>  core/test/run-device.c | 11 +++++++++++
>  include/device.h       |  3 +++
>  3 files changed, 32 insertions(+)
> 
> diff --git a/core/device.c b/core/device.c
> index 2de37c74..df3a5775 100644
> --- a/core/device.c
> +++ b/core/device.c
> @@ -395,6 +395,24 @@ struct dt_node *dt_find_by_name(struct dt_node *root, const char *name)
>  }
>  
>  
> +struct dt_node *dt_find_by_name_substr(struct dt_node *root, const char *name)
> +{
> +	struct dt_node *child, *match;
> +	char *pos;
> +
> +	list_for_each(&root->children, child, list) {
> +		pos = strchr(child->name, '@');
> +		if (!strncmp(child->name, name, pos - child->name))

Shouldn't we care about string length of substring to be checked before
comparision ? The code assumes that it is always within the limit of
position of '@' in node name string. Hence, it returns a wrong node
whose name partially matches with substring passed.

e.g.
With following two nodes in deviec tree (as per your test):
/node@1
/node0_1@2

the substring 'node0', 'node0@' and 'node0_@' all matches with 'node@1' device
tree node.
Is this expected ?

Also, what do you expect dt_find_by_name_substr() to return for string
like 'node0' and 'node0_' ? NULL or node '/node0_1@2' ?

> +			return child;
> +
> +		match = dt_find_by_name_substr(child, name);
> +		if (match)
> +			return match;
> +	}
> +
> +	return NULL;
> +}
> +
>  struct dt_node *dt_new_check(struct dt_node *parent, const char *name)
>  {
>  	struct dt_node *node = dt_find_by_name(parent, name);
> diff --git a/core/test/run-device.c b/core/test/run-device.c
> index 4a12382b..0e463e58 100644
> --- a/core/test/run-device.c
> +++ b/core/test/run-device.c
> @@ -466,6 +466,17 @@ int main(void)
>  	new_prop_ph = dt_prop_get_u32(ut2, "something");
>  	assert(!(new_prop_ph == ev1_ph));
>  	dt_free(subtree);
> +
> +	/* Test dt_find_by_name_substr */
> +	root = dt_new_root("");
> +	addr1 = dt_new_addr(root, "node", 0x1);
> +	addr2 = dt_new_addr(root, "node0_1", 0x2);
> +	assert(dt_find_by_name(root, "node@1") == addr1);
> +	assert(dt_find_by_name(root, "node0_1@2") == addr2);
> +	assert(dt_find_by_name_substr(root, "node@1") == addr1);
> +	assert(dt_find_by_name_substr(root, "node0_1@2") == addr2);

Below additional tests are failing:

	assert(dt_find_by_name_substr(root, "node0@") == NULL);
	assert(dt_find_by_name_substr(root, "node0_@") == NULL);

Maybe we should add few more test checks for "node0" and "node0_" as well.

Thanks,
-Mahesh.
