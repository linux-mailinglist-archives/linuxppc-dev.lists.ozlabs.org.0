Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCFE636A81
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 21:07:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHXH82Mdfz3dwc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 07:07:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rPUfYD3b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnac123@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rPUfYD3b;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHXGB6C7lz3bsK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 07:06:58 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ANHuIUW029273
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 20:06:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=5BFYfFu24jj3xoCOA+BAzTH7ttmXCrXa4lCCmCIV1j4=;
 b=rPUfYD3bHWfpzNug+Nu3w7BSPxNQxPMnJMgewpADEE36sCjcjZNj+O0Cr/ArBrjrqMdz
 I5jwMdoKyjdsKG+pPjxjofj/wFoIzL4tfbcF1qS1e2topQXXo5Tn21RXjn4Hq8Mse98m
 +2v7qq1fpQLdyB7flGSCEOGvsFhgppFu0ccoud3XfJ50uDANveWX+tnmr2K6TejlDiOv
 QwnN47KjmuedmZud1ZrqUZeO7nD2G+dToiRIqL3bUagJ1U6vWhLAG7mSt24PcjyhuJcn
 dplzSz8Vtlrsgzmc2pUAja1WgPtGXU98sOz1m+XgUfZn7dxq29X05d5rg66iOQBQOOBN DA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m10fg0f0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 20:06:55 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ANJqUiI025024
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 20:06:54 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m10fg0f01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Nov 2022 20:06:54 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ANK5jJV025363;
	Wed, 23 Nov 2022 20:06:54 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma03dal.us.ibm.com with ESMTP id 3kxpsam59t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Nov 2022 20:06:54 +0000
Received: from smtpav05.dal12v.mail.ibm.com ([9.208.128.132])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2ANK6o6l38601358
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Nov 2022 20:06:51 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 483615806B;
	Wed, 23 Nov 2022 20:06:52 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A174C58056;
	Wed, 23 Nov 2022 20:06:51 +0000 (GMT)
Received: from [9.160.73.107] (unknown [9.160.73.107])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 23 Nov 2022 20:06:51 +0000 (GMT)
Message-ID: <43451bb2-7ed9-e538-4334-2f4a462c7805@linux.ibm.com>
Date: Wed, 23 Nov 2022 14:06:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 10/13] powerpc/rtas: improve function information lookups
Content-Language: en-US
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
 <20221118150751.469393-11-nathanl@linux.ibm.com>
From: Nick Child <nnac123@linux.ibm.com>
In-Reply-To: <20221118150751.469393-11-nathanl@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Kj7s8GM7zDV-FfYM_IMy1vmcp3MgQsaF
X-Proofpoint-GUID: lB0tnKIPQwKiqt16AxdxV_7o7oS2QGQk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_11,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=819
 priorityscore=1501 spamscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211230149
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
Cc: tyreld@linux.ibm.com, ldufour@linux.ibm.com, ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/18/22 09:07, Nathan Lynch wrote:
> +static int __init rtas_token_to_function_xarray_init(void)
> +{
> +	int err = 0;
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(rtas_function_table); ++i) {
> +		const struct rtas_function *func = &rtas_function_table[i];
> +		const s32 token = func->token;
> +
> +		if (token == RTAS_UNKNOWN_SERVICE)
> +			continue;
> +
> +		err = xa_err(xa_store(&rtas_token_to_function_xarray,
> +				      token, (void *)func, GFP_KERNEL));
> +		if (err)
> +			break;
> +	}
> +
> +	return err;
> +}
> +arch_initcall(rtas_token_to_function_xarray_init);
> +
> +static const struct rtas_function *rtas_token_to_function(s32 token)
> +{
> +	const struct rtas_function *func;
> +
> +	if (WARN_ONCE(token < 0, "invalid token %d", token))
> +		return NULL;
> +
> +	func = xa_load(&rtas_token_to_function_xarray, (unsigned long)token);
> +
Why typecast token here and not in xa_store?


> +static void __init rtas_function_table_init(void)
> +{
> +	struct property *prop;
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(rtas_function_table); ++i) {
> +		struct rtas_function *curr = &rtas_function_table[i];
> +		struct rtas_function *prior;
> +		int cmp;
> +
> +		curr->token = RTAS_UNKNOWN_SERVICE;
> +
> +		if (i == 0)
> +			continue;
> +		/*
> +		 * Ensure table is sorted correctly for binary search
> +		 * on function names.
> +		 */
> +		prior = &rtas_function_table[i - 1];
> +
> +		cmp = strcmp(prior->name, curr->name);
> +		if (cmp < 0)
> +			continue;
> +
> +		if (cmp == 0) {
> +			pr_err("'%s' has duplicate function table entries\n",
> +			       curr->name);
> +		} else {
> +			pr_err("function table unsorted: '%s' wrongly precedes '%s'\n",
> +			       prior->name, curr->name);
> +		}
> +	}
Just a thought, would it be simpler to use sort()? you already have the
cmp_func implemented for bsearch().


As for the series as a whole:
I am no RTAS expert but was able to build, boot and mess around with new
tracepoints without errors:

Tested-by: Nick Child <nnac123@linux.ibm.com>
