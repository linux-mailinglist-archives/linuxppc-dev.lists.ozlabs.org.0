Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B8554B5F5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 18:29:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMv5V5sLTz3cf5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 02:29:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=njmpRKKM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=njmpRKKM;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMv4l3gnnz305S
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 02:28:22 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25EGSJ3S014303;
	Tue, 14 Jun 2022 16:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=EHA1hEUxvXe/uTslOlpJbTg+SimmOwvnQX97fqVVgxY=;
 b=njmpRKKMZ3ou2IYwAdefyBN8s992JRjnWxJ+RvaN4w2I5nWgnc0DEXD+CSgkAWYL546b
 RuwYCngGWNYykJEidId5Gg+Z2vCYGRrZ92yVCHiIkZpeJKmx2Yv8Vc+CaiGlYWqqPgjT
 Xi0HuDYUgn5T6E4L13hW2RQXuDInR+zinVwxoQPBkBoJHNZCQx0RSz5ZAKoD+7aHFZaw
 tfZxdF+Tw17U4DWlJACI7GcxXqw4D9ciH9IrR/+CnFF6nll00qluaeCUMOJqsVfiS8EB
 ZKDftcy8IBHq2gRZ8T4kwgnKchO4LVps+9s0rHTCffCdqwQ2f+SxNbR70sKXPmhJ8uk2 Dw== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gppw36e7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jun 2022 16:28:19 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25EG5dnu012346;
	Tue, 14 Jun 2022 16:28:14 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma04dal.us.ibm.com with ESMTP id 3gmjpa2t92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jun 2022 16:28:14 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25EGSDb963832464
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jun 2022 16:28:13 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B4F5AC05B;
	Tue, 14 Jun 2022 16:28:13 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 288E5AC059;
	Tue, 14 Jun 2022 16:28:12 +0000 (GMT)
Received: from [9.160.59.133] (unknown [9.160.59.133])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
	Tue, 14 Jun 2022 16:28:12 +0000 (GMT)
Message-ID: <ffbb07bc-b4f7-d0ae-1b0b-3a2ea76cffd4@linux.ibm.com>
Date: Tue, 14 Jun 2022 09:28:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] powerpc/rtas: Allow ibm,platform-dump RTAS call with null
 buffer address
Content-Language: en-US
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20220614134952.156010-1-ajd@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
In-Reply-To: <20220614134952.156010-1-ajd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8FJ0UALKts09i3LjsUmmpp4jNLUZEXcN
X-Proofpoint-ORIG-GUID: 8FJ0UALKts09i3LjsUmmpp4jNLUZEXcN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_06,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 clxscore=1011 mlxscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206140062
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, stable@vger.kernel.org, Sathvika Vasireddy <sathvika@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/14/22 06:49, Andrew Donnellan wrote:
> Add a special case to block_rtas_call() to allow the ibm,platform-dump RTAS
> call through the RTAS filter if the buffer address is 0.
> 
> According to PAPR, ibm,platform-dump is called with a null buffer address
> to notify the platform firmware that processing of a particular dump is
> finished.
> 
> Without this, on a pseries machine with CONFIG_PPC_RTAS_FILTER enabled, an
> application such as rtas_errd that is attempting to retrieve a dump will
> encounter an error at the end of the retrieval process.
> 
> Fixes: bd59380c5ba4 ("powerpc/rtas: Restrict RTAS requests from userspace")
> Cc: stable@vger.kernel.org
> Reported-by: Sathvika Vasireddy <sathvika@linux.ibm.com>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

Similar to what is done for ibm,configure-connector with idx_buf2 and a NULL
address.

Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>

> ---
>  arch/powerpc/kernel/rtas.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index a6fce3106e02..693133972294 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -1071,7 +1071,7 @@ static struct rtas_filter rtas_filters[] __ro_after_init = {
>  	{ "get-time-of-day", -1, -1, -1, -1, -1 },
>  	{ "ibm,get-vpd", -1, 0, -1, 1, 2 },
>  	{ "ibm,lpar-perftools", -1, 2, 3, -1, -1 },
> -	{ "ibm,platform-dump", -1, 4, 5, -1, -1 },
> +	{ "ibm,platform-dump", -1, 4, 5, -1, -1 },		/* Special cased */
>  	{ "ibm,read-slot-reset-state", -1, -1, -1, -1, -1 },
>  	{ "ibm,scan-log-dump", -1, 0, 1, -1, -1 },
>  	{ "ibm,set-dynamic-indicator", -1, 2, -1, -1, -1 },
> @@ -1120,6 +1120,15 @@ static bool block_rtas_call(int token, int nargs,
>  				size = 1;
> 
>  			end = base + size - 1;
> +
> +			/*
> +			 * Special case for ibm,platform-dump - NULL buffer
> +			 * address is used to indicate end of dump processing
> +			 */
> +			if (!strcmp(f->name, "ibm,platform-dump") &&
> +			    base == 0)
> +				return false;
> +
>  			if (!in_rmo_buf(base, end))
>  				goto err;
>  		}

