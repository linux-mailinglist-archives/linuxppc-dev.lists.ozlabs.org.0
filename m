Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F148F538D41
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 10:54:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LC5g30jlYz3bkR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 18:54:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cqea3HsC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cqea3HsC;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LC5fH6JYBz2yxj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 May 2022 18:53:27 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24V6c0dP016182;
	Tue, 31 May 2022 08:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=9rTE7JYTSB/m7HOICmBrMZ4gw1JXtUyaWqJrS25MAlo=;
 b=cqea3HsCkxd4lYvsT3lua2GyKOQpCZ77lgqyTWC+3RQ4mukP3hcLKDbNksYQH+79NFKy
 7mQ4raIM8mbUs0qN1xmvX+jcic3sWkX+0BqPV5tDHtkeTFTOgGv0EYFjcddXpPmCnarF
 +tAxQz8X18a6uFgXh9WO/4Z+eygZKCBfsaU+eyqNBlFsbIfwXdSOIzNTLfOC8onbICdp
 nYMdF3r7YXXsFwkH61nxhFxVxyE//IX4ckfO0A2c9J9cG7DVQlnb3WdF+cRD3rsTU+1g
 bOPdcMkPdbyEG+0q/Oh69bfrctf1Pv/rEXuKTRjvmKfiMPXxtNULBVXfF6B1oqqV3+Fr iA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gda8n5wq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 May 2022 08:53:23 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24V8q1Cn017636;
	Tue, 31 May 2022 08:53:21 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma03fra.de.ibm.com with ESMTP id 3gbc97tvu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 May 2022 08:53:21 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 24V8rJ0222806798
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 May 2022 08:53:19 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F45D11C050;
	Tue, 31 May 2022 08:53:19 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8FA8911C04C;
	Tue, 31 May 2022 08:53:18 +0000 (GMT)
Received: from [9.43.106.182] (unknown [9.43.106.182])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 31 May 2022 08:53:18 +0000 (GMT)
Message-ID: <407cd655-748e-a276-4c2b-d214a33f8981@linux.ibm.com>
Date: Tue, 31 May 2022 14:23:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] powerpc/perf: Give generic PMU a nice name
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220526063723.51471-1-joel@jms.id.au>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20220526063723.51471-1-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: huVGV73oUwtBHfIZuk7WDl9oAGL5tO4Y
X-Proofpoint-GUID: huVGV73oUwtBHfIZuk7WDl9oAGL5tO4Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-05-31_03,2022-05-30_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 clxscore=1011
 suspectscore=0 phishscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205310043
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 5/26/22 12:07 PM, Joel Stanley wrote:
> When booting on a machine that uses the compat pmu driver we see this:
>
>   [    0.071192] GENERIC_COMPAT performance monitor hardware support registered
Sorry that was my mistake.
I agree having it as ISAv3 is better.

Maddy

>
> Which is a bit shouty. Give it a nicer name.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>
> Other options:
>
>   - ISAv3 (because it is relevant for PowerISA 3.0B and beyond, see the
>     comment in init_generic_compat_pmu)
>
>   - Generic Compat (same, but less shouty)
>
>   arch/powerpc/perf/generic-compat-pmu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/perf/generic-compat-pmu.c b/arch/powerpc/perf/generic-compat-pmu.c
> index f3db88aee4dd..5be5a5ebaf42 100644
> --- a/arch/powerpc/perf/generic-compat-pmu.c
> +++ b/arch/powerpc/perf/generic-compat-pmu.c
> @@ -292,7 +292,7 @@ static int generic_compute_mmcr(u64 event[], int n_ev,
>   }
>   
>   static struct power_pmu generic_compat_pmu = {
> -	.name			= "GENERIC_COMPAT",
> +	.name			= "Architected",
>   	.n_counter		= MAX_PMU_COUNTERS,
>   	.add_fields		= ISA207_ADD_FIELDS,
>   	.test_adder		= ISA207_TEST_ADDER,
