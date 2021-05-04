Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 583B5372A44
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 14:43:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZKJ52Dz4z2yyG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 22:43:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BbIw6gls;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BbIw6gls; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZKHd0XYGz2xbB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 22:42:36 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 144CYUDU034575
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 4 May 2021 08:42:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=bUfGlfO2TuTogqLdgHrVo7Syz+brNsBcbWpxUe/Re2A=;
 b=BbIw6glsh1GX6M559b8wTYly1Fbz1Bz6tjsI3hnT2TICNn6w0rgtIkOM4Ff2Oz32HyzQ
 onba3cWyMnTWimS6bjeyiSiXqgpEtqTSd2FBt0o3FmHmIMc+WFuYhsPGGxjQtoSgp6VO
 XDULJG+wwr1jchCC1p44lYjQiUM+G9H5RLnRUSXG1LLLBn903H4LKqqr+qDc+dx5kcXn
 BDAAO09ECxpW/93pM2BKEKTj7R7rdu7kqeuGbmTGWS/1evCBRXpdPWaKNnYbgV7I5MMZ
 gSz2xGTy1/4pLAHM/xPwoQGHwxsrvNOLS72DdFpdBdwlCx7QkvQ2Xmb0Vi6mC2eCMWs9 7w== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38b6408qby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 May 2021 08:42:33 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 144CSE9a031420
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 4 May 2021 12:42:32 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 388xm8h6x9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 May 2021 12:42:31 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 144Cg3g323003486
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 May 2021 12:42:03 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 207B411C058;
 Tue,  4 May 2021 12:42:29 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE14311C050;
 Tue,  4 May 2021 12:42:28 +0000 (GMT)
Received: from pomme.local (unknown [9.145.18.121])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  4 May 2021 12:42:28 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries/dlpar: use rtas_get_sensor()
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210504025329.1713878-1-nathanl@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <59402d92-38c1-bd73-a110-11a80f5e4c7c@linux.ibm.com>
Date: Tue, 4 May 2021 14:42:28 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210504025329.1713878-1-nathanl@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gK-CmntS2hvlSSRui2aX7N7-uv2hlgDF
X-Proofpoint-ORIG-GUID: gK-CmntS2hvlSSRui2aX7N7-uv2hlgDF
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_07:2021-05-04,
 2021-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105040093
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
Cc: tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 04/05/2021 à 04:53, Nathan Lynch a écrit :
> Instead of making bare calls to get-sensor-state, use
> rtas_get_sensor(), which correctly handles busy and extended delay
> statuses.

Reviewed-by: Laurent Dufour <ldufour@linux.ibm.com>

> Fixes: ab519a011caa ("powerpc/pseries: Kernel DLPAR Infrastructure")
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>   arch/powerpc/platforms/pseries/dlpar.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
> index 3ac70790ec7a..b1f01ac0c29e 100644
> --- a/arch/powerpc/platforms/pseries/dlpar.c
> +++ b/arch/powerpc/platforms/pseries/dlpar.c
> @@ -289,8 +289,7 @@ int dlpar_acquire_drc(u32 drc_index)
>   {
>   	int dr_status, rc;
>   
> -	rc = rtas_call(rtas_token("get-sensor-state"), 2, 2, &dr_status,
> -		       DR_ENTITY_SENSE, drc_index);
> +	rc = rtas_get_sensor(DR_ENTITY_SENSE, drc_index, &dr_status);
>   	if (rc || dr_status != DR_ENTITY_UNUSABLE)
>   		return -1;
>   
> @@ -311,8 +310,7 @@ int dlpar_release_drc(u32 drc_index)
>   {
>   	int dr_status, rc;
>   
> -	rc = rtas_call(rtas_token("get-sensor-state"), 2, 2, &dr_status,
> -		       DR_ENTITY_SENSE, drc_index);
> +	rc = rtas_get_sensor(DR_ENTITY_SENSE, drc_index, &dr_status);
>   	if (rc || dr_status != DR_ENTITY_PRESENT)
>   		return -1;
>   
> @@ -333,8 +331,7 @@ int dlpar_unisolate_drc(u32 drc_index)
>   {
>   	int dr_status, rc;
>   
> -	rc = rtas_call(rtas_token("get-sensor-state"), 2, 2, &dr_status,
> -				DR_ENTITY_SENSE, drc_index);
> +	rc = rtas_get_sensor(DR_ENTITY_SENSE, drc_index, &dr_status);
>   	if (rc || dr_status != DR_ENTITY_PRESENT)
>   		return -1;
>   
> 

