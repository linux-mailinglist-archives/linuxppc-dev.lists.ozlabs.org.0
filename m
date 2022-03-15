Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFBD4DA11D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 18:27:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJ0hq3ZZ7z3bSy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 04:27:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BhnnyKn2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BhnnyKn2; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJ0h73Lgzz2ywn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 04:26:46 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22FGEMSn029819
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 17:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=j9QlhKR1SK3HwvTI18z6CNy7lb2vekjOIBcCQu7fpic=;
 b=BhnnyKn22oRFvYZylaQT4pzVeUdtcKEUvop3uP0LSM4S8mTFWOA5UiPWqEutFosunfhj
 Q7kfNcEYnmn7yNbioICwOmO3l0C4gqXsivHp6x6EPge5M+gYXIMl4kjBl8p/qCQjJl1N
 65tXFtZ72EJDXorF0ej+98LyA91wHXknw0IZ0xLIZPVk/vNxSJ68GSxfeTRuwwjv3HHd
 MP7HoiQy2Hdcqe8up0p5wjg9DUEavVk8+79KJFmTrDkWusFvpvIJa39Ff4qxQ+tYze3k
 KCyQ/B1spslpTmcBZKu3iGZJmsHq6Y/JLYPFyQ+dmq8zr83/FAhRTZDoM8H3SMz63BWh LA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3etw7p3e8t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 17:26:44 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22FGEw3Y007435
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 17:26:43 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3etw7p3e8f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 17:26:43 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22FHCsqQ025482;
 Tue, 15 Mar 2022 17:26:42 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3et95wtff2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 17:26:42 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22FHQd2R49611054
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Mar 2022 17:26:39 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AFCCCAE051;
 Tue, 15 Mar 2022 17:26:39 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D381AE045;
 Tue, 15 Mar 2022 17:26:39 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 15 Mar 2022 17:26:39 +0000 (GMT)
Message-ID: <27c5a9a1-35f7-613a-f67f-70fa7e7d1b07@linux.ibm.com>
Date: Tue, 15 Mar 2022 18:26:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 14/14] powerpc/rtas: Consolidate and improve checking for
 rtas callers
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20220308135047.478297-1-npiggin@gmail.com>
 <20220308135047.478297-15-npiggin@gmail.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220308135047.478297-15-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: x3cN2-fZaDZ9tGmJ3dE0AbhLbpKr0gXJ
X-Proofpoint-GUID: 9D4G-31pVAZrLoa0KXZC1MX8ZGV3R2mM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-15_08,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 mlxlogscore=781 suspectscore=0
 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203150104
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08/03/2022, 14:50:47, Nicholas Piggin wrote:
> Add range checking from the rtas syscall, and other error checks
> and warnings to kernel callers, so problems can be found and
> fixed.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kernel/rtas.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index adf4892aeecd..7f8a3fd685f9 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -428,6 +428,23 @@ static int notrace va_raw_rtas_call(struct rtas_args *args, int token,
>  {
>  	int i;
>  
> +	if (!irqs_disabled()) {
> +		WARN_ON_ONCE(1);
> +		return -1;
> +	}
> +
> +	if (!rtas.entry || token == RTAS_UNKNOWN_SERVICE) {
> +		WARN_ON_ONCE(1);
> +		return -1;
> +	}
> +
> +	if (nargs >= ARRAY_SIZE(args->args)
> +	    || nret > ARRAY_SIZE(args->args)
> +	    || nargs + nret > ARRAY_SIZE(args->args)) {
> +		WARN_ON_ONCE(1);
> +		return -1;
> +	}

These 3 tests are making the function returning -1, which is previously
only returned in the case the call cannot be achieved because of a hardware
error (as stated in rtas_call()).

Should a dedicated error code been returned here?


> +
>  	args->token = cpu_to_be32(token);
>  	args->nargs = cpu_to_be32(nargs);
>  	args->nret  = cpu_to_be32(nret);
> @@ -476,9 +493,6 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
>  	char *buff_copy = NULL;
>  	int ret;
>  
> -	if (!rtas.entry || token == RTAS_UNKNOWN_SERVICE)
> -		return -1;
> -
>  	if ((mfmsr() & (MSR_IR|MSR_DR)) != (MSR_IR|MSR_DR)) {
>  		WARN_ON_ONCE(1);
>  		return -1;
> @@ -955,9 +969,6 @@ int rtas_call_reentrant(int token, int nargs, int nret, int *outputs, ...)
>  	unsigned long flags;
>  	int ret;
>  
> -	if (!rtas.entry || token == RTAS_UNKNOWN_SERVICE)
> -		return -1;
> -
>  	local_irq_save(flags);
>  	preempt_disable();
>  

