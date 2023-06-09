Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3231728F4D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 07:34:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcqXQ3Mqyz3fPX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 15:34:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hk1dhKGh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hk1dhKGh;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcqWV1Ccrz3cB6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 15:33:57 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3594dph5022128;
	Fri, 9 Jun 2023 05:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=twk9iLRCFPkw78jHPWiJiwS3OaK0vL2hub2bEdxKtuU=;
 b=hk1dhKGhmxo0gE1q9Deh4XuJOCAqHAyK0uwNZvFdWEj2vIhp3mFZdUEDRx3D2cOLwWiB
 mV0Fq/sxXMwYoM7ZYSFOQ7IbOscV8/pciSwBY1KKsGXR3DgLHmHGVeGIOTh5nOgnJly6
 PJlOaR0V6xHXZL895zu0wKrWx3fCAU56UKPlFG+YVkj8YsWXoZztEG7+L93hsHF9Tkt3
 NTMnYRTOrEzESORJJC0J3trVM89o8d0GpIX8R1QGDZlq1y57n6OzbqWT0HosDN9SGZXA
 MwBnZVp1Tdj8bqaVUf4YLaoobvdXqftm2NbCgffRGXVSy2+o9x5ay/3kTlSI4I/rkjYy QA== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r3w55s4jy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jun 2023 05:33:51 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3595GHLN023505;
	Fri, 9 Jun 2023 05:33:49 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3r2a7a98g8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jun 2023 05:33:49 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3595XjP758851822
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Jun 2023 05:33:45 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4401E20043;
	Fri,  9 Jun 2023 05:33:45 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C44420040;
	Fri,  9 Jun 2023 05:33:44 +0000 (GMT)
Received: from in.ibm.com (unknown [9.113.207.32])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri,  9 Jun 2023 05:33:43 +0000 (GMT)
Date: Fri, 9 Jun 2023 11:03:41 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH] powerpc/fadump: invoke ibm,os-term with
 rtas_call_unlocked()
Message-ID: <riahmqyz32avudmqyoreffhtgeyz3ggisu7n5jrh2gvaqo6pxz@43watyra7uq2>
References: <20230609051846.132457-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609051846.132457-1-hbathini@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ogVgfF5BcWwPEVxg73jHWb8VipnZMc0S
X-Proofpoint-GUID: ogVgfF5BcWwPEVxg73jHWb8VipnZMc0S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_02,2023-06-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=876
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306090048
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-06-09 10:48:46 Fri, Hari Bathini wrote:
> Invoke ibm,os-term call with rtas_call_unlocked(), without using the
> RTAS spinlock, to avoid deadlock in the unlikely event of a machine
> crash while making an RTAS call.

Thanks for the patch. Minor comment bellow.

> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/kernel/rtas.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index c087eeee320f..f65b2a8cc0f1 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -1587,6 +1587,7 @@ static bool ibm_extended_os_term;
>  void rtas_os_term(char *str)
>  {
>  	s32 token = rtas_function_token(RTAS_FN_IBM_OS_TERM);
> +	static struct rtas_args args;
>  	int status;
>  
>  	/*
> @@ -1607,7 +1608,7 @@ void rtas_os_term(char *str)
>  	 * schedules.
>  	 */
>  	do {
> -		status = rtas_call(token, 1, 1, NULL, __pa(rtas_os_term_buf));
> +		status = rtas_call_unlocked(&args, token, 1, 1, NULL, __pa(rtas_os_term_buf));

rtas_call_unlocked() returns void. You may want to extract the status
from args->rets[0].

Thanks,
-Mahesh.

>  	} while (rtas_busy_delay_time(status));
>  
>  	if (status != 0)
> -- 
> 2.40.1
> 

-- 
Mahesh J Salgaonkar
