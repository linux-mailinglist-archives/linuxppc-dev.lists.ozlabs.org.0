Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AD56A03B5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 09:20:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMmDF6dhDz3cTk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 19:20:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PAQn1XIr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PAQn1XIr;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMmCG1HwYz3cF8;
	Thu, 23 Feb 2023 19:19:21 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31N7CSBW027216;
	Thu, 23 Feb 2023 08:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=F44CrRAHyA8THCr2zJ1hTpjAcWo40RcN9EF49TCsI5Q=;
 b=PAQn1XIrC5tGiTrdYaRiNZsPTkdZ9rebnWQVKGbWwcNMviQ7Mgl0Ic7FCKIzoO3RDNgw
 jKKl/eJsU8GuvJi3DbLUEf0G8/EOMtQu2hOdW4OL+a4/31gJYH38qv0uVFvlmKLh2+fa
 BBj7dL7V/b6BtrbUoWfwRlNdSarFIqJAVqETh/xGogi/TmWOKMhB/RZCFd3cSL1Ta8oF
 6PR3iHZsVcto41Vcneau1siMcITsm5Rq7eoxq1G1YJmZ0FKB3OqCOdAg3nmwTOsn1Bf8
 FBso6PerW9R13iMCou9DbuYBYZJY/mxxTpX6rRJgRTo9nZfHTyr+/uiE/LSomZzOV4Xb ew== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nx3hvsfy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Feb 2023 08:19:12 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31MFZ4bY030154;
	Thu, 23 Feb 2023 08:19:10 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3ntpa64v9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Feb 2023 08:19:10 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31N8J6nN52953536
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Feb 2023 08:19:06 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9416B20040;
	Thu, 23 Feb 2023 08:19:06 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E0DF52004B;
	Thu, 23 Feb 2023 08:19:04 +0000 (GMT)
Received: from in.ibm.com (unknown [9.113.206.196])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 23 Feb 2023 08:19:04 +0000 (GMT)
Date: Thu, 23 Feb 2023 13:49:02 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V3 1/3] core/device: Add function to return child node
 using name at substring "@"
Message-ID: <20230223081902.pysisjgloflv22ip@in.ibm.com>
References: <20230216080859.19161-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216080859.19161-1-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dNFbGZA1y15nswFakNMo-lPnC7qtxhJx
X-Proofpoint-ORIG-GUID: dNFbGZA1y15nswFakNMo-lPnC7qtxhJx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_04,2023-02-22_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 suspectscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230069
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

On 2023-02-16 13:38:57 Thu, Athira Rajeev wrote:
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
[...]
> diff --git a/core/device.c b/core/device.c
> index 2de37c74..26562235 100644
> --- a/core/device.c
> +++ b/core/device.c
> @@ -395,6 +395,41 @@ struct dt_node *dt_find_by_name(struct dt_node *root, const char *name)
>  }
>  
>  
> +struct dt_node *dt_find_by_name_substr(struct dt_node *root, const char *name)
> +{
> +	struct dt_node *child, *match;
> +	char *node, *child_node = NULL;
> +

> +	node = malloc(strlen(name) + 1);
> +	if (!node)
> +		return NULL;
> +	memcpy(node, name, strlen(name));
> +	node[strlen(name)] = '\0';

You may want to use strdup() which does exactly what you trying to do:

	node = strdup(name);
	if (!node)
		return NULL;

> +	node = strtok(node, "@");
> +	list_for_each(&root->children, child, list) {

> +		child_node = malloc(strlen(child->name) + 1);
> +		if (!child_node)
> +			goto err;
> +		memcpy(child_node, child->name, strlen(child->name));
> +		child_node[strlen(child->name)] = '\0';

same here ^^^

Rest looks fine to me.

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thanks,
-Mahesh.
