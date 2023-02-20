Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4AE69C5C8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 08:06:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKtkR329gz3cGR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 18:06:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sHYYwOkS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sHYYwOkS;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKtjR3CsBz3bT1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 18:05:31 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31K6DJdX011792;
	Mon, 20 Feb 2023 07:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=VYRK02M8+UOTYkNRucj4LpDEGZGJqsNeidjeVxlb0wo=;
 b=sHYYwOkSrO3tyY3U1gC3S08gESfMdlC70kviEWecc4dafOaK+QJVo+m1MLxeBE+Ka5gs
 D+KnwTAh7J6s3A7GgSMYfypiD4RQQqUEjt+3gF51dVz2w293NmIIISWdk0DpYyRYDbAe
 atR0AwGOANIx5Kg3Q2ybQAIazNtO0DAmeBhybXKcei+0wkytNPkwJuUyyBgQ5AlMWSvX
 QhH46DOd5PV/r4vQOKnesag3H6cNYMhzD42c3EgSwGIsgNqhPinkjv69ZnwiorUdkPEO
 l/Hm/jN1s1CAz6YQVobDN2feuc96VFN5bkIsP//CYPdUHzK+VZhKVlBhOmHvKsmNgb2M LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nv1ukb116-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Feb 2023 07:05:23 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31K6oiWn017242;
	Mon, 20 Feb 2023 07:05:23 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nv1ukb10a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Feb 2023 07:05:22 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31JJBvnV004300;
	Mon, 20 Feb 2023 07:05:21 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3ntpa6aa4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Feb 2023 07:05:20 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31K75FjH24904026
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Feb 2023 07:05:15 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDB612004F;
	Mon, 20 Feb 2023 07:05:14 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B0702004D;
	Mon, 20 Feb 2023 07:05:11 +0000 (GMT)
Received: from [9.43.104.140] (unknown [9.43.104.140])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 20 Feb 2023 07:05:10 +0000 (GMT)
Message-ID: <2fa8dd2a-1650-4adc-de2b-0f14dca683ed@linux.ibm.com>
Date: Mon, 20 Feb 2023 12:35:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] arch/powerpc/kvm: kvmppc_hv_entry: remove .global
 scope
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>
References: <20230220052355.109033-1-kconsul@linux.vnet.ibm.com>
 <20230220052355.109033-2-kconsul@linux.vnet.ibm.com>
Content-Language: en-US
From: Sathvika Vasireddy <sv@linux.ibm.com>
In-Reply-To: <20230220052355.109033-2-kconsul@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Cwd8NO1OLdnTNi1mF_vUHAj1GcEaxZdu
X-Proofpoint-ORIG-GUID: Aw9IZiJVPuGigaHb28rp9aV6l__uls1T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_04,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200062
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org, Sathvika Vasireddy <sv@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Kautuk,

On 20/02/23 10:53, Kautuk Consul wrote:
> kvmppc_hv_entry isn't called from anywhere other than
> book3s_hv_rmhandlers.S itself. Removing .global scope for
> this function.
>
> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> ---
>   arch/powerpc/kvm/book3s_hv_rmhandlers.S | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> index acf80915f406..7e063fde7adc 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -502,7 +502,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
>    *                                                                            *
>    *****************************************************************************/
>   
> -.global kvmppc_hv_entry
>   kvmppc_hv_entry:
>   
>   	/* Required state:
I see the following objtool warning with this patch applied.
arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0x48: 
unannotated intra-function call

Annotating kvmppc_hv_entry symbol with SYM_FUNC_START_LOCAL and 
SYM_FUNC_END macros should help fix this warning.

Thanks,
Sathvika


